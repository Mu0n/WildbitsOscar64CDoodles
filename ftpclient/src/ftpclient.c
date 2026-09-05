/* =====================================================================
 * ftpclient.c -- simple text-mode FTP client for the Wild Bits F256K2
 *                over its onboard WizFi360 wifi module, built with
 *                oscar64 + f256lib.
 *
 *
 * HARDWARE / FIRMWARE ASSUMPTIONS (carried over from the aborted
 * project this is based on):
 *
 *   WIFI_CTRL  0xDD80  bit0: uart speed (0=115200 1=921600)
 *                      bit3: write 1 to reset tx/rx FIFOs
 *                      read: {4'b0, ctrl[3], TxEmpty, RxEmpty, ctrl[0]}
 *   WIFI_DATA  0xDD81  write = push one byte to TX FIFO (-> module)
 *                      read  = pop one byte from RX FIFO (<- module)
 *   WIFI_RX_F  0xDD82  16-bit (2 regs) RX FIFO fill count
 *   WIFI_TX_F  0xDD84  16-bit (2 regs) TX FIFO fill count
 *
 * The WizFi360 speaks Espressif-style AT commands. This client talks
 * to it in "multi-connection" mode (AT+CIPMUX=1) and opens two TCP
 * links: link 0 is the FTP control connection, link 1 is the PASV
 * data connection. Any bytes the module has actually received on a
 * socket come back wrapped as:
 *
 *     +IPD,<link>,<len>:<len raw bytes>
 *
 * while plain firmware status text ("OK", "ERROR", "SEND OK",
 * "n,CONNECT", "n,CLOSED", "WIFI GOT IP" ...) arrives as ordinary
 * CRLF-terminated lines, NOT wrapped in +IPD. wiz_rx_byte() below is
 * a small state machine that demultiplexes the two.
 *
 * CAVEATS / THINGS YOU WILL LIKELY NEED TO TUNE:
 *   - The TX FIFO backpressure threshold in uart_putc() is a guess
 *     (the 11-bit counters in the Verilog snippet imply a FIFO no
 *     deeper than 2047 bytes); tighten it if you see overruns.
 *   - File I/O uses plain stdio fopen/fread/fwrite/fclose against
 *     the SD card. If your f256lib build exposes a different file
 *     API, swap the calls in ftp_retr()/ftp_stor() only -- nothing
 *     else in the file touches local storage.
 *   - This is a "simple" client on purpose: one FTP session at a
 *     time, no resume, no MDTM/SIZE, no NLST parsing (LIST output
 *     is just streamed to the screen as text).
 *   - If a big RETR still comes back short, the WizFi360's own
 *     internal per-link receive buffer (independent of the F256
 *     hardware FIFO) may be overflowing because the far side (TCP/
 *     WiFi) is faster than the 115200 baud link to the host. There
 *     is no application-level fix for that from our side beyond
 *     draining as fast as possible, which this version now does.
 * =================================================================== */


/*
high memory usage
0x10000: palette of 0x400 size
0x10400: 32x32 sprite of 0x400 size
0x20000: backup text matrix for help modal dialog reserved size 0x800
0x20800: backup text color matrix, same deal, size 0x800
0x30000: temporary storage for local directory for muFilePicker.h, estimated size 0x5F5A
0x6c000: default bitmap layer 0 used for pane contour lines size 0x12C000

*/


#include "f256lib.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "mySprites.h"
#include "myBitmap.h"
#include "textareas.h"
#include "mouseAreas.h"
#include "muFilePicker.h"

/* ---- Version ---- */
#define VERSIONBIG "0"
#define VERSIONSML "7"
#define VERSIONMON "Aug"
#define VERSIONYR  "2026"

/* ---- Screen areas ----------------------------------------------- */


/* ---- WizFi360 hardware registers -------------------------------- */
#define WIFI_CTRL      0xDD80
#define WIFI_DATA      0xDD81
#define WIFI_RX_F      0xDD82
#define WIFI_TX_F      0xDD84

/* ---- PS/2 Mouse ------------------------------------------------- */
#define PS2_M_MODE_EN 0xD6E0
#define PS2_M_X_LO    0xD6E2
#define PS2_M_X_HI    0xD6E3
#define PS2_M_Y_LO    0xD6E4
#define PS2_M_Y_HI    0xD6E5

#define PS2_CTRL      0xD640

/* ---- misc config --------------------------------------------------*/
#define FTP_DEFAULT_PORT 21
#define TX_FIFO_HIGH_WATER 1900   /* back off writing above this fill */
#define LINEBUF_LEN   128
#define CTRLBUF_LEN   128
#define FILEBUF_LEN   128
#define SEND_CHUNK    128
#define LISTLINE_LEN   80   /* matches the 79-col row clear in textPrintNewLine() */
#define FTP_RETR_MAX_ATTEMPTS 3

#define SINK_NONE  0
#define SINK_PRINT 1
#define SINK_FILE  2

#define MAX_REMOTE_FILES 24
#define PROGRESS_REDRAW_TICKS 8   /* min wait-loop iterations between redraws */

/* ---- Assets --- */
#pragma section( gfx, 0)
#pragma region( gfx, 0x10000, 0x10400, , , {gfx} )
#pragma data(gfx)
__export const char mainpalette[] = {
	#embed "../assets/fileicon.pal"
};
#pragma data(data)

#pragma section(spr, 0)
#pragma region(spr, 0x10400,0x10800, , , {spr} )
#pragma data(spr)
__export const char fileIconSprite[] = {
	#embed "../assets/fileicon.bin"
};
#pragma data(data)

/* ---- typedefs ---------------------------------------- */
typedef enum {
	FTP_DISCONNECTED,
	FTP_CONNECTED,
	FTP_LOGGED_IN
} ftp_state_t;

static ftp_state_t ftp_state = FTP_DISCONNECTED;

typedef enum {
    RETR_OK,          /* transfer complete and byte count matches */
    RETR_PARTIAL,     /* connection died/timed out mid-transfer; offset advanced */
    RETR_NO_RESUME,   /* server rejected REST; must restart from 0 */
    RETR_FAILED       /* couldn't even get a data connection; offset unchanged */
} retr_result_t;

typedef struct  {
		char name[24];
		uint32_t size;
		bool is_dir;
} RemoteFile;

RemoteFile remoteFiles[MAX_REMOTE_FILES];
static uint32_t downloadBytes = 0;
static uint32_t downloadTotal = 0;
static uint32_t downloadLastShown = 0;
static uint8_t downloadProgressY = 0;
static bool downloadComplete = false; /* forces the bar to 100% once the
                                        * data connection closes cleanly,
                                        * regardless of any SIZE-vs-actual
                                        * byte count mismatch */

/* ---- globals  ---------------------------------------- */
char remoteDirectory[60] = "/";
char localDirectory[60] = "/";

static char at_resp_line[CTRLBUF_LEN];
static bool at_resp_ready = false;

bool isFTPConnected = false;
bool isRemoteListed = false; //becomes true if a ls command is performed. returns to false after clear
bool isFileTrailing = false; //becomes true when you drag a file out

//char filesInRemote[SCR_REMOTE_Y_END - SCR_REMOTE_Y][24];


static uint16_t progressTickCounter = 0;
static uint8_t  progressLastFilled = 0xFF;
static uint8_t  progressLastY      = 0xFF;

void textFullClear()
{
	textSectionClear(SCR_CLI_X_END);
	textSectionClear(SCR_REMOTE_X_END);
	textSectionClear(SCR_LOCAL_X_END);
}

void initTextXY(uint8_t endX) //prepare the right text location according to the endx unique identifier, per section. do this everytime you need to write something
{
	switch(endX) //update the current line for the section that's been tapped here; endx is a unique identifier
	{
	case SCR_CLI_X_END:
		textGotoXY(SCR_CLI_X, cur_cli_y);
		break;
	case SCR_REMOTE_X_END:
		textGotoXY(SCR_REMOTE_X, cur_rem_y);
		break;
	case SCR_LOCAL_X_END:
		textGotoXY(SCR_LOCAL_X, cur_loc_y);
		break;
	}
}

void textPrintNewLine(uint8_t startX, uint8_t endX, uint8_t startY, uint8_t endY) //constrain it
{
	uint8_t x,y; //keep track of text position

	textGetXY(&x,&y);
	if(y == endY) y = startY; //loop back to start if needed
	else y++;
	textGotoXY(startX,y);
	for(uint8_t i=0;i<(endX-startX);i++)textPrint(" "); //wipe the next line before moving to it
	textGotoXY(startX,y); //go back to the planned start of that new line
	
	switch(endX) //update the current line for the section that's been tapped here; endx is a unique identifier
		{
		case SCR_CLI_X_END:
			cur_cli_y = y;
			break;
		case SCR_REMOTE_X_END:
			cur_rem_y = y;
			break;
		case SCR_LOCAL_X_END:
			cur_loc_y = y;
			break;
		}
}

//Sends a kernel based timer. You must prepare a timer_t struct first and initialize its fields
bool setTimer(const struct timer_t *timer)
{
    *(uint8_t*)0xf3 = timer->units;
    *(uint8_t*)0xf4 = timer->absolute;
    *(uint8_t*)0xf5 = timer->cookie;
    kernelCall(Clock.SetTimer);
	return !kernelError;
}
//getTimerAbsolute:
//This is essential if you want to retrigger a timer properly. The old value of the absolute
//field has a high chance of being desynchronized when you arrive at the moment when a timer
//is expired and you must act upon it.
//get the value returned by this, add the delay you want, and use setTimer to send it off
//ex: myTimer.absolute = getTimerAbsolute(TIMES_SECONDS) + TIMER_MYTIMER_DELAY
uint8_t getTimerAbsolute(uint8_t units)
{
    *(uint8_t*)0xf3 = units | 0x80;
    return kernelCall(Clock.SetTimer);
}


/* ===================================================================
 * Tiny delay helper (see caveats above)
 * =================================================================== */
void lilpause(uint8_t timedelay)
{
	struct timer_t pauseTimer;
	bool noteExitFlag = false;
	pauseTimer.units = 0; //frames
	pauseTimer.cookie = 213; //let's hope you never use this cookie!
	pauseTimer.absolute = getTimerAbsolute(0) + timedelay;
	setTimer(&pauseTimer);
	noteExitFlag = false;
	while(!noteExitFlag)
	{
		kernelNextEvent();
		if(kernelEventData.type == kernelEvent(timer.EXPIRED))
		{
			switch(kernelEventData.u.timer.cookie)
			{
			case 213:
				noteExitFlag = true;
				break;
			}
		}
	}
}

/* ===================================================================
 * Lowest level: raw byte in/out through the FIFOs
 * =================================================================== */
static void uart_putc(char c) {
    while (PEEKW(WIFI_TX_F) > TX_FIFO_HIGH_WATER) { /* backpressure */ }
    POKE(WIFI_DATA, c);
}

static char uart_getc(void) {
    if (PEEKW(WIFI_RX_F)) return PEEK(WIFI_DATA);
    return 0;
}

static void uart_puts(const char *s) {
    while (*s) uart_putc(*s++);
}

/* wait for one specific raw byte (used only for the '>' CIPSEND
 * prompt -- this deliberately bypasses the line/IPD parser below) */
static bool wiz_wait_char(char ch, uint16_t timeout_frames) {
    uint16_t t = 0;
    while (t < timeout_frames) {
        if (PEEKW(WIFI_RX_F)) {
            char c = PEEK(WIFI_DATA);
            if (c == ch) return true;
        } else {
            lilpause(1);
            t++;
        }
    }
    return false;
}

/* ===================================================================
 * Global protocol state
 * =================================================================== */
static bool debug_mode = false;   /* start verbose off so first-run issues are invisible;
                                     toggle with the `debug` command once things work */

/* AT-command layer flags (set by handle_line) */
static bool at_ok = false;
static bool at_error = false;

/* FTP control-channel (link 0) reply */
static char ctrl_reply_text[CTRLBUF_LEN];
static int  ctrl_reply_code = 0;
static bool ctrl_reply_ready = false;

/* data-channel (link 1) bookkeeping */
static uint8_t data_sink = SINK_NONE;
static bool data_closed = false;
static FILE *out_fp = (FILE *)0;
static uint8_t filebuf[FILEBUF_LEN];
static uint8_t filebuf_len = 0;

/* line buffer used only for SINK_PRINT (LIST output) -- routes through
 * the same textPrint()/textPrintNewLine() cursor tracking as everything
 * else, instead of the old raw putchar() which used a different,
 * unsynchronized output path */
static char listline[LISTLINE_LEN];
static uint8_t listlinelen = 0;

/* ---- line accumulator for plain (non-IPD) firmware messages ------ */
static char linebuf[LINEBUF_LEN];
static uint8_t linelen = 0;

/* ---- line accumulator for the control-channel FTP text ----------- */
static char ctrlline[CTRLBUF_LEN];
static uint8_t ctrllen = 0;

/* ---- +IPD,<link>,<len>: header parsing state ---------------------- */
#define RX_LINE       0
#define RX_IPD_HEADER 1
#define RX_IPD_DATA   2
static uint8_t rxstate = RX_LINE;
static char ipd_hdr[20];
static uint8_t ipd_hdr_len = 0;
static uint8_t ipd_link = 0;
static uint16_t ipd_remaining = 0;

/* ===================================================================
 * Forward declarations
 * =================================================================== */
static void handle_line(char *line);
static void handle_ctrl_byte(char c);
static void handle_data_byte(uint8_t link, char c);
static void flush_filebuf(void);
static void flush_listline(void);
static bool format_and_print_listline(char *raw, RemoteFile *rF);
static int ftp_command(const char *);

/* ===================================================================
 * IPD header parsing:  "+IPD,<link>,<len>:"
 * =================================================================== */
static bool parse_ipd_header(const char *hdr, uint8_t *link, uint16_t *len) {
    const char *p = hdr;
    uint16_t l, n;
    if (strncmp(p, "+IPD,", 5) != 0) return false;
    p += 5;
    l = 0;
    while (*p >= '0' && *p <= '9') { l = l * 10 + (*p - '0'); p++; }
    if (*p != ',') return false;
    p++;
    n = 0;
    while (*p >= '0' && *p <= '9') { n = n * 10 + (*p - '0'); p++; }
    if (*p != ':') return false;
    *link = (uint8_t)l;
    *len = n;
    return true;
}

/* Ask the server to start the next RETR at `offset` bytes into the file.
 * Not all servers honor this for every file -- treat anything other than
 * 350 as "can't resume" rather than a hard error. */
static bool ftp_rest(uint32_t offset) {
    char cmd[32];
    sprintf(cmd, "REST %lu", (unsigned long)offset);
    return ftp_command(cmd) == 350;
}
/* Call once, right when downloadProgressY is set, before the transfer's
 * wait loop starts. */
static void reset_download_progress(void) {
    progressTickCounter = 0;
    progressLastFilled  = 0xFF;
    progressLastY       = downloadProgressY;
}
/* ===================================================================
 * Byte-level receive state machine -- demultiplexes plain firmware
 * lines from +IPD wrapped socket payload.
 * =================================================================== */
static void wiz_rx_byte(char c) {
    switch (rxstate) {

    case RX_LINE:
        if (linelen == 0 && c == '+') {
            ipd_hdr_len = 0;
            ipd_hdr[ipd_hdr_len++] = c;
            rxstate = RX_IPD_HEADER;
            return;
        }
        if (c == '\n') {
            linebuf[linelen] = 0;
            if (linelen > 0) handle_line(linebuf);
            linelen = 0;
        } else if (c != '\r') {
            if (linelen < LINEBUF_LEN - 1) linebuf[linelen++] = c;
        }
        break;

    case RX_IPD_HEADER:
        if (ipd_hdr_len < sizeof(ipd_hdr) - 1) ipd_hdr[ipd_hdr_len++] = c;
        if (c == ':') {
            ipd_hdr[ipd_hdr_len] = 0;
            if (parse_ipd_header(ipd_hdr, &ipd_link, &ipd_remaining)) {
                if (debug_mode)
				{
				textPrint("[ipd link=");textPrintInt(ipd_link);textPrint(" len=");textPrintInt(ipd_remaining);textPrint("]");textPrintNewLine(SCR_CLI_X, SCR_CLI_X_END, SCR_CLI_Y, SCR_CLI_Y_END);
				}
				rxstate = (ipd_remaining > 0) ? RX_IPD_DATA : RX_LINE;
            } else {
                /* not actually "+IPD,...:" -- replay what we buffered into
             * the normal line accumulator instead of dropping it, so
             * other "+..." AT responses (CWJAP, CIFSR, CIPSTATUS...)
             * still make it to handle_line() */
				uint8_t k;
				linelen = 0;
				for (k = 0; k < ipd_hdr_len && linelen < LINEBUF_LEN - 1; k++)
					linebuf[linelen++] = ipd_hdr[k];
				rxstate = RX_LINE;
            }
        } else if (ipd_hdr_len >= sizeof(ipd_hdr) - 1) {
            uint8_t k;
			linelen = 0;
			for (k = 0; k < ipd_hdr_len && linelen < LINEBUF_LEN - 1; k++)
				linebuf[linelen++] = ipd_hdr[k];
			rxstate = RX_LINE;
        }
        break;

    case RX_IPD_DATA:
        handle_data_byte(ipd_link, c);
        ipd_remaining--;
        if (ipd_remaining == 0) rxstate = RX_LINE;
        break;
    }
}

/* drain everything currently sitting in the hardware RX FIFO.
 * Returns true if at least one byte was processed, so callers can
 * avoid sleeping while data is actively flowing (see wiz_wait_atok,
 * ftp_wait_reply, and the data-channel wait loops in ftp_list /
 * ftp_retr -- this is what fixes downloads getting truncated). */
static bool wiz_poll_any(void) {
    bool got = false;
    while (PEEKW(WIFI_RX_F)) {
        char c = PEEK(WIFI_DATA);
        wiz_rx_byte(c);
        got = true;
    }
    return got;
}

/* ===================================================================
 * Plain firmware line handler (OK / ERROR / n,CONNECT / n,CLOSED /
 * WIFI ... -- never FTP text, that always arrives via +IPD on link 0)
 * =================================================================== */
static void handle_line(char *line) {
    if (debug_mode)
		{
		textPrint("<< ");textPrint(line);textPrintNewLine(SCR_CLI_X, SCR_CLI_X_END, SCR_CLI_Y, SCR_CLI_Y_END);
		}
    if (strcmp(line, "OK") == 0 || strcmp(line, "SEND OK") == 0) {
        at_ok = true;
        return;
    }
    if (strcmp(line, "ERROR") == 0 || strcmp(line, "FAIL") == 0) {
        at_error = true;
        return;
    }
    if (strstr(line, ",CLOSED")) {
        uint8_t link = (uint8_t)(line[0] - '0');
        if (link == 1) data_closed = true;
        return;
    }
    if (strstr(line, ",CONNECT")) {
        return; /* informational only */
    }
    if (strncmp(line, "WIFI", 4) == 0) {
        textPrint(line);textPrintNewLine(SCR_CLI_X, SCR_CLI_X_END, SCR_CLI_Y, SCR_CLI_Y_END);
		return;
    }
    else
	{
	strncpy(at_resp_line, line, CTRLBUF_LEN - 1);
	at_resp_line[CTRLBUF_LEN - 1] = 0;
	at_resp_ready = true;	
	}
}

/* ===================================================================
 * Control-channel (link 0) byte -> FTP reply line assembler.
 * Looks for "<3 digits><space>" at the start of a line to recognise
 * the *final* line of a (possibly multi-line) reply; "<3 digits>-"
 * continuation lines are simply consumed and ignored.
 * =================================================================== */
static void handle_ctrl_byte(char c) {
    if (c == '\n') {
        ctrlline[ctrllen] = 0;
        if (ctrllen >= 4 &&
            ctrlline[0] >= '0' && ctrlline[0] <= '9' &&
            ctrlline[1] >= '0' && ctrlline[1] <= '9' &&
            ctrlline[2] >= '0' && ctrlline[2] <= '9') {
            char sep = ctrlline[3];
            int code = (ctrlline[0] - '0') * 100 + (ctrlline[1] - '0') * 10 + (ctrlline[2] - '0');
            if (sep == ' ') {
                ctrl_reply_code = code;
                strcpy(ctrl_reply_text, ctrlline + 4);
                ctrl_reply_ready = true;
            }
        }
        if (debug_mode && ctrllen > 0)
			{
			textPrint("[ctrl] ");textPrint(ctrlline);textPrintNewLine(SCR_CLI_X, SCR_CLI_X_END, SCR_CLI_Y, SCR_CLI_Y_END);
			}
		ctrllen = 0;
    } else if (c != '\r') {
        if (ctrllen < CTRLBUF_LEN - 1) ctrlline[ctrllen++] = c;
    }
}

/* ===================================================================
 * Data-channel (link 1) byte dispatcher
 * =================================================================== */
static void flush_filebuf(void) {
    if (filebuf_len && out_fp) {
        fwrite(filebuf, 1, filebuf_len, out_fp);
    }
    filebuf_len = 0;
}

/* right-pad `s` on the left with spaces out to `width` characters --
 * used to line up the size/date columns */
static void print_right(const char *s, uint8_t width) {
    uint8_t len = (uint8_t)strlen(s);
    while (len < width) { textPrint(" "); len++; }
    textPrint(s);
}

/* turn a decimal uint32_t into a string, no sprintf %lu dependency */
void format_u32(uint32_t v, char *out) {
    char tmp[11];
    uint8_t n = 0;
    if (v == 0) { out[0] = '0'; out[1] = 0; return; }
    while (v > 0) { tmp[n++] = (char)('0' + (v % 10)); v /= 10; }
    while (n > 0) { *out++ = tmp[--n]; }
    *out = 0;
}


/* Reformats a typical Unix-style LIST line, e.g.:
 *   -rw-r--r--   1 user group   12345 Jan 15 12:34 name.txt
 *   drwxr-xr-x   2 user group    4096 Jan 15 12:34 subdir
 * down to just:   <size>  <mon> <day> <time-or-year>  [/]name
 * Falls back to printing the line unchanged if it doesn't look like
 * that format -- a "total NNN" summary some servers prepend, a blank
 * line, or a server using a different LIST style (MS-DOS/IIS-style
 * listings aren't handled here; tell me if you're hitting one of
 * those and I'll add a second parser). Modifies `raw` in place. */
static bool format_and_print_listline(char *raw, RemoteFile *rFile) {
    char *p = raw;
    char *field[8];
    uint8_t i;
    bool isdir;
	uint32_t bytes, kb;
	char sizebuf[8];

    if (*raw == 0) return false;                       /* blank line */
    if (strncmp(raw, "total ", 6) == 0) return false;   /* summary line */

	initTextXY(SCR_REMOTE_X_END);
    for (i = 0; i < 8; i++) {
        while (*p == ' ') p++;
        if (*p == 0) { textPrint(raw); textPrintNewLine(SCR_REMOTE_X, SCR_REMOTE_X_END, SCR_REMOTE_Y, SCR_REMOTE_Y_END); return false; }
        field[i] = p;
        while (*p && *p != ' ') p++;
        if (*p == ' ') *p++ = 0;
    }
    while (*p == ' ') p++;
    if (*p == 0) { textPrint(raw); textPrintNewLine(SCR_REMOTE_X, SCR_REMOTE_X_END, SCR_REMOTE_Y, SCR_REMOTE_Y_END); return true; }
    /* p now points at the filename: the rest of the original line,
     * spaces and all, so names containing spaces stay intact */

    isdir = (field[0][0] == 'd');

	bytes = 0;
	{
		const char *sp = field[4];
		while(*sp >= '0' && *sp <= '9') { bytes = bytes * 10 + (uint32_t)(*sp - '0'); sp++; }
	}
	kb = (bytes + 1023) / 1024;
	format_u32(kb, sizebuf);
	if(strlen(sizebuf) + 1 > 5)
		{
			uint32_t mb = (kb + 1023) / 1024; //round up
			format_u32(mb, sizebuf);
			strcat(sizebuf, "M");
		}
	else strcat(sizebuf, "K");
	rFile->size = bytes;
	
	
	//prepare to write the file size	
	textSetColor(10,0);
	textSetColor(10,0);
	print_right(sizebuf, 6);
	
    //print_right(field[4], 8);   /* size */
    textPrint("  ");
	/*
    textPrint(field[5]); textPrint(" ");    // month 
    print_right(field[6], 2); textPrint(" ");  // day 
    print_right(field[7], 5);               // time or year 
    textPrint("  ");
    */
	textSetColor(15,0); //prepare to write the file name
	textPrint(p);
	strcpy(rFile->name, p);
	if (isdir) 
	{
		textPrint("/");
		rFile->is_dir = true;
		//filesInRemote[cur_rem_y - SCR_REMOTE_Y][0]= 0;
	}
	else 
		{
		rFile->is_dir = false;
		//strcpy(filesInRemote[cur_rem_y - SCR_REMOTE_Y], p); //copy in the keepsake buffer for later (mouse manips)
		}
    textPrintNewLine(SCR_REMOTE_X, SCR_REMOTE_X_END, SCR_REMOTE_Y, SCR_REMOTE_Y_END);
	return true;
}
/* flush whatever's been accumulated for the current LIST/NLST line.
 * Called on '\n' and once more at the end of the transfer to catch a
 * final line that wasn't newline-terminated. */
static void flush_listline(void) {
	uint8_t index;
	
    listline[listlinelen] = 0;
	
	index = cur_rem_y - SCR_REMOTE_Y;
	
    if(format_and_print_listline(listline, &remoteFiles[index]))
		{ 
		//remoteFileCount++;
		}
    listlinelen = 0;
}

static void draw_download_progress(bool force)
{
    char buf[12];
    uint8_t percent = 0;
    uint8_t filled = 0;
    uint8_t i;

    if (downloadProgressY != progressLastY) reset_download_progress();

    /* Hard, byte-count-independent throttle: skip unless enough wait-loop
     * iterations have passed since the last redraw, or the caller forces
     * one (start/completion). Cheap increment+compare, no math wasted
     * on calls we're going to skip anyway. */
    if (!force) {
        if (++progressTickCounter < PROGRESS_REDRAW_TICKS) return;
        progressTickCounter = 0;
    }

    if (downloadComplete)
    {
        percent = 100;
        filled = 30;
    }
    else if (downloadTotal > 0)
    {
        percent = (downloadBytes >= downloadTotal)
            ? 100
            : (uint8_t)((downloadBytes * 100UL) / downloadTotal);
        filled = (uint8_t)(((uint16_t)percent * 30) / 100);
    }

    /* Even after passing the tick gate, skip the actual screen write if
     * the bar didn't visibly change (e.g. downloadTotal unknown, so
     * filled is stuck at 0 between force calls). */
    if (!force && filled == progressLastFilled) return;
    progressLastFilled = filled;

    textGotoXY(SCR_CLI_X, downloadProgressY);
    textPrint("                                                                ");
    textGotoXY(SCR_CLI_X, downloadProgressY);
    textPrint("Download [");

    for (i = 0; i < 30; i++)
        textPrint(i < filled ? "#" : ".");

    textPrint("] ");

    if (downloadComplete || downloadTotal > 0)
    {
        format_u32(percent, buf);
        textPrint(buf);
        textPrint("% ");
    }

    format_u32(downloadBytes, buf);
    textPrint(buf);
    textPrint(" bytes");
}

static void handle_data_byte(uint8_t link, char c) {
    if (link == 0) {
        handle_ctrl_byte(c);
        return;
    }
    if (link == 1) {
        switch (data_sink) {
        case SINK_PRINT:
            if (c == '\r') break;              /* CR is not visible content */
            if (c == '\n') { flush_listline(); break; }
            if (listlinelen < LISTLINE_LEN - 1) listline[listlinelen++] = c;
            break;
        case SINK_FILE:
            filebuf[filebuf_len++] = (uint8_t)c;
			downloadBytes++;
            if (filebuf_len >= FILEBUF_LEN) flush_filebuf();
            break;
        default:
            break;
        }
    }
}

/* ===================================================================
 * Wait helpers -- these only sleep (lilpause) when nothing arrived on
 * the last poll, so an actively-flowing transfer is drained back to
 * back with no artificial ~16ms gap inserted between reads.
 * =================================================================== */
static bool wiz_wait_atok(uint16_t timeout_frames) {
    uint16_t t = 0;
    while (t < timeout_frames) {
        bool got = wiz_poll_any();
        if (at_ok) return true;
        if (at_error) return false;
        if (!got) { lilpause(1); t++; }
    }
    return false;
}

static bool ftp_wait_reply(uint16_t timeout_frames) {
    uint16_t t = 0;
    while (t < timeout_frames) {
        bool got = wiz_poll_any();
        if (ctrl_reply_ready) return true;
        if (!got) { lilpause(1); t++; }
    }
    return false;
}

static void print_reply(void) {
	initTextXY(SCR_CLI_X_END);
    textPrintInt(ctrl_reply_code);textPrint(" ");
	textPrint(ctrl_reply_text);textPrintNewLine(SCR_CLI_X, SCR_CLI_X_END, SCR_CLI_Y, SCR_CLI_Y_END);
}

/* ===================================================================
 * AT command layer
 * =================================================================== */
static bool wiz_atcmd(const char *cmd, uint16_t timeout_frames) {
    at_ok = false;
    at_error = false;
    at_resp_ready = false;
    at_resp_line[0] = 0;
    uart_puts(cmd);
    uart_puts("\r\n");
    return wiz_wait_atok(timeout_frames);
}
static bool wiz_init(void) {
    uint8_t tries;
	/*
     * Start at 115200.
     *
     * Bit 3 = FIFO reset
     * Bit 0 = 0 -> 115200
     */
    POKE(WIFI_CTRL, 0x08);   /* reset tx/rx FIFOs */
    lilpause(20);
	
    POKE(WIFI_CTRL, 0x00);
    lilpause(100);           /* let the module settle after the FIFO reset --
                                 bump this further if "AT" still times out */

    /* discard any boot chatter/garbage sitting in the RX FIFO before we
     * start talking, so it can't desync the first reply we look for */
    while (PEEKW(WIFI_RX_F)) (void)PEEK(WIFI_DATA);

    for (tries = 0; tries < 5; tries++) {
        if (wiz_atcmd("AT", 400)) break;
        lilpause(50);
    }
    if (tries >= 5) return false;

    wiz_atcmd("ATE0", 200);           /* echo off; ignore failure, not fatal */

	
    if (!wiz_atcmd("AT+CWMODE=1", 200)) return false;
    if (!wiz_atcmd("AT+CWDHCP=1,1", 200)) return false;
    if (!wiz_atcmd("AT+CIPMUX=1", 200)) return false;
    return true;
}
/* Queries whether the module is currently joined to an AP.
 * Returns true and fills `ssid` if associated; returns false (ssid
 * left empty) if not connected or the query failed. */
static bool wiz_get_ssid(char *ssid, uint8_t ssid_len) {
    ssid[0] = 0;
    if (!wiz_atcmd("AT+CWJAP?", 1000)) return false;
    if (strncmp(at_resp_line, "+CWJAP:", 7) != 0) return false;   /* "No AP" etc. */

    {
        const char *p = at_resp_line + 7;
        uint8_t i = 0;
        if (*p != '"') return false;
        p++;
        while (*p && *p != '"' && i < ssid_len - 1) ssid[i++] = *p++;
        ssid[i] = 0;
    }
    return true;
}

static bool wiz_join(const char *ssid, const char *pass) {
    char cmd[96];
    sprintf(cmd, "AT+CWJAP=\"%s\",\"%s\"", ssid, pass);
    return wiz_atcmd(cmd, 8000);
}

static bool wiz_open_link(uint8_t link, const char *host, uint16_t port) {
    char cmd[96];
    sprintf(cmd, "AT+CIPSTART=%u,\"TCP\",\"%s\",%u", (unsigned)link, host, (unsigned)port);
    return wiz_atcmd(cmd, 3000);
}

static bool wiz_close_link(uint8_t link) {
    char cmd[24];
    sprintf(cmd, "AT+CIPCLOSE=%u", (unsigned)link);
    return wiz_atcmd(cmd, 500);
}

/* send `len` raw bytes over `link` via AT+CIPSEND */
static bool wiz_cipsend(uint8_t link, const char *data, uint16_t len) {
    char cmd[32];
    uint16_t i;
    sprintf(cmd, "AT+CIPSEND=%u,%u\r\n", (unsigned)link, (unsigned)len);
    at_ok = false;
    at_error = false;
    uart_puts(cmd);
    if (!wiz_wait_char('>', 300)) return false;
    for (i = 0; i < len; i++) uart_putc(data[i]);
    return wiz_wait_atok(500);
}

/* ===================================================================
 * FTP protocol layer
 * =================================================================== */
static bool ftp_send_cmd(const char *cmd) {
    char buf[130];
    strcpy(buf, cmd);
    strcat(buf, "\r\n");
    ctrl_reply_ready = false;
    return wiz_cipsend(0, buf, (uint16_t)strlen(buf));
}

static int ftp_command(const char *cmd) {
    if (!ftp_send_cmd(cmd)) return -1;
    if (!ftp_wait_reply(1500)) return -1;
    return ctrl_reply_code;
}

static bool ftp_open(const char *host, uint16_t port) {
    ctrl_reply_ready = false;
	initTextXY(SCR_CLI_X_END);
    if (!wiz_open_link(0, host, port)) {
        textPrint("Connect failed");textPrintNewLine(SCR_CLI_X, SCR_CLI_X_END, SCR_CLI_Y, SCR_CLI_Y_END);
		textSetColor(0,15);textGotoXY(SCR_STATUS_FTP, SCR_STATUS_Y);textPrint("not connected                       ");textSetColor(15,0);
		return false;
    }
	textPrint("Connected, waiting for banner...");textPrintNewLine(SCR_CLI_X, SCR_CLI_X_END, SCR_CLI_Y, SCR_CLI_Y_END);
	
	textSetColor(0,15);textGotoXY(SCR_STATUS_FTP, SCR_STATUS_Y);textPrint("connected to ");textPrint(host);textSetColor(15,0);
	if (ftp_wait_reply(2000)) print_reply();
    else
		{
        textPrint("(no banner received)");textPrintNewLine(SCR_CLI_X, SCR_CLI_X_END, SCR_CLI_Y, SCR_CLI_Y_END);
		}
	return true;
}

static bool ftp_type_binary(void); /* forward decl -- defined below, needed in ftp_login() */

static bool ftp_login(const char *user, const char *pass) {
    char cmd[80];
    int code;

    sprintf(cmd, "USER %s", user);
    code = ftp_command(cmd);
    print_reply();
    if (code == 230) {                 /* no password required */
        ftp_type_binary();
        return true;
    }
    if (code != 331) return false;

    sprintf(cmd, "PASS %s", pass);
    code = ftp_command(cmd);
    print_reply();
    if (code != 230) return false;

    /* Many servers require binary mode (TYPE I) for SIZE to work,
     * and ASCII mode can corrupt binary downloads/uploads anyway --
     * so switch right after login instead of relying on the user
     * to type "bin" first. */
    ftp_type_binary();
    return true;
}

static bool ftp_cwd(const char *dir) {
    char cmd[80];
    int code;
    sprintf(cmd, "CWD %s", dir);
    code = ftp_command(cmd);
    print_reply();
	if(code == 250)
		{
		strcpy(remoteDirectory, dir);
		textGotoXY(SCR_REMOTE_X_DIR, 0);for(uint8_t x=SCR_REMOTE_X_DIR; x<(SCR_LOCAL_X-1);x++) textPrint(" ");
		textGotoXY(SCR_REMOTE_X_DIR, 0);textPrint("/");
		if(strcmp(dir,"..")) textPrint(remoteDirectory);
		}
    return code == 250;
}

static bool ftp_cld(const char *dir) {
	
    return true;
}

static bool ftp_pwd(void) {
    int code = ftp_command("PWD");
    print_reply();
    return code == 257;
}

static bool ftp_type_binary(void) {
    int code = ftp_command("TYPE I");
    print_reply();
    return code == 200;
}

static bool ftp_quit(void) {
    int code = ftp_command("QUIT");
    print_reply();
    wiz_close_link(0);
	textSetColor(0,15);textGotoXY(SCR_STATUS_FTP, SCR_STATUS_Y);textPrint("not connected                      ");textSetColor(15,0);
    return code == 221;
}

/* parse "227 ... (h1,h2,h3,h4,p1,p2)" style reply text */
static bool parse_pasv(const char *text, char *ip, uint16_t *port) {
    const char *p = strchr(text, '(');
    unsigned int v[6];
    uint8_t i;
    if (!p) return false;
    p++;
    for (i = 0; i < 6; i++) {
        v[i] = 0;
        while (*p >= '0' && *p <= '9') { v[i] = v[i] * 10 + (*p - '0'); p++; }
        if (i < 5) {
            if (*p != ',') return false;
            p++;
        }
    }
    sprintf(ip, "%u.%u.%u.%u", v[0], v[1], v[2], v[3]);
    *port = (uint16_t)(v[4] * 256 + v[5]);
    return true;
}

static bool ftp_pasv(char *ip, uint16_t *port) {
    int code = ftp_command("PASV");
    print_reply();
    if (code != 227) return false;
    return parse_pasv(ctrl_reply_text, ip, port);
}

static void ftp_clear_remote_files(void)
{
		for(uint8_t i=0; i<SCR_REMOTE_Y_END - SCR_REMOTE_Y; i++)
		{
			remoteFiles[i].name[0] = '\0';
		}
}
static bool ftp_list(const char *arg) {
    char ip[20];
    uint16_t port;
    char cmd[80];
    int code;
    uint16_t t;

	ftp_clear_remote_files();
	cur_rem_y = SCR_REMOTE_Y;

    if (!ftp_pasv(ip, &port)) return false;
    if (!wiz_open_link(1, ip, port)) {
        textPrint("Data connection failed");textPrintNewLine(SCR_CLI_X, SCR_CLI_X_END, SCR_CLI_Y, SCR_CLI_Y_END);
		return false;
    }

    if (arg && *arg) sprintf(cmd, "LIST %s", arg);
    else strcpy(cmd, "LIST");

    data_sink = SINK_PRINT;
    data_closed = false;
    listlinelen = 0;

    code = ftp_command(cmd);
    print_reply();
    if (code != 150 && code != 125) {
        data_sink = SINK_NONE;
        wiz_close_link(1);
        return false;
    }

    t = 0;
    while (!data_closed && t < 3000) {
        if (!wiz_poll_any()) { lilpause(1); t++; }
    }
    data_sink = SINK_NONE;
	
	initTextXY(SCR_REMOTE_X_END);
    flush_listline();   /* catch a trailing line with no final \n */

    if (ftp_wait_reply(1000)) print_reply();
	
	isRemoteListed=true;
    return true;
}
static bool ftp_size(const char *remote, uint32_t *size)
{
    char cmd[80];
    int code;
    const char *p;
    uint32_t value;

    sprintf(cmd, "SIZE %s", remote);

    code = ftp_command(cmd);
    print_reply();

    if (code != 213)
        return false;

    p = ctrl_reply_text;

    /* Skip everything up to the first digit. */
    while (*p && (*p < '0' || *p > '9'))
        p++;

    if (!*p)
        return false;

    value = 0;
    while (*p >= '0' && *p <= '9')
    {
        value = value * 10 + (*p - '0');
        p++;
    }

    *size = value;
    return true;
}



/* One RETR attempt. `fp` stays open across attempts and its write
 * position is wherever the previous attempt's flush_filebuf() left it,
 * so a successful REST + this function just keeps appending correctly. */
static retr_result_t ftp_retr_attempt(const char *remote, FILE *fp, uint32_t offset) {
    char ip[20];
    uint16_t port;
    char cmd[80];
    int code;
    uint16_t t;
    bool timed_out = false;

    if (!ftp_pasv(ip, &port)) return RETR_FAILED;
    if (!wiz_open_link(1, ip, port)) {
        initTextXY(SCR_CLI_X_END);
        textPrint("Data connection failed"); textPrintNewLine(SCR_CLI_X, SCR_CLI_X_END, SCR_CLI_Y, SCR_CLI_Y_END);
        return RETR_FAILED;
    }

    if (offset > 0 && !ftp_rest(offset)) {
        wiz_close_link(1);
        return RETR_NO_RESUME;
    }

    out_fp = fp;
    filebuf_len = 0;
    data_sink = SINK_FILE;
    data_closed = false;

    sprintf(cmd, "RETR %s", remote);
    code = ftp_command(cmd);
    print_reply();
    if (code != 150 && code != 125) {
        data_sink = SINK_NONE;
        wiz_close_link(1);
        return RETR_FAILED;
    }

    t = 0;
    while (!data_closed && t < 6000) {
        if (!wiz_poll_any()) { lilpause(1); t++; }
        draw_download_progress(false);
    }
    if (!data_closed) timed_out = true;

    data_sink = SINK_NONE;
    flush_filebuf();          /* make sure downloadBytes == what's really on disk */
    wiz_close_link(1);        /* tear down cleanly before any retry reopens it */

    if (timed_out) return RETR_PARTIAL;
    if (downloadTotal > 0 && downloadBytes != downloadTotal) return RETR_PARTIAL;
    return RETR_OK;
}

static bool ftp_retr(const char *remote, const char *local) {
    FILE *fp;
    uint8_t attempt;
    uint32_t offset = 0;
    retr_result_t result = RETR_FAILED;

    downloadBytes = 0;
    downloadLastShown = 0;
    downloadTotal = 0;
    downloadComplete = false;

    ftp_size(remote, &downloadTotal);
    downloadProgressY = cur_cli_y;
	reset_download_progress();
    draw_download_progress(true);

    fp = fopen(local, "wb");
    if (!fp) {
        initTextXY(SCR_CLI_X_END);
        textPrint("Cannot create local file "); textPrint(local);
        textPrintNewLine(SCR_CLI_X, SCR_CLI_X_END, SCR_CLI_Y, SCR_CLI_Y_END);
        return false;
    }

    for (attempt = 0; attempt < FTP_RETR_MAX_ATTEMPTS; attempt++) {
        if (attempt > 0) {
            char buf[12];
            initTextXY(SCR_CLI_X_END);
            textPrint("Retrying from offset "); format_u32(offset, buf); textPrint(buf);
            textPrint("..."); textPrintNewLine(SCR_CLI_X, SCR_CLI_X_END, SCR_CLI_Y, SCR_CLI_Y_END);
        }

        result = ftp_retr_attempt(remote, fp, offset);
        if (result == RETR_OK) break;

        if (result == RETR_NO_RESUME) {
            /* server won't honor REST for this file -- only worth trying
             * that once; fall back to a full restart */
            fclose(fp);
            fp = fopen(local, "wb");
            if (!fp) { result = RETR_FAILED; break; }
            downloadBytes = 0;
            downloadLastShown = 0;
            offset = 0;
            continue;
        }

        /* RETR_PARTIAL or RETR_FAILED: resume from whatever's safely
         * on disk (flush_filebuf() already ran inside the attempt) */
        offset = downloadBytes;
    }

    fclose(fp);
    out_fp = (FILE *)0;

    if (result != RETR_OK) {
        char buf[12];
        initTextXY(SCR_CLI_X_END);
        textPrint("Download failed after "); textPrintInt(FTP_RETR_MAX_ATTEMPTS);
        textPrint(" attempts ("); format_u32(downloadBytes, buf); textPrint(buf);
        textPrint(" / "); format_u32(downloadTotal, buf); textPrint(buf);
        textPrint(" bytes)"); textPrintNewLine(SCR_CLI_X, SCR_CLI_X_END, SCR_CLI_Y, SCR_CLI_Y_END);
        return false;
    }

    downloadComplete = true;
	reset_download_progress();
    draw_download_progress(true);

    cur_cli_y = downloadProgressY + 1;
    if (cur_cli_y > SCR_CLI_Y_END) cur_cli_y = SCR_CLI_Y_END;
    textGotoXY(SCR_CLI_X, cur_cli_y);

    textPrint("Downloaded "); textPrint(remote); textPrint(" -> "); textPrint(local);
    textPrintNewLine(SCR_CLI_X, SCR_CLI_X_END, SCR_CLI_Y, SCR_CLI_Y_END);
    return true;
}

static bool ftp_stor(const char *local, const char *remote) {
    char ip[20];
    uint16_t port;
    char cmd[80];
    int code;
    FILE *fp;
    uint8_t buf[SEND_CHUNK];
    size_t n;

    fp = fopen(local, "rb");
    if (!fp) {
		initTextXY(SCR_CLI_X_END);
        textPrint("Cannot open local file ");textPrint(local);textPrintNewLine(SCR_CLI_X, SCR_CLI_X_END, SCR_CLI_Y, SCR_CLI_Y_END);
		return false;
    }
    if (!ftp_pasv(ip, &port)) { fclose(fp); return false; }
    if (!wiz_open_link(1, ip, port)) {
		initTextXY(SCR_CLI_X_END);
        textPrint("Data connection failed");textPrintNewLine(SCR_CLI_X, SCR_CLI_X_END, SCR_CLI_Y, SCR_CLI_Y_END);
		fclose(fp);
        return false;
    }

    sprintf(cmd, "STOR %s", remote);
    code = ftp_command(cmd);
    print_reply();
    if (code != 150 && code != 125) {
        fclose(fp);
        wiz_close_link(1);
        return false;
    }

	bool failed = false;
    while ((n = fread(buf, 1, sizeof(buf), fp)) > 0) {
        if (!wiz_cipsend(1, (char *)buf, (uint16_t)n)) {
			failed = true;
			initTextXY(SCR_CLI_X_END);
            textPrint("Upload send failed");textPrintNewLine(SCR_CLI_X, SCR_CLI_X_END, SCR_CLI_Y, SCR_CLI_Y_END);
			break;
        }
    }
    fclose(fp);
    wiz_close_link(1);   /* signals EOF to the server */

	if(failed) return false;
	
    if (ftp_wait_reply(2000)) print_reply();
   
	textPrint("Uploaded ");textPrint(local);
	textPrint(" -> ");textPrint(remote);textPrintNewLine(SCR_CLI_X, SCR_CLI_X_END, SCR_CLI_Y, SCR_CLI_Y_END);
    return true;
}



//force a highlight of a file
void forceFileHighlight(uint8_t foreColor,uint8_t backColor, uint8_t line, uint8_t whichArea)
{
	uint8_t start=0, end=0;
	if(whichArea==1){start = SCR_REMOTE_X + 7; end = SCR_REMOTE_X_END;}
	else if(whichArea==2){start = SCR_LOCAL_X; end = SCR_LOCAL_X_END;}
	else return;
	
	textSetColor(foreColor, backColor);
	POKE(MMU_IO_CTRL,3); // color matrix
	for(uint8_t x = start; x < end; x++) 
		{
			POKE(0xC000 + (uint32_t)x + (uint32_t)line*80, foreColor<<4 | (backColor&0x0F));
		}
	
	POKE(MMU_IO_CTRL,0);
	textSetColor(15,0); //return to neutral white on black
}



/* ===================================================================
 * Text UI
 * =================================================================== */
static void read_line(char *buf, uint8_t maxlen) {
	int16_t boost; //allows the mouse to move faster if flicking is happening
    uint8_t i = 0;
	int16_t newX=0, newY=0;
    char c;
	uint8_t lastButtons = 0;
	static uint8_t oldHighlight = 255;
	static uint8_t oldHighlightLocal = 255;
	uint8_t trailOriginArea = 0;
	bool isShifted = false;
	
	newX = (int16_t)PEEKW(PS2_M_X_LO);
	newY = (int16_t)PEEKW(PS2_M_Y_LO);
				
				
	byte lx,ly; //text position
    for (;;) {
		kernelNextEvent();
		if(kernelEventData.type == kernelEvent(mouse.DELTA))
			{
				//movement
				int8_t deltaX = kernelEventData.u.mouse.delta.x;
				int8_t deltaY = kernelEventData.u.mouse.delta.y;
				
				int16_t ax = deltaX < 0 ? -deltaX : deltaX; //absolute value for deltaX
				int16_t ay = deltaY < 0 ? -deltaY : deltaY; //same for y
				
				int16_t scaledX = (ax > 20) ? deltaX + deltaX/2 : deltaX; //allow fast move if flicking
				int16_t scaledY = (ay > 20) ? deltaY + deltaY/2 : deltaY; //same for y
					
				newX += scaledX; newY += scaledY;
				
				if(newX<0) newX=0; if(newX>624) newX=624;
				if(newY<0) newY=0; if(newY>464) newY=464;
				POKEW(PS2_M_X_LO,newX);
				POKEW(PS2_M_Y_LO,newY);
			
				uint8_t mouseWhere = mouseInWhere();
				
				//button state
				lastButtons = kernelEventData.u.mouse.delta.buttons;
				bool leftDown = (lastButtons & 0x01) != 0;
				bool rightDown = (lastButtons & 0x02) != 0;
				bool buttonDown = leftDown || rightDown;
				
				if(!isFileTrailing && buttonDown) //launching a click in the remote area starts a trail 
				{
					if(mouseWhere==1 && isRemoteListed)
					{
					trailOriginArea = 1;
					isFileTrailing = true; //start the trail
					spriteSetPosition(0, newX/2+24, newY/2+28);
					spriteSetVisible(0, true);
					}
					else if(mouseWhere==2)
					{
					trailOriginArea = 2;
					isFileTrailing = true; //start the trail
					spriteSetPosition(0, newX/2+24, newY/2+28);
					spriteSetVisible(0, true);
					}
				}
				if(isFileTrailing && buttonDown && trailOriginArea != 0) //maintaining a click updates the sprite position
					{
					spriteSetPosition(0, newX/2+24, newY/2+28);
					spriteSetVisible(0, true);
					}
				if(isFileTrailing && !buttonDown) //letting go of click ends the trail
					{
						isFileTrailing = false;
						spriteSetVisible(0,false);
						
						//check if a file transfer request is valid
						if(mouseWhere==2)
						{
							//if(oldHighlight != 255 && strcmp(filesInRemote[oldHighlight - SCR_REMOTE_Y],"\0"))
							if(oldHighlight != 255 && strcmp(remoteFiles[oldHighlight - SCR_REMOTE_Y].name,"\0"))
							{
								char finalName[100];
								strcpy(finalName, remoteFiles[oldHighlight - SCR_REMOTE_Y].name);
								
//textPrint("want ");textPrint(finalName);textPrintNewLine(SCR_CLI_X, SCR_CLI_X_END, SCR_CLI_Y, SCR_CLI_Y_END);
								ftp_retr(remoteFiles[oldHighlight - SCR_REMOTE_Y].name, finalName);
								trailOriginArea = 0; //reset the origin
							}
						}
					}
				//detection inside the remote area
				if(mouseWhere==1 && isRemoteListed && !isFileTrailing) //highlight a file except if a mouse click drag is detected
					{
					uint8_t newHighlight;

					if(oldHighlightLocal!=255){ //turn off local highlight
						forceFileHighlight(15,0,oldHighlightLocal, 2); //white on black
						oldHighlightLocal=255;
						}
					if(rowFromMouse(&newHighlight,1))
						{
						if(newHighlight != oldHighlight) //updates the file highlight if there was a detected change of mouse over
							{
							forceFileHighlight(13,1,newHighlight, 1); //yellow on red
							forceFileHighlight(15,0,oldHighlight, 1); //white on black
							oldHighlight = newHighlight;
							}
						}
					}
				//detection in local area
				else if(mouseWhere==2 && !isFileTrailing) //highlight a file except if a mouse click drag is detected
					{
					uint8_t newHighlight;

					if(oldHighlight!=255){ //turn off remote highlight
						forceFileHighlight(15,0,oldHighlight, 2); //white on black
						oldHighlight=255;
						}
					if(rowFromMouse(&newHighlight,2))
						{
						if(newHighlight != oldHighlightLocal) //updates the file highlight if there was a detected change of mouse over
							{
							forceFileHighlight(13,1,newHighlight, 2); //yellow on red
							forceFileHighlight(15,0,oldHighlightLocal, 2); //white on black
							oldHighlightLocal = newHighlight;
							}
						}
					}

				if(oldHighlight!=255 && isRemoteListed)forceFileHighlight(15,0,oldHighlight, 1); //white on black
				if(oldHighlightLocal!=255)forceFileHighlight(15,0,oldHighlightLocal, 1); //white on black
				oldHighlight=255;
				oldHighlightLocal =255;
			}
		else if(kernelEventData.type == kernelEvent(mouse.CLICKS))
		{
		}
		else if(kernelEventData.type == kernelEvent(key.PRESSED))
			{
			c = kernelEventData.u.key.raw;
			if(c == 0x00 || c== 0x01) //either shifts
			{
				isShifted = true;
				continue;
			}
			if (c < 0 || c == 0xFF) { lilpause(1); continue; }
			if (c == 0x94) { buf[i] = 0; textPrintNewLine(SCR_CLI_X, SCR_CLI_X_END, SCR_CLI_Y, SCR_CLI_Y_END); isShifted = false; return; }
			if (c == 0x92) { //backspace
				if (i > 0) {
				i--;
				textGetXY(&lx, &ly);
				textGotoXY(lx-1,ly);textPrint(" ");textGotoXY(lx-1,ly);
				}
				isShifted = false;
				continue;
				}
			if (i < maxlen - 1) {
				char s[2];
				buf[i++] = c - (isShifted ? 0x20 : 0);
				s[0] = c - (isShifted ? 0x20 : 0);
				s[1] = 0;
				textPrint(s);   /* textPrint() wants a C string, not a bare
				                   char address -- that mismatch (&c) is what
				                   was printing stack garbage after each key */
				isShifted = false;
				}
			}
    }
}

static void split_args(char *line, char **cmd, char **a1, char **a2) {
    char *p = line;
    *cmd = (char *)0;
    *a1 = (char *)0;
    *a2 = (char *)0;

    while (*p == ' ') p++;
    if (*p == 0) return;
    *cmd = p;

    while (*p && *p != ' ') p++;
    if (*p == 0) return;
    *p++ = 0;
    while (*p == ' ') p++;
    if (*p == 0) return;
    *a1 = p;

    while (*p && *p != ' ') p++;
    if (*p == 0) return;
    *p++ = 0;
    while (*p == ' ') p++;
    if (*p == 0) return;
    *a2 = p;
}


static void print_help(void) {	
	//preserve what's there
	char topLine[SCR_HELP_X_END - SCR_HELP_X + 1];
	char aCol[2] = {130,0};
	
	uint32_t tBackup = 0x20000;
	uint32_t cBackup = 0x20800;
	POKE(PS2_M_MODE_EN,0x00); //disable mouse
	
	
	topLine[0]=160;
	for(uint8_t z=1; z < (SCR_HELP_X_END - SCR_HELP_X) - 1; z++)
		{
		topLine[z]=150;
		}
	topLine[SCR_HELP_X_END - SCR_HELP_X - 1] = 161;
	topLine[SCR_HELP_X_END - SCR_HELP_X] = 0;
	
	POKE(MMU_IO_CTRL, 2); //character matrix
	for(uint8_t ty = SCR_HELP_Y; ty < SCR_HELP_Y_END; ty++)
		{
		for(uint8_t tx = SCR_HELP_X; tx < SCR_HELP_X_END; tx++) 
				FAR_POKE(tBackup++, PEEK(0xC000 + (uint32_t)tx + (uint32_t)ty*(uint32_t)80));
		}
	
	POKE(MMU_IO_CTRL, 3); //color matrix
	for(uint8_t ty = SCR_HELP_Y; ty < SCR_HELP_Y_END; ty++)
		{
		for(uint8_t tx = SCR_HELP_X; tx < SCR_HELP_X_END; tx++) 
				FAR_POKE(cBackup++, PEEK(0xC000 + (uint32_t)tx + (uint32_t)ty*(uint32_t)80));
		}
	POKE(MMU_IO_CTRL, 0);
	tBackup = 0x20000;
	cBackup = 0x20800;
	
	//display help
	
	textSetColor(14,6); //cyan over dark blue
	textGotoXY(SCR_HELP_X,SCR_HELP_Y);
	textPrint(topLine);fillSpaceToEnd(SCR_HELP_X_END);textPrintNewLine(SCR_HELP_X, SCR_HELP_X_END, SCR_HELP_Y, SCR_HELP_Y_END);
	
	textPrint(aCol);textSetColor(13,6);textPrint(" List of Commands           Press a key to dismiss.");fillSpaceToEnd(SCR_HELP_X_END-1);textSetColor(14,6); textPrint(aCol);textPrintNewLine(SCR_HELP_X, SCR_HELP_X_END, SCR_HELP_Y, SCR_HELP_Y_END);
	
	textSetColor(14,6); //cyan over dark blue
	textPrint(aCol);textPrint("  clear                clear the screen");fillSpaceToEnd(SCR_HELP_X_END-1);textPrint(aCol);textPrintNewLine(SCR_HELP_X, SCR_HELP_X_END, SCR_HELP_Y, SCR_HELP_Y_END);
    textPrint(aCol);textPrint("  wifi <ssid> <pass>   join wifi network");fillSpaceToEnd(SCR_HELP_X_END-1);textPrint(aCol);textPrintNewLine(SCR_HELP_X, SCR_HELP_X_END, SCR_HELP_Y, SCR_HELP_Y_END);
    textPrint(aCol);textPrint("  open <host> [port]   connect to ftp server (default port 21)");fillSpaceToEnd(SCR_HELP_X_END-1);textPrint(aCol);textPrintNewLine(SCR_HELP_X, SCR_HELP_X_END, SCR_HELP_Y, SCR_HELP_Y_END);
    textPrint(aCol);textPrint("  login <user> <pass>  log in");fillSpaceToEnd(SCR_HELP_X_END-1);textPrint(aCol);textPrintNewLine(SCR_HELP_X, SCR_HELP_X_END, SCR_HELP_Y, SCR_HELP_Y_END);
    textPrint(aCol);textPrint("  ls [path]            list directory");fillSpaceToEnd(SCR_HELP_X_END-1);textPrint(aCol);textPrintNewLine(SCR_HELP_X, SCR_HELP_X_END, SCR_HELP_Y, SCR_HELP_Y_END);
    textPrint(aCol);textPrint("  cd <path>            change remote directory");fillSpaceToEnd(SCR_HELP_X_END-1);textPrint(aCol);textPrintNewLine(SCR_HELP_X, SCR_HELP_X_END, SCR_HELP_Y, SCR_HELP_Y_END);
    textPrint(aCol);textPrint("  lcd <path>           change local directory");fillSpaceToEnd(SCR_HELP_X_END-1);textPrint(aCol);textPrintNewLine(SCR_HELP_X, SCR_HELP_X_END, SCR_HELP_Y, SCR_HELP_Y_END);
    textPrint(aCol);textPrint("  pwd                  print working directory");fillSpaceToEnd(SCR_HELP_X_END-1);textPrint(aCol);textPrintNewLine(SCR_HELP_X, SCR_HELP_X_END, SCR_HELP_Y, SCR_HELP_Y_END);
    textPrint(aCol);textPrint("  get <remote> [local] download a file");fillSpaceToEnd(SCR_HELP_X_END-1);textPrint(aCol);textPrintNewLine(SCR_HELP_X, SCR_HELP_X_END, SCR_HELP_Y, SCR_HELP_Y_END);
    textPrint(aCol);textPrint("  put <local> [remote] upload a file");fillSpaceToEnd(SCR_HELP_X_END-1);textPrint(aCol);textPrintNewLine(SCR_HELP_X, SCR_HELP_X_END, SCR_HELP_Y, SCR_HELP_Y_END);
    textPrint(aCol);textPrint("  bin                  set binary transfer type");fillSpaceToEnd(SCR_HELP_X_END-1);textPrint(aCol);textPrintNewLine(SCR_HELP_X, SCR_HELP_X_END, SCR_HELP_Y, SCR_HELP_Y_END);
    textPrint(aCol);textPrint("  quit                 log out and close control link");fillSpaceToEnd(SCR_HELP_X_END-1);textPrint(aCol);textPrintNewLine(SCR_HELP_X, SCR_HELP_X_END, SCR_HELP_Y, SCR_HELP_Y_END);
    textPrint(aCol);textPrint("  debug on|off         toggle raw protocol trace");fillSpaceToEnd(SCR_HELP_X_END-1);textPrint(aCol);textPrintNewLine(SCR_HELP_X, SCR_HELP_X_END, SCR_HELP_Y, SCR_HELP_Y_END);
    textPrint(aCol);textPrint("  help                 show this text");fillSpaceToEnd(SCR_HELP_X_END-1);textPrint(aCol);textPrintNewLine(SCR_HELP_X, SCR_HELP_X_END, SCR_HELP_Y, SCR_HELP_Y_END);
	textPrint(aCol);textPrint("  exit                 exit this program");fillSpaceToEnd(SCR_HELP_X_END-1);textPrint(aCol);textPrintNewLine(SCR_HELP_X, SCR_HELP_X_END, SCR_HELP_Y, SCR_HELP_Y_END);
	
	topLine[0]=162;
	topLine[SCR_HELP_X_END - SCR_HELP_X - 1] = 163;
	textPrint(topLine);
	
	for(;;)
	{
		kernelNextEvent();
		if(kernelEventData.type == kernelEvent(key.PRESSED)) break;
	}
	
	//wipe it out
	textSetColor(15,0); //white over black
	textSectionClear(SCR_HELP_X_END);
	//restore what was there before
	POKE(MMU_IO_CTRL, 2); //character matrix
	for(uint8_t ty = SCR_HELP_Y; ty < SCR_HELP_Y_END; ty++)
		{
		for(uint8_t tx = SCR_HELP_X; tx < SCR_HELP_X_END; tx++) 
				POKE(0xC000 + (uint32_t)tx + (uint32_t)ty*(uint32_t)80,FAR_PEEK(tBackup++));
		}
	
	POKE(MMU_IO_CTRL, 3); //color matrix
	for(uint8_t ty = SCR_HELP_Y; ty < SCR_HELP_Y_END; ty++)
		{
		for(uint8_t tx = SCR_HELP_X; tx < SCR_HELP_X_END; tx++) 
				POKE(0xC000 + (uint32_t)tx + (uint32_t)ty*(uint32_t)80,FAR_PEEK(cBackup++));
		}
	POKE(MMU_IO_CTRL, 0);
	POKE(PS2_M_MODE_EN,0x01); //enable mouse
}

int main(int argc, char *argv[]) {
    char line[80];
    char *cmd, *a1, *a2;
	char ssid[33];

    POKE(MMU_IO_CTRL, 0x00);
//Vicky Master Control Registers. XXX are unused bits
// XXX GAMMA  SPRITE   TILE  | BITMAP  GRAPH  OVRLY  TEXT
    POKE(VKY_MSTR_CTRL_0, 0b00101111);
// XXX XXX  FON_SET FON_OVLY | MON_SLP DBL_Y  DBL_X  CLK_70
    POKE(VKY_MSTR_CTRL_1, 0b00010000); 


//mouse setup
	POKE(PS2_M_MODE_EN,0x01); //enable mouse
	POKEW(PS2_M_X_LO,0x0100); //centers it in both x and y directions
	POKEW(PS2_M_Y_LO,0x0100);
//text mode setup
	textSetDouble(false, false); //force 80x60 text
//bitmap setup	
	initMyBitmap(); //take care of palette
	initMySprites();

//local directory setup
initFPR();

//permanent text layout
//initial directories labels
	textGotoXY(SCR_REMOTE_X, 0); textSetColor(15, 4);textPrint("Remote Dir:");
	textGotoXY(SCR_LOCAL_X, 0); textSetColor(15,1); textPrint("Local Dir:");

	
//kickstart the command line interface

	textSetColor(15,0);
	textFullClear();
	textGotoXY(SCR_CLI_X, SCR_CLI_Y); //reset the cursor
	cur_cli_y = SCR_CLI_Y;
	initTextXY(SCR_CLI_X_END);
	textPrint("WizFi360 FTP client");textPrintNewLine(SCR_CLI_X, SCR_CLI_X_END, SCR_CLI_Y, SCR_CLI_Y_END);
	textPrint("Initializing modem...");textPrintNewLine(SCR_CLI_X, SCR_CLI_X_END, SCR_CLI_Y, SCR_CLI_Y_END);
	

	bool modemReady = wiz_init();
	if (!modemReady)
	{
		textPrint("WizFi init failed - check wiring/power.");textPrintNewLine(SCR_CLI_X, SCR_CLI_X_END, SCR_CLI_Y, SCR_CLI_Y_END);
    }
	else
	{
		textPrint("Modem ready. Type 'help' for commands.");textPrintNewLine(SCR_CLI_X, SCR_CLI_X_END, SCR_CLI_Y, SCR_CLI_Y_END);
	}	
	
//wifi and ftp status bar	
	textSetColor(0,15);
	textGotoXY(0,SCR_STATUS_Y);textPrint("Wifi:                FTP:                                  muFTP v");
	textPrint(VERSIONBIG);textPrint(".");textPrint(VERSIONSML);textPrint(" ");
	textPrint(VERSIONMON);textPrint(" ");textPrint(VERSIONYR);
	textGotoXY(SCR_STATUS_WIFI,SCR_STATUS_Y);
	if(wiz_get_ssid(ssid, sizeof(ssid))) textPrint(ssid);
	else textPrint("not connected");
	
	textGotoXY(SCR_STATUS_FTP, SCR_STATUS_Y);textPrint("not connected");

	textSetColor(15,0);
	textGotoXY(SCR_REMOTE_X_DIR, 0);textPrint(remoteDirectory);
	textGotoXY(SCR_LOCAL_X_DIR, 0);textPrint(localDirectory);

//wipe out remote file array
	for(uint8_t i=0; i< SCR_REMOTE_Y_END - SCR_REMOTE_Y; i++) remoteFiles[i].name[0] = '\0';

//show local files
showFilesInDirectory(SCR_LOCAL_X, SCR_LOCAL_Y);
	
//main loop
    for (;;) {
        initTextXY(SCR_CLI_X_END);textPrint("ftp> ");
		read_line(line, sizeof(line));
        split_args(line, &cmd, &a1, &a2);
        if (!cmd || !*cmd) continue;

        if (!strcmp(cmd, "help")) {
            print_help();
        } else if(!strcmp(cmd, "clear")) {
			textFullClear();
			textGotoXY(SCR_CLI_X, SCR_CLI_Y); //reset the cursor
			cur_cli_y = SCR_CLI_Y;
			isRemoteListed=false;
			showFilesInDirectory(SCR_LOCAL_X, SCR_LOCAL_Y);
		} else if (!strcmp(cmd, "wifi")) {
            if (a1 && a2)
				{
				initTextXY(SCR_CLI_X_END);
				wiz_join(a1, a2) ? textPrint("Joined.") : textPrint("Join Failed.");
				textPrintNewLine(SCR_CLI_X, SCR_CLI_X_END, SCR_CLI_Y, SCR_CLI_Y_END);
				}
			else
			{
				initTextXY(SCR_CLI_X_END);
				textPrint("usage: wifi <ssid> <pass>");textPrintNewLine(SCR_CLI_X, SCR_CLI_X_END, SCR_CLI_Y, SCR_CLI_Y_END);
			}
        } else if (!strcmp(cmd, "open")) {
            if (a1) ftp_open(a1, a2 ? (uint16_t)atoi(a2) : FTP_DEFAULT_PORT);
			else
				{
				initTextXY(SCR_CLI_X_END);
				textPrint("usage: open <host> [port]");textPrintNewLine(SCR_CLI_X, SCR_CLI_X_END, SCR_CLI_Y, SCR_CLI_Y_END);
				}
		} else if (!strcmp(cmd, "login")) {
            if (a1 && a2) ftp_login(a1, a2);
            else
			{
			initTextXY(SCR_CLI_X_END);
			textPrint("usage: login <user> <pass>");textPrintNewLine(SCR_CLI_X, SCR_CLI_X_END, SCR_CLI_Y, SCR_CLI_Y_END);
			}
		} else if (!strcmp(cmd, "ls") || !strcmp(cmd, "dir")) {
            ftp_list(a1);
        } else if (!strcmp(cmd, "cd")) {
            if (a1) ftp_cwd(a1);
            else
			{
			initTextXY(SCR_CLI_X_END);
			textPrint("usage: cd <path>");textPrintNewLine(SCR_CLI_X, SCR_CLI_X_END, SCR_CLI_Y, SCR_CLI_Y_END);
			}
		} else if (!strcmp(cmd, "lcd")) {
            if (a1) ftp_cld(a1);
            else
			{
			initTextXY(SCR_CLI_X_END);
			textPrint("usage: lcd <path>");textPrintNewLine(SCR_CLI_X, SCR_CLI_X_END, SCR_CLI_Y, SCR_CLI_Y_END);
			}
		}  else if (!strcmp(cmd, "pwd")) {
            ftp_pwd();
        } else if (!strcmp(cmd, "get")) {
            if (a1) ftp_retr(a1, a2 ? a2 : a1);
            else
			{
			initTextXY(SCR_CLI_X_END);
			textPrint("usage: get <remote> [local]");textPrintNewLine(SCR_CLI_X, SCR_CLI_X_END, SCR_CLI_Y, SCR_CLI_Y_END);
			}
		} else if (!strcmp(cmd, "put")) {
            if (a1) ftp_stor(a1, a2 ? a2 : a1);
            else
			{
			initTextXY(SCR_CLI_X_END);
			textPrint("usage: put <local> [remote]");textPrintNewLine(SCR_CLI_X, SCR_CLI_X_END, SCR_CLI_Y, SCR_CLI_Y_END);
			}
		} else if (!strcmp(cmd, "bin")) {
            ftp_type_binary();
        } else if (!strcmp(cmd, "quit") || !strcmp(cmd, "bye")) {
            ftp_quit();
        } else if (!strcmp(cmd, "debug")) {
            debug_mode = (a1 && !strcmp(a1, "on"));
			
			initTextXY(SCR_CLI_X_END);
			textPrint("debug ");
			debug_mode ? textPrint("on") : textPrint("off");
			textPrintNewLine(SCR_CLI_X, SCR_CLI_X_END, SCR_CLI_Y, SCR_CLI_Y_END);
		} else if(!strcmp(cmd, "exit")) {
			initTextXY(SCR_CLI_X_END);
			textPrint("Leaving the FTP Client. See ya!");
			lilpause(120);
			break;
		} else {
			initTextXY(SCR_CLI_X_END);
			textPrint("Unknown command. Type 'help'.");textPrintNewLine(SCR_CLI_X, SCR_CLI_X_END, SCR_CLI_Y, SCR_CLI_Y_END);
        }
    }
    return 0;
}
/*
 Cat lounge, cool character driven multi music file player, by Mu0n, October 2026
 
 The github repo with the latest version can be found at 
 
 
 */


#pragma heapsize(0x80)


//INCLUDES
#include "f256lib.h"

#include "muMidiPlay.h"
#include "muVGMPlay.h"
#include "muTr2Play.h"
#include "muSidPlay.h"
#include "muMP3Play.h"
#include "myBitmap.h"
#include "myTimers.h"
#include "mySprites.h"
#include "muOPL3.h"
#include "muMidi.h"
#include "muPSG.h"
#include "muSid.h"
#include "muVS1053b.h"
#include "muFilePicker.h"
#include "muTimer0Int.h"
#include "muGen2Ram.h"
#include "muFileDiplomacy.h"
#include "textAreas.h"
#include "muPads.h"
#include "muStates.h"


// bitmap_001: 76800 bytes
#pragma section( bitmap_001, 0)
#pragma region( bitmap_001, 0x10000, 0x22C00, , , {bitmap_001} )
#pragma data(bitmap_001)
__export const char bitmap_001[] = {
	#embed 76800 "../assets/catlounge.bin"
};
#pragma data(data)

// bitmap_002: 76800 bytes
#pragma section( bitmap_002, 0)
#pragma region( bitmap_002, 0x40000, 0x52C00, , , {bitmap_002} )
#pragma data(bitmap_002)
__export const char bitmap_002[] = {
	#embed 76800 "../assets/bm2.bin"
};
#pragma data(data)

// palette_001: 1024 bytes
#pragma section( palette_001, 0)
#pragma region( palette_001, 0x23000, 0x23400, , , {palette_001} )
#pragma data(palette_001)
__export const char palette_001[] = {
	#embed 1024 "../assets/catlounge.pal"
};
#pragma data(data)


// notes_001: 1024 bytes
#pragma section( notes_001, 0)
#pragma region( notes_001, 0x3D000, 0x3D400, , , {notes_001} )
#pragma data(notes_001)
__export const char notes_001[] = {
	#embed "../assets/notes.bin"
};

// bitmap_room2: 76800 bytes
#pragma section( bitmap_room2, 0)
#pragma region( bitmap_room2, 0x100000, 0x112C00, , , {bitmap_room2} )
#pragma data(bitmap_room2)
__export const char bitmap_room2[] = {
	#embed 76800 "../assets/room2.bin"
};
#pragma data(data)
// shadowmap1: 38400 bytes
#pragma section( shadowmap1, 0)
#pragma region( shadowmap1, 0x73000, 0x7C600, , , {shadowmap1} )
#pragma data(shadowmap1)
__export const char shadowmap1[] = {
	#embed 38400"../assets/shadowmap1.bin"
};
#pragma data(data)

#pragma data(data)
// shadowmap2: 38400 bytes
#pragma section( shadowmap2, 0)
#pragma region( shadowmap2, 0x33000, 0x3C600, , , {shadowmap2} )
#pragma data(shadowmap2)
__export const char shadowmap2[] = {
	#embed 38400"../assets/shadowmap2.bin"
};
#pragma data(data)

// sprites_001: 46080 bytes
#pragma section( sprites_001, 0)
#pragma region( sprites_001, 0x2B000, 0x36400, , , {sprites_001} )
#pragma data(sprites_001)
__export const char sprites_001[] = {
	#embed 46080 "../assets/whiskers.bin"
};
#pragma data(data)

// chip_psg: 4096 bytes
#pragma section( chip_psg, 0)
#pragma region( chip_psg, 0x53000, 0x54000, , , {chip_psg} )
#pragma data(chip_psg)
__export const char chip_psg[] = {
	#embed 4096 "../assets/chip_psg.bin"
};

// chip_midi: 4096 bytes
#pragma section( chip_midi, 0)
#pragma region( chip_midi, 0x54000, 0x55000, , , {chip_midi} )
#pragma data(chip_midi)
__export const char chip_midi[] = {
	#embed 4096 "../assets/chip_midi.bin"
};
#pragma data(data)


#pragma data(data)
// chip_sid: 4096 bytes
#pragma section( chip_sid, 0)
#pragma region( chip_sid, 0x55000, 0x56000, , , {chip_sid} )
#pragma data(chip_sid)
__export const char chip_sid[] = {
	#embed 4096 "../assets/chip_sid.bin"
};
#pragma data(data)
// chip_opl: 4096 bytes
#pragma section( chip_opl, 0)
#pragma region( chip_opl, 0x56000, 0x57000, , , {chip_opl} )
#pragma data(chip_opl)
__export const char chip_opl[] = {
	#embed 4096 "../assets/chip_opl.bin"
};
#pragma data(data)
// chip_mp3: 4096 bytes
#pragma section( chip_mp3, 0)
#pragma region( chip_mp3, 0x57000, 0x58000, , , {chip_mp3} )
#pragma data(chip_mp3)
__export const char chip_mp3[] = {
	#embed 4096 "../assets/chip_mp3.bin"
};
#pragma data(data)
// whiskers_worried: 4096 bytes
#pragma section( whiskers_worried, 0)
#pragma region( whiskers_worried, 0x58000, 0x59000, , , {whiskers_worried} )
#pragma data(whiskers_worried)
__export const char whiskers_worried[] = {
	#embed 4096 "../assets/chip_wor.bin"
};
#pragma data(data)
// controllers: 4096 bytes
#pragma section( controllers, 0)
#pragma region( controllers, 0x59000, 0x5A000, , , {controllers} )
#pragma data(controllers)
__export const char controllers[] = {
	#embed 4096 "../assets/controllers.bin"
};
#pragma data(data)


static uint8_t beat = 0;



//PROTOTYPES
void setup(void);
void updateWalkState(void);
void quitGracefully(void);
void switchMode(uint8_t);
void writePlaying(const char *);
void dealPads(void);


//GLOBALS
bool shiftLatch = false;

//FUNCTIONS
static void updateNotesSprite(void)
{
	spriteSetVisible(4, modePlay != MODE_SILENCE && !globalPause);
}

static void onTuneEnded(void)
{
	switchMode(MODE_SILENCE);   // quiets the old mode and sets modePlay
	updateNotesSprite();        // hides sprite 4
}



void moveWhiskers(void)
{
	int16_t dx = 0, dy = 0;
	uint16_t x, y;

	
	if(modalActive) return;
/*	
	textGotoXY(0,0); textSetColor(3,0);
textPrint((beat++ & 8) ? "*" : " ");      // blinks while timer1 branch runs

// in moveWhiskers(), first line:
textGotoXY(2,0); textPrint(modalActive ? "M" : "-");
*/
	
	if(rightDown)      dx =  1;
	else if(leftDown)  dx = -1;

	if(downDown && !upDown)      dy =  1;
	else if(upDown && !downDown) dy = -1;

	if(!dx && !dy) return;

	spriteGetPosition(0, &x, &y);
	if((dx < 0 && x <= MOVE_X_MIN) || (dx > 0 && x >= MOVE_X_MAX)) dx = 0;
	if((dy < 0 && y <= MOVE_Y_MIN) || (dy > 0 && y >= MOVE_Y_MAX)) dy = 0;

	if(dx || dy)
	{
		if(dx) spriteSetPos(0, dx, 0);
		if(dy) spriteSetPos(0, 0, dy);
		
		spriteGetPosition(0, &x, &y);
		x+=13;
		y+=30;
		uint8_t zone = getShadowColor(x,y);   // pick the point you paint zones at

/*
		char s[2] = { "0123456789ABCDEF"[zone & 15], 0 };
		textGotoXY(0, 0);   // or whatever your text-position call is
		textPrint(s);
*/
		if(zone == 2) 
			{
			if(!modal_TurnTable && !turnTableLatched) enterTurnTableModal();
			}
		else turnTableLatched = false;
		
		if(zone == 3)
			{
			if(!modal_Couch && !couchLatched) enterCouchModal();
			}
		else couchLatched = false;
		if(zone == 4 && !roomChangeLatched)
			{
			if(!room2) 
				{
				room2 = true;
				if(!tuneEnded)
					{					
					tuneEnded = false; 
					onTuneEnded(); 
					wipeStatusBar();
					
					swapBMLogo(LOGO_NIL);
					}
				spriteSwapRooms();
				swapRoom(2);
				}
			else
				{
				room2 = false;
				spriteSwapRooms();
				swapRoom(1);
				}
			//bitmapSetVisible(2, false);
			}
		else if(zone !=4) roomChangeLatched = false;
	}
}


void dealTimers()
{	
	if(PEEK(INT_PENDING_0)&0x20) //when the timer1 delay is up, go here
		{
		POKE(INT_PENDING_0,0x20); //clear pending timer1 
		
		if(!modal_TurnTable)
					{
					animationUpdate(&whiskersL, 1);
					animationUpdate(&whiskersR, 1);
					
					spriteFrameChange(0, 32, animationGetIndex(&whiskersL), 0x2B000);
					spriteFrameChange(1, 32, animationGetIndex(&whiskersR), 0x2B000);
					if(modePlay != MODE_SILENCE && !globalPause)
						{
						animationUpdate(&notesSAS, 1);
						spriteFrameChange(4, 16, animationGetIndex(&notesSAS), SPRITES_ADDRESS_NOTES);
						}

					//called once per refresh tick
					moveWhiskers();
					}
		//relaunchTimer(getTimerAbsolute(TIMER_FRAMES) + TIMER_REFRESH_DELAY, &refresh_Timer);
		setTimer1(1);
		}

}

void setup()
{
	
//Memory tweaks to high areas
POKE(MMU_IO_CTRL,0x40); //	move io devices to high memory
//Vicky Master Control Registers. XXX are unused bits
// XXX GAMMA  SPRITE   TILE  | BITMAP  GRAPH  OVRLY  TEXT
POKE(VKY_MSTR_CTRL_0, 0b00101111); //sprite,graph,overlay,text
// XXX XXX  FON_SET FON_OVLY | MON_SLP DBL_Y  DBL_X  CLK_70
POKE(VKY_MSTR_CTRL_1, 0b00010000); //font overlay, double height text, 320x240 at 60 Hz;


//layer choices, assign one of these bitfield chunks...
//b000: bitmap layer 0
//b001: bitmap layer 1
//b010: bitmap layer 2
//b100: tile map layer 0
//b101: tile map layer 1
//b110: tile map layer 2

//...to the 3 available slots marked 000, 111 and 222. X are unused bits
// X111 | X000 - vicky layers: slot 1 and slot 0
POKE(VKY_LAYER_CTRL_0, 0b00010000); //bitmap 1 in slot 1 - bitmap 0 in slot 0
// XXXX | X222 - vicky layers: slot 2
POKE(VKY_LAYER_CTRL_1, 0b00000010); //bitmap 2 in slot 2
	
textEnableBackgroundColors(true);

initMyBitmap();
swapBMLogo(LOGO_NIL);

quitGracefully();

initMySprites();
stateChange(&whiskersL, &SIT_L);
stateChange(&whiskersR, &SIT_R);

//font glyph custom note
POKE(MMU_IO_CTRL, 0x01);
uint8_t i=0;
uint8_t customGlyph[8] = {0x0c,0x0b,0x08,0x08,0x78,0xf8,0x70,0x00}; //musical note glyph
for(i=0;i<8;i++)
{
	POKE(0xC000 + (uint16_t)i, customGlyph[i]);
}
POKE(MMU_IO_CTRL, 0x00);
for(uint8_t j=0;j<60;j++) //text character and color matrix wipe
{
	for(i=0;i<80;i++)
		{
			POKE(MMU_IO_CTRL,0x02);
			POKE(0xC000 + (uint16_t)i + (uint16_t)j*80, 0x20);
			POKE(MMU_IO_CTRL,0x03);
			POKE(0xC000 + (uint16_t)i + (uint16_t)j*80, 0x00);
		}
}
POKE(MMU_IO_CTRL, 0x00);
//file picker setup
initFPR();
	
//text status bar	
wipeStatusBar();

//VS1053b clock boost
boostVSClock();


//controllers
addy[0] = 0x0000; //keyboard by default

setTimer1(1); //for animations
//initMyTimers();
//initMySprites();

}
void quitGracefully()
{
	opl3_quietAll();
	midiShutAllChannels();
	midiShutUp();
	shutPSG();
	clearSIDRegisters();
}

static void refreshFramesNow(void)
{
	spriteFrameChange(0, 32, animationGetIndex(&whiskersL), 0x2B000);
	spriteFrameChange(1, 32, animationGetIndex(&whiskersR), 0x2B000);
}

//helper: decide the animation from what's currently held
void updateWalkState(void)
{
    rightDown = kRightDown || jRightDown;
	leftDown = kLeftDown || jLeftDown;
	upDown = kUpDown || jUpDown;
	downDown = kDownDown || jDownDown;
	
	if(modal_TurnTable) return;   // don't touch the turntable pose
	
	if(rightDown)      facingRight = true;
	else if(leftDown)  facingRight = false;

	if(rightDown || leftDown || upDown || downDown)
	{
		if(facingRight) { stateChange(&whiskersL, &WALKR_L); stateChange(&whiskersR, &WALKR_R); }
		else            { stateChange(&whiskersL, &WALKL_L); stateChange(&whiskersR, &WALKL_R); }
	}
	else
	{
		if(!room2) stateChange(&whiskersL, facingRight ? &SIT_L : &SIT_L); 
		else 
		{
			if(modal_Couch)
				stateChange(&whiskersL, facingRight ? &SIT_L_BENCH : &SIT_L_BENCH);
			else stateChange(&whiskersL, facingRight ? &SIT_L : &SIT_L); 
		}
		stateChange(&whiskersR, &SIT_R);
	}
	refreshFramesNow();
}

void invokeBench()
{
uint8_t fileOpenedErrorCode;
upDown = false; downDown = false; rightDown = false; leftDown = false;
invokePause(true);

if(getTheFile_far(FPName) !=0) 
	{
	exitTurnTableModal();
	initMyTimers();	
	return;
	}
const char *extension = FPName + strlen(FPName) - 3; //gets last 3 characters
if(strcmp(extension,"mid") == 0 || strcmp(extension,"MID") == 0) 
	{
	if(loadSMFile(FPName, 0x180000) == 0)
		{
		textPrint(FPName);
		prepMIDIForPlay(0x180000);
		switchMode(MODE_MIDI);
		textGotoXY(0,TEXT_STATUS_Y);
		writePlaying(FPName);
		}
	}
}

void invokeTurnTable()
{
uint8_t fileOpenedErrorCode;
upDown = false; downDown = false; rightDown = false; leftDown = false;
invokePause(true);

swapBMLogo(LOGO_NIL);

if(getTheFile_far(FPName) !=0) 
	{
	invokePause(false);
	exitTurnTableModal();
	initMyTimers();	
	swapBMLogo(modePlay);
	return;
	}
const char *extension = FPName + strlen(FPName) - 3; //gets last 3 characters

textGotoXY(0,TEXT_STATUS_Y);
textSetColor(6,15);
textPrint("Loading...");


if(strcmp(extension,"mid") == 0 || strcmp(extension,"MID") == 0) 
	{
	if(loadSMFile(FPName, 0x180000) == 0)
		{
		textPrint(FPName);
		prepMIDIForPlay(0x180000);
		switchMode(MODE_MIDI);
		textGotoXY(0,TEXT_STATUS_Y);
		writePlaying(FPName);
		}
	}

if(strcmp(extension,"vgm") == 0 || strcmp(extension,"VGM") == 0) 
	{
	if(loadVGMIntoRam(FPName, 0x180000) == 0)
		{
		textPrint(FPName);
		prepVGMForPlay(0x180000);
		switchMode(MODE_VGM);
		textGotoXY(0,TEXT_STATUS_Y);
		writePlaying(FPName);
		}
	}
if(strcmp(extension,"tr2") == 0) 
	{
	if(loadTR2File(FPName, 0x180000) == 0)
		{
		textPrint(FPName);
		prepTR2ForPlay(0x180000);
		switchMode(MODE_TR2);
		textGotoXY(0,TEXT_STATUS_Y);
		writePlaying(FPName);
		}
	}
if(strcmp(extension,"rsp") == 0 || strcmp(extension,"rsn") == 0 ) 
	{
	if(loadSIDIntoRam(FPName, 0x180000) == 0)
		{
		textPrint(FPName);
		prepSIDForPlay(0x180000, 0);
		switchMode(MODE_SID);
		textGotoXY(0,TEXT_STATUS_Y);
		writePlaying(FPName);
		}
	}
if(strcmp(extension,"mp3") == 0)
	{
	if(prepMP3ForPlay(FPName) == 0)
		{
		textPrint(FPName);
		switchMode(MODE_MP3);
		textGotoXY(0,TEXT_STATUS_Y);
		writePlaying(FPName);
		}
	}

swapBMLogo(modePlay);
invokePause(false);
exitTurnTableModal();
initMyTimers();	
}


void dealPads()
{
	uint8_t pad;
	uint8_t joy0, joy1;
	
	switch(addy[0])
	{
		case 0x0000: //nothing set 
			return;
		case PAD0:
		case PAD1:
		case PAD2:
		case PAD3:
			pollNES();
			pad = padState(PEEK(addy[0]));
			
			jUpDown    = (pad & NES_UP)!= 0;
			jDownDown  = (pad & NES_DOWN)!= 0;
			if(jDownDown && modal_Couch) exitCouchModal();
			jLeftDown  = (pad & NES_LEFT)!= 0;
			jRightDown = (pad & NES_RIGHT)!= 0;
			updateWalkState();
			break;
		
		case PAD0_S:
		case PAD1_S:
		case PAD2_S:
		case PAD3_S:
			pollSNES();
			pad = padState(PEEK(addy[0]-(uint16_t)1));
			jUpDown    = (pad & SNES_UP)!= 0;
			jDownDown  = (pad & SNES_DOWN)!= 0;
			if(jDownDown && modal_Couch) exitCouchModal();
			jLeftDown  = (pad & SNES_LEFT)!= 0;
			jRightDown = (pad & SNES_RIGHT)!= 0;
			updateWalkState();
			break;
		case JOY_0:
			joy0 = ~PEEK(JOY_0);
			
			jUpDown    = (joy0 & JOY_UP)!= 0;
			jDownDown  = (joy0 & JOY_DOWN)!= 0;
			if(jDownDown && modal_Couch) exitCouchModal();
			jLeftDown  = (joy0 & JOY_LEFT)!= 0;
			jRightDown = (joy0 & JOY_RIGHT)!= 0;
			updateWalkState();
			break;
		case JOY_1:
			joy1 = ~PEEK(JOY_1);
			
			jUpDown    = (joy1 & JOY_UP)!= 0;
			jDownDown  = (joy1 & JOY_DOWN)!= 0;
			if(jDownDown && modal_Couch) exitCouchModal();
			jLeftDown  = (joy1 & JOY_LEFT)!= 0;
			jRightDown = (joy1 & JOY_RIGHT)!= 0;
			updateWalkState();
			break;
			
	}	
	
}
uint8_t dealKeyboard()
{
if(kernelEventData.type == kernelEvent(key.PRESSED))
		{
		if(modalActive && kernelEventData.u.key.raw != 0x92) //escape
		{
			if(modal_TurnTable || modal_Couch) exitTurnTableModal();
			return 0; //we'll get back here in a jiffy
		}
		switch(kernelEventData.u.key.raw)
			{
			case 0x00:
			case 0x01: //shifts
				shiftLatch = true;
				break;
			case 0x77: //W
			case 0xB6: //up
				kUpDown = true;
				updateWalkState();
				break;
			case 0x61: //A
			case 0xB8: //left
				kLeftDown = true;
				updateWalkState();
				break;
			case 0x64: //D
			case 0xB9: //right
				kRightDown = true;
				updateWalkState();
				break;
			case 0x73: //S
			case 0xB7: //down
				kDownDown = true;
				if(modal_Couch) exitCouchModal();
				updateWalkState();
				break;
			case 0x65: //E
				flipSprite(0, false, true);
				flipSprite(1, false, true);
				break;
			case 0x20: //space
				 globalPause = !globalPause;
				 invokePause(globalPause);
				 break;
		    case 0x81: //F1
				showHelp();
				break;
			case 0x83: //F3
				swapBMLogo(LOGO_NIL);
				showCredits();
				swapBMLogo(modePlay);
				break;
			case 0x87: //F7
				if(!room2 && !modal_TurnTable && !turnTableLatched && shiftLatch)
				{
					enterTurnTableModal();
					invokeTurnTable();
					shiftLatch = false;
				}
				break;
			case 0xBC: //RUN/STOP
				return 1;
			default:
					break;
			}
		}
	else if(kernelEventData.type == kernelEvent(key.RELEASED))
		{
			switch(kernelEventData.u.key.raw)
			{
			case 0x00:
			case 0x01: //shifts
				shiftLatch = false;
				break;
			case 0x77: //W
			case 0xB6: //up
				kUpDown = false;
				updateWalkState();
				break;
			case 0x61: //A
			case 0xB8: //left
				kLeftDown = false;
				updateWalkState();
				break;
			case 0x64: //D
			case 0xB9: //right
				kRightDown = false;
				updateWalkState();
				break;
			case 0x73: //S
			case 0xB7: //down
				kDownDown = false;
				updateWalkState();
				break;
			default: //any other key: ignore, don't touch the walk
				break;
			}
		}
return 0;
}

int main(int argc, char *argv[]) {

setup();
	
showSplash();

//Game Loop!
while(true) 
	{
	//Music playback

	switch(modePlay)
		{
		case MODE_MIDI:
			if(isMIDIDone()) tuneEnded = true;
			midiLoopPass();
			break;
		case MODE_TR2:
			if(isTR2Done()) tuneEnded = true;
			TR2LoopPass();
			break;
		case MODE_VGM:
			if(isVGMDone()) tuneEnded = true;
			VGMLoopPass();
			break;
		case MODE_SID:
			if(isSIDDone()) tuneEnded = true;
			SIDLoopPass();
			break;
		case MODE_MP3:
			if(isMP3Done()) tuneEnded = true;
			MP3LoopPass();
		}
	
	if(tuneEnded) { 
		tuneEnded = false; 
		onTuneEnded(); 
		wipeStatusBar();
		
		swapBMLogo(LOGO_NIL);
		}
		
	//Kernel stuff
	dealPads();	
	while(pullEvent())
		{
			if(dealKeyboard()) 
				{
				quitGracefully();
				swapBMLogo(MODE_WHI);
				textGotoXY(28,18);
				textSetColor(3,0);
				textPrint("Quit? For reals?? (y/n)");
				textGotoXY(28,18);
				while(true)
					{
					if(!pullEvent()) continue;
					if(kernelEventData.type == kernelEvent(key.PRESSED))
						{
						if(kernelEventData.u.key.raw == 0x79) return 0; //pressed y, leave
						if(kernelEventData.u.key.raw == 0x6E) break; //pressed n, stay
						}
					}
				
				swapBMLogo(modePlay); //restore
				textPrint("                       ");
				initMyTimers();	
				}
		}
	if(modal_TurnTable) invokeTurnTable();	
	//Sprite animation engine
	dealTimers();
		
	}
return 0;
}


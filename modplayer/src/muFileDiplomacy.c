#ifndef MUFILEDIPLOMACY_C
#define MUFILEDIPLOMACY_C

#include "f256lib.h"
#include "muFileDiplomacy.h"

static struct { uint8_t type; uint8_t raw; } kq[KQ];   // just what dealKeyboard needs
static uint8_t kqHead=0, kqTail=0;


static void stashKeyEvent(void) {
	uint8_t t = kernelEventData.type, next;
	if(t != kernelEvent(key.PRESSED) && t != kernelEvent(key.RELEASED)) return;
	next = (kqHead+1) & (KQ-1);
	if(next == kqTail) return;                          // full
	kq[kqHead].type = t;
	kq[kqHead].raw  = kernelEventData.u.key.raw;
	kqHead = next;
}

int16_t fileReadDiplomat(void *buf, uint16_t nbytes, uint16_t nmemb, uint8_t *fd) {
	char    *data     = (char *)buf;
	int16_t  read     = 0;
	uint16_t bytes    = nbytes * nmemb;
	int16_t  returned;

	while (read < bytes) {
		returned = kernelReadDiplomat(*fd, data + read, bytes - read);
		if (returned < 0) return -1;
		if (returned == 0) break;
		read += returned;
	}

	return read / nbytes;
}

bool pullEvent(void) {
	if(kqTail != kqHead) {
		kernelEventData.type = kq[kqTail].type;
		kernelEventData.u.key.raw = kq[kqTail].raw;
		kqTail = (kqTail+1) & (KQ-1);
		return true;
	}
	kernelEventData.type = 0;       // stale-event guard (type 0 looks unused; check your header)
	kernelNextEvent();
	return kernelEventData.type != 0;
}
#undef EOF
int16_t kernelReadDiplomat(uint8_t fd, void *buf, uint16_t nbytes) {

	// STDIN
	if (fd == 0) {
		*(char *)buf = f256getchar();
		return 1;
	}

	if (nbytes > 256) nbytes = 256;

	kernelArgs->u.file.read.stream = fd;
	kernelArgs->u.file.read.buflen = nbytes;
	kernelCall(File.Read);
	if (kernelError) return -1;

	for(;;) {
		kernelEventData.type = 0;               // stale-event guard
		kernelNextEvent();                      // raw queue, NOT pullEvent()
		if(kernelEventData.type == 0) continue;
		if(kernelEventData.type == kernelEvent(file.DATA)) {
			kernelArgs->u.common.buf = buf;
			kernelArgs->u.common.buflen = kernelEventData.u.file.u.data.delivered;
			kernelCall(ReadData);
			return kernelEventData.u.file.u.data.delivered;
		}
		if(kernelEventData.type == kernelEvent(file.EOF))   return 0;
		if(kernelEventData.type == kernelEvent(file.ERROR)) return -1;
		stashKeyEvent();                        // keep keys; other events are dropped
	}
}
#define EOF (-1)

#endif //MUFILEDIPLOMACY_C



#ifndef __MUUTILS_C
#define __MUUTILS_C

#include "f256lib.h"
#include "muUtils.h"

//will return true if the machine id is detected as a K or K2, enabling peace of mind to use its exclusive features
bool isAnyK(void) {
	uint8_t value = PEEK(0xD6A7) & 0x1F;
	return (value >= 0x10 && value <= 0x16);
}

bool isK2(void) {
	uint8_t value = PEEK(0xD6A7) & 0x1F;
	return (value == 0x11);
}

//will return true if the optical keyboard is detected, enabling the case embedded LCD present as well
bool hasCaseLCD(void) {
	//if the 2nd to last least significant bit is set, it's a mechanical keyboard, LCD not available, don't use it!
	//if it's cleared, then it's an optical keyboard, you can use it!
	return ((PEEK(0xDDC1) & 0x02)==0); //here the bit is cleared, so it's true it's an optical keyboard, it "hasCaseLCD"
}

//returns yes if it's a Jr2 or a K2 in classic mmu mode (ie if it supports a VS1053b or SAM2695)
bool isWave2(void) {
	uint8_t mid;
	mid = PEEK(0xD6A7)&0x3F;
	return (mid == 0x22 || mid == 0x11 || mid == 0x02); //22 is Jr2 and 11 is K2
}

//graphics background cleardevice
void wipeBitmapBackground(uint8_t blue, uint8_t green, uint8_t red) {
	byte backup;
	backup = PEEK(MMU_IO_CTRL);
	POKE(MMU_IO_CTRL,0);
	POKE(0xD00D,blue); //force black graphics background
	POKE(0xD00E,green);
	POKE(0xD00F,red);
	POKE(MMU_IO_CTRL,backup);
}	

//realTextClear: manually changes to MMU page 2 and covers the whole 80x60 text layer
//blank characters. the f256lib.h's textClear seems to only erase part of the screen only.
void realTextClear() {
	uint16_t c;
	POKE(MMU_IO_CTRL,0x02);
	for(c=0;c<4800;c++)
	{
		POKE(0xC000+c,0x20);
	}
	POKE(MMU_IO_CTRL,0x00);
}


//codec enable all lines
void openAllCODEC() {
	POKE(0xD620, 0x1F);
	POKE(0xD621, 0x2A);
	POKE(0xD622, 0x01);
	while(PEEK(0xD622) & 0x01);
}


#endif //__MUUTILS_C
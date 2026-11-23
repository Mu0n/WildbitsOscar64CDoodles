#ifndef MYBITMAP_C
#define MYBITMAP_C

#include "f256lib.h"
#include "myBitmap.h"

void initMyBitmap()
{
	bitmapSetVisible(2,true);
	bitmapSetAddress(2,BM_BASE);
	
	bitmapSetVisible(0,false);
	
	bitmapSetAddress(1,BM_BASE2);
	bitmapSetVisible(1,true);
	
	POKE(MMU_IO_CTRL,1);  //MMU I/O to page 1
	// Set up CLUT0.
	for(uint16_t c=0;c<1024;c++)  //copy clut0 for regular graphics
		{
		POKE(VKY_GR_CLUT_0+c, FAR_PEEK(PAL_BASE+c));
		}
	POKE(MMU_IO_CTRL, 0);
}

void swapRoom(uint8_t which)
{
	bitmapSetVisible(2,false);
	bitmapSetAddress(2,which == 1 ? BM_BASE : BM_ROOM2);
	bitmapSetVisible(2,true);
}
void swapBMLogo(uint8_t which)
{
	uint8_t dat;
	uint32_t off;

	switch(which)
	{
		case LOGO_PSG:
			off = BM_PSG;
			break;
		case LOGO_MID:
			off = BM_MID;
			break;
		case LOGO_SID:
			off = BM_SID;
			break;
		case LOGO_OPL:
			off = BM_OPL;
			break;
		case LOGO_MP3:
			off = BM_MP3;
			break;
		case LOGO_WHI:
			off = BM_WOR;
			break;
		default:
			off = 0;
			break;
	}

	bitmapSetVisible(1,false);
	
	for(uint8_t y = 0; y < 64; y++)
	{
		for(uint8_t x = 0; x < 64; x++)
		{
			dat = FAR_PEEK(off + (uint32_t)x + (uint32_t)y*64);
			if(off == 0) FAR_POKE(BM_BASE2 + 0x237A + (uint32_t)x + (uint32_t)y*320, 0);
			else FAR_POKE(BM_BASE2 + 0x237A + (uint32_t)x + (uint32_t)y*320, dat);		
		}
	}
	
	bitmapSetVisible(1,true);
}

#endif //MYBITMAP_C



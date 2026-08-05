#ifndef MYBITMAP_C
#define MYBITMAP_C

#include "f256lib.h"
#include "myBitmap.h"

void initMyBitmap()
{
	bitmapSetVisible(0,true);
	bitmapSetAddress(0,BM_BASE);
	
	POKE(MMU_IO_CTRL,1);  //MMU I/O to page 1
	// Set up CLUT0.
	for(uint16_t c=0;c<1024;c++)  //copy clut0 for regular graphics
		{
		POKE(VKY_GR_CLUT_0+c, FAR_PEEK(PAL_BASE+c));
		}
	POKE(MMU_IO_CTRL, 0);
}

#endif //MYBITMAP_C



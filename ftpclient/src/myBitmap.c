#ifndef MYBITMAP_C
#define MYBITMAP_C

#include "f256lib.h"
#include "myBitmap.h"
#include "textareas.h"

void initMyBitmap()
{
	
	POKE(MMU_IO_CTRL,1);  //MMU I/O to page 1
	// Set up CLUT0.
	for(uint16_t c=0;c<1024;c++)  //copy clut0 for regular graphics
		{
		POKE(VKY_GR_CLUT_0+c, FAR_PEEK(PAL_BASE+c));
		}
	POKE(MMU_IO_CTRL, 0);
	
	bitmapSetColor(0);
	bitmapClear();
	bitmapSetColor(2);
	bitmapLine(SCR_REMOTE_X*4,    SCR_REMOTE_Y*4-1,   SCR_REMOTE_X_END*4 ,SCR_REMOTE_Y*4-1); //top
	bitmapLine(SCR_REMOTE_X*4,    SCR_REMOTE_Y*4-1,   SCR_REMOTE_X*4     ,(SCR_REMOTE_Y_END+1)*4); //left
	bitmapLine(SCR_REMOTE_X_END*4,SCR_REMOTE_Y*4-1,   SCR_REMOTE_X_END*4 ,(SCR_REMOTE_Y_END+1)*4); //right
	bitmapLine(SCR_REMOTE_X*4,(SCR_REMOTE_Y_END+1)*4, SCR_REMOTE_X_END*4, (SCR_REMOTE_Y_END+1)*4); //bottom
	
	bitmapSetColor(4);
	bitmapLine(SCR_LOCAL_X*4,    SCR_LOCAL_Y*4-1,   SCR_LOCAL_X_END*4 ,SCR_LOCAL_Y*4-1); //top
	bitmapLine(SCR_LOCAL_X*4,    SCR_LOCAL_Y*4-1,   SCR_LOCAL_X*4     ,(SCR_LOCAL_Y_END+1)*4); //left
	bitmapLine(SCR_LOCAL_X_END*4,SCR_LOCAL_Y*4-1,   SCR_LOCAL_X_END*4 ,(SCR_LOCAL_Y_END+1)*4); //right
	bitmapLine(SCR_LOCAL_X*4,(SCR_LOCAL_Y_END+1)*4, SCR_LOCAL_X_END*4, (SCR_LOCAL_Y_END+1)*4); //bottom
	
	bitmapSetVisible(0, true);bitmapSetVisible(1, false);bitmapSetVisible(2, false);
}

#endif //MYBITMAP_C



#ifndef MOUSEAREAS_C
#define MOUSEAREAS_C

#include "f256lib.h"
#include "mouseAreas.h"
#include "textareas.h"

uint8_t mouseInWhere()
{
	int16_t newX, newY;
	
	newX = (int16_t)PEEKW(PS2_M_X_LO);
	newY = (int16_t)PEEKW(PS2_M_Y_LO);
	
	if(newX >= (SCR_REMOTE_X*8) && newX <= (SCR_REMOTE_X_END*8)
		&& newY >= (SCR_REMOTE_Y*8) && newY <= ((SCR_REMOTE_Y_END+1)*8)) return 1; //in remote
	else if(newX >= (SCR_LOCAL_X*8) && newX <= (SCR_LOCAL_X_END*8)
		&& newY >= (SCR_LOCAL_Y*8) && newY <= ((SCR_LOCAL_Y_END+1)*8)) return 2; //in local
	
	return 0; //none of the 2 directories
}

bool rowFromMouse(uint8_t *row, uint8_t whichArea)
{
	int16_t y = (int16_t)PEEKW(PS2_M_Y_LO);
	uint8_t r;
	uint8_t start=0, end=0;
	
	if(whichArea==1){start = SCR_REMOTE_Y; end = SCR_REMOTE_Y_END;}
	else if(whichArea==2){start = SCR_LOCAL_Y; end = SCR_LOCAL_Y_END;}
	else return false;
	
	if(y < start * 8)
		return false;
	
	r = (uint8_t)(y/8);
	
	if(r < start || r > end)
		return false;
	
	*row = r;
	return true;
}



#endif //MOUSEAREAS_C
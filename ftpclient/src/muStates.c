#ifndef MUSTATES_C
#define MUSTATES_C

#include "f256lib.h"
#include "muStates.h"
#include "textareas.h"
#include "mouseareas.h"

MouseStates gState;

void initState()
{
gState.state = STATE_OUTSIDING;
gState.stateBefore = STATE_OUTSIDING;
}
/*

			st->stateBefore = st->state; //remember in case it gets cancelled
*/

void stateHandle(MouseStates *st, MouseEvent ev)
{
	switch(ev)
		{
		case ET_DELTA_ANALYZE:
			uint8_t newArea = mouseInWhere();
			if(newArea == st-> oldArea) break;
			
			if(newArea == 1) //was in oldArea 2 (local)
				{
				//remove all highlights in local
				}
			else if(newArea == 2) //was in oldArea 1 (remote)
				{
				//remove all highlights in remote
				}
			else 
				{
				//remove all highlights
				}
			//TODO highlight changes if in either remoting or localing
			
			
			break;
		case ET_CLICK_ANALYZE:
			break;
		case ET_DOWNLOAD:
			if(st->originClick == 1) 
			break;
		case ET_UPLOAD:
			break;
		}
}


#endif //MUSTATES_C
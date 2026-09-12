#ifndef MUSTATES_C
#define MUSTATES_C

#include "f256lib.h"
#include "muStates.h"
#include "textareas.h"
#include "mouseareas.h"

AreaStates gState[2]; //[0]=remote [1]=local

void initStates()
{
gState[0].state = STATE_EMPTY; //needs a ftp connection and a listing to get going
gState[0].area = 1;
gState[0].oldHighlight = 255;

gState[1].state = STATE_FILLED; //populated at the start
gState[1].area = 2;
gState[1].oldHighlight = 255;
}

void handleHighlight(uint8_t area)
{
uint8_t newHighlight;
rowFromMouse(&newHighlight,area);

if(newHighlight ==gState[area-1].oldHighlight) return;

forceFileHighlight(13,1,newHighlight, area); //yellow on red
forceFileHighlight(15,0,gState[area-1].oldHighlight, area); //white on black
gState[area-1].oldHighlight = newHighlight;
}

uint8_t stateHandle(AreaEvent ev, uint8_t newArea)
{
bool dealtUnclickOnce = false; //unclick will be dealt swiftly in 1 pass only
uint8_t otherArea = (newArea == 1 ? 2 : 1);

for(uint8_t i = 0; i<2; i++)
{	
	switch(ev)
		{
		case ET_LIST:
			if(gState[i].state == STATE_EMPTY)
				{
				gState[i].beforeState = STATE_EMPTY;
				gState[i].state = STATE_FILLED;
				}
			break;
		case ET_CLEAR:
			if(gState[i].state == STATE_FILLED || gState[i].state == STATE_ENTERED)
				{
				gState[i].beforeState = STATE_FILLED;
				gState[i].state = STATE_EMPTY;
				}
			break;
		case ET_MOUSEMOVE:
			switch(gState[i].state)
				{
				case STATE_EMPTY: //ignore a mouse move completely 
					break;
				case STATE_FILLED:
					if(newArea == gState[i].area) 
						{
						gState[i].beforeState = STATE_FILLED;
						gState[i].state = STATE_ENTERED;
						//textPrint(" entered area ");textPrintInt(gState[i].area);
						//handleHighlight(newArea);
						}
					break;
				case STATE_ENTERED:
					if(newArea != gState[i].area) //we left the area
						{
						gState[i].beforeState = STATE_ENTERED;
						gState[i].state = STATE_FILLED;
						//textPrint(" left area ");textPrintInt(gState[i].area);
						//turn off ongoing highlight
						
						forceFileHighlight(15,0,gState[i].oldHighlight, gState[i].area); //white on black
						gState[i].oldHighlight = 255;
						}
					else{
						handleHighlight(newArea);
						}
					break;
				case STATE_DRAGOUT:
					//manage new sprite position
					break;
				}
			break;
		case ET_MOUSECLICK:
			if(gState[i].state == STATE_ENTERED && newArea == gState[i].area)
				{
				gState[i].beforeState = STATE_ENTERED;
				gState[i].state = STATE_DRAGOUT;
				//textPrint(" click in area ");textPrintInt(gState[i].area);
				}
			break;
		case ET_MOUSEUNCLICK: //ignore index sweep and just do this event once
			if(dealtUnclickOnce == false)
				{
				if(newArea == 0) //click dropped outside
					{
					if(gState[0].state == STATE_DRAGOUT) gState[0].state = gState[0].beforeState; //revert those if needed
					if(gState[1].state == STATE_DRAGOUT) gState[1].state = gState[1].beforeState;
					break;
					}
				else if(gState[newArea - 1].state == STATE_EMPTY) //not populated yet
					{
					if(gState[otherArea - 1].state == STATE_DRAGOUT) gState[otherArea - 1].state = STATE_FILLED; //revert this if needed
					//textPrint(" aborted click in ");textPrintInt(newArea);
					}
				else if(gState[newArea - 1].state == STATE_ENTERED) //found where unclick happened with click from outside
					{
					if(gState[otherArea - 1].state == STATE_DRAGOUT)//xfer scenario
						{
						gState[newArea - 1].state = STATE_ENTERED;
						gState[otherArea - 1].state = gState[otherArea - 1].beforeState;
						gState[otherArea - 1].beforeState = STATE_DRAGOUT;
						textPrint(" xfer from ");textPrintInt(otherArea);textPrint(" to ");textPrintInt(newArea);
						if(newArea == 2) //download to local
							{
							return 2; //force download from remote to local
							}
						else if(newArea == 1) 
							{
							return 1;//force upload to remote
							}
						}
					else //did not come from the other directory, so it's an aborted xfer
						{
						//textPrint(" useless click dropped in ");textPrintInt(newArea);
						}
					}
				else if(gState[newArea - 1].state == STATE_DRAGOUT)
					{
					gState[newArea - 1].state = STATE_ENTERED;
					//textPrint(" aborted click in ");textPrintInt(newArea);
					}
				
				dealtUnclickOnce = true;
				}
			break;
			
			
		}
	}	
return 0; //no xfer to perfoem
}



#endif //MUSTATES_C
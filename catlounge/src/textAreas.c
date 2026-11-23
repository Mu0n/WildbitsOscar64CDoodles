#ifndef TEXTAREAS_C
#define TEXTAREAS_C

#include "f256lib.h"
#include "textAreas.h"
#include "muPads.h"
#include "mySprites.h"

static uint8_t controllerIndex = 0;
					
uint8_t spriteFrameForCandidate(uint16_t candidate)
{
switch(candidate)
	{
	case PAD0:
	case PAD1:
	case PAD2:
	case PAD3:
		return 0;
	case PAD0_S:
	case PAD1_S:
	case PAD2_S:
	case PAD3_S:
		return 1;
	case JOY_0:
	case JOY_1:
		return 3;
	default:
		return 2; //keyb
	}
	
}
char *labelConfirm(uint16_t candidate)
{
	switch(candidate)
		{
		case PAD0:
			return "Port 1";
		case PAD1:
			return "Port 2";
		case PAD2:
			return "Port 3";
		case PAD3:
			return "Port 4";
			return 0;
		case PAD0_S:
			return "Port 1";
		case PAD1_S:
			return "Port 2";
		case PAD2_S:
			return "Port 3";
		case PAD3_S:
			return "Port 4";
		case JOY_0:
			return "Port 2";
		case JOY_1:
			return "Port 1";
		default:
			return "      "; //keyb
		}
}	
void writePlaying(const char *name)
{
wipeStatusBar();
textGotoXY(0,TEXT_STATUS_Y);
textPrint("Playing. ");
textPutChar(0);
textPrint(" ");textPrint(name);textPrint(" ");
textPutChar(0);
}

void wipeStatusBar()
{
textGotoXY(0,TEXT_STATUS_Y);
textSetColor(6,15);
for(uint8_t i=0; i<80;i++) textPrint(" ");
}

void waitForAnyKey(void)
{
for(;;)
	{
		kernelNextEvent();
		if(kernelEventData.type == kernelEvent(key.PRESSED)) break;
	}
}

void commonBoxTop(uint8_t start, uint8_t end, uint8_t y)
{
	//box
textSetColor(14,6); //cyan over dark blue
textGotoXY(start,y);
textPutChar(160);
for(uint8_t i = start; i<end - 2; i++) textPutChar(150); 
textPutChar(161);
}
void commonBoxBottom(uint8_t start, uint8_t end, uint8_t y)
{
	//box
textSetColor(14,6); //cyan over dark blue
textGotoXY(start,y);
textPutChar(162);
for(uint8_t i = start; i<end - 2; i++) textPutChar(150); 
textPutChar(163);
}

void showSplash(void)
{
uint8_t delayInFrames = 240;
//box
commonBoxTop(SCR_SPLASH_X, SCR_SPLASH_X_END, SCR_SPLASH_Y);
textPrintNewLine(DLG_SPLASH);

	//display help
textPutChar(130);textSetColor(13,6);textPrint("Welcome to Whiskers' Audiophile Lounge!");fillSpaceToEnd(SCR_SPLASH_X_END-1);textSetColor(14,6);textPutChar(130); textPrintNewLine(DLG_SPLASH);

textSetColor(14,6); //cyan over dark blue
textPutChar(130);fillSpaceToEnd(SCR_SPLASH_X_END-1);textPutChar(130); textPrintNewLine(DLG_SPLASH);
textPutChar(130);textPrint("  6 music files supported!");fillSpaceToEnd(SCR_SPLASH_X_END-1);textPutChar(130); textPrintNewLine(DLG_SPLASH);
textPutChar(130);textPrint("  [F1] to get help");fillSpaceToEnd(SCR_SPLASH_X_END-1);textPutChar(130); textPrintNewLine(DLG_SPLASH);
textPutChar(130);fillSpaceToEnd(SCR_SPLASH_X_END-1);textPutChar(130); textPrintNewLine(DLG_SPLASH);
textPutChar(130);textPrint("                 v1.5 November 2026");fillSpaceToEnd(SCR_SPLASH_X_END-1);textPutChar(130); textPrintNewLine(DLG_SPLASH);
textPutChar(130);textPrint("                      made by Mu0n");fillSpaceToEnd(SCR_SPLASH_X_END-1);textPutChar(130); textPrintNewLine(DLG_SPLASH);

commonBoxBottom(SCR_SPLASH_X, SCR_SPLASH_X_END, SCR_SPLASH_Y_END);
	
while(true)
{
if(PEEK(INT_PENDING_0)&0x20) //when the timer1 delay is up, go here
	{
	POKE(INT_PENDING_0,0x20); //clear pending timer1
	delayInFrames--;
	setTimer1(1);
	if(delayInFrames == 0) break;
	}
}
textSetColor(15,0); //white over black
textSectionClear(DLG_SPLASH);
setTimer1(1); //for animations
}



void showCredits(void) 
{
	//box
	//display credits
	commonBoxTop(SCR_CREDITS_X, SCR_CREDITS_X_END, SCR_CREDITS_Y);
	textPrintNewLine(DLG_CREDITS);
	
	textPutChar(130);textSetColor(13,6);textPrint(" Press something, anything on the controller you want.");fillSpaceToEnd(SCR_HELP_X_END-1);textSetColor(14,6);textPutChar(130); textPrintNewLine(DLG_CREDITS);
	
	textSetColor(14,6); //cyan over dark blue
	textPutChar(130);textPrint("      ");fillSpaceToEnd(SCR_HELP_X_END-1);textPutChar(130); textPrintNewLine(DLG_CREDITS);
	commonBoxBottom(SCR_CREDITS_X, SCR_CREDITS_X_END, SCR_CREDITS_Y_END);
	
	uint16_t candidate = 0xFFFF;
	bool confirmedCandidate = false;
	
	while(!confirmedCandidate)
		{
		while(candidate == 0xFFFF)
			{
			pollNES();
			if(padState(PEEK(PAD0)) !=0) 
				{
				candidate = PAD0;
				break;
				}
			if(padState(PEEK(PAD1)) !=0) 
				{
				candidate = PAD1;
				break;
				}
			if(padState(PEEK(PAD2)) !=0) 
				{
				candidate = PAD2;
				break;
				}
			if(padState(PEEK(PAD3)) !=0) 
				{
				candidate = PAD3;
				break;
				}
			pollSNES();
			if((padState(PEEK(PAD0)) !=0) || (padState(PEEK(PAD0_S)) !=0)) 
				{
				candidate = PAD0_S;
				break;
				}
			if((padState(PEEK(PAD1)) !=0) || (padState(PEEK(PAD1_S)) !=0)) 
				{
				candidate = PAD1_S;
				break;
				}
			if((padState(PEEK(PAD2)) !=0) || (padState(PEEK(PAD2_S)) !=0)) 
				{
				candidate = PAD2_S;
				break;
				}
			if((padState(PEEK(PAD3)) !=0) || (padState(PEEK(PAD3_S)) !=0))  
				{
				candidate = PAD3_S;
				break;
				}
				
			if(PEEK(JOY_0)!= 0xFF)
				{
				candidate = JOY_0;
				break;
				}
			if(PEEK(JOY_1)!= 0xFF)
				{
				candidate = JOY_1;
				break;
				}
				
			kernelNextEvent();
			if(kernelEventData.type == kernelEvent(key.PRESSED))
				{
				candidate = 0x0000; //keyboard
				break;
				}
				
			
			}
		//time to confirm
		spriteFrameChange(10, 32, spriteFrameForCandidate(candidate), SPR_CTR_NES);
		spriteSetVisible(10,true);
		textSetColor(14,6);
		textGotoXY(112,8);textPrint("Enter to Confirm ");textPrint(labelConfirm(candidate));
		textGotoXY(112,9);textPrint("Other Key to Cancel");
		bool confirmedConfirmation = false;
		while(!confirmedConfirmation)
			{
			kernelNextEvent();
			if(kernelEventData.type == kernelEvent(key.PRESSED))
				{
				switch(kernelEventData.u.key.raw)
					{
					case 0x94: //confirm enter
						confirmedCandidate = true;
						confirmedConfirmation = true;
						break;
					default:
						candidate = 0xFFFF; //cancel candidate
						spriteSetVisible(10,false);
						confirmedConfirmation = true;
						
						textSetColor(15,0); //white over black
						textGotoXY(112,8);textPrint("                       ");
						textGotoXY(112,9);textPrint("                       ");
						break;
					}
				}
			}
		}
	addy[0] = candidate;
	spriteSetVisible(10,false);
	//wipe it out
	textSetColor(15,0); //white over black
	textSectionClear(DLG_CREDITS);
	//restore what was there before
	
	POKE(MMU_IO_CTRL, 0x00);

}	
void showHelp(void) {	
	//box
    //display help
	commonBoxTop(SCR_HELP_X, SCR_HELP_X_END, SCR_HELP_Y);
	textPrintNewLine(DLG_HELP);
	
	textPutChar(130);textSetColor(13,6);textPrint(" List of Keystrokes                 Press a key to dismiss.");fillSpaceToEnd(SCR_HELP_X_END-1);textSetColor(14,6);textPutChar(130); textPrintNewLine(DLG_HELP);
	
	textSetColor(14,6); //cyan over dark blue
	textPutChar(130);textPrint("  [F1]                 This help dialog");fillSpaceToEnd(SCR_HELP_X_END-1);textPutChar(130); textPrintNewLine(DLG_HELP);
    textPutChar(130);textPrint("  [F3]                 Choose Controller");fillSpaceToEnd(SCR_HELP_X_END-1);textPutChar(130); textPrintNewLine(DLG_HELP);
	textPutChar(130);textPrint("  [Shift-F7]           Teleport to song selection");fillSpaceToEnd(SCR_HELP_X_END-1);textPutChar(130); textPrintNewLine(DLG_HELP);
	textPutChar(130);textPrint("  [WASD] or [Arrows]   Move Whiskers");fillSpaceToEnd(SCR_HELP_X_END-1);textPutChar(130); textPrintNewLine(DLG_HELP);
	textPutChar(130);textPrint("  [Space]              Toggle pause during playback");fillSpaceToEnd(SCR_HELP_X_END-1);textPutChar(130); textPrintNewLine(DLG_HELP);
	textPutChar(130);textPrint("  [E]                  Experimental");fillSpaceToEnd(SCR_HELP_X_END-1);textPutChar(130); textPrintNewLine(DLG_HELP);
	textPutChar(130);textPrint("  [RUN/STOP]           Exit the program");fillSpaceToEnd(SCR_HELP_X_END-1);textPutChar(130); textPrintNewLine(DLG_HELP);
	textPutChar(130);fillSpaceToEnd(SCR_HELP_X_END-1);textPutChar(130);textPrintNewLine(DLG_HELP);
	textPutChar(130);textSetColor(13,6);textPrint(" Credits");fillSpaceToEnd(SCR_HELP_X_END-1);textPutChar(130); textPrintNewLine(DLG_HELP);
	textSetColor(14,6);
	textPutChar(130);textPrint("  Programming                  Mu0n aka 1Bit Fever Dreams");fillSpaceToEnd(SCR_HELP_X_END-1);textPutChar(130); textPrintNewLine(DLG_HELP);
    textPutChar(130);textPrint("  Art and animation            Mu0n aka 1Bit Fever Dreams");fillSpaceToEnd(SCR_HELP_X_END-1);textPutChar(130); textPrintNewLine(DLG_HELP);
	textPutChar(130);textPrint("  Whiskers character design    Hubol,  Wildbits Computing");fillSpaceToEnd(SCR_HELP_X_END-1);textPutChar(130); textPrintNewLine(DLG_HELP);
	
	commonBoxBottom(SCR_HELP_X, SCR_HELP_X_END, SCR_HELP_Y_END);
	
	waitForAnyKey();	//wipe it out
	textSetColor(15,0); //white over black
	textSectionClear(DLG_HELP);
	//restore what was there before
	
	POKE(MMU_IO_CTRL, 0x00);
}


void textPrintNewLine(uint8_t which) //constrain it
{
	uint8_t x,y; //keep track of text position
	uint8_t startX=0, startY=0, endX=0, endY=0;
	
	textGetXY(&x,&y);
	
	switch(which) //update the current line for the section that's been tapped here;
		{
		case DLG_SPLASH:
			startX = SCR_SPLASH_X;
			startY = SCR_SPLASH_Y;
			endX = SCR_SPLASH_X_END;
			endY = SCR_SPLASH_Y_END;
			break;
		case DLG_HELP:
			startX = SCR_HELP_X;
			startY = SCR_HELP_Y;
			endX = SCR_HELP_X_END;
			endY = SCR_HELP_Y_END;
			break;
		case DLG_CREDITS:
			startX = SCR_CREDITS_X;
			startY = SCR_CREDITS_Y;
			endX = SCR_CREDITS_X_END;
			endY = SCR_CREDITS_Y_END;
		}
	if(y == endY) y = startY; //loop back to start if needed
	else y++;
	textGotoXY(startX,y);
	for(uint8_t i=0;i<(endX-startX);i++)textPrint(" "); //wipe the next line before moving to it
	textGotoXY(startX,y); //go back to the planned start of that new line
}

void textSectionClear(uint8_t endX) //wipe a specific section using a unique endx identifier
{
	uint8_t iStart = 0, jStart = 0, iEnd = 0, jEnd = 0;
	uint8_t i, j;
	
	switch(endX) //update the current line for the section that's been tapped here; endx is a unique identifier
	{
	case DLG_SPLASH:
		iStart = SCR_SPLASH_X; iEnd = SCR_SPLASH_X_END;
		jStart = SCR_SPLASH_Y; jEnd = SCR_SPLASH_Y_END;
		break;
	case DLG_CREDITS:
		iStart = SCR_CREDITS_X; iEnd = SCR_CREDITS_X_END;
		jStart = SCR_CREDITS_Y; jEnd = SCR_CREDITS_Y_END+4;
		break;
	case DLG_HELP:
		iStart = SCR_HELP_X; iEnd = SCR_HELP_X_END;
		jStart = SCR_HELP_Y; jEnd = SCR_HELP_Y_END;
		break;
	}
	
	textGotoXY(iStart, jStart);
	for(j = jStart; j < jEnd+2; j++)
	{
		for(i = iStart; i < iEnd; i++)
		{
			textPrint(" ");
		}
		textGotoXY(iStart, j); //change line
	}
}

void fillSpaceToEnd(uint8_t endX)
{
	uint8_t curX, curY;
	textGetXY(&curX, &curY);
	
	for(uint8_t i = curX; i < endX; i++) textPrint(" ");
}

#endif //TEXTAREAS_C
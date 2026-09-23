/*
 A .tr2 file playing demo, based on the jrtracker 2 format developped by Ernesto Contreras
 
 https://github.com/econtrerasd/Tracker2
 */

//INCLUDES
#include "f256lib.h"

#include "muTr2Play.h"

//DEFINES
#define BAK_BASE    0x10000


#pragma section( t2f, 0)
#pragma region( t2f, 0x10000, 0x1FFFF, , , {t2f} )
#pragma data(t2f)
__export const char t2file[] = {
	#embed "../assets/moonlight.tr2"
};
#pragma data(data)


//GLOBALS

//PROTOTYPES
void setup(void);
void dealTimers(void);
uint8_t dealKeyboard(void);
void quitGracefully(void);

//FUNCTIONS
void setup()
{
//Vicky Master Control Registers. XXX are unused bits
// XXX GAMMA  SPRITE   TILE  | BITMAP  GRAPH  OVRLY  TEXT
POKE(VKY_MSTR_CTRL_0, 0b00000111); //sprite,graph,overlay,text
// XXX XXX  FON_SET FON_OVLY | MON_SLP DBL_Y  DBL_X  CLK_70
POKE(VKY_MSTR_CTRL_1, 0b00000000); //font overlay, double height text, 320x240 at 60 Hz;

//option 1, loading from a file in the same folder as this application
//loadTR2File("moonlight.tr2", 0x10000);
//option 2, skip loadTR2File and have the file embedded in RAM from the source files

prepTR2ForPlay(0x10000);
}

void quitGracefully()
{
shutPSG();
}
uint8_t dealKeyboard()
{
if(kernelEventData.type == kernelEvent(key.PRESSED))
		{
		switch(kernelEventData.u.key.raw)
			{
			case 0x92: //ESC - quits!
				return 1;
				break;
			}
		}
return 0;
}

int main(int argc, char *argv[]) {

textPrint("PSG based .tr2 file player test\n");

setup();
	
//Game Loop!
while(true) 
	{
	//Music playback
	TR2LoopPass();
	if(isTR2Done()) 
	{
	rewindAndPlayTR2();
	//textPrint("end of song.");
	}
	//Kernel stuff
	kernelNextEvent();
	if(dealKeyboard()) 
		{
		quitGracefully();
		return 0;
		}
	}
return 0;
}




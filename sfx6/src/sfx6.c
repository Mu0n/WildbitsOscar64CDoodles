
#include "f256lib.h"
#include "muUtils.h"
#include "muVS1053b.h"
#include "muSfxPlay.h"
#include "muTimers.h"
#include "muTimer0Int.h"

#define SFX01_CAM_BASE  0x10000
#define SFX02_BONG_BASE 0x20000
#define SFX03_COIN_BASE 0x30000
#define SFX04_TIEF_BASE 0x40000

#define TEST_EXT    0x08 //0x00 stay normal, or 0x08 for sram in extended mode
#define TEST_IO     0x00 //0x00 disabled, or 0x10 for io to hi, or 0x20 for flash to hi

#pragma section( camera_sfx, 0)
#pragma region( camera_sfx, 0x10000, 0x13A0E, , , {camera_sfx} )
#pragma data(camera_sfx)
__export const char camera_sfx[] = {
    #embed 0x3A0E "../assets/camera.wav"
};
#pragma data(data)

#pragma section( bong_sfx, 0)
#pragma region( bong_sfx, 0x20000, 0x22D4E, , , {bong_sfx} )
#pragma data(bong_sfx)
__export const char bong_sfx[] = {
    #embed 0x2D4E "../assets/blip.wav"
};
#pragma data(data)

#pragma section( coin_sfx, 0)
#pragma region( coin_sfx, 0x30000, 0x31C06, , , {coin_sfx} )
#pragma data(coin_sfx)
__export const char coin_sfx[] = {
    #embed 0x1C06 "../assets/coin.wav"
};
#pragma data(data)

#pragma section( tief_sfx, 0)
#pragma region( tief_sfx, 0x40000, 0x45A5C, , , {tief_sfx} )
#pragma data(tief_sfx)
__export const char tief_sfx[] = {
    #embed 0x5A5C "../assets/tie.wav"
};
#pragma data(data)


#pragma optimize(push)
#pragma optimize(1)      // or 0 to turn it off entirely
void dealKeyboard()
{
	kernelNextEvent();
	if(kernelEventData.type == kernelEvent(key.PRESSED))
		{	
		switch(kernelEventData.u.key.raw)
			{
			case 0x31:
					startSound(0);
				break;
			case 0x32:
					startSound(1);
				break;
			case 0x33:
					startSound(2);
				break;
			case 0x34:
					startSound(3);
				break;
			case 0x35:
					startSound(4);
				break;
			case 0x36:
					startSound(5);
				break;
			case 0x37:
					startSound(6);
				break;
			case 0x38:
					startSound(7);
				break;
			}
		}	
}
#pragma optimize(pop)

void setup()
{
//wipeBitmapBackground(0x2F,0x2F,0x2F);
POKE(MMU_MEM_CTRL, PEEK(MMU_MEM_CTRL) | TEST_EXT);
POKE(MMU_IO_CTRL,  0x00               | TEST_IO); //MMU I/O to page 0
	  // XXX GAMMA  SPRITE   TILE  | BITMAP  GRAPH  OVRLY  TEXT
POKE(VKY_MSTR_CTRL_0, 0b00000111); //sprite,graph,overlay,text
	  // XXX XXX  FON_SET FON_OVLY | MON_SLP DBL_Y  DBL_X  CLK_70
POKE(VKY_MSTR_CTRL_1, 0x00); //font overlay, double height text, 320x240 at 60 Hz;
POKE(MMU_IO_CTRL,  0x01               | TEST_IO);  //MMU I/O to page 1
POKE(0xD00D, 0x00);
POKE(MMU_IO_CTRL,  0x00               | TEST_IO);//MMU I/O to page 0
//openAllCODEC();
boostVSClock();

setupSound(0, SFX01_CAM_BASE,  14862);
setupSound(1, SFX02_BONG_BASE, 11598);
setupSound(2, SFX03_COIN_BASE, 7174);
setupSound(3, SFX04_TIEF_BASE, 23132);
setupSound(4, SFX03_COIN_BASE, 7174);
setupSound(5, SFX02_BONG_BASE, 11598);
setupSound(6, SFX03_COIN_BASE, 7174);
setupSound(7, SFX04_TIEF_BASE, 23132);
setupSound(8, SFX03_COIN_BASE, 7174);
setupSound(9, SFX02_BONG_BASE, 11598);
setupSound(10, SFX03_COIN_BASE, 7174);
setupSound(11, SFX03_COIN_BASE, 7174);
setupSound(12, SFX02_BONG_BASE, 11598);
setupSound(13, SFX04_TIEF_BASE, 23132);
setupSound(14, SFX03_COIN_BASE, 7174);
setupSound(15, SFX04_TIEF_BASE, 23132);

pcmHeaderPump();

lowVol();
silencePad();
highVol();

//resetTimer0();	
}

int main(int argc, char *argv[]) {
bool stayIn = true;

setup();
textPrint("\n1:CAM  2:BONG  3:COIN  4:TIEF  5:COIN  6:COIN  7:COIN  8:COIN\n");

uint32_t parser =0;
uint16_t counter = 40*10;

while(counter-- > 0)
{
printf("%02x", *(uint32_t*)(0x10000+parser++));	
}
//uint8_t launcher =0;
while(stayIn)
	{
	//startSound(launcher++);
	//if(launcher == MAX_ACTIVE_CHANNELS) launcher = 0;
	
	PCMLoopPass(); //always play something but verify inside
	dealKeyboard();
	}
	
return 0;
}

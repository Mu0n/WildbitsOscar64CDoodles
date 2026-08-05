/*
 Skeleton, barebones game project, by Mu0n, August 2026
 This was part of a YouTube video released on August 4th 2026 at this link: https://youtu.be/3afAJUqeyeE
 
 The github repo with the latest version can be found at https://github.com/Mu0n/WildbitsOscar64CDoodles/tree/main/skeletonGame
 
 This oscar64 project to get a running start on your own game. This provides:
 
 * a bitmap background full screen image
 * a sprite with 2 states (walk left, walk right) with 2 frames each
 * a standard MIDI file playback in the background
 * an opl3 .VGM file playback in the background
 * keyboard input managed with the kernel
 * timers based on frames, using the kernel

 Use this, adapt it to your needs and make us some sweet games for the Wildbits ecosystem, ya?
 
 */

//INCLUDES
#include "f256lib.h"

#include "muMidiPlay.h"
#include "muVGMPlay.h"

#include "mySprites.h"
#include "myBitmap.h"
#include "myTimers.h"

//DEFINES
#define BAK_BASE    0x30000

#pragma section( gfx, 0)
#pragma region( gfx, 0x10000, 0x10400, , , {gfx} )
#pragma data(gfx)
__export const char palette[] = {
	#embed "../assets/skelBM.pal"
};
#pragma data(data)

#pragma section(spr, 0)
#pragma region(spr, 0x14000,0x15000, , , {spr} )
#pragma data(spr)
__export const char spriteDude[] = {
	#embed "../assets/testSpr.bin"
};
#pragma data(data)

#pragma section( backg, 0)
#pragma region( backg, 0x6c000, 0x7ec00, , , {backg} )
#pragma data(backg)
__export const char embedded[] = {
	#embed 76800 "../assets/skelBM.bin"
};
#pragma data(data)

#pragma section( smf, 0)
#pragma region( smf, 0x40000, 0x4FFFF, , , {smf} )
#pragma data(smf)
__export const char smfile[] = {
	#embed "../assets/canyon.mid"
};
#pragma data(data)

#pragma section( vgmf, 0)
#pragma region( vgmf, 0x20000, 0x3FFFF, , , {vgmf} )
#pragma data(vgmf)
__export const char vgmfile[] = {
	#embed 94252 "../assets/doom.vgm"
};
#pragma data(data)

//GLOBALS
uint8_t animFrame=0; //running counter for sprite animation frame, can be value 0, 1 and then loops back
uint8_t soundChoice = 0; //0=midi 1=opl3 vgm

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
POKE(VKY_MSTR_CTRL_0, 0b00101100); //sprite,graph,overlay,text
// XXX XXX  FON_SET FON_OVLY | MON_SLP DBL_Y  DBL_X  CLK_70
POKE(VKY_MSTR_CTRL_1, 0b00000000); //font overlay, double height text, 320x240 at 60 Hz;


//layer choices, assign one of these bitfield chunks...
//b000: bitmap layer 0
//b001: bitmap layer 1
//b010: bitmap layer 2
//b100: tile map layer 0
//b101: tile map layer 1
//b110: tile map layer 2

//...to the 3 available slots marked 000, 111 and 222. X are unused bits
// X111 | X000 - vicky layers: slot 1 and slot 0
POKE(VKY_LAYER_CTRL_0, 0b00010000); //bitmap 1 in slot 1 - bitmap 0 in slot 0
// XXXX | X222 - vicky layers: slot 2
POKE(VKY_LAYER_CTRL_1, 0x00000010); //bitmap 2 in slot 2
	
initMyBitmap();

prepMIDIForPlay(0x40000);
prepVGMForPlay(0x20000);

initMyTimers();
initMySprites();
}
void dealTimers()
{	
	if(kernelEventData.type == kernelEvent(timer.EXPIRED))
		{
		switch(kernelEventData.u.timer.cookie)
			{
			case TIMER_SPRITE_ANIM_COOKIE: //sprite update timer
				updateMySprites();
				relaunchTimer(getTimerAbsolute(TIMER_FRAMES) + TIMER_SPRITE_ANIM_DELAY, &sprite_Upd_Timer);
				break;
			
			case TIMER_SPRITE_WALK_COOKIE: //walk anim timer
				spriteFrameChange(0, 32, animFrame + (spriteRecords[0].vx==1?0:2), SPRITES_ADDRESS_BASE);

				animFrame++;
				if(animFrame==2) animFrame = 0;
				
				relaunchTimer(getTimerAbsolute(TIMER_FRAMES) + TIMER_SPRITE_WALK_DELAY, &sprite_Walk_Timer);
				break;
			}
		}
}
void quitGracefully()
{
	opl3_quietAll();
	midiShutAllChannels();
}
uint8_t dealKeyboard()
{
if(kernelEventData.type == kernelEvent(key.PRESSED))
		{
		switch(kernelEventData.u.key.raw)
			{
			case 0x77: //W
				spriteRecords[0].vy=-1;
				break;
			case 0x61: //A
				spriteRecords[0].vx=-1;
				break;
			case 0x73: //S
				spriteRecords[0].vy=1;
				break;
			case 0x64: //D
				spriteRecords[0].vx=1;
				break;
			case 0x31: //1: MIDI
				opl3_quietAll();
				soundChoice = 0;
				break;
			case 0x32: //2: OPL3 VGM
				midiShutAllChannels();
				soundChoice = 1;
				break;
			case 0x92: //ESC - quits!
				return 1;
				break;
			}
		}
return 0;
}

int main(int argc, char *argv[]) {

setup();
	
//Game Loop!
while(true) 
	{
	//Music playback
	if(soundChoice == 0) midiLoopPass();
	else if(soundChoice == 1) VGMLoopPass();
	if(isMIDIDone()) rewindAndPlayMIDI();
	if(isVGMDone()) rewindAndPlayVGM();
	//Kernel stuff
	kernelNextEvent();
	if(dealKeyboard()) 
		{
		quitGracefully();
		return 0;
		}
	dealTimers();
	}
return 0;
}




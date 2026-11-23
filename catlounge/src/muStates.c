#ifndef MUSTATES_C
#define MUSTATES_C

#include "f256lib.h"
#include "muStates.h"
#include "mySprites.h"


//playback state
uint8_t modePlay = MODE_SILENCE;

//main room states
bool modal_TurnTable = false; //cat is interacting with turntable
bool modal_Couch = false; //cat is sitting on couch
bool modalActive = false; //any modal is active
bool turnTableLatched = false;   // set on exit, cleared when the cat leaves the zone
bool couchLatched = false; //set on exit, cleared when leaving the zone
bool roomChangeLatched = false;

bool room2 = false;

//lab room states
bool modal_Bench = false; //cat is sitting on the stool in front of bench

//union of sprite movement states
bool rightDown = false, leftDown = false, upDown = false, downDown = false;

//keyboard held down states
bool kLeftDown = false, kRightDown = false;
bool kUpDown = false, kDownDown = false;

//joystick/gamepads held down states
bool jLeftDown = false, jRightDown = false;
bool jUpDown = false, jDownDown = false;


uint16_t addy[2] = {PAD0, 0x0000}; //address of thing to poll

void switchMode(uint8_t newMode)
{
	if(newMode == modePlay) return;
	
	switch(modePlay) // turn off the old mode
	{
		case MODE_TR2:
			shutPSG();
			break;
		case MODE_MIDI:
			midiShutAllChannels();
			break;
		case MODE_VGM:
			opl3_quietAll();
			break;
		case MODE_SID:
			shutAllSIDVoices();
			break;
		case MODE_MP3:
			closeDownMp3File();
			break;
	}
	modePlay = newMode; //set the new mode
}

void invokePause(bool want)
{
if(want)
	{
	globalPause = true;
	switch(modePlay)
		{
		case MODE_MIDI:
			midiShutAllChannels();
			break;
		case MODE_TR2:
			shutPSG();
			break;
		case MODE_VGM:
			opl3_quietAll();
			break;
		case MODE_SID:
			clearSIDRegisters();
			break;
		}
	}
else 
	{
	globalPause = false;
	}
spriteSetVisible(4,modePlay && !globalPause);
}

void enterTurnTableModal(void)
{
modalActive = true;
modal_TurnTable = true;
spriteSetVisible(2, true);
spriteSetVisible(3, true);
	
spriteSetPosition(0, SPOT_TT_X, SPOT_TT_Y-31);
spriteSetPosition(1, SPOT_TT_X+32, SPOT_TT_Y-31);
spriteFrameChange(0, 32, 40, SPRITES_ADDRESS_BASE);
spriteFrameChange(1, 32, 41, SPRITES_ADDRESS_BASE);

rightDown = leftDown = upDown = downDown = false;
kRightDown = kLeftDown = kUpDown = kDownDown = false;

jRightDown = jLeftDown = jUpDown =jDownDown = false;
	
}

void enterCouchModal(void)
{
modal_Couch = true;
	
if(!room2)
{
spriteSetPosition(0, SPOT_CH_X, SPOT_CH_Y);
spriteSetPosition(1, SPOT_CH_X+32, SPOT_CH_Y);
spriteFrameChange(0, 32, 0, SPRITES_ADDRESS_BASE);
spriteFrameChange(1, 32, 1, SPRITES_ADDRESS_BASE);
}
else
{

spriteSetPosition(0, SPOT_CH_X+19, SPOT_CH_Y+15);
spriteSetPosition(1, SPOT_CH_X+51, SPOT_CH_Y+15);
spriteFrameChange(0, 32, 45, SPRITES_ADDRESS_BASE);
spriteFrameChange(1, 32, 1, SPRITES_ADDRESS_BASE);	
invokeBench();
}


rightDown = leftDown = upDown = downDown = false;
kRightDown = kLeftDown = kUpDown = kDownDown = false;
jRightDown = jLeftDown = jUpDown =jDownDown = false;
}

void exitTurnTableModal(void)
{
modalActive = false;
modal_Couch = false;
modal_TurnTable = false;
turnTableLatched = true;
spriteSetPosition(0, SPOT_TT_X+10, SPOT_TT_Y-31);
spriteSetPosition(1, SPOT_TT_X+42, SPOT_TT_Y-31);
spriteSetVisible(2, false);
spriteSetVisible(3, false);

updateWalkState();
}

void exitCouchModal(void)
{
modalActive = false;
modal_Couch = false;
couchLatched = true;

if(!room2)
{
spriteSetPosition(0, SPOT_CH_X, SPOT_CH_Y+40);
spriteSetPosition(1, SPOT_CH_X+32, SPOT_CH_Y+40);

spriteFrameChange(0, 32, 0, SPRITES_ADDRESS_BASE);
spriteFrameChange(1, 32, 1, SPRITES_ADDRESS_BASE);
}
else
{
spriteSetPosition(0, SPOT_CH_X, SPOT_CH_Y+40);
spriteSetPosition(1, SPOT_CH_X+32, SPOT_CH_Y+40);

spriteFrameChange(0, 32, 0, SPRITES_ADDRESS_BASE);
spriteFrameChange(1, 32, 1, SPRITES_ADDRESS_BASE);
}
updateWalkState();
}

void spriteSwapRooms()
{
if(room2)
	{
		
	spriteSetPosition(0, SPOT_TT_X-20, SPOT_TT_Y-31);
	spriteSetPosition(1, SPOT_TT_X+12, SPOT_TT_Y-31);
	roomChangeLatched = true;
	}
else
	{
	spriteSetPosition(0, 340-SPOT_TT_X, SPOT_TT_Y-31);
	spriteSetPosition(1, 340-SPOT_TT_X+32, SPOT_TT_Y-31);
	roomChangeLatched = true;
	}
}

#endif //MUSTATES_C
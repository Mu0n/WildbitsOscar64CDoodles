#ifndef MUPADS_C
#define MUPADS_C

#include "f256lib.h"
#include "muPads.h"
#include "muStates.h"

static uint8_t padState(uint8_t raw)
{
    return (raw == 0x00) ? 0 : (uint8_t)~raw;
}


void pollNES()
{
POKE(PAD_CTRL, CTRL_TRIG | CTRL_MODE_NES);
__asm
	{
		NOP
	}
POKE(PAD_CTRL, CTRL_MODE_NES);
padPollDelayUntilReady();
}

void pollSNES()
{
POKE(PAD_CTRL, CTRL_TRIG | CTRL_MODE_SNES);
__asm
	{
		NOP
	}
POKE(PAD_CTRL, CTRL_MODE_SNES);
padPollDelayUntilReady();
}

bool padPollIsReady()
{
return (PEEK(PAD_CTRL) & STAT_DONE); //if true, it's ready
}

void padPollDelayUntilReady()
{
while((PEEK(PAD_CTRL) & STAT_DONE) != STAT_DONE)
		;
}


#endif // MUPADS_C
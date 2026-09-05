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

void cozyHandle(MouseStates *st, MouseEvent ev)
{
	switch(ev)
		{
		case ET_DELTA_ANALYZE:
			st->stateBefore = st->state; //remember in case it gets cancelled
			st->state = STATE_OUTSIDING;
			break;
		case ET_DOWNLOAD:
			break;
		case ET_UPLOAD:
			break;
		}
}


#endif //MUSTATES_C
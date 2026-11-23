#ifndef MYTIMERS_C
#define MYTIMERS_C

#include "f256lib.h"
#include "myTimers.h"

struct timer_t refresh_Timer;   // kernel timer for 1/60s

void initMyTimers()
{
refresh_Timer.units = TIMER_FRAMES;
refresh_Timer.absolute = getTimerAbsolute(TIMER_FRAMES) + TIMER_REFRESH_DELAY;
refresh_Timer.cookie = TIMER_REFRESH_COOKIE;
setTimer(&refresh_Timer);
}

void relaunchTimer(uint8_t abs, struct timer_t *whichTimer)
{
whichTimer->absolute = abs;
setTimer(whichTimer);		
}

//Sends a kernel based timer. You must prepare a timer_t struct first and initialize its fields
bool setTimer(const struct timer_t *timer)
{
    *(uint8_t*)0xf3 = timer->units;
    *(uint8_t*)0xf4 = timer->absolute;
    *(uint8_t*)0xf5 = timer->cookie;
    kernelCall(Clock.SetTimer);
	return !kernelError;
}
//getTimerAbsolute:
//This is essential if you want to retrigger a timer properly. The old value of the absolute
//field has a high chance of being desynchronized when you arrive at the moment when a timer
//is expired and you must act upon it.
//get the value returned by this, add the delay you want, and use setTimer to send it off
//ex: myTimer.absolute = getTimerAbsolute(TIMES_SECONDS) + TIMER_MYTIMER_DELAY
uint8_t getTimerAbsolute(uint8_t units)
{
    *(uint8_t*)0xf3 = units | 0x80;
    return kernelCall(Clock.SetTimer);
}

#endif //MYTIMERS_C
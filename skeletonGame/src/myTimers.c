#ifndef MYTIMERS_C
#define MYTIMERS_C

#include "f256lib.h"
#include "myTimers.h"

struct timer_t sprite_Upd_Timer;   // kernel timer structure; for sprite animation
struct timer_t sprite_Walk_Timer;  // kernel timer structure; for walking animation

void initMyTimers()
{
sprite_Upd_Timer.units = TIMER_FRAMES;
sprite_Upd_Timer.absolute = getTimerAbsolute(TIMER_FRAMES) + TIMER_SPRITE_ANIM_DELAY;
sprite_Upd_Timer.cookie = TIMER_SPRITE_ANIM_COOKIE;
setTimer(&sprite_Upd_Timer);

sprite_Walk_Timer.units = TIMER_FRAMES;
sprite_Walk_Timer.absolute = getTimerAbsolute(TIMER_FRAMES) + TIMER_SPRITE_WALK_DELAY;
sprite_Walk_Timer.cookie = TIMER_SPRITE_WALK_COOKIE;
setTimer(&sprite_Walk_Timer);	
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
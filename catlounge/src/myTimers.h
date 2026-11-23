#ifndef MYTIMERS_H
#define MYTIMERS_H

#define TIMER_FRAMES  0
#define TIMER_SECONDS 1

#define TIMER_REFRESH_COOKIE  0
#define TIMER_REFRESH_DELAY   1


void initMyTimers(void);
void relaunchTimer(uint8_t, struct timer_t *);
bool setTimer(const struct timer_t *);
uint8_t getTimerAbsolute(uint8_t);

extern struct timer_t refresh_Timer;   // kernel timer for 1/60s

#endif //MYTIMERS_H
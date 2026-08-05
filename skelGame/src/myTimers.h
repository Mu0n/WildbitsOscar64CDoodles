#ifndef MYTIMERS_H
#define MYTIMERS_H

#define TIMER_FRAMES  0
#define TIMER_SECONDS 1

#define TIMER_SPRITE_ANIM_COOKIE  0
#define TIMER_SPRITE_ANIM_DELAY   1

#define TIMER_SPRITE_WALK_COOKIE  1
#define TIMER_SPRITE_WALK_DELAY   3

void initMyTimers(void);
void relaunchTimer(uint8_t, struct timer_t *);
bool setTimer(const struct timer_t *);
uint8_t getTimerAbsolute(uint8_t);

extern struct timer_t sprite_Upd_Timer;   // kernel timer structure; for sprite animation
extern struct timer_t sprite_Walk_Timer;  // kernel timer structure; for walking animation

#endif //MYTIMERS_H
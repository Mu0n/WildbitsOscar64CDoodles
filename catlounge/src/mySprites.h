#ifndef MYSPRITES_H
#define MYSPRITES_H

#define SPRITES_TOTAL_NUMBER 5 //needed for when we create a record of sprites for bookkeeping
#define SPRITES_ADDRESS_BASE  0x2B000
#define SPRITES_ADDRESS_NOTES 0x3D000
#define SHADOWMAP1_BASE 0x73000
#define SHADOWMAP2_BASE 0x33000

#define SPR_CTR_KEYB 0x59000 + 2*(32*32)
#define SPR_CTR_NES  0x59000
#define SPR_CTR_SNES 0x59000 + 32*32
#define SPR_CTR_JOY  0x59000 + 3*(32*32)
#define SPR_CTR_X    116
#define SPR_CTR_Y    60


#define WHISKERS_DELAY 16

#define MOVE_X_MIN 40
#define MOVE_X_MAX 285
#define MOVE_Y_MIN 80
#define MOVE_Y_MAX 240

#define EAR_X_LEFT   14
#define EAR_X_RIGHT  34
#define RIGHT_FACING_SHIFT (EAR_X_RIGHT - EAR_X_LEFT) //20

#define SPOT_TT_X 58
#define SPOT_TT_Y 183

#define SPOT_CH_X 156
#define SPOT_CH_Y 128

#define SPOT_NOTES_X 50
#define SPOT_NOTES_Y (SPOT_TT_Y - 44)

typedef struct sprRec{
	uint16_t x,y;  //positions
	uint16_t vx, vy; //velocities
	uint8_t state; //state number	
} sprRec, *sprRecPtr;

typedef struct {
uint8_t index;
uint8_t duration;	
} sprFrame;

typedef struct {
const sprFrame* frames;
uint8_t count;
bool loops;
} sprAnimation;

typedef struct {
const sprAnimation* currentAnimation;
uint8_t currentIndex;
uint32_t accumulated;
bool isFinished;
} sprAnimationState;

enum {
W_SIT,
W_WALK_LEFT,
W_WALK_RIGHT,
W_OPERATE_TURNTABLE,
W_ONTO_COUCH,
W_OPERATE_LAB
} whiskersStates;

void initMySprites(void);
void updateMySprites(void);

void initSpriteRecord(byte, uint32_t, uint8_t, uint16_t, uint16_t, uint16_t, uint16_t, uint8_t);
void spriteFrameChange(uint8_t, uint8_t, uint8_t, uint32_t);
void spriteGetPosition(byte, uint16_t *, uint16_t *);
void spriteSetPos(byte, int16_t, int16_t);
uint8_t getShadowColor(uint16_t, uint16_t);
void stateChange(sprAnimationState*, const sprAnimation*);
uint16_t animationGetIndex(const sprAnimationState*);
void animationUpdate(sprAnimationState*, uint32_t);
void flipSprite(byte, bool, bool);
bool canMoveInto(uint16_t, uint16_t);

extern sprRec spriteRecords[];
extern sprAnimationState whiskersL, whiskersR, notesSAS;
extern const sprAnimation SIT_L;
extern const sprAnimation SIT_L_BENCH;
extern const sprAnimation SIT_R;
extern const sprAnimation WALKL_L;
extern const sprAnimation WALKL_R;
extern const sprAnimation WALKR_L;
extern const sprAnimation WALKR_R;
extern const sprAnimation NOTESSPRANIM;

extern bool facingRight = false; //remembered so up/down alone keeps the last facing


#endif //MYSPRITES_H
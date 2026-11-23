#ifndef MYSPRITES_C
#define MYSPRITES_C

#include "f256lib.h"
#include "mySprites.h"
#include "muStates.h"


sprRec spriteRecords[SPRITES_TOTAL_NUMBER];
const sprFrame notesAnim[] =
{
	{0,WHISKERS_DELAY*3},
	{1,WHISKERS_DELAY*3},
	{2,WHISKERS_DELAY*3},
	{3,WHISKERS_DELAY*3}
};

const sprFrame whiskersSitL[] =
{
	{0,WHISKERS_DELAY*8},
	{6,WHISKERS_DELAY*5}
};
const sprFrame whiskersSitLBench[] =
{
	{44,WHISKERS_DELAY*8}
};
const sprFrame whiskersSitR[] =
{
	{1,WHISKERS_DELAY*2},
	{3,WHISKERS_DELAY*2},
	{5,WHISKERS_DELAY*4}
};

const sprAnimation SIT_L = {whiskersSitL, 2, true};
const sprAnimation SIT_L_BENCH = {whiskersSitLBench, 1, true};
const sprAnimation SIT_R = {whiskersSitR, 2, true};


const sprFrame whiskersWalkL_L[] =
{
	{8,WHISKERS_DELAY},
	{10,WHISKERS_DELAY},
	{12,WHISKERS_DELAY},
	{14,WHISKERS_DELAY},
	{16,WHISKERS_DELAY},
	{18,WHISKERS_DELAY},
	{20,WHISKERS_DELAY},
	{22,WHISKERS_DELAY},
};
const sprFrame whiskersWalkL_R[] =
{
	{9,WHISKERS_DELAY},
	{11,WHISKERS_DELAY},
	{13,WHISKERS_DELAY},
	{15,WHISKERS_DELAY},
	{17,WHISKERS_DELAY},
	{19,WHISKERS_DELAY},
	{21,WHISKERS_DELAY},
	{23,WHISKERS_DELAY},
};


const sprAnimation NOTESSPRANIM = {notesAnim, 4, true};

const sprAnimation WALKL_L = {whiskersWalkL_L, 8, true};
const sprAnimation WALKL_R = {whiskersWalkL_R, 8, true};

const sprFrame whiskersWalkR_L[] =
{
	{24,WHISKERS_DELAY},
	{26,WHISKERS_DELAY},
	{28,WHISKERS_DELAY},
	{30,WHISKERS_DELAY},
	{32,WHISKERS_DELAY},
	{34,WHISKERS_DELAY},
	{36,WHISKERS_DELAY},
	{38,WHISKERS_DELAY},
};
const sprFrame whiskersWalkR_R[] =
{
	
	{25,WHISKERS_DELAY},
	{27,WHISKERS_DELAY},
	{29,WHISKERS_DELAY},
	{31,WHISKERS_DELAY},
	{33,WHISKERS_DELAY},
	{35,WHISKERS_DELAY},
	{37,WHISKERS_DELAY},
	{39,WHISKERS_DELAY},
};

const sprAnimation WALKR_L = {whiskersWalkR_L, 8, true};
const sprAnimation WALKR_R = {whiskersWalkR_R, 8, true};

sprAnimationState notesSAS = {&NOTESSPRANIM, 0, 0L, false};
sprAnimationState whiskersL = {&SIT_L, 0, 0L, false};
sprAnimationState whiskersLBench = {&SIT_L_BENCH, 0, 0L, false};
sprAnimationState whiskersR = {&SIT_R, 0, 0L, false};;

bool facingRight = false; //remembered so up/down alone keeps the last facing

//initialize the sprites used in this project
void initMySprites(void)
{

//gfx bitmaps
initSpriteRecord(0, SPRITES_ADDRESS_BASE, 32, 144, 200, 0, 0, 0);
initSpriteRecord(1, SPRITES_ADDRESS_BASE + (32*32) , 32, 176, 200, 0, 0, 0);
initSpriteRecord(2, SPRITES_ADDRESS_BASE + (uint32_t)32*32*42, 32, SPOT_TT_X, SPOT_TT_Y, 0, 0, 0);
initSpriteRecord(3, SPRITES_ADDRESS_BASE + (uint32_t)32*32*43, 32, SPOT_TT_X+32, SPOT_TT_Y, 0, 0, 0);
spriteSetVisible(2,false);spriteSetVisible(3,false); //only needed when turntabling

//notes bitmaps
initSpriteRecord(4, SPRITES_ADDRESS_NOTES, 16, SPOT_NOTES_X, SPOT_NOTES_Y, 0, 0, 0);
spriteSetVisible(4,false);
//animation states
stateChange(&whiskersL, &SIT_L);
stateChange(&whiskersR, &SIT_R);
stateChange(&notesSAS, &NOTESSPRANIM);

//controller choice sprite
initSpriteRecord(10, SPR_CTR_KEYB, 32, SPR_CTR_X, SPR_CTR_Y, 0, 0, 0);
spriteSetVisible(10,false);
}

//change the frames shown in the sprite in this project; position restrictions
void updateMySprites(void)
{
	spriteRecords[0].x += spriteRecords[0].vx;  //Update the sprite position
	spriteRecords[0].y += spriteRecords[0].vy; 

/*
	if(spriteRecords[0].x>320) spriteRecords[0].x=320; //restrictions on position
	if(spriteRecords[0].x<32) spriteRecords[0].x=32; 

	if(spriteRecords[0].y<32) spriteRecords[0].y=32; 
	if(spriteRecords[0].y>240) spriteRecords[0].y=240;	
*/

	
	spriteSetPosition(0,spriteRecords[0].x,spriteRecords[0].y);  //Draw the sprite
}

//initialize the sprite address, position and keep info in a record
void initSpriteRecord(byte s, uint32_t address, uint8_t size, uint16_t x, uint16_t y, uint16_t vx, uint16_t vy, uint8_t state)
{
	spriteDefine(s, address, size, 0, 0); //hard coded 32x32, CLUT 0 and layer 0;
	spriteSetPosition(s, x, y);
	spriteSetVisible(s, true);
	
	spriteRecords[s].x = x; //this must be used for gen1 to keep track of position; gen2 has readable position registers
	spriteRecords[s].y = y; //this must be used for gen1 to keep track of position; gen2 has readable position registers
	spriteRecords[s].vx = vx;
	spriteRecords[s].vy = vy;
	spriteRecords[s].state = state;
}

//switch to a new frame of animation, provided the size, frame number and base address. Replaces spriteDefine & spriteSetVisible combo calling.
void spriteFrameChange(uint8_t s, uint8_t size, uint8_t frame, uint32_t baseAddress)
{
uint32_t newAddress = baseAddress + (uint32_t)((uint16_t)frame * (uint16_t)size * (uint16_t)size);

//this assumes you're in i/o page 0!
POKEA(0xD901 + (uint32_t)s * 8, newAddress);
}

void flipSprite(byte s, bool wantX, bool wantY)
{
	uint16_t sprite = VKY_SP0_CTRL + (s * 8);
	
	if(wantX)
	{
	uint16_t x = PEEKW(sprite+4);
	x ^= 0x8000;
	POKEW(sprite + 4, x);	
	}
	if(wantY)
	{
	uint16_t y = PEEKW(sprite+6);
	y ^= 0x8000;
	POKEW(sprite + 6, y);
	}
}
//returns positions x,y for sprite s. needed for gen1 only. works for sprites 0 to 63 only
void spriteGetPosition(byte s, uint16_t *x, uint16_t *y) {
	uint16_t sprite = VKY_SP0_CTRL + (s * 8);

	*x = PEEKW(sprite + 4)&0x7FFF;
	*y = PEEKW(sprite + 6)&0x7FFF;
}
void spriteSetPos(byte s, int16_t deltax, int16_t deltay) {
	uint16_t sprite = VKY_SP0_CTRL + (s * 8);

	int16_t newX = (int16_t)PEEKW(sprite+4) + deltax;
	int16_t newY = (int16_t)PEEKW(sprite+6) + deltay + 32;
	
	if(canMoveInto(newX & 0x7FFF, newY & 0x7FFF))
		{
		if(s == 0)
			{
			uint16_t spriteR = VKY_SP0_CTRL + 8;
			int16_t newXR = (int16_t)PEEKW(spriteR+4) + deltax;
			int16_t newYR = (int16_t)PEEKW(spriteR+6) + deltay + 32;
			if(canMoveInto(newXR& 0x7FFF, newYR & 0x7FFF))
				{
				POKEW(sprite + 4, newX);
				POKEW(sprite + 6, newY - 32);
				POKEW(spriteR + 4, newXR);
				POKEW(spriteR + 6, newYR - 32);
				}
			}
		else
			{
			POKEW(sprite + 4, newX);
			POKEW(sprite + 6, newY - 32);	
			}
		}
}
// Returns the 4-bit color (0-15) of the shadow map pixel at screen coords x,y
uint8_t getShadowColor(uint16_t x, uint16_t y)
{
	uint16_t mx = x - 32 + 14;
	uint16_t my = y - 32;

	mx = mx&0x7FFF;
	my = my&0x7FFF;
	
	uint8_t byte = FAR_PEEK((room2 ? SHADOWMAP2_BASE : SHADOWMAP1_BASE) +
			(uint32_t)(mx / 2) +
			(uint32_t)my * 160);

	// Left pixel (even x) is the high nibble, right pixel (odd x) is the low nibble
	return (mx & 1) ? (byte & 0x0F) : (byte >> 4);
}

//check if the top left corner of the sprite is legit by comparing it
//to a shadowmap, where each bit of each byte represents no-go (0) or go (1) in a crushed
//version of a 320x240 bitmap, squeezed into 40x240
bool canMoveInto(uint16_t x, uint16_t y)
{
	return getShadowColor(x, y) > 0;
}

//state engine, switch states when you know you can
void stateChange(sprAnimationState* state, const sprAnimation* newAnimation)
{	

	if(state->currentAnimation == newAnimation) return; //no change needed
	
	bool wasWalkR = (state->currentAnimation == &WALKR_L);
	bool willWalkR = (newAnimation == &WALKR_L);

	
	if (wasWalkR && !willWalkR) {
		spriteSetPos(0, RIGHT_FACING_SHIFT, 0);
		//spriteSetPos(1, RIGHT_FACING_SHIFT, 0);
		}
	if (!wasWalkR && willWalkR) {
		spriteSetPos(0, -RIGHT_FACING_SHIFT, 0);
		//spriteSetPos(1, -RIGHT_FACING_SHIFT, 0);
		}
	
	state->currentAnimation = newAnimation;
	state->currentIndex = 0;
	state->accumulated = 0; 
	state->isFinished = false;
}
// Helper to get the active sprite index for rendering
uint16_t animationGetIndex(const sprAnimationState* state) {
    if (!state->currentAnimation) return 0;
    return state->currentAnimation->frames[state->currentIndex].index;
}
void animationUpdate(sprAnimationState* state, uint32_t deltaTime)
{
	if(!state->currentAnimation || state->isFinished) return; 
	
	state->accumulated += deltaTime;
	
	const sprFrame* currentFrame = &(state->currentAnimation->frames[state->currentIndex]);

		
	//catching up to lag
	while(state->accumulated >= currentFrame->duration)
	{
		state->accumulated -= currentFrame->duration;
		state->currentIndex++;
	}
	
	//what happens at the end of the animation?
	if(state->currentIndex >= state->currentAnimation->count)
	{
		if(state->currentAnimation->loops){
				state->currentIndex = 0; //go back to beginning
		}
		else
		{
			state->currentIndex = state->currentAnimation->count - 1; //stay at the end
			state->isFinished = true;
			return;
		}
	}
	currentFrame = &(state->currentAnimation->frames[state->currentIndex]); //update the frame
}


#endif //MYSPRITES_C
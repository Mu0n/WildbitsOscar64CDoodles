#ifndef MYSPRITES_C
#define MYSPRITES_C

#include "f256lib.h"
#include "mySprites.h"

sprRec spriteRecords[SPRITES_TOTAL_NUMBER];

//initialize the sprites used in this project
void initMySprites(void)
{
initSpriteRecord(0, SPRITES_ADDRESS_BASE, 32, 32, 32, 0, 0, 0);
}

//change the frames shown in the sprite in this project; position restrictions
void updateMySprites(void)
{
	spriteRecords[0].x += spriteRecords[0].vx;  //Update the sprite position
	spriteRecords[0].y += spriteRecords[0].vy; 

	if(spriteRecords[0].x>320) spriteRecords[0].x=320; //restrictions on position
	if(spriteRecords[0].x<32) spriteRecords[0].x=32; 

	if(spriteRecords[0].y<32) spriteRecords[0].y=32; 
	if(spriteRecords[0].y>240) spriteRecords[0].y=240;	
	
	spriteSetPosition(0,spriteRecords[0].x,spriteRecords[0].y);  //Draw the sprite
}

//initialize the sprite address, position and keep info in a record
void initSpriteRecord(byte s, uint32_t address, uint8_t size, uint16_t x, uint16_t y, uint16_t vx, uint16_t vy, uint8_t state)
{
	spriteDefine(s, address, size, 0, 0); //hard coded 32x32, CLUT 0 and layer 0;
	spriteSetPosition(s, x, y);
	spriteSetVisible(s, false);
	
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


//returns positions x,y for sprite s. needed for gen1 only. works for sprites 0 to 63 only
void spriteGetPosition(byte s, uint16_t *x, uint16_t *y) {
	uint16_t sprite = VKY_SP0_CTRL + (s * 8);

	*x = PEEKW(sprite + 4);
	*y = PEEKW(sprite + 6);
}

#endif //MYSPRITES_C
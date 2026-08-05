#ifndef MYSPRITES_H
#define MYSPRITES_H

#define SPRITES_TOTAL_NUMBER 1 //needed for when we create a record of sprites for bookkeeping
#define SPRITES_ADDRESS_BASE 0x14000

typedef struct sprRec{
	uint16_t x,y;  //positions
	uint16_t vx, vy; //velocities
	uint8_t state; //state number	
} sprRec, *sprRecPtr;

void initMySprites(void);
void updateMySprites(void);

void initSpriteRecord(byte, uint32_t, uint8_t, uint16_t, uint16_t, uint16_t, uint16_t, uint8_t);
void spriteFrameChange(uint8_t, uint8_t, uint8_t, uint32_t);
void spriteGetPosition(byte, uint16_t *, uint16_t *);

extern sprRec spriteRecords[];

#endif //MYSPRITES_H
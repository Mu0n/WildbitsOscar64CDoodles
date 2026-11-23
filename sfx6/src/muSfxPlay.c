#ifndef __MUSFXPLAY_C
#define __MUSFXPLAY_C

#include "muSfxPlay.h"
#include "muTimer0Int.h" //contains helper functions I often use
#include "muGen2RAM.h"   //to access the extra 3 banks of SRAM available in Wildbits gen2 
#include "muVS1053b.h"
#include "f256lib.h"
#include "muTimers.h"

static uint8_t countActiveChannels = 0;
static pcmChannel sfx[MAX_ACTIVE_CHANNELS];
static uint8_t chBuf[MAX_ACTIVE_CHANNELS][32];
const uint8_t pcmHeader[]=
	{
	0x52, 0x49, 0x46, 0x46, 0x06, 0x3a, 0x00, 0x00, 0x57, 0x41, 0x56, 0x45, 0x66, 0x6d, 0x74, 0x20,
	0x10, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x22, 0x56, 0x00, 0x00, 0x22, 0x56, 0x00, 0x00,
	0x01, 0x00, 0x08, 0x00, 0x64, 0x61, 0x74, 0x61, 0xFF, 0xFF, 0xFF, 0xFF
	}; //header for 8-bit, unsigned, 22.05kHz wav PCM files
	
void pcmHeaderPump()
{
	for(uint8_t i=0;i<WAV_HEADER_OFFSET;i++) POKE(VS_FIFO_DATA, pcmHeader[i]);
}
void silencePad()
{
	for(uint8_t i=0;i<32;i++) //do this 32 times * 64 bytes = 2048 bytes
	{
	while(2048 - (PEEKW(VS_FIFO_COUNT)&0x07FF) < 64)
		; //wait for a 64 bytes space that's free in the FIFO at least
		
	for(uint8_t j=0;j<64;j++)	POKE(VS_FIFO_DATA, SILENTBYTE);	//empty out the next 64 bytes
	}
}


void setupSound(uint8_t which, uint32_t start, uint16_t size)
{
	if(which >= MAX_ACTIVE_CHANNELS) return;
	sfx[which].startAddr = start+(uint32_t)WAV_HEADER_OFFSET;
	sfx[which].size   = size-(uint32_t)WAV_HEADER_OFFSET;
	sfx[which].offset = 0;
	sfx[which].isPlaying = false;
	sfx[which].data = SILENTBYTE; //silence
}


uint8_t mixChannels()
{
	int16_t sum=0;
	
    if (countActiveChannels == 0) return 128; // silence

	for(uint8_t i = 0; i < MAX_ACTIVE_CHANNELS; i++)
		sum += (sfx[i].isPlaying ? ((int)sfx[i].data - 128) : 0);
		
    int mixed = mathSignedDivision(sum,countActiveChannels);

    return (uint8_t)(mixed + 128);
}

void startSound(uint8_t which)
{
	sfx[which].offset = 0;
	if(sfx[which].isPlaying == false) countActiveChannels++;
	sfx[which].isPlaying=true;
}

void stopSound(uint8_t which)
{
	sfx[which].offset = 0;
	sfx[which].isPlaying=false;
	countActiveChannels--;
}


int8_t PCMLoopPass()
{
	static int16_t sums[32];
	uint8_t nextRead, countRead=0;
	uint8_t i, j;
	int8_t canPause = 0; //will only become true when a key on event is done
	uint16_t rawFIFOCount=0;
	uint16_t bytesToTopOff=0;
	uint16_t multipleOf32b = 0;
	uint8_t deliveredBytes=0;
	uint8_t buf32[32];
	
	if(globalPause) return 0; //globalPause is from muTimerInt0.h
	if(countActiveChannels == 0) return 0; //nothing to play
	
	//Check the health of the FIFO buffer
	rawFIFOCount = PEEKW(VS_FIFO_COUNT);
	bytesToTopOff = CHUNK2K - (rawFIFOCount&0x07FF); //found how many bytes are left in the 2KB buffer
	multipleOf32b = bytesToTopOff>>5; //multiples of 32 bytes of stuff to top off the FIFO buffer

	for(i=0; i<multipleOf32b; i++) //multiples of 32 bytes
		{	
		//fetch data read pass
		// per 32-byte chunk in PCMLoopPass:
		for(uint8_t k=0; k<32; k++) sums[k] = 0;

		for(uint8_t j=0; j<MAX_ACTIVE_CHANNELS; j++)
		{
			if(!sfx[j].isPlaying) continue;
			uint16_t left = sfx[j].size - sfx[j].offset;
			uint8_t n = (left < 32) ? (uint8_t)left : 32;
			peek24Block(sfx[j].startAddr + sfx[j].offset, n);
			for(uint8_t k=0; k<n; k++) sums[k] += (int16_t)blk[k] - 128;
			sfx[j].offset += n;
			if(sfx[j].offset >= sfx[j].size) stopSound(j);
		}
		for(uint8_t k=0; k<32; k++)
		{
			int16_t s = sums[k];
			if(s > 127) s = 127;
			if(s < -128) s = -128;
			buf32[k] = (uint8_t)(s + 128);
		}			

			
		for(j=0; j<32; j++) 
			{
			POKE(VS_FIFO_DATA, buf32[j]);
			}
			
		if(countActiveChannels == 0) //over
				{
				silencePad();
				return 1;
				}
				
				
		} //end of what's needed to top off the FIFO 
	return 0;
}

uint8_t cheapPlay()
{
	uint32_t current = sfx[3].startAddr + (uint32_t)sfx[3].offset++;

		
	POKE(VS_FIFO_DATA, peek24(current));
	//printf("%02x",peek24(current));
	if(sfx[3].offset == sfx[3].size) return 1;
	hitspace();
	return 0;
}

#endif //__MUSFXPLAY_C
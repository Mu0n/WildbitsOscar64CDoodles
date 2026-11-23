#ifndef __MUSFXPLAY_H
#define __MUSFXPLAY_H

#include "f256lib.h"

#define MAX_ACTIVE_CHANNELS 16
#define WAV_HEADER_OFFSET 0x2C
#define SILENTBYTE        0x80
#define CHUNK2K 2048

typedef struct pCh {
uint32_t startAddr; //so you can stash it in memory
uint16_t size;      //so you know when to stop
uint16_t offset;    //current location between calls
bool isPlaying;     
uint8_t data; //current byte held at startAddr+offset
} pcmChannel;

void pcmHeaderPump(void);
void silencePad(void);
uint8_t mixChannels(void);
void setupSound(uint8_t, uint32_t, uint16_t);
void startSound(uint8_t);
void stopSound(uint8_t);
int8_t PCMLoopPass(void);

uint8_t cheapPlay(void);

#endif //__MUSFXPLAY_H
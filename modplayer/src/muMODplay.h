#ifndef MUMODPLAY_H
#define MUMODPLAY_H

#define MOD_BODY 0x180000


#define MAX_ACTIVE_CHANNELS 16
#define WAV_HEADER_OFFSET 0x2C
#define SILENTBYTE        0x80
#define CHUNK2K 2048

void copyToRAM(FILE *);
FILE *load_MOD_file(char *);
void checkMODHeader(FILE *);
int8_t playbackMOD(FILE *, bool, bool);
uint16_t readBigEndianWord(uint32_t);
void pcmHeaderPump(void);
				
uint8_t mixChannels(void);			   
void read2KChunk(uint8_t, uint32_t);
extern uint32_t tooBigWait;
extern bool comeRightTrough;
extern uint32_t needle;
extern uint32_t totalWait;
extern uint32_t loopBackTo;
extern uint32_t samplesSoFar;
extern uint16_t readDebug;
extern bool iRT;
extern bool oneLoop;

#endif // MUMODPLAY_H
/*
 * muSIDPlay.c: routines for loading a .rsd file (raw sid dumps) into memory, parsing 
 * its header in memory and parsing its data section in real time during your loop 
 * to play it as part of your music engine. These routines monopolize the Timer 0 that runs at the 25.175MHz dot clock,
 * so you must make do without it for other purposes in your program.
 *
 * Dependencies: your own program should just #include this file, muSIDPlay.c, which will in turn include muSID and muGen2RAM and their respective headers
 *
 * Typical usage:
 * 
 * 1a) keep your RSD file external at a hard coded path, and load it into
 *     high memory using loadSIDile("yourfile.rsd", 0x50000) where 0x50000 is a good address that gives you almost 196kb of space, more than enough
 *     than most rsd files. Select anything else if needed, of course above 0x10000. You can even use other 512kb SRAM banks
 * 1b) embed your RSD file. 
 *     With oscar64, use this at the top of your main source file:
(hashtagSymbol)pragma section( sidmus, 0)
(hashtagSymbol)pragma region( sidmus, 0x50000, 0x5FFFF, , , {sidmus} )
(hashtagSymbol)pragma data(sidmus)
__export const char rsd[] = {
	(hashtagSymbol)embed "../assets/mule.rsd"
};
(hashtagSymbol)pragma data(data)
 *
 *    With llvm-mos, use this at the top of your main source file:
EMBED(sidmus, "../assets/mule.rsd", 0x50000);
 *
 *  2) During your setup, use this only once: prepSIDForPlay(0x50000, size_in_bytes); //change the addresss if needed. we need size_in_bytes since there's no header in these kind of dumpy files
 *  3) During a loop pass, do this once per pass: SIDLoopPass();
 *  4) During a loop pass, do this to check if the SID playback has ended: if(isSIDDone()) { ... }
 *  5) Do this to "rewind" the RSD file at its beginning and start the playback over: rewindAndPlaySID();
 *  6) To load a new RSD file and start playing that one, do steps 1a+2 to load from a .rsd file or steps 1b+2 to get it from high memory
 *
 * v1.0 October 4th 2026
 * Written by Mu0n aka 1Bit Fever Dreams aka AnyBits Fever Dreams
 */

#ifndef MUSIDPLAY_C
#define MUSIDPLAY_C

#include "f256lib.h"
#include "muSid.h" //sid chip routines
#include "muSIDPlay.h" //useful routines
#include "muTimer0Int.h" //contains helper functions I often use
#include "muGen2RAM.h" //to access the extra 3 banks of SRAM available in Wildbits gen2 machines

static uint32_t needle; //pointer to high ram available in 2x only.
static uint32_t totalWait; //wait samples to figure out end of song
static uint32_t startAddr; //where the rsd in ram starts
static uint32_t loopBackTo; //loopback to this position
static uint32_t samplesSoFar; //done samples so far, to trigger end of song
static bool oneLoop = false; //for songs that have a loop, set this once and do one loop, then finish the song. hybrid approach for jukeboxing and authenticity

void prepSIDForPlay(uint32_t sourceAddress, uint32_t size) {
	clearSIDRegisters();
	shutAllSIDVoices();
	startAddr = sourceAddress; //often 0x50000, can be elsewhere
	samplesSoFar=0;
	loopBackTo=0;
	needle = sourceAddress;
	totalWait = size/25;
	setTimer0(0x7aE15);	
}

bool isSIDDone() {
	return (samplesSoFar >= totalWait);
}
void rewindAndPlaySID() {
	clearSIDRegisters();
	shutAllSIDVoices();
	oneLoop = false;
	needle = startAddr;
	samplesSoFar=0;
	loopBackTo=0;
	resetTimer0();
}

//Opens the rsd file from a file path to a target address in high SRAM
//if you use an embedded rsd file, then don't use this function
void loadSIDIntoRam(const char *name, uint32_t targetAddress)
{
	char buffer[255];//for the copy loop
	uint8_t bytesRead = 0;//for the copy loop
	uint32_t soFar = 0;//for the copy loop
	FILE *theSIDfile;
	
	//deal with the .rsd file and open it
	theSIDfile = fileOpen(name,"r"); // open file in read mode
	if(theSIDfile == NULL) {
		return;
		}
	
	fileSeek(theSIDfile, 0, SEEK_SET);
    	
	while(bytesRead = fileRead(buffer, sizeof(uint8_t), 255, theSIDfile) > 0)
		{
		for(uint8_t i=0; i<bytesRead; i++)
			{
			poke24(targetAddress+(uint32_t)i+(uint32_t)soFar, buffer[i]);
			}
		soFar+= bytesRead;
		}
	totalWait = soFar/25; //keep the end
	startAddr = targetAddress;
	//no longer need the file
	fileClose(theSIDfile);	
}


int8_t SIDLoopPass()
{
	uint8_t nextRead, countRead=0;
	uint8_t j;
	int8_t canPause = 0; //will only become true when a key on event is done

	if(PEEK(INT_PENDING_0)&0x10) //when the timer0 delay is up, go here
		{
		
		POKE(INT_PENDING_0, INT_TIMER_0);   // write 1 to clear the latched bit
		if((samplesSoFar >= totalWait)) 
		{
			if(loopBackTo == 0 || oneLoop == true) 
				{
				shutAllSIDVoices();
				return -1; //end of file, there was no loop to do
				}
			needle = loopBackTo; //loop is performed here
			samplesSoFar = 0;
			oneLoop = true;
		}
		for(j = 0; j<25; j++) //atomic read is a single line of 25 sid register dump data
			{
			uint8_t dat = peek24(needle++);
			POKE(SID1+j, dat);
			}
		samplesSoFar++;
		setTimer0(0x7aE15);	
		}
	return 0;
}

#endif //MUSIDPLAY_C
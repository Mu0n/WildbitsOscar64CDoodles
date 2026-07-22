/*
 * muVGMPlay.c: routines for loading a vgm file (with opl2/opl3 target data) into memory, parsing 
 * its header in memory and parsing its data section in real time during your loop 
 * to play it as part of your music engine. These routines monopolize the Timer 0 that runs at the 25.175MHz dot clock,
 * so you must make do without it for other purposes in your program.
 *
 * Dependencies: your own program should just #include this file, muVGMPlay.c, which will in turn include muOPL3 and muGen2RAM and their respective headers
 *
 * Typical usage:
 * 
 * 1a) keep your VGM file external at a hard coded path, and load it into
 *     high memory using loadVGMile("yourfile.vgm", 0x50000) where 0x50000 is a good address that gives you almost 196kb of space, more than enough
 *     than most VGM files. Select anything else if needed, of course above 0x10000. You can even use other 512kb SRAM banks
 * 1b) embed your VGM file. 
 *     With oscar64, use this at the top of your main source file:
(hashtagSymbol)pragma section( vgmmus, 0)
(hashtagSymbol)pragma region( vgmmus, 0x50000, 0x5FFFF, , , {vgmmus} )
(hashtagSymbol)pragma data(vgmmus)
__export const char smf[] = {
	(hashtagSymbol)embed "../assets/doom.vgm"
};
(hashtagSymbol)pragma data(data)
 *
 *    With llvm-mos, use this at the top of your main source file:
EMBED(vgmmus, "../assets/doom.vgm", 0x50000);
 *
 *  2) During your setup, use this only once: prepVGMForPlay(0x50000); //change the addresss if needed
 *  3) During a loop pass, do this once per pass: VGMLoopPass();
 *  4) During a loop pass, do this to check if the VGM playback has ended: if(isVGMDone()) { ... }
 *  5) Do this to "rewind" the VGM file at its beginning and start the playback over: rewindAndPlayVGM();
 *  6) To load a new VGM file and start playing that one, do steps 1a+2 to load from a .vgm file or steps 1b+2 to get it from high memory
 *
 * v1.0 July 22nd 2026
 * Written by Mu0n aka 1Bit Fever Dreams aka AnyBits Fever Dreams
 */

#include "f256lib.h"
#include "muOPL3.h" //opl3 chip routines
#include "muVGMPlay.h" //useful routines
#include "muTimer0Int.h" //contains helper functions I often use
#include "muGen2RAM.h" //to access the extra 3 banks of SRAM available in Wildbits gen2 machines

static uint32_t tooBigWait = 0x00000000; //keeps track of too big delays between events between vgmplay loop dips
static bool comeRightTrough; //lets a chain of 0 delay events happen when returning to a new passthrough of playback()
static uint32_t needle; //pointer to high ram available in 2x only.
static uint32_t totalWait; //wait samples to figure out end of song
static uint32_t startAddr; //where the vgm in ram starts
static uint32_t beginDataAddr; //where the vgm data starts
static uint32_t loopBackTo; //loopback to this position
static uint32_t samplesSoFar; //done samples so far, to trigger end of song
static uint32_t gd3Location; //gd3 tag so we can ignore iteration
static bool oneLoop = false; //for songs that have a loop, set this once and do one loop, then finish the song. hybrid approach for jukeboxing and authenticity

void prepVGMForPlay(uint32_t sourceAddress) {
	opl3_quietAll();
	startAddr = sourceAddress; //often 0x50000, can be elsewhere
	detectHeaderStructure();
	resetTimer0();
}

bool isVGMDone() {
	return (samplesSoFar >= totalWait);
}
void rewindAndPlayVGM() {
	opl3_quietAll();
	oneLoop = false;
	needle = beginDataAddr;
	samplesSoFar=0;
	resetTimer0();
}

//returns the start of the data inside the .VGM, past the header. Has to deal with various versions of vgm with different header sizes
uint8_t getStart(uint16_t ver)
{
	if(ver < 0x150) return 0x40;
	else return 0x00;
}


//Opens the vgm file from a file path to a target address in high SRAM
//if you use an embedded vgm file, then don't use this function
void loadVGMIntoRam(const char *name, uint32_t targetAddress)
{
	bool exitFlag = true; //for the copy loop
	char buffer[255];//for the copy loop
	uint8_t bytesRead = 0;//for the copy loop
	uint32_t soFar = 0;//for the copy loop
	FILE *theVGMfile;
	
	//deal with the .vgm file and open it
	theVGMfile = fileOpen(name,"r"); // open file in read mode
	if(theVGMfile == NULL) {
		return;
		}
	
	fileSeek(theVGMfile, 0, SEEK_SET);
    	
	while(exitFlag)
	{
		bytesRead = fileRead(buffer, sizeof(uint8_t), 255, theVGMfile);
		if(bytesRead != 255) exitFlag = false;
		for(uint8_t i=0; i<bytesRead; i++)
			{
			poke24(targetAddress+(uint32_t)i+(uint32_t)soFar, buffer[i]);
			}
		soFar+= bytesRead;
	}

	//no longer need the file
	fileClose(theVGMfile);	
}


//checks the header, number of tracks, etc. assumes the static startAddr has been set already
//if opl2 or opl3 mode has to be set, it will happen here
void detectHeaderStructure()
{
	uint8_t headerBuffer[16];
	uint16_t version=0;
	bool isOPL3 = false;
	uint8_t dataOffset=0x00;
	gd3Location = 0;
	oneLoop = false;	
	
	needle = startAddr; //start of header
	
	//check the header of the vgm file in high ram
	for(uint8_t i = 0; i<8; i++)
		{	
		for(uint8_t j = 0; j<16; j++) headerBuffer[j] = peek24(needle + (uint32_t)j);
		needle+=16;
	
		if(i==0) {
			version = (uint16_t)(headerBuffer[0x9]<<8) | (uint16_t)headerBuffer[0x8];
			dataOffset = getStart(version);
			}
		if(i==1)
			{
			gd3Location = (uint32_t)headerBuffer[0x4] | ((uint32_t)headerBuffer[0x5])<<8 | ((uint32_t)headerBuffer[6])<<16 | ((uint32_t)headerBuffer[7])<<24;
			totalWait = (uint32_t)headerBuffer[0x8] | ((uint32_t)headerBuffer[0x9])<<8 | ((uint32_t)headerBuffer[0xA])<<16 | ((uint32_t)headerBuffer[0xB])<<24;
				
			loopBackTo = (uint32_t)headerBuffer[0xC] | ((uint32_t)headerBuffer[0xD])<<8 | ((uint32_t)headerBuffer[0xE])<<16 | ((uint32_t)headerBuffer[0xF])<<24;
			}
		
		if(i==3 && dataOffset == 0) 
		{
			dataOffset = headerBuffer[4]+0x34;
		}
		if(i == 5)
			{
			uint32_t ym3812Clock =
				(uint32_t)headerBuffer[0] |
				((uint32_t)headerBuffer[1] << 8) |
				((uint32_t)headerBuffer[2] << 16) |
				((uint32_t)headerBuffer[3] << 24);

			uint32_t ymf262Clock =
				(uint32_t)headerBuffer[12] |
				((uint32_t)headerBuffer[13] << 8) |
				((uint32_t)headerBuffer[14] << 16) |
				((uint32_t)headerBuffer[15] << 24);

			if(ymf262Clock != 0)
				{
					// OPL3 mode
					opl3_write(0x105, 1);
					isOPL3 = true;
				}
			else if(ym3812Clock != 0)
				{
					// OPL2 mode
					opl3_write(0x105, 0);
					isOPL3 = false;
				}
			else
				{
					// No OPL chip declared
					// Default to OPL2 (safe)
					opl3_write(0x105, 0);
					isOPL3 = false;
				}
			}

				
		}
	printf("offs %02x addr %08lx", dataOffset, startAddr + (uint32_t)dataOffset);
	beginDataAddr = startAddr + (uint32_t)dataOffset;
	needle = beginDataAddr;
	if(loopBackTo!=0) loopBackTo = startAddr + (uint32_t)loopBackTo;
	if(gd3Location != 0) gd3Location = startAddr + gd3Location + (uint32_t)0x14;
	samplesSoFar=0;
		
}

int8_t VGMLoopPass()
{
	uint8_t nextRead, countRead=0;
	uint8_t reg, val;
	uint8_t hi, lo;
	int8_t canPause = 0; //will only become true when a key on event is done
		
	hi=0;lo=0;

	if(PEEK(INT_PENDING_0)&0x10 || comeRightTrough == true) //when the timer0 delay is up, go here
		{
		if(comeRightTrough == false) POKE(INT_PENDING_0,0x10); //clear the timer0 delay
			
		if(tooBigWait > 0 && comeRightTrough == false)
			{
			if(tooBigWait > 0x00FFFFFF) //this is going to require a full 0.666 and potentially more
				{
				setTimer0(0x00FFFFFF);
				tooBigWait -= 0x00FFFFFF;
				return 0;
				}
			else
				{
				setTimer0(tooBigWait); //one last loop iteration
				tooBigWait = 0; //expire the rest
				return 0;
				}
			}
		else
			{
			comeRightTrough = false;
			
			if((samplesSoFar >= totalWait || needle >= gd3Location) && gd3Location != 0) 
			{
				if(loopBackTo == 0 || oneLoop == true) 
					{
					opl3_quietAll();
					return -1; //end of file, there was no loop to do
					}
				needle = loopBackTo; //loop is performed here
				samplesSoFar = 0;
				oneLoop = true;
			}
			
			nextRead = peek24(needle++);
			countRead = 1; //bypass old file read check
			
			if (countRead == 1) {
				switch (nextRead) {
					case 0x30 ... 0x3F: //reserved for future use, one operand
						needle++;
						comeRightTrough = true;
						break;
					case 0x4F: //Game Gear PSG
						needle++;
						comeRightTrough = true;
						break;
					case 0x50: //PSG, TO DO
						needle++;
						comeRightTrough = true;
						break;
					case 0x51 ... 0x59: //YM2413, YM2612 p0, YM2612 p1, YM2151, YM2203, YM2608 p0, YM2608 p1, YM2610 p0, YM2610 p1
						needle+=2;
						comeRightTrough = true;
						break;
					case 0x5A:  // YMF3812 (opl2) write
						reg = peek24(needle++);
						val = peek24(needle++);
						opl3_write(reg, val);
						comeRightTrough = true;
						break;
					case 0x5B: //YM3256, ignore, 2 ops
					case 0x5C: //Y8950, ignore, 2 ops
					case 0x5D: //YMZ280B, ignore, 2 ops
						needle+=2;
						comeRightTrough=true;
						break;
					case 0x5E:  // YMF262 write port 0
						reg = peek24(needle++);
						val = peek24(needle++);
						opl3_write(reg, val);
						comeRightTrough = true;
						break;
					case 0x5F:  // YMF262 write port 1
						reg = peek24(needle++);
						val = peek24(needle++);
						opl3_write((0x100 | (uint16_t)reg), val);
						comeRightTrough = true;
						break;
					case 0x61:  // Wait n samples
						lo = peek24(needle++);
						hi = peek24(needle++);
						
						samplesSoFar+=(uint32_t)lo | ((uint32_t)hi)<<8;
						//tooBigWait = ((((uint32_t)hi)<<8)|((uint32_t)lo))*(uint32_t)0x23A;
						tooBigWait = ((((uint32_t)hi)<<8)|((uint32_t)lo))*(uint32_t)VGMTICKSPERSAMPLE;
						if(tooBigWait > 0x00FFFFFF) //this is going to require a full 0.666s and potentially more
							{
							setTimer0(0x00FFFFFF);
							tooBigWait -= 0x00FFFFFF;
							}
						else //this is under 0.666s
							{
							setTimer0(tooBigWait);
							tooBigWait = 0;
							}
						break;
					case 0x62: 
						setTimer0((uint32_t)735*(uint32_t)VGMTICKSPERSAMPLE);   // wait 1/60 of a second
						samplesSoFar+=735;
						break;
						
					case 0x63: 
						setTimer0((uint32_t)882*(uint32_t)VGMTICKSPERSAMPLE);  // wait 1/50th of a second
						samplesSoFar+=882;
						break;
					case 0x66: // End of sound data
						if (loopBackTo != 0) {
							needle = loopBackTo; 
							oneLoop = true;
							}
						else return -1;             // no loop
						break; 
					case 0x67: // data block
						needle+=2;
						uint32_t skippy = (peek24(needle)) | (peek24(needle+1)<<8) | (peek24(needle+2)<<16) | (peek24(needle+3)<<24);
						needle+=5+skippy;
						break; 
						
					case 0x68: // PCM RAM write, ignoring
						needle+=11;
						comeRightTrough=true;
						break;
						
					case 0x70 ... 0x7F: //wait n+1 sample, where n is the low nibble
						uint8_t samples = (nextRead & 0x0F) + 1;
						setTimer0(samples * VGMTICKSPERSAMPLE);
						samplesSoFar += samples;
						break;
					case 0x80: //wait n samples, where n is the low nibble, ignore write to DAC (could be a TO DO?)
						uint8_t samplesN = nextRead & 0x0F;
						setTimer0(samplesN * VGMTICKSPERSAMPLE);
						samplesSoFar += samplesN;
						break;
					case 0x90 ... 0x95: // DAC stream control write
						break;
					case 0xA0: //AY8910: TO DO, reroute to PSG posssibly? 2 operands
					case 0xAA: //NO IDEA WHAT THIS IS, but it seems to have 2 operands
						needle+=2;
						comeRightTrough = true;
						break;
					case 0x40 ... 0x4E: //reserved for future use, two operands, 0x40 Mikey
					case 0xB0 ... 0xBF: //RF5C68, RF5C164, PWM, GB DMG, NES, MultiPCM, uPD7759, MSM6248, MSM6295, HuC6280, Pokey, SAA0199, ES5506, GA20, 2 operands
						needle+=2;
						comeRightTrough = true;
						break;
					case 0xC0 ... 0xC8: //SegaPCM, RF5C68, RF5C164, MultiPCM, QSound, SCSP, WonderSwan, VSU, X1-010, all absent chips, 3 operands
					case 0xC9 ... 0xCF:
					case 0xD0 ... 0xD6: //YMF278B, YMF271, SCC1, K054539, C140, ES5503, ES5506, all absent chips, 3 operands
					case 0xD7 ... 0xDF: //reserved for future use, three operands
						needle+=3;
						comeRightTrough = true;
						break;
					case 0xE0: //seek to offset
						uint32_t off = (uint32_t)peek24(needle) |
									   (uint32_t)(peek24(needle+1) << 8) |
									   (uint32_t)(peek24(needle+2) << 16) |
									   (uint32_t)(peek24(needle+3) << 24);
						needle = beginDataAddr + off;   // not needle += 4
						comeRightTrough = true;
						break;
					case 0xE1 ... 0xFF: //E1: linked to C352 chip; others: reserved for future use, four operands
						needle+=4;
						comeRightTrough = true;
						break;
					default:
						comeRightTrough = true;
						return -1;
						break;
					}
				}
			}
		}
	return 0;
}

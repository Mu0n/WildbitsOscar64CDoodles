#ifndef MUTR2PLAY_C
#define MUTR2PLAY_C

/*
 * muTR2Play.c: routines for loading a tr2 file (with psg target data) into memory, parsing 
 * its header in memory and parsing its data section in real time during your loop 
 * to play it as part of your music engine. These routines monopolize the Timer 0 that runs at the 25.175MHz dot clock,
 * so you must make do without it for other purposes in your program.
 * The .tr2 format is from the jrtracker2 superbasic program by Ernesto Contreras, made in the F256Jr/F256K gen1 days.
 *
 * Dependencies: your own program should just #include this file, muTR2Play.c, which will in turn include muPSG and muGen2RAM and their respective headers
 *
 * Typical usage:
 * 
 * 1a) keep your TR2 file external at a hard coded path, and load it into
 *     high memory using loadTR2File("yourfile.tr2", 0x50000) where 0x50000 is a good address that gives you almost 196kb of space, more than enough
 *     than all tr2 files. Select anything else if needed, of course above 0x10000. You can even use other 512kb SRAM banks
 * 1b) embed your VGM file. 
 *     With oscar64, use this at the top of your main source file:
(hashtagSymbol)pragma section( tr2mus, 0)
(hashtagSymbol)pragma region( tr2mus, 0x50000, 0x5FFFF, , , {tr2mus} )
(hashtagSymbol)pragma data(tr2mus)
__export const char tr2f[] = {
	(hashtagSymbol)embed "../assets/afile.tr2"
};
(hashtagSymbol)pragma data(data)
 *
 *    With llvm-mos, use this at the top of your main source file:
EMBED(tr2mus, "../assets/afile.tr2", 0x50000);
 *
 *  2) During your setup, use this only once: prepTR2ForPlay(0x50000); //change the addresss if needed
 *  3) During a loop pass, do this once per pass: TR2LoopPass();
 *  4) During a loop pass, do this to check if the TR2 playback has ended: if(isTR2Done()) { ... }
 *  5) Do this to "rewind" the TR2 file at its beginning and start the playback over: rewindAndPlayTR2();
 *  6) To load a new TR2 file and start playing that one, do steps 1a+2 to load from a .tr2 file or steps 1b+2 to get it from high memory
 *
 * v1.0 September 8th 2026
 * Written by Mu0n aka 1Bit Fever Dreams aka AnyBits Fever Dreams
 */
 
#include "muTr2Play.h"
#include "muPSG.h"
#include "muGen2Ram.h"
#include "muTimer0.h"

int8_t TR2LoopPass()
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

			nextRead = peek24(needle++);
			countRead = 1; //bypass old file read check
			
			if (countRead == 1) {
				switch (nextRead) {
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
					case 0x66: // End of sound data
						if (loopBackTo != 0) {
							needle = loopBackTo; 
							oneLoop = true;
							}
						else return -1;             // no loop
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

#endif //MUTR2PLAY_C
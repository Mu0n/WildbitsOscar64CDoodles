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
 * v1.0 September 10th 2026
 * Written by Mu0n aka 1Bit Fever Dreams aka AnyBits Fever Dreams
 */
 
#include "f256lib.h"
#include "muTr2Play.h"
#include "muPSG.h"
#include "muGen2Ram.h"
#include "muTimer0Int.h"

static uint32_t tooBigWait = 0x00000000; //keeps track of too big delays between events between vgmplay loop dips
static bool comeRightTrough; //lets a chain of 0 delay events happen when returning to a new passthrough of playback()
static uint32_t needle; //pointer to high ram available in 2x only.
static uint32_t totalWait; //wait samples to figure out end of song
static uint32_t startAddr; //where the vgm in ram starts
static uint32_t beginDataAddr; //where the vgm data starts
static uint32_t loopBackTo; //loopback to this position
static bool oneLoop = false; //for songs that have a loop, set this once and do one loop, then finish the song. hybrid approach for jukeboxing and authenticity
static tr2Song theSongs;
static uint8_t theInitPage;
static uint8_t legatoPrevious[6]; //system for legato (i.e. tied) notes, needs previous one to fire off
static bool tr2Done = false;


void prepTR2ForPlay(uint32_t sourceAddress) {
	shutPSG();
	startAddr = sourceAddress; //often 0x50000, can be elsewhere
	detectHeaderStructure();
	
	for(uint8_t i=0; i<6;i++) legatoPrevious[i]=0;
	resetSong(0);
	
}

//Opens the tr2 file from a file path to a target address in high SRAM
//if you use an embedded tr2 file, then don't use this function
void loadTR2File(const char *name, uint32_t targetAddress)
{
	bool exitFlag = true; //for the copy loop
	char buffer[255];//for the copy loop
	uint8_t bytesRead = 0;//for the copy loop
	uint32_t soFar = 0;//for the copy loop
	FILE *theTr2file;
	
	//deal with the .vgm file and open it
	theTr2file = fileOpen(name,"r"); // open file in read mode
	if(theTr2file == NULL) {
		return;
		}
	
	fileSeek(theTr2file, 0, SEEK_SET);
    	
	while(exitFlag)
	{
		bytesRead = fileRead(buffer, sizeof(uint8_t), 255, theTr2file);
		if(bytesRead != 255) exitFlag = false;
		for(uint8_t i=0; i<bytesRead; i++)
			{
			poke24(targetAddress+(uint32_t)i+(uint32_t)soFar, buffer[i]);
			}
		soFar+= bytesRead;
	}

	//no longer need the file
	fileClose(theTr2file);	
}

void resetSong(uint8_t songNum)
{
uint16_t songOffset = (uint16_t)8 + (uint16_t)songNum*16;
//uint8_t song = peek24(startAddr + (uint32_t)songOffset);
//song = 0;

//theInitPage = peek24(startAddr + (uint32_t)8 + (uint32_t)songNum*16); //i.e. song 0 is at byte 8, song 1 is at byte 24
theInitPage = 0;

theSongs.songPtr = (uint16_t)256; //song pages, there are 8 possible ones. these contain pattern numbers. page 0 at byte 256, page 1 at byte 256+32, etc.
theSongs.patPtr	= (uint16_t)512; //pattern data, main area in jrtracker. pat 0 at 512, pat 1 at 512+256, etc.


uint8_t whichPat = peek24(startAddr + (uint32_t)theSongs.songPtr);
uint8_t whichDat = peek24(startAddr + (uint32_t)theSongs.patPtr);
//printf("INITpage %02x\nsongPt %04x val= %02x , patPt %04x val= %02x\n",theInitPage,theSongs.songPtr, whichPat, theSongs.patPtr, whichDat);
textGotoXY(0,8);
comeRightTrough = false;
tr2Done = false;
setTimer0(0x00066666*(7-theSongs.tempo/25)); //1 frame, will be adjusted to tempo
}

//checks the header, number of tracks, etc. assumes the static startAddr has been set already
void detectHeaderStructure()
{
	uint8_t subVersion = 0;
	uint8_t topPattern = 0;
		
	uint16_t version=0;
	uint8_t headerBuffer[16];
	uint16_t tickPerRow = 10 - oneLoop = false;	
	
	//song init info
	theSongs.initPage = 0;
	theSongs.name[0] = '\0';

	//8 byte File Header SECTION
	needle = startAddr; //start of header
	
	//PSG Header
	//if(peek24(needle) == 'P' && peek24(needle + (uint32_t)1) == 'S' && peek24(needle+(uint32_t)2)=='G') textPrint("PSG header found\n");
	needle+=(uint32_t)3;
	
	theSongs.subVersion = peek24(needle);
	//textPrint("subversion ");textPrintInt(theSongs.subVersion);textPrint("\n");
	needle++;
	
	needle++; //skip over byte 4, count of pattern page, often left 0, while it was fixed to 8
	needle++; //skip over byte 5, pattern size, always 32
	
	topPattern = peek24(needle); //top pattern number used
	needle++;
	
	needle++; //skip over byte 7, max number of song, was 8 in v1, is now 4 in v2, never used
	
	//Song Index SECTION - 4 songs are used here at 16 bytes each, but space for 8 is reserved

	theSongs.initPage = peek24(needle); needle++;
	theSongs.tempo = peek24(needle); needle++;
	for(uint8_t j=0; j<14; j++)
		{
		theSongs.name[j] = peek24(needle); needle++;
		}
	theSongs.name[14] = '\0';
	//textPrint("song name ");textPrint(theSongs.name);textPrint("\n");
	
	resetSong(0);
		
}

bool isTR2Done() {
	return tr2Done ;
}

void rewindAndPlayTR2() {
	//textPrint("will rewind\n");
	shutPSG();
	
	for(uint8_t i=0; i<6;i++) legatoPrevious[i]=0;
	resetSong(0);
}

void dealKey()
{
	while(true)
	{
	kernelNextEvent();
	if(kernelEventData.type == kernelEvent(key.PRESSED)) return;
	}
}
int8_t TR2LoopPass()
{
	static uint8_t chanIndex = 0;
	static uint8_t currow = 0;
	uint8_t nextRead;
	int8_t canPause = 0; //will only become true when a key on event is done
	

	if(PEEK(INT_PENDING_0)&0x10 || comeRightTrough == true) //when the timer0 delay is up, go here
		{
		if(comeRightTrough == false) 
		{
			POKE(INT_PENDING_0,0x10); //clear the timer0 delay
		}

			//uint8_t tempo = peek24(startAddr + (uint32_t)theSongs.songPtr);
			nextRead = peek24(startAddr + (uint32_t)theSongs.patPtr);
			
			//printf("songPt %04x val= %02x , patPt %04x val= %02x\n",theSongs.songPtr, tempo, theSongs.patPtr, nextRead);
			//dealKey();
			
			if(chanIndex != 7)
				{
				switch (nextRead) {
					case 0x00: //empty note, skip
						break;
					case 22 ... 84: //note detected
						//chan is either 0x00 (chan1), 0x20 (chan2), 0x40 (chan3) or 0x70 (noise)
						//addr is from psgAddr[i] where i = 0 to 6 (7 unused)
						//lobyte is from psgLow[]
						//hibyte is from psgHigh[]
						//velo is from 0x0 to 0xF
						if(legatoPrevious[chanIndex] == (nextRead & 0x7F)) //previous was not legato
							psgNoteOff(chanToBytes[chanIndex], psgAddr[chanIndex]);
						//small delay needed?? unneeded in the superbasic version
						psgNoteOn(chanToBytes[chanIndex], psgAddr[chanIndex], psgLow[nextRead],psgHigh[nextRead], 0x08);
						break;
					case 85: //note off
						psgNoteOff(chanToBytes[chanIndex], psgAddr[chanIndex]);
						break;
				    case 125:
					case 86: //end of pattern
						uint8_t nextPattern = peek24(startAddr + (uint32_t)theSongs.songPtr);
						//textPrint("code 86 detected, songptr: ");textPrintInt(nextPattern);textPrint("\n");
						theSongs.songPtr++;
						nextPattern = peek24(startAddr + (uint32_t)theSongs.songPtr);
					    //textPrint("upcoming songptr: ");textPrintInt(nextPattern);textPrint("\n");
						currow = 0;
						if(nextPattern == 0)
							{
							tr2Done = true;
							return -1; //end of song
							}
						
						theSongs.patPtr = (uint16_t)512 + (uint16_t)(theInitPage - 1)*256 + (uint16_t)nextPattern*256;
						break;
					case 129 ... 212: //note value | 128 means legato note, just switch the frequency without a note off note on
						psgNoteOn(chanToBytes[chanIndex], psgAddr[chanIndex], psgLow[nextRead&0x7F],psgHigh[nextRead&0x7F], 0x08);
						break;
					default:
						break;
					
					}// end of switch
				
				} //end of the if not chanIndex 7
			
			theSongs.patPtr++;
			
			
			chanIndex++; 
			if(chanIndex == 8) //delay needed after the end of the row
				{
				chanIndex = 0;
				
				currow++;
				if(currow == 32)
					{
					theSongs.songPtr++;
					uint8_t nextPattern = peek24(startAddr + (uint32_t)theSongs.songPtr);
					currow = 0;
					if(nextPattern == 0) 
						{
						tr2Done = true;
						return -1; //end of song
						}
					theSongs.patPtr = (uint16_t)512 + (uint16_t)(theInitPage - 1)*256 + (uint16_t)nextPattern*256;
					}
				
				setTimer0(0x00066666*(10-theSongs.tempo/25)); //1 frame, will be adjusted to tempo
				comeRightTrough = false;
				}
			else comeRightTrough = true; //no delay when we're not done with a .tr2 pattern row 
				
		}//end of deal with a timer or comeRightTrough
	return 0;
}

#endif //MUTR2PLAY_C
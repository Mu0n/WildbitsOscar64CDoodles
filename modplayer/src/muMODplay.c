
#ifndef MUMODPLAY_C
#define MUMODPLAY_C


#include "f256lib.h"
#include "muUtils.h" //useful routines
#include "muMODplay.h" //useful routines
#include "textUI.h"
#include "muVS1053b.h"
#include "muGen2RAM.h"
#include "muTimers.h"
#include "muTimer0Int.h"

uint32_t tooBigWait = 0x00000000; //keeps track of too big delays between events between vgmplay loop dips
bool comeRightTrough; //lets a chain of 0 delay events happen when returning to a new passthrough of playback()
uint32_t needle; //pointer to high ram available in 2x only.
uint32_t totalWait; //wait samples to figure out end of song
uint32_t loopBackTo; //loopback to this position
uint32_t samplesSoFar; //done samples so far, to trigger end of song
uint32_t gd3Location; //gd3 tag so we can ignore iteration

bool oneLoop = false; //for songs that have a loop, set this once and do one loop, then finish the song. hybrid approach for jukeboxing and authenticity

uint32_t instAddr[31]; //instrument offsets in the data
uint16_t instLength[31]; //sample lengths
uint32_t chan0Fixed;
uint32_t itersFixed = 0;

bool nearingEnd = false;
bool hasEnded = true;
bool isPlaying = false;



static uint8_t countActiveChannels = 0;
static pcmChannel sfx[MAX_ACTIVE_CHANNELS];
static uint8_t chBuf[MAX_ACTIVE_CHANNELS][32];

const uint8_t pcmHeader[]=
	{
	0x52, 0x49, 0x46, 0x46, 0x06, 0x3a, 0x00, 0x00, 0x57, 0x41, 0x56, 0x45, 0x66, 0x6d, 0x74, 0x20,
	0x10, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x22, 0x56, 0x00, 0x00, 0x22, 0x56, 0x00, 0x00,
	0x01, 0x00, 0x08, 0x00, 0x64, 0x61, 0x74, 0x61, 0xFF, 0xFF, 0xFF, 0xFF
	}; //header for 8-bit, unsigned, 22.05kHz wav PCM files

static const uint16_t palPeriods[60] = {
    1712, 1616, 1524, 1440, 1356, 1280,
    1208, 1140, 1076, 1016,  960,  906,
     856,  808,  762,  720,  678,  640,
     604,  570,  538,  508,  480,  453,
     428,  404,  381,  360,  339,  320,
     302,  285,  269,  254,  240,  226,
     214,  202,  190,  180,  170,  160,
     151,  143,  135,  127,  120,  113,
     107,  101,   95,   90,   85,   80,
      75,   71,   67,   63,   60,   56
};
uint8_t periodIndex = 30;

volatile uint8_t g_fp_last_status = 0;



void pcmHeaderPump()
{
	for(uint8_t i=0;i<WAV_HEADER_OFFSET;i++) POKE(VS_FIFO_DATA, pcmHeader[i]);
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

#define ONEPASS 32
#define OUTERPASS 64

//ONEPASS * OUTERPASS = 2048 by default


void read2KChunk(uint8_t index, uint32_t totalOut)
{	uint32_t endCap = (uint32_t)instLength[index] * (uint32_t)2;

	if(hasEnded) return;

    //check by how much we must advance the integer based parser of the sample
	//float increment = (float)srcRate / (float)dstRate;

	if(nearingEnd) //this is the end phase
		{
/*
		for(uint8_t i=0;i<ONEPASS;i++) //do this 32 times * 64 bytes = 2048 bytes
			{
			while(2048 - (PEEKW(VS_FIFO_COUNT)&0x07FF) < 64)
				; //wait for a 64 bytes space that's free in the FIFO at least
				
			for(uint8_t j=0;j<64;j++)	POKE(VS_FIFO_DATA, 128);	//empty out the next 64 bytes
			}
*/			
		nearingEnd = false;
		isPlaying = false;
		hasEnded = true;
		return;
		}
		
	
	for(uint8_t i=0;i<OUTERPASS;i++) //heavy copying is done here
		{
		if((chan0Fixed>>16) >= endCap) {nearingEnd = true; return;} //guards against overrun too soon
			
		if(((chan0Fixed>>16) + (uint32_t)ONEPASS) <= endCap) 
		{
			while(2048 - (PEEKW(VS_FIFO_COUNT)&0x07FF) < ONEPASS)
				;
			
			for(uint8_t j=0;j<ONEPASS;j++) 
			{
				uint32_t idx = (chan0Fixed >> 16) + instAddr[index]; //integer part = sample index
				uint32_t idx1 = idx + 1;
				
				if(idx1 >= endCap) idx1 = idx;
				
				uint8_t frac8 = (uint8_t)(chan0Fixed >> 8); //top 8 bits of fraction
				
				int16_t s0 = (int16_t)(int8_t)FAR_PEEK(0x10000 + idx);
				int16_t s1 = (int16_t)(int8_t)FAR_PEEK(0x10000 + idx1);
				
				int16_t out = s0 + (int16_t)(((int16_t)(s1-s0) * (int16_t)frac8) >> 8);
				
				POKE(VS_FIFO_DATA, (uint8_t)(out + 128u)); //send data out
				
				//POKE(VS_FIFO_DATA, (uint8_t)(FAR_PEEK(0x10000+(uint32_t)chan0Needle) + 128u)); //send data out
				
				
				//uint32_t startIndex = (uint32_t) chan0Floater; //round down to find the leftmost index
				//uint8_t startValue=FAR_PEEK(0x10000+startIndex); //get the leftmost value
				
				//uint8_t endValue = FAR_PEEK(0x10000+ startIndex + (uint32_t) 1); //get the rightmost value

//		      float slope = (int16_t)((int16_t)endValue - (int16_t)startValue);
			  //float frac = chan0Floater - (float)startIndex;

//			   float interp = (float)startValue + slope*frac; //interpolate based on where we at
			   
			   
//				POKE(VS_FIFO_DATA, (uint8_t)((uint8_t)interp + 128u)); //send data out
				
			//	chan0Floater += mathFloatDiv(160.8569, (float)srcRate);
			
				chan0Fixed += itersFixed;
				//chan0Needle = (uint16_t)(chan0Fixed >> 16);
				
				//chan0Floater += iters;//advance the chan0Floater
			    //chan0Needle = (uint16_t)chan0Floater; //round down to update the integer based index, used for end condition detection

				//POKE(VS_FIFO_DATA, next_sample((*outIndex)++, srcRate, dstRate, endCap));

			}
		}
		else //starting to reach the end
			{
			uint16_t howManyLeft = (uint16_t)(endCap - (chan0Fixed >> 16));
/*
textGotoXY(0,0);
			textPrint("sz: ");textGotoXY(4,0);printf("%08lx",endCap);
textGotoXY(20,0);			textPrint("c0N: ");textGotoXY(25,0);printf("%08lx",chan0Needle);
textGotoXY(40,0);			textPrint("HML: ");textGotoXY(45,0);printf("%02x",howManyLeft);
hitspace();
*/
			while((uint32_t)2048 - (uint32_t)(PEEKW(VS_FIFO_COUNT)&0x07FF) < (uint16_t)howManyLeft)
				;
			
			
			for(uint16_t j=0;j<howManyLeft;j++) 
			{
				uint32_t idx = (chan0Fixed >> 16) + instAddr[index]; //integer part = sample index
				uint32_t idx1 = idx + 1;
				
				if(idx1 >= endCap) idx1 = idx;
				
				
				uint8_t frac8 = (uint8_t)(chan0Fixed >> 8); //top 8 bits of fraction
				
				int16_t s0 = (int16_t)(int8_t)FAR_PEEK(0x10000 + idx);
				int16_t s1 = (int16_t)(int8_t)FAR_PEEK(0x10000 + idx1);
				
				int16_t out = s0 + (int16_t)(((int16_t)(s1-s0) * (int16_t)frac8) >> 8);
				
				POKE(VS_FIFO_DATA, (uint8_t)(out + 128u)); //send data out
				 
				chan0Fixed += itersFixed;
				//chan0Needle = (uint16_t)(chan0Fixed >> 16);
				
				
				//POKE(VS_FIFO_DATA, (uint8_t)(FAR_PEEK(0x10000+(uint32_t)chan0Needle) +128u));

				//chan0Floater += iters;
			    //chan0Needle = (uint16_t)chan0Floater;


				//POKE(VS_FIFO_DATA, next_sample((*outIndex)++, srcRate, dstRate, endCap));
			}
			nearingEnd = true;
			//lowVol();
			return;
			}
		}
}

//Opens the std VGM file
//__attribute__((optnone))
FILE *load_MOD_file(char *name) {
	FILE *theMODfile;
	
	theMODfile = fileOpen(name,"r"); // open file in read mode
	if(theMODfile == NULL) {
		return NULL;
		}
	return theMODfile;
}

void copyToRAM(FILE *theMODfile)
{
	bool exitFlag = true;
	char buffer[255];
	uint8_t bytesRead = 0;
	uint32_t soFar = 0;
	
	while(exitFlag)
	{
		bytesRead = fileRead(buffer, sizeof(uint8_t), 255, theMODfile);
		if(bytesRead != 255) exitFlag = false;
		for(uint8_t i=0; i<bytesRead; i++)
			{
			poke24(MOD_BODY+(uint32_t)i+(uint32_t)soFar, buffer[i]);
			}
		soFar+= bytesRead;
	}
	/*
	bitmapSetVisible(0,false);
	textGotoXY(0,0);
	for(uint8_t i =0; i<25; i++)
	{
		for(uint8_t j=0;j<16; j++)
		{
			printf("%02x",peek24(MOD_BODY+(uint32_t)j+((uint32_t)i*(uint32_t)16)));
		}
		printf("\n");
	}
	hitspace();
*/
}

uint16_t readBigEndianWord(uint32_t addr)
{
	return (((uint16_t)peek24(addr))<<8) | (uint16_t)(peek24(addr+1));
}
void checkMODHeader(FILE *theMODfile)
{
	uint8_t name[22];
	uint8_t numPatterns=0;
	uint16_t i=0, j=0,k=0;

	uint16_t sampleSize;
	uint8_t testByte=0;
	uint8_t *ptr;
	
	uint32_t testSize = 0L;
	

	copyToRAM(theMODfile);
	fileClose(theMODfile);
	

	//mod file name
	for(i=0; i<20; i++) name[i] = peek24(MOD_BODY + (uint32_t)i);
	name[19]='\0';//make it C terminated
	printf("\nFile name: %20s",name);
	
	//detect max pattern number, lets you skip the full header and go to sample data bytes
	numPatterns = 0;
	for(i=0; i<127;i++)
		{
		testByte = peek24(MOD_BODY + (uint32_t)952 + (uint32_t)i);	
		if(testByte > numPatterns) numPatterns = testByte;
		}
	numPatterns++;
	
	textGotoXY(50,0);
	printf("\nNb of patterns: %d",numPatterns);
	


	//pattern headers
	for(i=0; i<31; i++)
		{

		instLength[i] = readBigEndianWord(MOD_BODY + (uint32_t)(i*30 + 42)); //read sample size in big endian, flipped to work small endian
		textGotoXY(0,5+i);
/*
		modHead.inst[i].sampleLength = 0;
		textGotoXY(0,5+i);
		for(uint8_t j=0; j<22; j++) modHead.inst[i].name[j] = peek24(MOD_BODY + (uint32_t)(20+i*30+j)); //go to start of sample i's header data and read name of sample
		modHead.inst[i].name[21]='\0'; //make the sample name C terminated
		modHead.inst[i].sampleLength = readBigEndianWord(MOD_BODY + (uint32_t)(i*30 + 42)); //read sample size in big endian, flipped to work small endian
		modHead.inst[i].fine = peek24(MOD_BODY + MOD_BODY + (uint32_t)(i*30 + 44));//fine tune value
		modHead.inst[i].volume = peek24(MOD_BODY + MOD_BODY + (uint32_t)(i*30 + 45));//volume for sample
		modHead.inst[i].loopStart = readBigEndianWord(MOD_BODY + MOD_BODY + (uint32_t)(i*30 + 46));//start and repeat length to deal with later
		modHead.inst[i].loopLength = readBigEndianWord(MOD_BODY + MOD_BODY + (uint32_t)(i*30 + 48));
*/		
		textPrint("Sample ");
		if(i+1<10)textPrint(" "); //align with the rest when the number is small
		textPrintInt(i+1);textPrint(" ");
		textPrintInt(2*instLength[i]);textPrint(" bytes");


		}
		hitspace();

	textPrint("spl r ");
	
	uint16_t soFar = 0; //offset from 0x10000, where stuff will be copied to
	uint32_t sampleBase = MOD_BODY + (uint32_t)1084+(uint32_t)numPatterns*(uint32_t)1024; //reach the start of the sample data

	for(uint8_t i=0;i<31;i++) //copy samples
		{
		instAddr[i] = soFar;

		textGotoXY(40,5+i);
		printf("%08lx",instAddr[i] + 0x10000);
		for(uint32_t j=0; j< instLength[i] * 2; j++)
			{
			uint8_t dataByte = peek24(sampleBase + (uint32_t)soFar);
			FAR_POKE(0x10000 + (uint32_t)soFar++, dataByte);
			}
		}
    
	textPrint("cpy w ");
	//test playback
	
	uint32_t srcRate = palPeriods[periodIndex++];
	uint32_t dstRate = 22050;
	uint32_t totalOut = instLength[0] * 2;

	pcmHeaderPump(); //prep for 8bit mono unsigned 22.05 kHz

	textPrint(" header sent. ");
bool exitFlag = true;
uint8_t chosen = 0;

	while(exitFlag)
	{
	if(isPlaying)
		{
			
		//printf("\nc0F %08lx",chan0Fixed); 
		read2KChunk(chosen - 0x31, totalOut);
		}
		
	kernelNextEvent();
	if(kernelEventData.type == kernelEvent(key.PRESSED) && hasEnded)
		{	
		chosen = kernelEventData.u.key.raw ;
		switch(chosen)
			{

			case 0x31 ... 0x39:	//1 to 9
				hasEnded = false;
				nearingEnd = false;
				isPlaying = true;

				srcRate = palPeriods[periodIndex++]; //change note across the index
				if(periodIndex == 60) periodIndex = 25; //loop to start

				//chan0Floater = (float)chan0Needle;
				totalOut = instLength[chosen - 0x31] * 2;
				//iters = (float)160.8569/((float)srcRate);
				
				float actualSampleRate = 3546895UL / (float)srcRate;
				
				itersFixed = ((3546895UL / (uint32_t)srcRate) << 8) / 
             ((uint32_t)dstRate >> 8);
				
				chan0Fixed = 0;
				//chan0Needle = instAddr[chosen - 0x31];
				
				printf("\nasr %f addr %08lx itersF %08lx",actualSampleRate,instAddr[chosen - 0x31] , itersFixed); 
				
				
				
				break;

			case 0x71: //q
				exitFlag = false;
				break;
			}
		}	
	}


	textPrint(" done with loop. ");
hitspace();
}

int8_t playbackMOD(FILE *theMODfile, bool iRT, bool pReq)
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
			//countRead = fileRead(&nextRead, sizeof(uint8_t), 1, theMODfile);
			
			if((samplesSoFar >= totalWait || needle >= gd3Location) && gd3Location != 0) 
			{
				if(loopBackTo == 0 || oneLoop == true) return -1; //end of file, there was no loop to do
				needle = loopBackTo; //loop is performed here
				samplesSoFar = 0;
				oneLoop = true;
			}
			nextRead = peek24(needle++);
			countRead = 1; //bypass old file read check
			
			//if(readDebug<40)textGotoXY(0,readDebug++);printf("command %02x",nextRead);
			
			
			if (countRead == 1) {
				switch (nextRead) {
					case 0x5A:  // YMF3812 (opl2) write
						//fileRead(&regval, sizeof(uint8_t), 2, theMODfile);
						reg = peek24(needle++);
						val = peek24(needle++);
						//fileRead(&val, sizeof(uint8_t), 1, theMODfile);
			//opl3_write(reg, val);
			//if(opl3_shadow(reg,val,0,iRT)==1) canPause = -2;
						comeRightTrough = true;
						//setTimer0(1);
						break;
					case 0x5E:  // YMF262 write port 0
						//fileRead(&regval, sizeof(uint8_t), 2, theMODfile);
						reg = peek24(needle++);
						val = peek24(needle++);
						//fileRead(&val, sizeof(uint8_t), 1, theMODfile);
			//opl3_write(reg, val);
			//if(opl3_shadow(reg,val,0,iRT)==1) canPause = -2;
						comeRightTrough = true;
						//setTimer0(1);
						break;
						
					case 0x5F:  // YMF262 write port 1
						//fileRead(&regval, sizeof(uint8_t), 2, theMODfile);
						reg = peek24(needle++);
						val = peek24(needle++);
						//fileRead(&val, sizeof(uint8_t), 1, theMODfile);
			//opl3_write((0x100 | (uint16_t)reg), val);
			//if(opl3_shadow(reg,val,1,iRT)==1) canPause = -2;
						comeRightTrough = true;
						//setTimer0(1);
						break;
						
					case 0x61:  // Wait n samples
						lo = peek24(needle++);
						hi = peek24(needle++);
						
						samplesSoFar+=(uint32_t)lo | ((uint32_t)hi)<<8;
						//fileRead(&lo, sizeof(uint8_t), 1, theMODfile);
						//fileRead(&hi, sizeof(uint8_t), 1, theMODfile);
						tooBigWait = ((((uint32_t)hi)<<8)|((uint32_t)lo))*(uint32_t)0x23A;
						
						//tooBigWait = mathUnsignedMultiply( (((uint16_t)hi)<<8)|((uint16_t)lo), 256);
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
						setTimer0(0x66666);   // wait 1/60 of a second
						samplesSoFar+=735;
						break;
						
					case 0x63: 
						setTimer0(0x7aE15);  // wait 1/50th of a second
						samplesSoFar+=882;
						break;
					case 0x66: // End of sound data
						return -1;
						if(loopBackTo == 0 && oneLoop == true) return -1;
						else if(loopBackTo != 0) oneLoop = true;
						comeRightTrough = true;
						break;  
					case 0x67: // data block
						needle+=2;
						uint32_t skippy = (peek24(needle)) | (peek24(needle+1)<<8) | (peek24(needle+2)<<16) | (peek24(needle+3)<<24);
						needle+=4+skippy;
						break;  
					case 0x30 ... 0x3F: //skip one data byte commands
					case 0x4F:
					case 0x50:
						//fileRead(&reg, sizeof(uint8_t), 1, theMODfile);
						needle++;
						
						comeRightTrough = true;
						//setTimer0(1);
						break;
						
					case 0x40 ... 0x4E: //skip two data bytes commands
					case 0x51 ... 0x59:
					case 0x5B ... 0x5D:
					case 0xA0:
					case 0xB0 ... 0xC8:
						
						needle+=2;
						//fileRead(&reg, sizeof(uint8_t), 1, theMODfile);
						//fileRead(&reg, sizeof(uint8_t), 1, theMODfile);
						comeRightTrough = true;
						//setTimer0(1);
						break;
						
					case 0xD0 ... 0xDF: //skip 3 data bytes commands
					case 0xC9 ... 0xCF:
						needle+=3;
						//fileRead(&reg, sizeof(uint8_t), 1, theMODfile);
						//fileRead(&reg, sizeof(uint8_t), 1, theMODfile);
						//fileRead(&reg, sizeof(uint8_t), 1, theMODfile);
						comeRightTrough = true;
						//setTimer0(1);
						break;


					case 0xE2 ... 0xFF://skip 4 data bytes commands
						needle+=4;
						comeRightTrough = true;
						break;
					default:
					    //printf("unsupported command %02x\n",nextRead);
						comeRightTrough = true;
						//setTimer0(1);
						break;
					}
				}
			}
		}
	if(pReq) return canPause;
	else return 0;
}

#endif //MUMODPLAY_C

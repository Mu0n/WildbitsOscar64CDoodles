/*
 * muVGMPlay.h: routines for loading a vgm file (with opl2/opl3 target data) into memory, parsing 
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
#ifndef MUVGMPLAY_H
#define MUVGMPLAY_H

#define VGMTICKSPERSAMPLE 571

//utility function to parse some value in the vgm file header, internal use
uint8_t getStart(uint16_t);

//used during the prep of a VGM file
void loadVGMIntoRam(const char *, uint32_t); //skip using this if the .vgm if embedded
void prepVGMForPlay(uint32_t); //main workhorse during prep
void detectHeaderStructure(void); //sets the proper data start of the vgm past the header, detects if a loop is needed

//used during playback
bool isVGMDone(void); //tests to see if the end of song was reached
void rewindAndPlayVGM(void); //assumes it's been preped, go back to start and launch playback
int8_t VGMLoopPass(void); //use this in your project during playback

#endif // MUVGMPLAY_H
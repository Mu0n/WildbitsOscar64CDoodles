/*
 * muSIDPlay.h: routines for loading a .rsd file (raw sid dumps) into memory, parsing 
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
 *  2) During your setup, use this only once: prepSIDForPlay(0x50000); //change the addresss if needed
 *  3) During a loop pass, do this once per pass: SIDLoopPass();
 *  4) During a loop pass, do this to check if the SID playback has ended: if(isSIDDone()) { ... }
 *  5) Do this to "rewind" the RSD file at its beginning and start the playback over: rewindAndPlaySID();
 *  6) To load a new RSD file and start playing that one, do steps 1a+2 to load from a .rsd file or steps 1b+2 to get it from high memory
 *
 * v1.0 October 4th 2026
 * Written by Mu0n aka 1Bit Fever Dreams aka AnyBits Fever Dreams
 */
#ifndef MUSIDPLAY_H
#define MUSIDPLAY_H

//used during the prep of a RSD file
void loadSIDIntoRam(const char *, uint32_t); //skip using this if the .rsd if embedded
void prepSIDForPlay(uint32_t, uint32_t); //main workhorse during prep

//used during playback
bool isSIDDone(void); //tests to see if the end of song was reached
void rewindAndPlaySID(void); //assumes it's been preped, go back to start and launch playback
int8_t SIDLoopPass(void); //use this in your project during playback

#endif // MUSIDPLAY_H
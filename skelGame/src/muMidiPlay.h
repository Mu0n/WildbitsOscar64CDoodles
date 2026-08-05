/*
 * muMIDIPlay.h: routines for loading a standard midi file (type 0 or type 1 but not type 2) into memory, parsing 
 * its header in memory to detect every MIDI playback attribute and parsing its track(s) in real time during your loop 
 * to play it as part of your music engine. These routines monopolize the Timer 0 that runs at the 25.175MHz dot clock,
 * so you must make do without it for other purposes in your program.
 *
 * Dependencies: your own program should just #include this file, muMidiPlay.c, which will in turn include muTimer0Int, muMidi, muGen2Ram and their respective headers
 *
 * Typical usage:
 * 
 * 1a) keep your standard midi file external and at the same location as your pgz/pgx program, and load it into
 *     high memory using loadSMFile("yourfile.mid", 0x50000) where 0x50000 is a good address that gives you almost 196kb of space, more than enough
 *     than most MIDI files. Select anything else if needed, of course above 0x10000.
 * 1b) embed your MIDI file. 
 *     With oscar64, use this at the top of your main source file:
(hashtagSymbol)pragma section( midimus, 0)
(hashtagSymbol)pragma region( midimus, 0x50000, 0x5FFFF, , , {midimus} )
(hashtagSymbol)pragma data(midimus)
__export const char smf[] = {
	(hashtagSymbol)embed "../assets/canyon.mid"
};
(hashtagSymbol)pragma data(data)
 *
 *    With llvm-mos, use this at the top of your main source file:
EMBED(canyon, "../assets/canyon.mid", 0x50000);
 *
 *  2) During your setup, use this only once: prepMIDIForPlay(0x50000); //change the addresss if needed
 *  3) During a loop pass, do this once per pass: midiLoopPass();
 *  4) During a loop pass, do this to check if the midi playback has ended: if(isMIDIDone()) { ... }
 *  5) Do this to "rewind" the midi file at its beginning and start the playback over: rewindAndPlayMIDI();
 *  6) To load a new MIDI file and start playing that one, do steps 1a+2 to load from a .mid file or steps 1b+2 to get it from high memory
 *
 * v1.1 July 22nd 2026
 * Written by Mu0n aka 1Bit Fever Dreams aka AnyBits Fever Dreams
 */
 

#ifndef MUMIDIPLAY_H
#define MUMIDIPLAY_H

typedef struct MIDITrackParser {
	uint32_t length, offset, start;
	uint32_t delta;
	uint8_t cmd[6];
	uint8_t lastCmd;
	bool is2B;
	bool isDone;
} MIDTrackP;

typedef struct MIDIParser {
	uint16_t nbTracks;
	uint16_t ticks;
	uint32_t timer0PerTick;
	uint32_t progTime;
	bool isWaiting;
	uint32_t cuedDelta;
	uint16_t cuedIndex;
	uint16_t isMasterDone;
	struct MIDITrackParser *tracks;
} MIDP;


//utility functions to parse some values in the std midi file header
uint16_t readBigEndian16(uint32_t);
uint32_t readBigEndian32(uint32_t);

//used during the prep of a MIDI file
uint8_t loadSMFile(char *, uint32_t); //skip using this if the .mid if embedded
void prepMIDIForPlay(uint32_t); //main workhorse during prep
void detectStructure(uint16_t, struct midiRecord *); //do this first
void initTrack(uint32_t); //do this second
void destroyTrack(void); //do this if you need to load another file


//used during playback
bool isMIDIDone(void); //tests to see if the end of song was reached
void rewindAndPlayMIDI(void); //assumes it's been preped, go back to start and launch playback
void midiLoopPass(void); //use this in your project during playback
void playMidi(void);
uint8_t readMIDIEvent(uint8_t);
uint32_t readDelta(uint8_t);
uint8_t readMIDICmd(uint8_t);
uint8_t skipWhenFFCmd(uint8_t, uint8_t, uint8_t);
void chainEvent(uint8_t);
void performMIDICmd(uint8_t);
void exhaustZeroes(uint8_t);
uint8_t readMIDIEvent(uint8_t);
void sniffNextMIDI(void);
void sendAME(uint8_t, uint8_t, uint8_t, uint8_t); //this actually sends bytes to the sam2695 chip
/*
extern struct MIDIParser theOne;
extern struct midiRecord myMIDIRecord;
*/
#endif // MUMIDIPLAY_H
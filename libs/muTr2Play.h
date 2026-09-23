#ifndef MUTR2PLAY_H
#define MUTR2PLAY_H

#define VGMTICKSPERSAMPLE 571

typedef struct t2s {
	uint8_t subVersion; //1 or 2 for now
	uint8_t initPage; //initial song sequence (page 0-7) the song starts in
	uint8_t tempo; //value from 0-255
	char name[15]; //up to 14 ascii characters
	uint16_t songPtr; //aims at the section where the patterns are listed for a song
	uint16_t patPtr; //aims at the pattern itself
} tr2Song;


//temp
void dealKey(void);

//used during the prep of a tr2 file
void loadTR2File(const char *, uint32_t); //skip using this if the .tr2 if embedded
void prepTR2ForPlay(uint32_t); //main workhorse during prep
void detectHeaderStructure(void); //sets the proper data start of the tr2 past the header, detects if a loop is needed
void resetSong(uint8_t);

//used during playback
bool isTR2Done(void); //tests to see if the end of song was reached
void rewindAndPlayTR2(void); //assumes it's been preped, go back to start and launch playback
int8_t TR2LoopPass(void); //use this in your project during playback

#endif //MUTR2PLAY_H
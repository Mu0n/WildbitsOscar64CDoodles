#ifndef MUTR2PLAY_H
#define MUTR2PLAY_H


//used during the prep of a VGM file
void loadTR2IntoRam(const char *, uint32_t); //skip using this if the .vgm if embedded
void preploadTR2IntoRamForPlay(uint32_t); //main workhorse during prep
void detectHeaderStructure(void); //sets the proper data start of the vgm past the header, detects if a loop is needed

//used during playback
bool isloadTR2IntoRamDone(void); //tests to see if the end of song was reached
void rewindAndPlayTR2(void); //assumes it's been preped, go back to start and launch playback
int8_t TR2LoopPass(void); //use this in your project during playback

#endif //MUTR2PLAY_H
#ifndef MUDISPATCH_H
#define MUDISPATCH_H

#include "f256lib.h"

#define LFO_TABLE 0x28000 //256 bytes big to 0x28100
#define TRACKS_MAX 4  //number of simultaneous tracks dealt with

typedef struct glTh
{
	int8_t kOffset; //keyboard red line offset for the drawing of the red line
	bool typeKeybPlay; //set to true if you're in a mode that lets you play with a typing keyboard
	uint8_t activeTrack, kActiveTrack; //which one is being displayed in highlight. MIDI in, and typing keyboard
	bool mimicMIDI; //make both the midi in and typing keyboard share their config. set to false to decouple.
} globalThings;

typedef struct aTrk
{
	bool enabled; //chooses if it will play or not
  uint8_t chipChoice; 
  //MIDI related
  uint8_t *prgInst; //could possibly hold all 16 MIDI channel program choices
  bool wantVS1053; //if true, use the VS1053b. if not, use the SAM2695
  uint8_t chSelect; //which MIDI channel is used, this can force percussion with channel 0x9
  
  //LFO related
  uint8_t lfoVolCeiling; //used for adjusting real time Low-Frequency Oscillator volume modulation
  uint32_t lfoIndex; //far memory pointer to store where we're at in the LFO table
  
  //SID related
  uint8_t sidInstChoice;
  //OPL3 related
  uint8_t opl3InstChoice;
  	//uint8_t selectBeat;
	//uint8_t mainTempo;
	//sid
	//struct sidInstrument *sidValues;
	//opl3 chip wide
	//opl3 channel wide
	//opl3 instrument wide
	/*
	uint8_t o_2_tvskf, o_1_tvskf;
	uint8_t o_2_kslvol, o_1_kslvol;
	uint8_t o_2_ad, o_1_ad;
	uint8_t o_2_sr, o_1_sr;
	uint8_t o_2_wav, o_1_wav;
	uint8_t o_chanfeed;
	*/ 
} aTrack;

void resetAllTracks(void);
void resetLFOTable(void);
void liberateAllChannels(void);
int8_t findFreeChannel(uint8_t *, uint8_t, uint8_t *);
int8_t liberateChannel(uint8_t , uint8_t *, uint8_t);
void dispatchNote(bool, uint8_t, uint8_t, aTrack *);
void resetGlobals(void);
extern uint8_t chipAct[];

//extern uint8_t sidChoiceToVoice[];
extern uint8_t reservedSID[];
extern uint8_t reservedPSG[];
extern uint8_t reservedOPL3[];

extern uint8_t polyOPL3Buffer[];
extern uint8_t polySIDBuffer[];
extern uint8_t polyPSGBuffer[];

extern globalThings gT;
extern aTrack tracks[]; //tracks associated with a MIDI in controller
extern aTrack kTracks[]; //tracks associated with the typing keyboard

extern uint8_t trackCount;

extern uint8_t chipAct[];

#endif // MUDISPATCH_H

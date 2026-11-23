#ifndef MUSTATES_H
#define MUSTATES_H


enum {
MODE_SILENCE,
MODE_TR2,
MODE_MIDI,
MODE_SID,
MODE_VGM,
MODE_MP3,
MODE_WHI
};

void switchMode(uint8_t);
void invokePause(bool);
void enterTurnTableModal(void);
void enterCouchModal(void);
void exitTurnTableModal(void);
void exitCouchModal(void);
void spriteSwapRooms(void);

extern uint8_t modePlay;

//main room states
extern bool room2; //midi lab or not
extern bool modal_TurnTable; //cat is interacting with turntable
extern bool modal_Couch; //cat is sitting on couch
extern bool modalActive; //any modal is active
extern bool turnTableLatched;   // set on exit, cleared when the cat leaves the zone
extern bool couchLatched;
extern bool modal_Bench; //cat is sitting on the stool in front of bench
extern bool roomChangeLatched;

extern bool jLeftDown, jRightDown, jUpDown, jDownDown;
extern bool kLeftDown, kRightDown, kUpDown, kDownDown;
extern bool rightDown, leftDown, upDown, downDown;

extern uint16_t addy[]; //address of thing to poll

#endif //MUSTATES_H
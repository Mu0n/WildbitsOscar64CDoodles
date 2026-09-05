#ifndef TEXTUI_H
#define TEXTUI_H

#include "../src/mudispatch.h"

#define textColorGreen  0x04
#define textColorOrange 0x09
#define textColorRed    0x01
#define textColorBlue   0x07
#define textColorGray   0x05

#define CHAR_EMPTY_CIRC 179
#define CHAR_FILLED_CIRC 180


void keybInstructionsRefresh(void);
void refreshInstrumentText(aTrack *);
void channelTextMenu(aTrack *);
void chipSelectTextMenu(aTrack *);
void textTitle(void);
void updateTempoText(uint8_t);
void showMIDIChoiceText(aTrack *);
void showChipChoiceText(aTrack *);
void instListShow(aTrack *);
void highLightInstChoice(bool, aTrack *);
void modalMoveUp(aTrack *, bool);
void modalMoveDown(aTrack *, bool);
void modalMoveLeft(aTrack *);
void modalMoveRight(aTrack *);
void layoutChipAct();
void refreshChipAct(uint8_t *);

#endif // TEXTUI_H
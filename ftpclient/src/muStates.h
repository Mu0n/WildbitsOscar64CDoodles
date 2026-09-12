#ifndef MUSTATES_H
#define MUSTATES_H

#include "f256lib.h"

typedef enum
{
  STATE_EMPTY,
  STATE_FILLED,
  STATE_ENTERED,
  STATE_DRAGOUT 
} AreaState;

typedef enum
{
  ET_LIST, //a ls or lls command is called to fill in the listing
  ET_CLEAR, //using clear and wiping out all text
  ET_MOUSEMOVE, //compare new to old data about position
  ET_MOUSECLICK, //compare new to old data about mouse button clicks
  ET_MOUSEUNCLICK
} AreaEvent; 

typedef struct
{
  AreaState state;
  AreaState beforeState;
  uint8_t area; //area id: 1=remote, 2=local
  uint8_t oldHighlight;
} AreaStates;

void handleHighlight(uint8_t);
uint8_t stateHandle(AreaEvent, uint8_t);
void initStates(void);

extern AreaStates gState[];


#endif //MUSTATES_H
#ifndef MUSTATES_H
#define MUSTATES_H

#include "f256lib.h"

typedef enum
{
  STATE_OUTSIDING, //moving around, highlighting stuff
  STATE_REMOTING,   
  STATE_LOCALING, 
  STATE_REMOTECLICKING,   //a click's been done, might lead to download
  STATE_LOCALCLICKING,   //same, but might lead to upload
  STATE_DOWNLOADING, //those 2 will lead to one of the 3 first
  STATE_UPLOADING,
} MouseState;

typedef enum
{
  ET_DELTA_ANALYZE, //compare new to old data about position
  ET_CLICK_ANALYZE, //compare new to old data about mouse button clicks
  ET_DOWNLOAD, //a request to download
  ET_UPLOAD //a request to upload
} MouseEvent; 

typedef struct
{
  MouseState state;
  MouseState stateBefore;
  uint8_t oldArea; //keep track of which are you were before a movement delta
  bool oldButtonDown; //last state of the buttons for comparisons before a click delta
  uint8_t originClick; //keep track of where a click has been done
} MouseStates;

void stateHandle(MouseStates *, MouseEvent);

extern MouseStates gState;


#endif //MUSTATES_H
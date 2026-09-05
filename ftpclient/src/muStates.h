#ifndef MUSTATES_H
#define MUSTATES_H

#include "f256lib.h"

typedef enum
{
  STATE_OUTSIDING,
  STATE_REMOTING,   
  STATE_LOCALING, 
  STATE_CLICKDRAGGING,   
  STATE_DOWNLOADING,
  STATE_UPLOADING,
} MouseState;

typedef enum
{
  ET_DELTA_ANALYZE,
  ET_DOWNLOAD,
  ET_UPLOAD
} MouseEvent;

typedef struct
{
  MouseState state;
  MouseState stateBefore;
} MouseStates;

void stateHandle(MouseStates *, MouseEvent);

extern MouseStates gState;


#endif //MUSTATES_H
#ifndef __MUUTILS_H
#define __MUUTILS_H

#define textColorGreen  0x04
#define textColorOrange 0x09
#define textColorRed    0x91
#define textColorBlue   0x07
#define textColorGray   0x05

#include "f256lib.h"


bool isAnyK(void);
bool isK2(void);
bool hasCaseLCD(void);
bool isWave2(void);

void wipeBitmapBackground(uint8_t, uint8_t, uint8_t);
void realTextClear(void);

void openAllCODEC(void);


#endif // __MUUTILS_H
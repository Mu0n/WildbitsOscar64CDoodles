#ifndef MUMEN2RAM_H
#define MUGEN2RAM_H

#include "f256lib.h"

void peek24Block(unsigned long, unsigned char);
char peek24(unsigned long);
void poke24(unsigned long, uint8_t);

extern uint8_t blk[];

#endif // MUGEN2RAM_H
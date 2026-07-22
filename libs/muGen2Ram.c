#ifndef MUMEN2RAM_C
#define MUGEN2RAM_C

#include "muGen2RAM.h"

char peek24(unsigned long addr)
{
    return __asm {
		lda addr
		sta 0x05
		lda addr+1
		sta 0x06
		lda addr+2
		sta 0x07
		
        ldx 0x00
        ldy 0x01
		txa

        ora #0x08
        php
        sei
        sta 0x00
        tya
        ora #0x30
        sta 0x01

        byt 0xa7
		byt 0x05
		
        stx 0x00
        sty 0x01
		
		plp

        sta accu
        lda #0
        sta accu+1
		};
}

void poke24(unsigned long addr, unsigned char value)
{
    __asm {
		lda addr
		sta 0x05
		lda addr+1
		sta 0x06
		lda addr+2
		sta 0x07
				
        ldx 0x00
        ldy 0x01
		txa
		
        ora #0x08
        php
        sei
        sta 0x00
        tya
        ora #0x30
        sta 0x01
		
        lda value
        
		byt 0x87
		byt 0x05
		stx 0x00
		sty 0x01
		
		plp
		ldx #0x00
    };
}

#endif // MUGEN2RAM_C
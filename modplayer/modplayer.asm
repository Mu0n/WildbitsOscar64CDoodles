; Compiled with 1.32.267
--------------------------------------------------------------------
startup: ; startup
0200 : 78 __ __ SEI
0201 : d8 __ __ CLD
0202 : a9 00 __ LDA #$00
0204 : 85 01 __ STA $01 
0206 : a2 4d __ LDX #$4d
0208 : a0 78 __ LDY #$78
020a : a9 00 __ LDA #$00
020c : 85 27 __ STA IP + 0 
020e : 86 28 __ STX IP + 1 
0210 : e0 50 __ CPX #$50
0212 : f0 0b __ BEQ $021f ; (startup + 31)
0214 : 91 27 __ STA (IP + 0),y 
0216 : c8 __ __ INY
0217 : d0 fb __ BNE $0214 ; (startup + 20)
0219 : e8 __ __ INX
021a : d0 f2 __ BNE $020e ; (startup + 14)
021c : 91 27 __ STA (IP + 0),y 
021e : c8 __ __ INY
021f : c0 7c __ CPY #$7c
0221 : d0 f9 __ BNE $021c ; (startup + 28)
0223 : a9 00 __ LDA #$00
0225 : a2 80 __ LDX #$80
0227 : d0 03 __ BNE $022c ; (startup + 44)
0229 : 95 00 __ STA $00,x 
022b : e8 __ __ INX
022c : e0 80 __ CPX #$80
022e : d0 f9 __ BNE $0229 ; (startup + 41)
0230 : a9 2b __ LDA #$2b
0232 : 85 31 __ STA SP + 0 
0234 : a9 9c __ LDA #$9c
0236 : 85 32 __ STA SP + 1 
0238 : 20 80 02 JSR $0280 ; (main.s4 + 0)
023b : 4c 3b 02 JMP $023b ; (startup + 59)
023e : 60 __ __ RTS
--------------------------------------------------------------------
main: ; main()->i16
;  30, "/mnt/d/F256/oscar64/include/crt.c"
.s4:
0280 : 20 b3 02 JSR $02b3 ; (f256Init.s4 + 0)
0283 : ad f1 4c LDA $4cf1 ; (kernelArgs + 0)
0286 : 85 35 __ STA T0 + 0 
0288 : ad f2 4c LDA $4cf2 ; (kernelArgs + 1)
028b : 85 36 __ STA T0 + 1 
028d : a0 08 __ LDY #$08
028f : b1 35 __ LDA (T0 + 0),y 
0291 : 8d fe 9f STA $9ffe ; (sstack + 39)
0294 : c8 __ __ INY
0295 : b1 35 __ LDA (T0 + 0),y 
0297 : 8d ff 9f STA $9fff ; (sstack + 40)
029a : c8 __ __ INY
029b : b1 35 __ LDA (T0 + 0),y 
029d : 4a __ __ LSR
029e : 8d fc 9f STA $9ffc ; (sstack + 37)
02a1 : a9 00 __ LDA #$00
02a3 : 8d fd 9f STA $9ffd ; (sstack + 38)
02a6 : 20 79 07 JSR $0779 ; (f256main.s1 + 0)
02a9 : 20 2a 45 JSR $452a ; (f256Reset.s4 + 0)
02ac : a9 00 __ LDA #$00
02ae : 85 29 __ STA ACCU + 0 
02b0 : 85 2a __ STA ACCU + 1 
.s3:
02b2 : 60 __ __ RTS
--------------------------------------------------------------------
f256Init: ; f256Init()->void
; 211, "/mnt/d/F256/f256lib-oscar64/f256lib/f256lib.h"
.s4:
02b3 : a9 00 __ LDA #$00
02b5 : 85 01 __ STA $01 
02b7 : a9 3f __ LDA #$3f
02b9 : 8d 00 d0 STA $d000 
02bc : a9 b3 __ LDA #$b3
02be : 85 00 __ STA $00 
02c0 : a9 00 __ LDA #$00
02c2 : 85 08 __ STA $08 
02c4 : a9 01 __ LDA #$01
02c6 : 85 09 __ STA $09 
02c8 : a9 02 __ LDA #$02
02ca : 85 0a __ STA $0a 
02cc : a9 03 __ LDA #$03
02ce : 85 0b __ STA $0b 
02d0 : a9 04 __ LDA #$04
02d2 : 85 0c __ STA $0c 
02d4 : a9 05 __ LDA #$05
02d6 : 85 0d __ STA $0d 
02d8 : 20 f2 02 JSR $02f2 ; (kernelReset.s4 + 0)
02db : 20 05 03 JSR $0305 ; (graphicsReset.s4 + 0)
02de : 20 c5 03 JSR $03c5 ; (textReset.s4 + 0)
02e1 : 20 6b 05 JSR $056b ; (bitmapReset.s4 + 0)
02e4 : 20 74 06 JSR $0674 ; (tileReset.s4 + 0)
02e7 : 20 d8 06 JSR $06d8 ; (spriteReset.s4 + 0)
02ea : 20 04 07 JSR $0704 ; (fileReset.s4 + 0)
02ed : 20 0f 07 JSR $070f ; (randomReset.s4 + 0)
02f0 : 58 __ __ CLI
.s3:
02f1 : 60 __ __ RTS
--------------------------------------------------------------------
kernelReset: ; kernelReset()->void
;  82, "/mnt/d/F256/f256lib-oscar64/f256lib/f_kernel.h"
.s4:
02f2 : a9 f0 __ LDA #$f0
02f4 : 8d f1 4c STA $4cf1 ; (kernelArgs + 0)
02f7 : a9 00 __ LDA #$00
02f9 : 8d f2 4c STA $4cf2 ; (kernelArgs + 1)
02fc : a9 f3 __ LDA #$f3
02fe : 85 f0 __ STA $f0 
0300 : a9 4c __ LDA #$4c
0302 : 85 f1 __ STA $f1 
.s3:
0304 : 60 __ __ RTS
--------------------------------------------------------------------
graphicsReset: ; graphicsReset()->void
;  19, "/mnt/d/F256/f256lib-oscar64/f256lib/f_graphics.h"
.s4:
0305 : a9 00 __ LDA #$00
0307 : 85 35 __ STA T2 + 0 
.l5:
0309 : 85 1b __ STA P0 
030b : a9 00 __ LDA #$00
.l8:
030d : 85 1c __ STA P1 
030f : 85 1d __ STA P2 
0311 : 85 1e __ STA P3 
0313 : 85 1f __ STA P4 
0315 : 20 3e 03 JSR $033e ; (graphicsDefineColor.s4 + 0)
0318 : 18 __ __ CLC
0319 : a5 1c __ LDA P1 
031b : 69 01 __ ADC #$01
031d : d0 ee __ BNE $030d ; (graphicsReset.l8 + 0)
.s6:
031f : e6 35 __ INC T2 + 0 
0321 : a5 35 __ LDA T2 + 0 
0323 : c9 04 __ CMP #$04
0325 : 90 e2 __ BCC $0309 ; (graphicsReset.l5 + 0)
.s7:
0327 : a9 00 __ LDA #$00
0329 : 85 1b __ STA P0 
032b : 85 1c __ STA P1 
032d : 20 96 03 JSR $0396 ; (graphicsSetLayerBitmap.s4 + 0)
0330 : e6 1b __ INC P0 
0332 : e6 1c __ INC P1 
0334 : 20 96 03 JSR $0396 ; (graphicsSetLayerBitmap.s4 + 0)
0337 : e6 1b __ INC P0 
0339 : e6 1c __ INC P1 
033b : 4c 96 03 JMP $0396 ; (graphicsSetLayerBitmap.s4 + 0)
--------------------------------------------------------------------
graphicsDefineColor: ; graphicsDefineColor(u8,u8,u8,u8,u8)->void
;  17, "/mnt/d/F256/f256lib-oscar64/f256lib/f_graphics.h"
.s4:
033e : a5 01 __ LDA $01 
0340 : 85 2c __ STA ACCU + 3 
0342 : a5 1b __ LDA P0 ; (clut + 0)
0344 : c9 01 __ CMP #$01
0346 : d0 08 __ BNE $0350 ; (graphicsDefineColor.s5 + 0)
.s11:
0348 : a9 00 __ LDA #$00
034a : 85 29 __ STA ACCU + 0 
034c : a9 d4 __ LDA #$d4
034e : d0 17 __ BNE $0367 ; (graphicsDefineColor.s8 + 0)
.s5:
0350 : aa __ __ TAX
0351 : d0 06 __ BNE $0359 ; (graphicsDefineColor.s6 + 0)
.s10:
0353 : 85 29 __ STA ACCU + 0 
0355 : a9 d0 __ LDA #$d0
0357 : d0 0e __ BNE $0367 ; (graphicsDefineColor.s8 + 0)
.s6:
0359 : a2 00 __ LDX #$00
035b : 86 29 __ STX ACCU + 0 
035d : c9 02 __ CMP #$02
035f : d0 04 __ BNE $0365 ; (graphicsDefineColor.s7 + 0)
.s9:
0361 : a9 d8 __ LDA #$d8
0363 : d0 02 __ BNE $0367 ; (graphicsDefineColor.s8 + 0)
.s7:
0365 : a9 dc __ LDA #$dc
.s8:
0367 : 85 2a __ STA ACCU + 1 
0369 : a5 1c __ LDA P1 ; (slot + 0)
036b : 0a __ __ ASL
036c : 85 2b __ STA ACCU + 2 
036e : a9 01 __ LDA #$01
0370 : 85 01 __ STA $01 
0372 : a9 00 __ LDA #$00
0374 : 2a __ __ ROL
0375 : 06 2b __ ASL ACCU + 2 
0377 : 2a __ __ ROL
0378 : 05 2a __ ORA ACCU + 1 
037a : 85 2a __ STA ACCU + 1 
037c : a5 1f __ LDA P4 ; (b + 0)
037e : a4 2b __ LDY ACCU + 2 
0380 : 91 29 __ STA (ACCU + 0),y 
0382 : a5 1e __ LDA P3 ; (g + 0)
0384 : c8 __ __ INY
0385 : 91 29 __ STA (ACCU + 0),y 
0387 : a5 1d __ LDA P2 ; (r + 0)
0389 : c8 __ __ INY
038a : 91 29 __ STA (ACCU + 0),y 
038c : a9 ff __ LDA #$ff
038e : c8 __ __ INY
038f : 91 29 __ STA (ACCU + 0),y 
0391 : a5 2c __ LDA ACCU + 3 
0393 : 85 01 __ STA $01 
.s3:
0395 : 60 __ __ RTS
--------------------------------------------------------------------
graphicsSetLayerBitmap: ; graphicsSetLayerBitmap(u8,u8)->void
;  24, "/mnt/d/F256/f256lib-oscar64/f256lib/f_graphics.h"
.s4:
0396 : a5 1b __ LDA P0 ; (layer + 0)
0398 : a4 1c __ LDY P1 ; (which + 0)
039a : c9 01 __ CMP #$01
039c : d0 12 __ BNE $03b0 ; (graphicsSetLayerBitmap.s5 + 0)
.s10:
039e : 98 __ __ TYA
039f : 0a __ __ ASL
03a0 : 0a __ __ ASL
03a1 : 0a __ __ ASL
03a2 : 0a __ __ ASL
03a3 : 85 29 __ STA ACCU + 0 
03a5 : ad 02 d0 LDA $d002 
03a8 : 29 0f __ AND #$0f
.s9:
03aa : 05 29 __ ORA ACCU + 0 
03ac : 8d 02 d0 STA $d002 
.s3:
03af : 60 __ __ RTS
.s5:
03b0 : aa __ __ TAX
03b1 : d0 0a __ BNE $03bd ; (graphicsSetLayerBitmap.s6 + 0)
.s8:
03b3 : 84 29 __ STY ACCU + 0 
03b5 : ad 02 d0 LDA $d002 
03b8 : 29 f0 __ AND #$f0
03ba : 4c aa 03 JMP $03aa ; (graphicsSetLayerBitmap.s9 + 0)
.s6:
03bd : c9 02 __ CMP #$02
03bf : d0 ee __ BNE $03af ; (graphicsSetLayerBitmap.s3 + 0)
.s7:
03c1 : 8c 03 d0 STY $d003 
03c4 : 60 __ __ RTS
--------------------------------------------------------------------
textReset: ; textReset()->void
;  57, "/mnt/d/F256/f256lib-oscar64/f256lib/f_text.h"
.s4:
03c5 : a9 00 __ LDA #$00
03c7 : 85 1b __ STA P0 
03c9 : a9 f0 __ LDA #$f0
03cb : 8d fd 44 STA $44fd ; (_ccolor + 0)
03ce : a9 01 __ LDA #$01
03d0 : 85 1c __ STA P1 
03d2 : 20 09 04 JSR $0409 ; (textSetDouble.s4 + 0)
03d5 : a9 00 __ LDA #$00
03d7 : 20 3a 04 JSR $043a ; (textSetCursor.s4 + 0)
03da : a9 00 __ LDA #$00
03dc : 85 3a __ STA T1 + 0 
03de : 85 1f __ STA P4 
.l6:
03e0 : a6 3a __ LDX T1 + 0 
03e2 : bd 6f 4c LDA $4c6f,x ; (textColors[0].g + 0)
03e5 : 85 21 __ STA P6 
03e7 : bd 70 4c LDA $4c70,x ; (textColors[0].b + 0)
03ea : 85 22 __ STA P7 
03ec : bd 6e 4c LDA $4c6e,x ; (textColors[0].r + 0)
03ef : 85 20 __ STA P5 
03f1 : 20 4a 04 JSR $044a ; (textDefineForegroundColor.s4 + 0)
03f4 : 20 a1 04 JSR $04a1 ; (textDefineBackgroundColor.s4 + 0)
03f7 : 18 __ __ CLC
03f8 : a5 3a __ LDA T1 + 0 
03fa : 69 03 __ ADC #$03
03fc : 85 3a __ STA T1 + 0 
03fe : e6 1f __ INC P4 
0400 : a5 1f __ LDA P4 
0402 : c9 10 __ CMP #$10
0404 : 90 da __ BCC $03e0 ; (textReset.l6 + 0)
.s5:
0406 : 4c cf 04 JMP $04cf ; (textClear.s4 + 0)
--------------------------------------------------------------------
textSetDouble: ; textSetDouble(bool,bool)->void
;  60, "/mnt/d/F256/f256lib-oscar64/f256lib/f_text.h"
.s4:
0409 : ad 01 d0 LDA $d001 
040c : 29 f9 __ AND #$f9
040e : 85 29 __ STA ACCU + 0 
0410 : a5 1b __ LDA P0 ; (x + 0)
0412 : 0a __ __ ASL
0413 : 05 29 __ ORA ACCU + 0 
0415 : 85 29 __ STA ACCU + 0 
0417 : a5 1c __ LDA P1 ; (y + 0)
0419 : 0a __ __ ASL
041a : 0a __ __ ASL
041b : 05 29 __ ORA ACCU + 0 
041d : 8d 01 d0 STA $d001 
0420 : a5 1b __ LDA P0 ; (x + 0)
0422 : f0 04 __ BEQ $0428 ; (textSetDouble.s5 + 0)
.s6:
0424 : a9 28 __ LDA #$28
0426 : d0 02 __ BNE $042a ; (textSetDouble.s3 + 0)
.s5:
0428 : a9 50 __ LDA #$50
.s3:
042a : 8d fe 44 STA $44fe ; (_MAX_COL + 0)
042d : a5 1c __ LDA P1 ; (y + 0)
042f : f0 03 __ BEQ $0434 ; (textSetDouble.s7 + 0)
.s8:
0431 : 60 __ __ RTS
0432 : d0 02 __ BNE $0436 ; (textSetDouble.s9 + 0)
.s7:
0434 : a9 3c __ LDA #$3c
.s9:
0436 : 8d ff 44 STA $44ff ; (_MAX_ROW + 0)
0439 : 60 __ __ RTS
--------------------------------------------------------------------
textSetCursor: ; textSetCursor(u8)->void
;  59, "/mnt/d/F256/f256lib-oscar64/f256lib/f_text.h"
.s4:
043a : a8 __ __ TAY
043b : f0 09 __ BEQ $0446 ; (textSetCursor.s5 + 0)
.s6:
043d : a9 03 __ LDA #$03
043f : 8d 10 d0 STA $d010 
0442 : 8c 12 d0 STY $d012 
0445 : 60 __ __ RTS
.s5:
0446 : 8d 10 d0 STA $d010 
.s3:
0449 : 60 __ __ RTS
--------------------------------------------------------------------
textDefineForegroundColor: ; textDefineForegroundColor(u8,u8,u8,u8)->void
;  42, "/mnt/d/F256/f256lib-oscar64/f256lib/f_text.h"
.s4:
044a : a9 00 __ LDA #$00
044c : 85 1e __ STA P3 
044e : 85 1c __ STA P1 
0450 : a9 04 __ LDA #$04
0452 : 85 1d __ STA P2 
0454 : a5 1f __ LDA P4 ; (slot + 0)
0456 : 85 1b __ STA P0 
0458 : 20 78 04 JSR $0478 ; (mathUnsignedMultiply.s4 + 0)
045b : 18 __ __ CLC
045c : a5 2a __ LDA ACCU + 1 
045e : 69 d8 __ ADC #$d8
0460 : 85 2a __ STA ACCU + 1 
0462 : a5 22 __ LDA P7 ; (b + 0)
0464 : a0 00 __ LDY #$00
0466 : 91 29 __ STA (ACCU + 0),y 
0468 : a5 21 __ LDA P6 ; (g + 0)
046a : c8 __ __ INY
046b : 91 29 __ STA (ACCU + 0),y 
046d : a5 20 __ LDA P5 ; (r + 0)
046f : c8 __ __ INY
0470 : 91 29 __ STA (ACCU + 0),y 
0472 : a9 ff __ LDA #$ff
0474 : c8 __ __ INY
0475 : 91 29 __ STA (ACCU + 0),y 
.s3:
0477 : 60 __ __ RTS
--------------------------------------------------------------------
mathUnsignedMultiply: ; mathUnsignedMultiply(u16,u16)->u32
;  21, "/mnt/d/F256/f256lib-oscar64/f256lib/f_math.h"
.s4:
0478 : a5 1b __ LDA P0 ; (a + 0)
047a : 8d 00 de STA $de00 
047d : a5 1c __ LDA P1 ; (a + 1)
047f : 8d 01 de STA $de01 
0482 : a5 1d __ LDA P2 ; (b + 0)
0484 : 8d 02 de STA $de02 
0487 : a5 1e __ LDA P3 ; (b + 1)
0489 : 8d 03 de STA $de03 
048c : ad 10 de LDA $de10 
048f : 85 29 __ STA ACCU + 0 
0491 : ad 11 de LDA $de11 
0494 : 85 2a __ STA ACCU + 1 
0496 : ad 12 de LDA $de12 
0499 : 85 2b __ STA ACCU + 2 
049b : ad 13 de LDA $de13 
049e : 85 2c __ STA ACCU + 3 
.s3:
04a0 : 60 __ __ RTS
--------------------------------------------------------------------
textDefineBackgroundColor: ; textDefineBackgroundColor(u8,u8,u8,u8)->void
;  41, "/mnt/d/F256/f256lib-oscar64/f256lib/f_text.h"
.s4:
04a1 : a9 00 __ LDA #$00
04a3 : 85 1e __ STA P3 
04a5 : 85 1c __ STA P1 
04a7 : a9 04 __ LDA #$04
04a9 : 85 1d __ STA P2 
04ab : a5 1f __ LDA P4 ; (slot + 0)
04ad : 85 1b __ STA P0 
04af : 20 78 04 JSR $0478 ; (mathUnsignedMultiply.s4 + 0)
04b2 : 18 __ __ CLC
04b3 : a5 2a __ LDA ACCU + 1 
04b5 : 69 d8 __ ADC #$d8
04b7 : 85 2a __ STA ACCU + 1 
04b9 : a5 22 __ LDA P7 ; (b + 0)
04bb : a0 40 __ LDY #$40
04bd : 91 29 __ STA (ACCU + 0),y 
04bf : a5 21 __ LDA P6 ; (g + 0)
04c1 : c8 __ __ INY
04c2 : 91 29 __ STA (ACCU + 0),y 
04c4 : a5 20 __ LDA P5 ; (r + 0)
04c6 : c8 __ __ INY
04c7 : 91 29 __ STA (ACCU + 0),y 
04c9 : a9 ff __ LDA #$ff
04cb : c8 __ __ INY
04cc : 91 29 __ STA (ACCU + 0),y 
.s3:
04ce : 60 __ __ RTS
--------------------------------------------------------------------
textClear: ; textClear()->void
;  40, "/mnt/d/F256/f256lib-oscar64/f256lib/f_text.h"
.s4:
04cf : ad fe 44 LDA $44fe ; (_MAX_COL + 0)
04d2 : 85 1b __ STA P0 
04d4 : ad ff 44 LDA $44ff ; (_MAX_ROW + 0)
04d7 : 85 1d __ STA P2 
04d9 : a9 00 __ LDA #$00
04db : 85 1c __ STA P1 
04dd : 85 1e __ STA P3 
04df : a5 01 __ LDA $01 
04e1 : 85 39 __ STA T4 + 0 
04e3 : 20 78 04 JSR $0478 ; (mathUnsignedMultiply.s4 + 0)
04e6 : a5 29 __ LDA ACCU + 0 
04e8 : 85 2b __ STA ACCU + 2 
04ea : a9 02 __ LDA #$02
04ec : 85 01 __ STA $01 
04ee : a5 2a __ LDA ACCU + 1 
04f0 : 30 04 __ BMI $04f6 ; (textClear.s5 + 0)
.s9:
04f2 : 05 29 __ ORA ACCU + 0 
04f4 : d0 0f __ BNE $0505 ; (textClear.s7 + 0)
.s5:
04f6 : a9 03 __ LDA #$03
04f8 : 85 01 __ STA $01 
.s6:
04fa : a5 39 __ LDA T4 + 0 
04fc : 85 01 __ STA $01 
04fe : a9 00 __ LDA #$00
0500 : 85 1b __ STA P0 
0502 : 4c 52 05 JMP $0552 ; (textGotoXY.s4 + 0)
.s7:
0505 : a5 29 __ LDA ACCU + 0 
0507 : 85 35 __ STA T1 + 0 
0509 : a0 00 __ LDY #$00
050b : 84 37 __ STY T2 + 0 
050d : a9 c0 __ LDA #$c0
050f : 85 38 __ STA T2 + 1 
0511 : a6 2a __ LDX ACCU + 1 
.l10:
0513 : a9 20 __ LDA #$20
0515 : 91 37 __ STA (T2 + 0),y 
0517 : c8 __ __ INY
0518 : d0 02 __ BNE $051c ; (textClear.s16 + 0)
.s15:
051a : e6 38 __ INC T2 + 1 
.s16:
051c : a5 35 __ LDA T1 + 0 
051e : d0 01 __ BNE $0521 ; (textClear.s13 + 0)
.s12:
0520 : ca __ __ DEX
.s13:
0521 : c6 35 __ DEC T1 + 0 
0523 : d0 ee __ BNE $0513 ; (textClear.l10 + 0)
.s14:
0525 : 8a __ __ TXA
0526 : d0 eb __ BNE $0513 ; (textClear.l10 + 0)
.s8:
0528 : a9 03 __ LDA #$03
052a : 85 01 __ STA $01 
052c : ad fd 44 LDA $44fd ; (_ccolor + 0)
052f : 85 37 __ STA T2 + 0 
0531 : a9 c0 __ LDA #$c0
0533 : 85 36 __ STA T1 + 1 
0535 : a0 00 __ LDY #$00
0537 : 84 35 __ STY T1 + 0 
0539 : a6 2a __ LDX ACCU + 1 
.l11:
053b : a5 37 __ LDA T2 + 0 
053d : 91 35 __ STA (T1 + 0),y 
053f : c8 __ __ INY
0540 : d0 02 __ BNE $0544 ; (textClear.s21 + 0)
.s20:
0542 : e6 36 __ INC T1 + 1 
.s21:
0544 : a5 2b __ LDA ACCU + 2 
0546 : d0 01 __ BNE $0549 ; (textClear.s18 + 0)
.s17:
0548 : ca __ __ DEX
.s18:
0549 : c6 2b __ DEC ACCU + 2 
054b : d0 ee __ BNE $053b ; (textClear.l11 + 0)
.s19:
054d : 8a __ __ TXA
054e : d0 eb __ BNE $053b ; (textClear.l11 + 0)
0550 : f0 a8 __ BEQ $04fa ; (textClear.s6 + 0)
--------------------------------------------------------------------
textGotoXY: ; textGotoXY(u8,u8)->void
;  45, "/mnt/d/F256/f256lib-oscar64/f256lib/f_text.h"
.s4:
0552 : a5 1b __ LDA P0 ; (x + 0)
0554 : 8d 14 d0 STA $d014 
0557 : 8d 9e 4c STA $4c9e ; (_col + 0)
055a : a2 00 __ LDX #$00
055c : 8e 15 d0 STX $d015 
055f : a5 1c __ LDA P1 ; (y + 0)
0561 : 8d 16 d0 STA $d016 
0564 : 8d 9f 4c STA $4c9f ; (_row + 0)
0567 : 8e 17 d0 STX $d017 
.s3:
056a : 60 __ __ RTS
--------------------------------------------------------------------
bitmapReset: ; bitmapReset()->void
;  19, "/mnt/d/F256/f256lib-oscar64/f256lib/f_bitmap.h"
.s4:
056b : a9 40 __ LDA #$40
056d : 85 1b __ STA P0 
056f : a9 00 __ LDA #$00
0571 : 85 1e __ STA P3 
0573 : a9 01 __ LDA #$01
0575 : 85 1c __ STA P1 
0577 : a9 f0 __ LDA #$f0
0579 : 85 1d __ STA P2 
057b : 20 78 04 JSR $0478 ; (mathUnsignedMultiply.s4 + 0)
057e : a5 29 __ LDA ACCU + 0 
0580 : 85 35 __ STA T1 + 0 
0582 : a5 2a __ LDA ACCU + 1 
0584 : 85 39 __ STA T2 + 0 
0586 : 85 36 __ STA T1 + 1 
0588 : a5 2b __ LDA ACCU + 2 
058a : 85 3a __ STA T2 + 1 
058c : 85 37 __ STA T1 + 2 
058e : a9 00 __ LDA #$00
0590 : 85 1d __ STA P2 
0592 : a9 20 __ LDA #$20
0594 : 85 1e __ STA P3 
0596 : a5 2c __ LDA ACCU + 3 
0598 : 85 38 __ STA T1 + 3 
059a : a2 05 __ LDX #$05
.l5:
059c : 4a __ __ LSR
059d : 66 3a __ ROR T2 + 1 
059f : 66 39 __ ROR T2 + 0 
05a1 : ca __ __ DEX
05a2 : d0 f8 __ BNE $059c ; (bitmapReset.l5 + 0)
.s6:
05a4 : a5 39 __ LDA T2 + 0 
05a6 : 85 1b __ STA P0 
05a8 : a5 3a __ LDA T2 + 1 
05aa : 85 1c __ STA P1 
05ac : 20 78 04 JSR $0478 ; (mathUnsignedMultiply.s4 + 0)
05af : a5 2c __ LDA ACCU + 3 
05b1 : c5 38 __ CMP T1 + 3 
05b3 : d0 12 __ BNE $05c7 ; (bitmapReset.s8 + 0)
.s9:
05b5 : a5 2b __ LDA ACCU + 2 
05b7 : c5 37 __ CMP T1 + 2 
05b9 : d0 0c __ BNE $05c7 ; (bitmapReset.s8 + 0)
.s10:
05bb : a5 2a __ LDA ACCU + 1 
05bd : c5 36 __ CMP T1 + 1 
05bf : d0 06 __ BNE $05c7 ; (bitmapReset.s8 + 0)
.s11:
05c1 : a5 29 __ LDA ACCU + 0 
05c3 : c5 35 __ CMP T1 + 0 
05c5 : f0 0d __ BEQ $05d4 ; (bitmapReset.s7 + 0)
.s8:
05c7 : 18 __ __ CLC
05c8 : a5 1b __ LDA P0 
05ca : 69 01 __ ADC #$01
05cc : 85 39 __ STA T2 + 0 
05ce : a5 1c __ LDA P1 
05d0 : 69 00 __ ADC #$00
05d2 : 85 3a __ STA T2 + 1 
.s7:
05d4 : a5 39 __ LDA T2 + 0 
05d6 : 85 1b __ STA P0 
05d8 : a5 3a __ LDA T2 + 1 
05da : 85 1c __ STA P1 
05dc : 20 78 04 JSR $0478 ; (mathUnsignedMultiply.s4 + 0)
05df : a9 00 __ LDA #$00
05e1 : 85 1b __ STA P0 
05e3 : 85 1c __ STA P1 
05e5 : 8d fa 4c STA $4cfa ; (_BITMAP_CLUT[0] + 0)
05e8 : 8d fb 4c STA $4cfb ; (_BITMAP_CLUT[0] + 1)
05eb : 8d fc 4c STA $4cfc ; (_BITMAP_CLUT[0] + 2)
05ee : 38 __ __ SEC
05ef : e5 29 __ SBC ACCU + 0 
05f1 : 8d 01 d1 STA $d101 
05f4 : aa __ __ TAX
05f5 : a9 00 __ LDA #$00
05f7 : e5 2a __ SBC ACCU + 1 
05f9 : 8d 02 d1 STA $d102 
05fc : a8 __ __ TAY
05fd : a9 08 __ LDA #$08
05ff : e5 2b __ SBC ACCU + 2 
0601 : 85 37 __ STA T1 + 2 
0603 : 8d 03 d1 STA $d103 
0606 : 8a __ __ TXA
0607 : 38 __ __ SEC
0608 : e5 29 __ SBC ACCU + 0 
060a : 8d 09 d1 STA $d109 
060d : aa __ __ TAX
060e : 98 __ __ TYA
060f : e5 2a __ SBC ACCU + 1 
0611 : 8d 0a d1 STA $d10a 
0614 : a8 __ __ TAY
0615 : a5 37 __ LDA T1 + 2 
0617 : e5 2b __ SBC ACCU + 2 
0619 : 85 3b __ STA T2 + 2 
061b : 8d 0b d1 STA $d10b 
061e : 8a __ __ TXA
061f : 38 __ __ SEC
0620 : e5 29 __ SBC ACCU + 0 
0622 : 8d 11 d1 STA $d111 
0625 : 98 __ __ TYA
0626 : e5 2a __ SBC ACCU + 1 
0628 : 8d 12 d1 STA $d112 
062b : a5 3b __ LDA T2 + 2 
062d : e5 2b __ SBC ACCU + 2 
062f : 8d 13 d1 STA $d113 
0632 : 20 3f 06 JSR $063f ; (bitmapSetVisible.s4 + 0)
0635 : e6 1b __ INC P0 
0637 : 20 3f 06 JSR $063f ; (bitmapSetVisible.s4 + 0)
063a : e6 1b __ INC P0 
063c : 4c 3f 06 JMP $063f ; (bitmapSetVisible.s4 + 0)
--------------------------------------------------------------------
bitmapSetVisible: ; bitmapSetVisible(u8,bool)->void
;  24, "/mnt/d/F256/f256lib-oscar64/f256lib/f_bitmap.h"
.s4:
063f : a4 1b __ LDY P0 ; (p + 0)
0641 : 98 __ __ TYA
0642 : a6 1c __ LDX P1 ; (v + 0)
0644 : c0 01 __ CPY #$01
0646 : f0 20 __ BEQ $0668 ; (bitmapSetVisible.s11 + 0)
.s5:
0648 : 09 00 __ ORA #$00
064a : f0 10 __ BEQ $065c ; (bitmapSetVisible.s9 + 0)
.s6:
064c : c9 02 __ CMP #$02
064e : d0 0b __ BNE $065b ; (bitmapSetVisible.s3 + 0)
.s7:
0650 : 8a __ __ TXA
0651 : f0 05 __ BEQ $0658 ; (bitmapSetVisible.s15 + 0)
.s8:
0653 : b9 fa 4c LDA $4cfa,y ; (_BITMAP_CLUT[0] + 0)
0656 : 09 01 __ ORA #$01
.s15:
0658 : 8d 10 d1 STA $d110 
.s3:
065b : 60 __ __ RTS
.s9:
065c : 8a __ __ TXA
065d : f0 05 __ BEQ $0664 ; (bitmapSetVisible.s14 + 0)
.s10:
065f : ad fa 4c LDA $4cfa ; (_BITMAP_CLUT[0] + 0)
0662 : 09 01 __ ORA #$01
.s14:
0664 : 8d 00 d1 STA $d100 
0667 : 60 __ __ RTS
.s11:
0668 : 8a __ __ TXA
0669 : f0 05 __ BEQ $0670 ; (bitmapSetVisible.s13 + 0)
.s12:
066b : ad fb 4c LDA $4cfb ; (_BITMAP_CLUT[0] + 1)
066e : 09 01 __ ORA #$01
.s13:
0670 : 8d 08 d1 STA $d108 
0673 : 60 __ __ RTS
--------------------------------------------------------------------
tileReset: ; tileReset()->void
;  19, "/mnt/d/F256/f256lib-oscar64/f256lib/f_tile.h"
.s4:
0674 : a9 00 __ LDA #$00
0676 : 85 1b __ STA P0 
0678 : 85 1c __ STA P1 
067a : a9 08 __ LDA #$08
067c : 8d fd 4c STA $4cfd ; (_tileSize[0] + 0)
067f : 8d fe 4c STA $4cfe ; (_tileSize[0] + 1)
0682 : 8d ff 4c STA $4cff ; (_tileSize[0] + 2)
0685 : 20 92 06 JSR $0692 ; (tileSetVisible.s4 + 0)
0688 : e6 1b __ INC P0 
068a : 20 92 06 JSR $0692 ; (tileSetVisible.s4 + 0)
068d : e6 1b __ INC P0 
068f : 4c 92 06 JMP $0692 ; (tileSetVisible.s4 + 0)
--------------------------------------------------------------------
tileSetVisible: ; tileSetVisible(u8,bool)->void
;  18, "/mnt/d/F256/f256lib-oscar64/f256lib/f_tile.h"
.s4:
0692 : a5 1b __ LDA P0 ; (t + 0)
0694 : c9 01 __ CMP #$01
0696 : f0 2d __ BEQ $06c5 ; (tileSetVisible.s15 + 0)
.s5:
0698 : aa __ __ TAX
0699 : f0 17 __ BEQ $06b2 ; (tileSetVisible.s11 + 0)
.s6:
069b : c9 02 __ CMP #$02
069d : d0 12 __ BNE $06b1 ; (tileSetVisible.s3 + 0)
.s7:
069f : ad ff 4c LDA $4cff ; (_tileSize[0] + 2)
06a2 : c9 08 __ CMP #$08
06a4 : d0 04 __ BNE $06aa ; (tileSetVisible.s8 + 0)
.s10:
06a6 : a9 10 __ LDA #$10
06a8 : d0 02 __ BNE $06ac ; (tileSetVisible.s9 + 0)
.s8:
06aa : a9 00 __ LDA #$00
.s9:
06ac : 05 1c __ ORA P1 ; (v + 0)
06ae : 8d 18 d2 STA $d218 
.s3:
06b1 : 60 __ __ RTS
.s11:
06b2 : ad fd 4c LDA $4cfd ; (_tileSize[0] + 0)
06b5 : c9 08 __ CMP #$08
06b7 : d0 04 __ BNE $06bd ; (tileSetVisible.s12 + 0)
.s14:
06b9 : a9 10 __ LDA #$10
06bb : d0 02 __ BNE $06bf ; (tileSetVisible.s13 + 0)
.s12:
06bd : a9 00 __ LDA #$00
.s13:
06bf : 05 1c __ ORA P1 ; (v + 0)
06c1 : 8d 00 d2 STA $d200 
06c4 : 60 __ __ RTS
.s15:
06c5 : ad fe 4c LDA $4cfe ; (_tileSize[0] + 1)
06c8 : c9 08 __ CMP #$08
06ca : d0 04 __ BNE $06d0 ; (tileSetVisible.s16 + 0)
.s18:
06cc : a9 10 __ LDA #$10
06ce : d0 02 __ BNE $06d2 ; (tileSetVisible.s17 + 0)
.s16:
06d0 : a9 00 __ LDA #$00
.s17:
06d2 : 05 1c __ ORA P1 ; (v + 0)
06d4 : 8d 0c d2 STA $d20c 
06d7 : 60 __ __ RTS
--------------------------------------------------------------------
spriteReset: ; spriteReset()->void
;  18, "/mnt/d/F256/f256lib-oscar64/f256lib/f_sprite.h"
.s4:
06d8 : a9 00 __ LDA #$00
06da : 85 1c __ STA P1 
06dc : 85 1b __ STA P0 
.l5:
06de : 20 ea 06 JSR $06ea ; (spriteSetVisible.s4 + 0)
06e1 : e6 1b __ INC P0 
06e3 : a5 1b __ LDA P0 
06e5 : c9 40 __ CMP #$40
06e7 : 90 f5 __ BCC $06de ; (spriteReset.l5 + 0)
.s3:
06e9 : 60 __ __ RTS
--------------------------------------------------------------------
spriteSetVisible: ; spriteSetVisible(u8,bool)->void
;  17, "/mnt/d/F256/f256lib-oscar64/f256lib/f_sprite.h"
.s4:
06ea : a5 1b __ LDA P0 ; (s + 0)
06ec : aa __ __ TAX
06ed : 0a __ __ ASL
06ee : 0a __ __ ASL
06ef : 0a __ __ ASL
06f0 : 85 29 __ STA ACCU + 0 
06f2 : bd 78 4d LDA $4d78,x ; (_spriteCtl[0] + 0)
06f5 : 05 1c __ ORA P1 ; (v + 0)
06f7 : aa __ __ TAX
06f8 : a9 00 __ LDA #$00
06fa : 69 d9 __ ADC #$d9
06fc : 85 2a __ STA ACCU + 1 
06fe : 8a __ __ TXA
06ff : a0 00 __ LDY #$00
0701 : 91 29 __ STA (ACCU + 0),y 
.s3:
0703 : 60 __ __ RTS
--------------------------------------------------------------------
fileReset: ; fileReset()->void
;  31, "/mnt/d/F256/f256lib-oscar64/f256lib/f_file.h"
.s4:
0704 : a9 00 __ LDA #$00
0706 : a2 07 __ LDX #$07
.l5:
0708 : 9d b8 4d STA $4db8,x ; (_dirStream[0] + 0)
070b : ca __ __ DEX
070c : 10 fa __ BPL $0708 ; (fileReset.l5 + 0)
.s3:
070e : 60 __ __ RTS
--------------------------------------------------------------------
randomReset: ; randomReset()->void
;  16, "/mnt/d/F256/f256lib-oscar64/f256lib/f_random.h"
.s4:
070f : a9 dc __ LDA #$dc
0711 : 8d c0 4d STA $4dc0 ; (_kern_target + 0)
0714 : a9 ff __ LDA #$ff
0716 : 8d c1 4d STA $4dc1 ; (_kern_target + 1)
0719 : ad f1 4c LDA $4cf1 ; (kernelArgs + 0)
071c : 85 35 __ STA T0 + 0 
071e : ad f2 4c LDA $4cf2 ; (kernelArgs + 1)
0721 : 85 36 __ STA T0 + 1 
0723 : a9 cf __ LDA #$cf
0725 : a0 0b __ LDY #$0b
0727 : 91 35 __ STA (T0 + 0),y 
0729 : a9 9f __ LDA #$9f
072b : c8 __ __ INY
072c : 91 35 __ STA (T0 + 0),y 
072e : a9 08 __ LDA #$08
0730 : c8 __ __ INY
0731 : 91 35 __ STA (T0 + 0),y 
0733 : 20 59 07 JSR $0759 ; (_kernelCallWrapper.s4 + 0)
0736 : ad d5 9f LDA $9fd5 ; (clock.seconds + 0)
0739 : 85 1b __ STA P0 
073b : ad d6 9f LDA $9fd6 ; (clock.centis + 0)
073e : 85 1d __ STA P2 
0740 : a9 00 __ LDA #$00
0742 : 85 1c __ STA P1 
0744 : 85 1e __ STA P3 
0746 : 20 78 04 JSR $0478 ; (mathUnsignedMultiply.s4 + 0)
0749 : a5 29 __ LDA ACCU + 0 
074b : 8d a4 d6 STA $d6a4 
074e : a5 2a __ LDA ACCU + 1 
0750 : 8d a5 d6 STA $d6a5 
0753 : a9 03 __ LDA #$03
0755 : 8d a6 d6 STA $d6a6 
.s3:
0758 : 60 __ __ RTS
--------------------------------------------------------------------
_kernelCallWrapper: ; _kernelCallWrapper()->u8
;  56, "/mnt/d/F256/f256lib-oscar64/f256lib/f_kernel.h"
.s4:
0759 : 20 61 07 JSR $0761 ; (_kernelCallRaw + 0)
075c : 85 29 __ STA ACCU + 0 
.s3:
075e : a5 29 __ LDA ACCU + 0 
0760 : 60 __ __ RTS
--------------------------------------------------------------------
_kernelCallRaw: ; _kernelCallRaw
0761 : ad c0 4d LDA $4dc0 ; (_kern_target + 0)
0764 : 8d 6e 07 STA $076e ; (_kernelCallRaw + 13)
0767 : ad c1 4d LDA $4dc1 ; (_kern_target + 1)
076a : 8d 6f 07 STA $076f ; (_kernelCallRaw + 14)
076d : 20 00 00 JSR $0000 
0770 : aa __ __ TAX
0771 : a9 00 __ LDA #$00
0773 : 6a __ __ ROR
0774 : 8d c2 4d STA $4dc2 ; (_kernelError + 0)
0777 : 8a __ __ TXA
0778 : 60 __ __ RTS
--------------------------------------------------------------------
f256main: ; f256main(i16,u8**)->i16
; 232, "/mnt/d/F256/f256lib-oscar64/doodles/modplayer/src/modplayer.c"
.s1:
0779 : a2 05 __ LDX #$05
077b : b5 55 __ LDA T0 + 0,x 
077d : 9d 2d 9c STA $9c2d,x ; (f256main@stack + 0)
0780 : ca __ __ DEX
0781 : 10 f8 __ BPL $077b ; (f256main.s1 + 2)
.s4:
0783 : 20 f8 09 JSR $09f8 ; (setup.s4 + 0)
0786 : a2 00 __ LDX #$00
0788 : 86 5a __ STX T7 + 0 
078a : ad fd 9f LDA $9ffd ; (sstack + 38)
078d : d0 0a __ BNE $0799 ; (f256main.s5 + 0)
.s27:
078f : ad fc 9f LDA $9ffc ; (sstack + 37)
0792 : c9 03 __ CMP #$03
0794 : d0 03 __ BNE $0799 ; (f256main.s5 + 0)
0796 : 4c 73 09 JMP $0973 ; (f256main.s19 + 0)
.s5:
0799 : 8a __ __ TXA
.s6:
079a : 85 57 __ STA T2 + 0 
079c : a9 01 __ LDA #$01
079e : 85 1d __ STA P2 
07a0 : 20 51 0b JSR $0b51 ; (lilpause.s4 + 0)
07a3 : a9 00 __ LDA #$00
07a5 : 8d 36 9c STA $9c36 ; (curLine + 0)
07a8 : 8d 37 9c STA $9c37 ; (curLine + 1)
.l7:
07ab : 20 ea 0b JSR $0bea ; (instructions.s4 + 0)
07ae : a5 57 __ LDA T2 + 0 
07b0 : f0 39 __ BEQ $07eb ; (f256main.s8 + 0)
.l14:
07b2 : a9 00 __ LDA #$00
07b4 : 85 25 __ STA P10 
07b6 : a9 4e __ LDA #$4e
07b8 : 85 26 __ STA P11 
07ba : 20 4b 37 JSR $374b ; (load_MOD_file.s4 + 0)
07bd : a5 2a __ LDA ACCU + 1 
07bf : 85 56 __ STA T0 + 1 
07c1 : a5 29 __ LDA ACCU + 0 
07c3 : 85 55 __ STA T0 + 0 
07c5 : f0 03 __ BEQ $07ca ; (f256main.l16 + 0)
07c7 : 4c 6e 09 JMP $096e ; (f256main.s28 + 0)
.l16:
07ca : a5 56 __ LDA T0 + 1 
07cc : d0 f9 __ BNE $07c7 ; (f256main.l14 + 21)
.s13:
07ce : 85 1b __ STA P0 
07d0 : a9 02 __ LDA #$02
07d2 : 85 1c __ STA P1 
07d4 : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
07d7 : a9 5e __ LDA #$5e
07d9 : 8d df 9f STA $9fdf ; (sstack + 8)
07dc : a9 37 __ LDA #$37
07de : 8d e0 9f STA $9fe0 ; (sstack + 9)
07e1 : 20 48 0c JSR $0c48 ; (printf.s4 + 0)
07e4 : 20 65 37 JSR $3765 ; (hitspace.l4 + 0)
07e7 : a5 57 __ LDA T2 + 0 
07e9 : d0 c7 __ BNE $07b2 ; (f256main.l14 + 0)
.s8:
07eb : a5 5a __ LDA T7 + 0 
07ed : f0 24 __ BEQ $0813 ; (f256main.s9 + 0)
.s18:
07ef : a5 58 __ LDA T4 + 0 
07f1 : 8d df 9f STA $9fdf ; (sstack + 8)
07f4 : a5 59 __ LDA T4 + 1 
07f6 : 8d e0 9f STA $9fe0 ; (sstack + 9)
07f9 : a9 1a __ LDA #$1a
07fb : 8d e3 9f STA $9fe3 ; (sstack + 12)
07fe : a9 02 __ LDA #$02
0800 : 8d e4 9f STA $9fe4 ; (sstack + 13)
0803 : a9 36 __ LDA #$36
0805 : 8d e1 9f STA $9fe1 ; (sstack + 10)
0808 : a9 9c __ LDA #$9c
080a : 8d e2 9f STA $9fe2 ; (sstack + 11)
080d : 20 76 1b JSR $1b76 ; (fetchNextPLEntry.s4 + 0)
0810 : 4c 27 08 JMP $0827 ; (f256main.s10 + 0)
.s9:
0813 : a9 00 __ LDA #$00
0815 : 8d fa 9f STA $9ffa ; (sstack + 35)
0818 : a9 4e __ LDA #$4e
081a : 8d fb 9f STA $9ffb ; (sstack + 36)
081d : 20 68 1e JSR $1e68 ; (getTheFile_far.s1 + 0)
0820 : a5 29 __ LDA ACCU + 0 
0822 : f0 03 __ BEQ $0827 ; (f256main.s10 + 0)
0824 : 4c 5d 09 JMP $095d ; (f256main.s17 + 0)
.s10:
0827 : a9 03 __ LDA #$03
0829 : 8d ed 9f STA $9fed ; (sstack + 22)
082c : 20 2b 36 JSR $362b ; (eraseLine.s4 + 0)
082f : a9 04 __ LDA #$04
0831 : 8d ed 9f STA $9fed ; (sstack + 22)
0834 : 20 2b 36 JSR $362b ; (eraseLine.s4 + 0)
0837 : a9 00 __ LDA #$00
0839 : 85 1b __ STA P0 
083b : a9 03 __ LDA #$03
083d : 85 1c __ STA P1 
083f : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
0842 : a9 07 __ LDA #$07
0844 : 85 1b __ STA P0 
0846 : a9 00 __ LDA #$00
0848 : 85 1c __ STA P1 
084a : 20 3b 0c JSR $0c3b ; (textSetColor.s4 + 0)
084d : a9 95 __ LDA #$95
084f : 8d df 9f STA $9fdf ; (sstack + 8)
0852 : a9 36 __ LDA #$36
0854 : 8d e0 9f STA $9fe0 ; (sstack + 9)
0857 : a9 00 __ LDA #$00
0859 : 8d e1 9f STA $9fe1 ; (sstack + 10)
085c : a9 4e __ LDA #$4e
085e : 8d e2 9f STA $9fe2 ; (sstack + 11)
0861 : 20 48 0c JSR $0c48 ; (printf.s4 + 0)
0864 : a9 00 __ LDA #$00
0866 : 85 1b __ STA P0 
0868 : a9 4e __ LDA #$4e
086a : 85 1c __ STA P1 
086c : 20 79 20 JSR $2079 ; (strlen.s4 + 0)
086f : 18 __ __ CLC
0870 : a5 29 __ LDA ACCU + 0 
0872 : 69 fd __ ADC #$fd
0874 : 18 __ __ CLC
0875 : 69 00 __ ADC #$00
0877 : 85 1b __ STA P0 
0879 : a9 4e __ LDA #$4e
087b : 69 00 __ ADC #$00
087d : 85 1c __ STA P1 
087f : a9 26 __ LDA #$26
0881 : 85 1d __ STA P2 
0883 : a9 36 __ LDA #$36
0885 : 85 1e __ STA P3 
0887 : 20 fe 26 JSR $26fe ; (strcmp.s4 + 0)
088a : aa __ __ TAX
088b : d0 3c __ BNE $08c9 ; (f256main.s12 + 0)
.s11:
088d : a9 00 __ LDA #$00
088f : 85 21 __ STA P6 
0891 : a9 37 __ LDA #$37
0893 : 85 24 __ STA P9 
0895 : a9 4e __ LDA #$4e
0897 : 85 22 __ STA P7 
0899 : a9 49 __ LDA #$49
089b : 85 23 __ STA P8 
089d : 20 a4 36 JSR $36a4 ; (fileOpen.s4 + 0)
08a0 : a5 29 __ LDA ACCU + 0 
08a2 : 85 58 __ STA T4 + 0 
08a4 : 8d df 9f STA $9fdf ; (sstack + 8)
08a7 : a5 2a __ LDA ACCU + 1 
08a9 : 85 59 __ STA T4 + 1 
08ab : 8d e0 9f STA $9fe0 ; (sstack + 9)
08ae : a9 1a __ LDA #$1a
08b0 : 8d e3 9f STA $9fe3 ; (sstack + 12)
08b3 : a9 02 __ LDA #$02
08b5 : 8d e4 9f STA $9fe4 ; (sstack + 13)
08b8 : a9 36 __ LDA #$36
08ba : 8d e1 9f STA $9fe1 ; (sstack + 10)
08bd : a9 9c __ LDA #$9c
08bf : 8d e2 9f STA $9fe2 ; (sstack + 11)
08c2 : 20 76 1b JSR $1b76 ; (fetchNextPLEntry.s4 + 0)
08c5 : a9 01 __ LDA #$01
08c7 : 85 5a __ STA T7 + 0 
.s12:
08c9 : a9 00 __ LDA #$00
08cb : 85 25 __ STA P10 
08cd : a9 4e __ LDA #$4e
08cf : 85 26 __ STA P11 
08d1 : 20 4b 37 JSR $374b ; (load_MOD_file.s4 + 0)
08d4 : a5 29 __ LDA ACCU + 0 
08d6 : 85 55 __ STA T0 + 0 
08d8 : a5 2a __ LDA ACCU + 1 
08da : 85 56 __ STA T0 + 1 
08dc : a9 01 __ LDA #$01
08de : 85 1d __ STA P2 
08e0 : 20 51 0b JSR $0b51 ; (lilpause.s4 + 0)
08e3 : a5 55 __ LDA T0 + 0 
08e5 : d0 03 __ BNE $08ea ; (f256main.s15 + 0)
08e7 : 4c ca 07 JMP $07ca ; (f256main.l16 + 0)
.s15:
08ea : 8d ed 9f STA $9fed ; (sstack + 22)
08ed : a5 56 __ LDA T0 + 1 
08ef : 8d ee 9f STA $9fee ; (sstack + 23)
08f2 : 20 7b 37 JSR $377b ; (checkMODHeader.s1 + 0)
08f5 : a9 03 __ LDA #$03
08f7 : 8d ed 9f STA $9fed ; (sstack + 22)
08fa : 20 2b 36 JSR $362b ; (eraseLine.s4 + 0)
08fd : a9 04 __ LDA #$04
08ff : 8d ed 9f STA $9fed ; (sstack + 22)
0902 : 20 2b 36 JSR $362b ; (eraseLine.s4 + 0)
0905 : a9 05 __ LDA #$05
0907 : 8d ed 9f STA $9fed ; (sstack + 22)
090a : 20 2b 36 JSR $362b ; (eraseLine.s4 + 0)
090d : a9 06 __ LDA #$06
090f : 8d ed 9f STA $9fed ; (sstack + 22)
0912 : 20 2b 36 JSR $362b ; (eraseLine.s4 + 0)
0915 : a9 07 __ LDA #$07
0917 : 8d ed 9f STA $9fed ; (sstack + 22)
091a : 20 2b 36 JSR $362b ; (eraseLine.s4 + 0)
091d : a9 08 __ LDA #$08
091f : 8d ed 9f STA $9fed ; (sstack + 22)
0922 : 20 2b 36 JSR $362b ; (eraseLine.s4 + 0)
0925 : a9 00 __ LDA #$00
0927 : 85 1b __ STA P0 
0929 : a9 03 __ LDA #$03
092b : 85 1c __ STA P1 
092d : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
0930 : a9 00 __ LDA #$00
0932 : 85 57 __ STA T2 + 0 
0934 : 85 1c __ STA P1 
0936 : a9 07 __ LDA #$07
0938 : 85 1b __ STA P0 
093a : 20 3b 0c JSR $0c3b ; (textSetColor.s4 + 0)
093d : a9 b9 __ LDA #$b9
093f : 8d df 9f STA $9fdf ; (sstack + 8)
0942 : a9 43 __ LDA #$43
0944 : 8d e0 9f STA $9fe0 ; (sstack + 9)
0947 : a9 00 __ LDA #$00
0949 : 8d e1 9f STA $9fe1 ; (sstack + 10)
094c : a9 4e __ LDA #$4e
094e : 8d e2 9f STA $9fe2 ; (sstack + 11)
0951 : 20 48 0c JSR $0c48 ; (printf.s4 + 0)
0954 : 20 c8 43 JSR $43c8 ; (textUI.s4 + 0)
0957 : 20 08 45 JSR $4508 ; (vs1053bBoostClock.s4 + 0)
095a : 4c ab 07 JMP $07ab ; (f256main.l7 + 0)
.s17:
095d : a9 00 __ LDA #$00
095f : 85 29 __ STA ACCU + 0 
0961 : 85 2a __ STA ACCU + 1 
.s3:
0963 : a2 05 __ LDX #$05
0965 : bd 2d 9c LDA $9c2d,x ; (f256main@stack + 0)
0968 : 95 55 __ STA T0 + 0,x 
096a : ca __ __ DEX
096b : 10 f8 __ BPL $0965 ; (f256main.s3 + 2)
096d : 60 __ __ RTS
.s28:
096e : a5 55 __ LDA T0 + 0 
0970 : 4c ea 08 JMP $08ea ; (f256main.s15 + 0)
.s19:
0973 : 86 37 __ STX T5 + 0 
0975 : ad fe 9f LDA $9ffe ; (sstack + 39)
0978 : 85 55 __ STA T0 + 0 
097a : ad ff 9f LDA $9fff ; (sstack + 40)
097d : 85 56 __ STA T0 + 1 
097f : 4c 84 09 JMP $0984 ; (f256main.l20 + 0)
.s26:
0982 : e6 37 __ INC T5 + 0 
.l20:
0984 : a0 02 __ LDY #$02
0986 : b1 55 __ LDA (T0 + 0),y 
0988 : 85 35 __ STA T3 + 0 
098a : c8 __ __ INY
098b : b1 55 __ LDA (T0 + 0),y 
098d : 85 36 __ STA T3 + 1 
098f : a4 37 __ LDY T5 + 0 
0991 : b1 35 __ LDA (T3 + 0),y 
0993 : 99 39 9c STA $9c39,y ; (cliPath[0] + 0)
0996 : d0 ea __ BNE $0982 ; (f256main.s26 + 0)
.s21:
0998 : a0 00 __ LDY #$00
099a : b1 35 __ LDA (T3 + 0),y 
099c : f0 08 __ BEQ $09a6 ; (f256main.s22 + 0)
.l25:
099e : 99 00 4e STA $4e00,y ; (name[0] + 0)
09a1 : c8 __ __ INY
09a2 : b1 35 __ LDA (T3 + 0),y 
09a4 : d0 f8 __ BNE $099e ; (f256main.l25 + 0)
.s22:
09a6 : 84 38 __ STY T6 + 0 
09a8 : 85 1e __ STA P3 
09aa : a9 2f __ LDA #$2f
09ac : 85 1d __ STA P2 
09ae : a9 4e __ LDA #$4e
09b0 : 85 1c __ STA P1 
09b2 : a9 00 __ LDA #$00
09b4 : 85 1b __ STA P0 
09b6 : 20 ab 0a JSR $0aab ; (strrchr.s4 + 0)
09b9 : a9 00 __ LDA #$00
09bb : 85 1d __ STA P2 
09bd : a9 4e __ LDA #$4e
09bf : 85 1e __ STA P3 
09c1 : 38 __ __ SEC
09c2 : a5 29 __ LDA ACCU + 0 
09c4 : e9 00 __ SBC #$00
09c6 : 85 55 __ STA T0 + 0 
09c8 : 85 1f __ STA P4 
09ca : a9 00 __ LDA #$00
09cc : 85 20 __ STA P5 
09ce : a2 3c __ LDX #$3c
.l23:
09d0 : ca __ __ DEX
09d1 : 9d 39 9c STA $9c39,x ; (cliPath[0] + 0)
09d4 : d0 fa __ BNE $09d0 ; (f256main.l23 + 0)
.s24:
09d6 : a9 39 __ LDA #$39
09d8 : 85 1b __ STA P0 
09da : a9 9c __ LDA #$9c
09dc : 85 1c __ STA P1 
09de : 20 de 0a JSR $0ade ; (strncpy.s4 + 0)
09e1 : a9 00 __ LDA #$00
09e3 : a6 55 __ LDX T0 + 0 
09e5 : 9d 39 9c STA $9c39,x ; (cliPath[0] + 0)
09e8 : a9 39 __ LDA #$39
09ea : 85 20 __ STA P5 
09ec : a9 9c __ LDA #$9c
09ee : 85 21 __ STA P6 
09f0 : 20 28 0a JSR $0a28 ; (fpr_set_currentPath.s4 + 0)
09f3 : a9 01 __ LDA #$01
09f5 : 4c 9a 07 JMP $079a ; (f256main.s6 + 0)
--------------------------------------------------------------------
setup: ; setup()->void
;  22, "/mnt/d/F256/f256lib-oscar64/doodles/modplayer/src/modplayer.c"
.s4:
09f8 : a9 00 __ LDA #$00
09fa : 85 01 __ STA $01 
09fc : a9 0f __ LDA #$0f
09fe : 8d 00 d0 STA $d000 
0a01 : a9 00 __ LDA #$00
0a03 : 8d 01 d0 STA $d001 
0a06 : a9 10 __ LDA #$10
0a08 : 8d 02 d0 STA $d002 
0a0b : a9 00 __ LDA #$00
0a0d : 8d 0d d0 STA $d00d 
0a10 : 8d 0e d0 STA $d00e 
0a13 : 8d 0f d0 STA $d00f 
0a16 : a9 81 __ LDA #$81
0a18 : 85 20 __ STA P5 
0a1a : a9 0a __ LDA #$0a
0a1c : 85 21 __ STA P6 
0a1e : 20 28 0a JSR $0a28 ; (fpr_set_currentPath.s4 + 0)
0a21 : a9 00 __ LDA #$00
0a23 : 85 01 __ STA $01 
0a25 : 4c 8b 0a JMP $0a8b ; (highVol.s4 + 0)
--------------------------------------------------------------------
fpr_set_currentPath: ; fpr_set_currentPath(const u8*)->void
;  65, "/mnt/d/F256/f256lib-oscar64/doodles/modplayer/src/muFilePicker.h"
.s4:
0a28 : a0 00 __ LDY #$00
.l5:
0a2a : b1 20 __ LDA (P5),y ; (s + 0)
0a2c : 85 1f __ STA P4 
0a2e : c8 __ __ INY
0a2f : c8 __ __ INY
0a30 : 84 39 __ STY T1 + 0 
0a32 : 84 1b __ STY P0 
0a34 : a9 00 __ LDA #$00
0a36 : 85 1c __ STA P1 
0a38 : 85 1e __ STA P3 
0a3a : a9 03 __ LDA #$03
0a3c : 85 1d __ STA P2 
0a3e : 20 50 0a JSR $0a50 ; (FAR_POKE.s4 + 0)
0a41 : a5 1f __ LDA P4 
0a43 : f0 0a __ BEQ $0a4f ; (fpr_set_currentPath.s3 + 0)
.s6:
0a45 : 18 __ __ CLC
0a46 : a5 39 __ LDA T1 + 0 
0a48 : 69 ff __ ADC #$ff
0a4a : c9 3c __ CMP #$3c
0a4c : a8 __ __ TAY
0a4d : 90 db __ BCC $0a2a ; (fpr_set_currentPath.l5 + 0)
.s3:
0a4f : 60 __ __ RTS
--------------------------------------------------------------------
FAR_POKE: ; FAR_POKE(u32,u8)->void
; 216, "/mnt/d/F256/f256lib-oscar64/f256lib/f256lib.h"
.s4:
0a50 : a5 0f __ LDA $0f 
0a52 : 85 38 __ STA T2 + 0 
0a54 : 78 __ __ SEI
0a55 : a5 1b __ LDA P0 ; (address + 0)
0a57 : 85 35 __ STA T0 + 0 
0a59 : a5 1c __ LDA P1 ; (address + 1)
0a5b : 85 37 __ STA T1 + 0 
0a5d : a5 1e __ LDA P3 ; (address + 3)
0a5f : a2 05 __ LDX #$05
.l5:
0a61 : 4a __ __ LSR
0a62 : 66 1d __ ROR P2 ; (address + 2)
0a64 : 66 37 __ ROR T1 + 0 
0a66 : ca __ __ DEX
0a67 : d0 f8 __ BNE $0a61 ; (FAR_POKE.l5 + 0)
.s6:
0a69 : a5 37 __ LDA T1 + 0 
0a6b : 85 0f __ STA $0f 
0a6d : a5 1c __ LDA P1 ; (address + 1)
0a6f : 29 1f __ AND #$1f
0a71 : 09 e0 __ ORA #$e0
0a73 : 85 36 __ STA T0 + 1 
0a75 : a5 1f __ LDA P4 ; (value + 0)
0a77 : a0 00 __ LDY #$00
0a79 : 91 35 __ STA (T0 + 0),y 
0a7b : a5 38 __ LDA T2 + 0 
0a7d : 85 0f __ STA $0f 
0a7f : 58 __ __ CLI
.s3:
0a80 : 60 __ __ RTS
--------------------------------------------------------------------
0a81 : __ __ __ BYT 6d 65 64 69 61 2f 6d 6f 64 00                   : media/mod.
--------------------------------------------------------------------
highVol: ; highVol()->void
;  38, "/mnt/d/F256/f256lib-oscar64/doodles/modplayer/src/muMODplay.h"
.s4:
0a8b : a9 0b __ LDA #$0b
0a8d : 8d 01 d7 STA $d701 
0a90 : a9 00 __ LDA #$00
0a92 : 8d 02 d7 STA $d702 
0a95 : 8d 02 d7 STA $d702 
0a98 : 8d 03 d7 STA $d703 
0a9b : a9 03 __ LDA #$03
0a9d : 8d 00 d7 STA $d700 
0aa0 : a9 00 __ LDA #$00
0aa2 : 8d 00 d7 STA $d700 
.l5:
0aa5 : 2c 00 d7 BIT $d700 
0aa8 : 30 fb __ BMI $0aa5 ; (highVol.l5 + 0)
.s3:
0aaa : 60 __ __ RTS
--------------------------------------------------------------------
strrchr: ; strrchr(const u8*,i16)->u8*
;  20, "/mnt/d/F256/oscar64/include/string.h"
.s4:
0aab : a9 00 __ LDA #$00
0aad : 85 29 __ STA ACCU + 0 
0aaf : 85 2a __ STA ACCU + 1 
0ab1 : a8 __ __ TAY
0ab2 : b1 1b __ LDA (P0),y ; (str + 0)
0ab4 : f0 19 __ BEQ $0acf ; (strrchr.s5 + 0)
.s10:
0ab6 : a6 1d __ LDX P2 ; (ch + 0)
.l7:
0ab8 : 8a __ __ TXA
0ab9 : d1 1b __ CMP (P0),y ; (str + 0)
0abb : d0 08 __ BNE $0ac5 ; (strrchr.s8 + 0)
.s9:
0abd : a5 1b __ LDA P0 ; (str + 0)
0abf : 85 29 __ STA ACCU + 0 
0ac1 : a5 1c __ LDA P1 ; (str + 1)
0ac3 : 85 2a __ STA ACCU + 1 
.s8:
0ac5 : e6 1b __ INC P0 ; (str + 0)
0ac7 : d0 02 __ BNE $0acb ; (strrchr.s12 + 0)
.s11:
0ac9 : e6 1c __ INC P1 ; (str + 1)
.s12:
0acb : b1 1b __ LDA (P0),y ; (str + 0)
0acd : d0 e9 __ BNE $0ab8 ; (strrchr.l7 + 0)
.s5:
0acf : a5 1d __ LDA P2 ; (ch + 0)
0ad1 : 05 1e __ ORA P3 ; (ch + 1)
0ad3 : d0 08 __ BNE $0add ; (strrchr.s3 + 0)
.s6:
0ad5 : a5 1b __ LDA P0 ; (str + 0)
0ad7 : 85 29 __ STA ACCU + 0 
0ad9 : a5 1c __ LDA P1 ; (str + 1)
0adb : 85 2a __ STA ACCU + 1 
.s3:
0add : 60 __ __ RTS
--------------------------------------------------------------------
strncpy: ; strncpy(u8*,const u8*,i16)->u8*
;   6, "/mnt/d/F256/oscar64/include/string.h"
.s4:
0ade : a5 1f __ LDA P4 ; (n + 0)
0ae0 : aa __ __ TAX
0ae1 : 18 __ __ CLC
0ae2 : 69 ff __ ADC #$ff
0ae4 : 85 1f __ STA P4 ; (n + 0)
0ae6 : a5 20 __ LDA P5 ; (n + 1)
0ae8 : 85 2a __ STA ACCU + 1 
0aea : 69 ff __ ADC #$ff
0aec : 85 20 __ STA P5 ; (n + 1)
0aee : a5 1b __ LDA P0 ; (dst + 0)
0af0 : 85 35 __ STA T1 + 0 
0af2 : a5 1c __ LDA P1 ; (dst + 1)
0af4 : 85 36 __ STA T1 + 1 
.l5:
0af6 : 8a __ __ TXA
0af7 : 05 2a __ ORA ACCU + 1 
0af9 : f0 29 __ BEQ $0b24 ; (strncpy.s6 + 0)
.s10:
0afb : a0 00 __ LDY #$00
0afd : b1 1d __ LDA (P2),y ; (src + 0)
0aff : 91 35 __ STA (T1 + 0),y 
0b01 : aa __ __ TAX
0b02 : e6 35 __ INC T1 + 0 
0b04 : d0 02 __ BNE $0b08 ; (strncpy.s17 + 0)
.s16:
0b06 : e6 36 __ INC T1 + 1 
.s17:
0b08 : 8a __ __ TXA
0b09 : f0 19 __ BEQ $0b24 ; (strncpy.s6 + 0)
.s11:
0b0b : a5 1f __ LDA P4 ; (n + 0)
0b0d : aa __ __ TAX
0b0e : 18 __ __ CLC
0b0f : 69 ff __ ADC #$ff
0b11 : 85 1f __ STA P4 ; (n + 0)
0b13 : a5 20 __ LDA P5 ; (n + 1)
0b15 : 85 2a __ STA ACCU + 1 
0b17 : 69 ff __ ADC #$ff
0b19 : 85 20 __ STA P5 ; (n + 1)
0b1b : e6 1d __ INC P2 ; (src + 0)
0b1d : d0 d7 __ BNE $0af6 ; (strncpy.l5 + 0)
.s18:
0b1f : e6 1e __ INC P3 ; (src + 1)
0b21 : 4c f6 0a JMP $0af6 ; (strncpy.l5 + 0)
.s6:
0b24 : a5 20 __ LDA P5 ; (n + 1)
0b26 : 30 20 __ BMI $0b48 ; (strncpy.s7 + 0)
.s9:
0b28 : 05 1f __ ORA P4 ; (n + 0)
0b2a : f0 1c __ BEQ $0b48 ; (strncpy.s7 + 0)
.s8:
0b2c : a0 00 __ LDY #$00
0b2e : a5 1f __ LDA P4 ; (n + 0)
0b30 : f0 02 __ BEQ $0b34 ; (strncpy.l12 + 0)
.s13:
0b32 : e6 20 __ INC P5 ; (n + 1)
.l12:
0b34 : a6 1f __ LDX P4 ; (n + 0)
.l14:
0b36 : a9 00 __ LDA #$00
0b38 : 91 35 __ STA (T1 + 0),y 
0b3a : c8 __ __ INY
0b3b : d0 02 __ BNE $0b3f ; (strncpy.s20 + 0)
.s19:
0b3d : e6 36 __ INC T1 + 1 
.s20:
0b3f : ca __ __ DEX
0b40 : d0 f4 __ BNE $0b36 ; (strncpy.l14 + 0)
.s15:
0b42 : 85 1f __ STA P4 ; (n + 0)
0b44 : c6 20 __ DEC P5 ; (n + 1)
0b46 : d0 ec __ BNE $0b34 ; (strncpy.l12 + 0)
.s7:
0b48 : a5 1b __ LDA P0 ; (dst + 0)
0b4a : 85 29 __ STA ACCU + 0 
0b4c : a5 1c __ LDA P1 ; (dst + 1)
0b4e : 85 2a __ STA ACCU + 1 
.s3:
0b50 : 60 __ __ RTS
--------------------------------------------------------------------
lilpause: ; lilpause(u8)->void
;  14, "/mnt/d/F256/f256lib-oscar64/doodles/modplayer/src/muUtils.h"
.s4:
0b51 : a9 00 __ LDA #$00
0b53 : 85 1b __ STA P0 
0b55 : 8d d4 9f STA $9fd4 ; (pauseTimer.units + 0)
0b58 : a9 d5 __ LDA #$d5
0b5a : 8d d6 9f STA $9fd6 ; (pauseTimer.cookie + 0)
0b5d : 20 83 0b JSR $0b83 ; (getTimerAbsolute.s4 + 0)
0b60 : 18 __ __ CLC
0b61 : 65 1d __ ADC P2 ; (timedelay + 0)
0b63 : 8d d5 9f STA $9fd5 ; (pauseTimer.absolute + 0)
0b66 : a9 d4 __ LDA #$d4
0b68 : 85 1b __ STA P0 
0b6a : a9 9f __ LDA #$9f
0b6c : 85 1c __ STA P1 
0b6e : 20 b6 0b JSR $0bb6 ; (setTimer.s4 + 0)
.l5:
0b71 : 20 da 0b JSR $0bda ; (kernelNextEvent.s4 + 0)
0b74 : ad f3 4c LDA $4cf3 ; (kernelEventData.type + 0)
0b77 : c9 52 __ CMP #$52
0b79 : d0 f6 __ BNE $0b71 ; (lilpause.l5 + 0)
.s6:
0b7b : ad f7 4c LDA $4cf7 ; (kernelEventData.u + 1)
0b7e : c9 d5 __ CMP #$d5
0b80 : d0 ef __ BNE $0b71 ; (lilpause.l5 + 0)
.s3:
0b82 : 60 __ __ RTS
--------------------------------------------------------------------
getTimerAbsolute: ; getTimerAbsolute(u8)->u8
;  17, "/mnt/d/F256/f256lib-oscar64/doodles/modplayer/src/muUtils.h"
.s4:
0b83 : a5 1b __ LDA P0 ; (units + 0)
0b85 : 09 80 __ ORA #$80
0b87 : 85 f3 __ STA $f3 
0b89 : a9 f0 __ LDA #$f0
0b8b : 8d c0 4d STA $4dc0 ; (_kern_target + 0)
0b8e : a9 ff __ LDA #$ff
0b90 : 8d c1 4d STA $4dc1 ; (_kern_target + 1)
0b93 : 4c 96 0b JMP $0b96 ; (_kernelCallWrapper.s4 + 0)
--------------------------------------------------------------------
_kernelCallWrapper: ; _kernelCallWrapper()->u8
;  56, "/mnt/d/F256/f256lib-oscar64/f256lib/f_kernel.h"
.s4:
0b96 : 20 9e 0b JSR $0b9e ; (_kernelCallRaw + 0)
0b99 : 85 29 __ STA ACCU + 0 
.s3:
0b9b : a5 29 __ LDA ACCU + 0 
0b9d : 60 __ __ RTS
--------------------------------------------------------------------
_kernelCallRaw: ; _kernelCallRaw
0b9e : ad c0 4d LDA $4dc0 ; (_kern_target + 0)
0ba1 : 8d ab 0b STA $0bab ; (_kernelCallRaw + 13)
0ba4 : ad c1 4d LDA $4dc1 ; (_kern_target + 1)
0ba7 : 8d ac 0b STA $0bac ; (_kernelCallRaw + 14)
0baa : 20 00 00 JSR $0000 
0bad : aa __ __ TAX
0bae : a9 00 __ LDA #$00
0bb0 : 6a __ __ ROR
0bb1 : 8d c2 4d STA $4dc2 ; (_kernelError + 0)
0bb4 : 8a __ __ TXA
0bb5 : 60 __ __ RTS
--------------------------------------------------------------------
setTimer: ; setTimer(const struct timer_t*)->bool
;  16, "/mnt/d/F256/f256lib-oscar64/doodles/modplayer/src/muUtils.h"
.s4:
0bb6 : a9 f0 __ LDA #$f0
0bb8 : 8d c0 4d STA $4dc0 ; (_kern_target + 0)
0bbb : a9 ff __ LDA #$ff
0bbd : 8d c1 4d STA $4dc1 ; (_kern_target + 1)
0bc0 : a0 00 __ LDY #$00
0bc2 : b1 1b __ LDA (P0),y ; (timer + 0)
0bc4 : 85 f3 __ STA $f3 
0bc6 : c8 __ __ INY
0bc7 : b1 1b __ LDA (P0),y ; (timer + 0)
0bc9 : 85 f4 __ STA $f4 
0bcb : c8 __ __ INY
0bcc : b1 1b __ LDA (P0),y ; (timer + 0)
0bce : 85 f5 __ STA $f5 
0bd0 : 20 96 0b JSR $0b96 ; (_kernelCallWrapper.s4 + 0)
0bd3 : a9 00 __ LDA #$00
0bd5 : cd c2 4d CMP $4dc2 ; (_kernelError + 0)
0bd8 : 2a __ __ ROL
.s3:
0bd9 : 60 __ __ RTS
--------------------------------------------------------------------
kernelNextEvent: ; kernelNextEvent()->u8
;  66, "/mnt/d/F256/f256lib-oscar64/f256lib/f_kernel.h"
.s4:
0bda : a9 00 __ LDA #$00
0bdc : 8d c0 4d STA $4dc0 ; (_kern_target + 0)
0bdf : 8d f3 4c STA $4cf3 ; (kernelEventData.type + 0)
0be2 : a9 ff __ LDA #$ff
0be4 : 8d c1 4d STA $4dc1 ; (_kern_target + 1)
0be7 : 4c 96 0b JMP $0b96 ; (_kernelCallWrapper.s4 + 0)
--------------------------------------------------------------------
instructions: ; instructions()->void
;  11, "/mnt/d/F256/f256lib-oscar64/doodles/modplayer/src/textUI.h"
.s4:
0bea : a9 01 __ LDA #$01
0bec : 20 28 0c JSR $0c28 ; (textEnableBackgroundColors.s4 + 0)
0bef : a9 0d __ LDA #$0d
0bf1 : 85 1b __ STA P0 
0bf3 : a9 01 __ LDA #$01
0bf5 : 85 1c __ STA P1 
0bf7 : 20 3b 0c JSR $0c3b ; (textSetColor.s4 + 0)
0bfa : c6 1c __ DEC P1 
0bfc : a9 00 __ LDA #$00
0bfe : 85 1b __ STA P0 
0c00 : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
0c03 : a9 ae __ LDA #$ae
0c05 : 8d df 9f STA $9fdf ; (sstack + 8)
0c08 : a9 1a __ LDA #$1a
0c0a : 8d e0 9f STA $9fe0 ; (sstack + 9)
0c0d : 20 48 0c JSR $0c48 ; (printf.s4 + 0)
0c10 : a9 00 __ LDA #$00
0c12 : 85 1b __ STA P0 
0c14 : a9 01 __ LDA #$01
0c16 : 85 1c __ STA P1 
0c18 : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
0c1b : a9 00 __ LDA #$00
0c1d : 8d df 9f STA $9fdf ; (sstack + 8)
0c20 : a9 1b __ LDA #$1b
0c22 : 8d e0 9f STA $9fe0 ; (sstack + 9)
0c25 : 4c 48 0c JMP $0c48 ; (printf.s4 + 0)
--------------------------------------------------------------------
textEnableBackgroundColors: ; textEnableBackgroundColors(bool)->void
;  43, "/mnt/d/F256/f256lib-oscar64/f256lib/f_text.h"
.s4:
0c28 : aa __ __ TAX
0c29 : ad 01 d0 LDA $d001 
0c2c : 29 ef __ AND #$ef
0c2e : 85 29 __ STA ACCU + 0 
0c30 : 8a __ __ TXA
0c31 : 0a __ __ ASL
0c32 : 0a __ __ ASL
0c33 : 0a __ __ ASL
0c34 : 0a __ __ ASL
0c35 : 05 29 __ ORA ACCU + 0 
0c37 : 8d 01 d0 STA $d001 
.s3:
0c3a : 60 __ __ RTS
--------------------------------------------------------------------
textSetColor: ; textSetColor(u8,u8)->void
;  58, "/mnt/d/F256/f256lib-oscar64/f256lib/f_text.h"
.s4:
0c3b : a5 1b __ LDA P0 ; (f + 0)
0c3d : 0a __ __ ASL
0c3e : 0a __ __ ASL
0c3f : 0a __ __ ASL
0c40 : 0a __ __ ASL
0c41 : 18 __ __ CLC
0c42 : 65 1c __ ADC P1 ; (b + 0)
0c44 : 8d fd 44 STA $44fd ; (_ccolor + 0)
.s3:
0c47 : 60 __ __ RTS
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
;  18, "/mnt/d/F256/oscar64/include/stdio.h"
.s4:
0c48 : a9 01 __ LDA #$01
0c4a : 8d de 9f STA $9fde ; (sstack + 7)
0c4d : a9 8d __ LDA #$8d
0c4f : 8d d8 9f STA $9fd8 ; (sstack + 1)
0c52 : a9 9f __ LDA #$9f
0c54 : 8d d9 9f STA $9fd9 ; (sstack + 2)
0c57 : ad df 9f LDA $9fdf ; (sstack + 8)
0c5a : 8d da 9f STA $9fda ; (sstack + 3)
0c5d : ad e0 9f LDA $9fe0 ; (sstack + 9)
0c60 : 8d db 9f STA $9fdb ; (sstack + 4)
0c63 : a9 e1 __ LDA #$e1
0c65 : 8d dc 9f STA $9fdc ; (sstack + 5)
0c68 : a9 9f __ LDA #$9f
0c6a : 8d dd 9f STA $9fdd ; (sstack + 6)
0c6d : 4c 70 0c JMP $0c70 ; (sformat.s4 + 0)
--------------------------------------------------------------------
sformat: ; sformat(u8*,const u8*,i16*,bool)->u8*
; 351, "/mnt/d/F256/oscar64/include/stdio.c"
.s4:
0c70 : ad da 9f LDA $9fda ; (sstack + 3)
0c73 : 85 4b __ STA T3 + 0 
0c75 : a9 00 __ LDA #$00
0c77 : 85 51 __ STA T6 + 0 
0c79 : ad db 9f LDA $9fdb ; (sstack + 4)
0c7c : 85 4c __ STA T3 + 1 
0c7e : ad d8 9f LDA $9fd8 ; (sstack + 1)
0c81 : 85 4d __ STA T4 + 0 
0c83 : ad d9 9f LDA $9fd9 ; (sstack + 2)
0c86 : 85 4e __ STA T4 + 1 
.l5:
0c88 : a0 00 __ LDY #$00
0c8a : b1 4b __ LDA (T3 + 0),y 
0c8c : d0 2c __ BNE $0cba ; (sformat.s10 + 0)
.s6:
0c8e : a4 51 __ LDY T6 + 0 
0c90 : 91 4d __ STA (T4 + 0),y 
0c92 : 98 __ __ TYA
0c93 : f0 1e __ BEQ $0cb3 ; (sformat.s95 + 0)
.s7:
0c95 : ad de 9f LDA $9fde ; (sstack + 7)
0c98 : d0 0e __ BNE $0ca8 ; (sformat.s9 + 0)
.s8:
0c9a : 98 __ __ TYA
0c9b : 18 __ __ CLC
0c9c : 65 4d __ ADC T4 + 0 
0c9e : aa __ __ TAX
0c9f : a5 4e __ LDA T4 + 1 
0ca1 : 69 00 __ ADC #$00
.s3:
0ca3 : 86 29 __ STX ACCU + 0 ; (buff + 1)
0ca5 : 85 2a __ STA ACCU + 1 ; (fmt + 0)
0ca7 : 60 __ __ RTS
.s9:
0ca8 : a5 4d __ LDA T4 + 0 
0caa : 85 1c __ STA P1 
0cac : a5 4e __ LDA T4 + 1 
0cae : 85 1d __ STA P2 
0cb0 : 20 b5 10 JSR $10b5 ; (puts.l4 + 0)
.s95:
0cb3 : a5 4e __ LDA T4 + 1 
0cb5 : a6 4d __ LDX T4 + 0 
0cb7 : 4c a3 0c JMP $0ca3 ; (sformat.s3 + 0)
.s10:
0cba : c9 25 __ CMP #$25
0cbc : f0 3e __ BEQ $0cfc ; (sformat.s15 + 0)
.s11:
0cbe : a4 51 __ LDY T6 + 0 
0cc0 : 91 4d __ STA (T4 + 0),y 
0cc2 : e6 4b __ INC T3 + 0 
0cc4 : d0 02 __ BNE $0cc8 ; (sformat.s119 + 0)
.s118:
0cc6 : e6 4c __ INC T3 + 1 
.s119:
0cc8 : c8 __ __ INY
0cc9 : 84 51 __ STY T6 + 0 
0ccb : 98 __ __ TYA
0ccc : c0 28 __ CPY #$28
0cce : 90 b8 __ BCC $0c88 ; (sformat.l5 + 0)
.s12:
0cd0 : 85 35 __ STA T0 + 0 
0cd2 : a9 00 __ LDA #$00
0cd4 : 85 51 __ STA T6 + 0 
0cd6 : ad de 9f LDA $9fde ; (sstack + 7)
0cd9 : f0 14 __ BEQ $0cef ; (sformat.s13 + 0)
.s14:
0cdb : a5 4d __ LDA T4 + 0 
0cdd : 85 1c __ STA P1 
0cdf : a5 4e __ LDA T4 + 1 
0ce1 : 85 1d __ STA P2 
0ce3 : a9 00 __ LDA #$00
0ce5 : a4 35 __ LDY T0 + 0 
0ce7 : 91 1c __ STA (P1),y 
0ce9 : 20 b5 10 JSR $10b5 ; (puts.l4 + 0)
0cec : 4c 88 0c JMP $0c88 ; (sformat.l5 + 0)
.s13:
0cef : 18 __ __ CLC
0cf0 : a5 4d __ LDA T4 + 0 
0cf2 : 65 35 __ ADC T0 + 0 
0cf4 : 85 4d __ STA T4 + 0 
0cf6 : 90 90 __ BCC $0c88 ; (sformat.l5 + 0)
.s120:
0cf8 : e6 4e __ INC T4 + 1 
0cfa : b0 8c __ BCS $0c88 ; (sformat.l5 + 0)
.s15:
0cfc : a5 51 __ LDA T6 + 0 
0cfe : f0 27 __ BEQ $0d27 ; (sformat.s16 + 0)
.s89:
0d00 : 84 51 __ STY T6 + 0 
0d02 : 85 35 __ STA T0 + 0 
0d04 : ad de 9f LDA $9fde ; (sstack + 7)
0d07 : f0 13 __ BEQ $0d1c ; (sformat.s90 + 0)
.s91:
0d09 : a5 4d __ LDA T4 + 0 
0d0b : 85 1c __ STA P1 
0d0d : a5 4e __ LDA T4 + 1 
0d0f : 85 1d __ STA P2 
0d11 : 98 __ __ TYA
0d12 : a4 35 __ LDY T0 + 0 
0d14 : 91 1c __ STA (P1),y 
0d16 : 20 b5 10 JSR $10b5 ; (puts.l4 + 0)
0d19 : 4c 27 0d JMP $0d27 ; (sformat.s16 + 0)
.s90:
0d1c : 18 __ __ CLC
0d1d : a5 4d __ LDA T4 + 0 
0d1f : 65 35 __ ADC T0 + 0 
0d21 : 85 4d __ STA T4 + 0 
0d23 : 90 02 __ BCC $0d27 ; (sformat.s16 + 0)
.s117:
0d25 : e6 4e __ INC T4 + 1 
.s16:
0d27 : a9 00 __ LDA #$00
0d29 : 8d c4 9f STA $9fc4 ; (si.sign + 0)
0d2c : 8d c5 9f STA $9fc5 ; (si.left + 0)
0d2f : 8d c6 9f STA $9fc6 ; (si.prefix + 0)
0d32 : a0 01 __ LDY #$01
0d34 : b1 4b __ LDA (T3 + 0),y 
0d36 : a2 20 __ LDX #$20
0d38 : 8e bf 9f STX $9fbf ; (si.fill + 0)
0d3b : a2 00 __ LDX #$00
0d3d : 8e c0 9f STX $9fc0 ; (si.width + 0)
0d40 : ca __ __ DEX
0d41 : 8e c1 9f STX $9fc1 ; (si.precision + 0)
0d44 : a2 0a __ LDX #$0a
0d46 : 8e c3 9f STX $9fc3 ; (si.base + 0)
0d49 : aa __ __ TAX
0d4a : a9 02 __ LDA #$02
0d4c : d0 07 __ BNE $0d55 ; (sformat.l17 + 0)
.s85:
0d4e : a0 00 __ LDY #$00
0d50 : b1 4b __ LDA (T3 + 0),y 
0d52 : aa __ __ TAX
0d53 : a9 01 __ LDA #$01
.l17:
0d55 : 18 __ __ CLC
0d56 : 65 4b __ ADC T3 + 0 
0d58 : 85 4b __ STA T3 + 0 
0d5a : 90 02 __ BCC $0d5e ; (sformat.s106 + 0)
.s105:
0d5c : e6 4c __ INC T3 + 1 
.s106:
0d5e : 8a __ __ TXA
0d5f : e0 2b __ CPX #$2b
0d61 : d0 07 __ BNE $0d6a ; (sformat.s18 + 0)
.s88:
0d63 : a9 01 __ LDA #$01
0d65 : 8d c4 9f STA $9fc4 ; (si.sign + 0)
0d68 : d0 e4 __ BNE $0d4e ; (sformat.s85 + 0)
.s18:
0d6a : c9 30 __ CMP #$30
0d6c : d0 06 __ BNE $0d74 ; (sformat.s19 + 0)
.s87:
0d6e : 8d bf 9f STA $9fbf ; (si.fill + 0)
0d71 : 4c 4e 0d JMP $0d4e ; (sformat.s85 + 0)
.s19:
0d74 : c9 23 __ CMP #$23
0d76 : d0 07 __ BNE $0d7f ; (sformat.s20 + 0)
.s86:
0d78 : a9 01 __ LDA #$01
0d7a : 8d c6 9f STA $9fc6 ; (si.prefix + 0)
0d7d : d0 cf __ BNE $0d4e ; (sformat.s85 + 0)
.s20:
0d7f : c9 2d __ CMP #$2d
0d81 : d0 07 __ BNE $0d8a ; (sformat.s21 + 0)
.s84:
0d83 : a9 01 __ LDA #$01
0d85 : 8d c5 9f STA $9fc5 ; (si.left + 0)
0d88 : d0 c4 __ BNE $0d4e ; (sformat.s85 + 0)
.s21:
0d8a : 85 39 __ STA T2 + 0 
0d8c : c9 30 __ CMP #$30
0d8e : 90 3c __ BCC $0dcc ; (sformat.s22 + 0)
.s80:
0d90 : c9 3a __ CMP #$3a
0d92 : b0 77 __ BCS $0e0b ; (sformat.s23 + 0)
.s81:
0d94 : a9 00 __ LDA #$00
0d96 : 85 49 __ STA T1 + 0 
.l82:
0d98 : a5 49 __ LDA T1 + 0 
0d9a : 0a __ __ ASL
0d9b : 85 29 __ STA ACCU + 0 ; (buff + 1)
0d9d : a9 00 __ LDA #$00
0d9f : 2a __ __ ROL
0da0 : 06 29 __ ASL ACCU + 0 ; (buff + 1)
0da2 : 2a __ __ ROL
0da3 : aa __ __ TAX
0da4 : a5 29 __ LDA ACCU + 0 ; (buff + 1)
0da6 : 65 49 __ ADC T1 + 0 
0da8 : 0a __ __ ASL
0da9 : 18 __ __ CLC
0daa : 65 39 __ ADC T2 + 0 
0dac : 38 __ __ SEC
0dad : e9 30 __ SBC #$30
0daf : 85 49 __ STA T1 + 0 
0db1 : a0 00 __ LDY #$00
0db3 : b1 4b __ LDA (T3 + 0),y 
0db5 : 85 39 __ STA T2 + 0 
0db7 : e6 4b __ INC T3 + 0 
0db9 : d0 02 __ BNE $0dbd ; (sformat.s116 + 0)
.s115:
0dbb : e6 4c __ INC T3 + 1 
.s116:
0dbd : c9 30 __ CMP #$30
0dbf : 90 04 __ BCC $0dc5 ; (sformat.s104 + 0)
.s83:
0dc1 : c9 3a __ CMP #$3a
0dc3 : 90 d3 __ BCC $0d98 ; (sformat.l82 + 0)
.s104:
0dc5 : 86 2a __ STX ACCU + 1 ; (fmt + 0)
0dc7 : a6 49 __ LDX T1 + 0 
0dc9 : 8e c0 9f STX $9fc0 ; (si.width + 0)
.s22:
0dcc : c9 2e __ CMP #$2e
0dce : d0 3b __ BNE $0e0b ; (sformat.s23 + 0)
.s76:
0dd0 : a9 00 __ LDA #$00
0dd2 : a6 2a __ LDX ACCU + 1 ; (fmt + 0)
0dd4 : 4c ee 0d JMP $0dee ; (sformat.l77 + 0)
.s79:
0dd7 : a5 35 __ LDA T0 + 0 
0dd9 : 0a __ __ ASL
0dda : 85 29 __ STA ACCU + 0 ; (buff + 1)
0ddc : 98 __ __ TYA
0ddd : 2a __ __ ROL
0dde : 06 29 __ ASL ACCU + 0 ; (buff + 1)
0de0 : 2a __ __ ROL
0de1 : aa __ __ TAX
0de2 : 18 __ __ CLC
0de3 : a5 29 __ LDA ACCU + 0 ; (buff + 1)
0de5 : 65 35 __ ADC T0 + 0 
0de7 : 0a __ __ ASL
0de8 : 18 __ __ CLC
0de9 : 65 39 __ ADC T2 + 0 
0deb : 38 __ __ SEC
0dec : e9 30 __ SBC #$30
.l77:
0dee : 85 35 __ STA T0 + 0 
0df0 : a0 00 __ LDY #$00
0df2 : b1 4b __ LDA (T3 + 0),y 
0df4 : 85 39 __ STA T2 + 0 
0df6 : e6 4b __ INC T3 + 0 
0df8 : d0 02 __ BNE $0dfc ; (sformat.s108 + 0)
.s107:
0dfa : e6 4c __ INC T3 + 1 
.s108:
0dfc : c9 30 __ CMP #$30
0dfe : 90 04 __ BCC $0e04 ; (sformat.s103 + 0)
.s78:
0e00 : c9 3a __ CMP #$3a
0e02 : 90 d3 __ BCC $0dd7 ; (sformat.s79 + 0)
.s103:
0e04 : 86 2a __ STX ACCU + 1 ; (fmt + 0)
0e06 : a6 35 __ LDX T0 + 0 
0e08 : 8e c1 9f STX $9fc1 ; (si.precision + 0)
.s23:
0e0b : c9 64 __ CMP #$64
0e0d : f0 0c __ BEQ $0e1b ; (sformat.s75 + 0)
.s24:
0e0f : c9 44 __ CMP #$44
0e11 : f0 08 __ BEQ $0e1b ; (sformat.s75 + 0)
.s25:
0e13 : c9 69 __ CMP #$69
0e15 : f0 04 __ BEQ $0e1b ; (sformat.s75 + 0)
.s26:
0e17 : c9 49 __ CMP #$49
0e19 : d0 07 __ BNE $0e22 ; (sformat.s27 + 0)
.s75:
0e1b : a9 01 __ LDA #$01
.s93:
0e1d : 85 21 __ STA P6 
0e1f : 4c 7b 10 JMP $107b ; (sformat.s73 + 0)
.s27:
0e22 : c9 75 __ CMP #$75
0e24 : f0 04 __ BEQ $0e2a ; (sformat.s74 + 0)
.s28:
0e26 : c9 55 __ CMP #$55
0e28 : d0 04 __ BNE $0e2e ; (sformat.s29 + 0)
.s74:
0e2a : a9 00 __ LDA #$00
0e2c : f0 ef __ BEQ $0e1d ; (sformat.s93 + 0)
.s29:
0e2e : c9 78 __ CMP #$78
0e30 : f0 04 __ BEQ $0e36 ; (sformat.s72 + 0)
.s30:
0e32 : c9 58 __ CMP #$58
0e34 : d0 15 __ BNE $0e4b ; (sformat.s31 + 0)
.s72:
0e36 : a5 39 __ LDA T2 + 0 
0e38 : 29 e0 __ AND #$e0
0e3a : 09 01 __ ORA #$01
0e3c : 8d c2 9f STA $9fc2 ; (si.cha + 0)
0e3f : a9 00 __ LDA #$00
0e41 : 85 21 __ STA P6 
0e43 : a9 10 __ LDA #$10
0e45 : 8d c3 9f STA $9fc3 ; (si.base + 0)
0e48 : 4c 7b 10 JMP $107b ; (sformat.s73 + 0)
.s31:
0e4b : c9 6c __ CMP #$6c
0e4d : d0 03 __ BNE $0e52 ; (sformat.s32 + 0)
0e4f : 4c ea 0f JMP $0fea ; (sformat.s60 + 0)
.s32:
0e52 : c9 4c __ CMP #$4c
0e54 : f0 f9 __ BEQ $0e4f ; (sformat.s31 + 4)
.s33:
0e56 : aa __ __ TAX
0e57 : c9 66 __ CMP #$66
0e59 : d0 03 __ BNE $0e5e ; (sformat.s34 + 0)
0e5b : 4c 7f 0f JMP $0f7f ; (sformat.s59 + 0)
.s34:
0e5e : c9 67 __ CMP #$67
0e60 : f0 f9 __ BEQ $0e5b ; (sformat.s33 + 5)
.s35:
0e62 : c9 65 __ CMP #$65
0e64 : f0 f5 __ BEQ $0e5b ; (sformat.s33 + 5)
.s36:
0e66 : c9 46 __ CMP #$46
0e68 : f0 f1 __ BEQ $0e5b ; (sformat.s33 + 5)
.s37:
0e6a : c9 47 __ CMP #$47
0e6c : f0 ed __ BEQ $0e5b ; (sformat.s33 + 5)
.s38:
0e6e : c9 45 __ CMP #$45
0e70 : f0 e9 __ BEQ $0e5b ; (sformat.s33 + 5)
.s39:
0e72 : c9 73 __ CMP #$73
0e74 : f0 3e __ BEQ $0eb4 ; (sformat.s47 + 0)
.s40:
0e76 : c9 53 __ CMP #$53
0e78 : f0 3a __ BEQ $0eb4 ; (sformat.s47 + 0)
.s41:
0e7a : c9 63 __ CMP #$63
0e7c : f0 15 __ BEQ $0e93 ; (sformat.s46 + 0)
.s42:
0e7e : c9 43 __ CMP #$43
0e80 : f0 11 __ BEQ $0e93 ; (sformat.s46 + 0)
.s43:
0e82 : aa __ __ TAX
0e83 : d0 03 __ BNE $0e88 ; (sformat.s44 + 0)
0e85 : 4c 88 0c JMP $0c88 ; (sformat.l5 + 0)
.s44:
0e88 : a0 00 __ LDY #$00
0e8a : 91 4d __ STA (T4 + 0),y 
.s45:
0e8c : a9 01 __ LDA #$01
.s96:
0e8e : 85 51 __ STA T6 + 0 
0e90 : 4c 88 0c JMP $0c88 ; (sformat.l5 + 0)
.s46:
0e93 : ad dc 9f LDA $9fdc ; (sstack + 5)
0e96 : 85 35 __ STA T0 + 0 
0e98 : ad dd 9f LDA $9fdd ; (sstack + 6)
0e9b : 85 36 __ STA T0 + 1 
0e9d : a0 00 __ LDY #$00
0e9f : b1 35 __ LDA (T0 + 0),y 
0ea1 : 91 4d __ STA (T4 + 0),y 
0ea3 : a5 35 __ LDA T0 + 0 
0ea5 : 69 01 __ ADC #$01
0ea7 : 8d dc 9f STA $9fdc ; (sstack + 5)
0eaa : a5 36 __ LDA T0 + 1 
0eac : 69 00 __ ADC #$00
0eae : 8d dd 9f STA $9fdd ; (sstack + 6)
0eb1 : 4c 8c 0e JMP $0e8c ; (sformat.s45 + 0)
.s47:
0eb4 : ad dc 9f LDA $9fdc ; (sstack + 5)
0eb7 : 85 35 __ STA T0 + 0 
0eb9 : 69 01 __ ADC #$01
0ebb : 8d dc 9f STA $9fdc ; (sstack + 5)
0ebe : ad dd 9f LDA $9fdd ; (sstack + 6)
0ec1 : 85 36 __ STA T0 + 1 
0ec3 : 69 00 __ ADC #$00
0ec5 : 8d dd 9f STA $9fdd ; (sstack + 6)
0ec8 : a0 00 __ LDY #$00
0eca : 84 52 __ STY T7 + 0 
0ecc : b1 35 __ LDA (T0 + 0),y 
0ece : 85 29 __ STA ACCU + 0 ; (buff + 1)
0ed0 : 85 49 __ STA T1 + 0 
0ed2 : c8 __ __ INY
0ed3 : b1 35 __ LDA (T0 + 0),y 
0ed5 : 85 2a __ STA ACCU + 1 ; (fmt + 0)
0ed7 : 85 4a __ STA T1 + 1 
0ed9 : ad c0 9f LDA $9fc0 ; (si.width + 0)
0edc : f0 0c __ BEQ $0eea ; (sformat.s48 + 0)
.s100:
0ede : 88 __ __ DEY
0edf : b1 29 __ LDA (ACCU + 0),y ; (buff + 1)
0ee1 : f0 05 __ BEQ $0ee8 ; (sformat.s101 + 0)
.l58:
0ee3 : c8 __ __ INY
0ee4 : b1 29 __ LDA (ACCU + 0),y ; (buff + 1)
0ee6 : d0 fb __ BNE $0ee3 ; (sformat.l58 + 0)
.s101:
0ee8 : 84 52 __ STY T7 + 0 
.s48:
0eea : ad c5 9f LDA $9fc5 ; (si.left + 0)
0eed : 85 4f __ STA T5 + 0 
0eef : d0 19 __ BNE $0f0a ; (sformat.s49 + 0)
.s98:
0ef1 : a6 52 __ LDX T7 + 0 
0ef3 : ec c0 9f CPX $9fc0 ; (si.width + 0)
0ef6 : a0 00 __ LDY #$00
0ef8 : b0 0c __ BCS $0f06 ; (sformat.s99 + 0)
.l57:
0efa : ad bf 9f LDA $9fbf ; (si.fill + 0)
0efd : 91 4d __ STA (T4 + 0),y 
0eff : c8 __ __ INY
0f00 : e8 __ __ INX
0f01 : ec c0 9f CPX $9fc0 ; (si.width + 0)
0f04 : 90 f4 __ BCC $0efa ; (sformat.l57 + 0)
.s99:
0f06 : 86 52 __ STX T7 + 0 
0f08 : 84 51 __ STY T6 + 0 
.s49:
0f0a : ac de 9f LDY $9fde ; (sstack + 7)
0f0d : d0 48 __ BNE $0f57 ; (sformat.s54 + 0)
.s50:
0f0f : b1 29 __ LDA (ACCU + 0),y ; (buff + 1)
0f11 : f0 23 __ BEQ $0f36 ; (sformat.s51 + 0)
.s53:
0f13 : 18 __ __ CLC
0f14 : a5 29 __ LDA ACCU + 0 ; (buff + 1)
0f16 : 69 01 __ ADC #$01
0f18 : 85 35 __ STA T0 + 0 
0f1a : a5 2a __ LDA ACCU + 1 ; (fmt + 0)
0f1c : 69 00 __ ADC #$00
0f1e : 85 36 __ STA T0 + 1 
0f20 : b1 29 __ LDA (ACCU + 0),y ; (buff + 1)
.l92:
0f22 : a4 51 __ LDY T6 + 0 
0f24 : 91 4d __ STA (T4 + 0),y 
0f26 : e6 51 __ INC T6 + 0 
0f28 : a0 00 __ LDY #$00
0f2a : b1 35 __ LDA (T0 + 0),y 
0f2c : a8 __ __ TAY
0f2d : e6 35 __ INC T0 + 0 
0f2f : d0 02 __ BNE $0f33 ; (sformat.s114 + 0)
.s113:
0f31 : e6 36 __ INC T0 + 1 
.s114:
0f33 : 98 __ __ TYA
0f34 : d0 ec __ BNE $0f22 ; (sformat.l92 + 0)
.s51:
0f36 : a5 4f __ LDA T5 + 0 
0f38 : d0 03 __ BNE $0f3d ; (sformat.s97 + 0)
0f3a : 4c 88 0c JMP $0c88 ; (sformat.l5 + 0)
.s97:
0f3d : a6 52 __ LDX T7 + 0 
0f3f : ec c0 9f CPX $9fc0 ; (si.width + 0)
0f42 : a4 51 __ LDY T6 + 0 
0f44 : b0 0c __ BCS $0f52 ; (sformat.s102 + 0)
.l52:
0f46 : ad bf 9f LDA $9fbf ; (si.fill + 0)
0f49 : 91 4d __ STA (T4 + 0),y 
0f4b : c8 __ __ INY
0f4c : e8 __ __ INX
0f4d : ec c0 9f CPX $9fc0 ; (si.width + 0)
0f50 : 90 f4 __ BCC $0f46 ; (sformat.l52 + 0)
.s102:
0f52 : 84 51 __ STY T6 + 0 
0f54 : 4c 88 0c JMP $0c88 ; (sformat.l5 + 0)
.s54:
0f57 : a4 51 __ LDY T6 + 0 
0f59 : f0 11 __ BEQ $0f6c ; (sformat.s55 + 0)
.s56:
0f5b : a5 4d __ LDA T4 + 0 
0f5d : 85 1c __ STA P1 
0f5f : a5 4e __ LDA T4 + 1 
0f61 : 85 1d __ STA P2 
0f63 : a9 00 __ LDA #$00
0f65 : 85 51 __ STA T6 + 0 
0f67 : 91 1c __ STA (P1),y 
0f69 : 20 b5 10 JSR $10b5 ; (puts.l4 + 0)
.s55:
0f6c : a5 49 __ LDA T1 + 0 
0f6e : 85 1c __ STA P1 
0f70 : a5 4a __ LDA T1 + 1 
0f72 : 85 1d __ STA P2 
0f74 : 20 b5 10 JSR $10b5 ; (puts.l4 + 0)
0f77 : ad c5 9f LDA $9fc5 ; (si.left + 0)
0f7a : d0 c1 __ BNE $0f3d ; (sformat.s97 + 0)
0f7c : 4c 88 0c JMP $0c88 ; (sformat.l5 + 0)
.s59:
0f7f : a5 4d __ LDA T4 + 0 
0f81 : 85 21 __ STA P6 
0f83 : a5 4e __ LDA T4 + 1 
0f85 : 85 22 __ STA P7 
0f87 : 8a __ __ TXA
0f88 : 29 e0 __ AND #$e0
0f8a : 09 01 __ ORA #$01
0f8c : 85 39 __ STA T2 + 0 
0f8e : 8d c2 9f STA $9fc2 ; (si.cha + 0)
0f91 : a9 bf __ LDA #$bf
0f93 : 85 1f __ STA P4 
0f95 : a9 9f __ LDA #$9f
0f97 : 85 20 __ STA P5 
0f99 : ad dc 9f LDA $9fdc ; (sstack + 5)
0f9c : 85 4f __ STA T5 + 0 
0f9e : ad dd 9f LDA $9fdd ; (sstack + 6)
0fa1 : 85 50 __ STA T5 + 1 
0fa3 : a0 00 __ LDY #$00
0fa5 : 84 3a __ STY T2 + 1 
0fa7 : b1 4f __ LDA (T5 + 0),y 
0fa9 : 85 23 __ STA P8 
0fab : c8 __ __ INY
0fac : b1 4f __ LDA (T5 + 0),y 
0fae : 85 24 __ STA P9 
0fb0 : c8 __ __ INY
0fb1 : b1 4f __ LDA (T5 + 0),y 
0fb3 : 85 25 __ STA P10 
0fb5 : c8 __ __ INY
0fb6 : b1 4f __ LDA (T5 + 0),y 
0fb8 : 85 26 __ STA P11 
0fba : 8a __ __ TXA
0fbb : e5 39 __ SBC T2 + 0 
0fbd : aa __ __ TAX
0fbe : a9 00 __ LDA #$00
0fc0 : e9 00 __ SBC #$00
0fc2 : a8 __ __ TAY
0fc3 : 8a __ __ TXA
0fc4 : 18 __ __ CLC
0fc5 : 69 61 __ ADC #$61
0fc7 : 85 35 __ STA T0 + 0 
0fc9 : 8d d7 9f STA $9fd7 ; (sstack + 0)
0fcc : 90 01 __ BCC $0fcf ; (sformat.s112 + 0)
.s111:
0fce : c8 __ __ INY
.s112:
0fcf : 84 36 __ STY T0 + 1 
0fd1 : 20 4f 15 JSR $154f ; (nformf.s4 + 0)
0fd4 : a5 29 __ LDA ACCU + 0 ; (buff + 1)
0fd6 : 85 51 __ STA T6 + 0 
0fd8 : 18 __ __ CLC
0fd9 : a5 4f __ LDA T5 + 0 
0fdb : 69 04 __ ADC #$04
0fdd : 8d dc 9f STA $9fdc ; (sstack + 5)
0fe0 : a5 50 __ LDA T5 + 1 
0fe2 : 69 00 __ ADC #$00
0fe4 : 8d dd 9f STA $9fdd ; (sstack + 6)
0fe7 : 4c 88 0c JMP $0c88 ; (sformat.l5 + 0)
.s60:
0fea : ad dc 9f LDA $9fdc ; (sstack + 5)
0fed : 85 35 __ STA T0 + 0 
0fef : 69 03 __ ADC #$03
0ff1 : 8d dc 9f STA $9fdc ; (sstack + 5)
0ff4 : ad dd 9f LDA $9fdd ; (sstack + 6)
0ff7 : 85 36 __ STA T0 + 1 
0ff9 : 69 00 __ ADC #$00
0ffb : 8d dd 9f STA $9fdd ; (sstack + 6)
0ffe : a0 00 __ LDY #$00
1000 : b1 4b __ LDA (T3 + 0),y 
1002 : aa __ __ TAX
1003 : e6 4b __ INC T3 + 0 
1005 : d0 02 __ BNE $1009 ; (sformat.s110 + 0)
.s109:
1007 : e6 4c __ INC T3 + 1 
.s110:
1009 : b1 35 __ LDA (T0 + 0),y 
100b : 85 29 __ STA ACCU + 0 ; (buff + 1)
100d : 85 1f __ STA P4 
100f : a0 01 __ LDY #$01
1011 : b1 35 __ LDA (T0 + 0),y 
1013 : 85 2a __ STA ACCU + 1 ; (fmt + 0)
1015 : 85 20 __ STA P5 
1017 : c8 __ __ INY
1018 : b1 35 __ LDA (T0 + 0),y 
101a : 85 2b __ STA ACCU + 2 ; (fmt + 1)
101c : 85 21 __ STA P6 
101e : 85 37 __ STA T0 + 2 
1020 : c8 __ __ INY
1021 : b1 35 __ LDA (T0 + 0),y 
1023 : 85 22 __ STA P7 
1025 : 85 38 __ STA T0 + 3 
1027 : e0 64 __ CPX #$64
1029 : f0 0c __ BEQ $1037 ; (sformat.s71 + 0)
.s61:
102b : e0 44 __ CPX #$44
102d : f0 08 __ BEQ $1037 ; (sformat.s71 + 0)
.s62:
102f : e0 69 __ CPX #$69
1031 : f0 04 __ BEQ $1037 ; (sformat.s71 + 0)
.s63:
1033 : e0 49 __ CPX #$49
1035 : d0 1a __ BNE $1051 ; (sformat.s64 + 0)
.s71:
1037 : a9 01 __ LDA #$01
.s94:
1039 : 85 23 __ STA P8 
.s69:
103b : a5 4d __ LDA T4 + 0 
103d : 85 1d __ STA P2 
103f : a5 4e __ LDA T4 + 1 
1041 : 85 1e __ STA P3 
1043 : a9 bf __ LDA #$bf
1045 : 85 1b __ STA P0 
1047 : a9 9f __ LDA #$9f
1049 : 85 1c __ STA P1 
104b : 20 03 14 JSR $1403 ; (nforml.s4 + 0)
104e : 4c 8e 0e JMP $0e8e ; (sformat.s96 + 0)
.s64:
1051 : e0 75 __ CPX #$75
1053 : f0 04 __ BEQ $1059 ; (sformat.s70 + 0)
.s65:
1055 : e0 55 __ CPX #$55
1057 : d0 04 __ BNE $105d ; (sformat.s66 + 0)
.s70:
1059 : a9 00 __ LDA #$00
105b : f0 dc __ BEQ $1039 ; (sformat.s94 + 0)
.s66:
105d : e0 78 __ CPX #$78
105f : f0 06 __ BEQ $1067 ; (sformat.s68 + 0)
.s67:
1061 : 85 2c __ STA ACCU + 3 ; (fps + 0)
1063 : e0 58 __ CPX #$58
1065 : d0 80 __ BNE $0fe7 ; (sformat.s112 + 24)
.s68:
1067 : a9 00 __ LDA #$00
1069 : 85 23 __ STA P8 
106b : a9 10 __ LDA #$10
106d : 8d c3 9f STA $9fc3 ; (si.base + 0)
1070 : 8a __ __ TXA
1071 : 29 e0 __ AND #$e0
1073 : 09 01 __ ORA #$01
1075 : 8d c2 9f STA $9fc2 ; (si.cha + 0)
1078 : 4c 3b 10 JMP $103b ; (sformat.s69 + 0)
.s73:
107b : a5 4d __ LDA T4 + 0 
107d : 85 1d __ STA P2 
107f : a5 4e __ LDA T4 + 1 
1081 : 85 1e __ STA P3 
1083 : ad dc 9f LDA $9fdc ; (sstack + 5)
1086 : 85 35 __ STA T0 + 0 
1088 : ad dd 9f LDA $9fdd ; (sstack + 6)
108b : 85 36 __ STA T0 + 1 
108d : a0 00 __ LDY #$00
108f : b1 35 __ LDA (T0 + 0),y 
1091 : 85 1f __ STA P4 
1093 : c8 __ __ INY
1094 : b1 35 __ LDA (T0 + 0),y 
1096 : 85 20 __ STA P5 
1098 : 18 __ __ CLC
1099 : a5 35 __ LDA T0 + 0 
109b : 69 02 __ ADC #$02
109d : 8d dc 9f STA $9fdc ; (sstack + 5)
10a0 : a5 36 __ LDA T0 + 1 
10a2 : 69 00 __ ADC #$00
10a4 : 8d dd 9f STA $9fdd ; (sstack + 6)
10a7 : a9 bf __ LDA #$bf
10a9 : 85 1b __ STA P0 
10ab : a9 9f __ LDA #$9f
10ad : 85 1c __ STA P1 
10af : 20 e8 12 JSR $12e8 ; (nformi.s4 + 0)
10b2 : 4c 8e 0e JMP $0e8e ; (sformat.s96 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
;  12, "/mnt/d/F256/oscar64/include/stdio.h"
.l4:
10b5 : a0 00 __ LDY #$00
10b7 : b1 1c __ LDA (P1),y ; (str + 0)
10b9 : d0 01 __ BNE $10bc ; (puts.s5 + 0)
.s3:
10bb : 60 __ __ RTS
.s5:
10bc : 85 1b __ STA P0 
10be : e6 1c __ INC P1 ; (str + 0)
10c0 : d0 02 __ BNE $10c4 ; (puts.s7 + 0)
.s6:
10c2 : e6 1d __ INC P2 ; (str + 1)
.s7:
10c4 : 20 ca 10 JSR $10ca ; (putpch.s4 + 0)
10c7 : 4c b5 10 JMP $10b5 ; (puts.l4 + 0)
--------------------------------------------------------------------
putpch: ; putpch(u8)->void
;  69, "/mnt/d/F256/oscar64/include/conio.h"
.s4:
10ca : a5 1b __ LDA P0 ; (c + 0)
10cc : c9 0a __ CMP #$0a
10ce : d0 03 __ BNE $10d3 ; (putpch.s5 + 0)
10d0 : 4c 53 12 JMP $1253 ; (putpch.s20 + 0)
.s5:
10d3 : c9 0d __ CMP #$0d
10d5 : f0 f9 __ BEQ $10d0 ; (putpch.s4 + 6)
.s6:
10d7 : c9 09 __ CMP #$09
10d9 : d0 0d __ BNE $10e8 ; (putpch.s7 + 0)
.s13:
10db : ad 14 d0 LDA $d014 
10de : 29 03 __ AND #$03
10e0 : 85 3b __ STA T3 + 0 
10e2 : ad 15 d0 LDA $d015 
10e5 : 4c 98 11 JMP $1198 ; (putpch.l14 + 0)
.s7:
10e8 : a5 01 __ LDA $01 
10ea : 85 3c __ STA T5 + 0 
10ec : a9 00 __ LDA #$00
10ee : 85 01 __ STA $01 
10f0 : ad 14 d0 LDA $d014 
10f3 : 85 35 __ STA T0 + 0 
10f5 : ad 15 d0 LDA $d015 
10f8 : 85 36 __ STA T0 + 1 
10fa : ad 16 d0 LDA $d016 
10fd : 85 37 __ STA T1 + 0 
10ff : 0a __ __ ASL
1100 : 85 29 __ STA ACCU + 0 
1102 : ad 17 d0 LDA $d017 
1105 : 85 38 __ STA T1 + 1 
1107 : 2a __ __ ROL
1108 : 06 29 __ ASL ACCU + 0 
110a : 2a __ __ ROL
110b : aa __ __ TAX
110c : a9 03 __ LDA #$03
110e : 85 01 __ STA $01 
1110 : 18 __ __ CLC
1111 : a5 29 __ LDA ACCU + 0 
1113 : 65 37 __ ADC T1 + 0 
1115 : 85 39 __ STA T2 + 0 
1117 : 8a __ __ TXA
1118 : 65 38 __ ADC T1 + 1 
111a : 06 39 __ ASL T2 + 0 
111c : 2a __ __ ROL
111d : 06 39 __ ASL T2 + 0 
111f : 2a __ __ ROL
1120 : 06 39 __ ASL T2 + 0 
1122 : 2a __ __ ROL
1123 : 06 39 __ ASL T2 + 0 
1125 : 2a __ __ ROL
1126 : aa __ __ TAX
1127 : 18 __ __ CLC
1128 : a5 39 __ LDA T2 + 0 
112a : 65 35 __ ADC T0 + 0 
112c : 85 39 __ STA T2 + 0 
112e : 8a __ __ TXA
112f : 65 36 __ ADC T0 + 1 
1131 : 18 __ __ CLC
1132 : 69 c0 __ ADC #$c0
1134 : 85 3a __ STA T2 + 1 
1136 : ad a0 4c LDA $4ca0 ; (f256k_color + 0)
1139 : a0 00 __ LDY #$00
113b : 91 39 __ STA (T2 + 0),y 
113d : a9 02 __ LDA #$02
113f : 85 01 __ STA $01 
1141 : a5 1b __ LDA P0 ; (c + 0)
1143 : 91 39 __ STA (T2 + 0),y 
1145 : 18 __ __ CLC
1146 : a5 35 __ LDA T0 + 0 
1148 : 69 01 __ ADC #$01
114a : 85 35 __ STA T0 + 0 
114c : a5 36 __ LDA T0 + 1 
114e : 69 00 __ ADC #$00
1150 : d0 0c __ BNE $115e ; (putpch.s9 + 0)
.s12:
1152 : a5 37 __ LDA T1 + 0 
1154 : 85 39 __ STA T2 + 0 
1156 : a5 35 __ LDA T0 + 0 
1158 : c9 50 __ CMP #$50
115a : a6 38 __ LDX T1 + 1 
115c : 90 1f __ BCC $117d ; (putpch.s8 + 0)
.s9:
115e : 84 35 __ STY T0 + 0 
1160 : 18 __ __ CLC
1161 : a5 37 __ LDA T1 + 0 
1163 : 69 01 __ ADC #$01
1165 : 85 39 __ STA T2 + 0 
1167 : a5 38 __ LDA T1 + 1 
1169 : 69 00 __ ADC #$00
116b : d0 07 __ BNE $1174 ; (putpch.s10 + 0)
.s11:
116d : aa __ __ TAX
116e : a5 39 __ LDA T2 + 0 
1170 : c9 1e __ CMP #$1e
1172 : 90 09 __ BCC $117d ; (putpch.s8 + 0)
.s10:
1174 : 20 84 12 JSR $1284 ; (f256k_scroll.s4 + 0)
1177 : a9 1d __ LDA #$1d
1179 : 85 39 __ STA T2 + 0 
117b : a2 00 __ LDX #$00
.s8:
117d : a9 00 __ LDA #$00
117f : 85 01 __ STA $01 
1181 : a5 35 __ LDA T0 + 0 
1183 : 8d 14 d0 STA $d014 
1186 : a9 00 __ LDA #$00
1188 : 8d 15 d0 STA $d015 
118b : a5 39 __ LDA T2 + 0 
118d : 8d 16 d0 STA $d016 
1190 : 8e 17 d0 STX $d017 
1193 : a5 3c __ LDA T5 + 0 
.s24:
1195 : 85 01 __ STA $01 
.s3:
1197 : 60 __ __ RTS
.l14:
1198 : a5 01 __ LDA $01 
119a : 85 3c __ STA T5 + 0 
119c : a9 00 __ LDA #$00
119e : 85 01 __ STA $01 
11a0 : ad 14 d0 LDA $d014 
11a3 : 85 35 __ STA T0 + 0 
11a5 : ad 15 d0 LDA $d015 
11a8 : 85 36 __ STA T0 + 1 
11aa : ad 16 d0 LDA $d016 
11ad : 85 37 __ STA T1 + 0 
11af : 0a __ __ ASL
11b0 : 85 29 __ STA ACCU + 0 
11b2 : ad 17 d0 LDA $d017 
11b5 : 85 38 __ STA T1 + 1 
11b7 : 2a __ __ ROL
11b8 : 06 29 __ ASL ACCU + 0 
11ba : 2a __ __ ROL
11bb : aa __ __ TAX
11bc : a9 03 __ LDA #$03
11be : 85 01 __ STA $01 
11c0 : 18 __ __ CLC
11c1 : a5 29 __ LDA ACCU + 0 
11c3 : 65 37 __ ADC T1 + 0 
11c5 : 85 39 __ STA T2 + 0 
11c7 : 8a __ __ TXA
11c8 : 65 38 __ ADC T1 + 1 
11ca : 06 39 __ ASL T2 + 0 
11cc : 2a __ __ ROL
11cd : 06 39 __ ASL T2 + 0 
11cf : 2a __ __ ROL
11d0 : 06 39 __ ASL T2 + 0 
11d2 : 2a __ __ ROL
11d3 : 06 39 __ ASL T2 + 0 
11d5 : 2a __ __ ROL
11d6 : aa __ __ TAX
11d7 : 18 __ __ CLC
11d8 : a5 39 __ LDA T2 + 0 
11da : 65 35 __ ADC T0 + 0 
11dc : 85 39 __ STA T2 + 0 
11de : 8a __ __ TXA
11df : 65 36 __ ADC T0 + 1 
11e1 : 18 __ __ CLC
11e2 : 69 c0 __ ADC #$c0
11e4 : 85 3a __ STA T2 + 1 
11e6 : ad a0 4c LDA $4ca0 ; (f256k_color + 0)
11e9 : a0 00 __ LDY #$00
11eb : 91 39 __ STA (T2 + 0),y 
11ed : a9 02 __ LDA #$02
11ef : 85 01 __ STA $01 
11f1 : a9 20 __ LDA #$20
11f3 : 91 39 __ STA (T2 + 0),y 
11f5 : 18 __ __ CLC
11f6 : a5 35 __ LDA T0 + 0 
11f8 : 69 01 __ ADC #$01
11fa : 85 35 __ STA T0 + 0 
11fc : a5 36 __ LDA T0 + 1 
11fe : 69 00 __ ADC #$00
1200 : d0 0c __ BNE $120e ; (putpch.s16 + 0)
.s19:
1202 : a5 37 __ LDA T1 + 0 
1204 : 85 39 __ STA T2 + 0 
1206 : a5 35 __ LDA T0 + 0 
1208 : c9 50 __ CMP #$50
120a : a6 38 __ LDX T1 + 1 
120c : 90 1f __ BCC $122d ; (putpch.s15 + 0)
.s16:
120e : 84 35 __ STY T0 + 0 
1210 : 18 __ __ CLC
1211 : a5 37 __ LDA T1 + 0 
1213 : 69 01 __ ADC #$01
1215 : 85 39 __ STA T2 + 0 
1217 : a5 38 __ LDA T1 + 1 
1219 : 69 00 __ ADC #$00
121b : d0 07 __ BNE $1224 ; (putpch.s17 + 0)
.s18:
121d : aa __ __ TAX
121e : a5 39 __ LDA T2 + 0 
1220 : c9 1e __ CMP #$1e
1222 : 90 09 __ BCC $122d ; (putpch.s15 + 0)
.s17:
1224 : 20 84 12 JSR $1284 ; (f256k_scroll.s4 + 0)
1227 : a9 1d __ LDA #$1d
1229 : 85 39 __ STA T2 + 0 
122b : a2 00 __ LDX #$00
.s15:
122d : a9 00 __ LDA #$00
122f : 85 01 __ STA $01 
1231 : a5 35 __ LDA T0 + 0 
1233 : 8d 14 d0 STA $d014 
1236 : a9 00 __ LDA #$00
1238 : 8d 15 d0 STA $d015 
123b : a5 39 __ LDA T2 + 0 
123d : 8d 16 d0 STA $d016 
1240 : 8e 17 d0 STX $d017 
1243 : a5 3c __ LDA T5 + 0 
1245 : 85 01 __ STA $01 
1247 : e6 3b __ INC T3 + 0 
1249 : a5 3b __ LDA T3 + 0 
124b : c9 04 __ CMP #$04
124d : b0 03 __ BCS $1252 ; (putpch.s15 + 37)
124f : 4c 98 11 JMP $1198 ; (putpch.l14 + 0)
1252 : 60 __ __ RTS
.s20:
1253 : a5 01 __ LDA $01 
1255 : 85 39 __ STA T2 + 0 
1257 : a9 00 __ LDA #$00
1259 : 85 01 __ STA $01 
125b : ad 16 d0 LDA $d016 
125e : 69 00 __ ADC #$00
1260 : aa __ __ TAX
1261 : ad 17 d0 LDA $d017 
1264 : 69 00 __ ADC #$00
1266 : d0 04 __ BNE $126c ; (putpch.s22 + 0)
.s23:
1268 : e0 1e __ CPX #$1e
126a : 90 05 __ BCC $1271 ; (putpch.s21 + 0)
.s22:
126c : 20 84 12 JSR $1284 ; (f256k_scroll.s4 + 0)
126f : a2 1d __ LDX #$1d
.s21:
1271 : a9 00 __ LDA #$00
1273 : 8d 14 d0 STA $d014 
1276 : 8d 15 d0 STA $d015 
1279 : 8e 16 d0 STX $d016 
127c : 8d 17 d0 STA $d017 
127f : a5 39 __ LDA T2 + 0 
1281 : 85 01 __ STA $01 
1283 : 60 __ __ RTS
--------------------------------------------------------------------
f256k_scroll: ; f256k_scroll()->void
; 219, "/mnt/d/F256/oscar64/include/conio.c"
.s4:
1284 : a9 02 __ LDA #$02
1286 : 85 01 __ STA $01 
1288 : a9 00 __ LDA #$00
128a : 85 29 __ STA ACCU + 0 
128c : a9 c0 __ LDA #$c0
128e : 85 2a __ STA ACCU + 1 
.l5:
1290 : a0 50 __ LDY #$50
1292 : b1 29 __ LDA (ACCU + 0),y 
1294 : a0 00 __ LDY #$00
1296 : 91 29 __ STA (ACCU + 0),y 
1298 : e6 29 __ INC ACCU + 0 
129a : d0 02 __ BNE $129e ; (f256k_scroll.s16 + 0)
.s15:
129c : e6 2a __ INC ACCU + 1 
.s16:
129e : a5 29 __ LDA ACCU + 0 
12a0 : c9 10 __ CMP #$10
12a2 : d0 ec __ BNE $1290 ; (f256k_scroll.l5 + 0)
.s12:
12a4 : a5 2a __ LDA ACCU + 1 
12a6 : c9 c9 __ CMP #$c9
12a8 : d0 e6 __ BNE $1290 ; (f256k_scroll.l5 + 0)
.s6:
12aa : a9 20 __ LDA #$20
12ac : a2 50 __ LDX #$50
.l7:
12ae : ca __ __ DEX
12af : 9d 10 c9 STA $c910,x 
12b2 : d0 fa __ BNE $12ae ; (f256k_scroll.l7 + 0)
.s8:
12b4 : 84 29 __ STY ACCU + 0 
12b6 : a9 03 __ LDA #$03
12b8 : 85 01 __ STA $01 
12ba : a9 c0 __ LDA #$c0
12bc : 85 2a __ STA ACCU + 1 
.l9:
12be : a0 50 __ LDY #$50
12c0 : b1 29 __ LDA (ACCU + 0),y 
12c2 : a0 00 __ LDY #$00
12c4 : 91 29 __ STA (ACCU + 0),y 
12c6 : e6 29 __ INC ACCU + 0 
12c8 : d0 02 __ BNE $12cc ; (f256k_scroll.s18 + 0)
.s17:
12ca : e6 2a __ INC ACCU + 1 
.s18:
12cc : a5 29 __ LDA ACCU + 0 
12ce : c9 10 __ CMP #$10
12d0 : d0 ec __ BNE $12be ; (f256k_scroll.l9 + 0)
.s11:
12d2 : a5 2a __ LDA ACCU + 1 
12d4 : c9 c9 __ CMP #$c9
12d6 : d0 e6 __ BNE $12be ; (f256k_scroll.l9 + 0)
.s10:
12d8 : ad a0 4c LDA $4ca0 ; (f256k_color + 0)
12db : a2 10 __ LDX #$10
.l13:
12dd : 8d 10 c9 STA $c910 
12e0 : e8 __ __ INX
12e1 : e0 60 __ CPX #$60
12e3 : d0 f8 __ BNE $12dd ; (f256k_scroll.l13 + 0)
.s14:
12e5 : 84 01 __ STY $01 
.s3:
12e7 : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->u8
;  79, "/mnt/d/F256/oscar64/include/stdio.c"
.s4:
12e8 : a9 00 __ LDA #$00
12ea : 85 35 __ STA T5 + 0 
12ec : a0 04 __ LDY #$04
12ee : b1 1b __ LDA (P0),y ; (si + 0)
12f0 : 85 36 __ STA T6 + 0 
12f2 : a5 21 __ LDA P6 ; (s + 0)
12f4 : f0 13 __ BEQ $1309 ; (nformi.s5 + 0)
.s33:
12f6 : 24 20 __ BIT P5 ; (v + 1)
12f8 : 10 0f __ BPL $1309 ; (nformi.s5 + 0)
.s34:
12fa : 38 __ __ SEC
12fb : a9 00 __ LDA #$00
12fd : e5 1f __ SBC P4 ; (v + 0)
12ff : 85 1f __ STA P4 ; (v + 0)
1301 : a9 00 __ LDA #$00
1303 : e5 20 __ SBC P5 ; (v + 1)
1305 : 85 20 __ STA P5 ; (v + 1)
1307 : e6 35 __ INC T5 + 0 
.s5:
1309 : a9 10 __ LDA #$10
130b : 85 37 __ STA T7 + 0 
130d : a5 1f __ LDA P4 ; (v + 0)
130f : 05 20 __ ORA P5 ; (v + 1)
1311 : f0 33 __ BEQ $1346 ; (nformi.s6 + 0)
.s28:
1313 : a5 1f __ LDA P4 ; (v + 0)
1315 : 85 29 __ STA ACCU + 0 
1317 : a5 20 __ LDA P5 ; (v + 1)
1319 : 85 2a __ STA ACCU + 1 
.l29:
131b : a5 36 __ LDA T6 + 0 
131d : 85 11 __ STA WORK + 0 
131f : a9 00 __ LDA #$00
1321 : 85 12 __ STA WORK + 1 
1323 : 20 a3 48 JSR $48a3 ; (divmod + 0)
1326 : a5 13 __ LDA WORK + 2 
1328 : c9 0a __ CMP #$0a
132a : b0 04 __ BCS $1330 ; (nformi.s32 + 0)
.s30:
132c : a9 30 __ LDA #$30
132e : 90 06 __ BCC $1336 ; (nformi.s31 + 0)
.s32:
1330 : a0 03 __ LDY #$03
1332 : b1 1b __ LDA (P0),y ; (si + 0)
1334 : e9 0a __ SBC #$0a
.s31:
1336 : 18 __ __ CLC
1337 : 65 13 __ ADC WORK + 2 
1339 : a6 37 __ LDX T7 + 0 
133b : 9d c6 9f STA $9fc6,x ; (buffer[0] + 238)
133e : c6 37 __ DEC T7 + 0 
1340 : a5 29 __ LDA ACCU + 0 
1342 : 05 2a __ ORA ACCU + 1 
1344 : d0 d5 __ BNE $131b ; (nformi.l29 + 0)
.s6:
1346 : a0 02 __ LDY #$02
1348 : b1 1b __ LDA (P0),y ; (si + 0)
134a : c9 ff __ CMP #$ff
134c : d0 04 __ BNE $1352 ; (nformi.s27 + 0)
.s7:
134e : a9 0f __ LDA #$0f
1350 : d0 05 __ BNE $1357 ; (nformi.s39 + 0)
.s27:
1352 : 38 __ __ SEC
1353 : a9 10 __ LDA #$10
1355 : f1 1b __ SBC (P0),y ; (si + 0)
.s39:
1357 : a8 __ __ TAY
1358 : c4 37 __ CPY T7 + 0 
135a : b0 0d __ BCS $1369 ; (nformi.s8 + 0)
.s26:
135c : a9 30 __ LDA #$30
.l40:
135e : a6 37 __ LDX T7 + 0 
1360 : 9d c6 9f STA $9fc6,x ; (buffer[0] + 238)
1363 : c6 37 __ DEC T7 + 0 
1365 : c4 37 __ CPY T7 + 0 
1367 : 90 f5 __ BCC $135e ; (nformi.l40 + 0)
.s8:
1369 : a0 07 __ LDY #$07
136b : b1 1b __ LDA (P0),y ; (si + 0)
136d : f0 1c __ BEQ $138b ; (nformi.s9 + 0)
.s24:
136f : a5 36 __ LDA T6 + 0 
1371 : c9 10 __ CMP #$10
1373 : d0 16 __ BNE $138b ; (nformi.s9 + 0)
.s25:
1375 : a0 03 __ LDY #$03
1377 : b1 1b __ LDA (P0),y ; (si + 0)
1379 : a8 __ __ TAY
137a : a9 30 __ LDA #$30
137c : a6 37 __ LDX T7 + 0 
137e : ca __ __ DEX
137f : ca __ __ DEX
1380 : 86 37 __ STX T7 + 0 
1382 : 9d c7 9f STA $9fc7,x ; (buffer[0] + 0)
1385 : 98 __ __ TYA
1386 : 69 16 __ ADC #$16
1388 : 9d c8 9f STA $9fc8,x ; (buffer[0] + 1)
.s9:
138b : a9 00 __ LDA #$00
138d : 85 29 __ STA ACCU + 0 
138f : a5 35 __ LDA T5 + 0 
1391 : f0 0c __ BEQ $139f ; (nformi.s10 + 0)
.s23:
1393 : a9 2d __ LDA #$2d
.s22:
1395 : a6 37 __ LDX T7 + 0 
1397 : 9d c6 9f STA $9fc6,x ; (buffer[0] + 238)
139a : c6 37 __ DEC T7 + 0 
139c : 4c a9 13 JMP $13a9 ; (nformi.s11 + 0)
.s10:
139f : a0 05 __ LDY #$05
13a1 : b1 1b __ LDA (P0),y ; (si + 0)
13a3 : f0 04 __ BEQ $13a9 ; (nformi.s11 + 0)
.s21:
13a5 : a9 2b __ LDA #$2b
13a7 : d0 ec __ BNE $1395 ; (nformi.s22 + 0)
.s11:
13a9 : a6 37 __ LDX T7 + 0 
13ab : a0 06 __ LDY #$06
13ad : b1 1b __ LDA (P0),y ; (si + 0)
13af : d0 2b __ BNE $13dc ; (nformi.s17 + 0)
.l12:
13b1 : 8a __ __ TXA
13b2 : 18 __ __ CLC
13b3 : a0 01 __ LDY #$01
13b5 : 71 1b __ ADC (P0),y ; (si + 0)
13b7 : b0 04 __ BCS $13bd ; (nformi.s15 + 0)
.s16:
13b9 : c9 11 __ CMP #$11
13bb : 90 0a __ BCC $13c7 ; (nformi.s13 + 0)
.s15:
13bd : a0 00 __ LDY #$00
13bf : b1 1b __ LDA (P0),y ; (si + 0)
13c1 : 9d c6 9f STA $9fc6,x ; (buffer[0] + 238)
13c4 : ca __ __ DEX
13c5 : b0 ea __ BCS $13b1 ; (nformi.l12 + 0)
.s13:
13c7 : e0 10 __ CPX #$10
13c9 : b0 0e __ BCS $13d9 ; (nformi.s41 + 0)
.s14:
13cb : 88 __ __ DEY
.l37:
13cc : bd c7 9f LDA $9fc7,x ; (buffer[0] + 0)
13cf : 91 1d __ STA (P2),y ; (str + 0)
13d1 : c8 __ __ INY
13d2 : e8 __ __ INX
13d3 : e0 10 __ CPX #$10
13d5 : 90 f5 __ BCC $13cc ; (nformi.l37 + 0)
.s38:
13d7 : 84 29 __ STY ACCU + 0 
.s41:
13d9 : a5 29 __ LDA ACCU + 0 
.s3:
13db : 60 __ __ RTS
.s17:
13dc : e0 10 __ CPX #$10
13de : b0 1a __ BCS $13fa ; (nformi.l18 + 0)
.s20:
13e0 : a0 00 __ LDY #$00
.l35:
13e2 : bd c7 9f LDA $9fc7,x ; (buffer[0] + 0)
13e5 : 91 1d __ STA (P2),y ; (str + 0)
13e7 : c8 __ __ INY
13e8 : e8 __ __ INX
13e9 : e0 10 __ CPX #$10
13eb : 90 f5 __ BCC $13e2 ; (nformi.l35 + 0)
.s36:
13ed : 84 29 __ STY ACCU + 0 
13ef : b0 09 __ BCS $13fa ; (nformi.l18 + 0)
.s19:
13f1 : 88 __ __ DEY
13f2 : b1 1b __ LDA (P0),y ; (si + 0)
13f4 : a4 29 __ LDY ACCU + 0 
13f6 : 91 1d __ STA (P2),y ; (str + 0)
13f8 : e6 29 __ INC ACCU + 0 
.l18:
13fa : a5 29 __ LDA ACCU + 0 
13fc : a0 01 __ LDY #$01
13fe : d1 1b __ CMP (P0),y ; (si + 0)
1400 : 90 ef __ BCC $13f1 ; (nformi.s19 + 0)
1402 : 60 __ __ RTS
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->u8
; 137, "/mnt/d/F256/oscar64/include/stdio.c"
.s4:
1403 : a9 00 __ LDA #$00
1405 : 85 35 __ STA T4 + 0 
1407 : a5 23 __ LDA P8 ; (s + 0)
1409 : f0 1f __ BEQ $142a ; (nforml.s5 + 0)
.s35:
140b : 24 22 __ BIT P7 ; (v + 3)
140d : 10 1b __ BPL $142a ; (nforml.s5 + 0)
.s36:
140f : 38 __ __ SEC
1410 : a9 00 __ LDA #$00
1412 : e5 1f __ SBC P4 ; (v + 0)
1414 : 85 1f __ STA P4 ; (v + 0)
1416 : a9 00 __ LDA #$00
1418 : e5 20 __ SBC P5 ; (v + 1)
141a : 85 20 __ STA P5 ; (v + 1)
141c : a9 00 __ LDA #$00
141e : e5 21 __ SBC P6 ; (v + 2)
1420 : 85 21 __ STA P6 ; (v + 2)
1422 : a9 00 __ LDA #$00
1424 : e5 22 __ SBC P7 ; (v + 3)
1426 : 85 22 __ STA P7 ; (v + 3)
1428 : e6 35 __ INC T4 + 0 
.s5:
142a : a9 10 __ LDA #$10
142c : 85 36 __ STA T5 + 0 
142e : a5 22 __ LDA P7 ; (v + 3)
1430 : f0 03 __ BEQ $1435 ; (nforml.s31 + 0)
1432 : 4c ff 14 JMP $14ff ; (nforml.l28 + 0)
.s31:
1435 : a5 21 __ LDA P6 ; (v + 2)
1437 : d0 f9 __ BNE $1432 ; (nforml.s5 + 8)
.s32:
1439 : a5 20 __ LDA P5 ; (v + 1)
143b : d0 f5 __ BNE $1432 ; (nforml.s5 + 8)
.s33:
143d : c5 1f __ CMP P4 ; (v + 0)
143f : 90 f1 __ BCC $1432 ; (nforml.s5 + 8)
.s6:
1441 : a0 02 __ LDY #$02
1443 : b1 1b __ LDA (P0),y ; (si + 0)
1445 : c9 ff __ CMP #$ff
1447 : d0 04 __ BNE $144d ; (nforml.s27 + 0)
.s7:
1449 : a9 0f __ LDA #$0f
144b : d0 05 __ BNE $1452 ; (nforml.s41 + 0)
.s27:
144d : 38 __ __ SEC
144e : a9 10 __ LDA #$10
1450 : f1 1b __ SBC (P0),y ; (si + 0)
.s41:
1452 : a8 __ __ TAY
1453 : c4 36 __ CPY T5 + 0 
1455 : b0 0d __ BCS $1464 ; (nforml.s8 + 0)
.s26:
1457 : a9 30 __ LDA #$30
.l42:
1459 : a6 36 __ LDX T5 + 0 
145b : 9d c6 9f STA $9fc6,x ; (buffer[0] + 238)
145e : c6 36 __ DEC T5 + 0 
1460 : c4 36 __ CPY T5 + 0 
1462 : 90 f5 __ BCC $1459 ; (nforml.l42 + 0)
.s8:
1464 : a0 07 __ LDY #$07
1466 : b1 1b __ LDA (P0),y ; (si + 0)
1468 : f0 1d __ BEQ $1487 ; (nforml.s9 + 0)
.s24:
146a : a0 04 __ LDY #$04
146c : b1 1b __ LDA (P0),y ; (si + 0)
146e : c9 10 __ CMP #$10
1470 : d0 15 __ BNE $1487 ; (nforml.s9 + 0)
.s25:
1472 : 88 __ __ DEY
1473 : b1 1b __ LDA (P0),y ; (si + 0)
1475 : a8 __ __ TAY
1476 : a9 30 __ LDA #$30
1478 : a6 36 __ LDX T5 + 0 
147a : ca __ __ DEX
147b : ca __ __ DEX
147c : 86 36 __ STX T5 + 0 
147e : 9d c7 9f STA $9fc7,x ; (buffer[0] + 0)
1481 : 98 __ __ TYA
1482 : 69 16 __ ADC #$16
1484 : 9d c8 9f STA $9fc8,x ; (buffer[0] + 1)
.s9:
1487 : a9 00 __ LDA #$00
1489 : 85 29 __ STA ACCU + 0 
148b : a5 35 __ LDA T4 + 0 
148d : f0 0c __ BEQ $149b ; (nforml.s10 + 0)
.s23:
148f : a9 2d __ LDA #$2d
.s22:
1491 : a6 36 __ LDX T5 + 0 
1493 : 9d c6 9f STA $9fc6,x ; (buffer[0] + 238)
1496 : c6 36 __ DEC T5 + 0 
1498 : 4c a5 14 JMP $14a5 ; (nforml.s11 + 0)
.s10:
149b : a0 05 __ LDY #$05
149d : b1 1b __ LDA (P0),y ; (si + 0)
149f : f0 04 __ BEQ $14a5 ; (nforml.s11 + 0)
.s21:
14a1 : a9 2b __ LDA #$2b
14a3 : d0 ec __ BNE $1491 ; (nforml.s22 + 0)
.s11:
14a5 : a6 36 __ LDX T5 + 0 
14a7 : a0 06 __ LDY #$06
14a9 : b1 1b __ LDA (P0),y ; (si + 0)
14ab : d0 2b __ BNE $14d8 ; (nforml.s17 + 0)
.l12:
14ad : 8a __ __ TXA
14ae : 18 __ __ CLC
14af : a0 01 __ LDY #$01
14b1 : 71 1b __ ADC (P0),y ; (si + 0)
14b3 : b0 04 __ BCS $14b9 ; (nforml.s15 + 0)
.s16:
14b5 : c9 11 __ CMP #$11
14b7 : 90 0a __ BCC $14c3 ; (nforml.s13 + 0)
.s15:
14b9 : a0 00 __ LDY #$00
14bb : b1 1b __ LDA (P0),y ; (si + 0)
14bd : 9d c6 9f STA $9fc6,x ; (buffer[0] + 238)
14c0 : ca __ __ DEX
14c1 : b0 ea __ BCS $14ad ; (nforml.l12 + 0)
.s13:
14c3 : e0 10 __ CPX #$10
14c5 : b0 0e __ BCS $14d5 ; (nforml.s43 + 0)
.s14:
14c7 : 88 __ __ DEY
.l39:
14c8 : bd c7 9f LDA $9fc7,x ; (buffer[0] + 0)
14cb : 91 1d __ STA (P2),y ; (str + 0)
14cd : c8 __ __ INY
14ce : e8 __ __ INX
14cf : e0 10 __ CPX #$10
14d1 : 90 f5 __ BCC $14c8 ; (nforml.l39 + 0)
.s40:
14d3 : 84 29 __ STY ACCU + 0 
.s43:
14d5 : a5 29 __ LDA ACCU + 0 
.s3:
14d7 : 60 __ __ RTS
.s17:
14d8 : e0 10 __ CPX #$10
14da : b0 1a __ BCS $14f6 ; (nforml.l18 + 0)
.s20:
14dc : a0 00 __ LDY #$00
.l37:
14de : bd c7 9f LDA $9fc7,x ; (buffer[0] + 0)
14e1 : 91 1d __ STA (P2),y ; (str + 0)
14e3 : c8 __ __ INY
14e4 : e8 __ __ INX
14e5 : e0 10 __ CPX #$10
14e7 : 90 f5 __ BCC $14de ; (nforml.l37 + 0)
.s38:
14e9 : 84 29 __ STY ACCU + 0 
14eb : b0 09 __ BCS $14f6 ; (nforml.l18 + 0)
.s19:
14ed : 88 __ __ DEY
14ee : b1 1b __ LDA (P0),y ; (si + 0)
14f0 : a4 29 __ LDY ACCU + 0 
14f2 : 91 1d __ STA (P2),y ; (str + 0)
14f4 : e6 29 __ INC ACCU + 0 
.l18:
14f6 : a5 29 __ LDA ACCU + 0 
14f8 : a0 01 __ LDY #$01
14fa : d1 1b __ CMP (P0),y ; (si + 0)
14fc : 90 ef __ BCC $14ed ; (nforml.s19 + 0)
14fe : 60 __ __ RTS
.l28:
14ff : a0 04 __ LDY #$04
1501 : b1 1b __ LDA (P0),y ; (si + 0)
1503 : 85 11 __ STA WORK + 0 
1505 : a5 1f __ LDA P4 ; (v + 0)
1507 : 85 29 __ STA ACCU + 0 
1509 : a5 20 __ LDA P5 ; (v + 1)
150b : 85 2a __ STA ACCU + 1 
150d : a5 21 __ LDA P6 ; (v + 2)
150f : 85 2b __ STA ACCU + 2 
1511 : a5 22 __ LDA P7 ; (v + 3)
1513 : 85 2c __ STA ACCU + 3 
1515 : a9 00 __ LDA #$00
1517 : 85 12 __ STA WORK + 1 
1519 : 85 13 __ STA WORK + 2 
151b : 85 14 __ STA WORK + 3 
151d : 20 2c 4a JSR $4a2c ; (divmod32 + 0)
1520 : a5 15 __ LDA WORK + 4 
1522 : c9 0a __ CMP #$0a
1524 : b0 04 __ BCS $152a ; (nforml.s34 + 0)
.s29:
1526 : a9 30 __ LDA #$30
1528 : 90 06 __ BCC $1530 ; (nforml.s30 + 0)
.s34:
152a : a0 03 __ LDY #$03
152c : b1 1b __ LDA (P0),y ; (si + 0)
152e : e9 0a __ SBC #$0a
.s30:
1530 : 18 __ __ CLC
1531 : 65 15 __ ADC WORK + 4 
1533 : a6 36 __ LDX T5 + 0 
1535 : 9d c6 9f STA $9fc6,x ; (buffer[0] + 238)
1538 : c6 36 __ DEC T5 + 0 
153a : a5 29 __ LDA ACCU + 0 
153c : 85 1f __ STA P4 ; (v + 0)
153e : a5 2a __ LDA ACCU + 1 
1540 : 85 20 __ STA P5 ; (v + 1)
1542 : a5 2b __ LDA ACCU + 2 
1544 : 85 21 __ STA P6 ; (v + 2)
1546 : a5 2c __ LDA ACCU + 3 
1548 : 85 22 __ STA P7 ; (v + 3)
154a : d0 b3 __ BNE $14ff ; (nforml.l28 + 0)
154c : 4c 35 14 JMP $1435 ; (nforml.s31 + 0)
--------------------------------------------------------------------
nformf: ; nformf(const struct sinfo*,u8*,float,u8)->u8
; 199, "/mnt/d/F256/oscar64/include/stdio.c"
.s4:
154f : a5 24 __ LDA P9 ; (f + 1)
1551 : 85 36 __ STA T0 + 1 
1553 : a5 25 __ LDA P10 ; (f + 2)
1555 : 85 37 __ STA T0 + 2 
1557 : a5 26 __ LDA P11 ; (f + 3)
1559 : 29 7f __ AND #$7f
155b : 05 25 __ ORA P10 ; (f + 2)
155d : 05 24 __ ORA P9 ; (f + 1)
155f : 05 23 __ ORA P8 ; (f + 0)
1561 : f0 21 __ BEQ $1584 ; (nformf.s5 + 0)
.s107:
1563 : 24 26 __ BIT P11 ; (f + 3)
1565 : 10 1d __ BPL $1584 ; (nformf.s5 + 0)
.s106:
1567 : a9 2d __ LDA #$2d
1569 : a0 00 __ LDY #$00
156b : 91 21 __ STA (P6),y ; (str + 0)
156d : a5 26 __ LDA P11 ; (f + 3)
156f : 49 80 __ EOR #$80
1571 : 85 1e __ STA P3 
1573 : 85 26 __ STA P11 ; (f + 3)
1575 : a5 23 __ LDA P8 ; (f + 0)
1577 : 85 1b __ STA P0 
1579 : a5 24 __ LDA P9 ; (f + 1)
157b : 85 1c __ STA P1 
157d : a5 25 __ LDA P10 ; (f + 2)
157f : 85 1d __ STA P2 
1581 : 4c 8e 1a JMP $1a8e ; (nformf.s104 + 0)
.s5:
1584 : a5 23 __ LDA P8 ; (f + 0)
1586 : 85 1b __ STA P0 
1588 : a5 24 __ LDA P9 ; (f + 1)
158a : 85 1c __ STA P1 
158c : a5 25 __ LDA P10 ; (f + 2)
158e : 85 1d __ STA P2 
1590 : a5 26 __ LDA P11 ; (f + 3)
1592 : 85 1e __ STA P3 
1594 : a0 05 __ LDY #$05
1596 : b1 1f __ LDA (P4),y ; (si + 0)
1598 : f0 09 __ BEQ $15a3 ; (nformf.s6 + 0)
.s103:
159a : a9 2b __ LDA #$2b
159c : a0 00 __ LDY #$00
159e : 91 21 __ STA (P6),y ; (str + 0)
15a0 : 4c 8e 1a JMP $1a8e ; (nformf.s104 + 0)
.s6:
15a3 : 20 9f 1a JSR $1a9f ; (isinf.s4 + 0)
15a6 : a2 00 __ LDX #$00
15a8 : 86 46 __ STX T9 + 0 
15aa : a8 __ __ TAY
15ab : f0 05 __ BEQ $15b2 ; (nformf.s7 + 0)
.s101:
15ad : a9 02 __ LDA #$02
15af : 4c 5e 1a JMP $1a5e ; (nformf.s102 + 0)
.s7:
15b2 : a5 1f __ LDA P4 ; (si + 0)
15b4 : 85 3d __ STA T2 + 0 
15b6 : a5 20 __ LDA P5 ; (si + 1)
15b8 : 85 3e __ STA T2 + 1 
15ba : a0 02 __ LDY #$02
15bc : b1 1f __ LDA (P4),y ; (si + 0)
15be : c9 ff __ CMP #$ff
15c0 : d0 02 __ BNE $15c4 ; (nformf.s100 + 0)
.s8:
15c2 : a9 06 __ LDA #$06
.s100:
15c4 : 85 3f __ STA T3 + 0 
15c6 : 85 44 __ STA T6 + 0 
15c8 : a9 00 __ LDA #$00
15ca : 85 41 __ STA T4 + 0 
15cc : 85 42 __ STA T4 + 1 
15ce : a5 26 __ LDA P11 ; (f + 3)
15d0 : 85 38 __ STA T0 + 3 
15d2 : 29 7f __ AND #$7f
15d4 : 05 25 __ ORA P10 ; (f + 2)
15d6 : 05 24 __ ORA P9 ; (f + 1)
15d8 : a6 23 __ LDX P8 ; (f + 0)
15da : 86 35 __ STX T0 + 0 
15dc : 05 23 __ ORA P8 ; (f + 0)
15de : d0 03 __ BNE $15e3 ; (nformf.s67 + 0)
15e0 : 4c 17 17 JMP $1717 ; (nformf.s9 + 0)
.s67:
15e3 : a5 26 __ LDA P11 ; (f + 3)
15e5 : 10 03 __ BPL $15ea ; (nformf.s95 + 0)
15e7 : 4c 69 16 JMP $1669 ; (nformf.l80 + 0)
.s95:
15ea : c9 44 __ CMP #$44
15ec : d0 0d __ BNE $15fb ; (nformf.l99 + 0)
.s96:
15ee : a5 25 __ LDA P10 ; (f + 2)
15f0 : c9 7a __ CMP #$7a
15f2 : d0 07 __ BNE $15fb ; (nformf.l99 + 0)
.s97:
15f4 : a5 24 __ LDA P9 ; (f + 1)
15f6 : d0 03 __ BNE $15fb ; (nformf.l99 + 0)
.s98:
15f8 : 8a __ __ TXA
15f9 : f0 02 __ BEQ $15fd ; (nformf.l90 + 0)
.l99:
15fb : 90 54 __ BCC $1651 ; (nformf.s68 + 0)
.l90:
15fd : 18 __ __ CLC
15fe : a5 41 __ LDA T4 + 0 
1600 : 69 03 __ ADC #$03
1602 : 85 41 __ STA T4 + 0 
1604 : 90 02 __ BCC $1608 ; (nformf.s121 + 0)
.s120:
1606 : e6 42 __ INC T4 + 1 
.s121:
1608 : a5 35 __ LDA T0 + 0 
160a : 85 29 __ STA ACCU + 0 
160c : a5 36 __ LDA T0 + 1 
160e : 85 2a __ STA ACCU + 1 
1610 : a5 37 __ LDA T0 + 2 
1612 : 85 2b __ STA ACCU + 2 
1614 : a5 38 __ LDA T0 + 3 
1616 : 85 2c __ STA ACCU + 3 
1618 : a9 00 __ LDA #$00
161a : 85 11 __ STA WORK + 0 
161c : 85 12 __ STA WORK + 1 
161e : a9 7a __ LDA #$7a
1620 : 85 13 __ STA WORK + 2 
1622 : a9 44 __ LDA #$44
1624 : 85 14 __ STA WORK + 3 
1626 : 20 93 45 JSR $4593 ; (freg + 20)
1629 : 20 79 47 JSR $4779 ; (crt_fdiv + 0)
162c : a5 29 __ LDA ACCU + 0 
162e : 85 35 __ STA T0 + 0 
1630 : a5 2a __ LDA ACCU + 1 
1632 : 85 36 __ STA T0 + 1 
1634 : a6 2b __ LDX ACCU + 2 
1636 : 86 37 __ STX T0 + 2 
1638 : a5 2c __ LDA ACCU + 3 
163a : 85 38 __ STA T0 + 3 
163c : 30 13 __ BMI $1651 ; (nformf.s68 + 0)
.s91:
163e : c9 44 __ CMP #$44
1640 : d0 b9 __ BNE $15fb ; (nformf.l99 + 0)
.s92:
1642 : e0 7a __ CPX #$7a
1644 : d0 b5 __ BNE $15fb ; (nformf.l99 + 0)
.s93:
1646 : a5 2a __ LDA ACCU + 1 
1648 : 38 __ __ SEC
1649 : d0 b0 __ BNE $15fb ; (nformf.l99 + 0)
.s94:
164b : a5 29 __ LDA ACCU + 0 
164d : f0 ae __ BEQ $15fd ; (nformf.l90 + 0)
164f : d0 aa __ BNE $15fb ; (nformf.l99 + 0)
.s68:
1651 : a5 38 __ LDA T0 + 3 
1653 : 30 14 __ BMI $1669 ; (nformf.l80 + 0)
.s86:
1655 : c9 3f __ CMP #$3f
1657 : d0 0e __ BNE $1667 ; (nformf.s85 + 0)
.s87:
1659 : a5 37 __ LDA T0 + 2 
165b : c9 80 __ CMP #$80
165d : d0 08 __ BNE $1667 ; (nformf.s85 + 0)
.s88:
165f : a5 36 __ LDA T0 + 1 
1661 : d0 04 __ BNE $1667 ; (nformf.s85 + 0)
.s89:
1663 : a5 35 __ LDA T0 + 0 
1665 : f0 49 __ BEQ $16b0 ; (nformf.s69 + 0)
.s85:
1667 : b0 47 __ BCS $16b0 ; (nformf.s69 + 0)
.l80:
1669 : 38 __ __ SEC
166a : a5 41 __ LDA T4 + 0 
166c : e9 03 __ SBC #$03
166e : 85 41 __ STA T4 + 0 
1670 : b0 02 __ BCS $1674 ; (nformf.s116 + 0)
.s115:
1672 : c6 42 __ DEC T4 + 1 
.s116:
1674 : a9 00 __ LDA #$00
1676 : 85 29 __ STA ACCU + 0 
1678 : 85 2a __ STA ACCU + 1 
167a : a9 7a __ LDA #$7a
167c : 85 2b __ STA ACCU + 2 
167e : a9 44 __ LDA #$44
1680 : 85 2c __ STA ACCU + 3 
1682 : a2 35 __ LDX #$35
1684 : 20 83 45 JSR $4583 ; (freg + 4)
1687 : 20 b1 46 JSR $46b1 ; (crt_fmul + 0)
168a : a5 29 __ LDA ACCU + 0 
168c : 85 35 __ STA T0 + 0 
168e : a5 2a __ LDA ACCU + 1 
1690 : 85 36 __ STA T0 + 1 
1692 : a6 2b __ LDX ACCU + 2 
1694 : 86 37 __ STX T0 + 2 
1696 : a5 2c __ LDA ACCU + 3 
1698 : 85 38 __ STA T0 + 3 
169a : 30 cd __ BMI $1669 ; (nformf.l80 + 0)
.s81:
169c : c9 3f __ CMP #$3f
169e : 90 c9 __ BCC $1669 ; (nformf.l80 + 0)
.s122:
16a0 : d0 0e __ BNE $16b0 ; (nformf.s69 + 0)
.s82:
16a2 : e0 80 __ CPX #$80
16a4 : 90 c3 __ BCC $1669 ; (nformf.l80 + 0)
.s123:
16a6 : d0 08 __ BNE $16b0 ; (nformf.s69 + 0)
.s83:
16a8 : a5 2a __ LDA ACCU + 1 
16aa : d0 bb __ BNE $1667 ; (nformf.s85 + 0)
.s84:
16ac : a5 29 __ LDA ACCU + 0 
16ae : d0 b7 __ BNE $1667 ; (nformf.s85 + 0)
.s69:
16b0 : a5 38 __ LDA T0 + 3 
16b2 : 30 63 __ BMI $1717 ; (nformf.s9 + 0)
.s75:
16b4 : c9 41 __ CMP #$41
16b6 : d0 0e __ BNE $16c6 ; (nformf.l79 + 0)
.s76:
16b8 : a5 37 __ LDA T0 + 2 
16ba : c9 20 __ CMP #$20
16bc : d0 08 __ BNE $16c6 ; (nformf.l79 + 0)
.s77:
16be : a5 36 __ LDA T0 + 1 
16c0 : d0 04 __ BNE $16c6 ; (nformf.l79 + 0)
.s78:
16c2 : a5 35 __ LDA T0 + 0 
16c4 : f0 02 __ BEQ $16c8 ; (nformf.l70 + 0)
.l79:
16c6 : 90 4f __ BCC $1717 ; (nformf.s9 + 0)
.l70:
16c8 : e6 41 __ INC T4 + 0 
16ca : d0 02 __ BNE $16ce ; (nformf.s119 + 0)
.s118:
16cc : e6 42 __ INC T4 + 1 
.s119:
16ce : a5 35 __ LDA T0 + 0 
16d0 : 85 29 __ STA ACCU + 0 
16d2 : a5 36 __ LDA T0 + 1 
16d4 : 85 2a __ STA ACCU + 1 
16d6 : a5 37 __ LDA T0 + 2 
16d8 : 85 2b __ STA ACCU + 2 
16da : a5 38 __ LDA T0 + 3 
16dc : 85 2c __ STA ACCU + 3 
16de : a9 00 __ LDA #$00
16e0 : 85 11 __ STA WORK + 0 
16e2 : 85 12 __ STA WORK + 1 
16e4 : a9 20 __ LDA #$20
16e6 : 85 13 __ STA WORK + 2 
16e8 : a9 41 __ LDA #$41
16ea : 85 14 __ STA WORK + 3 
16ec : 20 93 45 JSR $4593 ; (freg + 20)
16ef : 20 79 47 JSR $4779 ; (crt_fdiv + 0)
16f2 : a5 29 __ LDA ACCU + 0 
16f4 : 85 35 __ STA T0 + 0 
16f6 : a5 2a __ LDA ACCU + 1 
16f8 : 85 36 __ STA T0 + 1 
16fa : a6 2b __ LDX ACCU + 2 
16fc : 86 37 __ STX T0 + 2 
16fe : a5 2c __ LDA ACCU + 3 
1700 : 85 38 __ STA T0 + 3 
1702 : 30 13 __ BMI $1717 ; (nformf.s9 + 0)
.s71:
1704 : c9 41 __ CMP #$41
1706 : d0 be __ BNE $16c6 ; (nformf.l79 + 0)
.s72:
1708 : e0 20 __ CPX #$20
170a : d0 ba __ BNE $16c6 ; (nformf.l79 + 0)
.s73:
170c : a5 2a __ LDA ACCU + 1 
170e : 38 __ __ SEC
170f : d0 b5 __ BNE $16c6 ; (nformf.l79 + 0)
.s74:
1711 : a5 29 __ LDA ACCU + 0 
1713 : f0 b3 __ BEQ $16c8 ; (nformf.l70 + 0)
1715 : d0 af __ BNE $16c6 ; (nformf.l79 + 0)
.s9:
1717 : ad d7 9f LDA $9fd7 ; (sstack + 0)
171a : c9 65 __ CMP #$65
171c : d0 04 __ BNE $1722 ; (nformf.s11 + 0)
.s10:
171e : a9 01 __ LDA #$01
1720 : d0 02 __ BNE $1724 ; (nformf.s12 + 0)
.s11:
1722 : a9 00 __ LDA #$00
.s12:
1724 : 85 47 __ STA T10 + 0 
1726 : a6 3f __ LDX T3 + 0 
1728 : e8 __ __ INX
1729 : 86 43 __ STX T5 + 0 
172b : ad d7 9f LDA $9fd7 ; (sstack + 0)
172e : c9 67 __ CMP #$67
1730 : d0 13 __ BNE $1745 ; (nformf.s13 + 0)
.s63:
1732 : a5 42 __ LDA T4 + 1 
1734 : 30 08 __ BMI $173e ; (nformf.s64 + 0)
.s66:
1736 : d0 06 __ BNE $173e ; (nformf.s64 + 0)
.s65:
1738 : a5 41 __ LDA T4 + 0 
173a : c9 04 __ CMP #$04
173c : 90 07 __ BCC $1745 ; (nformf.s13 + 0)
.s64:
173e : a9 01 __ LDA #$01
1740 : 85 47 __ STA T10 + 0 
1742 : 4c c4 19 JMP $19c4 ; (nformf.s53 + 0)
.s13:
1745 : a5 47 __ LDA T10 + 0 
1747 : d0 f9 __ BNE $1742 ; (nformf.s64 + 4)
.s14:
1749 : 24 42 __ BIT T4 + 1 
174b : 10 43 __ BPL $1790 ; (nformf.s15 + 0)
.s52:
174d : a5 35 __ LDA T0 + 0 
174f : 85 29 __ STA ACCU + 0 
1751 : a5 36 __ LDA T0 + 1 
1753 : 85 2a __ STA ACCU + 1 
1755 : a5 37 __ LDA T0 + 2 
1757 : 85 2b __ STA ACCU + 2 
1759 : a5 38 __ LDA T0 + 3 
175b : 85 2c __ STA ACCU + 3 
.l108:
175d : a9 00 __ LDA #$00
175f : 85 11 __ STA WORK + 0 
1761 : 85 12 __ STA WORK + 1 
1763 : a9 20 __ LDA #$20
1765 : 85 13 __ STA WORK + 2 
1767 : a9 41 __ LDA #$41
1769 : 85 14 __ STA WORK + 3 
176b : 20 93 45 JSR $4593 ; (freg + 20)
176e : 20 79 47 JSR $4779 ; (crt_fdiv + 0)
1771 : 18 __ __ CLC
1772 : a5 41 __ LDA T4 + 0 
1774 : 69 01 __ ADC #$01
1776 : 85 41 __ STA T4 + 0 
1778 : a5 42 __ LDA T4 + 1 
177a : 69 00 __ ADC #$00
177c : 85 42 __ STA T4 + 1 
177e : 30 dd __ BMI $175d ; (nformf.l108 + 0)
.s109:
1780 : a5 2c __ LDA ACCU + 3 
1782 : 85 38 __ STA T0 + 3 
1784 : a5 2b __ LDA ACCU + 2 
1786 : 85 37 __ STA T0 + 2 
1788 : a5 2a __ LDA ACCU + 1 
178a : 85 36 __ STA T0 + 1 
178c : a5 29 __ LDA ACCU + 0 
178e : 85 35 __ STA T0 + 0 
.s15:
1790 : 18 __ __ CLC
1791 : a5 3f __ LDA T3 + 0 
1793 : 65 41 __ ADC T4 + 0 
1795 : 18 __ __ CLC
1796 : 69 01 __ ADC #$01
1798 : 85 43 __ STA T5 + 0 
179a : c9 07 __ CMP #$07
179c : 90 14 __ BCC $17b2 ; (nformf.s51 + 0)
.s16:
179e : ad b9 4c LDA $4cb9 ; (fround5[0] + 24)
17a1 : 85 39 __ STA T1 + 0 
17a3 : ad ba 4c LDA $4cba ; (fround5[0] + 25)
17a6 : 85 3a __ STA T1 + 1 
17a8 : ad bb 4c LDA $4cbb ; (fround5[0] + 26)
17ab : 85 3b __ STA T1 + 2 
17ad : ad bc 4c LDA $4cbc ; (fround5[0] + 27)
17b0 : b0 15 __ BCS $17c7 ; (nformf.s17 + 0)
.s51:
17b2 : 0a __ __ ASL
17b3 : 0a __ __ ASL
17b4 : aa __ __ TAX
17b5 : bd 9d 4c LDA $4c9d,x ; (textColors[0] + 47)
17b8 : 85 39 __ STA T1 + 0 
17ba : bd 9e 4c LDA $4c9e,x ; (_col + 0)
17bd : 85 3a __ STA T1 + 1 
17bf : bd 9f 4c LDA $4c9f,x ; (_row + 0)
17c2 : 85 3b __ STA T1 + 2 
17c4 : bd a0 4c LDA $4ca0,x ; (f256k_color + 0)
.s17:
17c7 : 85 3c __ STA T1 + 3 
17c9 : a5 35 __ LDA T0 + 0 
17cb : 85 29 __ STA ACCU + 0 
17cd : a5 36 __ LDA T0 + 1 
17cf : 85 2a __ STA ACCU + 1 
17d1 : a5 37 __ LDA T0 + 2 
17d3 : 85 2b __ STA ACCU + 2 
17d5 : a5 38 __ LDA T0 + 3 
17d7 : 85 2c __ STA ACCU + 3 
17d9 : a2 39 __ LDX #$39
17db : 20 83 45 JSR $4583 ; (freg + 4)
17de : 20 ca 45 JSR $45ca ; (faddsub + 6)
17e1 : a5 2a __ LDA ACCU + 1 
17e3 : 85 24 __ STA P9 ; (f + 1)
17e5 : a5 2b __ LDA ACCU + 2 
17e7 : 85 25 __ STA P10 ; (f + 2)
17e9 : a6 29 __ LDX ACCU + 0 
17eb : a5 2c __ LDA ACCU + 3 
17ed : 85 26 __ STA P11 ; (f + 3)
17ef : 30 3a __ BMI $182b ; (nformf.s18 + 0)
.s46:
17f1 : c9 41 __ CMP #$41
17f3 : d0 0d __ BNE $1802 ; (nformf.s50 + 0)
.s47:
17f5 : a5 25 __ LDA P10 ; (f + 2)
17f7 : c9 20 __ CMP #$20
17f9 : d0 07 __ BNE $1802 ; (nformf.s50 + 0)
.s48:
17fb : a5 24 __ LDA P9 ; (f + 1)
17fd : d0 03 __ BNE $1802 ; (nformf.s50 + 0)
.s49:
17ff : 8a __ __ TXA
1800 : f0 02 __ BEQ $1804 ; (nformf.s45 + 0)
.s50:
1802 : 90 27 __ BCC $182b ; (nformf.s18 + 0)
.s45:
1804 : a9 00 __ LDA #$00
1806 : 85 11 __ STA WORK + 0 
1808 : 85 12 __ STA WORK + 1 
180a : a9 20 __ LDA #$20
180c : 85 13 __ STA WORK + 2 
180e : a9 41 __ LDA #$41
1810 : 85 14 __ STA WORK + 3 
1812 : 20 93 45 JSR $4593 ; (freg + 20)
1815 : 20 79 47 JSR $4779 ; (crt_fdiv + 0)
1818 : a5 2a __ LDA ACCU + 1 
181a : 85 24 __ STA P9 ; (f + 1)
181c : a5 2b __ LDA ACCU + 2 
181e : 85 25 __ STA P10 ; (f + 2)
1820 : a5 2c __ LDA ACCU + 3 
1822 : 85 26 __ STA P11 ; (f + 3)
1824 : a6 3f __ LDX T3 + 0 
1826 : ca __ __ DEX
1827 : 86 44 __ STX T6 + 0 
1829 : a6 29 __ LDX ACCU + 0 
.s18:
182b : 38 __ __ SEC
182c : a5 43 __ LDA T5 + 0 
182e : e5 44 __ SBC T6 + 0 
1830 : 85 3f __ STA T3 + 0 
1832 : a9 00 __ LDA #$00
1834 : e9 00 __ SBC #$00
1836 : 85 40 __ STA T3 + 1 
1838 : a9 14 __ LDA #$14
183a : c5 43 __ CMP T5 + 0 
183c : b0 02 __ BCS $1840 ; (nformf.s19 + 0)
.s44:
183e : 85 43 __ STA T5 + 0 
.s19:
1840 : a5 3f __ LDA T3 + 0 
1842 : d0 08 __ BNE $184c ; (nformf.s21 + 0)
.s20:
1844 : a9 30 __ LDA #$30
1846 : a4 46 __ LDY T9 + 0 
1848 : 91 21 __ STA (P6),y ; (str + 0)
184a : e6 46 __ INC T9 + 0 
.s21:
184c : a9 00 __ LDA #$00
184e : 85 48 __ STA T11 + 0 
1850 : c5 3f __ CMP T3 + 0 
1852 : f0 6f __ BEQ $18c3 ; (nformf.l43 + 0)
.s23:
1854 : c9 07 __ CMP #$07
1856 : 90 04 __ BCC $185c ; (nformf.s24 + 0)
.l42:
1858 : a9 30 __ LDA #$30
185a : b0 55 __ BCS $18b1 ; (nformf.l25 + 0)
.s24:
185c : 86 29 __ STX ACCU + 0 
185e : 86 35 __ STX T0 + 0 
1860 : a5 24 __ LDA P9 ; (f + 1)
1862 : 85 2a __ STA ACCU + 1 
1864 : 85 36 __ STA T0 + 1 
1866 : a5 25 __ LDA P10 ; (f + 2)
1868 : 85 2b __ STA ACCU + 2 
186a : 85 37 __ STA T0 + 2 
186c : a5 26 __ LDA P11 ; (f + 3)
186e : 85 2c __ STA ACCU + 3 
1870 : 85 38 __ STA T0 + 3 
1872 : 20 55 49 JSR $4955 ; (f32_to_i16 + 0)
1875 : a5 29 __ LDA ACCU + 0 
1877 : 85 45 __ STA T7 + 0 
1879 : 20 a1 49 JSR $49a1 ; (sint16_to_float + 0)
187c : a2 35 __ LDX #$35
187e : 20 83 45 JSR $4583 ; (freg + 4)
1881 : a5 2c __ LDA ACCU + 3 
1883 : 49 80 __ EOR #$80
1885 : 85 2c __ STA ACCU + 3 
1887 : 20 ca 45 JSR $45ca ; (faddsub + 6)
188a : a9 00 __ LDA #$00
188c : 85 11 __ STA WORK + 0 
188e : 85 12 __ STA WORK + 1 
1890 : a9 20 __ LDA #$20
1892 : 85 13 __ STA WORK + 2 
1894 : a9 41 __ LDA #$41
1896 : 85 14 __ STA WORK + 3 
1898 : 20 93 45 JSR $4593 ; (freg + 20)
189b : 20 b1 46 JSR $46b1 ; (crt_fmul + 0)
189e : a5 2a __ LDA ACCU + 1 
18a0 : 85 24 __ STA P9 ; (f + 1)
18a2 : a5 2b __ LDA ACCU + 2 
18a4 : 85 25 __ STA P10 ; (f + 2)
18a6 : a5 2c __ LDA ACCU + 3 
18a8 : 85 26 __ STA P11 ; (f + 3)
18aa : 18 __ __ CLC
18ab : a5 45 __ LDA T7 + 0 
18ad : 69 30 __ ADC #$30
18af : a6 29 __ LDX ACCU + 0 
.l25:
18b1 : a4 46 __ LDY T9 + 0 
18b3 : 91 21 __ STA (P6),y ; (str + 0)
18b5 : e6 46 __ INC T9 + 0 
18b7 : e6 48 __ INC T11 + 0 
18b9 : a5 48 __ LDA T11 + 0 
18bb : c5 43 __ CMP T5 + 0 
18bd : b0 14 __ BCS $18d3 ; (nformf.s26 + 0)
.s22:
18bf : c5 3f __ CMP T3 + 0 
18c1 : d0 91 __ BNE $1854 ; (nformf.s23 + 0)
.l43:
18c3 : a9 2e __ LDA #$2e
18c5 : a4 46 __ LDY T9 + 0 
18c7 : 91 21 __ STA (P6),y ; (str + 0)
18c9 : e6 46 __ INC T9 + 0 
18cb : a5 48 __ LDA T11 + 0 
18cd : c9 07 __ CMP #$07
18cf : 90 8b __ BCC $185c ; (nformf.s24 + 0)
18d1 : b0 85 __ BCS $1858 ; (nformf.l42 + 0)
.s26:
18d3 : a5 47 __ LDA T10 + 0 
18d5 : f0 66 __ BEQ $193d ; (nformf.s27 + 0)
.s38:
18d7 : a0 03 __ LDY #$03
18d9 : b1 3d __ LDA (T2 + 0),y 
18db : 69 03 __ ADC #$03
18dd : a4 46 __ LDY T9 + 0 
18df : 91 21 __ STA (P6),y ; (str + 0)
18e1 : c8 __ __ INY
18e2 : 84 46 __ STY T9 + 0 
18e4 : 24 42 __ BIT T4 + 1 
18e6 : 30 06 __ BMI $18ee ; (nformf.s41 + 0)
.s39:
18e8 : a9 2b __ LDA #$2b
18ea : 91 21 __ STA (P6),y ; (str + 0)
18ec : d0 11 __ BNE $18ff ; (nformf.s40 + 0)
.s41:
18ee : a9 2d __ LDA #$2d
18f0 : 91 21 __ STA (P6),y ; (str + 0)
18f2 : 38 __ __ SEC
18f3 : a9 00 __ LDA #$00
18f5 : e5 41 __ SBC T4 + 0 
18f7 : 85 41 __ STA T4 + 0 
18f9 : a9 00 __ LDA #$00
18fb : e5 42 __ SBC T4 + 1 
18fd : 85 42 __ STA T4 + 1 
.s40:
18ff : e6 46 __ INC T9 + 0 
1901 : a5 41 __ LDA T4 + 0 
1903 : 85 29 __ STA ACCU + 0 
1905 : a5 42 __ LDA T4 + 1 
1907 : 85 2a __ STA ACCU + 1 
1909 : a9 0a __ LDA #$0a
190b : 85 11 __ STA WORK + 0 
190d : a9 00 __ LDA #$00
190f : 85 12 __ STA WORK + 1 
1911 : 20 69 48 JSR $4869 ; (divs16 + 0)
1914 : 18 __ __ CLC
1915 : a5 29 __ LDA ACCU + 0 
1917 : 69 30 __ ADC #$30
1919 : a4 46 __ LDY T9 + 0 
191b : 91 21 __ STA (P6),y ; (str + 0)
191d : e6 46 __ INC T9 + 0 
191f : a5 41 __ LDA T4 + 0 
1921 : 85 29 __ STA ACCU + 0 
1923 : a5 42 __ LDA T4 + 1 
1925 : 85 2a __ STA ACCU + 1 
1927 : a9 0a __ LDA #$0a
1929 : 85 11 __ STA WORK + 0 
192b : a9 00 __ LDA #$00
192d : 85 12 __ STA WORK + 1 
192f : 20 28 49 JSR $4928 ; (mods16 + 0)
1932 : 18 __ __ CLC
1933 : a5 13 __ LDA WORK + 2 
1935 : 69 30 __ ADC #$30
1937 : a4 46 __ LDY T9 + 0 
1939 : 91 21 __ STA (P6),y ; (str + 0)
193b : e6 46 __ INC T9 + 0 
.s27:
193d : a5 46 __ LDA T9 + 0 
193f : a0 01 __ LDY #$01
1941 : d1 1f __ CMP (P4),y ; (si + 0)
1943 : b0 6d __ BCS $19b2 ; (nformf.s3 + 0)
.s28:
1945 : a0 06 __ LDY #$06
1947 : b1 1f __ LDA (P4),y ; (si + 0)
1949 : f0 04 __ BEQ $194f ; (nformf.s29 + 0)
.s110:
194b : a6 46 __ LDX T9 + 0 
194d : 90 66 __ BCC $19b5 ; (nformf.l36 + 0)
.s29:
194f : a5 46 __ LDA T9 + 0 
1951 : f0 40 __ BEQ $1993 ; (nformf.s30 + 0)
.s35:
1953 : e9 00 __ SBC #$00
1955 : a8 __ __ TAY
1956 : a9 00 __ LDA #$00
1958 : e9 00 __ SBC #$00
195a : aa __ __ TAX
195b : 98 __ __ TYA
195c : 18 __ __ CLC
195d : 65 21 __ ADC P6 ; (str + 0)
195f : 85 39 __ STA T1 + 0 
1961 : 8a __ __ TXA
1962 : 65 22 __ ADC P7 ; (str + 1)
1964 : 85 3a __ STA T1 + 1 
1966 : a9 01 __ LDA #$01
1968 : 85 3f __ STA T3 + 0 
196a : a6 46 __ LDX T9 + 0 
196c : 38 __ __ SEC
.l111:
196d : a0 01 __ LDY #$01
196f : b1 1f __ LDA (P4),y ; (si + 0)
1971 : e5 3f __ SBC T3 + 0 
1973 : 85 3d __ STA T2 + 0 
1975 : a9 00 __ LDA #$00
1977 : e5 40 __ SBC T3 + 1 
1979 : 18 __ __ CLC
197a : 65 22 __ ADC P7 ; (str + 1)
197c : 85 3e __ STA T2 + 1 
197e : 88 __ __ DEY
197f : b1 39 __ LDA (T1 + 0),y 
1981 : a4 21 __ LDY P6 ; (str + 0)
1983 : 91 3d __ STA (T2 + 0),y 
1985 : a5 39 __ LDA T1 + 0 
1987 : d0 02 __ BNE $198b ; (nformf.s114 + 0)
.s113:
1989 : c6 3a __ DEC T1 + 1 
.s114:
198b : c6 39 __ DEC T1 + 0 
198d : e6 3f __ INC T3 + 0 
198f : e4 3f __ CPX T3 + 0 
1991 : b0 da __ BCS $196d ; (nformf.l111 + 0)
.s30:
1993 : a9 00 __ LDA #$00
1995 : 85 3f __ STA T3 + 0 
1997 : 90 08 __ BCC $19a1 ; (nformf.l31 + 0)
.s33:
1999 : a9 20 __ LDA #$20
199b : a4 3f __ LDY T3 + 0 
199d : 91 21 __ STA (P6),y ; (str + 0)
199f : e6 3f __ INC T3 + 0 
.l31:
19a1 : a0 01 __ LDY #$01
19a3 : b1 1f __ LDA (P4),y ; (si + 0)
19a5 : 38 __ __ SEC
19a6 : e5 46 __ SBC T9 + 0 
19a8 : 90 ef __ BCC $1999 ; (nformf.s33 + 0)
.s34:
19aa : c5 3f __ CMP T3 + 0 
19ac : 90 02 __ BCC $19b0 ; (nformf.s32 + 0)
.s112:
19ae : d0 e9 __ BNE $1999 ; (nformf.s33 + 0)
.s32:
19b0 : b1 1f __ LDA (P4),y ; (si + 0)
.s3:
19b2 : 85 29 __ STA ACCU + 0 
19b4 : 60 __ __ RTS
.l36:
19b5 : 8a __ __ TXA
19b6 : a0 01 __ LDY #$01
19b8 : d1 1f __ CMP (P4),y ; (si + 0)
19ba : b0 f4 __ BCS $19b0 ; (nformf.s32 + 0)
.s37:
19bc : a8 __ __ TAY
19bd : a9 20 __ LDA #$20
19bf : 91 21 __ STA (P6),y ; (str + 0)
19c1 : e8 __ __ INX
19c2 : 90 f1 __ BCC $19b5 ; (nformf.l36 + 0)
.s53:
19c4 : a5 43 __ LDA T5 + 0 
19c6 : c9 07 __ CMP #$07
19c8 : 90 14 __ BCC $19de ; (nformf.s62 + 0)
.s54:
19ca : ad b9 4c LDA $4cb9 ; (fround5[0] + 24)
19cd : 85 39 __ STA T1 + 0 
19cf : ad ba 4c LDA $4cba ; (fround5[0] + 25)
19d2 : 85 3a __ STA T1 + 1 
19d4 : ad bb 4c LDA $4cbb ; (fround5[0] + 26)
19d7 : 85 3b __ STA T1 + 2 
19d9 : ad bc 4c LDA $4cbc ; (fround5[0] + 27)
19dc : b0 15 __ BCS $19f3 ; (nformf.s55 + 0)
.s62:
19de : 0a __ __ ASL
19df : 0a __ __ ASL
19e0 : aa __ __ TAX
19e1 : bd 9d 4c LDA $4c9d,x ; (textColors[0] + 47)
19e4 : 85 39 __ STA T1 + 0 
19e6 : bd 9e 4c LDA $4c9e,x ; (_col + 0)
19e9 : 85 3a __ STA T1 + 1 
19eb : bd 9f 4c LDA $4c9f,x ; (_row + 0)
19ee : 85 3b __ STA T1 + 2 
19f0 : bd a0 4c LDA $4ca0,x ; (f256k_color + 0)
.s55:
19f3 : 85 3c __ STA T1 + 3 
19f5 : a5 35 __ LDA T0 + 0 
19f7 : 85 29 __ STA ACCU + 0 
19f9 : a5 36 __ LDA T0 + 1 
19fb : 85 2a __ STA ACCU + 1 
19fd : a5 37 __ LDA T0 + 2 
19ff : 85 2b __ STA ACCU + 2 
1a01 : a5 38 __ LDA T0 + 3 
1a03 : 85 2c __ STA ACCU + 3 
1a05 : a2 39 __ LDX #$39
1a07 : 20 83 45 JSR $4583 ; (freg + 4)
1a0a : 20 ca 45 JSR $45ca ; (faddsub + 6)
1a0d : a5 2a __ LDA ACCU + 1 
1a0f : 85 24 __ STA P9 ; (f + 1)
1a11 : a5 2b __ LDA ACCU + 2 
1a13 : 85 25 __ STA P10 ; (f + 2)
1a15 : a6 29 __ LDX ACCU + 0 
1a17 : a5 2c __ LDA ACCU + 3 
1a19 : 85 26 __ STA P11 ; (f + 3)
1a1b : 10 03 __ BPL $1a20 ; (nformf.s57 + 0)
1a1d : 4c 2b 18 JMP $182b ; (nformf.s18 + 0)
.s57:
1a20 : c9 41 __ CMP #$41
1a22 : d0 0d __ BNE $1a31 ; (nformf.s61 + 0)
.s58:
1a24 : a5 25 __ LDA P10 ; (f + 2)
1a26 : c9 20 __ CMP #$20
1a28 : d0 07 __ BNE $1a31 ; (nformf.s61 + 0)
.s59:
1a2a : a5 24 __ LDA P9 ; (f + 1)
1a2c : d0 03 __ BNE $1a31 ; (nformf.s61 + 0)
.s60:
1a2e : 8a __ __ TXA
1a2f : f0 02 __ BEQ $1a33 ; (nformf.s56 + 0)
.s61:
1a31 : 90 ea __ BCC $1a1d ; (nformf.s55 + 42)
.s56:
1a33 : a9 00 __ LDA #$00
1a35 : 85 11 __ STA WORK + 0 
1a37 : 85 12 __ STA WORK + 1 
1a39 : a9 20 __ LDA #$20
1a3b : 85 13 __ STA WORK + 2 
1a3d : a9 41 __ LDA #$41
1a3f : 85 14 __ STA WORK + 3 
1a41 : 20 93 45 JSR $4593 ; (freg + 20)
1a44 : 20 79 47 JSR $4779 ; (crt_fdiv + 0)
1a47 : a5 2a __ LDA ACCU + 1 
1a49 : 85 24 __ STA P9 ; (f + 1)
1a4b : a5 2b __ LDA ACCU + 2 
1a4d : 85 25 __ STA P10 ; (f + 2)
1a4f : a5 2c __ LDA ACCU + 3 
1a51 : 85 26 __ STA P11 ; (f + 3)
1a53 : a6 29 __ LDX ACCU + 0 
1a55 : e6 41 __ INC T4 + 0 
1a57 : d0 c4 __ BNE $1a1d ; (nformf.s55 + 42)
.s117:
1a59 : e6 42 __ INC T4 + 1 
1a5b : 4c 2b 18 JMP $182b ; (nformf.s18 + 0)
.s102:
1a5e : 86 35 __ STX T0 + 0 
1a60 : 85 39 __ STA T1 + 0 
1a62 : a0 03 __ LDY #$03
1a64 : b1 1f __ LDA (P4),y ; (si + 0)
1a66 : 18 __ __ CLC
1a67 : 69 08 __ ADC #$08
1a69 : a4 35 __ LDY T0 + 0 
1a6b : 91 21 __ STA (P6),y ; (str + 0)
1a6d : 18 __ __ CLC
1a6e : a0 03 __ LDY #$03
1a70 : b1 1f __ LDA (P4),y ; (si + 0)
1a72 : 69 0d __ ADC #$0d
1a74 : a4 35 __ LDY T0 + 0 
1a76 : c8 __ __ INY
1a77 : 91 21 __ STA (P6),y ; (str + 0)
1a79 : a0 03 __ LDY #$03
1a7b : b1 1f __ LDA (P4),y ; (si + 0)
1a7d : 18 __ __ CLC
1a7e : 69 05 __ ADC #$05
1a80 : a4 39 __ LDY T1 + 0 
1a82 : 91 21 __ STA (P6),y ; (str + 0)
1a84 : 18 __ __ CLC
1a85 : a5 46 __ LDA T9 + 0 
1a87 : 69 03 __ ADC #$03
1a89 : 85 46 __ STA T9 + 0 
1a8b : 4c 3d 19 JMP $193d ; (nformf.s27 + 0)
.s104:
1a8e : 20 9f 1a JSR $1a9f ; (isinf.s4 + 0)
1a91 : a2 01 __ LDX #$01
1a93 : 86 46 __ STX T9 + 0 
1a95 : a8 __ __ TAY
1a96 : d0 03 __ BNE $1a9b ; (nformf.s105 + 0)
1a98 : 4c b2 15 JMP $15b2 ; (nformf.s7 + 0)
.s105:
1a9b : a9 03 __ LDA #$03
1a9d : d0 bf __ BNE $1a5e ; (nformf.s102 + 0)
--------------------------------------------------------------------
isinf: ; isinf(float)->bool
;  26, "/mnt/d/F256/oscar64/include/math.h"
.s4:
1a9f : 06 1d __ ASL P2 ; (f + 2)
1aa1 : a5 1e __ LDA P3 ; (f + 3)
1aa3 : 2a __ __ ROL
1aa4 : c9 ff __ CMP #$ff
1aa6 : d0 03 __ BNE $1aab ; (isinf.s6 + 0)
.s5:
1aa8 : a9 01 __ LDA #$01
1aaa : 60 __ __ RTS
.s6:
1aab : a9 00 __ LDA #$00
.s3:
1aad : 60 __ __ RTS
--------------------------------------------------------------------
1aae : __ __ __ BYT 4d 4f 44 20 50 6c 61 79 65 72 20 20 20 20 20 20 : MOD Player      
1abe : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
1ace : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 00                :           .
--------------------------------------------------------------------
_kernelCallWrapper: ; _kernelCallWrapper()->u8
;  56, "/mnt/d/F256/f256lib-oscar64/f256lib/f_kernel.h"
.s4:
1ad9 : 20 e1 1a JSR $1ae1 ; (_kernelCallRaw + 0)
1adc : 85 29 __ STA ACCU + 0 
.s3:
1ade : a5 29 __ LDA ACCU + 0 
1ae0 : 60 __ __ RTS
--------------------------------------------------------------------
_kernelCallRaw: ; _kernelCallRaw
1ae1 : ad c0 4d LDA $4dc0 ; (_kern_target + 0)
1ae4 : 8d ee 1a STA $1aee ; (_kernelCallRaw + 13)
1ae7 : ad c1 4d LDA $4dc1 ; (_kern_target + 1)
1aea : 8d ef 1a STA $1aef ; (_kernelCallRaw + 14)
1aed : 20 00 00 JSR $0000 
1af0 : aa __ __ TAX
1af1 : a9 00 __ LDA #$00
1af3 : 6a __ __ ROR
1af4 : 8d c2 4d STA $4dc2 ; (_kernelError + 0)
1af7 : 8a __ __ TXA
1af8 : 60 __ __ RTS
--------------------------------------------------------------------
1af9 : __ __ __ BYT 30 3a 00                                        : 0:.
--------------------------------------------------------------------
1afc : __ __ __ BYT 2e 00                                           : ..
--------------------------------------------------------------------
1afe : __ __ __ BYT 20 00                                           :  .
--------------------------------------------------------------------
1b00 : __ __ __ BYT 20 20 20 20 20 43 72 65 61 74 65 64 20 62 79 20 :      Created by 
1b10 : __ __ __ BYT 4d 75 30 6e 2c 20 4d 61 79 20 32 30 32 36 20 76 : Mu0n, May 2026 v
1b20 : __ __ __ BYT 30 2e 31 20 20 20 20 20 20 20 00                : 0.1       .
--------------------------------------------------------------------
fileClose: ; fileClose(u8*)->i8
;  22, "/mnt/d/F256/f256lib-oscar64/f256lib/f_file.h"
.s4:
1b2b : a9 68 __ LDA #$68
1b2d : 8d c0 4d STA $4dc0 ; (_kern_target + 0)
1b30 : a9 ff __ LDA #$ff
1b32 : 8d c1 4d STA $4dc1 ; (_kern_target + 1)
1b35 : ad f1 4c LDA $4cf1 ; (kernelArgs + 0)
1b38 : 85 35 __ STA T0 + 0 
1b3a : ad f2 4c LDA $4cf2 ; (kernelArgs + 1)
1b3d : 85 36 __ STA T0 + 1 
1b3f : a0 00 __ LDY #$00
1b41 : b1 1b __ LDA (P0),y ; (fd + 0)
1b43 : a0 03 __ LDY #$03
1b45 : 91 35 __ STA (T0 + 0),y 
1b47 : 20 d9 1a JSR $1ad9 ; (_kernelCallWrapper.s4 + 0)
1b4a : a5 1b __ LDA P0 ; (fd + 0)
1b4c : 85 29 __ STA ACCU + 0 
1b4e : a5 1c __ LDA P1 ; (fd + 1)
1b50 : 85 2a __ STA ACCU + 1 
1b52 : 20 d1 4b JSR $4bd1 ; (crt_free + 0)
.l5:
1b55 : 20 66 1b JSR $1b66 ; (kernelNextEvent.s4 + 0)
1b58 : ad f3 4c LDA $4cf3 ; (kernelEventData.type + 0)
1b5b : c9 32 __ CMP #$32
1b5d : f0 04 __ BEQ $1b63 ; (fileClose.s7 + 0)
.s6:
1b5f : c9 38 __ CMP #$38
1b61 : d0 f2 __ BNE $1b55 ; (fileClose.l5 + 0)
.s7:
1b63 : a9 ff __ LDA #$ff
.s3:
1b65 : 60 __ __ RTS
--------------------------------------------------------------------
kernelNextEvent: ; kernelNextEvent()->u8
;  66, "/mnt/d/F256/f256lib-oscar64/f256lib/f_kernel.h"
.s4:
1b66 : a9 00 __ LDA #$00
1b68 : 8d c0 4d STA $4dc0 ; (_kern_target + 0)
1b6b : 8d f3 4c STA $4cf3 ; (kernelEventData.type + 0)
1b6e : a9 ff __ LDA #$ff
1b70 : 8d c1 4d STA $4dc1 ; (_kern_target + 1)
1b73 : 4c d9 1a JMP $1ad9 ; (_kernelCallWrapper.s4 + 0)
--------------------------------------------------------------------
fetchNextPLEntry: ; fetchNextPLEntry(u8*,u16*,u16)->void
; 214, "/mnt/d/F256/f256lib-oscar64/doodles/modplayer/src/modplayer.c"
.s4:
1b76 : ad e0 9f LDA $9fe0 ; (sstack + 9)
1b79 : 85 42 __ STA T2 + 1 
1b7b : ad df 9f LDA $9fdf ; (sstack + 8)
1b7e : 85 41 __ STA T2 + 0 
1b80 : d0 04 __ BNE $1b86 ; (fetchNextPLEntry.s5 + 0)
.s8:
1b82 : a5 42 __ LDA T2 + 1 
1b84 : f0 6b __ BEQ $1bf1 ; (fetchNextPLEntry.s3 + 0)
.s5:
1b86 : a9 00 __ LDA #$00
1b88 : a2 77 __ LDX #$77
.l9:
1b8a : 9d 00 4e STA $4e00,x ; (name[0] + 0)
1b8d : ca __ __ DEX
1b8e : 10 fa __ BPL $1b8a ; (fetchNextPLEntry.l9 + 0)
.s10:
1b90 : a5 41 __ LDA T2 + 0 
1b92 : 8d d9 9f STA $9fd9 ; (sstack + 2)
1b95 : a5 42 __ LDA T2 + 1 
1b97 : 8d da 9f STA $9fda ; (sstack + 3)
1b9a : a9 78 __ LDA #$78
1b9c : 8d dd 9f STA $9fdd ; (sstack + 6)
1b9f : a9 00 __ LDA #$00
1ba1 : 8d de 9f STA $9fde ; (sstack + 7)
1ba4 : a9 00 __ LDA #$00
1ba6 : 8d db 9f STA $9fdb ; (sstack + 4)
1ba9 : a9 4e __ LDA #$4e
1bab : 8d dc 9f STA $9fdc ; (sstack + 5)
1bae : 20 f2 1b JSR $1bf2 ; (readLine.s4 + 0)
1bb1 : a9 01 __ LDA #$01
1bb3 : 85 1d __ STA P2 
1bb5 : 20 51 0b JSR $0b51 ; (lilpause.s4 + 0)
1bb8 : ad e1 9f LDA $9fe1 ; (sstack + 10)
1bbb : 85 43 __ STA T3 + 0 
1bbd : ad e2 9f LDA $9fe2 ; (sstack + 11)
1bc0 : 85 44 __ STA T3 + 1 
1bc2 : a0 01 __ LDY #$01
1bc4 : b1 43 __ LDA (T3 + 0),y 
1bc6 : cd e4 9f CMP $9fe4 ; (sstack + 13)
1bc9 : d0 26 __ BNE $1bf1 ; (fetchNextPLEntry.s3 + 0)
.s7:
1bcb : 88 __ __ DEY
1bcc : b1 43 __ LDA (T3 + 0),y 
1bce : cd e3 9f CMP $9fe3 ; (sstack + 12)
1bd1 : d0 1e __ BNE $1bf1 ; (fetchNextPLEntry.s3 + 0)
.s6:
1bd3 : a5 41 __ LDA T2 + 0 
1bd5 : 85 1b __ STA P0 
1bd7 : a5 42 __ LDA T2 + 1 
1bd9 : 85 1c __ STA P1 
1bdb : 98 __ __ TYA
1bdc : c6 1d __ DEC P2 
1bde : 85 1e __ STA P3 
1be0 : 85 1f __ STA P4 
1be2 : 85 20 __ STA P5 
1be4 : 85 21 __ STA P6 
1be6 : 20 27 1e JSR $1e27 ; (fileSeek.s4 + 0)
1be9 : a9 00 __ LDA #$00
1beb : a8 __ __ TAY
1bec : 91 43 __ STA (T3 + 0),y 
1bee : c8 __ __ INY
1bef : 91 43 __ STA (T3 + 0),y 
.s3:
1bf1 : 60 __ __ RTS
--------------------------------------------------------------------
readLine: ; readLine(u8*,u8*,i16)->i16
; 192, "/mnt/d/F256/f256lib-oscar64/doodles/modplayer/src/modplayer.c"
.s4:
1bf2 : a9 00 __ LDA #$00
1bf4 : 85 3d __ STA T1 + 0 
1bf6 : 85 3e __ STA T1 + 1 
1bf8 : ad d9 9f LDA $9fd9 ; (sstack + 2)
1bfb : 85 3f __ STA T2 + 0 
1bfd : ad da 9f LDA $9fda ; (sstack + 3)
1c00 : 85 40 __ STA T2 + 1 
.l5:
1c02 : a9 01 __ LDA #$01
1c04 : 85 22 __ STA P7 
1c06 : 85 24 __ STA P9 
1c08 : a9 00 __ LDA #$00
1c0a : 85 23 __ STA P8 
1c0c : 85 25 __ STA P10 
1c0e : a5 3f __ LDA T2 + 0 
1c10 : 8d d7 9f STA $9fd7 ; (sstack + 0)
1c13 : a5 40 __ LDA T2 + 1 
1c15 : 8d d8 9f STA $9fd8 ; (sstack + 1)
1c18 : a9 d6 __ LDA #$d6
1c1a : 85 20 __ STA P5 
1c1c : a9 9f __ LDA #$9f
1c1e : 85 21 __ STA P6 
1c20 : 20 a2 1c JSR $1ca2 ; (fileRead.s4 + 0)
1c23 : a5 2a __ LDA ACCU + 1 ; (fp + 1)
1c25 : d0 49 __ BNE $1c70 ; (readLine.s6 + 0)
.s17:
1c27 : a4 29 __ LDY ACCU + 0 ; (fp + 0)
1c29 : 88 __ __ DEY
1c2a : d0 44 __ BNE $1c70 ; (readLine.s6 + 0)
.s10:
1c2c : ad d6 9f LDA $9fd6 ; (c + 0)
1c2f : c9 0a __ CMP #$0a
1c31 : f0 cf __ BEQ $1c02 ; (readLine.l5 + 0)
.s11:
1c33 : c9 0d __ CMP #$0d
1c35 : f0 39 __ BEQ $1c70 ; (readLine.s6 + 0)
.s12:
1c37 : ad dd 9f LDA $9fdd ; (sstack + 6)
1c3a : 38 __ __ SEC
1c3b : e9 01 __ SBC #$01
1c3d : 85 35 __ STA T0 + 0 
1c3f : ad de 9f LDA $9fde ; (sstack + 7)
1c42 : e9 00 __ SBC #$00
1c44 : 30 bc __ BMI $1c02 ; (readLine.l5 + 0)
.s16:
1c46 : 85 36 __ STA T0 + 1 
1c48 : a5 3e __ LDA T1 + 1 
1c4a : c5 36 __ CMP T0 + 1 
1c4c : d0 04 __ BNE $1c52 ; (readLine.s15 + 0)
.s14:
1c4e : a5 3d __ LDA T1 + 0 
1c50 : c5 35 __ CMP T0 + 0 
.s15:
1c52 : b0 ae __ BCS $1c02 ; (readLine.l5 + 0)
.s13:
1c54 : ad db 9f LDA $9fdb ; (sstack + 4)
1c57 : 65 3d __ ADC T1 + 0 
1c59 : 85 35 __ STA T0 + 0 
1c5b : ad dc 9f LDA $9fdc ; (sstack + 5)
1c5e : 65 3e __ ADC T1 + 1 
1c60 : 85 36 __ STA T0 + 1 
1c62 : ad d6 9f LDA $9fd6 ; (c + 0)
1c65 : 91 35 __ STA (T0 + 0),y 
1c67 : e6 3d __ INC T1 + 0 
1c69 : d0 97 __ BNE $1c02 ; (readLine.l5 + 0)
.s18:
1c6b : e6 3e __ INC T1 + 1 
1c6d : 4c 02 1c JMP $1c02 ; (readLine.l5 + 0)
.s6:
1c70 : a5 3d __ LDA T1 + 0 
1c72 : 05 3e __ ORA T1 + 1 
1c74 : d0 0b __ BNE $1c81 ; (readLine.s7 + 0)
.s8:
1c76 : 85 3d __ STA T1 + 0 
1c78 : 85 3e __ STA T1 + 1 
1c7a : ad d6 9f LDA $9fd6 ; (c + 0)
1c7d : c9 0d __ CMP #$0d
1c7f : d0 1a __ BNE $1c9b ; (readLine.s9 + 0)
.s7:
1c81 : ad db 9f LDA $9fdb ; (sstack + 4)
1c84 : 18 __ __ CLC
1c85 : 65 3d __ ADC T1 + 0 
1c87 : 85 35 __ STA T0 + 0 
1c89 : ad dc 9f LDA $9fdc ; (sstack + 5)
1c8c : 65 3e __ ADC T1 + 1 
1c8e : 85 36 __ STA T0 + 1 
1c90 : a9 01 __ LDA #$01
1c92 : 85 29 __ STA ACCU + 0 ; (fp + 0)
1c94 : a9 00 __ LDA #$00
1c96 : a8 __ __ TAY
1c97 : 91 35 __ STA (T0 + 0),y 
1c99 : f0 04 __ BEQ $1c9f ; (readLine.s3 + 0)
.s9:
1c9b : a9 00 __ LDA #$00
1c9d : 85 29 __ STA ACCU + 0 ; (fp + 0)
.s3:
1c9f : 85 2a __ STA ACCU + 1 ; (fp + 1)
1ca1 : 60 __ __ RTS
--------------------------------------------------------------------
fileRead: ; fileRead(void*,u16,u16,u8*)->i16
;  27, "/mnt/d/F256/f256lib-oscar64/f256lib/f_file.h"
.s4:
1ca2 : a9 00 __ LDA #$00
1ca4 : 85 37 __ STA T1 + 0 
1ca6 : 85 38 __ STA T1 + 1 
1ca8 : a5 22 __ LDA P7 ; (nbytes + 0)
1caa : 85 11 __ STA WORK + 0 
1cac : a5 23 __ LDA P8 ; (nbytes + 1)
1cae : 85 12 __ STA WORK + 1 
1cb0 : a5 24 __ LDA P9 ; (nmemb + 0)
1cb2 : 85 29 __ STA ACCU + 0 
1cb4 : a5 25 __ LDA P10 ; (nmemb + 1)
1cb6 : 85 2a __ STA ACCU + 1 
1cb8 : 20 27 48 JSR $4827 ; (mul16 + 0)
1cbb : a5 14 __ LDA WORK + 3 
1cbd : 05 13 __ ORA WORK + 2 
1cbf : f0 67 __ BEQ $1d28 ; (fileRead.s13 + 0)
.s6:
1cc1 : a5 14 __ LDA WORK + 3 
1cc3 : 85 3a __ STA T3 + 1 
1cc5 : a5 13 __ LDA WORK + 2 
1cc7 : 85 39 __ STA T3 + 0 
1cc9 : ad d7 9f LDA $9fd7 ; (sstack + 0)
1ccc : 85 3b __ STA T5 + 0 
1cce : ad d8 9f LDA $9fd8 ; (sstack + 1)
1cd1 : 85 3c __ STA T5 + 1 
.l7:
1cd3 : a0 00 __ LDY #$00
1cd5 : b1 3b __ LDA (T5 + 0),y 
1cd7 : 85 1b __ STA P0 
1cd9 : 18 __ __ CLC
1cda : a5 20 __ LDA P5 ; (buf + 0)
1cdc : 65 37 __ ADC T1 + 0 
1cde : 85 1c __ STA P1 
1ce0 : a5 21 __ LDA P6 ; (buf + 1)
1ce2 : 65 38 __ ADC T1 + 1 
1ce4 : 85 1d __ STA P2 
1ce6 : 38 __ __ SEC
1ce7 : a5 39 __ LDA T3 + 0 
1ce9 : e5 37 __ SBC T1 + 0 
1ceb : 85 1e __ STA P3 
1ced : a5 3a __ LDA T3 + 1 
1cef : e5 38 __ SBC T1 + 1 
1cf1 : 85 1f __ STA P4 
1cf3 : 20 34 1d JSR $1d34 ; (kernelRead.s4 + 0)
1cf6 : a5 2a __ LDA ACCU + 1 
1cf8 : 30 33 __ BMI $1d2d ; (fileRead.s11 + 0)
.s8:
1cfa : 05 29 __ ORA ACCU + 0 
1cfc : f0 2a __ BEQ $1d28 ; (fileRead.s13 + 0)
.s9:
1cfe : 18 __ __ CLC
1cff : a5 37 __ LDA T1 + 0 
1d01 : 65 29 __ ADC ACCU + 0 
1d03 : 85 37 __ STA T1 + 0 
1d05 : a5 38 __ LDA T1 + 1 
1d07 : 65 2a __ ADC ACCU + 1 
1d09 : 85 38 __ STA T1 + 1 
1d0b : c5 3a __ CMP T3 + 1 
1d0d : 90 c4 __ BCC $1cd3 ; (fileRead.l7 + 0)
.s12:
1d0f : d0 17 __ BNE $1d28 ; (fileRead.s13 + 0)
.s10:
1d11 : a5 37 __ LDA T1 + 0 
1d13 : c5 39 __ CMP T3 + 0 
1d15 : 90 bc __ BCC $1cd3 ; (fileRead.l7 + 0)
.s5:
1d17 : 85 29 __ STA ACCU + 0 
1d19 : a5 38 __ LDA T1 + 1 
1d1b : 85 2a __ STA ACCU + 1 
1d1d : a5 22 __ LDA P7 ; (nbytes + 0)
1d1f : 85 11 __ STA WORK + 0 
1d21 : a5 23 __ LDA P8 ; (nbytes + 1)
1d23 : 85 12 __ STA WORK + 1 
1d25 : 4c a3 48 JMP $48a3 ; (divmod + 0)
.s13:
1d28 : a5 37 __ LDA T1 + 0 
1d2a : 4c 17 1d JMP $1d17 ; (fileRead.s5 + 0)
.s11:
1d2d : a9 ff __ LDA #$ff
1d2f : 85 29 __ STA ACCU + 0 
1d31 : 85 2a __ STA ACCU + 1 
.s3:
1d33 : 60 __ __ RTS
--------------------------------------------------------------------
kernelRead: ; kernelRead(u8,void*,u16)->i16
;  31, "/mnt/d/F256/f256lib-oscar64/f256lib/f_file.c"
.s4:
1d34 : a5 1b __ LDA P0 ; (fd + 0)
1d36 : d0 12 __ BNE $1d4a ; (kernelRead.s6 + 0)
.s5:
1d38 : 20 c9 1d JSR $1dc9 ; (f256getchar.l4 + 0)
1d3b : a5 29 __ LDA ACCU + 0 
1d3d : a0 00 __ LDY #$00
1d3f : 91 1c __ STA (P1),y ; (buf + 0)
1d41 : a9 01 __ LDA #$01
.s20:
1d43 : 85 29 __ STA ACCU + 0 
1d45 : a9 00 __ LDA #$00
.s3:
1d47 : 85 2a __ STA ACCU + 1 
1d49 : 60 __ __ RTS
.s6:
1d4a : a2 60 __ LDX #$60
1d4c : 8e c0 4d STX $4dc0 ; (_kern_target + 0)
1d4f : a2 ff __ LDX #$ff
1d51 : 8e c1 4d STX $4dc1 ; (_kern_target + 1)
1d54 : ae f1 4c LDX $4cf1 ; (kernelArgs + 0)
1d57 : 86 35 __ STX T1 + 0 
1d59 : ae f2 4c LDX $4cf2 ; (kernelArgs + 1)
1d5c : 86 36 __ STX T1 + 1 
1d5e : a0 03 __ LDY #$03
1d60 : 91 35 __ STA (T1 + 0),y 
1d62 : a9 01 __ LDA #$01
1d64 : c5 1f __ CMP P4 ; (nbytes + 1)
1d66 : f0 04 __ BEQ $1d6c ; (kernelRead.s16 + 0)
.s17:
1d68 : 90 06 __ BCC $1d70 ; (kernelRead.s15 + 0)
1d6a : b0 08 __ BCS $1d74 ; (kernelRead.s7 + 0)
.s16:
1d6c : a5 1e __ LDA P3 ; (nbytes + 0)
1d6e : f0 04 __ BEQ $1d74 ; (kernelRead.s7 + 0)
.s15:
1d70 : a9 00 __ LDA #$00
1d72 : f0 02 __ BEQ $1d76 ; (kernelRead.s18 + 0)
.s7:
1d74 : a5 1e __ LDA P3 ; (nbytes + 0)
.s18:
1d76 : a0 04 __ LDY #$04
1d78 : 91 35 __ STA (T1 + 0),y 
1d7a : 20 d9 1a JSR $1ad9 ; (_kernelCallWrapper.s4 + 0)
1d7d : ad c2 4d LDA $4dc2 ; (_kernelError + 0)
1d80 : d0 12 __ BNE $1d94 ; (kernelRead.s11 + 0)
.l8:
1d82 : 20 66 1b JSR $1b66 ; (kernelNextEvent.s4 + 0)
1d85 : ad f3 4c LDA $4cf3 ; (kernelEventData.type + 0)
1d88 : c9 2c __ CMP #$2c
1d8a : f0 13 __ BEQ $1d9f ; (kernelRead.s13 + 0)
.s9:
1d8c : c9 30 __ CMP #$30
1d8e : f0 0b __ BEQ $1d9b ; (kernelRead.s12 + 0)
.s10:
1d90 : c9 38 __ CMP #$38
1d92 : d0 ee __ BNE $1d82 ; (kernelRead.l8 + 0)
.s11:
1d94 : a9 ff __ LDA #$ff
.s19:
1d96 : 85 29 __ STA ACCU + 0 
1d98 : 4c 47 1d JMP $1d47 ; (kernelRead.s3 + 0)
.s12:
1d9b : a9 00 __ LDA #$00
1d9d : f0 f7 __ BEQ $1d96 ; (kernelRead.s19 + 0)
.s13:
1d9f : a5 1c __ LDA P1 ; (buf + 0)
1da1 : a0 0b __ LDY #$0b
1da3 : 91 35 __ STA (T1 + 0),y 
1da5 : a9 04 __ LDA #$04
1da7 : 8d c0 4d STA $4dc0 ; (_kern_target + 0)
1daa : a9 ff __ LDA #$ff
1dac : 8d c1 4d STA $4dc1 ; (_kern_target + 1)
1daf : a5 1d __ LDA P2 ; (buf + 1)
1db1 : c8 __ __ INY
1db2 : 91 35 __ STA (T1 + 0),y 
1db4 : ad f9 4c LDA $4cf9 ; (kernelEventData.u + 3)
1db7 : c8 __ __ INY
1db8 : 91 35 __ STA (T1 + 0),y 
1dba : 20 d9 1a JSR $1ad9 ; (_kernelCallWrapper.s4 + 0)
1dbd : ad f9 4c LDA $4cf9 ; (kernelEventData.u + 3)
1dc0 : d0 81 __ BNE $1d43 ; (kernelRead.s20 + 0)
.s14:
1dc2 : 85 29 __ STA ACCU + 0 
1dc4 : a9 01 __ LDA #$01
1dc6 : 4c 47 1d JMP $1d47 ; (kernelRead.s3 + 0)
--------------------------------------------------------------------
f256getchar: ; f256getchar()->i16
;  18, "/mnt/d/F256/f256lib-oscar64/f256lib/f_platform.h"
.l4:
1dc9 : 20 f7 1d JSR $1df7 ; (kernelNextEvent.s4 + 0)
1dcc : ad c2 4d LDA $4dc2 ; (_kernelError + 0)
1dcf : f0 10 __ BEQ $1de1 ; (f256getchar.s5 + 0)
.s8:
1dd1 : a9 0c __ LDA #$0c
1dd3 : 8d c0 4d STA $4dc0 ; (_kern_target + 0)
1dd6 : a9 ff __ LDA #$ff
1dd8 : 8d c1 4d STA $4dc1 ; (_kern_target + 1)
1ddb : 20 07 1e JSR $1e07 ; (_kernelCallWrapper.s4 + 0)
1dde : 4c c9 1d JMP $1dc9 ; (f256getchar.l4 + 0)
.s5:
1de1 : ad f3 4c LDA $4cf3 ; (kernelEventData.type + 0)
1de4 : c9 08 __ CMP #$08
1de6 : d0 e1 __ BNE $1dc9 ; (f256getchar.l4 + 0)
.s6:
1de8 : ad f9 4c LDA $4cf9 ; (kernelEventData.u + 3)
1deb : d0 dc __ BNE $1dc9 ; (f256getchar.l4 + 0)
.s7:
1ded : ad f8 4c LDA $4cf8 ; (kernelEventData.u + 2)
1df0 : 85 29 __ STA ACCU + 0 
1df2 : a9 00 __ LDA #$00
1df4 : 85 2a __ STA ACCU + 1 
.s3:
1df6 : 60 __ __ RTS
--------------------------------------------------------------------
kernelNextEvent: ; kernelNextEvent()->u8
;  66, "/mnt/d/F256/f256lib-oscar64/f256lib/f_kernel.h"
.s4:
1df7 : a9 00 __ LDA #$00
1df9 : 8d c0 4d STA $4dc0 ; (_kern_target + 0)
1dfc : 8d f3 4c STA $4cf3 ; (kernelEventData.type + 0)
1dff : a9 ff __ LDA #$ff
1e01 : 8d c1 4d STA $4dc1 ; (_kern_target + 1)
1e04 : 4c 07 1e JMP $1e07 ; (_kernelCallWrapper.s4 + 0)
--------------------------------------------------------------------
_kernelCallWrapper: ; _kernelCallWrapper()->u8
;  56, "/mnt/d/F256/f256lib-oscar64/f256lib/f_kernel.h"
.s4:
1e07 : 20 0f 1e JSR $1e0f ; (_kernelCallRaw + 0)
1e0a : 85 29 __ STA ACCU + 0 
.s3:
1e0c : a5 29 __ LDA ACCU + 0 
1e0e : 60 __ __ RTS
--------------------------------------------------------------------
_kernelCallRaw: ; _kernelCallRaw
1e0f : ad c0 4d LDA $4dc0 ; (_kern_target + 0)
1e12 : 8d 1c 1e STA $1e1c ; (_kernelCallRaw + 13)
1e15 : ad c1 4d LDA $4dc1 ; (_kern_target + 1)
1e18 : 8d 1d 1e STA $1e1d ; (_kernelCallRaw + 14)
1e1b : 20 00 00 JSR $0000 
1e1e : aa __ __ TAX
1e1f : a9 00 __ LDA #$00
1e21 : 6a __ __ ROR
1e22 : 8d c2 4d STA $4dc2 ; (_kernelError + 0)
1e25 : 8a __ __ TXA
1e26 : 60 __ __ RTS
--------------------------------------------------------------------
fileSeek: ; fileSeek(u8*,u32,u8)->i8
;  32, "/mnt/d/F256/f256lib-oscar64/f256lib/f_file.h"
.s4:
1e27 : a5 21 __ LDA P6 ; (whence + 0)
1e29 : d0 38 __ BNE $1e63 ; (fileSeek.s6 + 0)
.s5:
1e2b : a9 74 __ LDA #$74
1e2d : 8d c0 4d STA $4dc0 ; (_kern_target + 0)
1e30 : a9 ff __ LDA #$ff
1e32 : 8d c1 4d STA $4dc1 ; (_kern_target + 1)
1e35 : ad f1 4c LDA $4cf1 ; (kernelArgs + 0)
1e38 : 85 35 __ STA T1 + 0 
1e3a : ad f2 4c LDA $4cf2 ; (kernelArgs + 1)
1e3d : 85 36 __ STA T1 + 1 
1e3f : a0 00 __ LDY #$00
1e41 : b1 1b __ LDA (P0),y ; (fd + 0)
1e43 : a0 03 __ LDY #$03
1e45 : 91 35 __ STA (T1 + 0),y 
1e47 : a5 1d __ LDA P2 ; (offset + 0)
1e49 : c8 __ __ INY
1e4a : 91 35 __ STA (T1 + 0),y 
1e4c : a5 1e __ LDA P3 ; (offset + 1)
1e4e : c8 __ __ INY
1e4f : 91 35 __ STA (T1 + 0),y 
1e51 : a5 1f __ LDA P4 ; (offset + 2)
1e53 : c8 __ __ INY
1e54 : 91 35 __ STA (T1 + 0),y 
1e56 : a5 20 __ LDA P5 ; (offset + 3)
1e58 : c8 __ __ INY
1e59 : 91 35 __ STA (T1 + 0),y 
1e5b : 20 d9 1a JSR $1ad9 ; (_kernelCallWrapper.s4 + 0)
1e5e : ad c2 4d LDA $4dc2 ; (_kernelError + 0)
1e61 : f0 02 __ BEQ $1e65 ; (fileSeek.s3 + 0)
.s6:
1e63 : a9 ff __ LDA #$ff
.s3:
1e65 : 85 29 __ STA ACCU + 0 
1e67 : 60 __ __ RTS
--------------------------------------------------------------------
getTheFile_far: ; getTheFile_far(u8*)->u8
;  83, "/mnt/d/F256/f256lib-oscar64/doodles/modplayer/src/muFilePicker.h"
.s1:
1e68 : a5 55 __ LDA T1 + 0 
1e6a : 8d 75 9c STA $9c75 ; (getTheFile_far@stack + 0)
.s4:
1e6d : a9 2f __ LDA #$2f
1e6f : 85 1f __ STA P4 
1e71 : a9 9d __ LDA #$9d
1e73 : 85 20 __ STA P5 
1e75 : 20 49 1f JSR $1f49 ; (fpr_get_currentPath.s4 + 0)
1e78 : a9 2f __ LDA #$2f
1e7a : 85 21 __ STA P6 
1e7c : a9 9d __ LDA #$9d
1e7e : 85 22 __ STA P7 
1e80 : 20 a9 1f JSR $1fa9 ; (fileOpenDir.s4 + 0)
1e83 : a5 29 __ LDA ACCU + 0 
1e85 : d0 14 __ BNE $1e9b ; (getTheFile_far.s11 + 0)
.s12:
1e87 : a5 2a __ LDA ACCU + 1 
1e89 : d0 0e __ BNE $1e99 ; (getTheFile_far.s13 + 0)
.s5:
1e8b : a9 f9 __ LDA #$f9
1e8d : 85 20 __ STA P5 
1e8f : a9 1a __ LDA #$1a
1e91 : 85 21 __ STA P6 
1e93 : 20 28 0a JSR $0a28 ; (fpr_set_currentPath.s4 + 0)
1e96 : 4c a4 1e JMP $1ea4 ; (getTheFile_far.s6 + 0)
.s13:
1e99 : a9 00 __ LDA #$00
.s11:
1e9b : 85 1b __ STA P0 
1e9d : a5 2a __ LDA ACCU + 1 
1e9f : 85 1c __ STA P1 
1ea1 : 20 95 20 JSR $2095 ; (fileCloseDir.s4 + 0)
.s6:
1ea4 : a9 2a __ LDA #$2a
1ea6 : 8d f5 9f STA $9ff5 ; (sstack + 30)
1ea9 : 8d f7 9f STA $9ff7 ; (sstack + 32)
1eac : a9 00 __ LDA #$00
1eae : 8d ef 9f STA $9fef ; (sstack + 24)
1eb1 : a9 03 __ LDA #$03
1eb3 : 8d f0 9f STA $9ff0 ; (sstack + 25)
1eb6 : a9 01 __ LDA #$01
1eb8 : 8d f9 9f STA $9ff9 ; (sstack + 34)
1ebb : a9 22 __ LDA #$22
1ebd : 8d f1 9f STA $9ff1 ; (sstack + 26)
1ec0 : a9 36 __ LDA #$36
1ec2 : 8d f2 9f STA $9ff2 ; (sstack + 27)
1ec5 : a9 26 __ LDA #$26
1ec7 : 8d f3 9f STA $9ff3 ; (sstack + 28)
1eca : a9 36 __ LDA #$36
1ecc : 8d f4 9f STA $9ff4 ; (sstack + 29)
1ecf : a9 36 __ LDA #$36
1ed1 : 8d f6 9f STA $9ff6 ; (sstack + 31)
1ed4 : 8d f8 9f STA $9ff8 ; (sstack + 33)
1ed7 : 20 d7 20 JSR $20d7 ; (filePickModal_far.s1 + 0)
1eda : a5 29 __ LDA ACCU + 0 
1edc : c9 01 __ CMP #$01
1ede : f0 61 __ BEQ $1f41 ; (getTheFile_far.s3 + 0)
.s7:
1ee0 : a9 f3 __ LDA #$f3
1ee2 : 85 1f __ STA P4 
1ee4 : a9 9c __ LDA #$9c
1ee6 : 85 20 __ STA P5 
1ee8 : 20 49 1f JSR $1f49 ; (fpr_get_currentPath.s4 + 0)
1eeb : a9 00 __ LDA #$00
1eed : 85 55 __ STA T1 + 0 
1eef : 18 __ __ CLC
.l8:
1ef0 : 69 3e __ ADC #$3e
1ef2 : 85 1b __ STA P0 
1ef4 : a9 00 __ LDA #$00
1ef6 : 85 1e __ STA P3 
1ef8 : 2a __ __ ROL
1ef9 : 85 1c __ STA P1 
1efb : a9 03 __ LDA #$03
1efd : 85 1d __ STA P2 
1eff : 20 76 1f JSR $1f76 ; (FAR_PEEK.s4 + 0)
1f02 : a6 55 __ LDX T1 + 0 
1f04 : 9d 7b 9c STA $9c7b,x ; (selected[0] + 0)
1f07 : aa __ __ TAX
1f08 : f0 08 __ BEQ $1f12 ; (getTheFile_far.s9 + 0)
.s10:
1f0a : e6 55 __ INC T1 + 0 
1f0c : a5 55 __ LDA T1 + 0 
1f0e : c9 78 __ CMP #$78
1f10 : 90 de __ BCC $1ef0 ; (getTheFile_far.l8 + 0)
.s9:
1f12 : ad fa 9f LDA $9ffa ; (sstack + 35)
1f15 : 8d df 9f STA $9fdf ; (sstack + 8)
1f18 : ad fb 9f LDA $9ffb ; (sstack + 36)
1f1b : 8d e0 9f STA $9fe0 ; (sstack + 9)
1f1e : a9 7b __ LDA #$7b
1f20 : 8d e5 9f STA $9fe5 ; (sstack + 14)
1f23 : a9 9c __ LDA #$9c
1f25 : 8d e6 9f STA $9fe6 ; (sstack + 15)
1f28 : a9 1c __ LDA #$1c
1f2a : 8d e1 9f STA $9fe1 ; (sstack + 10)
1f2d : a9 36 __ LDA #$36
1f2f : 8d e2 9f STA $9fe2 ; (sstack + 11)
1f32 : a9 f3 __ LDA #$f3
1f34 : 8d e3 9f STA $9fe3 ; (sstack + 12)
1f37 : a9 9c __ LDA #$9c
1f39 : 8d e4 9f STA $9fe4 ; (sstack + 13)
1f3c : 20 e0 35 JSR $35e0 ; (sprintf.s4 + 0)
1f3f : a9 00 __ LDA #$00
.s3:
1f41 : 85 29 __ STA ACCU + 0 
1f43 : ad 75 9c LDA $9c75 ; (getTheFile_far@stack + 0)
1f46 : 85 55 __ STA T1 + 0 
1f48 : 60 __ __ RTS
--------------------------------------------------------------------
fpr_get_currentPath: ; fpr_get_currentPath(u8*)->void
;  66, "/mnt/d/F256/f256lib-oscar64/doodles/modplayer/src/muFilePicker.h"
.s4:
1f49 : a9 00 __ LDA #$00
1f4b : 85 39 __ STA T1 + 0 
1f4d : 18 __ __ CLC
.l5:
1f4e : 69 02 __ ADC #$02
1f50 : 85 1b __ STA P0 
1f52 : a9 00 __ LDA #$00
1f54 : 85 1e __ STA P3 
1f56 : 2a __ __ ROL
1f57 : 85 1c __ STA P1 
1f59 : a9 03 __ LDA #$03
1f5b : 85 1d __ STA P2 
1f5d : 20 76 1f JSR $1f76 ; (FAR_PEEK.s4 + 0)
1f60 : a4 39 __ LDY T1 + 0 
1f62 : 91 1f __ STA (P4),y ; (out + 0)
1f64 : aa __ __ TAX
1f65 : f0 0e __ BEQ $1f75 ; (fpr_get_currentPath.s3 + 0)
.s6:
1f67 : e6 39 __ INC T1 + 0 
1f69 : a5 39 __ LDA T1 + 0 
1f6b : c9 3c __ CMP #$3c
1f6d : 90 df __ BCC $1f4e ; (fpr_get_currentPath.l5 + 0)
.s7:
1f6f : a9 00 __ LDA #$00
1f71 : a0 3b __ LDY #$3b
1f73 : 91 1f __ STA (P4),y ; (out + 0)
.s3:
1f75 : 60 __ __ RTS
--------------------------------------------------------------------
FAR_PEEK: ; FAR_PEEK(u32)->u8
; 213, "/mnt/d/F256/f256lib-oscar64/f256lib/f256lib.h"
.s4:
1f76 : a5 0f __ LDA $0f 
1f78 : 85 38 __ STA T2 + 0 
1f7a : 78 __ __ SEI
1f7b : a5 1b __ LDA P0 ; (address + 0)
1f7d : 85 35 __ STA T0 + 0 
1f7f : a5 1c __ LDA P1 ; (address + 1)
1f81 : 85 37 __ STA T1 + 0 
1f83 : a5 1e __ LDA P3 ; (address + 3)
1f85 : a2 05 __ LDX #$05
.l5:
1f87 : 4a __ __ LSR
1f88 : 66 1d __ ROR P2 ; (address + 2)
1f8a : 66 37 __ ROR T1 + 0 
1f8c : ca __ __ DEX
1f8d : d0 f8 __ BNE $1f87 ; (FAR_PEEK.l5 + 0)
.s6:
1f8f : a5 37 __ LDA T1 + 0 
1f91 : 85 0f __ STA $0f 
1f93 : a5 1c __ LDA P1 ; (address + 1)
1f95 : 29 1f __ AND #$1f
1f97 : 09 e0 __ ORA #$e0
1f99 : 85 36 __ STA T0 + 1 
1f9b : a0 00 __ LDY #$00
1f9d : b1 35 __ LDA (T0 + 0),y 
1f9f : 85 35 __ STA T0 + 0 
1fa1 : a5 38 __ LDA T2 + 0 
1fa3 : 85 0f __ STA $0f 
1fa5 : 58 __ __ CLI
1fa6 : a5 35 __ LDA T0 + 0 
.s3:
1fa8 : 60 __ __ RTS
--------------------------------------------------------------------
fileOpenDir: ; fileOpenDir(const u8*)->u8*
;  26, "/mnt/d/F256/f256lib-oscar64/f256lib/f_file.h"
.s4:
1fa9 : a5 21 __ LDA P6 ; (name + 0)
1fab : 85 1d __ STA P2 
1fad : a5 22 __ LDA P7 ; (name + 1)
1faf : 85 1e __ STA P3 
1fb1 : a9 d6 __ LDA #$d6
1fb3 : 85 1f __ STA P4 
1fb5 : a9 9f __ LDA #$9f
1fb7 : 85 20 __ STA P5 
1fb9 : 20 2b 20 JSR $202b ; (pathWithoutDrive.s4 + 0)
1fbc : ae d6 9f LDX $9fd6 ; (drive + 0)
1fbf : bd b8 4d LDA $4db8,x ; (_dirStream[0] + 0)
1fc2 : d0 4b __ BNE $200f ; (fileOpenDir.s8 + 0)
.s5:
1fc4 : ad f1 4c LDA $4cf1 ; (kernelArgs + 0)
1fc7 : 85 35 __ STA T1 + 0 
1fc9 : ad f2 4c LDA $4cf2 ; (kernelArgs + 1)
1fcc : 85 36 __ STA T1 + 1 
1fce : ad d6 9f LDA $9fd6 ; (drive + 0)
1fd1 : a0 03 __ LDY #$03
1fd3 : 91 35 __ STA (T1 + 0),y 
1fd5 : a5 29 __ LDA ACCU + 0 
1fd7 : 85 1b __ STA P0 
1fd9 : a0 0b __ LDY #$0b
1fdb : 91 35 __ STA (T1 + 0),y 
1fdd : a5 2a __ LDA ACCU + 1 
1fdf : 85 1c __ STA P1 
1fe1 : c8 __ __ INY
1fe2 : 91 35 __ STA (T1 + 0),y 
1fe4 : 20 79 20 JSR $2079 ; (strlen.s4 + 0)
1fe7 : a5 29 __ LDA ACCU + 0 
1fe9 : a0 0d __ LDY #$0d
1feb : 91 35 __ STA (T1 + 0),y 
1fed : a9 78 __ LDA #$78
1fef : 8d c0 4d STA $4dc0 ; (_kern_target + 0)
1ff2 : a9 ff __ LDA #$ff
1ff4 : 8d c1 4d STA $4dc1 ; (_kern_target + 1)
1ff7 : 20 d9 1a JSR $1ad9 ; (_kernelCallWrapper.s4 + 0)
1ffa : 85 37 __ STA T2 + 0 
1ffc : ad c2 4d LDA $4dc2 ; (_kernelError + 0)
1fff : d0 0e __ BNE $200f ; (fileOpenDir.s8 + 0)
.l6:
2001 : 20 66 1b JSR $1b66 ; (kernelNextEvent.s4 + 0)
2004 : ad f3 4c LDA $4cf3 ; (kernelEventData.type + 0)
2007 : c9 3c __ CMP #$3c
2009 : f0 0b __ BEQ $2016 ; (fileOpenDir.s9 + 0)
.s7:
200b : c9 48 __ CMP #$48
200d : d0 f2 __ BNE $2001 ; (fileOpenDir.l6 + 0)
.s8:
200f : a9 00 __ LDA #$00
2011 : 85 29 __ STA ACCU + 0 
2013 : 85 2a __ STA ACCU + 1 
.s3:
2015 : 60 __ __ RTS
.s9:
2016 : ad d6 9f LDA $9fd6 ; (drive + 0)
2019 : aa __ __ TAX
201a : 18 __ __ CLC
201b : 69 b8 __ ADC #$b8
201d : 85 29 __ STA ACCU + 0 
201f : a9 4d __ LDA #$4d
2021 : 69 00 __ ADC #$00
2023 : 85 2a __ STA ACCU + 1 
2025 : a5 37 __ LDA T2 + 0 
2027 : 9d b8 4d STA $4db8,x ; (_dirStream[0] + 0)
202a : 60 __ __ RTS
--------------------------------------------------------------------
pathWithoutDrive: ; pathWithoutDrive(const u8*,u8*)->const u8*
;  33, "/mnt/d/F256/f256lib-oscar64/f256lib/f_file.c"
.s4:
202b : a9 00 __ LDA #$00
202d : a8 __ __ TAY
202e : 91 1f __ STA (P4),y ; (drive + 0)
2030 : a5 1d __ LDA P2 ; (path + 0)
2032 : 85 1b __ STA P0 
2034 : a5 1e __ LDA P3 ; (path + 1)
2036 : 85 1c __ STA P1 
2038 : 20 79 20 JSR $2079 ; (strlen.s4 + 0)
203b : a5 2a __ LDA ACCU + 1 
203d : 30 10 __ BMI $204f ; (pathWithoutDrive.s9 + 0)
.s11:
203f : d0 06 __ BNE $2047 ; (pathWithoutDrive.s5 + 0)
.s10:
2041 : a5 29 __ LDA ACCU + 0 
2043 : c9 02 __ CMP #$02
2045 : 90 08 __ BCC $204f ; (pathWithoutDrive.s9 + 0)
.s5:
2047 : a0 01 __ LDY #$01
2049 : b1 1d __ LDA (P2),y ; (path + 0)
204b : c9 3a __ CMP #$3a
204d : f0 09 __ BEQ $2058 ; (pathWithoutDrive.s6 + 0)
.s9:
204f : a5 1d __ LDA P2 ; (path + 0)
2051 : 85 29 __ STA ACCU + 0 
2053 : a5 1e __ LDA P3 ; (path + 1)
.s3:
2055 : 85 2a __ STA ACCU + 1 
2057 : 60 __ __ RTS
.s6:
2058 : 88 __ __ DEY
2059 : b1 1d __ LDA (P2),y ; (path + 0)
205b : c9 30 __ CMP #$30
205d : 90 0c __ BCC $206b ; (pathWithoutDrive.s12 + 0)
.s7:
205f : a9 37 __ LDA #$37
2061 : d1 1d __ CMP (P2),y ; (path + 0)
2063 : 90 06 __ BCC $206b ; (pathWithoutDrive.s12 + 0)
.s8:
2065 : b1 1d __ LDA (P2),y ; (path + 0)
2067 : e9 30 __ SBC #$30
2069 : 91 1f __ STA (P4),y ; (drive + 0)
.s12:
206b : 18 __ __ CLC
206c : a5 1d __ LDA P2 ; (path + 0)
206e : 69 02 __ ADC #$02
2070 : 85 29 __ STA ACCU + 0 
2072 : a5 1e __ LDA P3 ; (path + 1)
2074 : 69 00 __ ADC #$00
2076 : 4c 55 20 JMP $2055 ; (pathWithoutDrive.s3 + 0)
--------------------------------------------------------------------
strlen: ; strlen(const u8*)->i16
;  12, "/mnt/d/F256/oscar64/include/string.h"
.s4:
2079 : a9 00 __ LDA #$00
207b : 85 29 __ STA ACCU + 0 
207d : 85 2a __ STA ACCU + 1 
207f : a8 __ __ TAY
2080 : b1 1b __ LDA (P0),y ; (str + 0)
2082 : f0 10 __ BEQ $2094 ; (strlen.s3 + 0)
.s6:
2084 : a2 00 __ LDX #$00
.l7:
2086 : c8 __ __ INY
2087 : d0 03 __ BNE $208c ; (strlen.s9 + 0)
.s8:
2089 : e6 1c __ INC P1 ; (str + 1)
208b : e8 __ __ INX
.s9:
208c : b1 1b __ LDA (P0),y ; (str + 0)
208e : d0 f6 __ BNE $2086 ; (strlen.l7 + 0)
.s5:
2090 : 86 2a __ STX ACCU + 1 
2092 : 84 29 __ STY ACCU + 0 
.s3:
2094 : 60 __ __ RTS
--------------------------------------------------------------------
fileCloseDir: ; fileCloseDir(u8*)->i8
;  23, "/mnt/d/F256/f256lib-oscar64/f256lib/f_file.h"
.s4:
2095 : a5 1c __ LDA P1 ; (dir + 1)
2097 : 05 1b __ ORA P0 ; (dir + 0)
2099 : d0 05 __ BNE $20a0 ; (fileCloseDir.l6 + 0)
.s5:
209b : a9 ff __ LDA #$ff
.s3:
209d : 85 29 __ STA ACCU + 0 
209f : 60 __ __ RTS
.l6:
20a0 : a0 00 __ LDY #$00
20a2 : b1 1b __ LDA (P0),y ; (dir + 0)
20a4 : f0 23 __ BEQ $20c9 ; (fileCloseDir.s7 + 0)
.s9:
20a6 : a2 80 __ LDX #$80
20a8 : 8e c0 4d STX $4dc0 ; (_kern_target + 0)
20ab : a2 ff __ LDX #$ff
20ad : 8e c1 4d STX $4dc1 ; (_kern_target + 1)
20b0 : ae f1 4c LDX $4cf1 ; (kernelArgs + 0)
20b3 : 86 35 __ STX T0 + 0 
20b5 : ae f2 4c LDX $4cf2 ; (kernelArgs + 1)
20b8 : 86 36 __ STX T0 + 1 
20ba : a0 03 __ LDY #$03
20bc : 91 35 __ STA (T0 + 0),y 
20be : 20 d9 1a JSR $1ad9 ; (_kernelCallWrapper.s4 + 0)
20c1 : ad c2 4d LDA $4dc2 ; (_kernelError + 0)
20c4 : d0 03 __ BNE $20c9 ; (fileCloseDir.s7 + 0)
.s10:
20c6 : a8 __ __ TAY
20c7 : 91 1b __ STA (P0),y ; (dir + 0)
.s7:
20c9 : 20 66 1b JSR $1b66 ; (kernelNextEvent.s4 + 0)
20cc : ad f3 4c LDA $4cf3 ; (kernelEventData.type + 0)
20cf : c9 46 __ CMP #$46
20d1 : d0 cd __ BNE $20a0 ; (fileCloseDir.l6 + 0)
.s8:
20d3 : a9 00 __ LDA #$00
20d5 : f0 c6 __ BEQ $209d ; (fileCloseDir.s3 + 0)
--------------------------------------------------------------------
filePickModal_far: ; filePickModal_far(u8,u8,const u8*,const u8*,const u8*,const u8*,bool)->u8
;  73, "/mnt/d/F256/f256lib-oscar64/doodles/modplayer/src/muFilePicker.h"
.s1:
20d7 : a5 55 __ LDA T1 + 0 
20d9 : 8d 6b 9d STA $9d6b ; (filePickModal_far@stack + 0)
20dc : a5 56 __ LDA T2 + 0 
20de : 8d 6c 9d STA $9d6c ; (filePickModal_far@stack + 1)
20e1 : a5 57 __ LDA T2 + 1 
20e3 : 8d 6d 9d STA $9d6d ; (filePickModal_far@stack + 2)
.s4:
20e6 : ad ef 9f LDA $9fef ; (sstack + 24)
20e9 : 85 22 __ STA P7 
20eb : ad f0 9f LDA $9ff0 ; (sstack + 25)
20ee : 85 23 __ STA P8 
20f0 : ad f9 9f LDA $9ff9 ; (sstack + 34)
20f3 : 85 24 __ STA P9 
20f5 : 20 04 23 JSR $2304 ; (initFilePickRecord_far.s4 + 0)
20f8 : ad f1 9f LDA $9ff1 ; (sstack + 26)
20fb : 85 56 __ STA T2 + 0 
20fd : ad f2 9f LDA $9ff2 ; (sstack + 27)
2100 : 85 57 __ STA T2 + 1 
2102 : a0 00 __ LDY #$00
2104 : 18 __ __ CLC
.l27:
2105 : 84 55 __ STY T1 + 0 
2107 : b1 56 __ LDA (T2 + 0),y 
2109 : 85 1f __ STA P4 
210b : 98 __ __ TYA
210c : 69 4e __ ADC #$4e
210e : 85 1b __ STA P0 
2110 : a9 00 __ LDA #$00
2112 : 69 5f __ ADC #$5f
2114 : 85 1c __ STA P1 
2116 : a9 03 __ LDA #$03
2118 : 85 1d __ STA P2 
211a : a9 00 __ LDA #$00
211c : 2a __ __ ROL
211d : 85 1e __ STA P3 
211f : 20 50 0a JSR $0a50 ; (FAR_POKE.s4 + 0)
2122 : a4 55 __ LDY T1 + 0 
2124 : c8 __ __ INY
2125 : c0 03 __ CPY #$03
2127 : 90 dc __ BCC $2105 ; (filePickModal_far.l27 + 0)
.s5:
2129 : ad f3 9f LDA $9ff3 ; (sstack + 28)
212c : 85 56 __ STA T2 + 0 
212e : ad f4 9f LDA $9ff4 ; (sstack + 29)
2131 : 85 57 __ STA T2 + 1 
2133 : a0 00 __ LDY #$00
2135 : 18 __ __ CLC
.l28:
2136 : 84 55 __ STY T1 + 0 
2138 : b1 56 __ LDA (T2 + 0),y 
213a : 85 1f __ STA P4 
213c : 98 __ __ TYA
213d : 69 51 __ ADC #$51
213f : 85 1b __ STA P0 
2141 : a9 00 __ LDA #$00
2143 : 69 5f __ ADC #$5f
2145 : 85 1c __ STA P1 
2147 : a9 03 __ LDA #$03
2149 : 85 1d __ STA P2 
214b : a9 00 __ LDA #$00
214d : 2a __ __ ROL
214e : 85 1e __ STA P3 
2150 : 20 50 0a JSR $0a50 ; (FAR_POKE.s4 + 0)
2153 : a4 55 __ LDY T1 + 0 
2155 : c8 __ __ INY
2156 : c0 03 __ CPY #$03
2158 : 90 dc __ BCC $2136 ; (filePickModal_far.l28 + 0)
.s6:
215a : ad f5 9f LDA $9ff5 ; (sstack + 30)
215d : 85 56 __ STA T2 + 0 
215f : ad f6 9f LDA $9ff6 ; (sstack + 31)
2162 : 85 57 __ STA T2 + 1 
2164 : a0 00 __ LDY #$00
2166 : 18 __ __ CLC
.l29:
2167 : 84 55 __ STY T1 + 0 
2169 : b1 56 __ LDA (T2 + 0),y 
216b : 85 1f __ STA P4 
216d : 98 __ __ TYA
216e : 69 54 __ ADC #$54
2170 : 85 1b __ STA P0 
2172 : a9 00 __ LDA #$00
2174 : 69 5f __ ADC #$5f
2176 : 85 1c __ STA P1 
2178 : a9 03 __ LDA #$03
217a : 85 1d __ STA P2 
217c : a9 00 __ LDA #$00
217e : 2a __ __ ROL
217f : 85 1e __ STA P3 
2181 : 20 50 0a JSR $0a50 ; (FAR_POKE.s4 + 0)
2184 : a4 55 __ LDY T1 + 0 
2186 : c8 __ __ INY
2187 : c0 03 __ CPY #$03
2189 : 90 dc __ BCC $2167 ; (filePickModal_far.l29 + 0)
.s7:
218b : ad f7 9f LDA $9ff7 ; (sstack + 32)
218e : 85 56 __ STA T2 + 0 
2190 : ad f8 9f LDA $9ff8 ; (sstack + 33)
2193 : 85 57 __ STA T2 + 1 
2195 : a0 00 __ LDY #$00
2197 : 18 __ __ CLC
.l30:
2198 : 84 55 __ STY T1 + 0 
219a : b1 56 __ LDA (T2 + 0),y 
219c : 85 1f __ STA P4 
219e : 98 __ __ TYA
219f : 69 57 __ ADC #$57
21a1 : 85 1b __ STA P0 
21a3 : a9 00 __ LDA #$00
21a5 : 69 5f __ ADC #$5f
21a7 : 85 1c __ STA P1 
21a9 : a9 03 __ LDA #$03
21ab : 85 1d __ STA P2 
21ad : a9 00 __ LDA #$00
21af : 2a __ __ ROL
21b0 : 85 1e __ STA P3 
21b2 : 20 50 0a JSR $0a50 ; (FAR_POKE.s4 + 0)
21b5 : a4 55 __ LDY T1 + 0 
21b7 : c8 __ __ INY
21b8 : c0 03 __ CPY #$03
21ba : 90 dc __ BCC $2198 ; (filePickModal_far.l30 + 0)
.s8:
21bc : 20 7a 24 JSR $247a ; (readDirectory_far.s4 + 0)
21bf : 20 16 28 JSR $2816 ; (sortFileList_far.s4 + 0)
21c2 : a9 0a __ LDA #$0a
21c4 : 85 1b __ STA P0 
21c6 : a9 00 __ LDA #$00
21c8 : 85 1c __ STA P1 
21ca : 20 3b 0c JSR $0c3b ; (textSetColor.s4 + 0)
.l9:
21cd : a9 4a __ LDA #$4a
21cf : 85 1b __ STA P0 
21d1 : a9 00 __ LDA #$00
21d3 : 85 1e __ STA P3 
21d5 : a9 5f __ LDA #$5f
21d7 : 85 1c __ STA P1 
21d9 : a9 03 __ LDA #$03
21db : 85 1d __ STA P2 
21dd : 20 80 2b JSR $2b80 ; (FAR_PEEKW.s4 + 0)
21e0 : a5 29 __ LDA ACCU + 0 
21e2 : 8d ed 9f STA $9fed ; (sstack + 22)
21e5 : a5 2a __ LDA ACCU + 1 
21e7 : 8d ee 9f STA $9fee ; (sstack + 23)
21ea : 20 34 2c JSR $2c34 ; (displayFileList_far.s1 + 0)
.l10:
21ed : 20 90 2f JSR $2f90 ; (pickFile_far.s1 + 0)
21f0 : a5 29 __ LDA ACCU + 0 
21f2 : d0 13 __ BNE $2207 ; (filePickModal_far.s13 + 0)
.s11:
21f4 : 20 50 35 JSR $3550 ; (backUpDirectory_far.s4 + 0)
21f7 : a9 01 __ LDA #$01
21f9 : 85 21 __ STA P6 
21fb : 20 93 23 JSR $2393 ; (reprepFPR_far.s4 + 0)
.s12:
21fe : 20 7a 24 JSR $247a ; (readDirectory_far.s4 + 0)
2201 : 20 16 28 JSR $2816 ; (sortFileList_far.s4 + 0)
2204 : 4c cd 21 JMP $21cd ; (filePickModal_far.l9 + 0)
.s13:
2207 : c9 01 __ CMP #$01
2209 : d0 07 __ BNE $2212 ; (filePickModal_far.s14 + 0)
.s18:
220b : a9 00 __ LDA #$00
220d : 85 55 __ STA T1 + 0 
220f : 18 __ __ CLC
2210 : 90 46 __ BCC $2258 ; (filePickModal_far.l19 + 0)
.s14:
2212 : c9 02 __ CMP #$02
2214 : f0 18 __ BEQ $222e ; (filePickModal_far.s17 + 0)
.s15:
2216 : c9 03 __ CMP #$03
2218 : d0 d3 __ BNE $21ed ; (filePickModal_far.l10 + 0)
.s16:
221a : a9 01 __ LDA #$01
.s3:
221c : 85 29 __ STA ACCU + 0 
221e : ad 6b 9d LDA $9d6b ; (filePickModal_far@stack + 0)
2221 : 85 55 __ STA T1 + 0 
2223 : ad 6c 9d LDA $9d6c ; (filePickModal_far@stack + 1)
2226 : 85 56 __ STA T2 + 0 
2228 : ad 6d 9d LDA $9d6d ; (filePickModal_far@stack + 2)
222b : 85 57 __ STA T2 + 1 
222d : 60 __ __ RTS
.s17:
222e : a9 00 __ LDA #$00
2230 : 85 1b __ STA P0 
2232 : 85 1c __ STA P1 
2234 : 85 1e __ STA P3 
2236 : a9 03 __ LDA #$03
2238 : 85 1d __ STA P2 
223a : 20 76 1f JSR $1f76 ; (FAR_PEEK.s4 + 0)
223d : 85 55 __ STA T1 + 0 
223f : e6 1b __ INC P0 
2241 : a9 03 __ LDA #$03
2243 : 85 1d __ STA P2 
2245 : 20 76 1f JSR $1f76 ; (FAR_PEEK.s4 + 0)
2248 : 85 1c __ STA P1 
224a : a5 55 __ LDA T1 + 0 
224c : 85 1b __ STA P0 
224e : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
2251 : 20 0f 2f JSR $2f0f ; (wipeArea_far.s1 + 0)
2254 : a9 00 __ LDA #$00
2256 : f0 c4 __ BEQ $221c ; (filePickModal_far.s3 + 0)
.l19:
2258 : 69 02 __ ADC #$02
225a : 85 1b __ STA P0 
225c : a9 00 __ LDA #$00
225e : 85 1e __ STA P3 
2260 : 2a __ __ ROL
2261 : 85 1c __ STA P1 
2263 : a9 03 __ LDA #$03
2265 : 85 1d __ STA P2 
2267 : 20 76 1f JSR $1f76 ; (FAR_PEEK.s4 + 0)
226a : a6 55 __ LDX T1 + 0 
226c : 9d 2b 9e STA $9e2b,x ; (currentPath[0] + 0)
226f : aa __ __ TAX
2270 : f0 08 __ BEQ $227a ; (filePickModal_far.s20 + 0)
.s26:
2272 : e6 55 __ INC T1 + 0 
2274 : a5 55 __ LDA T1 + 0 
2276 : c9 3c __ CMP #$3c
2278 : 90 de __ BCC $2258 ; (filePickModal_far.l19 + 0)
.s20:
227a : a9 00 __ LDA #$00
227c : 85 55 __ STA T1 + 0 
227e : 18 __ __ CLC
.l21:
227f : 69 3e __ ADC #$3e
2281 : 85 1b __ STA P0 
2283 : a9 00 __ LDA #$00
2285 : 2a __ __ ROL
2286 : 85 1c __ STA P1 
2288 : a9 03 __ LDA #$03
228a : 85 1d __ STA P2 
228c : 20 76 1f JSR $1f76 ; (FAR_PEEK.s4 + 0)
228f : a6 55 __ LDX T1 + 0 
2291 : 9d b3 9d STA $9db3,x ; (selectedFile[0] + 0)
2294 : aa __ __ TAX
2295 : f0 08 __ BEQ $229f ; (filePickModal_far.s22 + 0)
.s25:
2297 : e6 55 __ INC T1 + 0 
2299 : a5 55 __ LDA T1 + 0 
229b : c9 78 __ CMP #$78
229d : 90 e0 __ BCC $227f ; (filePickModal_far.l21 + 0)
.s22:
229f : a9 b3 __ LDA #$b3
22a1 : 8d e5 9f STA $9fe5 ; (sstack + 14)
22a4 : a9 9d __ LDA #$9d
22a6 : 8d e6 9f STA $9fe6 ; (sstack + 15)
22a9 : a9 73 __ LDA #$73
22ab : 8d df 9f STA $9fdf ; (sstack + 8)
22ae : a9 9d __ LDA #$9d
22b0 : 8d e0 9f STA $9fe0 ; (sstack + 9)
22b3 : a9 1c __ LDA #$1c
22b5 : 8d e1 9f STA $9fe1 ; (sstack + 10)
22b8 : a9 36 __ LDA #$36
22ba : 8d e2 9f STA $9fe2 ; (sstack + 11)
22bd : a9 2b __ LDA #$2b
22bf : 8d e3 9f STA $9fe3 ; (sstack + 12)
22c2 : a9 9e __ LDA #$9e
22c4 : 8d e4 9f STA $9fe4 ; (sstack + 13)
22c7 : 20 e0 35 JSR $35e0 ; (sprintf.s4 + 0)
22ca : a9 01 __ LDA #$01
22cc : 85 21 __ STA P6 
22ce : 20 93 23 JSR $2393 ; (reprepFPR_far.s4 + 0)
22d1 : a9 00 __ LDA #$00
22d3 : 85 55 __ STA T1 + 0 
22d5 : aa __ __ TAX
22d6 : 18 __ __ CLC
.l23:
22d7 : 69 02 __ ADC #$02
22d9 : 85 1b __ STA P0 
22db : a9 00 __ LDA #$00
22dd : 85 1e __ STA P3 
22df : 2a __ __ ROL
22e0 : 85 1c __ STA P1 
22e2 : a9 03 __ LDA #$03
22e4 : 85 1d __ STA P2 
22e6 : bd 73 9d LDA $9d73,x ; (finalDir[0] + 0)
22e9 : 85 1f __ STA P4 
22eb : 20 50 0a JSR $0a50 ; (FAR_POKE.s4 + 0)
22ee : a6 55 __ LDX T1 + 0 
22f0 : bd 73 9d LDA $9d73,x ; (finalDir[0] + 0)
22f3 : d0 03 __ BNE $22f8 ; (filePickModal_far.s24 + 0)
22f5 : 4c fe 21 JMP $21fe ; (filePickModal_far.s12 + 0)
.s24:
22f8 : e6 55 __ INC T1 + 0 
22fa : a5 55 __ LDA T1 + 0 
22fc : aa __ __ TAX
22fd : c9 3c __ CMP #$3c
22ff : 90 d6 __ BCC $22d7 ; (filePickModal_far.l23 + 0)
2301 : 4c fe 21 JMP $21fe ; (filePickModal_far.s12 + 0)
--------------------------------------------------------------------
initFilePickRecord_far: ; initFilePickRecord_far(u8,u8,bool)->void
;  79, "/mnt/d/F256/f256lib-oscar64/doodles/modplayer/src/muFilePicker.h"
.s4:
2304 : a9 00 __ LDA #$00
2306 : 85 1e __ STA P3 
2308 : 85 41 __ STA T1 + 0 
230a : 85 1f __ STA P4 
230c : 18 __ __ CLC
.l9:
230d : 69 3e __ ADC #$3e
230f : 85 1b __ STA P0 
2311 : a9 00 __ LDA #$00
2313 : 2a __ __ ROL
2314 : 85 1c __ STA P1 
2316 : a9 03 __ LDA #$03
2318 : 85 1d __ STA P2 
231a : 20 50 0a JSR $0a50 ; (FAR_POKE.s4 + 0)
231d : e6 41 __ INC T1 + 0 
231f : a5 41 __ LDA T1 + 0 
2321 : c9 78 __ CMP #$78
2323 : 90 e8 __ BCC $230d ; (initFilePickRecord_far.l9 + 0)
.s5:
2325 : a5 24 __ LDA P9 ; (firstTime + 0)
2327 : 85 21 __ STA P6 
2329 : 20 93 23 JSR $2393 ; (reprepFPR_far.s4 + 0)
232c : a9 00 __ LDA #$00
232e : 85 1f __ STA P4 
.l6:
2330 : 85 45 __ STA T2 + 0 
2332 : 18 __ __ CLC
2333 : 69 4e __ ADC #$4e
2335 : 85 41 __ STA T1 + 0 
2337 : a9 00 __ LDA #$00
2339 : 69 5f __ ADC #$5f
233b : 85 42 __ STA T1 + 1 
233d : a9 03 __ LDA #$03
233f : 85 43 __ STA T1 + 2 
2341 : a9 00 __ LDA #$00
2343 : 2a __ __ ROL
2344 : 85 44 __ STA T1 + 3 
2346 : a9 00 __ LDA #$00
2348 : 85 46 __ STA T3 + 0 
.l10:
234a : 65 41 __ ADC T1 + 0 
234c : 85 1b __ STA P0 
234e : a5 42 __ LDA T1 + 1 
2350 : 69 00 __ ADC #$00
2352 : 85 1c __ STA P1 
2354 : a5 43 __ LDA T1 + 2 
2356 : 69 00 __ ADC #$00
2358 : 85 1d __ STA P2 
235a : a5 44 __ LDA T1 + 3 
235c : 69 00 __ ADC #$00
235e : 85 1e __ STA P3 
2360 : 20 50 0a JSR $0a50 ; (FAR_POKE.s4 + 0)
2363 : e6 46 __ INC T3 + 0 
2365 : a5 46 __ LDA T3 + 0 
2367 : c9 03 __ CMP #$03
2369 : 90 df __ BCC $234a ; (initFilePickRecord_far.l10 + 0)
.s7:
236b : a5 45 __ LDA T2 + 0 
236d : 69 02 __ ADC #$02
236f : c9 0c __ CMP #$0c
2371 : d0 bd __ BNE $2330 ; (initFilePickRecord_far.l6 + 0)
.s8:
2373 : a9 00 __ LDA #$00
2375 : 85 1b __ STA P0 
2377 : 85 1c __ STA P1 
2379 : 85 1e __ STA P3 
237b : a5 22 __ LDA P7 ; (x + 0)
237d : 85 1f __ STA P4 
237f : a9 03 __ LDA #$03
2381 : 85 1d __ STA P2 
2383 : 20 50 0a JSR $0a50 ; (FAR_POKE.s4 + 0)
2386 : e6 1b __ INC P0 
2388 : a5 23 __ LDA P8 ; (y + 0)
238a : 85 1f __ STA P4 
238c : a9 03 __ LDA #$03
238e : 85 1d __ STA P2 
2390 : 4c 50 0a JMP $0a50 ; (FAR_POKE.s4 + 0)
--------------------------------------------------------------------
reprepFPR_far: ; reprepFPR_far(bool)->void
;  77, "/mnt/d/F256/f256lib-oscar64/doodles/modplayer/src/muFilePicker.h"
.s4:
2393 : a9 00 __ LDA #$00
2395 : 85 3f __ STA T3 + 1 
2397 : 85 1f __ STA P4 
2399 : a9 01 __ LDA #$01
239b : 85 3d __ STA T2 + 0 
239d : a9 78 __ LDA #$78
239f : 85 3e __ STA T3 + 0 
23a1 : 18 __ __ CLC
.l5:
23a2 : a5 3e __ LDA T3 + 0 
23a4 : 69 b6 __ ADC #$b6
23a6 : 85 39 __ STA T1 + 0 
23a8 : a5 3f __ LDA T3 + 1 
23aa : 69 00 __ ADC #$00
23ac : 85 3a __ STA T1 + 1 
23ae : a9 00 __ LDA #$00
23b0 : 69 03 __ ADC #$03
23b2 : 85 3b __ STA T1 + 2 
23b4 : a9 00 __ LDA #$00
23b6 : 2a __ __ ROL
23b7 : 85 3c __ STA T1 + 3 
23b9 : a9 00 __ LDA #$00
23bb : 85 40 __ STA T4 + 0 
.l9:
23bd : 65 39 __ ADC T1 + 0 
23bf : 85 1b __ STA P0 
23c1 : a5 3a __ LDA T1 + 1 
23c3 : 69 00 __ ADC #$00
23c5 : 85 1c __ STA P1 
23c7 : a5 3b __ LDA T1 + 2 
23c9 : 69 00 __ ADC #$00
23cb : 85 1d __ STA P2 
23cd : a5 3c __ LDA T1 + 3 
23cf : 69 00 __ ADC #$00
23d1 : 85 1e __ STA P3 
23d3 : 20 50 0a JSR $0a50 ; (FAR_POKE.s4 + 0)
23d6 : e6 40 __ INC T4 + 0 
23d8 : a5 40 __ LDA T4 + 0 
23da : c9 78 __ CMP #$78
23dc : 90 df __ BCC $23bd ; (reprepFPR_far.l9 + 0)
.s6:
23de : a5 3d __ LDA T2 + 0 
23e0 : 69 75 __ ADC #$75
23e2 : 85 1b __ STA P0 
23e4 : a9 00 __ LDA #$00
23e6 : 69 5e __ ADC #$5e
23e8 : 85 1c __ STA P1 
23ea : a9 03 __ LDA #$03
23ec : 85 1d __ STA P2 
23ee : a9 00 __ LDA #$00
23f0 : 2a __ __ ROL
23f1 : 85 1e __ STA P3 
23f3 : 20 50 0a JSR $0a50 ; (FAR_POKE.s4 + 0)
23f6 : 18 __ __ CLC
23f7 : a5 3e __ LDA T3 + 0 
23f9 : 69 78 __ ADC #$78
23fb : 85 3e __ STA T3 + 0 
23fd : 90 02 __ BCC $2401 ; (reprepFPR_far.s11 + 0)
.s10:
23ff : e6 3f __ INC T3 + 1 
.s11:
2401 : e6 3d __ INC T2 + 0 
2403 : a5 3d __ LDA T2 + 0 
2405 : c9 c8 __ CMP #$c8
2407 : 90 99 __ BCC $23a2 ; (reprepFPR_far.l5 + 0)
.s7:
2409 : a5 21 __ LDA P6 ; (newFolder + 0)
240b : d0 01 __ BNE $240e ; (reprepFPR_far.s8 + 0)
.s3:
240d : 60 __ __ RTS
.s8:
240e : a9 00 __ LDA #$00
2410 : 85 1e __ STA P3 
2412 : 85 20 __ STA P5 
2414 : a9 3e __ LDA #$3e
2416 : 85 1b __ STA P0 
2418 : a9 5f __ LDA #$5f
241a : 85 1c __ STA P1 
241c : a9 03 __ LDA #$03
241e : 85 1d __ STA P2 
2420 : 20 44 24 JSR $2444 ; (FAR_POKEW.s4 + 0)
2423 : a9 42 __ LDA #$42
2425 : 85 1b __ STA P0 
2427 : a9 03 __ LDA #$03
2429 : 85 1d __ STA P2 
242b : 20 44 24 JSR $2444 ; (FAR_POKEW.s4 + 0)
242e : a9 4a __ LDA #$4a
2430 : 85 1b __ STA P0 
2432 : a9 03 __ LDA #$03
2434 : 85 1d __ STA P2 
2436 : 20 44 24 JSR $2444 ; (FAR_POKEW.s4 + 0)
2439 : a9 46 __ LDA #$46
243b : 85 1b __ STA P0 
243d : a9 03 __ LDA #$03
243f : 85 1d __ STA P2 
2441 : 4c 44 24 JMP $2444 ; (FAR_POKEW.s4 + 0)
--------------------------------------------------------------------
FAR_POKEW: ; FAR_POKEW(u32,u16)->void
; 217, "/mnt/d/F256/f256lib-oscar64/f256lib/f256lib.h"
.s4:
2444 : a5 0f __ LDA $0f 
2446 : 85 38 __ STA T2 + 0 
2448 : 78 __ __ SEI
2449 : a5 1b __ LDA P0 ; (address + 0)
244b : 85 35 __ STA T0 + 0 
244d : a5 1c __ LDA P1 ; (address + 1)
244f : 85 37 __ STA T1 + 0 
2451 : a5 1e __ LDA P3 ; (address + 3)
2453 : a2 05 __ LDX #$05
.l5:
2455 : 4a __ __ LSR
2456 : 66 1d __ ROR P2 ; (address + 2)
2458 : 66 37 __ ROR T1 + 0 
245a : ca __ __ DEX
245b : d0 f8 __ BNE $2455 ; (FAR_POKEW.l5 + 0)
.s6:
245d : a5 37 __ LDA T1 + 0 
245f : 85 0f __ STA $0f 
2461 : a5 1c __ LDA P1 ; (address + 1)
2463 : 29 1f __ AND #$1f
2465 : 09 e0 __ ORA #$e0
2467 : 85 36 __ STA T0 + 1 
2469 : a5 1f __ LDA P4 ; (value + 0)
246b : a0 00 __ LDY #$00
246d : 91 35 __ STA (T0 + 0),y 
246f : a5 20 __ LDA P5 ; (value + 1)
2471 : c8 __ __ INY
2472 : 91 35 __ STA (T0 + 0),y 
2474 : a5 38 __ LDA T2 + 0 
2476 : 85 0f __ STA $0f 
2478 : 58 __ __ CLI
.s3:
2479 : 60 __ __ RTS
--------------------------------------------------------------------
readDirectory_far: ; readDirectory_far()->void
;  87, "/mnt/d/F256/f256lib-oscar64/doodles/modplayer/src/muFilePicker.h"
.s4:
247a : a9 00 __ LDA #$00
247c : 85 3c __ STA T1 + 0 
247e : 18 __ __ CLC
.l5:
247f : 69 02 __ ADC #$02
2481 : 85 1b __ STA P0 
2483 : a9 00 __ LDA #$00
2485 : 85 1e __ STA P3 
2487 : 2a __ __ ROL
2488 : 85 1c __ STA P1 
248a : a9 03 __ LDA #$03
248c : 85 1d __ STA P2 
248e : 20 76 1f JSR $1f76 ; (FAR_PEEK.s4 + 0)
2491 : a6 3c __ LDX T1 + 0 
2493 : 9d 97 9f STA $9f97,x ; (localPath[0] + 0)
2496 : aa __ __ TAX
2497 : f0 08 __ BEQ $24a1 ; (readDirectory_far.s6 + 0)
.s23:
2499 : e6 3c __ INC T1 + 0 
249b : a5 3c __ LDA T1 + 0 
249d : c9 3c __ CMP #$3c
249f : 90 de __ BCC $247f ; (readDirectory_far.l5 + 0)
.s6:
24a1 : a9 97 __ LDA #$97
24a3 : 85 21 __ STA P6 
24a5 : a9 9f __ LDA #$9f
24a7 : 85 22 __ STA P7 
24a9 : 20 a9 1f JSR $1fa9 ; (fileOpenDir.s4 + 0)
24ac : a5 2a __ LDA ACCU + 1 
24ae : 05 29 __ ORA ACCU + 0 
24b0 : d0 01 __ BNE $24b3 ; (readDirectory_far.s7 + 0)
.s3:
24b2 : 60 __ __ RTS
.s7:
24b3 : a5 2a __ LDA ACCU + 1 
24b5 : 85 1c __ STA P1 
24b7 : 85 41 __ STA T2 + 1 
24b9 : a5 29 __ LDA ACCU + 0 
24bb : 85 40 __ STA T2 + 0 
24bd : 85 1b __ STA P0 
24bf : 20 34 26 JSR $2634 ; (fileReadDir.s4 + 0)
24c2 : a9 01 __ LDA #$01
24c4 : 85 42 __ STA T3 + 0 
.l8:
24c6 : a5 40 __ LDA T2 + 0 
24c8 : 85 1b __ STA P0 
24ca : a5 41 __ LDA T2 + 1 
24cc : 85 1c __ STA P1 
24ce : 20 34 26 JSR $2634 ; (fileReadDir.s4 + 0)
24d1 : a5 2a __ LDA ACCU + 1 
24d3 : 85 44 __ STA T4 + 1 
24d5 : a6 29 __ LDX ACCU + 0 
24d7 : 86 43 __ STX T4 + 0 
24d9 : d0 06 __ BNE $24e1 ; (readDirectory_far.s11 + 0)
.s22:
24db : a8 __ __ TAY
24dc : d0 03 __ BNE $24e1 ; (readDirectory_far.s11 + 0)
24de : 4c ca 25 JMP $25ca ; (readDirectory_far.s9 + 0)
.s11:
24e1 : a5 42 __ LDA T3 + 0 
24e3 : c9 c8 __ CMP #$c8
24e5 : b0 f7 __ BCS $24de ; (readDirectory_far.s22 + 3)
.s12:
24e7 : 8a __ __ TXA
24e8 : 69 02 __ ADC #$02
24ea : 85 45 __ STA T5 + 0 
24ec : 85 1b __ STA P0 
24ee : a5 2a __ LDA ACCU + 1 
24f0 : 69 00 __ ADC #$00
24f2 : 85 46 __ STA T5 + 1 
24f4 : 85 1c __ STA P1 
24f6 : a9 fc __ LDA #$fc
24f8 : 85 1d __ STA P2 
24fa : a9 1a __ LDA #$1a
24fc : 85 1e __ STA P3 
24fe : 20 fe 26 JSR $26fe ; (strcmp.s4 + 0)
2501 : aa __ __ TAX
2502 : f0 c2 __ BEQ $24c6 ; (readDirectory_far.l8 + 0)
.s13:
2504 : a5 45 __ LDA T5 + 0 
2506 : 85 1b __ STA P0 
2508 : a5 46 __ LDA T5 + 1 
250a : 85 1c __ STA P1 
250c : a9 2b __ LDA #$2b
250e : 85 1d __ STA P2 
2510 : a9 27 __ LDA #$27
2512 : 85 1e __ STA P3 
2514 : 20 fe 26 JSR $26fe ; (strcmp.s4 + 0)
2517 : aa __ __ TAX
2518 : f0 ac __ BEQ $24c6 ; (readDirectory_far.l8 + 0)
.s14:
251a : a5 45 __ LDA T5 + 0 
251c : 85 23 __ STA P8 
251e : a5 46 __ LDA T5 + 1 
2520 : 85 24 __ STA P9 
2522 : 20 2e 27 JSR $272e ; (isExtensionAllowed_far.s4 + 0)
2525 : a5 29 __ LDA ACCU + 0 
2527 : d0 06 __ BNE $252f ; (readDirectory_far.s16 + 0)
.s15:
2529 : a0 01 __ LDY #$01
252b : b1 43 __ LDA (T4 + 0),y 
252d : f0 97 __ BEQ $24c6 ; (readDirectory_far.l8 + 0)
.s16:
252f : a5 42 __ LDA T3 + 0 
2531 : 85 29 __ STA ACCU + 0 
2533 : a9 00 __ LDA #$00
2535 : 85 2a __ STA ACCU + 1 
2537 : a9 78 __ LDA #$78
2539 : 20 47 45 JSR $4547 ; (mul16by8 + 0)
253c : 18 __ __ CLC
253d : a5 29 __ LDA ACCU + 0 
253f : 69 b6 __ ADC #$b6
2541 : 85 3c __ STA T1 + 0 
2543 : a5 2a __ LDA ACCU + 1 
2545 : 69 00 __ ADC #$00
2547 : 85 3d __ STA T1 + 1 
2549 : a9 00 __ LDA #$00
254b : 69 03 __ ADC #$03
254d : 85 3e __ STA T1 + 2 
254f : a9 00 __ LDA #$00
2551 : 2a __ __ ROL
2552 : 85 3f __ STA T1 + 3 
2554 : a0 00 __ LDY #$00
.l17:
2556 : 84 47 __ STY T6 + 0 
2558 : b1 45 __ LDA (T5 + 0),y 
255a : 85 1f __ STA P4 
255c : 98 __ __ TYA
255d : 18 __ __ CLC
255e : 65 3c __ ADC T1 + 0 
2560 : 85 1b __ STA P0 
2562 : a5 3d __ LDA T1 + 1 
2564 : 69 00 __ ADC #$00
2566 : 85 1c __ STA P1 
2568 : a5 3e __ LDA T1 + 2 
256a : 69 00 __ ADC #$00
256c : 85 1d __ STA P2 
256e : a5 3f __ LDA T1 + 3 
2570 : 69 00 __ ADC #$00
2572 : 85 1e __ STA P3 
2574 : 20 50 0a JSR $0a50 ; (FAR_POKE.s4 + 0)
2577 : a5 1f __ LDA P4 
2579 : f0 07 __ BEQ $2582 ; (readDirectory_far.s18 + 0)
.s21:
257b : a4 47 __ LDY T6 + 0 
257d : c8 __ __ INY
257e : c0 77 __ CPY #$77
2580 : 90 d4 __ BCC $2556 ; (readDirectory_far.l17 + 0)
.s18:
2582 : a9 00 __ LDA #$00
2584 : 85 1f __ STA P4 
2586 : 18 __ __ CLC
2587 : a5 3c __ LDA T1 + 0 
2589 : 69 77 __ ADC #$77
258b : 85 1b __ STA P0 
258d : a5 3d __ LDA T1 + 1 
258f : 69 00 __ ADC #$00
2591 : 85 1c __ STA P1 
2593 : a5 3e __ LDA T1 + 2 
2595 : 69 00 __ ADC #$00
2597 : 85 1d __ STA P2 
2599 : a5 3f __ LDA T1 + 3 
259b : 69 00 __ ADC #$00
259d : 85 1e __ STA P3 
259f : 20 50 0a JSR $0a50 ; (FAR_POKE.s4 + 0)
25a2 : a0 01 __ LDY #$01
25a4 : b1 43 __ LDA (T4 + 0),y 
25a6 : c9 01 __ CMP #$01
25a8 : d0 02 __ BNE $25ac ; (readDirectory_far.s19 + 0)
.s20:
25aa : e6 1f __ INC P4 
.s19:
25ac : 18 __ __ CLC
25ad : a5 42 __ LDA T3 + 0 
25af : 69 76 __ ADC #$76
25b1 : 85 1b __ STA P0 
25b3 : a9 00 __ LDA #$00
25b5 : 69 5e __ ADC #$5e
25b7 : 85 1c __ STA P1 
25b9 : a9 03 __ LDA #$03
25bb : 85 1d __ STA P2 
25bd : a9 00 __ LDA #$00
25bf : 2a __ __ ROL
25c0 : 85 1e __ STA P3 
25c2 : 20 50 0a JSR $0a50 ; (FAR_POKE.s4 + 0)
25c5 : e6 42 __ INC T3 + 0 
25c7 : 4c c6 24 JMP $24c6 ; (readDirectory_far.l8 + 0)
.s9:
25ca : a9 00 __ LDA #$00
25cc : 85 1e __ STA P3 
25ce : 85 20 __ STA P5 
25d0 : a9 3e __ LDA #$3e
25d2 : 85 1b __ STA P0 
25d4 : a9 5f __ LDA #$5f
25d6 : 85 1c __ STA P1 
25d8 : a9 03 __ LDA #$03
25da : 85 1d __ STA P2 
25dc : a5 42 __ LDA T3 + 0 
25de : 85 1f __ STA P4 
25e0 : 20 44 24 JSR $2444 ; (FAR_POKEW.s4 + 0)
25e3 : a9 b6 __ LDA #$b6
25e5 : 85 1b __ STA P0 
25e7 : a9 2e __ LDA #$2e
25e9 : 85 1f __ STA P4 
25eb : a9 00 __ LDA #$00
25ed : 85 1c __ STA P1 
25ef : a9 03 __ LDA #$03
25f1 : 85 1d __ STA P2 
25f3 : 20 50 0a JSR $0a50 ; (FAR_POKE.s4 + 0)
25f6 : e6 1b __ INC P0 
25f8 : a9 03 __ LDA #$03
25fa : 85 1d __ STA P2 
25fc : 20 50 0a JSR $0a50 ; (FAR_POKE.s4 + 0)
25ff : e6 1b __ INC P0 
2601 : a9 03 __ LDA #$03
2603 : 85 1d __ STA P2 
2605 : a9 00 __ LDA #$00
2607 : 85 1f __ STA P4 
2609 : 20 50 0a JSR $0a50 ; (FAR_POKE.s4 + 0)
260c : a9 03 __ LDA #$03
260e : 85 3c __ STA T1 + 0 
2610 : 18 __ __ CLC
.l24:
2611 : 69 b6 __ ADC #$b6
2613 : 85 1b __ STA P0 
2615 : a9 00 __ LDA #$00
2617 : 2a __ __ ROL
2618 : 85 1c __ STA P1 
261a : a9 03 __ LDA #$03
261c : 85 1d __ STA P2 
261e : 20 50 0a JSR $0a50 ; (FAR_POKE.s4 + 0)
2621 : e6 3c __ INC T1 + 0 
2623 : a5 3c __ LDA T1 + 0 
2625 : c9 78 __ CMP #$78
2627 : 90 e8 __ BCC $2611 ; (readDirectory_far.l24 + 0)
.s10:
2629 : a5 40 __ LDA T2 + 0 
262b : 85 1b __ STA P0 
262d : a5 41 __ LDA T2 + 1 
262f : 85 1c __ STA P1 
2631 : 4c 95 20 JMP $2095 ; (fileCloseDir.s4 + 0)
--------------------------------------------------------------------
fileReadDir: ; fileReadDir(u8*)->struct fileDirEntS*
;  28, "/mnt/d/F256/f256lib-oscar64/f256lib/f_file.h"
.s4:
2634 : a5 1c __ LDA P1 ; (dir + 1)
2636 : 05 1b __ ORA P0 ; (dir + 0)
2638 : d0 03 __ BNE $263d ; (fileReadDir.s5 + 0)
263a : 4c c1 26 JMP $26c1 ; (fileReadDir.s17 + 0)
.s5:
263d : a9 7c __ LDA #$7c
263f : 8d c0 4d STA $4dc0 ; (_kern_target + 0)
2642 : a9 ff __ LDA #$ff
2644 : 8d c1 4d STA $4dc1 ; (_kern_target + 1)
2647 : ad f1 4c LDA $4cf1 ; (kernelArgs + 0)
264a : 85 36 __ STA T3 + 0 
264c : ad f2 4c LDA $4cf2 ; (kernelArgs + 1)
264f : 85 37 __ STA T3 + 1 
2651 : a0 00 __ LDY #$00
2653 : b1 1b __ LDA (P0),y ; (dir + 0)
2655 : a0 03 __ LDY #$03
2657 : 91 36 __ STA (T3 + 0),y 
2659 : 20 d9 1a JSR $1ad9 ; (_kernelCallWrapper.s4 + 0)
265c : ad c2 4d LDA $4dc2 ; (_kernelError + 0)
265f : d0 60 __ BNE $26c1 ; (fileReadDir.s17 + 0)
.l6:
2661 : 20 66 1b JSR $1b66 ; (kernelNextEvent.s4 + 0)
2664 : ad f3 4c LDA $4cf3 ; (kernelEventData.type + 0)
2667 : c9 3e __ CMP #$3e
2669 : d0 09 __ BNE $2674 ; (fileReadDir.s7 + 0)
.s16:
266b : a9 00 __ LDA #$00
266d : 8d 78 4e STA $4e78 ; (fileDirEntS.d_blocks + 0)
2670 : a9 02 __ LDA #$02
2672 : d0 54 __ BNE $26c8 ; (fileReadDir.s13 + 0)
.s7:
2674 : c9 40 __ CMP #$40
2676 : d0 25 __ BNE $269d ; (fileReadDir.s8 + 0)
.s12:
2678 : a9 08 __ LDA #$08
267a : 8d c0 4d STA $4dc0 ; (_kern_target + 0)
267d : a9 ff __ LDA #$ff
267f : 8d c1 4d STA $4dc1 ; (_kern_target + 1)
2682 : a9 78 __ LDA #$78
2684 : a0 0b __ LDY #$0b
2686 : 91 36 __ STA (T3 + 0),y 
2688 : a9 4e __ LDA #$4e
268a : c8 __ __ INY
268b : 91 36 __ STA (T3 + 0),y 
268d : a9 01 __ LDA #$01
268f : c8 __ __ INY
2690 : 91 36 __ STA (T3 + 0),y 
2692 : 20 d9 1a JSR $1ad9 ; (_kernelCallWrapper.s4 + 0)
2695 : a9 00 __ LDA #$00
2697 : cd 78 4e CMP $4e78 ; (fileDirEntS.d_blocks + 0)
269a : 2a __ __ ROL
269b : 90 2b __ BCC $26c8 ; (fileReadDir.s13 + 0)
.s8:
269d : c9 42 __ CMP #$42
269f : d0 18 __ BNE $26b9 ; (fileReadDir.s9 + 0)
.s11:
26a1 : a9 7c __ LDA #$7c
26a3 : 8d c0 4d STA $4dc0 ; (_kern_target + 0)
26a6 : a9 ff __ LDA #$ff
26a8 : 8d c1 4d STA $4dc1 ; (_kern_target + 1)
26ab : a0 00 __ LDY #$00
26ad : b1 1b __ LDA (P0),y ; (dir + 0)
26af : a0 03 __ LDY #$03
26b1 : 91 36 __ STA (T3 + 0),y 
26b3 : 20 d9 1a JSR $1ad9 ; (_kernelCallWrapper.s4 + 0)
26b6 : 4c 61 26 JMP $2661 ; (fileReadDir.l6 + 0)
.s9:
26b9 : c9 44 __ CMP #$44
26bb : f0 04 __ BEQ $26c1 ; (fileReadDir.s17 + 0)
.s10:
26bd : c9 48 __ CMP #$48
26bf : d0 a0 __ BNE $2661 ; (fileReadDir.l6 + 0)
.s17:
26c1 : a9 00 __ LDA #$00
26c3 : 85 29 __ STA ACCU + 0 
.s3:
26c5 : 85 2a __ STA ACCU + 1 
26c7 : 60 __ __ RTS
.s13:
26c8 : 8d 79 4e STA $4e79 ; (fileDirEntS.d_type + 0)
26cb : ad f8 4c LDA $4cf8 ; (kernelEventData.u + 2)
26ce : 85 35 __ STA T1 + 0 
26d0 : f0 1c __ BEQ $26ee ; (fileReadDir.s14 + 0)
.s15:
26d2 : a0 0d __ LDY #$0d
26d4 : 91 36 __ STA (T3 + 0),y 
26d6 : a9 04 __ LDA #$04
26d8 : 8d c0 4d STA $4dc0 ; (_kern_target + 0)
26db : a9 ff __ LDA #$ff
26dd : 8d c1 4d STA $4dc1 ; (_kern_target + 1)
26e0 : a9 7a __ LDA #$7a
26e2 : a0 0b __ LDY #$0b
26e4 : 91 36 __ STA (T3 + 0),y 
26e6 : a9 4e __ LDA #$4e
26e8 : c8 __ __ INY
26e9 : 91 36 __ STA (T3 + 0),y 
26eb : 20 d9 1a JSR $1ad9 ; (_kernelCallWrapper.s4 + 0)
.s14:
26ee : a9 00 __ LDA #$00
26f0 : a6 35 __ LDX T1 + 0 
26f2 : 9d 7a 4e STA $4e7a,x ; (fileDirEntS.d_name[0] + 0)
26f5 : a9 78 __ LDA #$78
26f7 : 85 29 __ STA ACCU + 0 
26f9 : a9 4e __ LDA #$4e
26fb : 4c c5 26 JMP $26c5 ; (fileReadDir.s3 + 0)
--------------------------------------------------------------------
strcmp: ; strcmp(const u8*,const u8*)->i8
;   8, "/mnt/d/F256/oscar64/include/string.h"
.s4:
26fe : a0 00 __ LDY #$00
2700 : b1 1b __ LDA (P0),y 
2702 : f0 16 __ BEQ $271a ; (strcmp.s4 + 28)
2704 : d1 1d __ CMP (P2),y 
2706 : d0 16 __ BNE $271e ; (strcmp.s4 + 32)
2708 : c8 __ __ INY
2709 : b1 1b __ LDA (P0),y 
270b : f0 0d __ BEQ $271a ; (strcmp.s4 + 28)
270d : d1 1d __ CMP (P2),y 
270f : d0 0d __ BNE $271e ; (strcmp.s4 + 32)
2711 : c8 __ __ INY
2712 : d0 ec __ BNE $2700 ; (strcmp.s4 + 2)
2714 : e6 1c __ INC P1 
2716 : e6 1e __ INC P3 
2718 : d0 e6 __ BNE $2700 ; (strcmp.s4 + 2)
271a : d1 1d __ CMP (P2),y 
271c : f0 08 __ BEQ $2726 ; (strcmp.s4 + 40)
271e : b0 04 __ BCS $2724 ; (strcmp.s4 + 38)
2720 : a9 ff __ LDA #$ff
2722 : 30 02 __ BMI $2726 ; (strcmp.s4 + 40)
2724 : a9 01 __ LDA #$01
2726 : 85 29 __ STA ACCU + 0 
.s3:
2728 : a5 29 __ LDA ACCU + 0 
272a : 60 __ __ RTS
--------------------------------------------------------------------
272b : __ __ __ BYT 2e 2e 00                                        : ...
--------------------------------------------------------------------
isExtensionAllowed_far: ; isExtensionAllowed_far(const u8*)->bool
;  89, "/mnt/d/F256/f256lib-oscar64/doodles/modplayer/src/muFilePicker.h"
.s4:
272e : a0 00 __ LDY #$00
.l5:
2730 : 84 3a __ STY T2 + 0 
2732 : b9 6a 4c LDA $4c6a,y ; (__multab3L + 0)
2735 : 18 __ __ CLC
2736 : 69 4e __ ADC #$4e
2738 : 85 39 __ STA T1 + 0 
273a : 85 1b __ STA P0 
273c : a9 5f __ LDA #$5f
273e : 85 1c __ STA P1 
2740 : a9 00 __ LDA #$00
2742 : 85 1e __ STA P3 
2744 : a9 03 __ LDA #$03
2746 : 85 1d __ STA P2 
2748 : 20 76 1f JSR $1f76 ; (FAR_PEEK.s4 + 0)
274b : aa __ __ TAX
274c : f0 40 __ BEQ $278e ; (isExtensionAllowed_far.s6 + 0)
.s7:
274e : a9 00 __ LDA #$00
2750 : 85 3b __ STA T3 + 0 
2752 : 18 __ __ CLC
.l10:
2753 : a5 3b __ LDA T3 + 0 
2755 : 65 39 __ ADC T1 + 0 
2757 : 85 1b __ STA P0 
2759 : a9 5f __ LDA #$5f
275b : 69 00 __ ADC #$00
275d : 85 1c __ STA P1 
275f : a9 03 __ LDA #$03
2761 : 85 1d __ STA P2 
2763 : 20 76 1f JSR $1f76 ; (FAR_PEEK.s4 + 0)
2766 : a6 3b __ LDX T3 + 0 
2768 : e8 __ __ INX
2769 : 86 3b __ STX T3 + 0 
276b : 9d d2 9f STA $9fd2,x ; (buffer[0] + 250)
276e : e0 03 __ CPX #$03
2770 : 90 e1 __ BCC $2753 ; (isExtensionAllowed_far.l10 + 0)
.s8:
2772 : a9 00 __ LDA #$00
2774 : 8d d6 9f STA $9fd6 ; (extBuf[0] + 3)
2777 : a5 23 __ LDA P8 ; (filename + 0)
2779 : 85 1f __ STA P4 
277b : a5 24 __ LDA P9 ; (filename + 1)
277d : 85 20 __ STA P5 
277f : a9 d3 __ LDA #$d3
2781 : 85 21 __ STA P6 
2783 : a9 9f __ LDA #$9f
2785 : 85 22 __ STA P7 
2787 : 20 9c 27 JSR $279c ; (endsWithExt.s4 + 0)
278a : a5 29 __ LDA ACCU + 0 
278c : d0 0a __ BNE $2798 ; (isExtensionAllowed_far.s9 + 0)
.s6:
278e : a4 3a __ LDY T2 + 0 
2790 : c8 __ __ INY
2791 : c0 04 __ CPY #$04
2793 : 90 9b __ BCC $2730 ; (isExtensionAllowed_far.l5 + 0)
.s3:
2795 : 85 29 __ STA ACCU + 0 
2797 : 60 __ __ RTS
.s9:
2798 : a9 01 __ LDA #$01
279a : d0 f9 __ BNE $2795 ; (isExtensionAllowed_far.s3 + 0)
--------------------------------------------------------------------
endsWithExt: ; endsWithExt(const u8*,const u8*)->bool
; 158, "/mnt/d/F256/f256lib-oscar64/doodles/modplayer/src/muFilePicker.c"
.s4:
279c : a5 1f __ LDA P4 ; (filename + 0)
279e : 85 1b __ STA P0 
27a0 : a5 20 __ LDA P5 ; (filename + 1)
27a2 : 85 1c __ STA P1 
27a4 : 20 79 20 JSR $2079 ; (strlen.s4 + 0)
27a7 : a5 2a __ LDA ACCU + 1 
27a9 : d0 06 __ BNE $27b1 ; (endsWithExt.s5 + 0)
.s13:
27ab : a5 29 __ LDA ACCU + 0 
27ad : c9 04 __ CMP #$04
27af : 90 56 __ BCC $2807 ; (endsWithExt.s6 + 0)
.s5:
27b1 : a5 20 __ LDA P5 ; (filename + 1)
27b3 : 85 1c __ STA P1 
27b5 : a9 2e __ LDA #$2e
27b7 : 85 1d __ STA P2 
27b9 : a9 00 __ LDA #$00
27bb : 85 1e __ STA P3 
27bd : 20 ab 0a JSR $0aab ; (strrchr.s4 + 0)
27c0 : a5 2a __ LDA ACCU + 1 
27c2 : 05 29 __ ORA ACCU + 0 
27c4 : f0 41 __ BEQ $2807 ; (endsWithExt.s6 + 0)
.s7:
27c6 : a5 29 __ LDA ACCU + 0 
27c8 : 85 35 __ STA T1 + 0 
27ca : 18 __ __ CLC
27cb : 69 01 __ ADC #$01
27cd : 85 1b __ STA P0 
27cf : a5 2a __ LDA ACCU + 1 
27d1 : 85 36 __ STA T1 + 1 
27d3 : 69 00 __ ADC #$00
27d5 : 85 1c __ STA P1 
27d7 : 20 79 20 JSR $2079 ; (strlen.s4 + 0)
27da : a5 2a __ LDA ACCU + 1 
27dc : d0 29 __ BNE $2807 ; (endsWithExt.s6 + 0)
.s12:
27de : a5 29 __ LDA ACCU + 0 
27e0 : c9 03 __ CMP #$03
27e2 : d0 23 __ BNE $2807 ; (endsWithExt.s6 + 0)
.s8:
27e4 : a0 00 __ LDY #$00
.l9:
27e6 : 84 37 __ STY T2 + 0 
27e8 : c8 __ __ INY
27e9 : b1 35 __ LDA (T1 + 0),y 
27eb : 20 0b 28 JSR $280b ; (tolower.s4 + 0)
27ee : 85 38 __ STA T4 + 0 
27f0 : a4 37 __ LDY T2 + 0 
27f2 : b1 21 __ LDA (P6),y ; (ext + 0)
27f4 : 20 0b 28 JSR $280b ; (tolower.s4 + 0)
27f7 : c5 38 __ CMP T4 + 0 
27f9 : d0 0c __ BNE $2807 ; (endsWithExt.s6 + 0)
.s10:
27fb : a4 37 __ LDY T2 + 0 
27fd : c8 __ __ INY
27fe : c0 03 __ CPY #$03
2800 : 90 e4 __ BCC $27e6 ; (endsWithExt.l9 + 0)
.s11:
2802 : a9 01 __ LDA #$01
.s3:
2804 : 85 29 __ STA ACCU + 0 
2806 : 60 __ __ RTS
.s6:
2807 : a9 00 __ LDA #$00
2809 : f0 f9 __ BEQ $2804 ; (endsWithExt.s3 + 0)
--------------------------------------------------------------------
tolower: ; tolower(u8)->u8
;  28, "/mnt/d/F256/oscar64/include/ctype.h"
.s4:
280b : c9 41 __ CMP #$41
280d : 90 06 __ BCC $2815 ; (tolower.s3 + 0)
.s5:
280f : c9 5b __ CMP #$5b
2811 : b0 02 __ BCS $2815 ; (tolower.s3 + 0)
.s6:
2813 : 69 20 __ ADC #$20
.s3:
2815 : 60 __ __ RTS
--------------------------------------------------------------------
sortFileList_far: ; sortFileList_far()->void
;  92, "/mnt/d/F256/f256lib-oscar64/doodles/modplayer/src/muFilePicker.h"
.s4:
2816 : a9 00 __ LDA #$00
2818 : 85 1c __ STA P1 
281a : 85 1e __ STA P3 
281c : a9 b6 __ LDA #$b6
281e : 85 1b __ STA P0 
2820 : a9 03 __ LDA #$03
2822 : 85 1d __ STA P2 
2824 : a9 2e __ LDA #$2e
2826 : 85 1f __ STA P4 
2828 : 20 50 0a JSR $0a50 ; (FAR_POKE.s4 + 0)
282b : e6 1b __ INC P0 
282d : a9 03 __ LDA #$03
282f : 85 1d __ STA P2 
2831 : 20 50 0a JSR $0a50 ; (FAR_POKE.s4 + 0)
2834 : e6 1b __ INC P0 
2836 : a9 03 __ LDA #$03
2838 : 85 1d __ STA P2 
283a : a9 00 __ LDA #$00
283c : 85 1f __ STA P4 
283e : 20 50 0a JSR $0a50 ; (FAR_POKE.s4 + 0)
2841 : a9 03 __ LDA #$03
2843 : 85 3b __ STA T1 + 0 
2845 : 18 __ __ CLC
.l31:
2846 : 69 b6 __ ADC #$b6
2848 : 85 1b __ STA P0 
284a : a9 00 __ LDA #$00
284c : 2a __ __ ROL
284d : 85 1c __ STA P1 
284f : a9 03 __ LDA #$03
2851 : 85 1d __ STA P2 
2853 : 20 50 0a JSR $0a50 ; (FAR_POKE.s4 + 0)
2856 : e6 3b __ INC T1 + 0 
2858 : a5 3b __ LDA T1 + 0 
285a : c9 78 __ CMP #$78
285c : 90 e8 __ BCC $2846 ; (sortFileList_far.l31 + 0)
.s5:
285e : a9 76 __ LDA #$76
2860 : 85 1b __ STA P0 
2862 : a9 01 __ LDA #$01
2864 : 85 1f __ STA P4 
2866 : a9 5e __ LDA #$5e
2868 : 85 1c __ STA P1 
286a : a9 03 __ LDA #$03
286c : 85 1d __ STA P2 
286e : 20 50 0a JSR $0a50 ; (FAR_POKE.s4 + 0)
2871 : e6 1c __ INC P1 
2873 : a9 3e __ LDA #$3e
2875 : 85 1b __ STA P0 
2877 : a9 03 __ LDA #$03
2879 : 85 1d __ STA P2 
287b : 20 80 2b JSR $2b80 ; (FAR_PEEKW.s4 + 0)
287e : a5 29 __ LDA ACCU + 0 
2880 : 85 47 __ STA T4 + 0 
2882 : a5 2a __ LDA ACCU + 1 
2884 : 85 48 __ STA T4 + 1 
2886 : d0 07 __ BNE $288f ; (sortFileList_far.s6 + 0)
.s30:
2888 : a9 02 __ LDA #$02
288a : c5 29 __ CMP ACCU + 0 
288c : 90 01 __ BCC $288f ; (sortFileList_far.s6 + 0)
.s3:
288e : 60 __ __ RTS
.s6:
288f : a9 00 __ LDA #$00
2891 : 85 4a __ STA T5 + 1 
2893 : 85 4c __ STA T6 + 1 
2895 : a9 02 __ LDA #$02
2897 : 85 49 __ STA T5 + 0 
2899 : a9 f0 __ LDA #$f0
289b : 85 4b __ STA T6 + 0 
.l7:
289d : a0 00 __ LDY #$00
289f : 24 4a __ BIT T5 + 1 
28a1 : 10 01 __ BPL $28a4 ; (sortFileList_far.s33 + 0)
.s32:
28a3 : 88 __ __ DEY
.s33:
28a4 : 18 __ __ CLC
28a5 : a5 49 __ LDA T5 + 0 
28a7 : 69 76 __ ADC #$76
28a9 : 85 1b __ STA P0 
28ab : a5 4a __ LDA T5 + 1 
28ad : 69 5e __ ADC #$5e
28af : 85 1c __ STA P1 
28b1 : 98 __ __ TYA
28b2 : 69 03 __ ADC #$03
28b4 : 85 1d __ STA P2 
28b6 : 90 01 __ BCC $28b9 ; (sortFileList_far.s35 + 0)
.s34:
28b8 : c8 __ __ INY
.s35:
28b9 : 84 1e __ STY P3 
28bb : 20 76 1f JSR $1f76 ; (FAR_PEEK.s4 + 0)
28be : c9 01 __ CMP #$01
28c0 : a9 00 __ LDA #$00
28c2 : 2a __ __ ROL
28c3 : 85 50 __ STA T10 + 0 
28c5 : a0 00 __ LDY #$00
28c7 : 24 4c __ BIT T6 + 1 
28c9 : 10 01 __ BPL $28cc ; (sortFileList_far.s37 + 0)
.s36:
28cb : 88 __ __ DEY
.s37:
28cc : 18 __ __ CLC
28cd : a5 4b __ LDA T6 + 0 
28cf : 69 b6 __ ADC #$b6
28d1 : 85 3b __ STA T1 + 0 
28d3 : a5 4c __ LDA T6 + 1 
28d5 : 69 00 __ ADC #$00
28d7 : 85 3c __ STA T1 + 1 
28d9 : 98 __ __ TYA
28da : 69 03 __ ADC #$03
28dc : 85 3d __ STA T1 + 2 
28de : 90 02 __ BCC $28e2 ; (sortFileList_far.s39 + 0)
.s38:
28e0 : c8 __ __ INY
28e1 : 18 __ __ CLC
.s39:
28e2 : 84 3e __ STY T1 + 3 
28e4 : a9 00 __ LDA #$00
28e6 : 85 3f __ STA T2 + 0 
.l8:
28e8 : 65 3b __ ADC T1 + 0 
28ea : 85 1b __ STA P0 
28ec : a5 3c __ LDA T1 + 1 
28ee : 69 00 __ ADC #$00
28f0 : 85 1c __ STA P1 
28f2 : a5 3d __ LDA T1 + 2 
28f4 : 69 00 __ ADC #$00
28f6 : 85 1d __ STA P2 
28f8 : a5 3e __ LDA T1 + 3 
28fa : 69 00 __ ADC #$00
28fc : 85 1e __ STA P3 
28fe : 20 76 1f JSR $1f76 ; (FAR_PEEK.s4 + 0)
2901 : a6 3f __ LDX T2 + 0 
2903 : 9d 5f 9f STA $9f5f,x ; (keyName[0] + 0)
2906 : aa __ __ TAX
2907 : f0 08 __ BEQ $2911 ; (sortFileList_far.s9 + 0)
.s29:
2909 : e6 3f __ INC T2 + 0 
290b : a5 3f __ LDA T2 + 0 
290d : c9 78 __ CMP #$78
290f : 90 d7 __ BCC $28e8 ; (sortFileList_far.l8 + 0)
.s9:
2911 : 38 __ __ SEC
2912 : a5 49 __ LDA T5 + 0 
2914 : e9 01 __ SBC #$01
2916 : 85 4d __ STA T7 + 0 
2918 : a5 4a __ LDA T5 + 1 
291a : e9 00 __ SBC #$00
291c : 85 4e __ STA T7 + 1 
291e : 10 03 __ BPL $2923 ; (sortFileList_far.l28 + 0)
2920 : 4c d0 29 JMP $29d0 ; (sortFileList_far.s71 + 0)
.l28:
2923 : d0 07 __ BNE $292c ; (sortFileList_far.s15 + 0)
.s27:
2925 : a5 4d __ LDA T7 + 0 
2927 : d0 03 __ BNE $292c ; (sortFileList_far.s15 + 0)
2929 : 4c d2 29 JMP $29d2 ; (sortFileList_far.s10 + 0)
.s15:
292c : 18 __ __ CLC
292d : a5 4d __ LDA T7 + 0 
292f : 69 76 __ ADC #$76
2931 : 85 1b __ STA P0 
2933 : a5 4e __ LDA T7 + 1 
2935 : 69 5e __ ADC #$5e
2937 : 85 1c __ STA P1 
2939 : a9 00 __ LDA #$00
293b : 69 03 __ ADC #$03
293d : 85 1d __ STA P2 
293f : a9 00 __ LDA #$00
2941 : 2a __ __ ROL
2942 : 85 1e __ STA P3 
2944 : 20 76 1f JSR $1f76 ; (FAR_PEEK.s4 + 0)
2947 : c9 01 __ CMP #$01
2949 : a9 00 __ LDA #$00
294b : 2a __ __ ROL
294c : 85 51 __ STA T11 + 0 
294e : a5 50 __ LDA T10 + 0 
2950 : f0 03 __ BEQ $2955 ; (sortFileList_far.s16 + 0)
2952 : 4c 76 2b JMP $2b76 ; (sortFileList_far.s26 + 0)
.s16:
2955 : a5 51 __ LDA T11 + 0 
2957 : d0 77 __ BNE $29d0 ; (sortFileList_far.s71 + 0)
.s17:
2959 : a5 4d __ LDA T7 + 0 
295b : 85 29 __ STA ACCU + 0 
295d : a5 4e __ LDA T7 + 1 
295f : 85 2a __ STA ACCU + 1 
2961 : a9 78 __ LDA #$78
2963 : 20 47 45 JSR $4547 ; (mul16by8 + 0)
2966 : a0 00 __ LDY #$00
2968 : 24 2a __ BIT ACCU + 1 
296a : 10 01 __ BPL $296d ; (sortFileList_far.s53 + 0)
.s52:
296c : 88 __ __ DEY
.s53:
296d : 18 __ __ CLC
296e : a5 29 __ LDA ACCU + 0 
2970 : 69 b6 __ ADC #$b6
2972 : 85 3b __ STA T1 + 0 
2974 : a5 2a __ LDA ACCU + 1 
2976 : 69 00 __ ADC #$00
2978 : 85 3c __ STA T1 + 1 
297a : 98 __ __ TYA
297b : 69 03 __ ADC #$03
297d : 85 3d __ STA T1 + 2 
297f : 90 02 __ BCC $2983 ; (sortFileList_far.s55 + 0)
.s54:
2981 : c8 __ __ INY
2982 : 18 __ __ CLC
.s55:
2983 : 84 3e __ STY T1 + 3 
2985 : a9 00 __ LDA #$00
2987 : 85 3f __ STA T2 + 0 
.l18:
2989 : 65 3b __ ADC T1 + 0 
298b : 85 1b __ STA P0 
298d : a5 3c __ LDA T1 + 1 
298f : 69 00 __ ADC #$00
2991 : 85 1c __ STA P1 
2993 : a5 3d __ LDA T1 + 2 
2995 : 69 00 __ ADC #$00
2997 : 85 1d __ STA P2 
2999 : a5 3e __ LDA T1 + 3 
299b : 69 00 __ ADC #$00
299d : 85 1e __ STA P3 
299f : 20 76 1f JSR $1f76 ; (FAR_PEEK.s4 + 0)
29a2 : a6 3f __ LDX T2 + 0 
29a4 : 9d e7 9e STA $9ee7,x ; (jName[0] + 0)
29a7 : aa __ __ TAX
29a8 : f0 08 __ BEQ $29b2 ; (sortFileList_far.s19 + 0)
.s25:
29aa : e6 3f __ INC T2 + 0 
29ac : a5 3f __ LDA T2 + 0 
29ae : c9 78 __ CMP #$78
29b0 : 90 d7 __ BCC $2989 ; (sortFileList_far.l18 + 0)
.s19:
29b2 : a9 e7 __ LDA #$e7
29b4 : 85 1c __ STA P1 
29b6 : a9 9f __ LDA #$9f
29b8 : 85 1f __ STA P4 
29ba : a9 9e __ LDA #$9e
29bc : 85 1d __ STA P2 
29be : a9 5f __ LDA #$5f
29c0 : 85 1e __ STA P3 
29c2 : 20 bf 2b JSR $2bbf ; (strcasecmp_local.s4 + 0)
29c5 : a5 2a __ LDA ACCU + 1 
29c7 : 30 07 __ BMI $29d0 ; (sortFileList_far.s71 + 0)
.s24:
29c9 : 05 29 __ ORA ACCU + 0 
29cb : f0 03 __ BEQ $29d0 ; (sortFileList_far.s71 + 0)
29cd : 4c 88 2a JMP $2a88 ; (sortFileList_far.s20 + 0)
.s71:
29d0 : a5 4d __ LDA T7 + 0 
.s10:
29d2 : 85 29 __ STA ACCU + 0 
29d4 : a5 4e __ LDA T7 + 1 
29d6 : 85 2a __ STA ACCU + 1 
29d8 : a9 78 __ LDA #$78
29da : 20 47 45 JSR $4547 ; (mul16by8 + 0)
29dd : 18 __ __ CLC
29de : a5 29 __ LDA ACCU + 0 
29e0 : 69 78 __ ADC #$78
29e2 : a5 2a __ LDA ACCU + 1 
29e4 : 69 00 __ ADC #$00
29e6 : 0a __ __ ASL
29e7 : a0 00 __ LDY #$00
29e9 : 90 01 __ BCC $29ec ; (sortFileList_far.s41 + 0)
.s40:
29eb : 88 __ __ DEY
.s41:
29ec : 18 __ __ CLC
29ed : a5 29 __ LDA ACCU + 0 
29ef : 69 2e __ ADC #$2e
29f1 : 85 3b __ STA T1 + 0 
29f3 : a5 2a __ LDA ACCU + 1 
29f5 : 69 01 __ ADC #$01
29f7 : 85 3c __ STA T1 + 1 
29f9 : 98 __ __ TYA
29fa : 69 03 __ ADC #$03
29fc : 85 3d __ STA T1 + 2 
29fe : 90 02 __ BCC $2a02 ; (sortFileList_far.s43 + 0)
.s42:
2a00 : c8 __ __ INY
2a01 : 18 __ __ CLC
.s43:
2a02 : 84 3e __ STY T1 + 3 
2a04 : a9 00 __ LDA #$00
2a06 : 85 3f __ STA T2 + 0 
.l11:
2a08 : 65 3b __ ADC T1 + 0 
2a0a : 85 1b __ STA P0 
2a0c : a5 3c __ LDA T1 + 1 
2a0e : 69 00 __ ADC #$00
2a10 : 85 1c __ STA P1 
2a12 : a5 3d __ LDA T1 + 2 
2a14 : 69 00 __ ADC #$00
2a16 : 85 1d __ STA P2 
2a18 : a5 3e __ LDA T1 + 3 
2a1a : 69 00 __ ADC #$00
2a1c : 85 1e __ STA P3 
2a1e : a6 3f __ LDX T2 + 0 
2a20 : bd 5f 9f LDA $9f5f,x ; (keyName[0] + 0)
2a23 : 85 1f __ STA P4 
2a25 : 20 50 0a JSR $0a50 ; (FAR_POKE.s4 + 0)
2a28 : a6 3f __ LDX T2 + 0 
2a2a : bd 5f 9f LDA $9f5f,x ; (keyName[0] + 0)
2a2d : f0 08 __ BEQ $2a37 ; (sortFileList_far.s12 + 0)
.s14:
2a2f : e6 3f __ INC T2 + 0 
2a31 : a5 3f __ LDA T2 + 0 
2a33 : c9 78 __ CMP #$78
2a35 : 90 d1 __ BCC $2a08 ; (sortFileList_far.l11 + 0)
.s12:
2a37 : a5 50 __ LDA T10 + 0 
2a39 : 85 1f __ STA P4 
2a3b : 18 __ __ CLC
2a3c : a5 4d __ LDA T7 + 0 
2a3e : 69 01 __ ADC #$01
2a40 : a5 4e __ LDA T7 + 1 
2a42 : 69 00 __ ADC #$00
2a44 : 0a __ __ ASL
2a45 : a0 00 __ LDY #$00
2a47 : 90 01 __ BCC $2a4a ; (sortFileList_far.s45 + 0)
.s44:
2a49 : 88 __ __ DEY
.s45:
2a4a : 18 __ __ CLC
2a4b : a5 4d __ LDA T7 + 0 
2a4d : 69 77 __ ADC #$77
2a4f : 85 1b __ STA P0 
2a51 : a5 4e __ LDA T7 + 1 
2a53 : 69 5e __ ADC #$5e
2a55 : 85 1c __ STA P1 
2a57 : 98 __ __ TYA
2a58 : 69 03 __ ADC #$03
2a5a : 85 1d __ STA P2 
2a5c : 90 01 __ BCC $2a5f ; (sortFileList_far.s47 + 0)
.s46:
2a5e : c8 __ __ INY
.s47:
2a5f : 84 1e __ STY P3 
2a61 : 20 50 0a JSR $0a50 ; (FAR_POKE.s4 + 0)
2a64 : 18 __ __ CLC
2a65 : a5 4b __ LDA T6 + 0 
2a67 : 69 78 __ ADC #$78
2a69 : 85 4b __ STA T6 + 0 
2a6b : 90 02 __ BCC $2a6f ; (sortFileList_far.s49 + 0)
.s48:
2a6d : e6 4c __ INC T6 + 1 
.s49:
2a6f : e6 49 __ INC T5 + 0 
2a71 : d0 02 __ BNE $2a75 ; (sortFileList_far.s51 + 0)
.s50:
2a73 : e6 4a __ INC T5 + 1 
.s51:
2a75 : a5 4a __ LDA T5 + 1 
2a77 : c5 48 __ CMP T4 + 1 
2a79 : b0 03 __ BCS $2a7e ; (sortFileList_far.s70 + 0)
2a7b : 4c 9d 28 JMP $289d ; (sortFileList_far.l7 + 0)
.s70:
2a7e : f0 01 __ BEQ $2a81 ; (sortFileList_far.s13 + 0)
2a80 : 60 __ __ RTS
.s13:
2a81 : a5 49 __ LDA T5 + 0 
2a83 : c5 47 __ CMP T4 + 0 
2a85 : 90 f4 __ BCC $2a7b ; (sortFileList_far.s51 + 6)
2a87 : 60 __ __ RTS
.s20:
2a88 : a5 4d __ LDA T7 + 0 
2a8a : 85 29 __ STA ACCU + 0 
2a8c : a5 4e __ LDA T7 + 1 
2a8e : 85 2a __ STA ACCU + 1 
2a90 : a9 78 __ LDA #$78
2a92 : 20 47 45 JSR $4547 ; (mul16by8 + 0)
2a95 : 18 __ __ CLC
2a96 : a5 29 __ LDA ACCU + 0 
2a98 : 69 78 __ ADC #$78
2a9a : a5 2a __ LDA ACCU + 1 
2a9c : 69 00 __ ADC #$00
2a9e : 0a __ __ ASL
2a9f : a0 00 __ LDY #$00
2aa1 : 90 01 __ BCC $2aa4 ; (sortFileList_far.s57 + 0)
.s56:
2aa3 : 88 __ __ DEY
.s57:
2aa4 : 18 __ __ CLC
2aa5 : a5 29 __ LDA ACCU + 0 
2aa7 : 69 2e __ ADC #$2e
2aa9 : 85 3b __ STA T1 + 0 
2aab : a5 2a __ LDA ACCU + 1 
2aad : 69 01 __ ADC #$01
2aaf : 85 3c __ STA T1 + 1 
2ab1 : 98 __ __ TYA
2ab2 : 69 03 __ ADC #$03
2ab4 : 85 3d __ STA T1 + 2 
2ab6 : 90 01 __ BCC $2ab9 ; (sortFileList_far.s59 + 0)
.s58:
2ab8 : c8 __ __ INY
.s59:
2ab9 : 84 3e __ STY T1 + 3 
2abb : a0 00 __ LDY #$00
2abd : 24 2a __ BIT ACCU + 1 
2abf : 10 01 __ BPL $2ac2 ; (sortFileList_far.s61 + 0)
.s60:
2ac1 : 88 __ __ DEY
.s61:
2ac2 : 18 __ __ CLC
2ac3 : a5 29 __ LDA ACCU + 0 
2ac5 : 69 b6 __ ADC #$b6
2ac7 : 85 3f __ STA T2 + 0 
2ac9 : a5 2a __ LDA ACCU + 1 
2acb : 69 00 __ ADC #$00
2acd : 85 40 __ STA T2 + 1 
2acf : 98 __ __ TYA
2ad0 : 69 03 __ ADC #$03
2ad2 : 85 41 __ STA T2 + 2 
2ad4 : 90 02 __ BCC $2ad8 ; (sortFileList_far.s63 + 0)
.s62:
2ad6 : c8 __ __ INY
2ad7 : 18 __ __ CLC
.s63:
2ad8 : 84 42 __ STY T2 + 3 
2ada : a9 00 __ LDA #$00
2adc : 85 4f __ STA T8 + 0 
.l21:
2ade : 65 3f __ ADC T2 + 0 
2ae0 : 85 43 __ STA T3 + 0 
2ae2 : 85 1b __ STA P0 
2ae4 : a5 40 __ LDA T2 + 1 
2ae6 : 69 00 __ ADC #$00
2ae8 : 85 44 __ STA T3 + 1 
2aea : 85 1c __ STA P1 
2aec : a5 41 __ LDA T2 + 2 
2aee : 69 00 __ ADC #$00
2af0 : 85 45 __ STA T3 + 2 
2af2 : 85 1d __ STA P2 
2af4 : a5 42 __ LDA T2 + 3 
2af6 : 69 00 __ ADC #$00
2af8 : 85 46 __ STA T3 + 3 
2afa : 85 1e __ STA P3 
2afc : 20 76 1f JSR $1f76 ; (FAR_PEEK.s4 + 0)
2aff : 85 1f __ STA P4 
2b01 : 18 __ __ CLC
2b02 : a5 3b __ LDA T1 + 0 
2b04 : 65 4f __ ADC T8 + 0 
2b06 : 85 1b __ STA P0 
2b08 : a5 3c __ LDA T1 + 1 
2b0a : 69 00 __ ADC #$00
2b0c : 85 1c __ STA P1 
2b0e : a5 3d __ LDA T1 + 2 
2b10 : 69 00 __ ADC #$00
2b12 : 85 1d __ STA P2 
2b14 : a5 3e __ LDA T1 + 3 
2b16 : 69 00 __ ADC #$00
2b18 : 85 1e __ STA P3 
2b1a : 20 50 0a JSR $0a50 ; (FAR_POKE.s4 + 0)
2b1d : a5 43 __ LDA T3 + 0 
2b1f : 85 1b __ STA P0 
2b21 : a5 44 __ LDA T3 + 1 
2b23 : 85 1c __ STA P1 
2b25 : a5 45 __ LDA T3 + 2 
2b27 : 85 1d __ STA P2 
2b29 : a5 46 __ LDA T3 + 3 
2b2b : 85 1e __ STA P3 
2b2d : 20 76 1f JSR $1f76 ; (FAR_PEEK.s4 + 0)
2b30 : aa __ __ TAX
2b31 : f0 08 __ BEQ $2b3b ; (sortFileList_far.s22 + 0)
.s23:
2b33 : e6 4f __ INC T8 + 0 
2b35 : a5 4f __ LDA T8 + 0 
2b37 : c9 78 __ CMP #$78
2b39 : 90 a3 __ BCC $2ade ; (sortFileList_far.l21 + 0)
.s22:
2b3b : a5 51 __ LDA T11 + 0 
2b3d : 85 1f __ STA P4 
2b3f : e6 4d __ INC T7 + 0 
2b41 : d0 02 __ BNE $2b45 ; (sortFileList_far.s65 + 0)
.s64:
2b43 : e6 4e __ INC T7 + 1 
.s65:
2b45 : a0 00 __ LDY #$00
2b47 : 24 4e __ BIT T7 + 1 
2b49 : 10 01 __ BPL $2b4c ; (sortFileList_far.s67 + 0)
.s66:
2b4b : 88 __ __ DEY
.s67:
2b4c : 18 __ __ CLC
2b4d : a5 4d __ LDA T7 + 0 
2b4f : 69 76 __ ADC #$76
2b51 : 85 1b __ STA P0 
2b53 : a5 4e __ LDA T7 + 1 
2b55 : 69 5e __ ADC #$5e
2b57 : 85 1c __ STA P1 
2b59 : 98 __ __ TYA
2b5a : 69 03 __ ADC #$03
2b5c : 85 1d __ STA P2 
2b5e : 90 01 __ BCC $2b61 ; (sortFileList_far.s69 + 0)
.s68:
2b60 : c8 __ __ INY
.s69:
2b61 : 84 1e __ STY P3 
2b63 : 20 50 0a JSR $0a50 ; (FAR_POKE.s4 + 0)
2b66 : 18 __ __ CLC
2b67 : a5 4d __ LDA T7 + 0 
2b69 : 69 fe __ ADC #$fe
2b6b : 85 4d __ STA T7 + 0 
2b6d : a5 4e __ LDA T7 + 1 
2b6f : 69 ff __ ADC #$ff
2b71 : 85 4e __ STA T7 + 1 
2b73 : 4c 23 29 JMP $2923 ; (sortFileList_far.l28 + 0)
.s26:
2b76 : a5 51 __ LDA T11 + 0 
2b78 : d0 03 __ BNE $2b7d ; (sortFileList_far.s26 + 7)
2b7a : 4c 88 2a JMP $2a88 ; (sortFileList_far.s20 + 0)
2b7d : 4c 59 29 JMP $2959 ; (sortFileList_far.s17 + 0)
--------------------------------------------------------------------
FAR_PEEKW: ; FAR_PEEKW(u32)->u16
; 214, "/mnt/d/F256/f256lib-oscar64/f256lib/f256lib.h"
.s4:
2b80 : a5 0f __ LDA $0f 
2b82 : 85 38 __ STA T2 + 0 
2b84 : 78 __ __ SEI
2b85 : a5 1b __ LDA P0 ; (address + 0)
2b87 : 85 35 __ STA T0 + 0 
2b89 : a5 1c __ LDA P1 ; (address + 1)
2b8b : 85 37 __ STA T1 + 0 
2b8d : a5 1e __ LDA P3 ; (address + 3)
2b8f : a2 05 __ LDX #$05
.l5:
2b91 : 4a __ __ LSR
2b92 : 66 1d __ ROR P2 ; (address + 2)
2b94 : 66 37 __ ROR T1 + 0 
2b96 : ca __ __ DEX
2b97 : d0 f8 __ BNE $2b91 ; (FAR_PEEKW.l5 + 0)
.s6:
2b99 : a5 37 __ LDA T1 + 0 
2b9b : 85 0f __ STA $0f 
2b9d : a5 1c __ LDA P1 ; (address + 1)
2b9f : 29 1f __ AND #$1f
2ba1 : 09 e0 __ ORA #$e0
2ba3 : 85 36 __ STA T0 + 1 
2ba5 : a0 00 __ LDY #$00
2ba7 : b1 35 __ LDA (T0 + 0),y 
2ba9 : aa __ __ TAX
2baa : c8 __ __ INY
2bab : b1 35 __ LDA (T0 + 0),y 
2bad : 86 35 __ STX T0 + 0 
2baf : 85 36 __ STA T0 + 1 
2bb1 : a5 38 __ LDA T2 + 0 
2bb3 : 85 0f __ STA $0f 
2bb5 : 58 __ __ CLI
2bb6 : a5 35 __ LDA T0 + 0 
2bb8 : 85 29 __ STA ACCU + 0 
2bba : a5 36 __ LDA T0 + 1 
2bbc : 85 2a __ STA ACCU + 1 
.s3:
2bbe : 60 __ __ RTS
--------------------------------------------------------------------
strcasecmp_local: ; strcasecmp_local(const u8*,const u8*)->i16
; 216, "/mnt/d/F256/f256lib-oscar64/doodles/modplayer/src/muFilePicker.c"
.s4:
2bbf : a0 00 __ LDY #$00
2bc1 : b1 1c __ LDA (P1),y ; (a + 0)
2bc3 : f0 58 __ BEQ $2c1d ; (strcasecmp_local.s5 + 0)
.s6:
2bc5 : a5 1e __ LDA P3 ; (b + 0)
2bc7 : 85 35 __ STA T1 + 0 
2bc9 : a5 1f __ LDA P4 ; (b + 1)
2bcb : 85 36 __ STA T1 + 1 
2bcd : b1 1e __ LDA (P3),y ; (b + 0)
2bcf : f0 4c __ BEQ $2c1d ; (strcasecmp_local.s5 + 0)
.l7:
2bd1 : 85 39 __ STA T3 + 0 
2bd3 : a5 1c __ LDA P1 ; (a + 0)
2bd5 : 85 37 __ STA T2 + 0 
2bd7 : a5 1d __ LDA P2 ; (a + 1)
2bd9 : 85 38 __ STA T2 + 1 
2bdb : b1 1c __ LDA (P1),y ; (a + 0)
2bdd : 20 0b 28 JSR $280b ; (tolower.s4 + 0)
2be0 : 85 3a __ STA T4 + 0 
2be2 : a5 39 __ LDA T3 + 0 
2be4 : 20 0b 28 JSR $280b ; (tolower.s4 + 0)
2be7 : c5 3a __ CMP T4 + 0 
2be9 : f0 0e __ BEQ $2bf9 ; (strcasecmp_local.s8 + 0)
.s10:
2beb : 49 ff __ EOR #$ff
2bed : 38 __ __ SEC
2bee : 65 3a __ ADC T4 + 0 
.s3:
2bf0 : 85 29 __ STA ACCU + 0 
2bf2 : a9 00 __ LDA #$00
2bf4 : e9 00 __ SBC #$00
2bf6 : 85 2a __ STA ACCU + 1 
2bf8 : 60 __ __ RTS
.s8:
2bf9 : e6 1c __ INC P1 ; (a + 0)
2bfb : d0 02 __ BNE $2bff ; (strcasecmp_local.s12 + 0)
.s11:
2bfd : e6 1d __ INC P2 ; (a + 1)
.s12:
2bff : 18 __ __ CLC
2c00 : a5 35 __ LDA T1 + 0 
2c02 : 69 01 __ ADC #$01
2c04 : 85 1e __ STA P3 ; (b + 0)
2c06 : a5 36 __ LDA T1 + 1 
2c08 : 69 00 __ ADC #$00
2c0a : 85 1f __ STA P4 ; (b + 1)
2c0c : a0 01 __ LDY #$01
2c0e : b1 37 __ LDA (T2 + 0),y 
2c10 : f0 0b __ BEQ $2c1d ; (strcasecmp_local.s5 + 0)
.s9:
2c12 : e6 35 __ INC T1 + 0 
2c14 : a5 1f __ LDA P4 ; (b + 1)
2c16 : 85 36 __ STA T1 + 1 
2c18 : 88 __ __ DEY
2c19 : b1 1e __ LDA (P3),y ; (b + 0)
2c1b : d0 b4 __ BNE $2bd1 ; (strcasecmp_local.l7 + 0)
.s5:
2c1d : a8 __ __ TAY
2c1e : b1 1c __ LDA (P1),y ; (a + 0)
2c20 : 20 0b 28 JSR $280b ; (tolower.s4 + 0)
2c23 : 85 35 __ STA T1 + 0 
2c25 : a0 00 __ LDY #$00
2c27 : b1 1e __ LDA (P3),y ; (b + 0)
2c29 : 20 0b 28 JSR $280b ; (tolower.s4 + 0)
2c2c : 49 ff __ EOR #$ff
2c2e : 38 __ __ SEC
2c2f : 65 35 __ ADC T1 + 0 
2c31 : 4c f0 2b JMP $2bf0 ; (strcasecmp_local.s3 + 0)
--------------------------------------------------------------------
displayFileList_far: ; displayFileList_far(i16)->void
;  94, "/mnt/d/F256/f256lib-oscar64/doodles/modplayer/src/muFilePicker.h"
.s1:
2c34 : a2 17 __ LDX #$17
2c36 : b5 55 __ LDA T0 + 0,x 
2c38 : 9d 79 9e STA $9e79,x ; (displayFileList_far@stack + 0)
2c3b : ca __ __ DEX
2c3c : 10 f8 __ BPL $2c36 ; (displayFileList_far.s1 + 2)
.s4:
2c3e : a9 00 __ LDA #$00
2c40 : 85 1b __ STA P0 
2c42 : 85 1c __ STA P1 
2c44 : 85 1e __ STA P3 
2c46 : a9 03 __ LDA #$03
2c48 : 85 1d __ STA P2 
2c4a : 20 76 1f JSR $1f76 ; (FAR_PEEK.s4 + 0)
2c4d : 85 6b __ STA T14 + 0 
2c4f : e6 1b __ INC P0 
2c51 : a9 03 __ LDA #$03
2c53 : 85 1d __ STA P2 
2c55 : 20 76 1f JSR $1f76 ; (FAR_PEEK.s4 + 0)
2c58 : 85 6c __ STA T15 + 0 
2c5a : a9 3e __ LDA #$3e
2c5c : 85 1b __ STA P0 
2c5e : a9 03 __ LDA #$03
2c60 : 85 1d __ STA P2 
2c62 : a9 5f __ LDA #$5f
2c64 : 85 1c __ STA P1 
2c66 : 20 80 2b JSR $2b80 ; (FAR_PEEKW.s4 + 0)
2c69 : a5 29 __ LDA ACCU + 0 
2c6b : 85 5b __ STA T2 + 0 
2c6d : a5 2a __ LDA ACCU + 1 
2c6f : 85 5c __ STA T2 + 1 
2c71 : a9 42 __ LDA #$42
2c73 : 85 1b __ STA P0 
2c75 : a9 03 __ LDA #$03
2c77 : 85 1d __ STA P2 
2c79 : 20 80 2b JSR $2b80 ; (FAR_PEEKW.s4 + 0)
2c7c : a5 29 __ LDA ACCU + 0 
2c7e : 85 5d __ STA T3 + 0 
2c80 : a5 2a __ LDA ACCU + 1 
2c82 : 85 5e __ STA T3 + 1 
2c84 : a9 46 __ LDA #$46
2c86 : 85 1b __ STA P0 
2c88 : a9 03 __ LDA #$03
2c8a : 85 1d __ STA P2 
2c8c : 20 80 2b JSR $2b80 ; (FAR_PEEKW.s4 + 0)
2c8f : a5 29 __ LDA ACCU + 0 
2c91 : 85 5f __ STA T4 + 0 
2c93 : a5 2a __ LDA ACCU + 1 
2c95 : 85 60 __ STA T4 + 1 
2c97 : ad ed 9f LDA $9fed ; (sstack + 22)
2c9a : 85 55 __ STA T0 + 0 
2c9c : 18 __ __ CLC
2c9d : 69 10 __ ADC #$10
2c9f : 85 61 __ STA T5 + 0 
2ca1 : ad ee 9f LDA $9fee ; (sstack + 23)
2ca4 : 85 56 __ STA T0 + 1 
2ca6 : 69 00 __ ADC #$00
2ca8 : 85 62 __ STA T5 + 1 
2caa : c5 5c __ CMP T2 + 1 
2cac : d0 04 __ BNE $2cb2 ; (displayFileList_far.s46 + 0)
.s45:
2cae : a5 61 __ LDA T5 + 0 
2cb0 : c5 5b __ CMP T2 + 0 
.s46:
2cb2 : 90 08 __ BCC $2cbc ; (displayFileList_far.s5 + 0)
.s44:
2cb4 : a5 5b __ LDA T2 + 0 
2cb6 : 85 61 __ STA T5 + 0 
2cb8 : a5 5c __ LDA T2 + 1 
2cba : 85 62 __ STA T5 + 1 
.s5:
2cbc : a5 6b __ LDA T14 + 0 
2cbe : 85 1b __ STA P0 
2cc0 : a5 6c __ LDA T15 + 0 
2cc2 : 85 1c __ STA P1 
2cc4 : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
2cc7 : 20 0f 2f JSR $2f0f ; (wipeArea_far.s1 + 0)
2cca : a5 6b __ LDA T14 + 0 
2ccc : 85 1b __ STA P0 
2cce : a5 6c __ LDA T15 + 0 
2cd0 : 85 1c __ STA P1 
2cd2 : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
2cd5 : 18 __ __ CLC
2cd6 : a5 55 __ LDA T0 + 0 
2cd8 : 69 01 __ ADC #$01
2cda : 85 63 __ STA T6 + 0 
2cdc : a5 56 __ LDA T0 + 1 
2cde : 69 00 __ ADC #$00
2ce0 : 85 64 __ STA T6 + 1 
2ce2 : a9 00 __ LDA #$00
2ce4 : 85 57 __ STA T1 + 0 
2ce6 : 18 __ __ CLC
.l6:
2ce7 : 69 b6 __ ADC #$b6
2ce9 : 85 1b __ STA P0 
2ceb : a9 00 __ LDA #$00
2ced : 85 1e __ STA P3 
2cef : 2a __ __ ROL
2cf0 : 85 1c __ STA P1 
2cf2 : a9 03 __ LDA #$03
2cf4 : 85 1d __ STA P2 
2cf6 : 20 76 1f JSR $1f76 ; (FAR_PEEK.s4 + 0)
2cf9 : a6 57 __ LDX T1 + 0 
2cfb : 9d 11 9f STA $9f11,x ; (nameBuf[0] + 0)
2cfe : aa __ __ TAX
2cff : f0 08 __ BEQ $2d09 ; (displayFileList_far.s7 + 0)
.s43:
2d01 : e6 57 __ INC T1 + 0 
2d03 : a5 57 __ LDA T1 + 0 
2d05 : c9 78 __ CMP #$78
2d07 : 90 de __ BCC $2ce7 ; (displayFileList_far.l6 + 0)
.s7:
2d09 : a9 76 __ LDA #$76
2d0b : 85 1b __ STA P0 
2d0d : a9 03 __ LDA #$03
2d0f : 85 1d __ STA P2 
2d11 : a9 5e __ LDA #$5e
2d13 : 85 1c __ STA P1 
2d15 : 20 76 1f JSR $1f76 ; (FAR_PEEK.s4 + 0)
2d18 : a8 __ __ TAY
2d19 : a9 11 __ LDA #$11
2d1b : 8d e3 9f STA $9fe3 ; (sstack + 12)
2d1e : a9 9f __ LDA #$9f
2d20 : 8d e4 9f STA $9fe4 ; (sstack + 13)
2d23 : a5 5f __ LDA T4 + 0 
2d25 : 05 60 __ ORA T4 + 1 
2d27 : d0 03 __ BNE $2d2c ; (displayFileList_far.s8 + 0)
2d29 : 4c fa 2e JMP $2efa ; (displayFileList_far.s42 + 0)
.s8:
2d2c : a9 20 __ LDA #$20
2d2e : 8d e1 9f STA $9fe1 ; (sstack + 10)
2d31 : a9 00 __ LDA #$00
2d33 : 8d e2 9f STA $9fe2 ; (sstack + 11)
2d36 : 98 __ __ TYA
2d37 : d0 07 __ BNE $2d40 ; (displayFileList_far.s41 + 0)
.s9:
2d39 : a9 1a __ LDA #$1a
2d3b : a0 fe __ LDY #$fe
2d3d : 4c 44 2d JMP $2d44 ; (displayFileList_far.s10 + 0)
.s41:
2d40 : a9 2f __ LDA #$2f
2d42 : a0 7d __ LDY #$7d
.s10:
2d44 : 8c e5 9f STY $9fe5 ; (sstack + 14)
2d47 : 8d e6 9f STA $9fe6 ; (sstack + 15)
2d4a : a9 76 __ LDA #$76
2d4c : 8d df 9f STA $9fdf ; (sstack + 8)
2d4f : a9 2f __ LDA #$2f
2d51 : 8d e0 9f STA $9fe0 ; (sstack + 9)
2d54 : 20 48 0c JSR $0c48 ; (printf.s4 + 0)
2d57 : a5 64 __ LDA T6 + 1 
2d59 : c5 62 __ CMP T5 + 1 
2d5b : d0 08 __ BNE $2d65 ; (displayFileList_far.s40 + 0)
.s37:
2d5d : a5 63 __ LDA T6 + 0 
2d5f : c5 61 __ CMP T5 + 0 
.s38:
2d61 : 90 08 __ BCC $2d6b ; (displayFileList_far.s21 + 0)
2d63 : b0 27 __ BCS $2d8c ; (displayFileList_far.s11 + 0)
.s40:
2d65 : 45 62 __ EOR T5 + 1 
2d67 : 10 f8 __ BPL $2d61 ; (displayFileList_far.s38 + 0)
.s39:
2d69 : 90 21 __ BCC $2d8c ; (displayFileList_far.s11 + 0)
.s21:
2d6b : a5 63 __ LDA T6 + 0 
2d6d : 85 29 __ STA ACCU + 0 
2d6f : 85 68 __ STA T9 + 0 
2d71 : a5 64 __ LDA T6 + 1 
2d73 : 85 2a __ STA ACCU + 1 
2d75 : 85 69 __ STA T9 + 1 
2d77 : a9 78 __ LDA #$78
2d79 : 20 47 45 JSR $4547 ; (mul16by8 + 0)
2d7c : a5 29 __ LDA ACCU + 0 
2d7e : 85 65 __ STA T7 + 0 
2d80 : a5 2a __ LDA ACCU + 1 
2d82 : 85 66 __ STA T7 + 1 
2d84 : a6 6c __ LDX T15 + 0 
2d86 : e8 __ __ INX
2d87 : 86 67 __ STX T8 + 0 
2d89 : 4c f9 2d JMP $2df9 ; (displayFileList_far.l22 + 0)
.s11:
2d8c : 18 __ __ CLC
2d8d : a5 6b __ LDA T14 + 0 
2d8f : 69 02 __ ADC #$02
2d91 : 85 1b __ STA P0 
2d93 : 38 __ __ SEC
2d94 : a5 61 __ LDA T5 + 0 
2d96 : e5 63 __ SBC T6 + 0 
2d98 : 38 __ __ SEC
2d99 : 65 6c __ ADC T15 + 0 
2d9b : 85 1c __ STA P1 
2d9d : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
2da0 : a9 8a __ LDA #$8a
2da2 : 8d df 9f STA $9fdf ; (sstack + 8)
2da5 : a9 2f __ LDA #$2f
2da7 : 8d e0 9f STA $9fe0 ; (sstack + 9)
2daa : a5 5e __ LDA T3 + 1 
2dac : d0 0a __ BNE $2db8 ; (displayFileList_far.s19 + 0)
.s20:
2dae : a5 5d __ LDA T3 + 0 
2db0 : c9 0f __ CMP #$0f
2db2 : b0 04 __ BCS $2db8 ; (displayFileList_far.s19 + 0)
.s12:
2db4 : a9 20 __ LDA #$20
2db6 : 90 02 __ BCC $2dba ; (displayFileList_far.s13 + 0)
.s19:
2db8 : a9 fb __ LDA #$fb
.s13:
2dba : 8d e1 9f STA $9fe1 ; (sstack + 10)
2dbd : a9 00 __ LDA #$00
2dbf : 8d e2 9f STA $9fe2 ; (sstack + 11)
2dc2 : 38 __ __ SEC
2dc3 : a5 5d __ LDA T3 + 0 
2dc5 : e5 5f __ SBC T4 + 0 
2dc7 : a8 __ __ TAY
2dc8 : a5 5e __ LDA T3 + 1 
2dca : e5 60 __ SBC T4 + 1 
2dcc : aa __ __ TAX
2dcd : 98 __ __ TYA
2dce : 18 __ __ CLC
2dcf : 69 10 __ ADC #$10
2dd1 : a8 __ __ TAY
2dd2 : 8a __ __ TXA
2dd3 : 69 00 __ ADC #$00
2dd5 : c5 5c __ CMP T2 + 1 
2dd7 : d0 02 __ BNE $2ddb ; (displayFileList_far.s18 + 0)
.s17:
2dd9 : c4 5b __ CPY T2 + 0 
.s18:
2ddb : b0 04 __ BCS $2de1 ; (displayFileList_far.s14 + 0)
.s16:
2ddd : a9 f8 __ LDA #$f8
2ddf : 90 02 __ BCC $2de3 ; (displayFileList_far.s15 + 0)
.s14:
2de1 : a9 20 __ LDA #$20
.s15:
2de3 : 8d e3 9f STA $9fe3 ; (sstack + 12)
2de6 : a9 00 __ LDA #$00
2de8 : 8d e4 9f STA $9fe4 ; (sstack + 13)
2deb : 20 48 0c JSR $0c48 ; (printf.s4 + 0)
.s3:
2dee : a2 17 __ LDX #$17
2df0 : bd 79 9e LDA $9e79,x ; (displayFileList_far@stack + 0)
2df3 : 95 55 __ STA T0 + 0,x 
2df5 : ca __ __ DEX
2df6 : 10 f8 __ BPL $2df0 ; (displayFileList_far.s3 + 2)
2df8 : 60 __ __ RTS
.l22:
2df9 : a5 6b __ LDA T14 + 0 
2dfb : 85 1b __ STA P0 
2dfd : a5 67 __ LDA T8 + 0 
2dff : 85 1c __ STA P1 
2e01 : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
2e04 : a5 5e __ LDA T3 + 1 
2e06 : c5 69 __ CMP T9 + 1 
2e08 : d0 0a __ BNE $2e14 ; (displayFileList_far.s23 + 0)
.s36:
2e0a : a5 5d __ LDA T3 + 0 
2e0c : c5 68 __ CMP T9 + 0 
2e0e : d0 04 __ BNE $2e14 ; (displayFileList_far.s23 + 0)
.s35:
2e10 : a9 fa __ LDA #$fa
2e12 : d0 02 __ BNE $2e16 ; (displayFileList_far.s24 + 0)
.s23:
2e14 : a9 20 __ LDA #$20
.s24:
2e16 : 8d e1 9f STA $9fe1 ; (sstack + 10)
2e19 : a9 00 __ LDA #$00
2e1b : 8d e2 9f STA $9fe2 ; (sstack + 11)
2e1e : a9 7f __ LDA #$7f
2e20 : 8d df 9f STA $9fdf ; (sstack + 8)
2e23 : a9 2f __ LDA #$2f
2e25 : 8d e0 9f STA $9fe0 ; (sstack + 9)
2e28 : 20 48 0c JSR $0c48 ; (printf.s4 + 0)
2e2b : a0 00 __ LDY #$00
2e2d : 24 66 __ BIT T7 + 1 
2e2f : 10 01 __ BPL $2e32 ; (displayFileList_far.s48 + 0)
.s47:
2e31 : 88 __ __ DEY
.s48:
2e32 : 18 __ __ CLC
2e33 : a5 65 __ LDA T7 + 0 
2e35 : 69 b6 __ ADC #$b6
2e37 : 85 57 __ STA T1 + 0 
2e39 : a5 66 __ LDA T7 + 1 
2e3b : 69 00 __ ADC #$00
2e3d : 85 58 __ STA T1 + 1 
2e3f : 98 __ __ TYA
2e40 : 69 03 __ ADC #$03
2e42 : 85 59 __ STA T1 + 2 
2e44 : 90 02 __ BCC $2e48 ; (displayFileList_far.s50 + 0)
.s49:
2e46 : c8 __ __ INY
2e47 : 18 __ __ CLC
.s50:
2e48 : 84 5a __ STY T1 + 3 
2e4a : a9 00 __ LDA #$00
2e4c : 85 6a __ STA T11 + 0 
.l25:
2e4e : 65 57 __ ADC T1 + 0 
2e50 : 85 1b __ STA P0 
2e52 : a5 58 __ LDA T1 + 1 
2e54 : 69 00 __ ADC #$00
2e56 : 85 1c __ STA P1 
2e58 : a5 59 __ LDA T1 + 2 
2e5a : 69 00 __ ADC #$00
2e5c : 85 1d __ STA P2 
2e5e : a5 5a __ LDA T1 + 3 
2e60 : 69 00 __ ADC #$00
2e62 : 85 1e __ STA P3 
2e64 : 20 76 1f JSR $1f76 ; (FAR_PEEK.s4 + 0)
2e67 : a6 6a __ LDX T11 + 0 
2e69 : 9d 99 9e STA $9e99,x ; (nameBuf[0] + 0)
2e6c : aa __ __ TAX
2e6d : f0 08 __ BEQ $2e77 ; (displayFileList_far.s26 + 0)
.s34:
2e6f : e6 6a __ INC T11 + 0 
2e71 : a5 6a __ LDA T11 + 0 
2e73 : c9 77 __ CMP #$77
2e75 : 90 d7 __ BCC $2e4e ; (displayFileList_far.l25 + 0)
.s26:
2e77 : a5 69 __ LDA T9 + 1 
2e79 : 0a __ __ ASL
2e7a : a9 00 __ LDA #$00
2e7c : 8d 10 9f STA $9f10 ; (nameBuf[0] + 119)
2e7f : 69 ff __ ADC #$ff
2e81 : 49 ff __ EOR #$ff
2e83 : a8 __ __ TAY
2e84 : 18 __ __ CLC
2e85 : a5 68 __ LDA T9 + 0 
2e87 : 69 76 __ ADC #$76
2e89 : 85 1b __ STA P0 
2e8b : a5 69 __ LDA T9 + 1 
2e8d : 69 5e __ ADC #$5e
2e8f : 85 1c __ STA P1 
2e91 : 98 __ __ TYA
2e92 : 69 03 __ ADC #$03
2e94 : 85 1d __ STA P2 
2e96 : 90 01 __ BCC $2e99 ; (displayFileList_far.s52 + 0)
.s51:
2e98 : c8 __ __ INY
.s52:
2e99 : 84 1e __ STY P3 
2e9b : 20 76 1f JSR $1f76 ; (FAR_PEEK.s4 + 0)
2e9e : a2 99 __ LDX #$99
2ea0 : 8e e1 9f STX $9fe1 ; (sstack + 10)
2ea3 : a2 9e __ LDX #$9e
2ea5 : 8e e2 9f STX $9fe2 ; (sstack + 11)
2ea8 : aa __ __ TAX
2ea9 : d0 07 __ BNE $2eb2 ; (displayFileList_far.s33 + 0)
.s27:
2eab : a9 1a __ LDA #$1a
2ead : a0 fe __ LDY #$fe
2eaf : 4c b6 2e JMP $2eb6 ; (displayFileList_far.s28 + 0)
.s33:
2eb2 : a9 2f __ LDA #$2f
2eb4 : a0 7d __ LDY #$7d
.s28:
2eb6 : 8c e3 9f STY $9fe3 ; (sstack + 12)
2eb9 : 8d e4 9f STA $9fe4 ; (sstack + 13)
2ebc : a9 82 __ LDA #$82
2ebe : 8d df 9f STA $9fdf ; (sstack + 8)
2ec1 : a9 2f __ LDA #$2f
2ec3 : 8d e0 9f STA $9fe0 ; (sstack + 9)
2ec6 : 20 48 0c JSR $0c48 ; (printf.s4 + 0)
2ec9 : 18 __ __ CLC
2eca : a5 65 __ LDA T7 + 0 
2ecc : 69 78 __ ADC #$78
2ece : 85 65 __ STA T7 + 0 
2ed0 : 90 02 __ BCC $2ed4 ; (displayFileList_far.s54 + 0)
.s53:
2ed2 : e6 66 __ INC T7 + 1 
.s54:
2ed4 : e6 67 __ INC T8 + 0 
2ed6 : e6 68 __ INC T9 + 0 
2ed8 : d0 02 __ BNE $2edc ; (displayFileList_far.s56 + 0)
.s55:
2eda : e6 69 __ INC T9 + 1 
.s56:
2edc : a5 69 __ LDA T9 + 1 
2ede : c5 62 __ CMP T5 + 1 
2ee0 : d0 07 __ BNE $2ee9 ; (displayFileList_far.s32 + 0)
.s29:
2ee2 : a5 68 __ LDA T9 + 0 
2ee4 : c5 61 __ CMP T5 + 0 
2ee6 : 4c ed 2e JMP $2eed ; (displayFileList_far.s30 + 0)
.s32:
2ee9 : 45 62 __ EOR T5 + 1 
2eeb : 30 08 __ BMI $2ef5 ; (displayFileList_far.s31 + 0)
.s30:
2eed : b0 03 __ BCS $2ef2 ; (displayFileList_far.s30 + 5)
2eef : 4c f9 2d JMP $2df9 ; (displayFileList_far.l22 + 0)
2ef2 : 4c 8c 2d JMP $2d8c ; (displayFileList_far.s11 + 0)
.s31:
2ef5 : b0 f8 __ BCS $2eef ; (displayFileList_far.s30 + 2)
2ef7 : 4c 8c 2d JMP $2d8c ; (displayFileList_far.s11 + 0)
.s42:
2efa : 8d e2 9f STA $9fe2 ; (sstack + 11)
2efd : 85 5f __ STA T4 + 0 
2eff : 85 60 __ STA T4 + 1 
2f01 : a9 fa __ LDA #$fa
2f03 : 8d e1 9f STA $9fe1 ; (sstack + 10)
2f06 : 98 __ __ TYA
2f07 : f0 03 __ BEQ $2f0c ; (displayFileList_far.s42 + 18)
2f09 : 4c 40 2d JMP $2d40 ; (displayFileList_far.s41 + 0)
2f0c : 4c 39 2d JMP $2d39 ; (displayFileList_far.s9 + 0)
--------------------------------------------------------------------
wipeArea_far: ; wipeArea_far()->void
;  96, "/mnt/d/F256/f256lib-oscar64/doodles/modplayer/src/muFilePicker.h"
.s1:
2f0f : a5 55 __ LDA T4 + 0 
2f11 : 8d 89 9f STA $9f89 ; (wipeArea_far@stack + 0)
2f14 : a5 56 __ LDA T5 + 0 
2f16 : 8d 8a 9f STA $9f8a ; (wipeArea_far@stack + 1)
.s4:
2f19 : a9 00 __ LDA #$00
2f1b : 85 1c __ STA P1 
2f1d : 85 1e __ STA P3 
2f1f : a9 01 __ LDA #$01
2f21 : 85 1b __ STA P0 
2f23 : a9 03 __ LDA #$03
2f25 : 85 1d __ STA P2 
2f27 : 20 76 1f JSR $1f76 ; (FAR_PEEK.s4 + 0)
2f2a : 85 53 __ STA T2 + 0 
2f2c : c9 50 __ CMP #$50
2f2e : a9 11 __ LDA #$11
2f30 : 85 55 __ STA T4 + 0 
2f32 : a9 00 __ LDA #$00
2f34 : 6a __ __ ROR
2f35 : 85 54 __ STA T3 + 0 
2f37 : 10 15 __ BPL $2f4e ; (wipeArea_far.l7 + 0)
.l5:
2f39 : a9 74 __ LDA #$74
2f3b : 8d df 9f STA $9fdf ; (sstack + 8)
2f3e : a9 2f __ LDA #$2f
2f40 : 8d e0 9f STA $9fe0 ; (sstack + 9)
2f43 : 20 48 0c JSR $0c48 ; (printf.s4 + 0)
2f46 : c6 55 __ DEC T4 + 0 
2f48 : f0 1f __ BEQ $2f69 ; (wipeArea_far.s3 + 0)
.s6:
2f4a : 24 54 __ BIT T3 + 0 
2f4c : 30 eb __ BMI $2f39 ; (wipeArea_far.l5 + 0)
.l7:
2f4e : a5 53 __ LDA T2 + 0 
2f50 : 85 56 __ STA T5 + 0 
.l8:
2f52 : a9 fe __ LDA #$fe
2f54 : 8d df 9f STA $9fdf ; (sstack + 8)
2f57 : a9 1a __ LDA #$1a
2f59 : 8d e0 9f STA $9fe0 ; (sstack + 9)
2f5c : 20 48 0c JSR $0c48 ; (printf.s4 + 0)
2f5f : e6 56 __ INC T5 + 0 
2f61 : a5 56 __ LDA T5 + 0 
2f63 : c9 50 __ CMP #$50
2f65 : 90 eb __ BCC $2f52 ; (wipeArea_far.l8 + 0)
2f67 : b0 d0 __ BCS $2f39 ; (wipeArea_far.l5 + 0)
.s3:
2f69 : ad 89 9f LDA $9f89 ; (wipeArea_far@stack + 0)
2f6c : 85 55 __ STA T4 + 0 
2f6e : ad 8a 9f LDA $9f8a ; (wipeArea_far@stack + 1)
2f71 : 85 56 __ STA T5 + 0 
2f73 : 60 __ __ RTS
--------------------------------------------------------------------
2f74 : __ __ __ BYT 0a 00                                           : ..
--------------------------------------------------------------------
2f76 : __ __ __ BYT 25 63 25 73 25 73 00                            : %c%s%s.
--------------------------------------------------------------------
2f7d : __ __ __ BYT 2f 00                                           : /.
--------------------------------------------------------------------
2f7f : __ __ __ BYT 25 63 00                                        : %c.
--------------------------------------------------------------------
2f82 : __ __ __ BYT 25 2e 37 35 73 25 73 00                         : %.75s%s.
--------------------------------------------------------------------
2f8a : __ __ __ BYT 25 63 20 25 63 00                               : %c %c.
--------------------------------------------------------------------
pickFile_far: ; pickFile_far()->u8
;  70, "/mnt/d/F256/f256lib-oscar64/doodles/modplayer/src/muFilePicker.h"
.s1:
2f90 : a2 0d __ LDX #$0d
2f92 : b5 55 __ LDA T0 + 0,x 
2f94 : 9d 67 9e STA $9e67,x ; (pickFile_far@stack + 0)
2f97 : ca __ __ DEX
2f98 : 10 f8 __ BPL $2f92 ; (pickFile_far.s1 + 2)
.l4:
2f9a : 20 20 35 JSR $3520 ; (kernelNextEvent.s4 + 0)
2f9d : ad f3 4c LDA $4cf3 ; (kernelEventData.type + 0)
2fa0 : c9 08 __ CMP #$08
2fa2 : d0 f6 __ BNE $2f9a ; (pickFile_far.l4 + 0)
.s5:
2fa4 : ad f7 4c LDA $4cf7 ; (kernelEventData.u + 1)
2fa7 : c9 b7 __ CMP #$b7
2fa9 : d0 03 __ BNE $2fae ; (pickFile_far.s6 + 0)
2fab : 4c af 33 JMP $33af ; (pickFile_far.s31 + 0)
.s6:
2fae : b0 03 __ BCS $2fb3 ; (pickFile_far.s7 + 0)
2fb0 : 4c c4 31 JMP $31c4 ; (pickFile_far.s17 + 0)
.s7:
2fb3 : c9 b8 __ CMP #$b8
2fb5 : d0 03 __ BNE $2fba ; (pickFile_far.s8 + 0)
2fb7 : 4c f0 30 JMP $30f0 ; (pickFile_far.s14 + 0)
.s8:
2fba : c9 b9 __ CMP #$b9
2fbc : d0 dc __ BNE $2f9a ; (pickFile_far.l4 + 0)
.s9:
2fbe : a9 42 __ LDA #$42
2fc0 : 85 1b __ STA P0 
2fc2 : a9 00 __ LDA #$00
2fc4 : 85 1e __ STA P3 
2fc6 : a9 5f __ LDA #$5f
2fc8 : 85 1c __ STA P1 
2fca : a9 03 __ LDA #$03
2fcc : 85 1d __ STA P2 
2fce : 20 80 2b JSR $2b80 ; (FAR_PEEKW.s4 + 0)
2fd1 : a5 29 __ LDA ACCU + 0 
2fd3 : 85 57 __ STA T1 + 0 
2fd5 : a5 2a __ LDA ACCU + 1 
2fd7 : 85 58 __ STA T1 + 1 
2fd9 : a9 46 __ LDA #$46
2fdb : 85 1b __ STA P0 
2fdd : a9 03 __ LDA #$03
2fdf : 85 1d __ STA P2 
2fe1 : 20 80 2b JSR $2b80 ; (FAR_PEEKW.s4 + 0)
2fe4 : a5 29 __ LDA ACCU + 0 
2fe6 : 85 5b __ STA T2 + 0 
2fe8 : a5 2a __ LDA ACCU + 1 
2fea : 85 5c __ STA T2 + 1 
2fec : a9 4a __ LDA #$4a
2fee : 85 1b __ STA P0 
2ff0 : a9 03 __ LDA #$03
2ff2 : 85 1d __ STA P2 
2ff4 : 20 80 2b JSR $2b80 ; (FAR_PEEKW.s4 + 0)
2ff7 : a5 29 __ LDA ACCU + 0 
2ff9 : 85 5d __ STA T3 + 0 
2ffb : a5 2a __ LDA ACCU + 1 
2ffd : 85 5e __ STA T3 + 1 
2fff : a9 3e __ LDA #$3e
3001 : 85 1b __ STA P0 
3003 : a9 03 __ LDA #$03
3005 : 85 1d __ STA P2 
3007 : 20 80 2b JSR $2b80 ; (FAR_PEEKW.s4 + 0)
300a : a5 29 __ LDA ACCU + 0 
300c : 85 5f __ STA T4 + 0 
300e : a5 2a __ LDA ACCU + 1 
3010 : 85 60 __ STA T4 + 1 
3012 : a9 00 __ LDA #$00
3014 : 85 1b __ STA P0 
3016 : 85 1c __ STA P1 
3018 : a9 03 __ LDA #$03
301a : 85 1d __ STA P2 
301c : 20 76 1f JSR $1f76 ; (FAR_PEEK.s4 + 0)
301f : 85 62 __ STA T6 + 0 
3021 : e6 1b __ INC P0 
3023 : a9 03 __ LDA #$03
3025 : 85 1d __ STA P2 
3027 : 20 76 1f JSR $1f76 ; (FAR_PEEK.s4 + 0)
302a : 85 61 __ STA T5 + 0 
302c : 38 __ __ SEC
302d : a5 57 __ LDA T1 + 0 
302f : e5 5b __ SBC T2 + 0 
3031 : a8 __ __ TAY
3032 : a5 58 __ LDA T1 + 1 
3034 : e5 5c __ SBC T2 + 1 
3036 : aa __ __ TAX
3037 : 98 __ __ TYA
3038 : 18 __ __ CLC
3039 : 69 10 __ ADC #$10
303b : a8 __ __ TAY
303c : 8a __ __ TXA
303d : 69 00 __ ADC #$00
303f : c5 60 __ CMP T4 + 1 
3041 : d0 02 __ BNE $3045 ; (pickFile_far.s13 + 0)
.s12:
3043 : c4 5f __ CPY T4 + 0 
.s13:
3045 : 90 03 __ BCC $304a ; (pickFile_far.s10 + 0)
3047 : 4c 9a 2f JMP $2f9a ; (pickFile_far.l4 + 0)
.s10:
304a : a5 62 __ LDA T6 + 0 
304c : 85 1b __ STA P0 
304e : a5 61 __ LDA T5 + 0 
3050 : 65 5b __ ADC T2 + 0 
3052 : 85 1c __ STA P1 
3054 : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
3057 : a9 20 __ LDA #$20
3059 : 8d e1 9f STA $9fe1 ; (sstack + 10)
305c : a9 00 __ LDA #$00
305e : 8d e2 9f STA $9fe2 ; (sstack + 11)
3061 : a9 7f __ LDA #$7f
3063 : 8d df 9f STA $9fdf ; (sstack + 8)
3066 : a9 2f __ LDA #$2f
3068 : 8d e0 9f STA $9fe0 ; (sstack + 9)
306b : 20 48 0c JSR $0c48 ; (printf.s4 + 0)
306e : a9 42 __ LDA #$42
3070 : 85 1b __ STA P0 
3072 : a9 5f __ LDA #$5f
3074 : 85 1c __ STA P1 
3076 : a9 03 __ LDA #$03
3078 : 85 1d __ STA P2 
307a : 38 __ __ SEC
307b : a9 0f __ LDA #$0f
307d : e5 5b __ SBC T2 + 0 
307f : aa __ __ TAX
3080 : a9 00 __ LDA #$00
3082 : 85 1e __ STA P3 
3084 : e5 5c __ SBC T2 + 1 
3086 : a8 __ __ TAY
3087 : 8a __ __ TXA
3088 : 18 __ __ CLC
3089 : 65 57 __ ADC T1 + 0 
308b : 85 1f __ STA P4 
308d : 98 __ __ TYA
308e : 65 58 __ ADC T1 + 1 
3090 : 85 20 __ STA P5 
3092 : 20 44 24 JSR $2444 ; (FAR_POKEW.s4 + 0)
3095 : a9 00 __ LDA #$00
3097 : 85 1f __ STA P4 
3099 : 85 20 __ STA P5 
309b : a9 46 __ LDA #$46
309d : 85 1b __ STA P0 
309f : a9 03 __ LDA #$03
30a1 : 85 1d __ STA P2 
30a3 : 20 44 24 JSR $2444 ; (FAR_POKEW.s4 + 0)
30a6 : a9 4a __ LDA #$4a
30a8 : 85 1b __ STA P0 
30aa : a9 03 __ LDA #$03
30ac : 85 1d __ STA P2 
30ae : 18 __ __ CLC
30af : a5 5d __ LDA T3 + 0 
30b1 : 69 0f __ ADC #$0f
30b3 : 85 1f __ STA P4 
30b5 : a5 5e __ LDA T3 + 1 
30b7 : 69 00 __ ADC #$00
30b9 : 85 20 __ STA P5 
30bb : 20 44 24 JSR $2444 ; (FAR_POKEW.s4 + 0)
30be : a5 1f __ LDA P4 
30c0 : 8d ed 9f STA $9fed ; (sstack + 22)
30c3 : a5 20 __ LDA P5 
30c5 : 8d ee 9f STA $9fee ; (sstack + 23)
30c8 : 20 34 2c JSR $2c34 ; (displayFileList_far.s1 + 0)
30cb : a5 62 __ LDA T6 + 0 
30cd : 85 1b __ STA P0 
30cf : a5 61 __ LDA T5 + 0 
.s11:
30d1 : 85 1c __ STA P1 
30d3 : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
30d6 : a9 7f __ LDA #$7f
30d8 : 8d df 9f STA $9fdf ; (sstack + 8)
30db : a9 2f __ LDA #$2f
30dd : 8d e0 9f STA $9fe0 ; (sstack + 9)
30e0 : a9 fa __ LDA #$fa
30e2 : 8d e1 9f STA $9fe1 ; (sstack + 10)
30e5 : a9 00 __ LDA #$00
30e7 : 8d e2 9f STA $9fe2 ; (sstack + 11)
30ea : 20 48 0c JSR $0c48 ; (printf.s4 + 0)
30ed : 4c 9a 2f JMP $2f9a ; (pickFile_far.l4 + 0)
.s14:
30f0 : a9 42 __ LDA #$42
30f2 : 85 1b __ STA P0 
30f4 : a9 00 __ LDA #$00
30f6 : 85 1e __ STA P3 
30f8 : a9 5f __ LDA #$5f
30fa : 85 1c __ STA P1 
30fc : a9 03 __ LDA #$03
30fe : 85 1d __ STA P2 
3100 : 20 80 2b JSR $2b80 ; (FAR_PEEKW.s4 + 0)
3103 : a5 29 __ LDA ACCU + 0 
3105 : 85 57 __ STA T1 + 0 
3107 : a5 2a __ LDA ACCU + 1 
3109 : 85 58 __ STA T1 + 1 
310b : a9 46 __ LDA #$46
310d : 85 1b __ STA P0 
310f : a9 03 __ LDA #$03
3111 : 85 1d __ STA P2 
3113 : 20 80 2b JSR $2b80 ; (FAR_PEEKW.s4 + 0)
3116 : a5 29 __ LDA ACCU + 0 
3118 : 85 5b __ STA T2 + 0 
311a : a9 4a __ LDA #$4a
311c : 85 1b __ STA P0 
311e : a9 03 __ LDA #$03
3120 : 85 1d __ STA P2 
3122 : 20 80 2b JSR $2b80 ; (FAR_PEEKW.s4 + 0)
3125 : a5 29 __ LDA ACCU + 0 
3127 : 85 5d __ STA T3 + 0 
3129 : a5 2a __ LDA ACCU + 1 
312b : 85 5e __ STA T3 + 1 
312d : a9 00 __ LDA #$00
312f : 85 1b __ STA P0 
3131 : 85 1c __ STA P1 
3133 : a9 03 __ LDA #$03
3135 : 85 1d __ STA P2 
3137 : 20 76 1f JSR $1f76 ; (FAR_PEEK.s4 + 0)
313a : 85 61 __ STA T5 + 0 
313c : e6 1b __ INC P0 
313e : a9 03 __ LDA #$03
3140 : 85 1d __ STA P2 
3142 : 20 76 1f JSR $1f76 ; (FAR_PEEK.s4 + 0)
3145 : a8 __ __ TAY
3146 : a5 58 __ LDA T1 + 1 
3148 : d0 06 __ BNE $3150 ; (pickFile_far.s15 + 0)
.s16:
314a : a5 57 __ LDA T1 + 0 
314c : c9 0f __ CMP #$0f
314e : 90 9d __ BCC $30ed ; (pickFile_far.s11 + 28)
.s15:
3150 : a5 61 __ LDA T5 + 0 
3152 : 85 1b __ STA P0 
3154 : 98 __ __ TYA
3155 : 18 __ __ CLC
3156 : 65 5b __ ADC T2 + 0 
3158 : 85 5b __ STA T2 + 0 
315a : 85 1c __ STA P1 
315c : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
315f : a9 20 __ LDA #$20
3161 : 8d e1 9f STA $9fe1 ; (sstack + 10)
3164 : a9 00 __ LDA #$00
3166 : 8d e2 9f STA $9fe2 ; (sstack + 11)
3169 : a9 7f __ LDA #$7f
316b : 8d df 9f STA $9fdf ; (sstack + 8)
316e : a9 2f __ LDA #$2f
3170 : 8d e0 9f STA $9fe0 ; (sstack + 9)
3173 : 20 48 0c JSR $0c48 ; (printf.s4 + 0)
3176 : a9 42 __ LDA #$42
3178 : 85 1b __ STA P0 
317a : a9 5f __ LDA #$5f
317c : 85 1c __ STA P1 
317e : a9 03 __ LDA #$03
3180 : 85 1d __ STA P2 
3182 : a9 00 __ LDA #$00
3184 : 85 1e __ STA P3 
3186 : 38 __ __ SEC
3187 : a5 57 __ LDA T1 + 0 
3189 : e9 0f __ SBC #$0f
318b : 85 1f __ STA P4 
318d : a5 58 __ LDA T1 + 1 
318f : e9 00 __ SBC #$00
3191 : 85 20 __ STA P5 
3193 : 20 44 24 JSR $2444 ; (FAR_POKEW.s4 + 0)
3196 : a9 4a __ LDA #$4a
3198 : 85 1b __ STA P0 
319a : a9 03 __ LDA #$03
319c : 85 1d __ STA P2 
319e : 38 __ __ SEC
319f : a5 5d __ LDA T3 + 0 
31a1 : e9 0f __ SBC #$0f
31a3 : 85 1f __ STA P4 
31a5 : a5 5e __ LDA T3 + 1 
31a7 : e9 00 __ SBC #$00
31a9 : 85 20 __ STA P5 
31ab : 20 44 24 JSR $2444 ; (FAR_POKEW.s4 + 0)
31ae : a5 1f __ LDA P4 
31b0 : 8d ed 9f STA $9fed ; (sstack + 22)
31b3 : a5 20 __ LDA P5 
31b5 : 8d ee 9f STA $9fee ; (sstack + 23)
31b8 : 20 34 2c JSR $2c34 ; (displayFileList_far.s1 + 0)
31bb : a5 61 __ LDA T5 + 0 
31bd : 85 1b __ STA P0 
31bf : a5 5b __ LDA T2 + 0 
31c1 : 4c d1 30 JMP $30d1 ; (pickFile_far.s11 + 0)
.s17:
31c4 : c9 94 __ CMP #$94
31c6 : d0 3f __ BNE $3207 ; (pickFile_far.s18 + 0)
.s26:
31c8 : a9 42 __ LDA #$42
31ca : 85 1b __ STA P0 
31cc : a9 00 __ LDA #$00
31ce : 85 1e __ STA P3 
31d0 : a9 5f __ LDA #$5f
31d2 : 85 1c __ STA P1 
31d4 : a9 03 __ LDA #$03
31d6 : 85 1d __ STA P2 
31d8 : 20 80 2b JSR $2b80 ; (FAR_PEEKW.s4 + 0)
31db : a5 29 __ LDA ACCU + 0 
31dd : 85 5d __ STA T3 + 0 
31df : a5 2a __ LDA ACCU + 1 
31e1 : 85 5e __ STA T3 + 1 
31e3 : a9 78 __ LDA #$78
31e5 : 20 47 45 JSR $4547 ; (mul16by8 + 0)
31e8 : 18 __ __ CLC
31e9 : a5 29 __ LDA ACCU + 0 
31eb : 69 b6 __ ADC #$b6
31ed : 85 57 __ STA T1 + 0 
31ef : a5 2a __ LDA ACCU + 1 
31f1 : 69 00 __ ADC #$00
31f3 : 85 58 __ STA T1 + 1 
31f5 : a9 00 __ LDA #$00
31f7 : 69 03 __ ADC #$03
31f9 : 85 59 __ STA T1 + 2 
31fb : a9 00 __ LDA #$00
31fd : 2a __ __ ROL
31fe : 85 5a __ STA T1 + 3 
3200 : a9 00 __ LDA #$00
3202 : 85 5f __ STA T4 + 0 
3204 : 4c 33 33 JMP $3333 ; (pickFile_far.l27 + 0)
.s18:
3207 : b0 16 __ BCS $321f ; (pickFile_far.s19 + 0)
.s24:
3209 : c9 92 __ CMP #$92
320b : f0 03 __ BEQ $3210 ; (pickFile_far.s25 + 0)
320d : 4c 9a 2f JMP $2f9a ; (pickFile_far.l4 + 0)
.s25:
3210 : a9 03 __ LDA #$03
.s3:
3212 : 85 29 __ STA ACCU + 0 
3214 : a2 0d __ LDX #$0d
3216 : bd 67 9e LDA $9e67,x ; (pickFile_far@stack + 0)
3219 : 95 55 __ STA T0 + 0,x 
321b : ca __ __ DEX
321c : 10 f8 __ BPL $3216 ; (pickFile_far.s3 + 4)
321e : 60 __ __ RTS
.s19:
321f : c9 b6 __ CMP #$b6
3221 : d0 ea __ BNE $320d ; (pickFile_far.s24 + 4)
.s20:
3223 : a9 42 __ LDA #$42
3225 : 85 1b __ STA P0 
3227 : a9 00 __ LDA #$00
3229 : 85 1e __ STA P3 
322b : a9 5f __ LDA #$5f
322d : 85 1c __ STA P1 
322f : a9 03 __ LDA #$03
3231 : 85 1d __ STA P2 
3233 : 20 80 2b JSR $2b80 ; (FAR_PEEKW.s4 + 0)
3236 : a5 29 __ LDA ACCU + 0 
3238 : 85 57 __ STA T1 + 0 
323a : a5 2a __ LDA ACCU + 1 
323c : 85 58 __ STA T1 + 1 
323e : a9 46 __ LDA #$46
3240 : 85 1b __ STA P0 
3242 : a9 03 __ LDA #$03
3244 : 85 1d __ STA P2 
3246 : 20 80 2b JSR $2b80 ; (FAR_PEEKW.s4 + 0)
3249 : a5 29 __ LDA ACCU + 0 
324b : 85 5b __ STA T2 + 0 
324d : a5 2a __ LDA ACCU + 1 
324f : 85 5c __ STA T2 + 1 
3251 : a9 4a __ LDA #$4a
3253 : 85 1b __ STA P0 
3255 : a9 03 __ LDA #$03
3257 : 85 1d __ STA P2 
3259 : 20 80 2b JSR $2b80 ; (FAR_PEEKW.s4 + 0)
325c : a5 29 __ LDA ACCU + 0 
325e : 85 5d __ STA T3 + 0 
3260 : a5 2a __ LDA ACCU + 1 
3262 : 85 5e __ STA T3 + 1 
3264 : a9 00 __ LDA #$00
3266 : 85 1b __ STA P0 
3268 : 85 1c __ STA P1 
326a : a9 03 __ LDA #$03
326c : 85 1d __ STA P2 
326e : 20 76 1f JSR $1f76 ; (FAR_PEEK.s4 + 0)
3271 : 85 61 __ STA T5 + 0 
3273 : e6 1b __ INC P0 
3275 : a9 03 __ LDA #$03
3277 : 85 1d __ STA P2 
3279 : 20 76 1f JSR $1f76 ; (FAR_PEEK.s4 + 0)
327c : 85 55 __ STA T0 + 0 
327e : a5 57 __ LDA T1 + 0 
3280 : 05 58 __ ORA T1 + 1 
3282 : f0 89 __ BEQ $320d ; (pickFile_far.s24 + 4)
.s21:
3284 : a5 61 __ LDA T5 + 0 
3286 : 85 1b __ STA P0 
3288 : 18 __ __ CLC
3289 : a5 55 __ LDA T0 + 0 
328b : 65 5b __ ADC T2 + 0 
328d : 85 1c __ STA P1 
328f : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
3292 : a9 20 __ LDA #$20
3294 : 8d e1 9f STA $9fe1 ; (sstack + 10)
3297 : a9 00 __ LDA #$00
3299 : 8d e2 9f STA $9fe2 ; (sstack + 11)
329c : a9 7f __ LDA #$7f
329e : 8d df 9f STA $9fdf ; (sstack + 8)
32a1 : a9 2f __ LDA #$2f
32a3 : 8d e0 9f STA $9fe0 ; (sstack + 9)
32a6 : 20 48 0c JSR $0c48 ; (printf.s4 + 0)
32a9 : a9 5f __ LDA #$5f
32ab : 85 1c __ STA P1 
32ad : a9 03 __ LDA #$03
32af : 85 1d __ STA P2 
32b1 : a5 5b __ LDA T2 + 0 
32b3 : 05 5c __ ORA T2 + 1 
32b5 : d0 40 __ BNE $32f7 ; (pickFile_far.s23 + 0)
.s22:
32b7 : 85 1e __ STA P3 
32b9 : 85 20 __ STA P5 
32bb : a9 46 __ LDA #$46
32bd : 85 1b __ STA P0 
32bf : a9 0f __ LDA #$0f
32c1 : 85 1f __ STA P4 
32c3 : 20 44 24 JSR $2444 ; (FAR_POKEW.s4 + 0)
32c6 : a9 4a __ LDA #$4a
32c8 : 85 1b __ STA P0 
32ca : a9 03 __ LDA #$03
32cc : 85 1d __ STA P2 
32ce : 38 __ __ SEC
32cf : a5 5d __ LDA T3 + 0 
32d1 : e9 0f __ SBC #$0f
32d3 : 85 1f __ STA P4 
32d5 : a5 5e __ LDA T3 + 1 
32d7 : e9 00 __ SBC #$00
32d9 : 85 20 __ STA P5 
32db : 20 44 24 JSR $2444 ; (FAR_POKEW.s4 + 0)
32de : a5 1f __ LDA P4 
32e0 : 8d ed 9f STA $9fed ; (sstack + 22)
32e3 : a5 20 __ LDA P5 
32e5 : 8d ee 9f STA $9fee ; (sstack + 23)
32e8 : 20 34 2c JSR $2c34 ; (displayFileList_far.s1 + 0)
32eb : a5 61 __ LDA T5 + 0 
32ed : 85 1b __ STA P0 
32ef : 18 __ __ CLC
32f0 : a5 55 __ LDA T0 + 0 
32f2 : 69 0f __ ADC #$0f
32f4 : 4c d1 30 JMP $30d1 ; (pickFile_far.s11 + 0)
.s23:
32f7 : a9 42 __ LDA #$42
32f9 : 85 1b __ STA P0 
32fb : a9 00 __ LDA #$00
32fd : 85 1e __ STA P3 
32ff : 18 __ __ CLC
3300 : a5 57 __ LDA T1 + 0 
3302 : 69 ff __ ADC #$ff
3304 : 85 1f __ STA P4 
3306 : a5 58 __ LDA T1 + 1 
3308 : 69 ff __ ADC #$ff
330a : 85 20 __ STA P5 
330c : 20 44 24 JSR $2444 ; (FAR_POKEW.s4 + 0)
330f : a9 46 __ LDA #$46
3311 : 85 1b __ STA P0 
3313 : a9 03 __ LDA #$03
3315 : 85 1d __ STA P2 
3317 : 18 __ __ CLC
3318 : a5 5b __ LDA T2 + 0 
331a : 69 ff __ ADC #$ff
331c : 85 1f __ STA P4 
331e : a5 5c __ LDA T2 + 1 
3320 : 69 ff __ ADC #$ff
3322 : 85 20 __ STA P5 
3324 : 20 44 24 JSR $2444 ; (FAR_POKEW.s4 + 0)
3327 : a5 61 __ LDA T5 + 0 
3329 : 85 1b __ STA P0 
332b : 18 __ __ CLC
332c : a5 1f __ LDA P4 
332e : 65 55 __ ADC T0 + 0 
3330 : 4c d1 30 JMP $30d1 ; (pickFile_far.s11 + 0)
.l27:
3333 : 65 57 __ ADC T1 + 0 
3335 : 85 1b __ STA P0 
3337 : a5 58 __ LDA T1 + 1 
3339 : 69 00 __ ADC #$00
333b : 85 1c __ STA P1 
333d : a5 59 __ LDA T1 + 2 
333f : 69 00 __ ADC #$00
3341 : 85 1d __ STA P2 
3343 : a5 5a __ LDA T1 + 3 
3345 : 69 00 __ ADC #$00
3347 : 85 1e __ STA P3 
3349 : 20 76 1f JSR $1f76 ; (FAR_PEEK.s4 + 0)
334c : 85 1f __ STA P4 
334e : 18 __ __ CLC
334f : a5 5f __ LDA T4 + 0 
3351 : 69 3e __ ADC #$3e
3353 : 85 1b __ STA P0 
3355 : a9 00 __ LDA #$00
3357 : 85 1e __ STA P3 
3359 : 2a __ __ ROL
335a : 85 1c __ STA P1 
335c : a9 03 __ LDA #$03
335e : 85 1d __ STA P2 
3360 : 20 50 0a JSR $0a50 ; (FAR_POKE.s4 + 0)
3363 : a5 1f __ LDA P4 
3365 : f0 08 __ BEQ $336f ; (pickFile_far.s28 + 0)
.s30:
3367 : e6 5f __ INC T4 + 0 
3369 : a5 5f __ LDA T4 + 0 
336b : c9 78 __ CMP #$78
336d : 90 c4 __ BCC $3333 ; (pickFile_far.l27 + 0)
.s28:
336f : a9 46 __ LDA #$46
3371 : 85 1b __ STA P0 
3373 : a9 03 __ LDA #$03
3375 : 85 1d __ STA P2 
3377 : a9 5f __ LDA #$5f
3379 : 85 1c __ STA P1 
337b : 20 80 2b JSR $2b80 ; (FAR_PEEKW.s4 + 0)
337e : a5 29 __ LDA ACCU + 0 
3380 : 05 2a __ ORA ACCU + 1 
3382 : d0 03 __ BNE $3387 ; (pickFile_far.s29 + 0)
3384 : 4c 12 32 JMP $3212 ; (pickFile_far.s3 + 0)
.s29:
3387 : 18 __ __ CLC
3388 : a5 5d __ LDA T3 + 0 
338a : 69 76 __ ADC #$76
338c : 85 1b __ STA P0 
338e : a5 5e __ LDA T3 + 1 
3390 : 69 5e __ ADC #$5e
3392 : 85 1c __ STA P1 
3394 : a9 00 __ LDA #$00
3396 : 69 03 __ ADC #$03
3398 : 85 1d __ STA P2 
339a : a9 00 __ LDA #$00
339c : 2a __ __ ROL
339d : 85 1e __ STA P3 
339f : 20 76 1f JSR $1f76 ; (FAR_PEEK.s4 + 0)
33a2 : c9 01 __ CMP #$01
33a4 : a9 00 __ LDA #$00
33a6 : 69 ff __ ADC #$ff
33a8 : 29 03 __ AND #$03
33aa : 49 01 __ EOR #$01
33ac : 4c 12 32 JMP $3212 ; (pickFile_far.s3 + 0)
.s31:
33af : a9 42 __ LDA #$42
33b1 : 85 1b __ STA P0 
33b3 : a9 00 __ LDA #$00
33b5 : 85 1e __ STA P3 
33b7 : a9 5f __ LDA #$5f
33b9 : 85 1c __ STA P1 
33bb : a9 03 __ LDA #$03
33bd : 85 1d __ STA P2 
33bf : 20 80 2b JSR $2b80 ; (FAR_PEEKW.s4 + 0)
33c2 : a5 29 __ LDA ACCU + 0 
33c4 : 85 57 __ STA T1 + 0 
33c6 : a5 2a __ LDA ACCU + 1 
33c8 : 85 58 __ STA T1 + 1 
33ca : a9 46 __ LDA #$46
33cc : 85 1b __ STA P0 
33ce : a9 03 __ LDA #$03
33d0 : 85 1d __ STA P2 
33d2 : 20 80 2b JSR $2b80 ; (FAR_PEEKW.s4 + 0)
33d5 : a5 29 __ LDA ACCU + 0 
33d7 : 85 5b __ STA T2 + 0 
33d9 : a5 2a __ LDA ACCU + 1 
33db : 85 5c __ STA T2 + 1 
33dd : a9 4a __ LDA #$4a
33df : 85 1b __ STA P0 
33e1 : a9 03 __ LDA #$03
33e3 : 85 1d __ STA P2 
33e5 : 20 80 2b JSR $2b80 ; (FAR_PEEKW.s4 + 0)
33e8 : a5 29 __ LDA ACCU + 0 
33ea : 85 5d __ STA T3 + 0 
33ec : a5 2a __ LDA ACCU + 1 
33ee : 85 5e __ STA T3 + 1 
33f0 : a9 3e __ LDA #$3e
33f2 : 85 1b __ STA P0 
33f4 : a9 03 __ LDA #$03
33f6 : 85 1d __ STA P2 
33f8 : 20 80 2b JSR $2b80 ; (FAR_PEEKW.s4 + 0)
33fb : a5 29 __ LDA ACCU + 0 
33fd : 85 5f __ STA T4 + 0 
33ff : a5 2a __ LDA ACCU + 1 
3401 : 85 60 __ STA T4 + 1 
3403 : a9 00 __ LDA #$00
3405 : 85 1b __ STA P0 
3407 : 85 1c __ STA P1 
3409 : a9 03 __ LDA #$03
340b : 85 1d __ STA P2 
340d : 20 76 1f JSR $1f76 ; (FAR_PEEK.s4 + 0)
3410 : 85 61 __ STA T5 + 0 
3412 : e6 1b __ INC P0 
3414 : a9 03 __ LDA #$03
3416 : 85 1d __ STA P2 
3418 : 20 76 1f JSR $1f76 ; (FAR_PEEK.s4 + 0)
341b : 85 62 __ STA T6 + 0 
341d : 38 __ __ SEC
341e : a5 5f __ LDA T4 + 0 
3420 : e9 01 __ SBC #$01
3422 : 85 55 __ STA T0 + 0 
3424 : a5 60 __ LDA T4 + 1 
3426 : e9 00 __ SBC #$00
3428 : 85 56 __ STA T0 + 1 
342a : a5 58 __ LDA T1 + 1 
342c : c5 56 __ CMP T0 + 1 
342e : d0 04 __ BNE $3434 ; (pickFile_far.s41 + 0)
.s40:
3430 : a5 57 __ LDA T1 + 0 
3432 : c5 55 __ CMP T0 + 0 
.s41:
3434 : 90 03 __ BCC $3439 ; (pickFile_far.s32 + 0)
3436 : 4c 9a 2f JMP $2f9a ; (pickFile_far.l4 + 0)
.s32:
3439 : a5 5c __ LDA T2 + 1 
343b : d0 f9 __ BNE $3436 ; (pickFile_far.s41 + 2)
.s39:
343d : a5 5b __ LDA T2 + 0 
343f : c9 0f __ CMP #$0f
3441 : 90 77 __ BCC $34ba ; (pickFile_far.s38 + 0)
.s37:
3443 : d0 f1 __ BNE $3436 ; (pickFile_far.s41 + 2)
.s33:
3445 : a5 58 __ LDA T1 + 1 
3447 : c5 60 __ CMP T4 + 1 
3449 : d0 04 __ BNE $344f ; (pickFile_far.s36 + 0)
.s35:
344b : a5 57 __ LDA T1 + 0 
344d : c5 5f __ CMP T4 + 0 
.s36:
344f : b0 e5 __ BCS $3436 ; (pickFile_far.s41 + 2)
.s34:
3451 : a5 61 __ LDA T5 + 0 
3453 : 85 1b __ STA P0 
3455 : a5 62 __ LDA T6 + 0 
3457 : 69 0f __ ADC #$0f
3459 : 85 1c __ STA P1 
345b : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
345e : a9 20 __ LDA #$20
3460 : 8d e1 9f STA $9fe1 ; (sstack + 10)
3463 : a9 00 __ LDA #$00
3465 : 8d e2 9f STA $9fe2 ; (sstack + 11)
3468 : a9 7f __ LDA #$7f
346a : 8d df 9f STA $9fdf ; (sstack + 8)
346d : a9 2f __ LDA #$2f
346f : 8d e0 9f STA $9fe0 ; (sstack + 9)
3472 : 20 48 0c JSR $0c48 ; (printf.s4 + 0)
3475 : a9 00 __ LDA #$00
3477 : 85 1e __ STA P3 
3479 : 85 1f __ STA P4 
347b : 85 20 __ STA P5 
347d : a9 46 __ LDA #$46
347f : 85 1b __ STA P0 
3481 : a9 5f __ LDA #$5f
3483 : 85 1c __ STA P1 
3485 : a9 03 __ LDA #$03
3487 : 85 1d __ STA P2 
3489 : 20 44 24 JSR $2444 ; (FAR_POKEW.s4 + 0)
348c : a9 4a __ LDA #$4a
348e : 85 1b __ STA P0 
3490 : a9 03 __ LDA #$03
3492 : 85 1d __ STA P2 
3494 : 18 __ __ CLC
3495 : a5 5d __ LDA T3 + 0 
3497 : 69 0f __ ADC #$0f
3499 : 85 1f __ STA P4 
349b : a5 5e __ LDA T3 + 1 
349d : 69 00 __ ADC #$00
349f : 85 20 __ STA P5 
34a1 : 20 44 24 JSR $2444 ; (FAR_POKEW.s4 + 0)
34a4 : a5 1f __ LDA P4 
34a6 : 8d ed 9f STA $9fed ; (sstack + 22)
34a9 : a5 20 __ LDA P5 
34ab : 8d ee 9f STA $9fee ; (sstack + 23)
34ae : 20 34 2c JSR $2c34 ; (displayFileList_far.s1 + 0)
34b1 : a5 61 __ LDA T5 + 0 
34b3 : 85 1b __ STA P0 
34b5 : a5 62 __ LDA T6 + 0 
34b7 : 4c d1 30 JMP $30d1 ; (pickFile_far.s11 + 0)
.s38:
34ba : a6 61 __ LDX T5 + 0 
34bc : 86 1b __ STX P0 
34be : 65 62 __ ADC T6 + 0 
34c0 : 85 1c __ STA P1 
34c2 : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
34c5 : a9 20 __ LDA #$20
34c7 : 8d e1 9f STA $9fe1 ; (sstack + 10)
34ca : a9 00 __ LDA #$00
34cc : 8d e2 9f STA $9fe2 ; (sstack + 11)
34cf : a9 7f __ LDA #$7f
34d1 : 8d df 9f STA $9fdf ; (sstack + 8)
34d4 : a9 2f __ LDA #$2f
34d6 : 8d e0 9f STA $9fe0 ; (sstack + 9)
34d9 : 20 48 0c JSR $0c48 ; (printf.s4 + 0)
34dc : a9 42 __ LDA #$42
34de : 85 1b __ STA P0 
34e0 : a9 5f __ LDA #$5f
34e2 : 85 1c __ STA P1 
34e4 : a9 03 __ LDA #$03
34e6 : 85 1d __ STA P2 
34e8 : a9 00 __ LDA #$00
34ea : 85 1e __ STA P3 
34ec : 18 __ __ CLC
34ed : a5 57 __ LDA T1 + 0 
34ef : 69 01 __ ADC #$01
34f1 : 85 1f __ STA P4 
34f3 : a5 58 __ LDA T1 + 1 
34f5 : 69 00 __ ADC #$00
34f7 : 85 20 __ STA P5 
34f9 : 20 44 24 JSR $2444 ; (FAR_POKEW.s4 + 0)
34fc : a9 46 __ LDA #$46
34fe : 85 1b __ STA P0 
3500 : a9 03 __ LDA #$03
3502 : 85 1d __ STA P2 
3504 : 18 __ __ CLC
3505 : a5 5b __ LDA T2 + 0 
3507 : 69 01 __ ADC #$01
3509 : 85 1f __ STA P4 
350b : 18 __ __ CLC
350c : 65 62 __ ADC T6 + 0 
350e : 85 57 __ STA T1 + 0 
3510 : a9 00 __ LDA #$00
3512 : 85 20 __ STA P5 
3514 : 20 44 24 JSR $2444 ; (FAR_POKEW.s4 + 0)
3517 : a5 61 __ LDA T5 + 0 
3519 : 85 1b __ STA P0 
351b : a5 57 __ LDA T1 + 0 
351d : 4c d1 30 JMP $30d1 ; (pickFile_far.s11 + 0)
--------------------------------------------------------------------
kernelNextEvent: ; kernelNextEvent()->u8
;  66, "/mnt/d/F256/f256lib-oscar64/f256lib/f_kernel.h"
.s4:
3520 : a9 00 __ LDA #$00
3522 : 8d c0 4d STA $4dc0 ; (_kern_target + 0)
3525 : 8d f3 4c STA $4cf3 ; (kernelEventData.type + 0)
3528 : a9 ff __ LDA #$ff
352a : 8d c1 4d STA $4dc1 ; (_kern_target + 1)
352d : 4c 30 35 JMP $3530 ; (_kernelCallWrapper.s4 + 0)
--------------------------------------------------------------------
_kernelCallWrapper: ; _kernelCallWrapper()->u8
;  56, "/mnt/d/F256/f256lib-oscar64/f256lib/f_kernel.h"
.s4:
3530 : 20 38 35 JSR $3538 ; (_kernelCallRaw + 0)
3533 : 85 29 __ STA ACCU + 0 
.s3:
3535 : a5 29 __ LDA ACCU + 0 
3537 : 60 __ __ RTS
--------------------------------------------------------------------
_kernelCallRaw: ; _kernelCallRaw
3538 : ad c0 4d LDA $4dc0 ; (_kern_target + 0)
353b : 8d 45 35 STA $3545 ; (_kernelCallRaw + 13)
353e : ad c1 4d LDA $4dc1 ; (_kern_target + 1)
3541 : 8d 46 35 STA $3546 ; (_kernelCallRaw + 14)
3544 : 20 00 00 JSR $0000 
3547 : aa __ __ TAX
3548 : a9 00 __ LDA #$00
354a : 6a __ __ ROR
354b : 8d c2 4d STA $4dc2 ; (_kernelError + 0)
354e : 8a __ __ TXA
354f : 60 __ __ RTS
--------------------------------------------------------------------
backUpDirectory_far: ; backUpDirectory_far()->void
;  85, "/mnt/d/F256/f256lib-oscar64/doodles/modplayer/src/muFilePicker.h"
.s4:
3550 : a9 00 __ LDA #$00
3552 : 85 1c __ STA P1 
3554 : 85 1e __ STA P3 
3556 : a9 02 __ LDA #$02
3558 : 85 1b __ STA P0 
355a : a9 03 __ LDA #$03
355c : 85 1d __ STA P2 
355e : 20 76 1f JSR $1f76 ; (FAR_PEEK.s4 + 0)
3561 : aa __ __ TAX
3562 : f0 7b __ BEQ $35df ; (backUpDirectory_far.s3 + 0)
.s5:
3564 : c9 2f __ CMP #$2f
3566 : d0 0c __ BNE $3574 ; (backUpDirectory_far.s6 + 0)
.s15:
3568 : a9 03 __ LDA #$03
356a : e6 1b __ INC P0 
356c : 85 1d __ STA P2 
356e : 20 76 1f JSR $1f76 ; (FAR_PEEK.s4 + 0)
3571 : aa __ __ TAX
3572 : f0 6b __ BEQ $35df ; (backUpDirectory_far.s3 + 0)
.s6:
3574 : a9 ff __ LDA #$ff
3576 : 85 39 __ STA T1 + 0 
3578 : 85 3a __ STA T1 + 1 
357a : a9 00 __ LDA #$00
357c : 85 3b __ STA T2 + 0 
357e : 18 __ __ CLC
.l7:
357f : 69 02 __ ADC #$02
3581 : 85 1b __ STA P0 
3583 : a9 00 __ LDA #$00
3585 : 2a __ __ ROL
3586 : 85 1c __ STA P1 
3588 : a9 03 __ LDA #$03
358a : 85 1d __ STA P2 
358c : 20 76 1f JSR $1f76 ; (FAR_PEEK.s4 + 0)
358f : aa __ __ TAX
3590 : f0 14 __ BEQ $35a6 ; (backUpDirectory_far.s8 + 0)
.s12:
3592 : c9 2f __ CMP #$2f
3594 : d0 08 __ BNE $359e ; (backUpDirectory_far.s13 + 0)
.s14:
3596 : a5 3b __ LDA T2 + 0 
3598 : 85 39 __ STA T1 + 0 
359a : a9 00 __ LDA #$00
359c : 85 3a __ STA T1 + 1 
.s13:
359e : e6 3b __ INC T2 + 0 
35a0 : a5 3b __ LDA T2 + 0 
35a2 : c9 3c __ CMP #$3c
35a4 : 90 d9 __ BCC $357f ; (backUpDirectory_far.l7 + 0)
.s8:
35a6 : a5 39 __ LDA T1 + 0 
35a8 : 30 16 __ BMI $35c0 ; (backUpDirectory_far.s10 + 0)
.s11:
35aa : f0 14 __ BEQ $35c0 ; (backUpDirectory_far.s10 + 0)
.s9:
35ac : 18 __ __ CLC
35ad : 69 02 __ ADC #$02
35af : 85 1b __ STA P0 
35b1 : a9 00 __ LDA #$00
35b3 : 85 1f __ STA P4 
35b5 : a5 3a __ LDA T1 + 1 
35b7 : 85 1c __ STA P1 
35b9 : a9 03 __ LDA #$03
35bb : 85 1d __ STA P2 
35bd : 4c 50 0a JMP $0a50 ; (FAR_POKE.s4 + 0)
.s10:
35c0 : a9 00 __ LDA #$00
35c2 : 85 39 __ STA T1 + 0 
35c4 : 85 1f __ STA P4 
35c6 : 18 __ __ CLC
.l16:
35c7 : 69 02 __ ADC #$02
35c9 : 85 1b __ STA P0 
35cb : a9 00 __ LDA #$00
35cd : 2a __ __ ROL
35ce : 85 1c __ STA P1 
35d0 : a9 03 __ LDA #$03
35d2 : 85 1d __ STA P2 
35d4 : 20 50 0a JSR $0a50 ; (FAR_POKE.s4 + 0)
35d7 : e6 39 __ INC T1 + 0 
35d9 : a5 39 __ LDA T1 + 0 
35db : c9 3c __ CMP #$3c
35dd : 90 e8 __ BCC $35c7 ; (backUpDirectory_far.l16 + 0)
.s3:
35df : 60 __ __ RTS
--------------------------------------------------------------------
sprintf: ; sprintf(u8*,const u8*)->i16
;  20, "/mnt/d/F256/oscar64/include/stdio.h"
.s4:
35e0 : ad df 9f LDA $9fdf ; (sstack + 8)
35e3 : 85 53 __ STA T1 + 0 
35e5 : 8d d8 9f STA $9fd8 ; (sstack + 1)
35e8 : a9 00 __ LDA #$00
35ea : 8d de 9f STA $9fde ; (sstack + 7)
35ed : ad e0 9f LDA $9fe0 ; (sstack + 9)
35f0 : 85 54 __ STA T1 + 1 
35f2 : 8d d9 9f STA $9fd9 ; (sstack + 2)
35f5 : ad e1 9f LDA $9fe1 ; (sstack + 10)
35f8 : 8d da 9f STA $9fda ; (sstack + 3)
35fb : ad e2 9f LDA $9fe2 ; (sstack + 11)
35fe : 8d db 9f STA $9fdb ; (sstack + 4)
3601 : a9 e3 __ LDA #$e3
3603 : 8d dc 9f STA $9fdc ; (sstack + 5)
3606 : a9 9f __ LDA #$9f
3608 : 8d dd 9f STA $9fdd ; (sstack + 6)
360b : 20 70 0c JSR $0c70 ; (sformat.s4 + 0)
360e : 38 __ __ SEC
360f : a5 29 __ LDA ACCU + 0 
3611 : e5 53 __ SBC T1 + 0 
3613 : 85 29 __ STA ACCU + 0 
3615 : a5 2a __ LDA ACCU + 1 
3617 : e5 54 __ SBC T1 + 1 
3619 : 85 2a __ STA ACCU + 1 
.s3:
361b : 60 __ __ RTS
--------------------------------------------------------------------
361c : __ __ __ BYT 25 73 2f 25 73 00                               : %s/%s.
--------------------------------------------------------------------
3622 : __ __ __ BYT 6d 6f 64 00                                     : mod.
--------------------------------------------------------------------
3626 : __ __ __ BYT 73 70 6c 00                                     : spl.
--------------------------------------------------------------------
362a : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
eraseLine: ; eraseLine(u8)->void
;  14, "/mnt/d/F256/f256lib-oscar64/doodles/modplayer/src/textUI.h"
.s4:
362b : ad ed 9f LDA $9fed ; (sstack + 22)
362e : 85 1c __ STA P1 
3630 : a9 00 __ LDA #$00
3632 : 85 1b __ STA P0 
3634 : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
3637 : a9 44 __ LDA #$44
3639 : 8d df 9f STA $9fdf ; (sstack + 8)
363c : a9 36 __ LDA #$36
363e : 8d e0 9f STA $9fe0 ; (sstack + 9)
3641 : 4c 48 0c JMP $0c48 ; (printf.s4 + 0)
--------------------------------------------------------------------
3644 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
3654 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
3664 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
3674 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
3684 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
3694 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
3695 : __ __ __ BYT 4c 6f 61 64 69 6e 67 3a 20 25 2e 37 31 73 00    : Loading: %.71s.
--------------------------------------------------------------------
fileOpen: ; fileOpen(const u8*,const u8*)->u8*
;  25, "/mnt/d/F256/f256lib-oscar64/f256lib/f_file.h"
.s4:
36a4 : a5 21 __ LDA P6 ; (fname + 0)
36a6 : 85 1d __ STA P2 
36a8 : a5 22 __ LDA P7 ; (fname + 1)
36aa : 85 1e __ STA P3 
36ac : a9 d6 __ LDA #$d6
36ae : 85 1f __ STA P4 
36b0 : a9 9f __ LDA #$9f
36b2 : 85 20 __ STA P5 
36b4 : 20 2b 20 JSR $202b ; (pathWithoutDrive.s4 + 0)
36b7 : a2 00 __ LDX #$00
.l5:
36b9 : a0 00 __ LDY #$00
36bb : b1 23 __ LDA (P8),y ; (mode + 0)
36bd : d0 70 __ BNE $372f ; (fileOpen.s11 + 0)
.s6:
36bf : 86 38 __ STX T4 + 0 
36c1 : ad f1 4c LDA $4cf1 ; (kernelArgs + 0)
36c4 : 85 35 __ STA T1 + 0 
36c6 : ad f2 4c LDA $4cf2 ; (kernelArgs + 1)
36c9 : 85 36 __ STA T1 + 1 
36cb : a5 29 __ LDA ACCU + 0 
36cd : 85 1b __ STA P0 
36cf : a0 0b __ LDY #$0b
36d1 : 91 35 __ STA (T1 + 0),y 
36d3 : a5 2a __ LDA ACCU + 1 
36d5 : 85 1c __ STA P1 
36d7 : c8 __ __ INY
36d8 : 91 35 __ STA (T1 + 0),y 
36da : 20 79 20 JSR $2079 ; (strlen.s4 + 0)
36dd : a5 29 __ LDA ACCU + 0 
36df : a0 0d __ LDY #$0d
36e1 : 91 35 __ STA (T1 + 0),y 
36e3 : a9 5c __ LDA #$5c
36e5 : 8d c0 4d STA $4dc0 ; (_kern_target + 0)
36e8 : a9 ff __ LDA #$ff
36ea : 8d c1 4d STA $4dc1 ; (_kern_target + 1)
36ed : ad d6 9f LDA $9fd6 ; (drive + 0)
36f0 : a0 03 __ LDY #$03
36f2 : 91 35 __ STA (T1 + 0),y 
36f4 : a5 38 __ LDA T4 + 0 
36f6 : a0 05 __ LDY #$05
36f8 : 91 35 __ STA (T1 + 0),y 
36fa : 20 d9 1a JSR $1ad9 ; (_kernelCallWrapper.s4 + 0)
36fd : 85 37 __ STA T3 + 0 
36ff : ad c2 4d LDA $4dc2 ; (_kernelError + 0)
3702 : d0 24 __ BNE $3728 ; (fileOpen.s16 + 0)
.l7:
3704 : 20 66 1b JSR $1b66 ; (kernelNextEvent.s4 + 0)
3707 : ad f3 4c LDA $4cf3 ; (kernelEventData.type + 0)
370a : c9 2a __ CMP #$2a
370c : d0 12 __ BNE $3720 ; (fileOpen.s8 + 0)
.s10:
370e : a9 01 __ LDA #$01
3710 : 85 29 __ STA ACCU + 0 
3712 : a9 00 __ LDA #$00
3714 : 85 2a __ STA ACCU + 1 
3716 : 20 03 4b JSR $4b03 ; (crt_malloc + 0)
3719 : a5 37 __ LDA T3 + 0 
371b : a0 00 __ LDY #$00
371d : 91 29 __ STA (ACCU + 0),y 
.s3:
371f : 60 __ __ RTS
.s8:
3720 : c9 28 __ CMP #$28
3722 : f0 04 __ BEQ $3728 ; (fileOpen.s16 + 0)
.s9:
3724 : c9 38 __ CMP #$38
3726 : d0 dc __ BNE $3704 ; (fileOpen.l7 + 0)
.s16:
3728 : a9 00 __ LDA #$00
372a : 85 29 __ STA ACCU + 0 
372c : 85 2a __ STA ACCU + 1 
372e : 60 __ __ RTS
.s11:
372f : c9 77 __ CMP #$77
3731 : d0 04 __ BNE $3737 ; (fileOpen.s12 + 0)
.s15:
3733 : a2 01 __ LDX #$01
3735 : d0 06 __ BNE $373d ; (fileOpen.s13 + 0)
.s12:
3737 : c9 61 __ CMP #$61
3739 : d0 02 __ BNE $373d ; (fileOpen.s13 + 0)
.s14:
373b : a2 02 __ LDX #$02
.s13:
373d : e6 23 __ INC P8 ; (mode + 0)
373f : f0 03 __ BEQ $3744 ; (fileOpen.s17 + 0)
3741 : 4c b9 36 JMP $36b9 ; (fileOpen.l5 + 0)
.s17:
3744 : e6 24 __ INC P9 ; (mode + 1)
3746 : 4c b9 36 JMP $36b9 ; (fileOpen.l5 + 0)
--------------------------------------------------------------------
3749 : __ __ __ BYT 72 00                                           : r.
--------------------------------------------------------------------
load_MOD_file: ; load_MOD_file(u8*)->u8*
;  30, "/mnt/d/F256/f256lib-oscar64/doodles/modplayer/src/muMODplay.h"
.s4:
374b : a5 25 __ LDA P10 ; (name + 0)
374d : 85 21 __ STA P6 
374f : a5 26 __ LDA P11 ; (name + 1)
3751 : 85 22 __ STA P7 
3753 : a9 49 __ LDA #$49
3755 : 85 23 __ STA P8 
3757 : a9 37 __ LDA #$37
3759 : 85 24 __ STA P9 
375b : 4c a4 36 JMP $36a4 ; (fileOpen.s4 + 0)
--------------------------------------------------------------------
375e : __ __ __ BYT 69 73 4e 55 4c 4c 00                            : isNULL.
--------------------------------------------------------------------
hitspace: ; hitspace()->void
;  18, "/mnt/d/F256/f256lib-oscar64/doodles/modplayer/src/muUtils.h"
.l4:
3765 : 20 da 0b JSR $0bda ; (kernelNextEvent.s4 + 0)
3768 : ad f3 4c LDA $4cf3 ; (kernelEventData.type + 0)
376b : c9 08 __ CMP #$08
376d : d0 f6 __ BNE $3765 ; (hitspace.l4 + 0)
.s5:
376f : ad f7 4c LDA $4cf7 ; (kernelEventData.u + 1)
3772 : c9 20 __ CMP #$20
3774 : f0 04 __ BEQ $377a ; (hitspace.s3 + 0)
.s6:
3776 : c9 94 __ CMP #$94
3778 : d0 eb __ BNE $3765 ; (hitspace.l4 + 0)
.s3:
377a : 60 __ __ RTS
--------------------------------------------------------------------
checkMODHeader: ; checkMODHeader(u8*)->void
;  31, "/mnt/d/F256/f256lib-oscar64/doodles/modplayer/src/muMODplay.h"
.s1:
377b : a2 10 __ LDX #$10
377d : b5 55 __ LDA T0 + 0,x 
377f : 9d a8 9e STA $9ea8,x ; (checkMODHeader@stack + 0)
3782 : ca __ __ DEX
3783 : 10 f8 __ BPL $377d ; (checkMODHeader.s1 + 2)
.s4:
3785 : ad ed 9f LDA $9fed ; (sstack + 22)
3788 : 85 55 __ STA T0 + 0 
378a : 8d d9 9f STA $9fd9 ; (sstack + 2)
378d : ad ee 9f LDA $9fee ; (sstack + 23)
3790 : 85 56 __ STA T0 + 1 
3792 : 8d da 9f STA $9fda ; (sstack + 3)
3795 : 20 b6 3b JSR $3bb6 ; (copyToRAM.s4 + 0)
3798 : a5 55 __ LDA T0 + 0 
379a : 85 1b __ STA P0 
379c : a5 56 __ LDA T0 + 1 
379e : 85 1c __ STA P1 
37a0 : 20 2b 1b JSR $1b2b ; (fileClose.s4 + 0)
37a3 : a9 00 __ LDA #$00
37a5 : 85 58 __ STA T1 + 0 
37a7 : 85 1e __ STA P3 
37a9 : a9 18 __ LDA #$18
37ab : 85 1d __ STA P2 
.l34:
37ad : a5 58 __ LDA T1 + 0 
37af : 85 1b __ STA P0 
37b1 : a9 00 __ LDA #$00
37b3 : 85 1c __ STA P1 
37b5 : 20 6e 3c JSR $3c6e ; (peek24.s4 + 0)
37b8 : a6 58 __ LDX T1 + 0 
37ba : e8 __ __ INX
37bb : 86 58 __ STX T1 + 0 
37bd : 9d c1 9e STA $9ec1,x ; (checkMODHeader@stack + 25)
37c0 : e0 14 __ CPX #$14
37c2 : 90 e9 __ BCC $37ad ; (checkMODHeader.l34 + 0)
.s5:
37c4 : a9 00 __ LDA #$00
37c6 : 8d d5 9e STA $9ed5 ; (name[0] + 19)
37c9 : a9 c2 __ LDA #$c2
37cb : 8d e1 9f STA $9fe1 ; (sstack + 10)
37ce : a9 9e __ LDA #$9e
37d0 : 8d e2 9f STA $9fe2 ; (sstack + 11)
37d3 : a9 9a __ LDA #$9a
37d5 : 8d df 9f STA $9fdf ; (sstack + 8)
37d8 : a9 3c __ LDA #$3c
37da : 8d e0 9f STA $9fe0 ; (sstack + 9)
37dd : 20 48 0c JSR $0c48 ; (printf.s4 + 0)
37e0 : a9 00 __ LDA #$00
37e2 : 85 60 __ STA T3 + 0 
37e4 : 85 58 __ STA T1 + 0 
37e6 : 18 __ __ CLC
.l6:
37e7 : 69 b8 __ ADC #$b8
37e9 : 85 1b __ STA P0 
37eb : a9 00 __ LDA #$00
37ed : 69 03 __ ADC #$03
37ef : 85 1c __ STA P1 
37f1 : a9 18 __ LDA #$18
37f3 : 85 1d __ STA P2 
37f5 : a9 00 __ LDA #$00
37f7 : 2a __ __ ROL
37f8 : 85 1e __ STA P3 
37fa : 20 6e 3c JSR $3c6e ; (peek24.s4 + 0)
37fd : c5 60 __ CMP T3 + 0 
37ff : 90 04 __ BCC $3805 ; (checkMODHeader.s7 + 0)
.s35:
3801 : f0 02 __ BEQ $3805 ; (checkMODHeader.s7 + 0)
.s33:
3803 : 85 60 __ STA T3 + 0 
.s7:
3805 : e6 58 __ INC T1 + 0 
3807 : a5 58 __ LDA T1 + 0 
3809 : c9 7f __ CMP #$7f
380b : 90 da __ BCC $37e7 ; (checkMODHeader.l6 + 0)
.s8:
380d : a9 32 __ LDA #$32
380f : 85 1b __ STA P0 
3811 : a9 00 __ LDA #$00
3813 : 85 1c __ STA P1 
3815 : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
3818 : a9 ab __ LDA #$ab
381a : 8d df 9f STA $9fdf ; (sstack + 8)
381d : a9 3c __ LDA #$3c
381f : 8d e0 9f STA $9fe0 ; (sstack + 9)
3822 : 18 __ __ CLC
3823 : a5 60 __ LDA T3 + 0 
3825 : 69 01 __ ADC #$01
3827 : 85 61 __ STA T4 + 0 
3829 : 8d e1 9f STA $9fe1 ; (sstack + 10)
382c : a9 00 __ LDA #$00
382e : 8d e2 9f STA $9fe2 ; (sstack + 11)
3831 : 20 48 0c JSR $0c48 ; (printf.s4 + 0)
3834 : a9 00 __ LDA #$00
3836 : 85 5c __ STA T2 + 0 
.l9:
3838 : 85 29 __ STA ACCU + 0 
383a : a9 00 __ LDA #$00
383c : 85 2a __ STA ACCU + 1 
383e : a9 1e __ LDA #$1e
3840 : 20 47 45 JSR $4547 ; (mul16by8 + 0)
3843 : 18 __ __ CLC
3844 : a5 29 __ LDA ACCU + 0 
3846 : 69 2a __ ADC #$2a
3848 : 85 1f __ STA P4 
384a : a5 2a __ LDA ACCU + 1 
384c : 69 00 __ ADC #$00
384e : 85 20 __ STA P5 
3850 : a9 00 __ LDA #$00
3852 : 69 18 __ ADC #$18
3854 : 85 21 __ STA P6 
3856 : a9 00 __ LDA #$00
3858 : 2a __ __ ROL
3859 : 85 22 __ STA P7 
385b : 20 bf 3c JSR $3cbf ; (readBigEndianWord.s4 + 0)
385e : a5 5c __ LDA T2 + 0 
3860 : 0a __ __ ASL
3861 : 85 58 __ STA T1 + 0 
3863 : aa __ __ TAX
3864 : a9 00 __ LDA #$00
3866 : 85 1b __ STA P0 
3868 : a5 29 __ LDA ACCU + 0 
386a : 9d 7a 4f STA $4f7a,x ; (instLength[0] + 0)
386d : a5 2a __ LDA ACCU + 1 
386f : 9d 7b 4f STA $4f7b,x ; (instLength[0] + 1)
3872 : 18 __ __ CLC
3873 : a5 5c __ LDA T2 + 0 
3875 : 69 05 __ ADC #$05
3877 : 85 5c __ STA T2 + 0 
3879 : 85 1c __ STA P1 
387b : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
387e : a9 c7 __ LDA #$c7
3880 : 85 23 __ STA P8 
3882 : a9 3e __ LDA #$3e
3884 : 85 24 __ STA P9 
3886 : 20 f7 3c JSR $3cf7 ; (textPrint.s4 + 0)
3889 : 18 __ __ CLC
388a : a5 5c __ LDA T2 + 0 
388c : 69 fc __ ADC #$fc
388e : 85 5c __ STA T2 + 0 
3890 : c9 0a __ CMP #$0a
3892 : b0 0d __ BCS $38a1 ; (checkMODHeader.s10 + 0)
.s32:
3894 : a9 fe __ LDA #$fe
3896 : 85 23 __ STA P8 
3898 : a9 1a __ LDA #$1a
389a : 85 24 __ STA P9 
389c : 20 f7 3c JSR $3cf7 ; (textPrint.s4 + 0)
389f : a5 5c __ LDA T2 + 0 
.s10:
38a1 : 8d d7 9f STA $9fd7 ; (sstack + 0)
38a4 : a9 00 __ LDA #$00
38a6 : 8d d8 9f STA $9fd8 ; (sstack + 1)
38a9 : 8d d9 9f STA $9fd9 ; (sstack + 2)
38ac : 8d da 9f STA $9fda ; (sstack + 3)
38af : 20 cf 3e JSR $3ecf ; (textPrintInt.s1 + 0)
38b2 : a9 fe __ LDA #$fe
38b4 : 85 23 __ STA P8 
38b6 : a9 1a __ LDA #$1a
38b8 : 85 24 __ STA P9 
38ba : 20 f7 3c JSR $3cf7 ; (textPrint.s4 + 0)
38bd : a6 58 __ LDX T1 + 0 
38bf : bd 7a 4f LDA $4f7a,x ; (instLength[0] + 0)
38c2 : 0a __ __ ASL
38c3 : 8d d7 9f STA $9fd7 ; (sstack + 0)
38c6 : bd 7b 4f LDA $4f7b,x ; (instLength[0] + 1)
38c9 : 2a __ __ ROL
38ca : 8d d8 9f STA $9fd8 ; (sstack + 1)
38cd : a9 00 __ LDA #$00
38cf : 8d d9 9f STA $9fd9 ; (sstack + 2)
38d2 : 8d da 9f STA $9fda ; (sstack + 3)
38d5 : 20 cf 3e JSR $3ecf ; (textPrintInt.s1 + 0)
38d8 : a9 6a __ LDA #$6a
38da : 85 23 __ STA P8 
38dc : a9 40 __ LDA #$40
38de : 85 24 __ STA P9 
38e0 : 20 f7 3c JSR $3cf7 ; (textPrint.s4 + 0)
38e3 : a5 5c __ LDA T2 + 0 
38e5 : c9 1f __ CMP #$1f
38e7 : b0 03 __ BCS $38ec ; (checkMODHeader.s11 + 0)
38e9 : 4c 38 38 JMP $3838 ; (checkMODHeader.l9 + 0)
.s11:
38ec : 20 65 37 JSR $3765 ; (hitspace.l4 + 0)
38ef : a9 71 __ LDA #$71
38f1 : 85 23 __ STA P8 
38f3 : a9 40 __ LDA #$40
38f5 : 85 24 __ STA P9 
38f7 : 20 f7 3c JSR $3cf7 ; (textPrint.s4 + 0)
38fa : a9 00 __ LDA #$00
38fc : 85 57 __ STA T0 + 2 
38fe : a5 61 __ LDA T4 + 0 
3900 : 0a __ __ ASL
3901 : 26 57 __ ROL T0 + 2 
3903 : 0a __ __ ASL
3904 : 26 57 __ ROL T0 + 2 
3906 : 18 __ __ CLC
3907 : 69 04 __ ADC #$04
3909 : 85 59 __ STA T1 + 1 
390b : a5 57 __ LDA T0 + 2 
390d : 69 18 __ ADC #$18
390f : 85 5a __ STA T1 + 2 
3911 : a9 00 __ LDA #$00
3913 : 2a __ __ ROL
3914 : 85 5b __ STA T1 + 3 
3916 : a9 00 __ LDA #$00
3918 : 85 61 __ STA T4 + 0 
391a : 85 63 __ STA T6 + 0 
391c : 85 64 __ STA T6 + 1 
391e : a9 05 __ LDA #$05
3920 : 85 62 __ STA T5 + 0 
.l12:
3922 : 85 1c __ STA P1 
3924 : a9 28 __ LDA #$28
3926 : 85 1b __ STA P0 
3928 : a5 61 __ LDA T4 + 0 
392a : 0a __ __ ASL
392b : 0a __ __ ASL
392c : aa __ __ TAX
392d : a5 63 __ LDA T6 + 0 
392f : 9d 00 50 STA $5000,x ; (instAddr[0] + 0)
3932 : a5 64 __ LDA T6 + 1 
3934 : 9d 01 50 STA $5001,x ; (instAddr[0] + 1)
3937 : a9 00 __ LDA #$00
3939 : 9d 02 50 STA $5002,x ; (instAddr[0] + 2)
393c : 9d 03 50 STA $5003,x ; (instAddr[0] + 3)
393f : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
3942 : a9 78 __ LDA #$78
3944 : 8d df 9f STA $9fdf ; (sstack + 8)
3947 : a9 40 __ LDA #$40
3949 : 8d e0 9f STA $9fe0 ; (sstack + 9)
394c : a5 63 __ LDA T6 + 0 
394e : 8d e1 9f STA $9fe1 ; (sstack + 10)
3951 : a5 64 __ LDA T6 + 1 
3953 : 8d e2 9f STA $9fe2 ; (sstack + 11)
3956 : a9 01 __ LDA #$01
3958 : 8d e3 9f STA $9fe3 ; (sstack + 12)
395b : a9 00 __ LDA #$00
395d : 8d e4 9f STA $9fe4 ; (sstack + 13)
3960 : 20 48 0c JSR $0c48 ; (printf.s4 + 0)
3963 : a5 61 __ LDA T4 + 0 
3965 : 0a __ __ ASL
3966 : 85 65 __ STA T8 + 0 
3968 : a9 00 __ LDA #$00
396a : 85 5c __ STA T2 + 0 
396c : 85 5d __ STA T2 + 1 
396e : 85 5e __ STA T2 + 2 
3970 : 85 5f __ STA T2 + 3 
3972 : f0 0d __ BEQ $3981 ; (checkMODHeader.l13 + 0)
.s37:
3974 : 18 __ __ CLC
3975 : a5 1b __ LDA P0 
3977 : 69 01 __ ADC #$01
3979 : 85 63 __ STA T6 + 0 
397b : a5 1c __ LDA P1 
397d : 69 00 __ ADC #$00
397f : 85 64 __ STA T6 + 1 
.l13:
3981 : a6 65 __ LDX T8 + 0 
3983 : bd 7a 4f LDA $4f7a,x ; (instLength[0] + 0)
3986 : 0a __ __ ASL
3987 : 85 55 __ STA T0 + 0 
3989 : bd 7b 4f LDA $4f7b,x ; (instLength[0] + 1)
398c : 2a __ __ ROL
398d : 85 56 __ STA T0 + 1 
398f : a5 5f __ LDA T2 + 3 
3991 : 38 __ __ SEC
3992 : d0 0e __ BNE $39a2 ; (checkMODHeader.s31 + 0)
.s28:
3994 : a5 5e __ LDA T2 + 2 
3996 : d0 0a __ BNE $39a2 ; (checkMODHeader.s31 + 0)
.s29:
3998 : a5 5d __ LDA T2 + 1 
399a : c5 56 __ CMP T0 + 1 
399c : d0 04 __ BNE $39a2 ; (checkMODHeader.s31 + 0)
.s30:
399e : a5 5c __ LDA T2 + 0 
39a0 : c5 55 __ CMP T0 + 0 
.s31:
39a2 : b0 03 __ BCS $39a7 ; (checkMODHeader.s14 + 0)
39a4 : 4c 72 3b JMP $3b72 ; (checkMODHeader.s27 + 0)
.s14:
39a7 : e6 61 __ INC T4 + 0 
39a9 : e6 62 __ INC T5 + 0 
39ab : a5 62 __ LDA T5 + 0 
39ad : c9 24 __ CMP #$24
39af : f0 03 __ BEQ $39b4 ; (checkMODHeader.s15 + 0)
39b1 : 4c 22 39 JMP $3922 ; (checkMODHeader.l12 + 0)
.s15:
39b4 : a9 7e __ LDA #$7e
39b6 : 85 23 __ STA P8 
39b8 : a9 40 __ LDA #$40
39ba : 85 24 __ STA P9 
39bc : 20 f7 3c JSR $3cf7 ; (textPrint.s4 + 0)
39bf : ee bd 4c INC $4cbd ; (periodIndex + 0)
39c2 : ad 7a 4f LDA $4f7a ; (instLength[0] + 0)
39c5 : 85 58 __ STA T1 + 0 
39c7 : ad 7b 4f LDA $4f7b ; (instLength[0] + 1)
39ca : 85 59 __ STA T1 + 1 
39cc : 20 85 40 JSR $4085 ; (headerPump.s4 + 0)
39cf : a9 93 __ LDA #$93
39d1 : 85 23 __ STA P8 
39d3 : a9 40 __ LDA #$40
39d5 : 85 24 __ STA P9 
39d7 : 20 f7 3c JSR $3cf7 ; (textPrint.s4 + 0)
39da : a5 58 __ LDA T1 + 0 
39dc : 0a __ __ ASL
39dd : 85 55 __ STA T0 + 0 
39df : a5 59 __ LDA T1 + 1 
39e1 : 2a __ __ ROL
39e2 : 85 56 __ STA T0 + 1 
39e4 : a9 00 __ LDA #$00
39e6 : 85 61 __ STA T4 + 0 
39e8 : ad ea 4c LDA $4cea ; (isPlaying + 0)
39eb : f0 03 __ BEQ $39f0 ; (checkMODHeader.l17 + 0)
39ed : 4c 32 3b JMP $3b32 ; (checkMODHeader.l26 + 0)
.l17:
39f0 : 20 57 43 JSR $4357 ; (kernelNextEvent.s4 + 0)
39f3 : ad f3 4c LDA $4cf3 ; (kernelEventData.type + 0)
39f6 : c9 08 __ CMP #$08
39f8 : f0 03 __ BEQ $39fd ; (checkMODHeader.s18 + 0)
39fa : 4c 51 3b JMP $3b51 ; (checkMODHeader.s16 + 0)
.s18:
39fd : ad eb 4c LDA $4ceb ; (hasEnded + 0)
3a00 : f0 f8 __ BEQ $39fa ; (checkMODHeader.l17 + 10)
.s19:
3a02 : ad f7 4c LDA $4cf7 ; (kernelEventData.u + 1)
3a05 : 85 61 __ STA T4 + 0 
3a07 : c9 31 __ CMP #$31
3a09 : 90 ef __ BCC $39fa ; (checkMODHeader.l17 + 10)
.s20:
3a0b : c9 3a __ CMP #$3a
3a0d : 90 03 __ BCC $3a12 ; (checkMODHeader.s23 + 0)
3a0f : 4c 4d 3b JMP $3b4d ; (checkMODHeader.s21 + 0)
.s23:
3a12 : a9 00 __ LDA #$00
3a14 : 8d ec 4c STA $4cec ; (nearingEnd + 0)
3a17 : 8d eb 4c STA $4ceb ; (hasEnded + 0)
3a1a : 8d c3 4d STA $4dc3 ; (chan0Fixed + 0)
3a1d : 8d c4 4d STA $4dc4 ; (chan0Fixed + 1)
3a20 : 8d c5 4d STA $4dc5 ; (chan0Fixed + 2)
3a23 : 8d c6 4d STA $4dc6 ; (chan0Fixed + 3)
3a26 : a9 01 __ LDA #$01
3a28 : 8d ea 4c STA $4cea ; (isPlaying + 0)
3a2b : ad bd 4c LDA $4cbd ; (periodIndex + 0)
3a2e : 0a __ __ ASL
3a2f : ee bd 4c INC $4cbd ; (periodIndex + 0)
3a32 : aa __ __ TAX
3a33 : bd 00 4d LDA $4d00,x ; (palPeriods[0] + 0)
3a36 : 85 55 __ STA T0 + 0 
3a38 : 85 29 __ STA ACCU + 0 
3a3a : a9 87 __ LDA #$87
3a3c : 8d df 9f STA $9fdf ; (sstack + 8)
3a3f : a9 43 __ LDA #$43
3a41 : 8d e0 9f STA $9fe0 ; (sstack + 9)
3a44 : bd 01 4d LDA $4d01,x ; (palPeriods[0] + 1)
3a47 : 85 56 __ STA T0 + 1 
3a49 : 85 2a __ STA ACCU + 1 
3a4b : a9 00 __ LDA #$00
3a4d : 85 2b __ STA ACCU + 2 
3a4f : 85 2c __ STA ACCU + 3 
3a51 : 20 e8 49 JSR $49e8 ; (uint32_to_float + 0)
3a54 : a5 29 __ LDA ACCU + 0 
3a56 : 85 58 __ STA T1 + 0 
3a58 : a5 2a __ LDA ACCU + 1 
3a5a : 85 59 __ STA T1 + 1 
3a5c : a5 2b __ LDA ACCU + 2 
3a5e : 85 5a __ STA T1 + 2 
3a60 : a5 2c __ LDA ACCU + 3 
3a62 : 85 5b __ STA T1 + 3 
3a64 : a9 3c __ LDA #$3c
3a66 : 85 29 __ STA ACCU + 0 
3a68 : a9 4a __ LDA #$4a
3a6a : 85 2c __ STA ACCU + 3 
3a6c : a9 7c __ LDA #$7c
3a6e : 85 2a __ STA ACCU + 1 
3a70 : a9 58 __ LDA #$58
3a72 : 85 2b __ STA ACCU + 2 
3a74 : a2 58 __ LDX #$58
3a76 : 20 83 45 JSR $4583 ; (freg + 4)
3a79 : 20 79 47 JSR $4779 ; (crt_fdiv + 0)
3a7c : a5 29 __ LDA ACCU + 0 
3a7e : 8d e1 9f STA $9fe1 ; (sstack + 10)
3a81 : a5 2a __ LDA ACCU + 1 
3a83 : 8d e2 9f STA $9fe2 ; (sstack + 11)
3a86 : a5 2b __ LDA ACCU + 2 
3a88 : 8d e3 9f STA $9fe3 ; (sstack + 12)
3a8b : a5 2c __ LDA ACCU + 3 
3a8d : 8d e4 9f STA $9fe4 ; (sstack + 13)
3a90 : a5 61 __ LDA T4 + 0 
3a92 : 0a __ __ ASL
3a93 : 0a __ __ ASL
3a94 : aa __ __ TAX
3a95 : bd 3c 4f LDA $4f3c,x ; (fileDirEntS.d_name[0] + 194)
3a98 : 8d e5 9f STA $9fe5 ; (sstack + 14)
3a9b : bd 3d 4f LDA $4f3d,x ; (fileDirEntS.d_name[0] + 195)
3a9e : 8d e6 9f STA $9fe6 ; (sstack + 15)
3aa1 : bd 3e 4f LDA $4f3e,x ; (fileDirEntS.d_name[0] + 196)
3aa4 : 8d e7 9f STA $9fe7 ; (sstack + 16)
3aa7 : bd 3f 4f LDA $4f3f,x ; (fileDirEntS.d_name[0] + 197)
3aaa : 8d e8 9f STA $9fe8 ; (sstack + 17)
3aad : ad bd 4c LDA $4cbd ; (periodIndex + 0)
3ab0 : c9 3c __ CMP #$3c
3ab2 : d0 05 __ BNE $3ab9 ; (checkMODHeader.s24 + 0)
.s25:
3ab4 : a9 19 __ LDA #$19
3ab6 : 8d bd 4c STA $4cbd ; (periodIndex + 0)
.s24:
3ab9 : a9 00 __ LDA #$00
3abb : 85 2c __ STA ACCU + 3 
3abd : 85 13 __ STA WORK + 2 
3abf : 85 14 __ STA WORK + 3 
3ac1 : a9 0f __ LDA #$0f
3ac3 : 85 29 __ STA ACCU + 0 
3ac5 : a9 1f __ LDA #$1f
3ac7 : 85 2a __ STA ACCU + 1 
3ac9 : a9 36 __ LDA #$36
3acb : 85 2b __ STA ACCU + 2 
3acd : a5 55 __ LDA T0 + 0 
3acf : 85 11 __ STA WORK + 0 
3ad1 : a5 56 __ LDA T0 + 1 
3ad3 : 85 12 __ STA WORK + 1 
3ad5 : 20 2c 4a JSR $4a2c ; (divmod32 + 0)
3ad8 : a5 2b __ LDA ACCU + 2 
3ada : 85 2c __ STA ACCU + 3 
3adc : a5 2a __ LDA ACCU + 1 
3ade : 85 2b __ STA ACCU + 2 
3ae0 : a5 29 __ LDA ACCU + 0 
3ae2 : 85 2a __ STA ACCU + 1 
3ae4 : a9 00 __ LDA #$00
3ae6 : 85 29 __ STA ACCU + 0 
3ae8 : 85 12 __ STA WORK + 1 
3aea : 85 13 __ STA WORK + 2 
3aec : 85 14 __ STA WORK + 3 
3aee : a9 56 __ LDA #$56
3af0 : 85 11 __ STA WORK + 0 
3af2 : 20 2c 4a JSR $4a2c ; (divmod32 + 0)
3af5 : a5 29 __ LDA ACCU + 0 
3af7 : 8d e9 9f STA $9fe9 ; (sstack + 18)
3afa : 8d ed 4c STA $4ced ; (itersFixed + 0)
3afd : a5 2a __ LDA ACCU + 1 
3aff : 8d ea 9f STA $9fea ; (sstack + 19)
3b02 : 8d ee 4c STA $4cee ; (itersFixed + 1)
3b05 : a5 2b __ LDA ACCU + 2 
3b07 : 8d eb 9f STA $9feb ; (sstack + 20)
3b0a : 8d ef 4c STA $4cef ; (itersFixed + 2)
3b0d : a5 2c __ LDA ACCU + 3 
3b0f : 8d ec 9f STA $9fec ; (sstack + 21)
3b12 : 8d f0 4c STA $4cf0 ; (itersFixed + 3)
3b15 : a5 61 __ LDA T4 + 0 
3b17 : 0a __ __ ASL
3b18 : aa __ __ TAX
3b19 : bd 18 4f LDA $4f18,x ; (fileDirEntS.d_name[0] + 158)
3b1c : 85 55 __ STA T0 + 0 
3b1e : bd 19 4f LDA $4f19,x ; (fileDirEntS.d_name[0] + 159)
3b21 : 85 56 __ STA T0 + 1 
3b23 : 20 48 0c JSR $0c48 ; (printf.s4 + 0)
3b26 : 06 55 __ ASL T0 + 0 
3b28 : 26 56 __ ROL T0 + 1 
3b2a : ad ea 4c LDA $4cea ; (isPlaying + 0)
3b2d : d0 03 __ BNE $3b32 ; (checkMODHeader.l26 + 0)
3b2f : 4c f0 39 JMP $39f0 ; (checkMODHeader.l17 + 0)
.l26:
3b32 : a5 55 __ LDA T0 + 0 
3b34 : 85 20 __ STA P5 
3b36 : a5 56 __ LDA T0 + 1 
3b38 : 85 21 __ STA P6 
3b3a : a9 00 __ LDA #$00
3b3c : 85 22 __ STA P7 
3b3e : 85 23 __ STA P8 
3b40 : 38 __ __ SEC
3b41 : a5 61 __ LDA T4 + 0 
3b43 : e9 31 __ SBC #$31
3b45 : 85 1f __ STA P4 
3b47 : 20 a2 40 JSR $40a2 ; (read2KChunk.s4 + 0)
3b4a : 4c f0 39 JMP $39f0 ; (checkMODHeader.l17 + 0)
.s21:
3b4d : c9 71 __ CMP #$71
3b4f : f0 08 __ BEQ $3b59 ; (checkMODHeader.s22 + 0)
.s16:
3b51 : ad ea 4c LDA $4cea ; (isPlaying + 0)
3b54 : d0 dc __ BNE $3b32 ; (checkMODHeader.l26 + 0)
3b56 : 4c f0 39 JMP $39f0 ; (checkMODHeader.l17 + 0)
.s22:
3b59 : a9 a7 __ LDA #$a7
3b5b : 85 23 __ STA P8 
3b5d : a9 43 __ LDA #$43
3b5f : 85 24 __ STA P9 
3b61 : 20 f7 3c JSR $3cf7 ; (textPrint.s4 + 0)
3b64 : 20 65 37 JSR $3765 ; (hitspace.l4 + 0)
.s3:
3b67 : a2 10 __ LDX #$10
3b69 : bd a8 9e LDA $9ea8,x ; (checkMODHeader@stack + 0)
3b6c : 95 55 __ STA T0 + 0,x 
3b6e : ca __ __ DEX
3b6f : 10 f8 __ BPL $3b69 ; (checkMODHeader.s3 + 2)
3b71 : 60 __ __ RTS
.s27:
3b72 : a5 63 __ LDA T6 + 0 
3b74 : 69 3c __ ADC #$3c
3b76 : 85 1b __ STA P0 
3b78 : a5 64 __ LDA T6 + 1 
3b7a : 65 59 __ ADC T1 + 1 
3b7c : 85 1c __ STA P1 
3b7e : a5 5a __ LDA T1 + 2 
3b80 : 69 00 __ ADC #$00
3b82 : 85 1d __ STA P2 
3b84 : a5 5b __ LDA T1 + 3 
3b86 : 69 00 __ ADC #$00
3b88 : 85 1e __ STA P3 
3b8a : 20 6e 3c JSR $3c6e ; (peek24.s4 + 0)
3b8d : 85 1f __ STA P4 
3b8f : a5 63 __ LDA T6 + 0 
3b91 : 85 1b __ STA P0 
3b93 : a5 64 __ LDA T6 + 1 
3b95 : 85 1c __ STA P1 
3b97 : a9 01 __ LDA #$01
3b99 : 85 1d __ STA P2 
3b9b : a9 00 __ LDA #$00
3b9d : 85 1e __ STA P3 
3b9f : 20 50 0a JSR $0a50 ; (FAR_POKE.s4 + 0)
3ba2 : e6 5c __ INC T2 + 0 
3ba4 : f0 03 __ BEQ $3ba9 ; (checkMODHeader.s39 + 0)
3ba6 : 4c 74 39 JMP $3974 ; (checkMODHeader.s37 + 0)
.s39:
3ba9 : e6 5d __ INC T2 + 1 
3bab : d0 f9 __ BNE $3ba6 ; (checkMODHeader.s27 + 52)
.s38:
3bad : e6 5e __ INC T2 + 2 
3baf : d0 f5 __ BNE $3ba6 ; (checkMODHeader.s27 + 52)
.s36:
3bb1 : e6 5f __ INC T2 + 3 
3bb3 : 4c 74 39 JMP $3974 ; (checkMODHeader.s37 + 0)
--------------------------------------------------------------------
copyToRAM: ; copyToRAM(u8*)->void
;  29, "/mnt/d/F256/f256lib-oscar64/doodles/modplayer/src/muMODplay.h"
.s4:
3bb6 : a9 00 __ LDA #$00
3bb8 : 85 3d __ STA T1 + 0 
3bba : 85 3e __ STA T1 + 1 
3bbc : 85 3f __ STA T1 + 2 
3bbe : 85 40 __ STA T1 + 3 
3bc0 : ad d9 9f LDA $9fd9 ; (sstack + 2)
3bc3 : 85 41 __ STA T3 + 0 
3bc5 : ad da 9f LDA $9fda ; (sstack + 3)
3bc8 : 85 42 __ STA T3 + 1 
3bca : a9 01 __ LDA #$01
3bcc : 85 44 __ STA T5 + 0 
3bce : 85 22 __ STA P7 
3bd0 : a9 9e __ LDA #$9e
3bd2 : 85 21 __ STA P6 
3bd4 : a9 00 __ LDA #$00
3bd6 : 85 23 __ STA P8 
3bd8 : 85 25 __ STA P10 
3bda : a9 ff __ LDA #$ff
3bdc : 85 24 __ STA P9 
.l5:
3bde : a5 41 __ LDA T3 + 0 
3be0 : 8d d7 9f STA $9fd7 ; (sstack + 0)
3be3 : a9 d8 __ LDA #$d8
3be5 : 85 20 __ STA P5 
3be7 : a9 00 __ LDA #$00
3be9 : 85 45 __ STA T6 + 0 
3beb : a5 42 __ LDA T3 + 1 
3bed : 8d d8 9f STA $9fd8 ; (sstack + 1)
3bf0 : 20 a2 1c JSR $1ca2 ; (fileRead.s4 + 0)
3bf3 : a5 29 __ LDA ACCU + 0 ; (theMODfile + 0)
3bf5 : 85 43 __ STA T4 + 0 
3bf7 : c9 ff __ CMP #$ff
3bf9 : f0 04 __ BEQ $3bff ; (copyToRAM.s6 + 0)
.s9:
3bfb : a9 00 __ LDA #$00
3bfd : 85 44 __ STA T5 + 0 
.s6:
3bff : a5 29 __ LDA ACCU + 0 ; (theMODfile + 0)
3c01 : f0 2b __ BEQ $3c2e ; (copyToRAM.s7 + 0)
.s8:
3c03 : a9 00 __ LDA #$00
3c05 : 18 __ __ CLC
.l10:
3c06 : 65 3d __ ADC T1 + 0 
3c08 : 85 1b __ STA P0 
3c0a : a5 3e __ LDA T1 + 1 
3c0c : 69 00 __ ADC #$00
3c0e : 85 1c __ STA P1 
3c10 : a5 3f __ LDA T1 + 2 
3c12 : 69 18 __ ADC #$18
3c14 : 85 1d __ STA P2 
3c16 : a5 40 __ LDA T1 + 3 
3c18 : 69 00 __ ADC #$00
3c1a : 85 1e __ STA P3 
3c1c : a6 45 __ LDX T6 + 0 
3c1e : bd d8 9e LDA $9ed8,x ; (buffer[0] + 0)
3c21 : 85 1f __ STA P4 
3c23 : 20 46 3c JSR $3c46 ; (poke24.s4 + 0)
3c26 : e6 45 __ INC T6 + 0 
3c28 : a5 45 __ LDA T6 + 0 
3c2a : c5 43 __ CMP T4 + 0 
3c2c : 90 d8 __ BCC $3c06 ; (copyToRAM.l10 + 0)
.s7:
3c2e : 18 __ __ CLC
3c2f : a5 43 __ LDA T4 + 0 
3c31 : 65 3d __ ADC T1 + 0 
3c33 : 85 3d __ STA T1 + 0 
3c35 : 90 0a __ BCC $3c41 ; (copyToRAM.s12 + 0)
.s14:
3c37 : e6 3e __ INC T1 + 1 
3c39 : d0 06 __ BNE $3c41 ; (copyToRAM.s12 + 0)
.s13:
3c3b : e6 3f __ INC T1 + 2 
3c3d : d0 02 __ BNE $3c41 ; (copyToRAM.s12 + 0)
.s11:
3c3f : e6 40 __ INC T1 + 3 
.s12:
3c41 : a5 44 __ LDA T5 + 0 
3c43 : d0 99 __ BNE $3bde ; (copyToRAM.l5 + 0)
.s3:
3c45 : 60 __ __ RTS
--------------------------------------------------------------------
poke24: ; poke24(u32,u8)->void
;  13, "/mnt/d/F256/f256lib-oscar64/doodles/modplayer/src/muUtils.h"
.s4:
3c46 : a5 1b __ LDA P0 
3c48 : 85 05 __ STA $05 
3c4a : a5 1c __ LDA P1 
3c4c : 85 06 __ STA $06 
3c4e : a5 1d __ LDA P2 
3c50 : 85 07 __ STA $07 
3c52 : a6 00 __ LDX $00 
3c54 : a4 01 __ LDY $01 
3c56 : 8a __ __ TXA
3c57 : 09 08 __ ORA #$08
3c59 : 08 __ __ PHP
3c5a : 78 __ __ SEI
3c5b : 85 00 __ STA $00 
3c5d : 98 __ __ TYA
3c5e : 09 30 __ ORA #$30
3c60 : 85 01 __ STA $01 
3c62 : a5 1f __ LDA P4 
3c64 : 87 __ __ INV
3c65 : 05 86 __ ORA $86 
3c67 : 00 __ __ BRK
3c68 : 84 01 __ STY $01 
3c6a : 28 __ __ PLP
3c6b : a2 00 __ LDX #$00
.s3:
3c6d : 60 __ __ RTS
--------------------------------------------------------------------
peek24: ; peek24(u32)->u8
;  12, "/mnt/d/F256/f256lib-oscar64/doodles/modplayer/src/muUtils.h"
.s4:
3c6e : a5 1b __ LDA P0 
3c70 : 85 05 __ STA $05 
3c72 : a5 1c __ LDA P1 
3c74 : 85 06 __ STA $06 
3c76 : a5 1d __ LDA P2 
3c78 : 85 07 __ STA $07 
3c7a : a6 00 __ LDX $00 
3c7c : a4 01 __ LDY $01 
3c7e : 8a __ __ TXA
3c7f : 09 08 __ ORA #$08
3c81 : 08 __ __ PHP
3c82 : 78 __ __ SEI
3c83 : 85 00 __ STA $00 
3c85 : 98 __ __ TYA
3c86 : 09 30 __ ORA #$30
3c88 : 85 01 __ STA $01 
3c8a : a7 __ __ INV
3c8b : 05 86 __ ORA $86 
3c8d : 00 __ __ BRK
3c8e : 84 01 __ STY $01 
3c90 : 28 __ __ PLP
3c91 : 85 29 __ STA ACCU + 0 
3c93 : a9 00 __ LDA #$00
3c95 : 85 2a __ STA ACCU + 1 
.s3:
3c97 : a5 29 __ LDA ACCU + 0 
3c99 : 60 __ __ RTS
--------------------------------------------------------------------
3c9a : __ __ __ BYT 0a 46 69 6c 65 20 6e 61 6d 65 3a 20 25 32 30 73 : .File name: %20s
3caa : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
3cab : __ __ __ BYT 0a 4e 62 20 6f 66 20 70 61 74 74 65 72 6e 73 3a : .Nb of patterns:
3cbb : __ __ __ BYT 20 25 64 00                                     :  %d.
--------------------------------------------------------------------
readBigEndianWord: ; readBigEndianWord(u32)->u16
;  33, "/mnt/d/F256/f256lib-oscar64/doodles/modplayer/src/muMODplay.h"
.s4:
3cbf : a5 1f __ LDA P4 ; (addr + 0)
3cc1 : 85 1b __ STA P0 
3cc3 : a5 20 __ LDA P5 ; (addr + 1)
3cc5 : 85 1c __ STA P1 
3cc7 : a5 21 __ LDA P6 ; (addr + 2)
3cc9 : 85 1d __ STA P2 
3ccb : a5 22 __ LDA P7 ; (addr + 3)
3ccd : 85 1e __ STA P3 
3ccf : 20 6e 3c JSR $3c6e ; (peek24.s4 + 0)
3cd2 : 85 35 __ STA T1 + 0 
3cd4 : 18 __ __ CLC
3cd5 : a5 1f __ LDA P4 ; (addr + 0)
3cd7 : 69 01 __ ADC #$01
3cd9 : 85 1b __ STA P0 
3cdb : a5 20 __ LDA P5 ; (addr + 1)
3cdd : 69 00 __ ADC #$00
3cdf : 85 1c __ STA P1 
3ce1 : a5 21 __ LDA P6 ; (addr + 2)
3ce3 : 69 00 __ ADC #$00
3ce5 : 85 1d __ STA P2 
3ce7 : a5 22 __ LDA P7 ; (addr + 3)
3ce9 : 69 00 __ ADC #$00
3ceb : 85 1e __ STA P3 
3ced : 20 6e 3c JSR $3c6e ; (peek24.s4 + 0)
3cf0 : 85 29 __ STA ACCU + 0 
3cf2 : a5 35 __ LDA T1 + 0 
3cf4 : 85 2a __ STA ACCU + 1 
.s3:
3cf6 : 60 __ __ RTS
--------------------------------------------------------------------
textPrint: ; textPrint(const u8*)->void
;  46, "/mnt/d/F256/f256lib-oscar64/f256lib/f_text.h"
.s4:
3cf7 : ad fe 44 LDA $44fe ; (_MAX_COL + 0)
3cfa : 85 41 __ STA T10 + 0 
3cfc : 85 3d __ STA T6 + 0 
3cfe : 85 1b __ STA P0 
3d00 : ad 9f 4c LDA $4c9f ; (_row + 0)
3d03 : 85 1d __ STA P2 
3d05 : a9 00 __ LDA #$00
3d07 : 85 1c __ STA P1 
3d09 : 85 1e __ STA P3 
3d0b : a5 01 __ LDA $01 
3d0d : 85 42 __ STA T11 + 0 
3d0f : 20 78 04 JSR $0478 ; (mathUnsignedMultiply.s4 + 0)
3d12 : a9 00 __ LDA #$00
3d14 : 85 1b __ STA P0 
3d16 : 85 1d __ STA P2 
3d18 : a5 29 __ LDA ACCU + 0 
3d1a : 85 1f __ STA P4 
3d1c : a9 c0 __ LDA #$c0
3d1e : 85 1c __ STA P1 
3d20 : a5 2a __ LDA ACCU + 1 
3d22 : 85 20 __ STA P5 
3d24 : a5 2b __ LDA ACCU + 2 
3d26 : 85 21 __ STA P6 
3d28 : a5 2c __ LDA ACCU + 3 
3d2a : 85 22 __ STA P7 
3d2c : 20 8a 3e JSR $3e8a ; (mathUnsignedAddition.s4 + 0)
3d2f : a5 29 __ LDA ACCU + 0 
3d31 : 85 35 __ STA T0 + 0 
3d33 : a5 2a __ LDA ACCU + 1 
3d35 : 85 36 __ STA T0 + 1 
3d37 : a9 00 __ LDA #$00
3d39 : 85 3e __ STA T7 + 0 
3d3b : 85 3f __ STA T7 + 1 
.l38:
3d3d : a5 3e __ LDA T7 + 0 
3d3f : 85 29 __ STA ACCU + 0 
3d41 : 18 __ __ CLC
3d42 : a5 24 __ LDA P9 ; (message + 1)
3d44 : 65 3f __ ADC T7 + 1 
3d46 : 85 2a __ STA ACCU + 1 
3d48 : a4 23 __ LDY P8 ; (message + 0)
3d4a : b1 29 __ LDA (ACCU + 0),y 
3d4c : d0 11 __ BNE $3d5f ; (textPrint.s6 + 0)
.s5:
3d4e : a5 42 __ LDA T11 + 0 
3d50 : 85 01 __ STA $01 
3d52 : ad 9e 4c LDA $4c9e ; (_col + 0)
3d55 : 85 1b __ STA P0 
3d57 : ad 9f 4c LDA $4c9f ; (_row + 0)
3d5a : 85 1c __ STA P1 
3d5c : 4c 52 05 JMP $0552 ; (textGotoXY.s4 + 0)
.s6:
3d5f : c9 0a __ CMP #$0a
3d61 : f0 28 __ BEQ $3d8b ; (textPrint.s9 + 0)
.s7:
3d63 : c9 0d __ CMP #$0d
3d65 : f0 24 __ BEQ $3d8b ; (textPrint.s9 + 0)
.s8:
3d67 : a9 03 __ LDA #$03
3d69 : 85 01 __ STA $01 
3d6b : ad 9e 4c LDA $4c9e ; (_col + 0)
3d6e : aa __ __ TAX
3d6f : e8 __ __ INX
3d70 : 8e 9e 4c STX $4c9e ; (_col + 0)
3d73 : 85 37 __ STA T2 + 0 
3d75 : a8 __ __ TAY
3d76 : ad fd 44 LDA $44fd ; (_ccolor + 0)
3d79 : 91 35 __ STA (T0 + 0),y 
3d7b : a9 02 __ LDA #$02
3d7d : 85 01 __ STA $01 
3d7f : a4 23 __ LDY P8 ; (message + 0)
3d81 : b1 29 __ LDA (ACCU + 0),y 
3d83 : a4 37 __ LDY T2 + 0 
3d85 : 91 35 __ STA (T0 + 0),y 
3d87 : e4 41 __ CPX T10 + 0 
3d89 : d0 1b __ BNE $3da6 ; (textPrint.s11 + 0)
.s9:
3d8b : ee 9f 4c INC $4c9f ; (_row + 0)
3d8e : a9 00 __ LDA #$00
3d90 : 8d 9e 4c STA $4c9e ; (_col + 0)
3d93 : ad 9f 4c LDA $4c9f ; (_row + 0)
3d96 : cd ff 44 CMP $44ff ; (_MAX_ROW + 0)
3d99 : f0 14 __ BEQ $3daf ; (textPrint.s12 + 0)
.s10:
3d9b : 18 __ __ CLC
3d9c : a5 35 __ LDA T0 + 0 
3d9e : 65 3d __ ADC T6 + 0 
3da0 : 85 35 __ STA T0 + 0 
3da2 : 90 02 __ BCC $3da6 ; (textPrint.s11 + 0)
.s40:
3da4 : e6 36 __ INC T0 + 1 
.s11:
3da6 : e6 3e __ INC T7 + 0 
3da8 : d0 93 __ BNE $3d3d ; (textPrint.l38 + 0)
.s39:
3daa : e6 3f __ INC T7 + 1 
3dac : 4c 3d 3d JMP $3d3d ; (textPrint.l38 + 0)
.s12:
3daf : 85 40 __ STA T8 + 0 
3db1 : ad ff 44 LDA $44ff ; (_MAX_ROW + 0)
3db4 : e9 01 __ SBC #$01
3db6 : 85 35 __ STA T0 + 0 
3db8 : 85 29 __ STA ACCU + 0 
3dba : a9 03 __ LDA #$03
3dbc : 85 01 __ STA $01 
3dbe : a9 00 __ LDA #$00
3dc0 : e9 00 __ SBC #$00
3dc2 : 85 36 __ STA T0 + 1 
3dc4 : 85 2a __ STA ACCU + 1 
3dc6 : a5 3d __ LDA T6 + 0 
3dc8 : 20 47 45 JSR $4547 ; (mul16by8 + 0)
3dcb : a5 2a __ LDA ACCU + 1 
3dcd : 10 0a __ BPL $3dd9 ; (textPrint.s15 + 0)
.s13:
3dcf : a9 00 __ LDA #$00
.s14:
3dd1 : 85 2b __ STA ACCU + 2 
3dd3 : a9 02 __ LDA #$02
3dd5 : 85 37 __ STA T2 + 0 
3dd7 : d0 08 __ BNE $3de1 ; (textPrint.l16 + 0)
.s15:
3dd9 : 05 29 __ ORA ACCU + 0 
3ddb : f0 f4 __ BEQ $3dd1 ; (textPrint.s14 + 0)
.s29:
3ddd : a9 01 __ LDA #$01
3ddf : d0 f0 __ BNE $3dd1 ; (textPrint.s14 + 0)
.l16:
3de1 : a9 00 __ LDA #$00
3de3 : 85 39 __ STA T3 + 0 
3de5 : 85 3a __ STA T3 + 1 
3de7 : a5 2b __ LDA ACCU + 2 
3de9 : f0 29 __ BEQ $3e14 ; (textPrint.s17 + 0)
.s22:
3deb : a2 00 __ LDX #$00
3ded : 86 3b __ STX T4 + 0 
3def : a9 c0 __ LDA #$c0
3df1 : 85 3c __ STA T4 + 1 
.l23:
3df3 : a4 3d __ LDY T6 + 0 
3df5 : b1 3b __ LDA (T4 + 0),y 
3df7 : a0 00 __ LDY #$00
3df9 : 91 3b __ STA (T4 + 0),y 
3dfb : e6 3b __ INC T4 + 0 
3dfd : d0 02 __ BNE $3e01 ; (textPrint.s31 + 0)
.s30:
3dff : e6 3c __ INC T4 + 1 
.s31:
3e01 : e8 __ __ INX
3e02 : d0 02 __ BNE $3e06 ; (textPrint.s33 + 0)
.s32:
3e04 : e6 3a __ INC T3 + 1 
.s33:
3e06 : a5 3a __ LDA T3 + 1 
3e08 : c5 2a __ CMP ACCU + 1 
3e0a : 90 e7 __ BCC $3df3 ; (textPrint.l23 + 0)
.s41:
3e0c : d0 04 __ BNE $3e12 ; (textPrint.s28 + 0)
.s24:
3e0e : e4 29 __ CPX ACCU + 0 
3e10 : 90 e1 __ BCC $3df3 ; (textPrint.l23 + 0)
.s28:
3e12 : 86 39 __ STX T3 + 0 
.s17:
3e14 : a9 02 __ LDA #$02
3e16 : 85 01 __ STA $01 
3e18 : c6 37 __ DEC T2 + 0 
3e1a : d0 c5 __ BNE $3de1 ; (textPrint.l16 + 0)
.s18:
3e1c : a9 03 __ LDA #$03
3e1e : 85 01 __ STA $01 
3e20 : a5 41 __ LDA T10 + 0 
3e22 : d0 06 __ BNE $3e2a ; (textPrint.s21 + 0)
.s19:
3e24 : a9 02 __ LDA #$02
3e26 : 85 01 __ STA $01 
3e28 : d0 3a __ BNE $3e64 ; (textPrint.s20 + 0)
.s21:
3e2a : 18 __ __ CLC
3e2b : a5 3a __ LDA T3 + 1 
3e2d : 69 c0 __ ADC #$c0
3e2f : 85 38 __ STA T2 + 1 
3e31 : 85 3a __ STA T3 + 1 
3e33 : ad fd 44 LDA $44fd ; (_ccolor + 0)
3e36 : 85 3b __ STA T4 + 0 
3e38 : a9 00 __ LDA #$00
3e3a : a4 39 __ LDY T3 + 0 
3e3c : 84 37 __ STY T2 + 0 
3e3e : 85 39 __ STA T3 + 0 
3e40 : a6 3d __ LDX T6 + 0 
.l25:
3e42 : a5 3b __ LDA T4 + 0 
3e44 : 91 39 __ STA (T3 + 0),y 
3e46 : c8 __ __ INY
3e47 : d0 02 __ BNE $3e4b ; (textPrint.s35 + 0)
.s34:
3e49 : e6 3a __ INC T3 + 1 
.s35:
3e4b : ca __ __ DEX
3e4c : d0 f4 __ BNE $3e42 ; (textPrint.l25 + 0)
.s26:
3e4e : a9 02 __ LDA #$02
3e50 : 85 01 __ STA $01 
3e52 : a4 37 __ LDY T2 + 0 
3e54 : 86 37 __ STX T2 + 0 
3e56 : a6 3d __ LDX T6 + 0 
.l27:
3e58 : a9 20 __ LDA #$20
3e5a : 91 37 __ STA (T2 + 0),y 
3e5c : c8 __ __ INY
3e5d : d0 02 __ BNE $3e61 ; (textPrint.s37 + 0)
.s36:
3e5f : e6 38 __ INC T2 + 1 
.s37:
3e61 : ca __ __ DEX
3e62 : d0 f4 __ BNE $3e58 ; (textPrint.l27 + 0)
.s20:
3e64 : a6 40 __ LDX T8 + 0 
3e66 : ca __ __ DEX
3e67 : 8e 9f 4c STX $4c9f ; (_row + 0)
3e6a : a5 36 __ LDA T0 + 1 
3e6c : 85 20 __ STA P5 
3e6e : 29 80 __ AND #$80
3e70 : 10 02 __ BPL $3e74 ; (textPrint.s20 + 16)
3e72 : a9 ff __ LDA #$ff
3e74 : 85 21 __ STA P6 
3e76 : 85 22 __ STA P7 
3e78 : a5 35 __ LDA T0 + 0 
3e7a : 85 1f __ STA P4 
3e7c : 20 8a 3e JSR $3e8a ; (mathUnsignedAddition.s4 + 0)
3e7f : a5 29 __ LDA ACCU + 0 
3e81 : 85 35 __ STA T0 + 0 
3e83 : a5 2a __ LDA ACCU + 1 
3e85 : 85 36 __ STA T0 + 1 
3e87 : 4c a6 3d JMP $3da6 ; (textPrint.s11 + 0)
--------------------------------------------------------------------
mathUnsignedAddition: ; mathUnsignedAddition(u32,u32)->u32
;  18, "/mnt/d/F256/f256lib-oscar64/f256lib/f_math.h"
.s4:
3e8a : a5 1b __ LDA P0 ; (a + 0)
3e8c : 8d 08 de STA $de08 
3e8f : a5 1c __ LDA P1 ; (a + 1)
3e91 : 8d 09 de STA $de09 
3e94 : a5 1d __ LDA P2 ; (a + 2)
3e96 : 8d 0a de STA $de0a 
3e99 : a5 1e __ LDA P3 ; (a + 3)
3e9b : 8d 0b de STA $de0b 
3e9e : a5 1f __ LDA P4 ; (b + 0)
3ea0 : 8d 0c de STA $de0c 
3ea3 : a5 20 __ LDA P5 ; (b + 1)
3ea5 : 8d 0d de STA $de0d 
3ea8 : a5 21 __ LDA P6 ; (b + 2)
3eaa : 8d 0e de STA $de0e 
3ead : a5 22 __ LDA P7 ; (b + 3)
3eaf : 8d 0f de STA $de0f 
3eb2 : ad 18 de LDA $de18 
3eb5 : 85 29 __ STA ACCU + 0 
3eb7 : ad 19 de LDA $de19 
3eba : 85 2a __ STA ACCU + 1 
3ebc : ad 1a de LDA $de1a 
3ebf : 85 2b __ STA ACCU + 2 
3ec1 : ad 1b de LDA $de1b 
3ec4 : 85 2c __ STA ACCU + 3 
.s3:
3ec6 : 60 __ __ RTS
--------------------------------------------------------------------
3ec7 : __ __ __ BYT 53 61 6d 70 6c 65 20 00                         : Sample .
--------------------------------------------------------------------
textPrintInt: ; textPrintInt(i32)->void
;  47, "/mnt/d/F256/f256lib-oscar64/f256lib/f_text.h"
.s1:
3ecf : a2 03 __ LDX #$03
3ed1 : b5 55 __ LDA T0 + 0,x 
3ed3 : 9d d3 9f STA $9fd3,x ; (textPrintInt@stack + 0)
3ed6 : ca __ __ DEX
3ed7 : 10 f8 __ BPL $3ed1 ; (textPrintInt.s1 + 2)
3ed9 : 38 __ __ SEC
3eda : a5 31 __ LDA SP + 0 
3edc : e9 06 __ SBC #$06
3ede : 85 31 __ STA SP + 0 
3ee0 : b0 02 __ BCS $3ee4 ; (textPrintInt.s4 + 0)
3ee2 : c6 32 __ DEC SP + 1 
.s4:
3ee4 : ad d7 9f LDA $9fd7 ; (sstack + 0)
3ee7 : 85 55 __ STA T0 + 0 
3ee9 : ad d8 9f LDA $9fd8 ; (sstack + 1)
3eec : 85 56 __ STA T0 + 1 
3eee : ad d9 9f LDA $9fd9 ; (sstack + 2)
3ef1 : 85 57 __ STA T0 + 2 
3ef3 : ad da 9f LDA $9fda ; (sstack + 3)
3ef6 : 85 58 __ STA T0 + 3 
3ef8 : 30 15 __ BMI $3f0f ; (textPrintInt.s6 + 0)
.s5:
3efa : a5 55 __ LDA T0 + 0 
3efc : a0 02 __ LDY #$02
3efe : 91 31 __ STA (SP + 0),y 
3f00 : a5 56 __ LDA T0 + 1 
3f02 : c8 __ __ INY
3f03 : 91 31 __ STA (SP + 0),y 
3f05 : a5 57 __ LDA T0 + 2 
3f07 : c8 __ __ INY
3f08 : 91 31 __ STA (SP + 0),y 
3f0a : a5 58 __ LDA T0 + 3 
3f0c : 4c 35 3f JMP $3f35 ; (textPrintInt.s3 + 0)
.s6:
3f0f : a9 52 __ LDA #$52
3f11 : 85 23 __ STA P8 
3f13 : a9 3f __ LDA #$3f
3f15 : 85 24 __ STA P9 
3f17 : 20 f7 3c JSR $3cf7 ; (textPrint.s4 + 0)
3f1a : 38 __ __ SEC
3f1b : a9 00 __ LDA #$00
3f1d : e5 55 __ SBC T0 + 0 
3f1f : a0 02 __ LDY #$02
3f21 : 91 31 __ STA (SP + 0),y 
3f23 : a9 00 __ LDA #$00
3f25 : e5 56 __ SBC T0 + 1 
3f27 : c8 __ __ INY
3f28 : 91 31 __ STA (SP + 0),y 
3f2a : a9 00 __ LDA #$00
3f2c : e5 57 __ SBC T0 + 2 
3f2e : c8 __ __ INY
3f2f : 91 31 __ STA (SP + 0),y 
3f31 : a9 00 __ LDA #$00
3f33 : e5 58 __ SBC T0 + 3 
.s3:
3f35 : a0 05 __ LDY #$05
3f37 : 91 31 __ STA (SP + 0),y 
3f39 : 20 54 3f JSR $3f54 ; (textPrintUInt.s1 + 0)
3f3c : 18 __ __ CLC
3f3d : a5 31 __ LDA SP + 0 
3f3f : 69 06 __ ADC #$06
3f41 : 85 31 __ STA SP + 0 
3f43 : 90 02 __ BCC $3f47 ; (textPrintInt.s3 + 18)
3f45 : e6 32 __ INC SP + 1 
3f47 : a2 03 __ LDX #$03
3f49 : bd d3 9f LDA $9fd3,x ; (textPrintInt@stack + 0)
3f4c : 95 55 __ STA T0 + 0,x 
3f4e : ca __ __ DEX
3f4f : 10 f8 __ BPL $3f49 ; (textPrintInt.s3 + 20)
3f51 : 60 __ __ RTS
--------------------------------------------------------------------
3f52 : __ __ __ BYT 2d 00                                           : -.
--------------------------------------------------------------------
textPrintUInt: ; textPrintUInt(u32)->void
;  48, "/mnt/d/F256/f256lib-oscar64/f256lib/f_text.h"
.s1:
3f54 : 38 __ __ SEC
3f55 : a5 31 __ LDA SP + 0 
3f57 : e9 0a __ SBC #$0a
3f59 : 85 31 __ STA SP + 0 
3f5b : b0 02 __ BCS $3f5f ; (textPrintUInt.s1 + 11)
3f5d : c6 32 __ DEC SP + 1 
3f5f : a0 07 __ LDY #$07
3f61 : a5 56 __ LDA T2 + 1 
3f63 : 91 31 __ STA (SP + 0),y 
3f65 : 88 __ __ DEY
3f66 : a5 55 __ LDA T2 + 0 
3f68 : 91 31 __ STA (SP + 0),y 
.s4:
3f6a : 18 __ __ CLC
3f6b : a5 31 __ LDA SP + 0 
3f6d : 69 08 __ ADC #$08
3f6f : 85 55 __ STA T2 + 0 
3f71 : a5 32 __ LDA SP + 1 
3f73 : 69 00 __ ADC #$00
3f75 : 85 56 __ STA T2 + 1 
3f77 : a0 0c __ LDY #$0c
3f79 : b1 31 __ LDA (SP + 0),y 
3f7b : 85 1b __ STA P0 ; (value + 0)
3f7d : aa __ __ TAX
3f7e : c8 __ __ INY
3f7f : b1 31 __ LDA (SP + 0),y 
3f81 : 85 3a __ STA T1 + 1 
3f83 : 85 1c __ STA P1 ; (value + 1)
3f85 : c8 __ __ INY
3f86 : b1 31 __ LDA (SP + 0),y 
3f88 : 85 3b __ STA T1 + 2 
3f8a : c8 __ __ INY
3f8b : b1 31 __ LDA (SP + 0),y 
3f8d : 85 3c __ STA T1 + 3 
3f8f : d0 0f __ BNE $3fa0 ; (textPrintUInt.s6 + 0)
.s14:
3f91 : a5 3b __ LDA T1 + 2 
3f93 : d0 0b __ BNE $3fa0 ; (textPrintUInt.s6 + 0)
.s15:
3f95 : a5 1c __ LDA P1 ; (value + 1)
3f97 : d0 07 __ BNE $3fa0 ; (textPrintUInt.s6 + 0)
.s16:
3f99 : e0 0a __ CPX #$0a
3f9b : b0 03 __ BCS $3fa0 ; (textPrintUInt.s6 + 0)
3f9d : 4c 1e 40 JMP $401e ; (textPrintUInt.s5 + 0)
.s6:
3fa0 : a5 3c __ LDA T1 + 3 
3fa2 : d0 2f __ BNE $3fd3 ; (textPrintUInt.s9 + 0)
.s10:
3fa4 : a5 3b __ LDA T1 + 2 
3fa6 : d0 2b __ BNE $3fd3 ; (textPrintUInt.s9 + 0)
.s11:
3fa8 : a9 ff __ LDA #$ff
3faa : c5 1c __ CMP P1 ; (value + 1)
3fac : d0 02 __ BNE $3fb0 ; (textPrintUInt.s13 + 0)
.s12:
3fae : c5 1b __ CMP P0 ; (value + 0)
.s13:
3fb0 : 90 21 __ BCC $3fd3 ; (textPrintUInt.s9 + 0)
.s7:
3fb2 : 8e 06 de STX $de06 
3fb5 : a5 1c __ LDA P1 ; (value + 1)
3fb7 : 8d 07 de STA $de07 
3fba : a9 0a __ LDA #$0a
3fbc : 8d 04 de STA $de04 
3fbf : a9 00 __ LDA #$00
3fc1 : 8d 05 de STA $de05 
3fc4 : ad 14 de LDA $de14 
3fc7 : 85 29 __ STA ACCU + 0 
3fc9 : ad 15 de LDA $de15 
3fcc : 85 2a __ STA ACCU + 1 
3fce : a9 00 __ LDA #$00
3fd0 : aa __ __ TAX
3fd1 : b0 21 __ BCS $3ff4 ; (textPrintUInt.s8 + 0)
.s9:
3fd3 : 86 29 __ STX ACCU + 0 
3fd5 : a5 1c __ LDA P1 ; (value + 1)
3fd7 : 85 2a __ STA ACCU + 1 
3fd9 : a5 3b __ LDA T1 + 2 
3fdb : 85 2b __ STA ACCU + 2 
3fdd : a5 3c __ LDA T1 + 3 
3fdf : 85 2c __ STA ACCU + 3 
3fe1 : a9 00 __ LDA #$00
3fe3 : 85 12 __ STA WORK + 1 
3fe5 : 85 13 __ STA WORK + 2 
3fe7 : 85 14 __ STA WORK + 3 
3fe9 : a9 0a __ LDA #$0a
3feb : 85 11 __ STA WORK + 0 
3fed : 20 2c 4a JSR $4a2c ; (divmod32 + 0)
3ff0 : a5 2c __ LDA ACCU + 3 
3ff2 : a6 2b __ LDX ACCU + 2 
.s8:
3ff4 : a0 05 __ LDY #$05
3ff6 : 91 31 __ STA (SP + 0),y 
3ff8 : 8a __ __ TXA
3ff9 : 88 __ __ DEY
3ffa : 91 31 __ STA (SP + 0),y 
3ffc : a5 29 __ LDA ACCU + 0 
3ffe : a0 02 __ LDY #$02
4000 : 91 31 __ STA (SP + 0),y 
4002 : a5 2a __ LDA ACCU + 1 
4004 : c8 __ __ INY
4005 : 91 31 __ STA (SP + 0),y 
4007 : 20 54 3f JSR $3f54 ; (textPrintUInt.s1 + 0)
400a : a0 0c __ LDY #$0c
400c : b1 31 __ LDA (SP + 0),y 
400e : aa __ __ TAX
400f : c8 __ __ INY
4010 : b1 31 __ LDA (SP + 0),y 
4012 : 85 3a __ STA T1 + 1 
4014 : c8 __ __ INY
4015 : b1 31 __ LDA (SP + 0),y 
4017 : 85 3b __ STA T1 + 2 
4019 : c8 __ __ INY
401a : b1 31 __ LDA (SP + 0),y 
401c : 85 3c __ STA T1 + 3 
.s5:
401e : 86 29 __ STX ACCU + 0 
4020 : a5 55 __ LDA T2 + 0 
4022 : 85 23 __ STA P8 
4024 : a5 56 __ LDA T2 + 1 
4026 : 85 24 __ STA P9 
4028 : a9 00 __ LDA #$00
402a : a0 09 __ LDY #$09
402c : 91 31 __ STA (SP + 0),y 
402e : 85 12 __ STA WORK + 1 
4030 : 85 13 __ STA WORK + 2 
4032 : 85 14 __ STA WORK + 3 
4034 : a5 3a __ LDA T1 + 1 
4036 : 85 2a __ STA ACCU + 1 
4038 : a5 3b __ LDA T1 + 2 
403a : 85 2b __ STA ACCU + 2 
403c : a5 3c __ LDA T1 + 3 
403e : 85 2c __ STA ACCU + 3 
4040 : a9 0a __ LDA #$0a
4042 : 85 11 __ STA WORK + 0 
4044 : 20 2c 4a JSR $4a2c ; (divmod32 + 0)
4047 : 18 __ __ CLC
4048 : a5 15 __ LDA WORK + 4 
404a : 69 30 __ ADC #$30
404c : a0 08 __ LDY #$08
404e : 91 31 __ STA (SP + 0),y 
4050 : 20 f7 3c JSR $3cf7 ; (textPrint.s4 + 0)
.s3:
4053 : a0 07 __ LDY #$07
4055 : b1 31 __ LDA (SP + 0),y 
4057 : 85 56 __ STA T2 + 1 
4059 : 88 __ __ DEY
405a : b1 31 __ LDA (SP + 0),y 
405c : 85 55 __ STA T2 + 0 
405e : 18 __ __ CLC
405f : a5 31 __ LDA SP + 0 
4061 : 69 0a __ ADC #$0a
4063 : 85 31 __ STA SP + 0 
4065 : 90 02 __ BCC $4069 ; (textPrintUInt.s3 + 22)
4067 : e6 32 __ INC SP + 1 
4069 : 60 __ __ RTS
--------------------------------------------------------------------
406a : __ __ __ BYT 20 62 79 74 65 73 00                            :  bytes.
--------------------------------------------------------------------
4071 : __ __ __ BYT 73 70 6c 20 72 20 00                            : spl r .
--------------------------------------------------------------------
4078 : __ __ __ BYT 25 30 38 6c 78 00                               : %08lx.
--------------------------------------------------------------------
407e : __ __ __ BYT 63 70 79 20 77 20 00                            : cpy w .
--------------------------------------------------------------------
headerPump: ; headerPump()->void
;  34, "/mnt/d/F256/f256lib-oscar64/doodles/modplayer/src/muMODplay.h"
.s4:
4085 : a2 00 __ LDX #$00
.l5:
4087 : bd be 4c LDA $4cbe,x ; (pcmHeader[0] + 0)
408a : 8d 07 d7 STA $d707 
408d : e8 __ __ INX
408e : e0 2c __ CPX #$2c
4090 : d0 f5 __ BNE $4087 ; (headerPump.l5 + 0)
.s3:
4092 : 60 __ __ RTS
--------------------------------------------------------------------
4093 : __ __ __ BYT 20 68 65 61 64 65 72 20 73 65 6e 74 2e 20 00    :  header sent. .
--------------------------------------------------------------------
read2KChunk: ; read2KChunk(u8,u32)->void
;  37, "/mnt/d/F256/f256lib-oscar64/doodles/modplayer/src/muMODplay.h"
.s4:
40a2 : ad eb 4c LDA $4ceb ; (hasEnded + 0)
40a5 : d0 10 __ BNE $40b7 ; (read2KChunk.s3 + 0)
.s5:
40a7 : ad ec 4c LDA $4cec ; (nearingEnd + 0)
40aa : f0 0c __ BEQ $40b8 ; (read2KChunk.s6 + 0)
.s42:
40ac : 8d eb 4c STA $4ceb ; (hasEnded + 0)
40af : a9 00 __ LDA #$00
40b1 : 8d ea 4c STA $4cea ; (isPlaying + 0)
.s43:
40b4 : 8d ec 4c STA $4cec ; (nearingEnd + 0)
.s3:
40b7 : 60 __ __ RTS
.s6:
40b8 : a5 1f __ LDA P4 ; (index + 0)
40ba : 0a __ __ ASL
40bb : aa __ __ TAX
40bc : bd 7a 4f LDA $4f7a,x ; (instLength[0] + 0)
40bf : 0a __ __ ASL
40c0 : 85 3d __ STA T2 + 0 
40c2 : bd 7b 4f LDA $4f7b,x ; (instLength[0] + 1)
40c5 : 2a __ __ ROL
40c6 : 85 3e __ STA T2 + 1 
40c8 : a9 00 __ LDA #$00
40ca : 85 47 __ STA T7 + 0 
40cc : 2a __ __ ROL
40cd : 85 3f __ STA T2 + 2 
40cf : d0 0e __ BNE $40df ; (read2KChunk.l7 + 0)
.s39:
40d1 : ad c6 4d LDA $4dc6 ; (chan0Fixed + 3)
40d4 : c5 3e __ CMP T2 + 1 
40d6 : d0 05 __ BNE $40dd ; (read2KChunk.s41 + 0)
.s40:
40d8 : ad c5 4d LDA $4dc5 ; (chan0Fixed + 2)
40db : c5 3d __ CMP T2 + 0 
.s41:
40dd : b0 6a __ BCS $4149 ; (read2KChunk.s11 + 0)
.l7:
40df : ad c5 4d LDA $4dc5 ; (chan0Fixed + 2)
40e2 : 18 __ __ CLC
40e3 : 69 20 __ ADC #$20
40e5 : 85 39 __ STA T1 + 0 
40e7 : ad c6 4d LDA $4dc6 ; (chan0Fixed + 3)
40ea : 69 00 __ ADC #$00
40ec : 85 3a __ STA T1 + 1 
40ee : a9 00 __ LDA #$00
40f0 : 2a __ __ ROL
40f1 : 85 3b __ STA T1 + 2 
40f3 : a5 3f __ LDA T2 + 2 
40f5 : c5 3b __ CMP T1 + 2 
40f7 : d0 0a __ BNE $4103 ; (read2KChunk.s37 + 0)
.s35:
40f9 : a5 3e __ LDA T2 + 1 
40fb : c5 3a __ CMP T1 + 1 
40fd : d0 04 __ BNE $4103 ; (read2KChunk.s37 + 0)
.s36:
40ff : a5 3d __ LDA T2 + 0 
4101 : c5 39 __ CMP T1 + 0 
.s37:
4103 : 90 03 __ BCC $4108 ; (read2KChunk.s8 + 0)
4105 : 4c 47 42 JMP $4247 ; (read2KChunk.l24 + 0)
.s8:
4108 : 38 __ __ SEC
4109 : a5 3d __ LDA T2 + 0 
410b : ed c5 4d SBC $4dc5 ; (chan0Fixed + 2)
410e : 85 40 __ STA T3 + 0 
4110 : a5 3e __ LDA T2 + 1 
4112 : ed c6 4d SBC $4dc6 ; (chan0Fixed + 3)
4115 : 85 41 __ STA T3 + 1 
.l9:
4117 : ad 04 d7 LDA $d704 
411a : 85 39 __ STA T1 + 0 
411c : ad 05 d7 LDA $d705 
411f : 29 07 __ AND #$07
4121 : 85 3a __ STA T1 + 1 
4123 : a9 00 __ LDA #$00
4125 : 38 __ __ SEC
4126 : e5 39 __ SBC T1 + 0 
4128 : aa __ __ TAX
4129 : a9 08 __ LDA #$08
412b : e5 3a __ SBC T1 + 1 
412d : 85 3a __ STA T1 + 1 
412f : a9 00 __ LDA #$00
4131 : e9 00 __ SBC #$00
4133 : 90 0e __ BCC $4143 ; (read2KChunk.s10 + 0)
.s21:
4135 : d0 0c __ BNE $4143 ; (read2KChunk.s10 + 0)
.s22:
4137 : a5 3a __ LDA T1 + 1 
4139 : c5 41 __ CMP T3 + 1 
413b : 90 da __ BCC $4117 ; (read2KChunk.l9 + 0)
.s51:
413d : d0 04 __ BNE $4143 ; (read2KChunk.s10 + 0)
.s23:
413f : e4 40 __ CPX T3 + 0 
4141 : 90 d4 __ BCC $4117 ; (read2KChunk.l9 + 0)
.s10:
4143 : a5 40 __ LDA T3 + 0 
4145 : 05 41 __ ORA T3 + 1 
4147 : d0 05 __ BNE $414e ; (read2KChunk.s12 + 0)
.s11:
4149 : a9 01 __ LDA #$01
414b : 4c b4 40 JMP $40b4 ; (read2KChunk.s43 + 0)
.s12:
414e : a5 1f __ LDA P4 ; (index + 0)
4150 : 0a __ __ ASL
4151 : 0a __ __ ASL
4152 : 85 44 __ STA T5 + 0 
4154 : a9 00 __ LDA #$00
4156 : 85 45 __ STA T6 + 0 
4158 : 85 46 __ STA T6 + 1 
.l13:
415a : ad c4 4d LDA $4dc4 ; (chan0Fixed + 1)
415d : 85 43 __ STA T4 + 1 
415f : a4 44 __ LDY T5 + 0 
4161 : b9 00 50 LDA $5000,y ; (instAddr[0] + 0)
4164 : 18 __ __ CLC
4165 : 6d c5 4d ADC $4dc5 ; (chan0Fixed + 2)
4168 : 85 1b __ STA P0 
416a : b9 01 50 LDA $5001,y ; (instAddr[0] + 1)
416d : 6d c6 4d ADC $4dc6 ; (chan0Fixed + 3)
4170 : 85 1c __ STA P1 
4172 : b9 02 50 LDA $5002,y ; (instAddr[0] + 2)
4175 : 69 00 __ ADC #$00
4177 : aa __ __ TAX
4178 : b9 03 50 LDA $5003,y ; (instAddr[0] + 3)
417b : 69 00 __ ADC #$00
417d : a8 __ __ TAY
417e : 8a __ __ TXA
417f : 18 __ __ CLC
4180 : 69 01 __ ADC #$01
4182 : 85 1d __ STA P2 
4184 : 98 __ __ TYA
4185 : 69 00 __ ADC #$00
4187 : 85 1e __ STA P3 
4189 : 18 __ __ CLC
418a : a5 1b __ LDA P0 
418c : 69 01 __ ADC #$01
418e : 85 39 __ STA T1 + 0 
4190 : a5 1c __ LDA P1 
4192 : 69 00 __ ADC #$00
4194 : 85 3a __ STA T1 + 1 
4196 : 8a __ __ TXA
4197 : 69 00 __ ADC #$00
4199 : 85 3b __ STA T1 + 2 
419b : 98 __ __ TYA
419c : 69 00 __ ADC #$00
419e : d0 14 __ BNE $41b4 ; (read2KChunk.s16 + 0)
.s17:
41a0 : 85 3c __ STA T1 + 3 
41a2 : a5 3b __ LDA T1 + 2 
41a4 : c5 3f __ CMP T2 + 2 
41a6 : d0 0a __ BNE $41b2 ; (read2KChunk.s20 + 0)
.s18:
41a8 : a5 3a __ LDA T1 + 1 
41aa : c5 3e __ CMP T2 + 1 
41ac : d0 04 __ BNE $41b2 ; (read2KChunk.s20 + 0)
.s19:
41ae : a5 39 __ LDA T1 + 0 
41b0 : c5 3d __ CMP T2 + 0 
.s20:
41b2 : 90 0a __ BCC $41be ; (read2KChunk.s14 + 0)
.s16:
41b4 : 86 3b __ STX T1 + 2 
41b6 : 84 3c __ STY T1 + 3 
41b8 : c6 39 __ DEC T1 + 0 
41ba : a5 1c __ LDA P1 
41bc : 85 3a __ STA T1 + 1 
.s14:
41be : 20 76 1f JSR $1f76 ; (FAR_PEEK.s4 + 0)
41c1 : 85 47 __ STA T7 + 0 
41c3 : 29 80 __ AND #$80
41c5 : 10 02 __ BPL $41c9 ; (read2KChunk.s14 + 11)
41c7 : a9 ff __ LDA #$ff
41c9 : 85 48 __ STA T7 + 1 
41cb : 18 __ __ CLC
41cc : a5 3b __ LDA T1 + 2 
41ce : 69 01 __ ADC #$01
41d0 : 85 1d __ STA P2 
41d2 : a5 3c __ LDA T1 + 3 
41d4 : 69 00 __ ADC #$00
41d6 : 85 1e __ STA P3 
41d8 : a5 39 __ LDA T1 + 0 
41da : 85 1b __ STA P0 
41dc : a5 3a __ LDA T1 + 1 
41de : 85 1c __ STA P1 
41e0 : 20 76 1f JSR $1f76 ; (FAR_PEEK.s4 + 0)
41e3 : a8 __ __ TAY
41e4 : 0a __ __ ASL
41e5 : a2 ff __ LDX #$ff
41e7 : 90 01 __ BCC $41ea ; (read2KChunk.s47 + 0)
.s46:
41e9 : e8 __ __ INX
.s47:
41ea : 98 __ __ TYA
41eb : 38 __ __ SEC
41ec : e5 47 __ SBC T7 + 0 
41ee : 85 29 __ STA ACCU + 0 
41f0 : 8a __ __ TXA
41f1 : 49 ff __ EOR #$ff
41f3 : e5 48 __ SBC T7 + 1 
41f5 : 85 2a __ STA ACCU + 1 
41f7 : a5 43 __ LDA T4 + 1 
41f9 : 20 47 45 JSR $4547 ; (mul16by8 + 0)
41fc : 18 __ __ CLC
41fd : a5 2a __ LDA ACCU + 1 
41ff : 65 47 __ ADC T7 + 0 
4201 : 49 80 __ EOR #$80
4203 : 8d 07 d7 STA $d707 
4206 : ad ed 4c LDA $4ced ; (itersFixed + 0)
4209 : 18 __ __ CLC
420a : 6d c3 4d ADC $4dc3 ; (chan0Fixed + 0)
420d : 8d c3 4d STA $4dc3 ; (chan0Fixed + 0)
4210 : ad ee 4c LDA $4cee ; (itersFixed + 1)
4213 : 65 43 __ ADC T4 + 1 
4215 : 8d c4 4d STA $4dc4 ; (chan0Fixed + 1)
4218 : ad ef 4c LDA $4cef ; (itersFixed + 2)
421b : 6d c5 4d ADC $4dc5 ; (chan0Fixed + 2)
421e : 8d c5 4d STA $4dc5 ; (chan0Fixed + 2)
4221 : ad f0 4c LDA $4cf0 ; (itersFixed + 3)
4224 : 6d c6 4d ADC $4dc6 ; (chan0Fixed + 3)
4227 : 8d c6 4d STA $4dc6 ; (chan0Fixed + 3)
422a : e6 45 __ INC T6 + 0 
422c : d0 02 __ BNE $4230 ; (read2KChunk.s49 + 0)
.s48:
422e : e6 46 __ INC T6 + 1 
.s49:
4230 : a5 46 __ LDA T6 + 1 
4232 : c5 41 __ CMP T3 + 1 
4234 : b0 03 __ BCS $4239 ; (read2KChunk.s50 + 0)
4236 : 4c 5a 41 JMP $415a ; (read2KChunk.l13 + 0)
.s50:
4239 : f0 03 __ BEQ $423e ; (read2KChunk.s15 + 0)
423b : 4c 49 41 JMP $4149 ; (read2KChunk.s11 + 0)
.s15:
423e : a5 45 __ LDA T6 + 0 
4240 : c5 40 __ CMP T3 + 0 
4242 : 90 f2 __ BCC $4236 ; (read2KChunk.s49 + 6)
4244 : 4c 49 41 JMP $4149 ; (read2KChunk.s11 + 0)
.l24:
4247 : ad 04 d7 LDA $d704 
424a : 85 35 __ STA T0 + 0 
424c : ad 05 d7 LDA $d705 
424f : 29 07 __ AND #$07
4251 : 85 36 __ STA T0 + 1 
4253 : 38 __ __ SEC
4254 : a9 00 __ LDA #$00
4256 : e5 35 __ SBC T0 + 0 
4258 : a8 __ __ TAY
4259 : a9 08 __ LDA #$08
425b : e5 36 __ SBC T0 + 1 
425d : d0 04 __ BNE $4263 ; (read2KChunk.s25 + 0)
.s34:
425f : c0 20 __ CPY #$20
4261 : 90 e4 __ BCC $4247 ; (read2KChunk.l24 + 0)
.s25:
4263 : a5 1f __ LDA P4 ; (index + 0)
4265 : 0a __ __ ASL
4266 : 0a __ __ ASL
4267 : 85 44 __ STA T5 + 0 
4269 : a9 20 __ LDA #$20
426b : 85 49 __ STA T8 + 0 
.l26:
426d : ad c4 4d LDA $4dc4 ; (chan0Fixed + 1)
4270 : 85 41 __ STA T3 + 1 
4272 : a4 44 __ LDY T5 + 0 
4274 : b9 00 50 LDA $5000,y ; (instAddr[0] + 0)
4277 : 18 __ __ CLC
4278 : 6d c5 4d ADC $4dc5 ; (chan0Fixed + 2)
427b : 85 1b __ STA P0 
427d : b9 01 50 LDA $5001,y ; (instAddr[0] + 1)
4280 : 6d c6 4d ADC $4dc6 ; (chan0Fixed + 3)
4283 : 85 1c __ STA P1 
4285 : b9 02 50 LDA $5002,y ; (instAddr[0] + 2)
4288 : 69 00 __ ADC #$00
428a : aa __ __ TAX
428b : b9 03 50 LDA $5003,y ; (instAddr[0] + 3)
428e : 69 00 __ ADC #$00
4290 : a8 __ __ TAY
4291 : 8a __ __ TXA
4292 : 18 __ __ CLC
4293 : 69 01 __ ADC #$01
4295 : 85 1d __ STA P2 
4297 : 98 __ __ TYA
4298 : 69 00 __ ADC #$00
429a : 85 1e __ STA P3 
429c : 18 __ __ CLC
429d : a5 1b __ LDA P0 
429f : 69 01 __ ADC #$01
42a1 : 85 39 __ STA T1 + 0 
42a3 : a5 1c __ LDA P1 
42a5 : 69 00 __ ADC #$00
42a7 : 85 3a __ STA T1 + 1 
42a9 : 8a __ __ TXA
42aa : 69 00 __ ADC #$00
42ac : 85 3b __ STA T1 + 2 
42ae : 98 __ __ TYA
42af : 69 00 __ ADC #$00
42b1 : d0 14 __ BNE $42c7 ; (read2KChunk.s29 + 0)
.s30:
42b3 : 85 3c __ STA T1 + 3 
42b5 : a5 3b __ LDA T1 + 2 
42b7 : c5 3f __ CMP T2 + 2 
42b9 : d0 0a __ BNE $42c5 ; (read2KChunk.s33 + 0)
.s31:
42bb : a5 3a __ LDA T1 + 1 
42bd : c5 3e __ CMP T2 + 1 
42bf : d0 04 __ BNE $42c5 ; (read2KChunk.s33 + 0)
.s32:
42c1 : a5 39 __ LDA T1 + 0 
42c3 : c5 3d __ CMP T2 + 0 
.s33:
42c5 : 90 0a __ BCC $42d1 ; (read2KChunk.s27 + 0)
.s29:
42c7 : 86 3b __ STX T1 + 2 
42c9 : 84 3c __ STY T1 + 3 
42cb : c6 39 __ DEC T1 + 0 
42cd : a5 1c __ LDA P1 
42cf : 85 3a __ STA T1 + 1 
.s27:
42d1 : 20 76 1f JSR $1f76 ; (FAR_PEEK.s4 + 0)
42d4 : 85 45 __ STA T6 + 0 
42d6 : 29 80 __ AND #$80
42d8 : 10 02 __ BPL $42dc ; (read2KChunk.s27 + 11)
42da : a9 ff __ LDA #$ff
42dc : 85 46 __ STA T6 + 1 
42de : 18 __ __ CLC
42df : a5 3b __ LDA T1 + 2 
42e1 : 69 01 __ ADC #$01
42e3 : 85 1d __ STA P2 
42e5 : a5 3c __ LDA T1 + 3 
42e7 : 69 00 __ ADC #$00
42e9 : 85 1e __ STA P3 
42eb : a5 39 __ LDA T1 + 0 
42ed : 85 1b __ STA P0 
42ef : a5 3a __ LDA T1 + 1 
42f1 : 85 1c __ STA P1 
42f3 : 20 76 1f JSR $1f76 ; (FAR_PEEK.s4 + 0)
42f6 : a8 __ __ TAY
42f7 : 0a __ __ ASL
42f8 : a2 ff __ LDX #$ff
42fa : 90 01 __ BCC $42fd ; (read2KChunk.s45 + 0)
.s44:
42fc : e8 __ __ INX
.s45:
42fd : 98 __ __ TYA
42fe : 38 __ __ SEC
42ff : e5 45 __ SBC T6 + 0 
4301 : 85 29 __ STA ACCU + 0 
4303 : 8a __ __ TXA
4304 : 49 ff __ EOR #$ff
4306 : e5 46 __ SBC T6 + 1 
4308 : 85 2a __ STA ACCU + 1 
430a : a5 41 __ LDA T3 + 1 
430c : 20 47 45 JSR $4547 ; (mul16by8 + 0)
430f : 18 __ __ CLC
4310 : a5 2a __ LDA ACCU + 1 
4312 : 65 45 __ ADC T6 + 0 
4314 : 49 80 __ EOR #$80
4316 : 8d 07 d7 STA $d707 
4319 : ad ed 4c LDA $4ced ; (itersFixed + 0)
431c : 18 __ __ CLC
431d : 6d c3 4d ADC $4dc3 ; (chan0Fixed + 0)
4320 : 8d c3 4d STA $4dc3 ; (chan0Fixed + 0)
4323 : ad ee 4c LDA $4cee ; (itersFixed + 1)
4326 : 65 41 __ ADC T3 + 1 
4328 : 8d c4 4d STA $4dc4 ; (chan0Fixed + 1)
432b : ad ef 4c LDA $4cef ; (itersFixed + 2)
432e : 6d c5 4d ADC $4dc5 ; (chan0Fixed + 2)
4331 : 8d c5 4d STA $4dc5 ; (chan0Fixed + 2)
4334 : ad f0 4c LDA $4cf0 ; (itersFixed + 3)
4337 : 6d c6 4d ADC $4dc6 ; (chan0Fixed + 3)
433a : 8d c6 4d STA $4dc6 ; (chan0Fixed + 3)
433d : c6 49 __ DEC T8 + 0 
433f : f0 03 __ BEQ $4344 ; (read2KChunk.s28 + 0)
4341 : 4c 6d 42 JMP $426d ; (read2KChunk.l26 + 0)
.s28:
4344 : e6 47 __ INC T7 + 0 
4346 : a5 47 __ LDA T7 + 0 
4348 : c9 40 __ CMP #$40
434a : 90 01 __ BCC $434d ; (read2KChunk.s38 + 0)
434c : 60 __ __ RTS
.s38:
434d : a5 3f __ LDA T2 + 2 
434f : f0 03 __ BEQ $4354 ; (read2KChunk.s38 + 7)
4351 : 4c df 40 JMP $40df ; (read2KChunk.l7 + 0)
4354 : 4c d1 40 JMP $40d1 ; (read2KChunk.s39 + 0)
--------------------------------------------------------------------
kernelNextEvent: ; kernelNextEvent()->u8
;  66, "/mnt/d/F256/f256lib-oscar64/f256lib/f_kernel.h"
.s4:
4357 : a9 00 __ LDA #$00
4359 : 8d c0 4d STA $4dc0 ; (_kern_target + 0)
435c : 8d f3 4c STA $4cf3 ; (kernelEventData.type + 0)
435f : a9 ff __ LDA #$ff
4361 : 8d c1 4d STA $4dc1 ; (_kern_target + 1)
4364 : 4c 67 43 JMP $4367 ; (_kernelCallWrapper.s4 + 0)
--------------------------------------------------------------------
_kernelCallWrapper: ; _kernelCallWrapper()->u8
;  56, "/mnt/d/F256/f256lib-oscar64/f256lib/f_kernel.h"
.s4:
4367 : 20 6f 43 JSR $436f ; (_kernelCallRaw + 0)
436a : 85 29 __ STA ACCU + 0 
.s3:
436c : a5 29 __ LDA ACCU + 0 
436e : 60 __ __ RTS
--------------------------------------------------------------------
_kernelCallRaw: ; _kernelCallRaw
436f : ad c0 4d LDA $4dc0 ; (_kern_target + 0)
4372 : 8d 7c 43 STA $437c ; (_kernelCallRaw + 13)
4375 : ad c1 4d LDA $4dc1 ; (_kern_target + 1)
4378 : 8d 7d 43 STA $437d ; (_kernelCallRaw + 14)
437b : 20 00 00 JSR $0000 
437e : aa __ __ TAX
437f : a9 00 __ LDA #$00
4381 : 6a __ __ ROR
4382 : 8d c2 4d STA $4dc2 ; (_kernelError + 0)
4385 : 8a __ __ TXA
4386 : 60 __ __ RTS
--------------------------------------------------------------------
4387 : __ __ __ BYT 0a 61 73 72 20 25 66 20 61 64 64 72 20 25 30 38 : .asr %f addr %08
4397 : __ __ __ BYT 6c 78 20 69 74 65 72 73 46 20 25 30 38 6c 78 00 : lx itersF %08lx.
--------------------------------------------------------------------
43a7 : __ __ __ BYT 20 64 6f 6e 65 20 77 69 74 68 20 6c 6f 6f 70 2e :  done with loop.
43b7 : __ __ __ BYT 20 00                                           :  .
--------------------------------------------------------------------
43b9 : __ __ __ BYT 50 6c 61 79 69 6e 67 3a 20 25 2e 37 31 73 00    : Playing: %.71s.
--------------------------------------------------------------------
textUI: ; textUI()->void
;  12, "/mnt/d/F256/f256lib-oscar64/doodles/modplayer/src/textUI.h"
.s4:
43c8 : a9 00 __ LDA #$00
43ca : 85 1b __ STA P0 
43cc : a9 30 __ LDA #$30
43ce : 85 1c __ STA P1 
43d0 : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
43d3 : a9 07 __ LDA #$07
43d5 : 85 1b __ STA P0 
43d7 : a9 06 __ LDA #$06
43d9 : 85 1c __ STA P1 
43db : 20 3b 0c JSR $0c3b ; (textSetColor.s4 + 0)
43de : a9 c3 __ LDA #$c3
43e0 : 8d df 9f STA $9fdf ; (sstack + 8)
43e3 : a9 44 __ LDA #$44
43e5 : 8d e0 9f STA $9fe0 ; (sstack + 9)
43e8 : 20 48 0c JSR $0c48 ; (printf.s4 + 0)
43eb : a9 0f __ LDA #$0f
43ed : 85 1b __ STA P0 
43ef : a9 00 __ LDA #$00
43f1 : 85 1c __ STA P1 
43f3 : 20 3b 0c JSR $0c3b ; (textSetColor.s4 + 0)
43f6 : a9 c9 __ LDA #$c9
43f8 : 8d df 9f STA $9fdf ; (sstack + 8)
43fb : a9 44 __ LDA #$44
43fd : 8d e0 9f STA $9fe0 ; (sstack + 9)
4400 : 20 48 0c JSR $0c48 ; (printf.s4 + 0)
4403 : a9 07 __ LDA #$07
4405 : 85 1b __ STA P0 
4407 : a9 06 __ LDA #$06
4409 : 85 1c __ STA P1 
440b : 20 3b 0c JSR $0c3b ; (textSetColor.s4 + 0)
440e : a9 d0 __ LDA #$d0
4410 : 8d df 9f STA $9fdf ; (sstack + 8)
4413 : a9 44 __ LDA #$44
4415 : 8d e0 9f STA $9fe0 ; (sstack + 9)
4418 : 20 48 0c JSR $0c48 ; (printf.s4 + 0)
441b : a9 0f __ LDA #$0f
441d : 85 1b __ STA P0 
441f : a9 00 __ LDA #$00
4421 : 85 1c __ STA P1 
4423 : 20 3b 0c JSR $0c3b ; (textSetColor.s4 + 0)
4426 : a9 d6 __ LDA #$d6
4428 : 8d df 9f STA $9fdf ; (sstack + 8)
442b : a9 44 __ LDA #$44
442d : 8d e0 9f STA $9fe0 ; (sstack + 9)
4430 : 20 48 0c JSR $0c48 ; (printf.s4 + 0)
4433 : a9 07 __ LDA #$07
4435 : 85 1b __ STA P0 
4437 : a9 06 __ LDA #$06
4439 : 85 1c __ STA P1 
443b : 20 3b 0c JSR $0c3b ; (textSetColor.s4 + 0)
443e : a9 dd __ LDA #$dd
4440 : 8d df 9f STA $9fdf ; (sstack + 8)
4443 : a9 44 __ LDA #$44
4445 : 8d e0 9f STA $9fe0 ; (sstack + 9)
4448 : 20 48 0c JSR $0c48 ; (printf.s4 + 0)
444b : a9 0f __ LDA #$0f
444d : 85 1b __ STA P0 
444f : a9 00 __ LDA #$00
4451 : 85 1c __ STA P1 
4453 : 20 3b 0c JSR $0c3b ; (textSetColor.s4 + 0)
4456 : a9 e2 __ LDA #$e2
4458 : 8d df 9f STA $9fdf ; (sstack + 8)
445b : a9 44 __ LDA #$44
445d : 8d e0 9f STA $9fe0 ; (sstack + 9)
4460 : 20 48 0c JSR $0c48 ; (printf.s4 + 0)
4463 : a9 07 __ LDA #$07
4465 : 85 1b __ STA P0 
4467 : a9 06 __ LDA #$06
4469 : 85 1c __ STA P1 
446b : 20 3b 0c JSR $0c3b ; (textSetColor.s4 + 0)
446e : a9 e9 __ LDA #$e9
4470 : 8d df 9f STA $9fdf ; (sstack + 8)
4473 : a9 44 __ LDA #$44
4475 : 8d e0 9f STA $9fe0 ; (sstack + 9)
4478 : 20 48 0c JSR $0c48 ; (printf.s4 + 0)
447b : a9 0f __ LDA #$0f
447d : 85 1b __ STA P0 
447f : a9 00 __ LDA #$00
4481 : 85 1c __ STA P1 
4483 : 20 3b 0c JSR $0c3b ; (textSetColor.s4 + 0)
4486 : a9 ee __ LDA #$ee
4488 : 8d df 9f STA $9fdf ; (sstack + 8)
448b : a9 44 __ LDA #$44
448d : 8d e0 9f STA $9fe0 ; (sstack + 9)
4490 : 20 48 0c JSR $0c48 ; (printf.s4 + 0)
4493 : a9 07 __ LDA #$07
4495 : 85 1b __ STA P0 
4497 : a9 06 __ LDA #$06
4499 : 85 1c __ STA P1 
449b : 20 3b 0c JSR $0c3b ; (textSetColor.s4 + 0)
449e : a9 f5 __ LDA #$f5
44a0 : 8d df 9f STA $9fdf ; (sstack + 8)
44a3 : a9 44 __ LDA #$44
44a5 : 8d e0 9f STA $9fe0 ; (sstack + 9)
44a8 : 20 48 0c JSR $0c48 ; (printf.s4 + 0)
44ab : a9 0f __ LDA #$0f
44ad : 85 1b __ STA P0 
44af : a9 00 __ LDA #$00
44b1 : 85 1c __ STA P1 
44b3 : 20 3b 0c JSR $0c3b ; (textSetColor.s4 + 0)
44b6 : a9 00 __ LDA #$00
44b8 : 8d df 9f STA $9fdf ; (sstack + 8)
44bb : a9 45 __ LDA #$45
44bd : 8d e0 9f STA $9fe0 ; (sstack + 9)
44c0 : 4c 48 0c JMP $0c48 ; (printf.s4 + 0)
--------------------------------------------------------------------
44c3 : __ __ __ BYT 5b 45 53 43 5d 00                               : [ESC].
--------------------------------------------------------------------
44c9 : __ __ __ BYT 20 51 75 69 74 20 00                            :  Quit .
--------------------------------------------------------------------
44d0 : __ __ __ BYT 5b 54 61 62 5d 00                               : [Tab].
--------------------------------------------------------------------
44d6 : __ __ __ BYT 20 53 6b 69 70 20 00                            :  Skip .
--------------------------------------------------------------------
44dd : __ __ __ BYT 5b 46 33 5d 00                                  : [F3].
--------------------------------------------------------------------
44e2 : __ __ __ BYT 20 4c 6f 61 64 20 00                            :  Load .
--------------------------------------------------------------------
44e9 : __ __ __ BYT 5b 46 37 5d 00                                  : [F7].
--------------------------------------------------------------------
44ee : __ __ __ BYT 20 49 6e 66 6f 20 00                            :  Info .
--------------------------------------------------------------------
44f5 : __ __ __ BYT 5b 53 70 61 63 65 5d 00                         : [Space].
--------------------------------------------------------------------
_ccolor:
44fd : __ __ __ BYT f0                                              : .
--------------------------------------------------------------------
_MAX_COL:
44fe : __ __ __ BYT 50                                              : P
--------------------------------------------------------------------
_MAX_ROW:
44ff : __ __ __ BYT 1e                                              : .
--------------------------------------------------------------------
4500 : __ __ __ BYT 20 53 6e 6f 6f 70 21 00                         :  Snoop!.
--------------------------------------------------------------------
vs1053bBoostClock: ; vs1053bBoostClock()->void
;  13, "/mnt/d/F256/f256lib-oscar64/f256lib/f_vs1053b.h"
.s4:
4508 : a9 03 __ LDA #$03
450a : 8d 01 d7 STA $d701 
450d : a9 00 __ LDA #$00
450f : 8d 02 d7 STA $d702 
4512 : 8d 02 d7 STA $d702 
4515 : a9 c0 __ LDA #$c0
4517 : 8d 03 d7 STA $d703 
451a : a9 01 __ LDA #$01
451c : 8d 00 d7 STA $d700 
451f : a9 00 __ LDA #$00
4521 : 8d 00 d7 STA $d700 
.l5:
4524 : 2c 00 d7 BIT $d700 
4527 : 30 fb __ BMI $4524 ; (vs1053bBoostClock.l5 + 0)
.s3:
4529 : 60 __ __ RTS
--------------------------------------------------------------------
f256Reset: ; f256Reset()->void
; 212, "/mnt/d/F256/f256lib-oscar64/f256lib/f256lib.h"
.s4:
452a : 78 __ __ SEI
452b : a9 07 __ LDA #$07
452d : 85 0f __ STA $0f 
452f : a9 de __ LDA #$de
4531 : 8d a2 d6 STA $d6a2 
4534 : a9 ad __ LDA #$ad
4536 : 8d a3 d6 STA $d6a3 
4539 : a9 f0 __ LDA #$f0
453b : 8d a0 d6 STA $d6a0 
453e : a9 00 __ LDA #$00
4540 : 8d a0 d6 STA $d6a0 
4543 : 6c fc ff JMP ($fffc)
.s3:
4546 : 60 __ __ RTS
--------------------------------------------------------------------
mul16by8: ; mul16by8
4547 : 4a __ __ LSR
4548 : f0 2e __ BEQ $4578 ; (mul16by8 + 49)
454a : a2 00 __ LDX #$00
454c : a0 00 __ LDY #$00
454e : 90 13 __ BCC $4563 ; (mul16by8 + 28)
4550 : a4 29 __ LDY ACCU + 0 
4552 : a6 2a __ LDX ACCU + 1 
4554 : b0 0d __ BCS $4563 ; (mul16by8 + 28)
4556 : 85 10 __ STA $10 
4558 : 18 __ __ CLC
4559 : 98 __ __ TYA
455a : 65 29 __ ADC ACCU + 0 
455c : a8 __ __ TAY
455d : 8a __ __ TXA
455e : 65 2a __ ADC ACCU + 1 
4560 : aa __ __ TAX
4561 : a5 10 __ LDA $10 
4563 : 06 29 __ ASL ACCU + 0 
4565 : 26 2a __ ROL ACCU + 1 
4567 : 4a __ __ LSR
4568 : 90 f9 __ BCC $4563 ; (mul16by8 + 28)
456a : d0 ea __ BNE $4556 ; (mul16by8 + 15)
456c : 18 __ __ CLC
456d : 98 __ __ TYA
456e : 65 29 __ ADC ACCU + 0 
4570 : 85 29 __ STA ACCU + 0 
4572 : 8a __ __ TXA
4573 : 65 2a __ ADC ACCU + 1 
4575 : 85 2a __ STA ACCU + 1 
4577 : 60 __ __ RTS
4578 : b0 04 __ BCS $457e ; (mul16by8 + 55)
457a : 85 29 __ STA ACCU + 0 
457c : 85 2a __ STA ACCU + 1 
457e : 60 __ __ RTS
--------------------------------------------------------------------
freg: ; freg
457f : b1 27 __ LDA (IP + 0),y 
4581 : c8 __ __ INY
4582 : aa __ __ TAX
4583 : b5 00 __ LDA $00,x 
4585 : 85 11 __ STA WORK + 0 
4587 : b5 01 __ LDA $01,x 
4589 : 85 12 __ STA WORK + 1 
458b : b5 02 __ LDA $02,x 
458d : 85 13 __ STA WORK + 2 
458f : b5 03 __ LDA $03,x 
4591 : 85 14 __ STA WORK + 3 
4593 : a5 13 __ LDA WORK + 2 
4595 : 0a __ __ ASL
4596 : a5 14 __ LDA WORK + 3 
4598 : 2a __ __ ROL
4599 : 85 16 __ STA WORK + 5 
459b : f0 06 __ BEQ $45a3 ; (freg + 36)
459d : a5 13 __ LDA WORK + 2 
459f : 09 80 __ ORA #$80
45a1 : 85 13 __ STA WORK + 2 
45a3 : a5 2b __ LDA ACCU + 2 
45a5 : 0a __ __ ASL
45a6 : a5 2c __ LDA ACCU + 3 
45a8 : 2a __ __ ROL
45a9 : 85 15 __ STA WORK + 4 
45ab : f0 06 __ BEQ $45b3 ; (freg + 52)
45ad : a5 2b __ LDA ACCU + 2 
45af : 09 80 __ ORA #$80
45b1 : 85 2b __ STA ACCU + 2 
45b3 : 60 __ __ RTS
45b4 : 06 2c __ ASL ACCU + 3 
45b6 : a5 15 __ LDA WORK + 4 
45b8 : 6a __ __ ROR
45b9 : 85 2c __ STA ACCU + 3 
45bb : b0 06 __ BCS $45c3 ; (freg + 68)
45bd : a5 2b __ LDA ACCU + 2 
45bf : 29 7f __ AND #$7f
45c1 : 85 2b __ STA ACCU + 2 
45c3 : 60 __ __ RTS
--------------------------------------------------------------------
faddsub: ; faddsub
45c4 : a5 14 __ LDA WORK + 3 
45c6 : 49 80 __ EOR #$80
45c8 : 85 14 __ STA WORK + 3 
45ca : a9 ff __ LDA #$ff
45cc : c5 15 __ CMP WORK + 4 
45ce : f0 04 __ BEQ $45d4 ; (faddsub + 16)
45d0 : c5 16 __ CMP WORK + 5 
45d2 : d0 11 __ BNE $45e5 ; (faddsub + 33)
45d4 : a5 2c __ LDA ACCU + 3 
45d6 : 09 7f __ ORA #$7f
45d8 : 85 2c __ STA ACCU + 3 
45da : a9 80 __ LDA #$80
45dc : 85 2b __ STA ACCU + 2 
45de : a9 00 __ LDA #$00
45e0 : 85 29 __ STA ACCU + 0 
45e2 : 85 2a __ STA ACCU + 1 
45e4 : 60 __ __ RTS
45e5 : 38 __ __ SEC
45e6 : a5 15 __ LDA WORK + 4 
45e8 : e5 16 __ SBC WORK + 5 
45ea : f0 38 __ BEQ $4624 ; (faddsub + 96)
45ec : aa __ __ TAX
45ed : b0 25 __ BCS $4614 ; (faddsub + 80)
45ef : e0 e9 __ CPX #$e9
45f1 : b0 0e __ BCS $4601 ; (faddsub + 61)
45f3 : a5 16 __ LDA WORK + 5 
45f5 : 85 15 __ STA WORK + 4 
45f7 : a9 00 __ LDA #$00
45f9 : 85 29 __ STA ACCU + 0 
45fb : 85 2a __ STA ACCU + 1 
45fd : 85 2b __ STA ACCU + 2 
45ff : f0 23 __ BEQ $4624 ; (faddsub + 96)
4601 : a5 2b __ LDA ACCU + 2 
4603 : 4a __ __ LSR
4604 : 66 2a __ ROR ACCU + 1 
4606 : 66 29 __ ROR ACCU + 0 
4608 : e8 __ __ INX
4609 : d0 f8 __ BNE $4603 ; (faddsub + 63)
460b : 85 2b __ STA ACCU + 2 
460d : a5 16 __ LDA WORK + 5 
460f : 85 15 __ STA WORK + 4 
4611 : 4c 24 46 JMP $4624 ; (faddsub + 96)
4614 : e0 18 __ CPX #$18
4616 : b0 33 __ BCS $464b ; (faddsub + 135)
4618 : a5 13 __ LDA WORK + 2 
461a : 4a __ __ LSR
461b : 66 12 __ ROR WORK + 1 
461d : 66 11 __ ROR WORK + 0 
461f : ca __ __ DEX
4620 : d0 f8 __ BNE $461a ; (faddsub + 86)
4622 : 85 13 __ STA WORK + 2 
4624 : a5 2c __ LDA ACCU + 3 
4626 : 29 80 __ AND #$80
4628 : 85 2c __ STA ACCU + 3 
462a : 45 14 __ EOR WORK + 3 
462c : 30 31 __ BMI $465f ; (faddsub + 155)
462e : 18 __ __ CLC
462f : a5 29 __ LDA ACCU + 0 
4631 : 65 11 __ ADC WORK + 0 
4633 : 85 29 __ STA ACCU + 0 
4635 : a5 2a __ LDA ACCU + 1 
4637 : 65 12 __ ADC WORK + 1 
4639 : 85 2a __ STA ACCU + 1 
463b : a5 2b __ LDA ACCU + 2 
463d : 65 13 __ ADC WORK + 2 
463f : 85 2b __ STA ACCU + 2 
4641 : 90 08 __ BCC $464b ; (faddsub + 135)
4643 : 66 2b __ ROR ACCU + 2 
4645 : 66 2a __ ROR ACCU + 1 
4647 : 66 29 __ ROR ACCU + 0 
4649 : e6 15 __ INC WORK + 4 
464b : a5 15 __ LDA WORK + 4 
464d : c9 ff __ CMP #$ff
464f : f0 83 __ BEQ $45d4 ; (faddsub + 16)
4651 : 4a __ __ LSR
4652 : 05 2c __ ORA ACCU + 3 
4654 : 85 2c __ STA ACCU + 3 
4656 : b0 06 __ BCS $465e ; (faddsub + 154)
4658 : a5 2b __ LDA ACCU + 2 
465a : 29 7f __ AND #$7f
465c : 85 2b __ STA ACCU + 2 
465e : 60 __ __ RTS
465f : 38 __ __ SEC
4660 : a5 29 __ LDA ACCU + 0 
4662 : e5 11 __ SBC WORK + 0 
4664 : 85 29 __ STA ACCU + 0 
4666 : a5 2a __ LDA ACCU + 1 
4668 : e5 12 __ SBC WORK + 1 
466a : 85 2a __ STA ACCU + 1 
466c : a5 2b __ LDA ACCU + 2 
466e : e5 13 __ SBC WORK + 2 
4670 : 85 2b __ STA ACCU + 2 
4672 : b0 19 __ BCS $468d ; (faddsub + 201)
4674 : 38 __ __ SEC
4675 : a9 00 __ LDA #$00
4677 : e5 29 __ SBC ACCU + 0 
4679 : 85 29 __ STA ACCU + 0 
467b : a9 00 __ LDA #$00
467d : e5 2a __ SBC ACCU + 1 
467f : 85 2a __ STA ACCU + 1 
4681 : a9 00 __ LDA #$00
4683 : e5 2b __ SBC ACCU + 2 
4685 : 85 2b __ STA ACCU + 2 
4687 : a5 2c __ LDA ACCU + 3 
4689 : 49 80 __ EOR #$80
468b : 85 2c __ STA ACCU + 3 
468d : a5 2b __ LDA ACCU + 2 
468f : 30 ba __ BMI $464b ; (faddsub + 135)
4691 : 05 2a __ ORA ACCU + 1 
4693 : 05 29 __ ORA ACCU + 0 
4695 : f0 0f __ BEQ $46a6 ; (faddsub + 226)
4697 : c6 15 __ DEC WORK + 4 
4699 : f0 0b __ BEQ $46a6 ; (faddsub + 226)
469b : 06 29 __ ASL ACCU + 0 
469d : 26 2a __ ROL ACCU + 1 
469f : 26 2b __ ROL ACCU + 2 
46a1 : 10 f4 __ BPL $4697 ; (faddsub + 211)
46a3 : 4c 4b 46 JMP $464b ; (faddsub + 135)
46a6 : a9 00 __ LDA #$00
46a8 : 85 29 __ STA ACCU + 0 
46aa : 85 2a __ STA ACCU + 1 
46ac : 85 2b __ STA ACCU + 2 
46ae : 85 2c __ STA ACCU + 3 
46b0 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul: ; crt_fmul
46b1 : a5 29 __ LDA ACCU + 0 
46b3 : 05 2a __ ORA ACCU + 1 
46b5 : 05 2b __ ORA ACCU + 2 
46b7 : f0 0e __ BEQ $46c7 ; (crt_fmul + 22)
46b9 : a5 11 __ LDA WORK + 0 
46bb : 05 12 __ ORA WORK + 1 
46bd : 05 13 __ ORA WORK + 2 
46bf : d0 09 __ BNE $46ca ; (crt_fmul + 25)
46c1 : 85 29 __ STA ACCU + 0 
46c3 : 85 2a __ STA ACCU + 1 
46c5 : 85 2b __ STA ACCU + 2 
46c7 : 85 2c __ STA ACCU + 3 
46c9 : 60 __ __ RTS
46ca : a5 2c __ LDA ACCU + 3 
46cc : 45 14 __ EOR WORK + 3 
46ce : 29 80 __ AND #$80
46d0 : 85 2c __ STA ACCU + 3 
46d2 : a9 ff __ LDA #$ff
46d4 : c5 15 __ CMP WORK + 4 
46d6 : f0 42 __ BEQ $471a ; (crt_fmul + 105)
46d8 : c5 16 __ CMP WORK + 5 
46da : f0 3e __ BEQ $471a ; (crt_fmul + 105)
46dc : a9 00 __ LDA #$00
46de : 85 17 __ STA WORK + 6 
46e0 : 85 18 __ STA WORK + 7 
46e2 : 85 19 __ STA WORK + 8 
46e4 : a4 29 __ LDY ACCU + 0 
46e6 : a5 11 __ LDA WORK + 0 
46e8 : d0 06 __ BNE $46f0 ; (crt_fmul + 63)
46ea : a5 12 __ LDA WORK + 1 
46ec : f0 0a __ BEQ $46f8 ; (crt_fmul + 71)
46ee : d0 05 __ BNE $46f5 ; (crt_fmul + 68)
46f0 : 20 4b 47 JSR $474b ; (crt_fmul8 + 0)
46f3 : a5 12 __ LDA WORK + 1 
46f5 : 20 4b 47 JSR $474b ; (crt_fmul8 + 0)
46f8 : a5 13 __ LDA WORK + 2 
46fa : 20 4b 47 JSR $474b ; (crt_fmul8 + 0)
46fd : 38 __ __ SEC
46fe : a5 19 __ LDA WORK + 8 
4700 : 30 06 __ BMI $4708 ; (crt_fmul + 87)
4702 : 06 17 __ ASL WORK + 6 
4704 : 26 18 __ ROL WORK + 7 
4706 : 2a __ __ ROL
4707 : 18 __ __ CLC
4708 : 29 7f __ AND #$7f
470a : 85 19 __ STA WORK + 8 
470c : a5 15 __ LDA WORK + 4 
470e : 65 16 __ ADC WORK + 5 
4710 : 90 19 __ BCC $472b ; (crt_fmul + 122)
4712 : e9 7f __ SBC #$7f
4714 : b0 04 __ BCS $471a ; (crt_fmul + 105)
4716 : c9 ff __ CMP #$ff
4718 : d0 15 __ BNE $472f ; (crt_fmul + 126)
471a : a5 2c __ LDA ACCU + 3 
471c : 09 7f __ ORA #$7f
471e : 85 2c __ STA ACCU + 3 
4720 : a9 80 __ LDA #$80
4722 : 85 2b __ STA ACCU + 2 
4724 : a9 00 __ LDA #$00
4726 : 85 29 __ STA ACCU + 0 
4728 : 85 2a __ STA ACCU + 1 
472a : 60 __ __ RTS
472b : e9 7e __ SBC #$7e
472d : 90 15 __ BCC $4744 ; (crt_fmul + 147)
472f : 4a __ __ LSR
4730 : 05 2c __ ORA ACCU + 3 
4732 : 85 2c __ STA ACCU + 3 
4734 : a9 00 __ LDA #$00
4736 : 6a __ __ ROR
4737 : 05 19 __ ORA WORK + 8 
4739 : 85 2b __ STA ACCU + 2 
473b : a5 18 __ LDA WORK + 7 
473d : 85 2a __ STA ACCU + 1 
473f : a5 17 __ LDA WORK + 6 
4741 : 85 29 __ STA ACCU + 0 
4743 : 60 __ __ RTS
4744 : a9 00 __ LDA #$00
4746 : 85 2c __ STA ACCU + 3 
4748 : f0 d8 __ BEQ $4722 ; (crt_fmul + 113)
474a : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul8: ; crt_fmul8
474b : 38 __ __ SEC
474c : 6a __ __ ROR
474d : 90 1e __ BCC $476d ; (crt_fmul8 + 34)
474f : aa __ __ TAX
4750 : 18 __ __ CLC
4751 : 98 __ __ TYA
4752 : 65 17 __ ADC WORK + 6 
4754 : 85 17 __ STA WORK + 6 
4756 : a5 18 __ LDA WORK + 7 
4758 : 65 2a __ ADC ACCU + 1 
475a : 85 18 __ STA WORK + 7 
475c : a5 19 __ LDA WORK + 8 
475e : 65 2b __ ADC ACCU + 2 
4760 : 6a __ __ ROR
4761 : 85 19 __ STA WORK + 8 
4763 : 8a __ __ TXA
4764 : 66 18 __ ROR WORK + 7 
4766 : 66 17 __ ROR WORK + 6 
4768 : 4a __ __ LSR
4769 : f0 0d __ BEQ $4778 ; (crt_fmul8 + 45)
476b : b0 e2 __ BCS $474f ; (crt_fmul8 + 4)
476d : 66 19 __ ROR WORK + 8 
476f : 66 18 __ ROR WORK + 7 
4771 : 66 17 __ ROR WORK + 6 
4773 : 4a __ __ LSR
4774 : 90 f7 __ BCC $476d ; (crt_fmul8 + 34)
4776 : d0 d7 __ BNE $474f ; (crt_fmul8 + 4)
4778 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fdiv: ; crt_fdiv
4779 : a5 29 __ LDA ACCU + 0 
477b : 05 2a __ ORA ACCU + 1 
477d : 05 2b __ ORA ACCU + 2 
477f : d0 03 __ BNE $4784 ; (crt_fdiv + 11)
4781 : 85 2c __ STA ACCU + 3 
4783 : 60 __ __ RTS
4784 : a5 2c __ LDA ACCU + 3 
4786 : 45 14 __ EOR WORK + 3 
4788 : 29 80 __ AND #$80
478a : 85 2c __ STA ACCU + 3 
478c : a5 16 __ LDA WORK + 5 
478e : f0 62 __ BEQ $47f2 ; (crt_fdiv + 121)
4790 : a5 15 __ LDA WORK + 4 
4792 : c9 ff __ CMP #$ff
4794 : f0 5c __ BEQ $47f2 ; (crt_fdiv + 121)
4796 : a9 00 __ LDA #$00
4798 : 85 17 __ STA WORK + 6 
479a : 85 18 __ STA WORK + 7 
479c : 85 19 __ STA WORK + 8 
479e : a2 18 __ LDX #$18
47a0 : a5 29 __ LDA ACCU + 0 
47a2 : c5 11 __ CMP WORK + 0 
47a4 : a5 2a __ LDA ACCU + 1 
47a6 : e5 12 __ SBC WORK + 1 
47a8 : a5 2b __ LDA ACCU + 2 
47aa : e5 13 __ SBC WORK + 2 
47ac : 90 13 __ BCC $47c1 ; (crt_fdiv + 72)
47ae : a5 29 __ LDA ACCU + 0 
47b0 : e5 11 __ SBC WORK + 0 
47b2 : 85 29 __ STA ACCU + 0 
47b4 : a5 2a __ LDA ACCU + 1 
47b6 : e5 12 __ SBC WORK + 1 
47b8 : 85 2a __ STA ACCU + 1 
47ba : a5 2b __ LDA ACCU + 2 
47bc : e5 13 __ SBC WORK + 2 
47be : 85 2b __ STA ACCU + 2 
47c0 : 38 __ __ SEC
47c1 : 26 17 __ ROL WORK + 6 
47c3 : 26 18 __ ROL WORK + 7 
47c5 : 26 19 __ ROL WORK + 8 
47c7 : ca __ __ DEX
47c8 : f0 0a __ BEQ $47d4 ; (crt_fdiv + 91)
47ca : 06 29 __ ASL ACCU + 0 
47cc : 26 2a __ ROL ACCU + 1 
47ce : 26 2b __ ROL ACCU + 2 
47d0 : b0 dc __ BCS $47ae ; (crt_fdiv + 53)
47d2 : 90 cc __ BCC $47a0 ; (crt_fdiv + 39)
47d4 : 38 __ __ SEC
47d5 : a5 19 __ LDA WORK + 8 
47d7 : 30 06 __ BMI $47df ; (crt_fdiv + 102)
47d9 : 06 17 __ ASL WORK + 6 
47db : 26 18 __ ROL WORK + 7 
47dd : 2a __ __ ROL
47de : 18 __ __ CLC
47df : 29 7f __ AND #$7f
47e1 : 85 19 __ STA WORK + 8 
47e3 : a5 15 __ LDA WORK + 4 
47e5 : e5 16 __ SBC WORK + 5 
47e7 : 90 1a __ BCC $4803 ; (crt_fdiv + 138)
47e9 : 18 __ __ CLC
47ea : 69 7f __ ADC #$7f
47ec : b0 04 __ BCS $47f2 ; (crt_fdiv + 121)
47ee : c9 ff __ CMP #$ff
47f0 : d0 15 __ BNE $4807 ; (crt_fdiv + 142)
47f2 : a5 2c __ LDA ACCU + 3 
47f4 : 09 7f __ ORA #$7f
47f6 : 85 2c __ STA ACCU + 3 
47f8 : a9 80 __ LDA #$80
47fa : 85 2b __ STA ACCU + 2 
47fc : a9 00 __ LDA #$00
47fe : 85 2a __ STA ACCU + 1 
4800 : 85 29 __ STA ACCU + 0 
4802 : 60 __ __ RTS
4803 : 69 7f __ ADC #$7f
4805 : 90 15 __ BCC $481c ; (crt_fdiv + 163)
4807 : 4a __ __ LSR
4808 : 05 2c __ ORA ACCU + 3 
480a : 85 2c __ STA ACCU + 3 
480c : a9 00 __ LDA #$00
480e : 6a __ __ ROR
480f : 05 19 __ ORA WORK + 8 
4811 : 85 2b __ STA ACCU + 2 
4813 : a5 18 __ LDA WORK + 7 
4815 : 85 2a __ STA ACCU + 1 
4817 : a5 17 __ LDA WORK + 6 
4819 : 85 29 __ STA ACCU + 0 
481b : 60 __ __ RTS
481c : a9 00 __ LDA #$00
481e : 85 2c __ STA ACCU + 3 
4820 : 85 2b __ STA ACCU + 2 
4822 : 85 2a __ STA ACCU + 1 
4824 : 85 29 __ STA ACCU + 0 
4826 : 60 __ __ RTS
--------------------------------------------------------------------
mul16: ; mul16
4827 : a0 00 __ LDY #$00
4829 : 84 14 __ STY WORK + 3 
482b : a5 11 __ LDA WORK + 0 
482d : a6 12 __ LDX WORK + 1 
482f : f0 1c __ BEQ $484d ; (mul16 + 38)
4831 : 38 __ __ SEC
4832 : 6a __ __ ROR
4833 : 90 0d __ BCC $4842 ; (mul16 + 27)
4835 : aa __ __ TAX
4836 : 18 __ __ CLC
4837 : 98 __ __ TYA
4838 : 65 29 __ ADC ACCU + 0 
483a : a8 __ __ TAY
483b : a5 14 __ LDA WORK + 3 
483d : 65 2a __ ADC ACCU + 1 
483f : 85 14 __ STA WORK + 3 
4841 : 8a __ __ TXA
4842 : 06 29 __ ASL ACCU + 0 
4844 : 26 2a __ ROL ACCU + 1 
4846 : 4a __ __ LSR
4847 : 90 f9 __ BCC $4842 ; (mul16 + 27)
4849 : d0 ea __ BNE $4835 ; (mul16 + 14)
484b : a5 12 __ LDA WORK + 1 
484d : 4a __ __ LSR
484e : 90 0d __ BCC $485d ; (mul16 + 54)
4850 : aa __ __ TAX
4851 : 18 __ __ CLC
4852 : 98 __ __ TYA
4853 : 65 29 __ ADC ACCU + 0 
4855 : a8 __ __ TAY
4856 : a5 14 __ LDA WORK + 3 
4858 : 65 2a __ ADC ACCU + 1 
485a : 85 14 __ STA WORK + 3 
485c : 8a __ __ TXA
485d : 06 29 __ ASL ACCU + 0 
485f : 26 2a __ ROL ACCU + 1 
4861 : 4a __ __ LSR
4862 : b0 ec __ BCS $4850 ; (mul16 + 41)
4864 : d0 f7 __ BNE $485d ; (mul16 + 54)
4866 : 84 13 __ STY WORK + 2 
4868 : 60 __ __ RTS
--------------------------------------------------------------------
divs16: ; divs16
4869 : 24 2a __ BIT ACCU + 1 
486b : 10 0d __ BPL $487a ; (divs16 + 17)
486d : 20 87 48 JSR $4887 ; (negaccu + 0)
4870 : 24 12 __ BIT WORK + 1 
4872 : 10 0d __ BPL $4881 ; (divs16 + 24)
4874 : 20 95 48 JSR $4895 ; (negtmp + 0)
4877 : 4c a3 48 JMP $48a3 ; (divmod + 0)
487a : 24 12 __ BIT WORK + 1 
487c : 10 f9 __ BPL $4877 ; (divs16 + 14)
487e : 20 95 48 JSR $4895 ; (negtmp + 0)
4881 : 20 a3 48 JSR $48a3 ; (divmod + 0)
4884 : 4c 87 48 JMP $4887 ; (negaccu + 0)
--------------------------------------------------------------------
negaccu: ; negaccu
4887 : 38 __ __ SEC
4888 : a9 00 __ LDA #$00
488a : e5 29 __ SBC ACCU + 0 
488c : 85 29 __ STA ACCU + 0 
488e : a9 00 __ LDA #$00
4890 : e5 2a __ SBC ACCU + 1 
4892 : 85 2a __ STA ACCU + 1 
4894 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp: ; negtmp
4895 : 38 __ __ SEC
4896 : a9 00 __ LDA #$00
4898 : e5 11 __ SBC WORK + 0 
489a : 85 11 __ STA WORK + 0 
489c : a9 00 __ LDA #$00
489e : e5 12 __ SBC WORK + 1 
48a0 : 85 12 __ STA WORK + 1 
48a2 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
48a3 : a5 2a __ LDA ACCU + 1 
48a5 : d0 31 __ BNE $48d8 ; (divmod + 53)
48a7 : a5 12 __ LDA WORK + 1 
48a9 : d0 1e __ BNE $48c9 ; (divmod + 38)
48ab : 85 14 __ STA WORK + 3 
48ad : a2 04 __ LDX #$04
48af : 06 29 __ ASL ACCU + 0 
48b1 : 2a __ __ ROL
48b2 : c5 11 __ CMP WORK + 0 
48b4 : 90 02 __ BCC $48b8 ; (divmod + 21)
48b6 : e5 11 __ SBC WORK + 0 
48b8 : 26 29 __ ROL ACCU + 0 
48ba : 2a __ __ ROL
48bb : c5 11 __ CMP WORK + 0 
48bd : 90 02 __ BCC $48c1 ; (divmod + 30)
48bf : e5 11 __ SBC WORK + 0 
48c1 : 26 29 __ ROL ACCU + 0 
48c3 : ca __ __ DEX
48c4 : d0 eb __ BNE $48b1 ; (divmod + 14)
48c6 : 85 13 __ STA WORK + 2 
48c8 : 60 __ __ RTS
48c9 : a5 29 __ LDA ACCU + 0 
48cb : 85 13 __ STA WORK + 2 
48cd : a5 2a __ LDA ACCU + 1 
48cf : 85 14 __ STA WORK + 3 
48d1 : a9 00 __ LDA #$00
48d3 : 85 29 __ STA ACCU + 0 
48d5 : 85 2a __ STA ACCU + 1 
48d7 : 60 __ __ RTS
48d8 : a5 12 __ LDA WORK + 1 
48da : d0 1f __ BNE $48fb ; (divmod + 88)
48dc : a5 11 __ LDA WORK + 0 
48de : 30 1b __ BMI $48fb ; (divmod + 88)
48e0 : a9 00 __ LDA #$00
48e2 : 85 14 __ STA WORK + 3 
48e4 : a2 10 __ LDX #$10
48e6 : 06 29 __ ASL ACCU + 0 
48e8 : 26 2a __ ROL ACCU + 1 
48ea : 2a __ __ ROL
48eb : c5 11 __ CMP WORK + 0 
48ed : 90 02 __ BCC $48f1 ; (divmod + 78)
48ef : e5 11 __ SBC WORK + 0 
48f1 : 26 29 __ ROL ACCU + 0 
48f3 : 26 2a __ ROL ACCU + 1 
48f5 : ca __ __ DEX
48f6 : d0 f2 __ BNE $48ea ; (divmod + 71)
48f8 : 85 13 __ STA WORK + 2 
48fa : 60 __ __ RTS
48fb : a9 00 __ LDA #$00
48fd : 85 13 __ STA WORK + 2 
48ff : 85 14 __ STA WORK + 3 
4901 : 84 10 __ STY $10 
4903 : a0 10 __ LDY #$10
4905 : 18 __ __ CLC
4906 : 26 29 __ ROL ACCU + 0 
4908 : 26 2a __ ROL ACCU + 1 
490a : 26 13 __ ROL WORK + 2 
490c : 26 14 __ ROL WORK + 3 
490e : 38 __ __ SEC
490f : a5 13 __ LDA WORK + 2 
4911 : e5 11 __ SBC WORK + 0 
4913 : aa __ __ TAX
4914 : a5 14 __ LDA WORK + 3 
4916 : e5 12 __ SBC WORK + 1 
4918 : 90 04 __ BCC $491e ; (divmod + 123)
491a : 86 13 __ STX WORK + 2 
491c : 85 14 __ STA WORK + 3 
491e : 88 __ __ DEY
491f : d0 e5 __ BNE $4906 ; (divmod + 99)
4921 : 26 29 __ ROL ACCU + 0 
4923 : 26 2a __ ROL ACCU + 1 
4925 : a4 10 __ LDY $10 
4927 : 60 __ __ RTS
--------------------------------------------------------------------
mods16: ; mods16
4928 : 24 2a __ BIT ACCU + 1 
492a : 10 10 __ BPL $493c ; (mods16 + 20)
492c : 20 87 48 JSR $4887 ; (negaccu + 0)
492f : 24 12 __ BIT WORK + 1 
4931 : 10 03 __ BPL $4936 ; (mods16 + 14)
4933 : 20 95 48 JSR $4895 ; (negtmp + 0)
4936 : 20 a3 48 JSR $48a3 ; (divmod + 0)
4939 : 4c 47 49 JMP $4947 ; (negtmpb + 0)
493c : 24 12 __ BIT WORK + 1 
493e : 10 03 __ BPL $4943 ; (mods16 + 27)
4940 : 20 95 48 JSR $4895 ; (negtmp + 0)
4943 : 4c a3 48 JMP $48a3 ; (divmod + 0)
4946 : 60 __ __ RTS
--------------------------------------------------------------------
negtmpb: ; negtmpb
4947 : 38 __ __ SEC
4948 : a9 00 __ LDA #$00
494a : e5 13 __ SBC WORK + 2 
494c : 85 13 __ STA WORK + 2 
494e : a9 00 __ LDA #$00
4950 : e5 14 __ SBC WORK + 3 
4952 : 85 14 __ STA WORK + 3 
4954 : 60 __ __ RTS
--------------------------------------------------------------------
f32_to_i16: ; f32_to_i16
4955 : 20 a3 45 JSR $45a3 ; (freg + 36)
4958 : a5 15 __ LDA WORK + 4 
495a : c9 7f __ CMP #$7f
495c : b0 07 __ BCS $4965 ; (f32_to_i16 + 16)
495e : a9 00 __ LDA #$00
4960 : 85 29 __ STA ACCU + 0 
4962 : 85 2a __ STA ACCU + 1 
4964 : 60 __ __ RTS
4965 : e9 8e __ SBC #$8e
4967 : 90 16 __ BCC $497f ; (f32_to_i16 + 42)
4969 : 24 2c __ BIT ACCU + 3 
496b : 30 09 __ BMI $4976 ; (f32_to_i16 + 33)
496d : a9 ff __ LDA #$ff
496f : 85 29 __ STA ACCU + 0 
4971 : a9 7f __ LDA #$7f
4973 : 85 2a __ STA ACCU + 1 
4975 : 60 __ __ RTS
4976 : a9 00 __ LDA #$00
4978 : 85 29 __ STA ACCU + 0 
497a : a9 80 __ LDA #$80
497c : 85 2a __ STA ACCU + 1 
497e : 60 __ __ RTS
497f : aa __ __ TAX
4980 : a5 2a __ LDA ACCU + 1 
4982 : 46 2b __ LSR ACCU + 2 
4984 : 6a __ __ ROR
4985 : e8 __ __ INX
4986 : d0 fa __ BNE $4982 ; (f32_to_i16 + 45)
4988 : 24 2c __ BIT ACCU + 3 
498a : 10 0e __ BPL $499a ; (f32_to_i16 + 69)
498c : 38 __ __ SEC
498d : 49 ff __ EOR #$ff
498f : 69 00 __ ADC #$00
4991 : 85 29 __ STA ACCU + 0 
4993 : a9 00 __ LDA #$00
4995 : e5 2b __ SBC ACCU + 2 
4997 : 85 2a __ STA ACCU + 1 
4999 : 60 __ __ RTS
499a : 85 29 __ STA ACCU + 0 
499c : a5 2b __ LDA ACCU + 2 
499e : 85 2a __ STA ACCU + 1 
49a0 : 60 __ __ RTS
--------------------------------------------------------------------
sint16_to_float: ; sint16_to_float
49a1 : 24 2a __ BIT ACCU + 1 
49a3 : 30 03 __ BMI $49a8 ; (sint16_to_float + 7)
49a5 : 4c bf 49 JMP $49bf ; (uint16_to_float + 0)
49a8 : 38 __ __ SEC
49a9 : a9 00 __ LDA #$00
49ab : e5 29 __ SBC ACCU + 0 
49ad : 85 29 __ STA ACCU + 0 
49af : a9 00 __ LDA #$00
49b1 : e5 2a __ SBC ACCU + 1 
49b3 : 85 2a __ STA ACCU + 1 
49b5 : 20 bf 49 JSR $49bf ; (uint16_to_float + 0)
49b8 : a5 2c __ LDA ACCU + 3 
49ba : 09 80 __ ORA #$80
49bc : 85 2c __ STA ACCU + 3 
49be : 60 __ __ RTS
--------------------------------------------------------------------
uint16_to_float: ; uint16_to_float
49bf : a5 29 __ LDA ACCU + 0 
49c1 : 05 2a __ ORA ACCU + 1 
49c3 : d0 05 __ BNE $49ca ; (uint16_to_float + 11)
49c5 : 85 2b __ STA ACCU + 2 
49c7 : 85 2c __ STA ACCU + 3 
49c9 : 60 __ __ RTS
49ca : a2 8e __ LDX #$8e
49cc : a5 2a __ LDA ACCU + 1 
49ce : 30 06 __ BMI $49d6 ; (uint16_to_float + 23)
49d0 : ca __ __ DEX
49d1 : 06 29 __ ASL ACCU + 0 
49d3 : 2a __ __ ROL
49d4 : 10 fa __ BPL $49d0 ; (uint16_to_float + 17)
49d6 : 0a __ __ ASL
49d7 : 85 2b __ STA ACCU + 2 
49d9 : a5 29 __ LDA ACCU + 0 
49db : 85 2a __ STA ACCU + 1 
49dd : 8a __ __ TXA
49de : 4a __ __ LSR
49df : 85 2c __ STA ACCU + 3 
49e1 : a9 00 __ LDA #$00
49e3 : 85 29 __ STA ACCU + 0 
49e5 : 66 2b __ ROR ACCU + 2 
49e7 : 60 __ __ RTS
--------------------------------------------------------------------
uint32_to_float: ; uint32_to_float
49e8 : a5 29 __ LDA ACCU + 0 
49ea : 05 2a __ ORA ACCU + 1 
49ec : 05 2b __ ORA ACCU + 2 
49ee : 05 2c __ ORA ACCU + 3 
49f0 : d0 01 __ BNE $49f3 ; (uint32_to_float + 11)
49f2 : 60 __ __ RTS
49f3 : a2 9e __ LDX #$9e
49f5 : a5 2c __ LDA ACCU + 3 
49f7 : 30 0a __ BMI $4a03 ; (uint32_to_float + 27)
49f9 : ca __ __ DEX
49fa : 06 29 __ ASL ACCU + 0 
49fc : 26 2a __ ROL ACCU + 1 
49fe : 26 2b __ ROL ACCU + 2 
4a00 : 2a __ __ ROL
4a01 : 10 f6 __ BPL $49f9 ; (uint32_to_float + 17)
4a03 : 24 29 __ BIT ACCU + 0 
4a05 : 10 13 __ BPL $4a1a ; (uint32_to_float + 50)
4a07 : e6 2a __ INC ACCU + 1 
4a09 : d0 0f __ BNE $4a1a ; (uint32_to_float + 50)
4a0b : e6 2b __ INC ACCU + 2 
4a0d : d0 0b __ BNE $4a1a ; (uint32_to_float + 50)
4a0f : 18 __ __ CLC
4a10 : 69 01 __ ADC #$01
4a12 : 90 06 __ BCC $4a1a ; (uint32_to_float + 50)
4a14 : 4a __ __ LSR
4a15 : 66 2b __ ROR ACCU + 2 
4a17 : 66 2a __ ROR ACCU + 1 
4a19 : e8 __ __ INX
4a1a : 0a __ __ ASL
4a1b : a4 2a __ LDY ACCU + 1 
4a1d : 84 29 __ STY ACCU + 0 
4a1f : a4 2b __ LDY ACCU + 2 
4a21 : 84 2a __ STY ACCU + 1 
4a23 : 85 2b __ STA ACCU + 2 
4a25 : 8a __ __ TXA
4a26 : 4a __ __ LSR
4a27 : 85 2c __ STA ACCU + 3 
4a29 : 66 2b __ ROR ACCU + 2 
4a2b : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
4a2c : 84 10 __ STY $10 
4a2e : a0 20 __ LDY #$20
4a30 : a9 00 __ LDA #$00
4a32 : 85 15 __ STA WORK + 4 
4a34 : 85 16 __ STA WORK + 5 
4a36 : 85 17 __ STA WORK + 6 
4a38 : 85 18 __ STA WORK + 7 
4a3a : a5 13 __ LDA WORK + 2 
4a3c : 05 14 __ ORA WORK + 3 
4a3e : d0 78 __ BNE $4ab8 ; (divmod32 + 140)
4a40 : a5 12 __ LDA WORK + 1 
4a42 : d0 27 __ BNE $4a6b ; (divmod32 + 63)
4a44 : 18 __ __ CLC
4a45 : 26 29 __ ROL ACCU + 0 
4a47 : 26 2a __ ROL ACCU + 1 
4a49 : 26 2b __ ROL ACCU + 2 
4a4b : 26 2c __ ROL ACCU + 3 
4a4d : 2a __ __ ROL
4a4e : 90 05 __ BCC $4a55 ; (divmod32 + 41)
4a50 : e5 11 __ SBC WORK + 0 
4a52 : 38 __ __ SEC
4a53 : b0 06 __ BCS $4a5b ; (divmod32 + 47)
4a55 : c5 11 __ CMP WORK + 0 
4a57 : 90 02 __ BCC $4a5b ; (divmod32 + 47)
4a59 : e5 11 __ SBC WORK + 0 
4a5b : 88 __ __ DEY
4a5c : d0 e7 __ BNE $4a45 ; (divmod32 + 25)
4a5e : 85 15 __ STA WORK + 4 
4a60 : 26 29 __ ROL ACCU + 0 
4a62 : 26 2a __ ROL ACCU + 1 
4a64 : 26 2b __ ROL ACCU + 2 
4a66 : 26 2c __ ROL ACCU + 3 
4a68 : a4 10 __ LDY $10 
4a6a : 60 __ __ RTS
4a6b : a5 2c __ LDA ACCU + 3 
4a6d : d0 10 __ BNE $4a7f ; (divmod32 + 83)
4a6f : a6 2b __ LDX ACCU + 2 
4a71 : 86 2c __ STX ACCU + 3 
4a73 : a6 2a __ LDX ACCU + 1 
4a75 : 86 2b __ STX ACCU + 2 
4a77 : a6 29 __ LDX ACCU + 0 
4a79 : 86 2a __ STX ACCU + 1 
4a7b : 85 29 __ STA ACCU + 0 
4a7d : a0 18 __ LDY #$18
4a7f : 18 __ __ CLC
4a80 : 26 29 __ ROL ACCU + 0 
4a82 : 26 2a __ ROL ACCU + 1 
4a84 : 26 2b __ ROL ACCU + 2 
4a86 : 26 2c __ ROL ACCU + 3 
4a88 : 26 15 __ ROL WORK + 4 
4a8a : 26 16 __ ROL WORK + 5 
4a8c : 90 0c __ BCC $4a9a ; (divmod32 + 110)
4a8e : a5 15 __ LDA WORK + 4 
4a90 : e5 11 __ SBC WORK + 0 
4a92 : aa __ __ TAX
4a93 : a5 16 __ LDA WORK + 5 
4a95 : e5 12 __ SBC WORK + 1 
4a97 : 38 __ __ SEC
4a98 : b0 0c __ BCS $4aa6 ; (divmod32 + 122)
4a9a : 38 __ __ SEC
4a9b : a5 15 __ LDA WORK + 4 
4a9d : e5 11 __ SBC WORK + 0 
4a9f : aa __ __ TAX
4aa0 : a5 16 __ LDA WORK + 5 
4aa2 : e5 12 __ SBC WORK + 1 
4aa4 : 90 04 __ BCC $4aaa ; (divmod32 + 126)
4aa6 : 86 15 __ STX WORK + 4 
4aa8 : 85 16 __ STA WORK + 5 
4aaa : 88 __ __ DEY
4aab : d0 d3 __ BNE $4a80 ; (divmod32 + 84)
4aad : 26 29 __ ROL ACCU + 0 
4aaf : 26 2a __ ROL ACCU + 1 
4ab1 : 26 2b __ ROL ACCU + 2 
4ab3 : 26 2c __ ROL ACCU + 3 
4ab5 : a4 10 __ LDY $10 
4ab7 : 60 __ __ RTS
4ab8 : a0 10 __ LDY #$10
4aba : a5 2c __ LDA ACCU + 3 
4abc : 85 16 __ STA WORK + 5 
4abe : a5 2b __ LDA ACCU + 2 
4ac0 : 85 15 __ STA WORK + 4 
4ac2 : a9 00 __ LDA #$00
4ac4 : 85 2b __ STA ACCU + 2 
4ac6 : 85 2c __ STA ACCU + 3 
4ac8 : 18 __ __ CLC
4ac9 : 26 29 __ ROL ACCU + 0 
4acb : 26 2a __ ROL ACCU + 1 
4acd : 26 15 __ ROL WORK + 4 
4acf : 26 16 __ ROL WORK + 5 
4ad1 : 26 17 __ ROL WORK + 6 
4ad3 : 26 18 __ ROL WORK + 7 
4ad5 : a5 15 __ LDA WORK + 4 
4ad7 : c5 11 __ CMP WORK + 0 
4ad9 : a5 16 __ LDA WORK + 5 
4adb : e5 12 __ SBC WORK + 1 
4add : a5 17 __ LDA WORK + 6 
4adf : e5 13 __ SBC WORK + 2 
4ae1 : aa __ __ TAX
4ae2 : a5 18 __ LDA WORK + 7 
4ae4 : e5 14 __ SBC WORK + 3 
4ae6 : 90 11 __ BCC $4af9 ; (divmod32 + 205)
4ae8 : 86 17 __ STX WORK + 6 
4aea : 85 18 __ STA WORK + 7 
4aec : a5 15 __ LDA WORK + 4 
4aee : e5 11 __ SBC WORK + 0 
4af0 : 85 15 __ STA WORK + 4 
4af2 : a5 16 __ LDA WORK + 5 
4af4 : e5 12 __ SBC WORK + 1 
4af6 : 85 16 __ STA WORK + 5 
4af8 : 38 __ __ SEC
4af9 : 88 __ __ DEY
4afa : d0 cd __ BNE $4ac9 ; (divmod32 + 157)
4afc : 26 29 __ ROL ACCU + 0 
4afe : 26 2a __ ROL ACCU + 1 
4b00 : a4 10 __ LDY $10 
4b02 : 60 __ __ RTS
--------------------------------------------------------------------
crt_malloc: ; crt_malloc
4b03 : 18 __ __ CLC
4b04 : a5 29 __ LDA ACCU + 0 
4b06 : 69 05 __ ADC #$05
4b08 : 29 fc __ AND #$fc
4b0a : 85 11 __ STA WORK + 0 
4b0c : a5 2a __ LDA ACCU + 1 
4b0e : 69 00 __ ADC #$00
4b10 : 85 12 __ STA WORK + 1 
4b12 : ad c9 4d LDA $4dc9 ; (HeapNode.end + 0)
4b15 : d0 26 __ BNE $4b3d ; (crt_malloc + 58)
4b17 : a9 00 __ LDA #$00
4b19 : 8d 82 50 STA $5082 
4b1c : 8d 83 50 STA $5083 
4b1f : ee c9 4d INC $4dc9 ; (HeapNode.end + 0)
4b22 : a9 80 __ LDA #$80
4b24 : 09 02 __ ORA #$02
4b26 : 8d c7 4d STA $4dc7 ; (HeapNode.next + 0)
4b29 : a9 50 __ LDA #$50
4b2b : 8d c8 4d STA $4dc8 ; (HeapNode.next + 1)
4b2e : 38 __ __ SEC
4b2f : a9 00 __ LDA #$00
4b31 : e9 02 __ SBC #$02
4b33 : 8d 84 50 STA $5084 
4b36 : a9 90 __ LDA #$90
4b38 : e9 00 __ SBC #$00
4b3a : 8d 85 50 STA $5085 
4b3d : a9 c7 __ LDA #$c7
4b3f : a2 4d __ LDX #$4d
4b41 : 85 2b __ STA ACCU + 2 
4b43 : 86 2c __ STX ACCU + 3 
4b45 : 18 __ __ CLC
4b46 : a0 00 __ LDY #$00
4b48 : b1 2b __ LDA (ACCU + 2),y 
4b4a : 85 29 __ STA ACCU + 0 
4b4c : 65 11 __ ADC WORK + 0 
4b4e : 85 13 __ STA WORK + 2 
4b50 : c8 __ __ INY
4b51 : b1 2b __ LDA (ACCU + 2),y 
4b53 : 85 2a __ STA ACCU + 1 
4b55 : f0 20 __ BEQ $4b77 ; (crt_malloc + 116)
4b57 : 65 12 __ ADC WORK + 1 
4b59 : 85 14 __ STA WORK + 3 
4b5b : b0 14 __ BCS $4b71 ; (crt_malloc + 110)
4b5d : a0 02 __ LDY #$02
4b5f : b1 29 __ LDA (ACCU + 0),y 
4b61 : c5 13 __ CMP WORK + 2 
4b63 : c8 __ __ INY
4b64 : b1 29 __ LDA (ACCU + 0),y 
4b66 : e5 14 __ SBC WORK + 3 
4b68 : b0 0e __ BCS $4b78 ; (crt_malloc + 117)
4b6a : a5 29 __ LDA ACCU + 0 
4b6c : a6 2a __ LDX ACCU + 1 
4b6e : 4c 41 4b JMP $4b41 ; (crt_malloc + 62)
4b71 : a9 00 __ LDA #$00
4b73 : 85 29 __ STA ACCU + 0 
4b75 : 85 2a __ STA ACCU + 1 
4b77 : 60 __ __ RTS
4b78 : a5 13 __ LDA WORK + 2 
4b7a : 85 15 __ STA WORK + 4 
4b7c : a5 14 __ LDA WORK + 3 
4b7e : 85 16 __ STA WORK + 5 
4b80 : a0 02 __ LDY #$02
4b82 : a5 15 __ LDA WORK + 4 
4b84 : d1 29 __ CMP (ACCU + 0),y 
4b86 : d0 15 __ BNE $4b9d ; (crt_malloc + 154)
4b88 : c8 __ __ INY
4b89 : a5 16 __ LDA WORK + 5 
4b8b : d1 29 __ CMP (ACCU + 0),y 
4b8d : d0 0e __ BNE $4b9d ; (crt_malloc + 154)
4b8f : a0 00 __ LDY #$00
4b91 : b1 29 __ LDA (ACCU + 0),y 
4b93 : 91 2b __ STA (ACCU + 2),y 
4b95 : c8 __ __ INY
4b96 : b1 29 __ LDA (ACCU + 0),y 
4b98 : 91 2b __ STA (ACCU + 2),y 
4b9a : 4c ba 4b JMP $4bba ; (crt_malloc + 183)
4b9d : a0 00 __ LDY #$00
4b9f : b1 29 __ LDA (ACCU + 0),y 
4ba1 : 91 15 __ STA (WORK + 4),y 
4ba3 : a5 15 __ LDA WORK + 4 
4ba5 : 91 2b __ STA (ACCU + 2),y 
4ba7 : c8 __ __ INY
4ba8 : b1 29 __ LDA (ACCU + 0),y 
4baa : 91 15 __ STA (WORK + 4),y 
4bac : a5 16 __ LDA WORK + 5 
4bae : 91 2b __ STA (ACCU + 2),y 
4bb0 : c8 __ __ INY
4bb1 : b1 29 __ LDA (ACCU + 0),y 
4bb3 : 91 15 __ STA (WORK + 4),y 
4bb5 : c8 __ __ INY
4bb6 : b1 29 __ LDA (ACCU + 0),y 
4bb8 : 91 15 __ STA (WORK + 4),y 
4bba : a0 00 __ LDY #$00
4bbc : a5 13 __ LDA WORK + 2 
4bbe : 91 29 __ STA (ACCU + 0),y 
4bc0 : c8 __ __ INY
4bc1 : a5 14 __ LDA WORK + 3 
4bc3 : 91 29 __ STA (ACCU + 0),y 
4bc5 : 18 __ __ CLC
4bc6 : a5 29 __ LDA ACCU + 0 
4bc8 : 69 02 __ ADC #$02
4bca : 85 29 __ STA ACCU + 0 
4bcc : 90 02 __ BCC $4bd0 ; (crt_malloc + 205)
4bce : e6 2a __ INC ACCU + 1 
4bd0 : 60 __ __ RTS
--------------------------------------------------------------------
crt_free: ; crt_free
4bd1 : a5 29 __ LDA ACCU + 0 
4bd3 : 05 2a __ ORA ACCU + 1 
4bd5 : d0 01 __ BNE $4bd8 ; (crt_free + 7)
4bd7 : 60 __ __ RTS
4bd8 : 38 __ __ SEC
4bd9 : a5 29 __ LDA ACCU + 0 
4bdb : e9 02 __ SBC #$02
4bdd : 85 29 __ STA ACCU + 0 
4bdf : b0 02 __ BCS $4be3 ; (crt_free + 18)
4be1 : c6 2a __ DEC ACCU + 1 
4be3 : a0 00 __ LDY #$00
4be5 : b1 29 __ LDA (ACCU + 0),y 
4be7 : 85 2b __ STA ACCU + 2 
4be9 : c8 __ __ INY
4bea : b1 29 __ LDA (ACCU + 0),y 
4bec : 85 2c __ STA ACCU + 3 
4bee : a9 c7 __ LDA #$c7
4bf0 : a2 4d __ LDX #$4d
4bf2 : 85 13 __ STA WORK + 2 
4bf4 : 86 14 __ STX WORK + 3 
4bf6 : a0 01 __ LDY #$01
4bf8 : b1 13 __ LDA (WORK + 2),y 
4bfa : f0 28 __ BEQ $4c24 ; (crt_free + 83)
4bfc : aa __ __ TAX
4bfd : 88 __ __ DEY
4bfe : b1 13 __ LDA (WORK + 2),y 
4c00 : e4 2c __ CPX ACCU + 3 
4c02 : 90 ee __ BCC $4bf2 ; (crt_free + 33)
4c04 : d0 1e __ BNE $4c24 ; (crt_free + 83)
4c06 : c5 2b __ CMP ACCU + 2 
4c08 : 90 e8 __ BCC $4bf2 ; (crt_free + 33)
4c0a : d0 18 __ BNE $4c24 ; (crt_free + 83)
4c0c : a0 00 __ LDY #$00
4c0e : b1 2b __ LDA (ACCU + 2),y 
4c10 : 91 29 __ STA (ACCU + 0),y 
4c12 : c8 __ __ INY
4c13 : b1 2b __ LDA (ACCU + 2),y 
4c15 : 91 29 __ STA (ACCU + 0),y 
4c17 : c8 __ __ INY
4c18 : b1 2b __ LDA (ACCU + 2),y 
4c1a : 91 29 __ STA (ACCU + 0),y 
4c1c : c8 __ __ INY
4c1d : b1 2b __ LDA (ACCU + 2),y 
4c1f : 91 29 __ STA (ACCU + 0),y 
4c21 : 4c 39 4c JMP $4c39 ; (crt_free + 104)
4c24 : a0 00 __ LDY #$00
4c26 : b1 13 __ LDA (WORK + 2),y 
4c28 : 91 29 __ STA (ACCU + 0),y 
4c2a : c8 __ __ INY
4c2b : b1 13 __ LDA (WORK + 2),y 
4c2d : 91 29 __ STA (ACCU + 0),y 
4c2f : c8 __ __ INY
4c30 : a5 2b __ LDA ACCU + 2 
4c32 : 91 29 __ STA (ACCU + 0),y 
4c34 : c8 __ __ INY
4c35 : a5 2c __ LDA ACCU + 3 
4c37 : 91 29 __ STA (ACCU + 0),y 
4c39 : a0 02 __ LDY #$02
4c3b : b1 13 __ LDA (WORK + 2),y 
4c3d : c5 29 __ CMP ACCU + 0 
4c3f : d0 1d __ BNE $4c5e ; (crt_free + 141)
4c41 : c8 __ __ INY
4c42 : b1 13 __ LDA (WORK + 2),y 
4c44 : c5 2a __ CMP ACCU + 1 
4c46 : d0 16 __ BNE $4c5e ; (crt_free + 141)
4c48 : a0 00 __ LDY #$00
4c4a : b1 29 __ LDA (ACCU + 0),y 
4c4c : 91 13 __ STA (WORK + 2),y 
4c4e : c8 __ __ INY
4c4f : b1 29 __ LDA (ACCU + 0),y 
4c51 : 91 13 __ STA (WORK + 2),y 
4c53 : c8 __ __ INY
4c54 : b1 29 __ LDA (ACCU + 0),y 
4c56 : 91 13 __ STA (WORK + 2),y 
4c58 : c8 __ __ INY
4c59 : b1 29 __ LDA (ACCU + 0),y 
4c5b : 91 13 __ STA (WORK + 2),y 
4c5d : 60 __ __ RTS
4c5e : a0 00 __ LDY #$00
4c60 : a5 29 __ LDA ACCU + 0 
4c62 : 91 13 __ STA (WORK + 2),y 
4c64 : c8 __ __ INY
4c65 : a5 2a __ LDA ACCU + 1 
4c67 : 91 13 __ STA (WORK + 2),y 
4c69 : 60 __ __ RTS
--------------------------------------------------------------------
__multab3L:
4c6a : __ __ __ BYT 00 03 06 09                                     : ....
--------------------------------------------------------------------
textColors:
4c6e : __ __ __ BYT 00 00 00 dd 00 33 00 00 99 dd 22 dd 00 77 22 55 : .....3...."..w"U
4c7e : __ __ __ BYT 55 55 22 22 ff 66 aa ff 88 55 00 ff 66 00 aa aa : UU"".f...U..f...
4c8e : __ __ __ BYT aa ff 99 88 00 dd 00 ff ff 00 55 ff 99 ff ff ff : ..........U.....
--------------------------------------------------------------------
_col:
4c9e : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
_row:
4c9f : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
f256k_color:
4ca0 : __ __ __ BYT f0                                              : .
--------------------------------------------------------------------
fround5:
4ca1 : __ __ __ BYT 00 00 00 3f cd cc 4c 3d 0a d7 a3 3b 6f 12 03 3a : ...?..L=...;o..:
4cb1 : __ __ __ BYT 17 b7 51 38 ac c5 a7 36 bd 37 06 35             : ..Q8...6.7.5
--------------------------------------------------------------------
periodIndex:
4cbd : __ __ __ BYT 1e                                              : .
--------------------------------------------------------------------
pcmHeader:
4cbe : __ __ __ BYT 52 49 46 46 ff ff ff ff 57 41 56 45 66 6d 74 20 : RIFF....WAVEfmt 
4cce : __ __ __ BYT 10 00 00 00 01 00 01 00 22 56 00 00 22 56 00 00 : ........"V.."V..
4cde : __ __ __ BYT 01 00 08 00 64 61 74 61 ff ff ff ff             : ....data....
--------------------------------------------------------------------
isPlaying:
4cea : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
hasEnded:
4ceb : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
nearingEnd:
4cec : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
itersFixed:
4ced : __ __ __ BYT 00 00 00 00                                     : ....
--------------------------------------------------------------------
kernelArgs:
4cf1 : __ __ __ BSS	2
--------------------------------------------------------------------
kernelEventData:
4cf3 : __ __ __ BSS	7
--------------------------------------------------------------------
_BITMAP_CLUT:
4cfa : __ __ __ BSS	3
--------------------------------------------------------------------
_tileSize:
4cfd : __ __ __ BSS	3
--------------------------------------------------------------------
palPeriods:
4d00 : __ __ __ BYT b0 06 50 06 f4 05 a0 05 4c 05 00 05 b8 04 74 04 : ..P.....L.....t.
4d10 : __ __ __ BYT 34 04 f8 03 c0 03 8a 03 58 03 28 03 fa 02 d0 02 : 4.......X.(.....
4d20 : __ __ __ BYT a6 02 80 02 5c 02 3a 02 1a 02 fc 01 e0 01 c5 01 : ....\.:.........
4d30 : __ __ __ BYT ac 01 94 01 7d 01 68 01 53 01 40 01 2e 01 1d 01 : ....}.h.S.@.....
4d40 : __ __ __ BYT 0d 01 fe 00 f0 00 e2 00 d6 00 ca 00 be 00 b4 00 : ................
4d50 : __ __ __ BYT aa 00 a0 00 97 00 8f 00 87 00 7f 00 78 00 71 00 : ............x.q.
4d60 : __ __ __ BYT 6b 00 65 00 5f 00 5a 00 55 00 50 00 4b 00 47 00 : k.e._.Z.U.P.K.G.
4d70 : __ __ __ BYT 43 00 3f 00 3c 00 38 00                         : C.?.<.8.
--------------------------------------------------------------------
_spriteCtl:
4d78 : __ __ __ BSS	64
--------------------------------------------------------------------
_dirStream:
4db8 : __ __ __ BSS	8
--------------------------------------------------------------------
_kern_target:
4dc0 : __ __ __ BSS	2
--------------------------------------------------------------------
_kernelError:
4dc2 : __ __ __ BSS	1
--------------------------------------------------------------------
chan0Fixed:
4dc3 : __ __ __ BSS	4
--------------------------------------------------------------------
HeapNode:
4dc7 : __ __ __ BSS	4
--------------------------------------------------------------------
name:
4e00 : __ __ __ BSS	120
--------------------------------------------------------------------
fileDirEntS:
4e78 : __ __ __ BSS	258
--------------------------------------------------------------------
instLength:
4f7a : __ __ __ BSS	62
--------------------------------------------------------------------
instAddr:
5000 : __ __ __ BSS	124

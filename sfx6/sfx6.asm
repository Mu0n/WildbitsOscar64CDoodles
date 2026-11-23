; Compiled with 1.32.267
--------------------------------------------------------------------
startup: ; startup
0200 : 78 __ __ SEI
0201 : d8 __ __ CLD
0202 : a9 00 __ LDA #$00
0204 : 85 01 __ STA $01 
0206 : a2 22 __ LDX #$22
0208 : a0 78 __ LDY #$78
020a : a9 00 __ LDA #$00
020c : 85 27 __ STA IP + 0 
020e : 86 28 __ STX IP + 1 
0210 : e0 23 __ CPX #$23
0212 : f0 0b __ BEQ $021f ; (startup + 31)
0214 : 91 27 __ STA (IP + 0),y 
0216 : c8 __ __ INY
0217 : d0 fb __ BNE $0214 ; (startup + 20)
0219 : e8 __ __ INX
021a : d0 f2 __ BNE $020e ; (startup + 14)
021c : 91 27 __ STA (IP + 0),y 
021e : c8 __ __ INY
021f : c0 e0 __ CPY #$e0
0221 : d0 f9 __ BNE $021c ; (startup + 28)
0223 : a9 00 __ LDA #$00
0225 : a2 80 __ LDX #$80
0227 : d0 03 __ BNE $022c ; (startup + 44)
0229 : 95 00 __ STA $00,x 
022b : e8 __ __ INX
022c : e0 80 __ CPX #$80
022e : d0 f9 __ BNE $0229 ; (startup + 41)
0230 : a9 9c __ LDA #$9c
0232 : 85 31 __ STA SP + 0 
0234 : a9 9f __ LDA #$9f
0236 : 85 32 __ STA SP + 1 
0238 : 20 80 02 JSR $0280 ; (main.s4 + 0)
023b : 4c 3b 02 JMP $023b ; (startup + 59)
023e : 60 __ __ RTS
--------------------------------------------------------------------
main: ; main()->i16
;  30, "/mnt/d/F256/oscar64/include/crt.c"
.s4:
0280 : 20 b3 02 JSR $02b3 ; (f256Init.s4 + 0)
0283 : ad f7 21 LDA $21f7 ; (kernelArgs + 0)
0286 : 85 35 __ STA T0 + 0 
0288 : ad f8 21 LDA $21f8 ; (kernelArgs + 1)
028b : 85 36 __ STA T0 + 1 
028d : a0 08 __ LDY #$08
028f : b1 35 __ LDA (T0 + 0),y 
0291 : 8d fe 9f STA $9ffe ; (sstack + 16)
0294 : c8 __ __ INY
0295 : b1 35 __ LDA (T0 + 0),y 
0297 : 8d ff 9f STA $9fff ; (sstack + 17)
029a : c8 __ __ INY
029b : b1 35 __ LDA (T0 + 0),y 
029d : 4a __ __ LSR
029e : 8d fc 9f STA $9ffc ; (sstack + 14)
02a1 : a9 00 __ LDA #$00
02a3 : 8d fd 9f STA $9ffd ; (sstack + 15)
02a6 : 20 79 07 JSR $0779 ; (f256main.s1 + 0)
02a9 : 20 8c 1c JSR $1c8c ; (f256Reset.s4 + 0)
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
02f4 : 8d f7 21 STA $21f7 ; (kernelArgs + 0)
02f7 : a9 00 __ LDA #$00
02f9 : 8d f8 21 STA $21f8 ; (kernelArgs + 1)
02fc : a9 f9 __ LDA #$f9
02fe : 85 f0 __ STA $f0 
0300 : a9 21 __ LDA #$21
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
03cb : 8d ef 21 STA $21ef ; (_ccolor + 0)
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
03e2 : bd 01 22 LDA $2201,x ; (textColors[0].g + 0)
03e5 : 85 21 __ STA P6 
03e7 : bd 02 22 LDA $2202,x ; (textColors[0].b + 0)
03ea : 85 22 __ STA P7 
03ec : bd 00 22 LDA $2200,x ; (textColors[0].r + 0)
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
042a : 8d f0 21 STA $21f0 ; (_MAX_COL + 0)
042d : a5 1c __ LDA P1 ; (y + 0)
042f : f0 03 __ BEQ $0434 ; (textSetDouble.s7 + 0)
.s8:
0431 : 60 __ __ RTS
0432 : d0 02 __ BNE $0436 ; (textSetDouble.s9 + 0)
.s7:
0434 : a9 3c __ LDA #$3c
.s9:
0436 : 8d f1 21 STA $21f1 ; (_MAX_ROW + 0)
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
04cf : ad f0 21 LDA $21f0 ; (_MAX_COL + 0)
04d2 : 85 1b __ STA P0 
04d4 : ad f1 21 LDA $21f1 ; (_MAX_ROW + 0)
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
052c : ad ef 21 LDA $21ef ; (_ccolor + 0)
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
0557 : 8d f2 21 STA $21f2 ; (_col + 0)
055a : a2 00 __ LDX #$00
055c : 8e 15 d0 STX $d015 
055f : a5 1c __ LDA P1 ; (y + 0)
0561 : 8d 16 d0 STA $d016 
0564 : 8d f3 21 STA $21f3 ; (_row + 0)
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
05e5 : 8d 78 22 STA $2278 ; (_BITMAP_CLUT[0] + 0)
05e8 : 8d 79 22 STA $2279 ; (_BITMAP_CLUT[0] + 1)
05eb : 8d 7a 22 STA $227a ; (_BITMAP_CLUT[0] + 2)
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
0653 : b9 78 22 LDA $2278,y ; (_BITMAP_CLUT[0] + 0)
0656 : 09 01 __ ORA #$01
.s15:
0658 : 8d 10 d1 STA $d110 
.s3:
065b : 60 __ __ RTS
.s9:
065c : 8a __ __ TXA
065d : f0 05 __ BEQ $0664 ; (bitmapSetVisible.s14 + 0)
.s10:
065f : ad 78 22 LDA $2278 ; (_BITMAP_CLUT[0] + 0)
0662 : 09 01 __ ORA #$01
.s14:
0664 : 8d 00 d1 STA $d100 
0667 : 60 __ __ RTS
.s11:
0668 : 8a __ __ TXA
0669 : f0 05 __ BEQ $0670 ; (bitmapSetVisible.s13 + 0)
.s12:
066b : ad 79 22 LDA $2279 ; (_BITMAP_CLUT[0] + 1)
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
067c : 8d 7b 22 STA $227b ; (_tileSize[0] + 0)
067f : 8d 7c 22 STA $227c ; (_tileSize[0] + 1)
0682 : 8d 7d 22 STA $227d ; (_tileSize[0] + 2)
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
069f : ad 7d 22 LDA $227d ; (_tileSize[0] + 2)
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
06b2 : ad 7b 22 LDA $227b ; (_tileSize[0] + 0)
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
06c5 : ad 7c 22 LDA $227c ; (_tileSize[0] + 1)
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
06f2 : bd 7e 22 LDA $227e,x ; (_spriteCtl[0] + 0)
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
0708 : 9d be 22 STA $22be,x ; (_dirStream[0] + 0)
070b : ca __ __ DEX
070c : 10 fa __ BPL $0708 ; (fileReset.l5 + 0)
.s3:
070e : 60 __ __ RTS
--------------------------------------------------------------------
randomReset: ; randomReset()->void
;  16, "/mnt/d/F256/f256lib-oscar64/f256lib/f_random.h"
.s4:
070f : a9 dc __ LDA #$dc
0711 : 8d c6 22 STA $22c6 ; (_kern_target + 0)
0714 : a9 ff __ LDA #$ff
0716 : 8d c7 22 STA $22c7 ; (_kern_target + 1)
0719 : ad f7 21 LDA $21f7 ; (kernelArgs + 0)
071c : 85 35 __ STA T0 + 0 
071e : ad f8 21 LDA $21f8 ; (kernelArgs + 1)
0721 : 85 36 __ STA T0 + 1 
0723 : a9 e6 __ LDA #$e6
0725 : a0 0b __ LDY #$0b
0727 : 91 35 __ STA (T0 + 0),y 
0729 : a9 9f __ LDA #$9f
072b : c8 __ __ INY
072c : 91 35 __ STA (T0 + 0),y 
072e : a9 08 __ LDA #$08
0730 : c8 __ __ INY
0731 : 91 35 __ STA (T0 + 0),y 
0733 : 20 59 07 JSR $0759 ; (_kernelCallWrapper.s4 + 0)
0736 : ad ec 9f LDA $9fec ; (clock.seconds + 0)
0739 : 85 1b __ STA P0 
073b : ad ed 9f LDA $9fed ; (clock.centis + 0)
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
0761 : ad c6 22 LDA $22c6 ; (_kern_target + 0)
0764 : 8d 6e 07 STA $076e ; (_kernelCallRaw + 13)
0767 : ad c7 22 LDA $22c7 ; (_kern_target + 1)
076a : 8d 6f 07 STA $076f ; (_kernelCallRaw + 14)
076d : 20 00 00 JSR $0000 
0770 : aa __ __ TAX
0771 : a9 00 __ LDA #$00
0773 : 6a __ __ ROR
0774 : 8d c8 22 STA $22c8 ; (_kernelError + 0)
0777 : 8a __ __ TXA
0778 : 60 __ __ RTS
--------------------------------------------------------------------
f256main: ; f256main(i16,u8**)->i16
; 129, "/mnt/d/F256/f256lib-oscar64/doodles/sfx6/src/sfx6.c"
.s1:
0779 : a5 55 __ LDA T2 + 0 
077b : 8d 9e 9f STA $9f9e ; (f256main@stack + 0)
077e : a5 56 __ LDA T2 + 1 
0780 : 8d 9f 9f STA $9f9f ; (f256main@stack + 1)
.s4:
0783 : 20 de 07 JSR $07de ; (setup.s4 + 0)
0786 : a9 af __ LDA #$af
0788 : 85 23 __ STA P8 
078a : a9 0b __ LDA #$0b
078c : 85 24 __ STA P9 
078e : 20 df 09 JSR $09df ; (textPrint.s4 + 0)
0791 : a9 00 __ LDA #$00
0793 : 85 53 __ STA T1 + 0 
0795 : 85 54 __ STA T1 + 1 
0797 : a9 01 __ LDA #$01
0799 : 85 56 __ STA T2 + 1 
079b : e6 56 __ INC T2 + 1 
079d : a9 90 __ LDA #$90
079f : 85 55 __ STA T2 + 0 
.l5:
07a1 : a9 55 __ LDA #$55
07a3 : 8d f6 9f STA $9ff6 ; (sstack + 8)
07a6 : a9 1a __ LDA #$1a
07a8 : 8d f7 9f STA $9ff7 ; (sstack + 9)
07ab : a0 00 __ LDY #$00
07ad : b1 53 __ LDA (T1 + 0),y 
07af : 8d f8 9f STA $9ff8 ; (sstack + 10)
07b2 : c8 __ __ INY
07b3 : b1 53 __ LDA (T1 + 0),y 
07b5 : 8d f9 9f STA $9ff9 ; (sstack + 11)
07b8 : c8 __ __ INY
07b9 : b1 53 __ LDA (T1 + 0),y 
07bb : 8d fa 9f STA $9ffa ; (sstack + 12)
07be : c8 __ __ INY
07bf : b1 53 __ LDA (T1 + 0),y 
07c1 : 8d fb 9f STA $9ffb ; (sstack + 13)
07c4 : 20 ef 0b JSR $0bef ; (printf.s4 + 0)
07c7 : e6 53 __ INC T1 + 0 
07c9 : d0 02 __ BNE $07cd ; (f256main.s9 + 0)
.s8:
07cb : e6 54 __ INC T1 + 1 
.s9:
07cd : c6 55 __ DEC T2 + 0 
07cf : d0 d0 __ BNE $07a1 ; (f256main.l5 + 0)
.s7:
07d1 : c6 56 __ DEC T2 + 1 
07d3 : d0 cc __ BNE $07a1 ; (f256main.l5 + 0)
.l6:
07d5 : 20 5a 1a JSR $1a5a ; (PCMLoopPass.s4 + 0)
07d8 : 20 f4 1b JSR $1bf4 ; (dealKeyboard.s4 + 0)
07db : 4c d5 07 JMP $07d5 ; (f256main.l6 + 0)
--------------------------------------------------------------------
setup: ; setup()->void
;  88, "/mnt/d/F256/f256lib-oscar64/doodles/sfx6/src/sfx6.c"
.s4:
07de : a9 00 __ LDA #$00
07e0 : 85 1b __ STA P0 
07e2 : 85 1c __ STA P1 
07e4 : 85 1d __ STA P2 
07e6 : 85 1f __ STA P4 
07e8 : a5 00 __ LDA $00 
07ea : 09 08 __ ORA #$08
07ec : 85 00 __ STA $00 
07ee : a9 0e __ LDA #$0e
07f0 : 85 20 __ STA P5 
07f2 : a9 3a __ LDA #$3a
07f4 : 85 21 __ STA P6 
07f6 : a9 00 __ LDA #$00
07f8 : 85 01 __ STA $01 
07fa : a9 07 __ LDA #$07
07fc : 8d 00 d0 STA $d000 
07ff : a9 00 __ LDA #$00
0801 : 8d 01 d0 STA $d001 
0804 : a9 01 __ LDA #$01
0806 : 85 1e __ STA P3 
0808 : 85 01 __ STA $01 
080a : a9 00 __ LDA #$00
080c : 8d 0d d0 STA $d00d 
080f : 85 01 __ STA $01 
0811 : 20 fc 08 JSR $08fc ; (boostVSClock.s4 + 0)
0814 : 20 1e 09 JSR $091e ; (setupSound.s4 + 0)
0817 : e6 1b __ INC P0 
0819 : e6 1e __ INC P3 
081b : a9 4e __ LDA #$4e
081d : 85 20 __ STA P5 
081f : a9 2d __ LDA #$2d
0821 : 85 21 __ STA P6 
0823 : 20 1e 09 JSR $091e ; (setupSound.s4 + 0)
0826 : e6 1b __ INC P0 
0828 : e6 1e __ INC P3 
082a : a9 06 __ LDA #$06
082c : 85 20 __ STA P5 
082e : a9 1c __ LDA #$1c
0830 : 85 21 __ STA P6 
0832 : 20 1e 09 JSR $091e ; (setupSound.s4 + 0)
0835 : e6 1b __ INC P0 
0837 : e6 1e __ INC P3 
0839 : a9 5c __ LDA #$5c
083b : 85 20 __ STA P5 
083d : a9 5a __ LDA #$5a
083f : 85 21 __ STA P6 
0841 : 20 1e 09 JSR $091e ; (setupSound.s4 + 0)
0844 : e6 1b __ INC P0 
0846 : c6 1e __ DEC P3 
0848 : a9 06 __ LDA #$06
084a : 85 20 __ STA P5 
084c : a9 1c __ LDA #$1c
084e : 85 21 __ STA P6 
0850 : 20 1e 09 JSR $091e ; (setupSound.s4 + 0)
0853 : e6 1b __ INC P0 
0855 : c6 1e __ DEC P3 
0857 : a9 4e __ LDA #$4e
0859 : 85 20 __ STA P5 
085b : a9 2d __ LDA #$2d
085d : 85 21 __ STA P6 
085f : 20 1e 09 JSR $091e ; (setupSound.s4 + 0)
0862 : a9 06 __ LDA #$06
0864 : e6 1b __ INC P0 
0866 : 85 20 __ STA P5 
0868 : e6 1e __ INC P3 
086a : a9 1c __ LDA #$1c
086c : 85 21 __ STA P6 
086e : 20 1e 09 JSR $091e ; (setupSound.s4 + 0)
0871 : e6 1b __ INC P0 
0873 : e6 1e __ INC P3 
0875 : a9 5c __ LDA #$5c
0877 : 85 20 __ STA P5 
0879 : a9 5a __ LDA #$5a
087b : 85 21 __ STA P6 
087d : 20 1e 09 JSR $091e ; (setupSound.s4 + 0)
0880 : e6 1b __ INC P0 
0882 : c6 1e __ DEC P3 
0884 : a9 06 __ LDA #$06
0886 : 85 20 __ STA P5 
0888 : a9 1c __ LDA #$1c
088a : 85 21 __ STA P6 
088c : 20 1e 09 JSR $091e ; (setupSound.s4 + 0)
088f : e6 1b __ INC P0 
0891 : c6 1e __ DEC P3 
0893 : a9 4e __ LDA #$4e
0895 : 85 20 __ STA P5 
0897 : a9 2d __ LDA #$2d
0899 : 85 21 __ STA P6 
089b : 20 1e 09 JSR $091e ; (setupSound.s4 + 0)
089e : e6 1b __ INC P0 
08a0 : e6 1e __ INC P3 
08a2 : a9 06 __ LDA #$06
08a4 : 85 20 __ STA P5 
08a6 : a9 1c __ LDA #$1c
08a8 : 85 21 __ STA P6 
08aa : 20 1e 09 JSR $091e ; (setupSound.s4 + 0)
08ad : e6 1b __ INC P0 
08af : 20 1e 09 JSR $091e ; (setupSound.s4 + 0)
08b2 : e6 1b __ INC P0 
08b4 : c6 1e __ DEC P3 
08b6 : a9 4e __ LDA #$4e
08b8 : 85 20 __ STA P5 
08ba : a9 2d __ LDA #$2d
08bc : 85 21 __ STA P6 
08be : 20 1e 09 JSR $091e ; (setupSound.s4 + 0)
08c1 : e6 1b __ INC P0 
08c3 : a9 04 __ LDA #$04
08c5 : 85 1e __ STA P3 
08c7 : a9 5a __ LDA #$5a
08c9 : 85 21 __ STA P6 
08cb : a9 5c __ LDA #$5c
08cd : 85 20 __ STA P5 
08cf : 20 1e 09 JSR $091e ; (setupSound.s4 + 0)
08d2 : e6 1b __ INC P0 
08d4 : c6 1e __ DEC P3 
08d6 : a9 06 __ LDA #$06
08d8 : 85 20 __ STA P5 
08da : a9 1c __ LDA #$1c
08dc : 85 21 __ STA P6 
08de : 20 1e 09 JSR $091e ; (setupSound.s4 + 0)
08e1 : e6 1b __ INC P0 
08e3 : e6 1e __ INC P3 
08e5 : a9 5c __ LDA #$5c
08e7 : 85 20 __ STA P5 
08e9 : a9 5a __ LDA #$5a
08eb : 85 21 __ STA P6 
08ed : 20 1e 09 JSR $091e ; (setupSound.s4 + 0)
08f0 : 20 63 09 JSR $0963 ; (pcmHeaderPump.s4 + 0)
08f3 : 20 71 09 JSR $0971 ; (lowVol.s4 + 0)
08f6 : 20 93 09 JSR $0993 ; (silencePad.s4 + 0)
08f9 : 4c bf 09 JMP $09bf ; (highVol.s4 + 0)
--------------------------------------------------------------------
boostVSClock: ; boostVSClock()->void
;  27, "/mnt/d/F256/f256lib-oscar64/doodles/sfx6/src/muVS1053b.h"
.s4:
08fc : a9 03 __ LDA #$03
08fe : 8d 01 d7 STA $d701 
0901 : a9 00 __ LDA #$00
0903 : 8d 02 d7 STA $d702 
0906 : 8d 02 d7 STA $d702 
0909 : a9 c0 __ LDA #$c0
090b : 8d 03 d7 STA $d703 
090e : a9 01 __ LDA #$01
0910 : 8d 00 d7 STA $d700 
0913 : a9 00 __ LDA #$00
0915 : 8d 00 d7 STA $d700 
.l5:
0918 : 2c 00 d7 BIT $d700 
091b : 30 fb __ BMI $0918 ; (boostVSClock.l5 + 0)
.s3:
091d : 60 __ __ RTS
--------------------------------------------------------------------
setupSound: ; setupSound(u8,u32,u16)->void
;  22, "/mnt/d/F256/f256lib-oscar64/doodles/sfx6/src/muSfxPlay.h"
.s4:
091e : a6 1b __ LDX P0 ; (which + 0)
0920 : e0 10 __ CPX #$10
0922 : b0 3e __ BCS $0962 ; (setupSound.s3 + 0)
.s5:
0924 : a9 00 __ LDA #$00
0926 : bc df 21 LDY $21df,x ; (__multab10L + 0)
0929 : 99 06 23 STA $2306,y ; (sfx[0].offset + 0)
092c : 99 07 23 STA $2307,y ; (sfx[0].offset + 1)
092f : 99 08 23 STA $2308,y ; (sfx[0].isPlaying + 0)
0932 : a9 80 __ LDA #$80
0934 : 99 09 23 STA $2309,y ; (sfx[0].data + 0)
0937 : a5 1c __ LDA P1 ; (start + 0)
0939 : 69 2c __ ADC #$2c
093b : 99 00 23 STA $2300,y ; (sfx[0].startAddr + 0)
093e : a5 1d __ LDA P2 ; (start + 1)
0940 : 69 00 __ ADC #$00
0942 : 99 01 23 STA $2301,y ; (sfx[0].startAddr + 1)
0945 : a5 1e __ LDA P3 ; (start + 2)
0947 : 69 00 __ ADC #$00
0949 : 99 02 23 STA $2302,y ; (sfx[0].startAddr + 2)
094c : a5 1f __ LDA P4 ; (start + 3)
094e : 69 00 __ ADC #$00
0950 : 99 03 23 STA $2303,y ; (sfx[0].startAddr + 3)
0953 : 38 __ __ SEC
0954 : a5 20 __ LDA P5 ; (size + 0)
0956 : e9 2c __ SBC #$2c
0958 : 99 04 23 STA $2304,y ; (sfx[0].size + 0)
095b : a5 21 __ LDA P6 ; (size + 1)
095d : e9 00 __ SBC #$00
095f : 99 05 23 STA $2305,y ; (sfx[0].size + 1)
.s3:
0962 : 60 __ __ RTS
--------------------------------------------------------------------
pcmHeaderPump: ; pcmHeaderPump()->void
;  19, "/mnt/d/F256/f256lib-oscar64/doodles/sfx6/src/muSfxPlay.h"
.s4:
0963 : a2 00 __ LDX #$00
.l5:
0965 : bd 30 22 LDA $2230,x ; (pcmHeader[0] + 0)
0968 : 8d 07 d7 STA $d707 
096b : e8 __ __ INX
096c : e0 2c __ CPX #$2c
096e : d0 f5 __ BNE $0965 ; (pcmHeaderPump.l5 + 0)
.s3:
0970 : 60 __ __ RTS
--------------------------------------------------------------------
lowVol: ; lowVol()->void
;  29, "/mnt/d/F256/f256lib-oscar64/doodles/sfx6/src/muVS1053b.h"
.s4:
0971 : a9 0b __ LDA #$0b
0973 : 8d 01 d7 STA $d701 
0976 : a9 00 __ LDA #$00
0978 : 8d 02 d7 STA $d702 
097b : a9 fe __ LDA #$fe
097d : 8d 02 d7 STA $d702 
0980 : 8d 03 d7 STA $d703 
0983 : a9 03 __ LDA #$03
0985 : 8d 00 d7 STA $d700 
0988 : a9 00 __ LDA #$00
098a : 8d 00 d7 STA $d700 
.l5:
098d : 2c 00 d7 BIT $d700 
0990 : 30 fb __ BMI $098d ; (lowVol.l5 + 0)
.s3:
0992 : 60 __ __ RTS
--------------------------------------------------------------------
silencePad: ; silencePad()->void
;  20, "/mnt/d/F256/f256lib-oscar64/doodles/sfx6/src/muSfxPlay.h"
.s4:
0993 : a2 20 __ LDX #$20
.l5:
0995 : ad 04 d7 LDA $d704 
0998 : 85 29 __ STA ACCU + 0 
099a : ad 05 d7 LDA $d705 
099d : 29 07 __ AND #$07
099f : 85 2a __ STA ACCU + 1 
09a1 : 38 __ __ SEC
09a2 : a9 00 __ LDA #$00
09a4 : e5 29 __ SBC ACCU + 0 
09a6 : a8 __ __ TAY
09a7 : a9 08 __ LDA #$08
09a9 : e5 2a __ SBC ACCU + 1 
09ab : d0 04 __ BNE $09b1 ; (silencePad.s6 + 0)
.s8:
09ad : c0 40 __ CPY #$40
09af : 90 e4 __ BCC $0995 ; (silencePad.l5 + 0)
.s6:
09b1 : a9 80 __ LDA #$80
09b3 : a0 40 __ LDY #$40
.l9:
09b5 : 8d 07 d7 STA $d707 
09b8 : 88 __ __ DEY
09b9 : d0 fa __ BNE $09b5 ; (silencePad.l9 + 0)
.s7:
09bb : ca __ __ DEX
09bc : d0 d7 __ BNE $0995 ; (silencePad.l5 + 0)
.s3:
09be : 60 __ __ RTS
--------------------------------------------------------------------
highVol: ; highVol()->void
;  30, "/mnt/d/F256/f256lib-oscar64/doodles/sfx6/src/muVS1053b.h"
.s4:
09bf : a9 0b __ LDA #$0b
09c1 : 8d 01 d7 STA $d701 
09c4 : a9 00 __ LDA #$00
09c6 : 8d 02 d7 STA $d702 
09c9 : 8d 02 d7 STA $d702 
09cc : 8d 03 d7 STA $d703 
09cf : a9 03 __ LDA #$03
09d1 : 8d 00 d7 STA $d700 
09d4 : a9 00 __ LDA #$00
09d6 : 8d 00 d7 STA $d700 
.l5:
09d9 : 2c 00 d7 BIT $d700 
09dc : 30 fb __ BMI $09d9 ; (highVol.l5 + 0)
.s3:
09de : 60 __ __ RTS
--------------------------------------------------------------------
textPrint: ; textPrint(const u8*)->void
;  46, "/mnt/d/F256/f256lib-oscar64/f256lib/f_text.h"
.s4:
09df : ad f0 21 LDA $21f0 ; (_MAX_COL + 0)
09e2 : 85 41 __ STA T10 + 0 
09e4 : 85 3d __ STA T6 + 0 
09e6 : 85 1b __ STA P0 
09e8 : ad f3 21 LDA $21f3 ; (_row + 0)
09eb : 85 1d __ STA P2 
09ed : a9 00 __ LDA #$00
09ef : 85 1c __ STA P1 
09f1 : 85 1e __ STA P3 
09f3 : a5 01 __ LDA $01 
09f5 : 85 42 __ STA T11 + 0 
09f7 : 20 78 04 JSR $0478 ; (mathUnsignedMultiply.s4 + 0)
09fa : a9 00 __ LDA #$00
09fc : 85 1b __ STA P0 
09fe : 85 1d __ STA P2 
0a00 : a5 29 __ LDA ACCU + 0 
0a02 : 85 1f __ STA P4 
0a04 : a9 c0 __ LDA #$c0
0a06 : 85 1c __ STA P1 
0a08 : a5 2a __ LDA ACCU + 1 
0a0a : 85 20 __ STA P5 
0a0c : a5 2b __ LDA ACCU + 2 
0a0e : 85 21 __ STA P6 
0a10 : a5 2c __ LDA ACCU + 3 
0a12 : 85 22 __ STA P7 
0a14 : 20 72 0b JSR $0b72 ; (mathUnsignedAddition.s4 + 0)
0a17 : a5 29 __ LDA ACCU + 0 
0a19 : 85 35 __ STA T0 + 0 
0a1b : a5 2a __ LDA ACCU + 1 
0a1d : 85 36 __ STA T0 + 1 
0a1f : a9 00 __ LDA #$00
0a21 : 85 3e __ STA T7 + 0 
0a23 : 85 3f __ STA T7 + 1 
.l38:
0a25 : a5 3e __ LDA T7 + 0 
0a27 : 85 29 __ STA ACCU + 0 
0a29 : 18 __ __ CLC
0a2a : a5 24 __ LDA P9 ; (message + 1)
0a2c : 65 3f __ ADC T7 + 1 
0a2e : 85 2a __ STA ACCU + 1 
0a30 : a4 23 __ LDY P8 ; (message + 0)
0a32 : b1 29 __ LDA (ACCU + 0),y 
0a34 : d0 11 __ BNE $0a47 ; (textPrint.s6 + 0)
.s5:
0a36 : a5 42 __ LDA T11 + 0 
0a38 : 85 01 __ STA $01 
0a3a : ad f2 21 LDA $21f2 ; (_col + 0)
0a3d : 85 1b __ STA P0 
0a3f : ad f3 21 LDA $21f3 ; (_row + 0)
0a42 : 85 1c __ STA P1 
0a44 : 4c 52 05 JMP $0552 ; (textGotoXY.s4 + 0)
.s6:
0a47 : c9 0a __ CMP #$0a
0a49 : f0 28 __ BEQ $0a73 ; (textPrint.s9 + 0)
.s7:
0a4b : c9 0d __ CMP #$0d
0a4d : f0 24 __ BEQ $0a73 ; (textPrint.s9 + 0)
.s8:
0a4f : a9 03 __ LDA #$03
0a51 : 85 01 __ STA $01 
0a53 : ad f2 21 LDA $21f2 ; (_col + 0)
0a56 : aa __ __ TAX
0a57 : e8 __ __ INX
0a58 : 8e f2 21 STX $21f2 ; (_col + 0)
0a5b : 85 37 __ STA T2 + 0 
0a5d : a8 __ __ TAY
0a5e : ad ef 21 LDA $21ef ; (_ccolor + 0)
0a61 : 91 35 __ STA (T0 + 0),y 
0a63 : a9 02 __ LDA #$02
0a65 : 85 01 __ STA $01 
0a67 : a4 23 __ LDY P8 ; (message + 0)
0a69 : b1 29 __ LDA (ACCU + 0),y 
0a6b : a4 37 __ LDY T2 + 0 
0a6d : 91 35 __ STA (T0 + 0),y 
0a6f : e4 41 __ CPX T10 + 0 
0a71 : d0 1b __ BNE $0a8e ; (textPrint.s11 + 0)
.s9:
0a73 : ee f3 21 INC $21f3 ; (_row + 0)
0a76 : a9 00 __ LDA #$00
0a78 : 8d f2 21 STA $21f2 ; (_col + 0)
0a7b : ad f3 21 LDA $21f3 ; (_row + 0)
0a7e : cd f1 21 CMP $21f1 ; (_MAX_ROW + 0)
0a81 : f0 14 __ BEQ $0a97 ; (textPrint.s12 + 0)
.s10:
0a83 : 18 __ __ CLC
0a84 : a5 35 __ LDA T0 + 0 
0a86 : 65 3d __ ADC T6 + 0 
0a88 : 85 35 __ STA T0 + 0 
0a8a : 90 02 __ BCC $0a8e ; (textPrint.s11 + 0)
.s40:
0a8c : e6 36 __ INC T0 + 1 
.s11:
0a8e : e6 3e __ INC T7 + 0 
0a90 : d0 93 __ BNE $0a25 ; (textPrint.l38 + 0)
.s39:
0a92 : e6 3f __ INC T7 + 1 
0a94 : 4c 25 0a JMP $0a25 ; (textPrint.l38 + 0)
.s12:
0a97 : 85 40 __ STA T8 + 0 
0a99 : ad f1 21 LDA $21f1 ; (_MAX_ROW + 0)
0a9c : e9 01 __ SBC #$01
0a9e : 85 35 __ STA T0 + 0 
0aa0 : 85 29 __ STA ACCU + 0 
0aa2 : a9 03 __ LDA #$03
0aa4 : 85 01 __ STA $01 
0aa6 : a9 00 __ LDA #$00
0aa8 : e9 00 __ SBC #$00
0aaa : 85 36 __ STA T0 + 1 
0aac : 85 2a __ STA ACCU + 1 
0aae : a5 3d __ LDA T6 + 0 
0ab0 : 20 a9 1c JSR $1ca9 ; (mul16by8 + 0)
0ab3 : a5 2a __ LDA ACCU + 1 
0ab5 : 10 0a __ BPL $0ac1 ; (textPrint.s15 + 0)
.s13:
0ab7 : a9 00 __ LDA #$00
.s14:
0ab9 : 85 2b __ STA ACCU + 2 
0abb : a9 02 __ LDA #$02
0abd : 85 37 __ STA T2 + 0 
0abf : d0 08 __ BNE $0ac9 ; (textPrint.l16 + 0)
.s15:
0ac1 : 05 29 __ ORA ACCU + 0 
0ac3 : f0 f4 __ BEQ $0ab9 ; (textPrint.s14 + 0)
.s29:
0ac5 : a9 01 __ LDA #$01
0ac7 : d0 f0 __ BNE $0ab9 ; (textPrint.s14 + 0)
.l16:
0ac9 : a9 00 __ LDA #$00
0acb : 85 39 __ STA T3 + 0 
0acd : 85 3a __ STA T3 + 1 
0acf : a5 2b __ LDA ACCU + 2 
0ad1 : f0 29 __ BEQ $0afc ; (textPrint.s17 + 0)
.s22:
0ad3 : a2 00 __ LDX #$00
0ad5 : 86 3b __ STX T4 + 0 
0ad7 : a9 c0 __ LDA #$c0
0ad9 : 85 3c __ STA T4 + 1 
.l23:
0adb : a4 3d __ LDY T6 + 0 
0add : b1 3b __ LDA (T4 + 0),y 
0adf : a0 00 __ LDY #$00
0ae1 : 91 3b __ STA (T4 + 0),y 
0ae3 : e6 3b __ INC T4 + 0 
0ae5 : d0 02 __ BNE $0ae9 ; (textPrint.s31 + 0)
.s30:
0ae7 : e6 3c __ INC T4 + 1 
.s31:
0ae9 : e8 __ __ INX
0aea : d0 02 __ BNE $0aee ; (textPrint.s33 + 0)
.s32:
0aec : e6 3a __ INC T3 + 1 
.s33:
0aee : a5 3a __ LDA T3 + 1 
0af0 : c5 2a __ CMP ACCU + 1 
0af2 : 90 e7 __ BCC $0adb ; (textPrint.l23 + 0)
.s41:
0af4 : d0 04 __ BNE $0afa ; (textPrint.s28 + 0)
.s24:
0af6 : e4 29 __ CPX ACCU + 0 
0af8 : 90 e1 __ BCC $0adb ; (textPrint.l23 + 0)
.s28:
0afa : 86 39 __ STX T3 + 0 
.s17:
0afc : a9 02 __ LDA #$02
0afe : 85 01 __ STA $01 
0b00 : c6 37 __ DEC T2 + 0 
0b02 : d0 c5 __ BNE $0ac9 ; (textPrint.l16 + 0)
.s18:
0b04 : a9 03 __ LDA #$03
0b06 : 85 01 __ STA $01 
0b08 : a5 41 __ LDA T10 + 0 
0b0a : d0 06 __ BNE $0b12 ; (textPrint.s21 + 0)
.s19:
0b0c : a9 02 __ LDA #$02
0b0e : 85 01 __ STA $01 
0b10 : d0 3a __ BNE $0b4c ; (textPrint.s20 + 0)
.s21:
0b12 : 18 __ __ CLC
0b13 : a5 3a __ LDA T3 + 1 
0b15 : 69 c0 __ ADC #$c0
0b17 : 85 38 __ STA T2 + 1 
0b19 : 85 3a __ STA T3 + 1 
0b1b : ad ef 21 LDA $21ef ; (_ccolor + 0)
0b1e : 85 3b __ STA T4 + 0 
0b20 : a9 00 __ LDA #$00
0b22 : a4 39 __ LDY T3 + 0 
0b24 : 84 37 __ STY T2 + 0 
0b26 : 85 39 __ STA T3 + 0 
0b28 : a6 3d __ LDX T6 + 0 
.l25:
0b2a : a5 3b __ LDA T4 + 0 
0b2c : 91 39 __ STA (T3 + 0),y 
0b2e : c8 __ __ INY
0b2f : d0 02 __ BNE $0b33 ; (textPrint.s35 + 0)
.s34:
0b31 : e6 3a __ INC T3 + 1 
.s35:
0b33 : ca __ __ DEX
0b34 : d0 f4 __ BNE $0b2a ; (textPrint.l25 + 0)
.s26:
0b36 : a9 02 __ LDA #$02
0b38 : 85 01 __ STA $01 
0b3a : a4 37 __ LDY T2 + 0 
0b3c : 86 37 __ STX T2 + 0 
0b3e : a6 3d __ LDX T6 + 0 
.l27:
0b40 : a9 20 __ LDA #$20
0b42 : 91 37 __ STA (T2 + 0),y 
0b44 : c8 __ __ INY
0b45 : d0 02 __ BNE $0b49 ; (textPrint.s37 + 0)
.s36:
0b47 : e6 38 __ INC T2 + 1 
.s37:
0b49 : ca __ __ DEX
0b4a : d0 f4 __ BNE $0b40 ; (textPrint.l27 + 0)
.s20:
0b4c : a6 40 __ LDX T8 + 0 
0b4e : ca __ __ DEX
0b4f : 8e f3 21 STX $21f3 ; (_row + 0)
0b52 : a5 36 __ LDA T0 + 1 
0b54 : 85 20 __ STA P5 
0b56 : 29 80 __ AND #$80
0b58 : 10 02 __ BPL $0b5c ; (textPrint.s20 + 16)
0b5a : a9 ff __ LDA #$ff
0b5c : 85 21 __ STA P6 
0b5e : 85 22 __ STA P7 
0b60 : a5 35 __ LDA T0 + 0 
0b62 : 85 1f __ STA P4 
0b64 : 20 72 0b JSR $0b72 ; (mathUnsignedAddition.s4 + 0)
0b67 : a5 29 __ LDA ACCU + 0 
0b69 : 85 35 __ STA T0 + 0 
0b6b : a5 2a __ LDA ACCU + 1 
0b6d : 85 36 __ STA T0 + 1 
0b6f : 4c 8e 0a JMP $0a8e ; (textPrint.s11 + 0)
--------------------------------------------------------------------
mathUnsignedAddition: ; mathUnsignedAddition(u32,u32)->u32
;  18, "/mnt/d/F256/f256lib-oscar64/f256lib/f_math.h"
.s4:
0b72 : a5 1b __ LDA P0 ; (a + 0)
0b74 : 8d 08 de STA $de08 
0b77 : a5 1c __ LDA P1 ; (a + 1)
0b79 : 8d 09 de STA $de09 
0b7c : a5 1d __ LDA P2 ; (a + 2)
0b7e : 8d 0a de STA $de0a 
0b81 : a5 1e __ LDA P3 ; (a + 3)
0b83 : 8d 0b de STA $de0b 
0b86 : a5 1f __ LDA P4 ; (b + 0)
0b88 : 8d 0c de STA $de0c 
0b8b : a5 20 __ LDA P5 ; (b + 1)
0b8d : 8d 0d de STA $de0d 
0b90 : a5 21 __ LDA P6 ; (b + 2)
0b92 : 8d 0e de STA $de0e 
0b95 : a5 22 __ LDA P7 ; (b + 3)
0b97 : 8d 0f de STA $de0f 
0b9a : ad 18 de LDA $de18 
0b9d : 85 29 __ STA ACCU + 0 
0b9f : ad 19 de LDA $de19 
0ba2 : 85 2a __ STA ACCU + 1 
0ba4 : ad 1a de LDA $de1a 
0ba7 : 85 2b __ STA ACCU + 2 
0ba9 : ad 1b de LDA $de1b 
0bac : 85 2c __ STA ACCU + 3 
.s3:
0bae : 60 __ __ RTS
--------------------------------------------------------------------
0baf : __ __ __ BYT 0a 31 3a 43 41 4d 20 20 32 3a 42 4f 4e 47 20 20 : .1:CAM  2:BONG  
0bbf : __ __ __ BYT 33 3a 43 4f 49 4e 20 20 34 3a 54 49 45 46 20 20 : 3:COIN  4:TIEF  
0bcf : __ __ __ BYT 35 3a 43 4f 49 4e 20 20 36 3a 43 4f 49 4e 20 20 : 5:COIN  6:COIN  
0bdf : __ __ __ BYT 37 3a 43 4f 49 4e 20 20 38 3a 43 4f 49 4e 0a 00 : 7:COIN  8:COIN..
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
;  18, "/mnt/d/F256/oscar64/include/stdio.h"
.s4:
0bef : a9 01 __ LDA #$01
0bf1 : 8d f5 9f STA $9ff5 ; (sstack + 7)
0bf4 : a9 a4 __ LDA #$a4
0bf6 : 8d ef 9f STA $9fef ; (sstack + 1)
0bf9 : a9 9f __ LDA #$9f
0bfb : 8d f0 9f STA $9ff0 ; (sstack + 2)
0bfe : ad f6 9f LDA $9ff6 ; (sstack + 8)
0c01 : 8d f1 9f STA $9ff1 ; (sstack + 3)
0c04 : ad f7 9f LDA $9ff7 ; (sstack + 9)
0c07 : 8d f2 9f STA $9ff2 ; (sstack + 4)
0c0a : a9 f8 __ LDA #$f8
0c0c : 8d f3 9f STA $9ff3 ; (sstack + 5)
0c0f : a9 9f __ LDA #$9f
0c11 : 8d f4 9f STA $9ff4 ; (sstack + 6)
0c14 : 4c 17 0c JMP $0c17 ; (sformat.s4 + 0)
--------------------------------------------------------------------
sformat: ; sformat(u8*,const u8*,i16*,bool)->u8*
; 351, "/mnt/d/F256/oscar64/include/stdio.c"
.s4:
0c17 : ad f1 9f LDA $9ff1 ; (sstack + 3)
0c1a : 85 4b __ STA T3 + 0 
0c1c : a9 00 __ LDA #$00
0c1e : 85 51 __ STA T6 + 0 
0c20 : ad f2 9f LDA $9ff2 ; (sstack + 4)
0c23 : 85 4c __ STA T3 + 1 
0c25 : ad ef 9f LDA $9fef ; (sstack + 1)
0c28 : 85 4d __ STA T4 + 0 
0c2a : ad f0 9f LDA $9ff0 ; (sstack + 2)
0c2d : 85 4e __ STA T4 + 1 
.l5:
0c2f : a0 00 __ LDY #$00
0c31 : b1 4b __ LDA (T3 + 0),y 
0c33 : d0 2c __ BNE $0c61 ; (sformat.s10 + 0)
.s6:
0c35 : a4 51 __ LDY T6 + 0 
0c37 : 91 4d __ STA (T4 + 0),y 
0c39 : 98 __ __ TYA
0c3a : f0 1e __ BEQ $0c5a ; (sformat.s95 + 0)
.s7:
0c3c : ad f5 9f LDA $9ff5 ; (sstack + 7)
0c3f : d0 0e __ BNE $0c4f ; (sformat.s9 + 0)
.s8:
0c41 : 98 __ __ TYA
0c42 : 18 __ __ CLC
0c43 : 65 4d __ ADC T4 + 0 
0c45 : aa __ __ TAX
0c46 : a5 4e __ LDA T4 + 1 
0c48 : 69 00 __ ADC #$00
.s3:
0c4a : 86 29 __ STX ACCU + 0 ; (buff + 1)
0c4c : 85 2a __ STA ACCU + 1 ; (fmt + 0)
0c4e : 60 __ __ RTS
.s9:
0c4f : a5 4d __ LDA T4 + 0 
0c51 : 85 1c __ STA P1 
0c53 : a5 4e __ LDA T4 + 1 
0c55 : 85 1d __ STA P2 
0c57 : 20 5c 10 JSR $105c ; (puts.l4 + 0)
.s95:
0c5a : a5 4e __ LDA T4 + 1 
0c5c : a6 4d __ LDX T4 + 0 
0c5e : 4c 4a 0c JMP $0c4a ; (sformat.s3 + 0)
.s10:
0c61 : c9 25 __ CMP #$25
0c63 : f0 3e __ BEQ $0ca3 ; (sformat.s15 + 0)
.s11:
0c65 : a4 51 __ LDY T6 + 0 
0c67 : 91 4d __ STA (T4 + 0),y 
0c69 : e6 4b __ INC T3 + 0 
0c6b : d0 02 __ BNE $0c6f ; (sformat.s119 + 0)
.s118:
0c6d : e6 4c __ INC T3 + 1 
.s119:
0c6f : c8 __ __ INY
0c70 : 84 51 __ STY T6 + 0 
0c72 : 98 __ __ TYA
0c73 : c0 28 __ CPY #$28
0c75 : 90 b8 __ BCC $0c2f ; (sformat.l5 + 0)
.s12:
0c77 : 85 35 __ STA T0 + 0 
0c79 : a9 00 __ LDA #$00
0c7b : 85 51 __ STA T6 + 0 
0c7d : ad f5 9f LDA $9ff5 ; (sstack + 7)
0c80 : f0 14 __ BEQ $0c96 ; (sformat.s13 + 0)
.s14:
0c82 : a5 4d __ LDA T4 + 0 
0c84 : 85 1c __ STA P1 
0c86 : a5 4e __ LDA T4 + 1 
0c88 : 85 1d __ STA P2 
0c8a : a9 00 __ LDA #$00
0c8c : a4 35 __ LDY T0 + 0 
0c8e : 91 1c __ STA (P1),y 
0c90 : 20 5c 10 JSR $105c ; (puts.l4 + 0)
0c93 : 4c 2f 0c JMP $0c2f ; (sformat.l5 + 0)
.s13:
0c96 : 18 __ __ CLC
0c97 : a5 4d __ LDA T4 + 0 
0c99 : 65 35 __ ADC T0 + 0 
0c9b : 85 4d __ STA T4 + 0 
0c9d : 90 90 __ BCC $0c2f ; (sformat.l5 + 0)
.s120:
0c9f : e6 4e __ INC T4 + 1 
0ca1 : b0 8c __ BCS $0c2f ; (sformat.l5 + 0)
.s15:
0ca3 : a5 51 __ LDA T6 + 0 
0ca5 : f0 27 __ BEQ $0cce ; (sformat.s16 + 0)
.s89:
0ca7 : 84 51 __ STY T6 + 0 
0ca9 : 85 35 __ STA T0 + 0 
0cab : ad f5 9f LDA $9ff5 ; (sstack + 7)
0cae : f0 13 __ BEQ $0cc3 ; (sformat.s90 + 0)
.s91:
0cb0 : a5 4d __ LDA T4 + 0 
0cb2 : 85 1c __ STA P1 
0cb4 : a5 4e __ LDA T4 + 1 
0cb6 : 85 1d __ STA P2 
0cb8 : 98 __ __ TYA
0cb9 : a4 35 __ LDY T0 + 0 
0cbb : 91 1c __ STA (P1),y 
0cbd : 20 5c 10 JSR $105c ; (puts.l4 + 0)
0cc0 : 4c ce 0c JMP $0cce ; (sformat.s16 + 0)
.s90:
0cc3 : 18 __ __ CLC
0cc4 : a5 4d __ LDA T4 + 0 
0cc6 : 65 35 __ ADC T0 + 0 
0cc8 : 85 4d __ STA T4 + 0 
0cca : 90 02 __ BCC $0cce ; (sformat.s16 + 0)
.s117:
0ccc : e6 4e __ INC T4 + 1 
.s16:
0cce : a9 00 __ LDA #$00
0cd0 : 8d db 9f STA $9fdb ; (si.sign + 0)
0cd3 : 8d dc 9f STA $9fdc ; (si.left + 0)
0cd6 : 8d dd 9f STA $9fdd ; (si.prefix + 0)
0cd9 : a0 01 __ LDY #$01
0cdb : b1 4b __ LDA (T3 + 0),y 
0cdd : a2 20 __ LDX #$20
0cdf : 8e d6 9f STX $9fd6 ; (si.fill + 0)
0ce2 : a2 00 __ LDX #$00
0ce4 : 8e d7 9f STX $9fd7 ; (si.width + 0)
0ce7 : ca __ __ DEX
0ce8 : 8e d8 9f STX $9fd8 ; (si.precision + 0)
0ceb : a2 0a __ LDX #$0a
0ced : 8e da 9f STX $9fda ; (si.base + 0)
0cf0 : aa __ __ TAX
0cf1 : a9 02 __ LDA #$02
0cf3 : d0 07 __ BNE $0cfc ; (sformat.l17 + 0)
.s85:
0cf5 : a0 00 __ LDY #$00
0cf7 : b1 4b __ LDA (T3 + 0),y 
0cf9 : aa __ __ TAX
0cfa : a9 01 __ LDA #$01
.l17:
0cfc : 18 __ __ CLC
0cfd : 65 4b __ ADC T3 + 0 
0cff : 85 4b __ STA T3 + 0 
0d01 : 90 02 __ BCC $0d05 ; (sformat.s106 + 0)
.s105:
0d03 : e6 4c __ INC T3 + 1 
.s106:
0d05 : 8a __ __ TXA
0d06 : e0 2b __ CPX #$2b
0d08 : d0 07 __ BNE $0d11 ; (sformat.s18 + 0)
.s88:
0d0a : a9 01 __ LDA #$01
0d0c : 8d db 9f STA $9fdb ; (si.sign + 0)
0d0f : d0 e4 __ BNE $0cf5 ; (sformat.s85 + 0)
.s18:
0d11 : c9 30 __ CMP #$30
0d13 : d0 06 __ BNE $0d1b ; (sformat.s19 + 0)
.s87:
0d15 : 8d d6 9f STA $9fd6 ; (si.fill + 0)
0d18 : 4c f5 0c JMP $0cf5 ; (sformat.s85 + 0)
.s19:
0d1b : c9 23 __ CMP #$23
0d1d : d0 07 __ BNE $0d26 ; (sformat.s20 + 0)
.s86:
0d1f : a9 01 __ LDA #$01
0d21 : 8d dd 9f STA $9fdd ; (si.prefix + 0)
0d24 : d0 cf __ BNE $0cf5 ; (sformat.s85 + 0)
.s20:
0d26 : c9 2d __ CMP #$2d
0d28 : d0 07 __ BNE $0d31 ; (sformat.s21 + 0)
.s84:
0d2a : a9 01 __ LDA #$01
0d2c : 8d dc 9f STA $9fdc ; (si.left + 0)
0d2f : d0 c4 __ BNE $0cf5 ; (sformat.s85 + 0)
.s21:
0d31 : 85 39 __ STA T2 + 0 
0d33 : c9 30 __ CMP #$30
0d35 : 90 3c __ BCC $0d73 ; (sformat.s22 + 0)
.s80:
0d37 : c9 3a __ CMP #$3a
0d39 : b0 77 __ BCS $0db2 ; (sformat.s23 + 0)
.s81:
0d3b : a9 00 __ LDA #$00
0d3d : 85 49 __ STA T1 + 0 
.l82:
0d3f : a5 49 __ LDA T1 + 0 
0d41 : 0a __ __ ASL
0d42 : 85 29 __ STA ACCU + 0 ; (buff + 1)
0d44 : a9 00 __ LDA #$00
0d46 : 2a __ __ ROL
0d47 : 06 29 __ ASL ACCU + 0 ; (buff + 1)
0d49 : 2a __ __ ROL
0d4a : aa __ __ TAX
0d4b : a5 29 __ LDA ACCU + 0 ; (buff + 1)
0d4d : 65 49 __ ADC T1 + 0 
0d4f : 0a __ __ ASL
0d50 : 18 __ __ CLC
0d51 : 65 39 __ ADC T2 + 0 
0d53 : 38 __ __ SEC
0d54 : e9 30 __ SBC #$30
0d56 : 85 49 __ STA T1 + 0 
0d58 : a0 00 __ LDY #$00
0d5a : b1 4b __ LDA (T3 + 0),y 
0d5c : 85 39 __ STA T2 + 0 
0d5e : e6 4b __ INC T3 + 0 
0d60 : d0 02 __ BNE $0d64 ; (sformat.s116 + 0)
.s115:
0d62 : e6 4c __ INC T3 + 1 
.s116:
0d64 : c9 30 __ CMP #$30
0d66 : 90 04 __ BCC $0d6c ; (sformat.s104 + 0)
.s83:
0d68 : c9 3a __ CMP #$3a
0d6a : 90 d3 __ BCC $0d3f ; (sformat.l82 + 0)
.s104:
0d6c : 86 2a __ STX ACCU + 1 ; (fmt + 0)
0d6e : a6 49 __ LDX T1 + 0 
0d70 : 8e d7 9f STX $9fd7 ; (si.width + 0)
.s22:
0d73 : c9 2e __ CMP #$2e
0d75 : d0 3b __ BNE $0db2 ; (sformat.s23 + 0)
.s76:
0d77 : a9 00 __ LDA #$00
0d79 : a6 2a __ LDX ACCU + 1 ; (fmt + 0)
0d7b : 4c 95 0d JMP $0d95 ; (sformat.l77 + 0)
.s79:
0d7e : a5 35 __ LDA T0 + 0 
0d80 : 0a __ __ ASL
0d81 : 85 29 __ STA ACCU + 0 ; (buff + 1)
0d83 : 98 __ __ TYA
0d84 : 2a __ __ ROL
0d85 : 06 29 __ ASL ACCU + 0 ; (buff + 1)
0d87 : 2a __ __ ROL
0d88 : aa __ __ TAX
0d89 : 18 __ __ CLC
0d8a : a5 29 __ LDA ACCU + 0 ; (buff + 1)
0d8c : 65 35 __ ADC T0 + 0 
0d8e : 0a __ __ ASL
0d8f : 18 __ __ CLC
0d90 : 65 39 __ ADC T2 + 0 
0d92 : 38 __ __ SEC
0d93 : e9 30 __ SBC #$30
.l77:
0d95 : 85 35 __ STA T0 + 0 
0d97 : a0 00 __ LDY #$00
0d99 : b1 4b __ LDA (T3 + 0),y 
0d9b : 85 39 __ STA T2 + 0 
0d9d : e6 4b __ INC T3 + 0 
0d9f : d0 02 __ BNE $0da3 ; (sformat.s108 + 0)
.s107:
0da1 : e6 4c __ INC T3 + 1 
.s108:
0da3 : c9 30 __ CMP #$30
0da5 : 90 04 __ BCC $0dab ; (sformat.s103 + 0)
.s78:
0da7 : c9 3a __ CMP #$3a
0da9 : 90 d3 __ BCC $0d7e ; (sformat.s79 + 0)
.s103:
0dab : 86 2a __ STX ACCU + 1 ; (fmt + 0)
0dad : a6 35 __ LDX T0 + 0 
0daf : 8e d8 9f STX $9fd8 ; (si.precision + 0)
.s23:
0db2 : c9 64 __ CMP #$64
0db4 : f0 0c __ BEQ $0dc2 ; (sformat.s75 + 0)
.s24:
0db6 : c9 44 __ CMP #$44
0db8 : f0 08 __ BEQ $0dc2 ; (sformat.s75 + 0)
.s25:
0dba : c9 69 __ CMP #$69
0dbc : f0 04 __ BEQ $0dc2 ; (sformat.s75 + 0)
.s26:
0dbe : c9 49 __ CMP #$49
0dc0 : d0 07 __ BNE $0dc9 ; (sformat.s27 + 0)
.s75:
0dc2 : a9 01 __ LDA #$01
.s93:
0dc4 : 85 21 __ STA P6 
0dc6 : 4c 22 10 JMP $1022 ; (sformat.s73 + 0)
.s27:
0dc9 : c9 75 __ CMP #$75
0dcb : f0 04 __ BEQ $0dd1 ; (sformat.s74 + 0)
.s28:
0dcd : c9 55 __ CMP #$55
0dcf : d0 04 __ BNE $0dd5 ; (sformat.s29 + 0)
.s74:
0dd1 : a9 00 __ LDA #$00
0dd3 : f0 ef __ BEQ $0dc4 ; (sformat.s93 + 0)
.s29:
0dd5 : c9 78 __ CMP #$78
0dd7 : f0 04 __ BEQ $0ddd ; (sformat.s72 + 0)
.s30:
0dd9 : c9 58 __ CMP #$58
0ddb : d0 15 __ BNE $0df2 ; (sformat.s31 + 0)
.s72:
0ddd : a5 39 __ LDA T2 + 0 
0ddf : 29 e0 __ AND #$e0
0de1 : 09 01 __ ORA #$01
0de3 : 8d d9 9f STA $9fd9 ; (si.cha + 0)
0de6 : a9 00 __ LDA #$00
0de8 : 85 21 __ STA P6 
0dea : a9 10 __ LDA #$10
0dec : 8d da 9f STA $9fda ; (si.base + 0)
0def : 4c 22 10 JMP $1022 ; (sformat.s73 + 0)
.s31:
0df2 : c9 6c __ CMP #$6c
0df4 : d0 03 __ BNE $0df9 ; (sformat.s32 + 0)
0df6 : 4c 91 0f JMP $0f91 ; (sformat.s60 + 0)
.s32:
0df9 : c9 4c __ CMP #$4c
0dfb : f0 f9 __ BEQ $0df6 ; (sformat.s31 + 4)
.s33:
0dfd : aa __ __ TAX
0dfe : c9 66 __ CMP #$66
0e00 : d0 03 __ BNE $0e05 ; (sformat.s34 + 0)
0e02 : 4c 26 0f JMP $0f26 ; (sformat.s59 + 0)
.s34:
0e05 : c9 67 __ CMP #$67
0e07 : f0 f9 __ BEQ $0e02 ; (sformat.s33 + 5)
.s35:
0e09 : c9 65 __ CMP #$65
0e0b : f0 f5 __ BEQ $0e02 ; (sformat.s33 + 5)
.s36:
0e0d : c9 46 __ CMP #$46
0e0f : f0 f1 __ BEQ $0e02 ; (sformat.s33 + 5)
.s37:
0e11 : c9 47 __ CMP #$47
0e13 : f0 ed __ BEQ $0e02 ; (sformat.s33 + 5)
.s38:
0e15 : c9 45 __ CMP #$45
0e17 : f0 e9 __ BEQ $0e02 ; (sformat.s33 + 5)
.s39:
0e19 : c9 73 __ CMP #$73
0e1b : f0 3e __ BEQ $0e5b ; (sformat.s47 + 0)
.s40:
0e1d : c9 53 __ CMP #$53
0e1f : f0 3a __ BEQ $0e5b ; (sformat.s47 + 0)
.s41:
0e21 : c9 63 __ CMP #$63
0e23 : f0 15 __ BEQ $0e3a ; (sformat.s46 + 0)
.s42:
0e25 : c9 43 __ CMP #$43
0e27 : f0 11 __ BEQ $0e3a ; (sformat.s46 + 0)
.s43:
0e29 : aa __ __ TAX
0e2a : d0 03 __ BNE $0e2f ; (sformat.s44 + 0)
0e2c : 4c 2f 0c JMP $0c2f ; (sformat.l5 + 0)
.s44:
0e2f : a0 00 __ LDY #$00
0e31 : 91 4d __ STA (T4 + 0),y 
.s45:
0e33 : a9 01 __ LDA #$01
.s96:
0e35 : 85 51 __ STA T6 + 0 
0e37 : 4c 2f 0c JMP $0c2f ; (sformat.l5 + 0)
.s46:
0e3a : ad f3 9f LDA $9ff3 ; (sstack + 5)
0e3d : 85 35 __ STA T0 + 0 
0e3f : ad f4 9f LDA $9ff4 ; (sstack + 6)
0e42 : 85 36 __ STA T0 + 1 
0e44 : a0 00 __ LDY #$00
0e46 : b1 35 __ LDA (T0 + 0),y 
0e48 : 91 4d __ STA (T4 + 0),y 
0e4a : a5 35 __ LDA T0 + 0 
0e4c : 69 01 __ ADC #$01
0e4e : 8d f3 9f STA $9ff3 ; (sstack + 5)
0e51 : a5 36 __ LDA T0 + 1 
0e53 : 69 00 __ ADC #$00
0e55 : 8d f4 9f STA $9ff4 ; (sstack + 6)
0e58 : 4c 33 0e JMP $0e33 ; (sformat.s45 + 0)
.s47:
0e5b : ad f3 9f LDA $9ff3 ; (sstack + 5)
0e5e : 85 35 __ STA T0 + 0 
0e60 : 69 01 __ ADC #$01
0e62 : 8d f3 9f STA $9ff3 ; (sstack + 5)
0e65 : ad f4 9f LDA $9ff4 ; (sstack + 6)
0e68 : 85 36 __ STA T0 + 1 
0e6a : 69 00 __ ADC #$00
0e6c : 8d f4 9f STA $9ff4 ; (sstack + 6)
0e6f : a0 00 __ LDY #$00
0e71 : 84 52 __ STY T7 + 0 
0e73 : b1 35 __ LDA (T0 + 0),y 
0e75 : 85 29 __ STA ACCU + 0 ; (buff + 1)
0e77 : 85 49 __ STA T1 + 0 
0e79 : c8 __ __ INY
0e7a : b1 35 __ LDA (T0 + 0),y 
0e7c : 85 2a __ STA ACCU + 1 ; (fmt + 0)
0e7e : 85 4a __ STA T1 + 1 
0e80 : ad d7 9f LDA $9fd7 ; (si.width + 0)
0e83 : f0 0c __ BEQ $0e91 ; (sformat.s48 + 0)
.s100:
0e85 : 88 __ __ DEY
0e86 : b1 29 __ LDA (ACCU + 0),y ; (buff + 1)
0e88 : f0 05 __ BEQ $0e8f ; (sformat.s101 + 0)
.l58:
0e8a : c8 __ __ INY
0e8b : b1 29 __ LDA (ACCU + 0),y ; (buff + 1)
0e8d : d0 fb __ BNE $0e8a ; (sformat.l58 + 0)
.s101:
0e8f : 84 52 __ STY T7 + 0 
.s48:
0e91 : ad dc 9f LDA $9fdc ; (si.left + 0)
0e94 : 85 4f __ STA T5 + 0 
0e96 : d0 19 __ BNE $0eb1 ; (sformat.s49 + 0)
.s98:
0e98 : a6 52 __ LDX T7 + 0 
0e9a : ec d7 9f CPX $9fd7 ; (si.width + 0)
0e9d : a0 00 __ LDY #$00
0e9f : b0 0c __ BCS $0ead ; (sformat.s99 + 0)
.l57:
0ea1 : ad d6 9f LDA $9fd6 ; (si.fill + 0)
0ea4 : 91 4d __ STA (T4 + 0),y 
0ea6 : c8 __ __ INY
0ea7 : e8 __ __ INX
0ea8 : ec d7 9f CPX $9fd7 ; (si.width + 0)
0eab : 90 f4 __ BCC $0ea1 ; (sformat.l57 + 0)
.s99:
0ead : 86 52 __ STX T7 + 0 
0eaf : 84 51 __ STY T6 + 0 
.s49:
0eb1 : ac f5 9f LDY $9ff5 ; (sstack + 7)
0eb4 : d0 48 __ BNE $0efe ; (sformat.s54 + 0)
.s50:
0eb6 : b1 29 __ LDA (ACCU + 0),y ; (buff + 1)
0eb8 : f0 23 __ BEQ $0edd ; (sformat.s51 + 0)
.s53:
0eba : 18 __ __ CLC
0ebb : a5 29 __ LDA ACCU + 0 ; (buff + 1)
0ebd : 69 01 __ ADC #$01
0ebf : 85 35 __ STA T0 + 0 
0ec1 : a5 2a __ LDA ACCU + 1 ; (fmt + 0)
0ec3 : 69 00 __ ADC #$00
0ec5 : 85 36 __ STA T0 + 1 
0ec7 : b1 29 __ LDA (ACCU + 0),y ; (buff + 1)
.l92:
0ec9 : a4 51 __ LDY T6 + 0 
0ecb : 91 4d __ STA (T4 + 0),y 
0ecd : e6 51 __ INC T6 + 0 
0ecf : a0 00 __ LDY #$00
0ed1 : b1 35 __ LDA (T0 + 0),y 
0ed3 : a8 __ __ TAY
0ed4 : e6 35 __ INC T0 + 0 
0ed6 : d0 02 __ BNE $0eda ; (sformat.s114 + 0)
.s113:
0ed8 : e6 36 __ INC T0 + 1 
.s114:
0eda : 98 __ __ TYA
0edb : d0 ec __ BNE $0ec9 ; (sformat.l92 + 0)
.s51:
0edd : a5 4f __ LDA T5 + 0 
0edf : d0 03 __ BNE $0ee4 ; (sformat.s97 + 0)
0ee1 : 4c 2f 0c JMP $0c2f ; (sformat.l5 + 0)
.s97:
0ee4 : a6 52 __ LDX T7 + 0 
0ee6 : ec d7 9f CPX $9fd7 ; (si.width + 0)
0ee9 : a4 51 __ LDY T6 + 0 
0eeb : b0 0c __ BCS $0ef9 ; (sformat.s102 + 0)
.l52:
0eed : ad d6 9f LDA $9fd6 ; (si.fill + 0)
0ef0 : 91 4d __ STA (T4 + 0),y 
0ef2 : c8 __ __ INY
0ef3 : e8 __ __ INX
0ef4 : ec d7 9f CPX $9fd7 ; (si.width + 0)
0ef7 : 90 f4 __ BCC $0eed ; (sformat.l52 + 0)
.s102:
0ef9 : 84 51 __ STY T6 + 0 
0efb : 4c 2f 0c JMP $0c2f ; (sformat.l5 + 0)
.s54:
0efe : a4 51 __ LDY T6 + 0 
0f00 : f0 11 __ BEQ $0f13 ; (sformat.s55 + 0)
.s56:
0f02 : a5 4d __ LDA T4 + 0 
0f04 : 85 1c __ STA P1 
0f06 : a5 4e __ LDA T4 + 1 
0f08 : 85 1d __ STA P2 
0f0a : a9 00 __ LDA #$00
0f0c : 85 51 __ STA T6 + 0 
0f0e : 91 1c __ STA (P1),y 
0f10 : 20 5c 10 JSR $105c ; (puts.l4 + 0)
.s55:
0f13 : a5 49 __ LDA T1 + 0 
0f15 : 85 1c __ STA P1 
0f17 : a5 4a __ LDA T1 + 1 
0f19 : 85 1d __ STA P2 
0f1b : 20 5c 10 JSR $105c ; (puts.l4 + 0)
0f1e : ad dc 9f LDA $9fdc ; (si.left + 0)
0f21 : d0 c1 __ BNE $0ee4 ; (sformat.s97 + 0)
0f23 : 4c 2f 0c JMP $0c2f ; (sformat.l5 + 0)
.s59:
0f26 : a5 4d __ LDA T4 + 0 
0f28 : 85 21 __ STA P6 
0f2a : a5 4e __ LDA T4 + 1 
0f2c : 85 22 __ STA P7 
0f2e : 8a __ __ TXA
0f2f : 29 e0 __ AND #$e0
0f31 : 09 01 __ ORA #$01
0f33 : 85 39 __ STA T2 + 0 
0f35 : 8d d9 9f STA $9fd9 ; (si.cha + 0)
0f38 : a9 d6 __ LDA #$d6
0f3a : 85 1f __ STA P4 
0f3c : a9 9f __ LDA #$9f
0f3e : 85 20 __ STA P5 
0f40 : ad f3 9f LDA $9ff3 ; (sstack + 5)
0f43 : 85 4f __ STA T5 + 0 
0f45 : ad f4 9f LDA $9ff4 ; (sstack + 6)
0f48 : 85 50 __ STA T5 + 1 
0f4a : a0 00 __ LDY #$00
0f4c : 84 3a __ STY T2 + 1 
0f4e : b1 4f __ LDA (T5 + 0),y 
0f50 : 85 23 __ STA P8 
0f52 : c8 __ __ INY
0f53 : b1 4f __ LDA (T5 + 0),y 
0f55 : 85 24 __ STA P9 
0f57 : c8 __ __ INY
0f58 : b1 4f __ LDA (T5 + 0),y 
0f5a : 85 25 __ STA P10 
0f5c : c8 __ __ INY
0f5d : b1 4f __ LDA (T5 + 0),y 
0f5f : 85 26 __ STA P11 
0f61 : 8a __ __ TXA
0f62 : e5 39 __ SBC T2 + 0 
0f64 : aa __ __ TAX
0f65 : a9 00 __ LDA #$00
0f67 : e9 00 __ SBC #$00
0f69 : a8 __ __ TAY
0f6a : 8a __ __ TXA
0f6b : 18 __ __ CLC
0f6c : 69 61 __ ADC #$61
0f6e : 85 35 __ STA T0 + 0 
0f70 : 8d ee 9f STA $9fee ; (sstack + 0)
0f73 : 90 01 __ BCC $0f76 ; (sformat.s112 + 0)
.s111:
0f75 : c8 __ __ INY
.s112:
0f76 : 84 36 __ STY T0 + 1 
0f78 : 20 f6 14 JSR $14f6 ; (nformf.s4 + 0)
0f7b : a5 29 __ LDA ACCU + 0 ; (buff + 1)
0f7d : 85 51 __ STA T6 + 0 
0f7f : 18 __ __ CLC
0f80 : a5 4f __ LDA T5 + 0 
0f82 : 69 04 __ ADC #$04
0f84 : 8d f3 9f STA $9ff3 ; (sstack + 5)
0f87 : a5 50 __ LDA T5 + 1 
0f89 : 69 00 __ ADC #$00
0f8b : 8d f4 9f STA $9ff4 ; (sstack + 6)
0f8e : 4c 2f 0c JMP $0c2f ; (sformat.l5 + 0)
.s60:
0f91 : ad f3 9f LDA $9ff3 ; (sstack + 5)
0f94 : 85 35 __ STA T0 + 0 
0f96 : 69 03 __ ADC #$03
0f98 : 8d f3 9f STA $9ff3 ; (sstack + 5)
0f9b : ad f4 9f LDA $9ff4 ; (sstack + 6)
0f9e : 85 36 __ STA T0 + 1 
0fa0 : 69 00 __ ADC #$00
0fa2 : 8d f4 9f STA $9ff4 ; (sstack + 6)
0fa5 : a0 00 __ LDY #$00
0fa7 : b1 4b __ LDA (T3 + 0),y 
0fa9 : aa __ __ TAX
0faa : e6 4b __ INC T3 + 0 
0fac : d0 02 __ BNE $0fb0 ; (sformat.s110 + 0)
.s109:
0fae : e6 4c __ INC T3 + 1 
.s110:
0fb0 : b1 35 __ LDA (T0 + 0),y 
0fb2 : 85 29 __ STA ACCU + 0 ; (buff + 1)
0fb4 : 85 1f __ STA P4 
0fb6 : a0 01 __ LDY #$01
0fb8 : b1 35 __ LDA (T0 + 0),y 
0fba : 85 2a __ STA ACCU + 1 ; (fmt + 0)
0fbc : 85 20 __ STA P5 
0fbe : c8 __ __ INY
0fbf : b1 35 __ LDA (T0 + 0),y 
0fc1 : 85 2b __ STA ACCU + 2 ; (fmt + 1)
0fc3 : 85 21 __ STA P6 
0fc5 : 85 37 __ STA T0 + 2 
0fc7 : c8 __ __ INY
0fc8 : b1 35 __ LDA (T0 + 0),y 
0fca : 85 22 __ STA P7 
0fcc : 85 38 __ STA T0 + 3 
0fce : e0 64 __ CPX #$64
0fd0 : f0 0c __ BEQ $0fde ; (sformat.s71 + 0)
.s61:
0fd2 : e0 44 __ CPX #$44
0fd4 : f0 08 __ BEQ $0fde ; (sformat.s71 + 0)
.s62:
0fd6 : e0 69 __ CPX #$69
0fd8 : f0 04 __ BEQ $0fde ; (sformat.s71 + 0)
.s63:
0fda : e0 49 __ CPX #$49
0fdc : d0 1a __ BNE $0ff8 ; (sformat.s64 + 0)
.s71:
0fde : a9 01 __ LDA #$01
.s94:
0fe0 : 85 23 __ STA P8 
.s69:
0fe2 : a5 4d __ LDA T4 + 0 
0fe4 : 85 1d __ STA P2 
0fe6 : a5 4e __ LDA T4 + 1 
0fe8 : 85 1e __ STA P3 
0fea : a9 d6 __ LDA #$d6
0fec : 85 1b __ STA P0 
0fee : a9 9f __ LDA #$9f
0ff0 : 85 1c __ STA P1 
0ff2 : 20 aa 13 JSR $13aa ; (nforml.s4 + 0)
0ff5 : 4c 35 0e JMP $0e35 ; (sformat.s96 + 0)
.s64:
0ff8 : e0 75 __ CPX #$75
0ffa : f0 04 __ BEQ $1000 ; (sformat.s70 + 0)
.s65:
0ffc : e0 55 __ CPX #$55
0ffe : d0 04 __ BNE $1004 ; (sformat.s66 + 0)
.s70:
1000 : a9 00 __ LDA #$00
1002 : f0 dc __ BEQ $0fe0 ; (sformat.s94 + 0)
.s66:
1004 : e0 78 __ CPX #$78
1006 : f0 06 __ BEQ $100e ; (sformat.s68 + 0)
.s67:
1008 : 85 2c __ STA ACCU + 3 ; (fps + 0)
100a : e0 58 __ CPX #$58
100c : d0 80 __ BNE $0f8e ; (sformat.s112 + 24)
.s68:
100e : a9 00 __ LDA #$00
1010 : 85 23 __ STA P8 
1012 : a9 10 __ LDA #$10
1014 : 8d da 9f STA $9fda ; (si.base + 0)
1017 : 8a __ __ TXA
1018 : 29 e0 __ AND #$e0
101a : 09 01 __ ORA #$01
101c : 8d d9 9f STA $9fd9 ; (si.cha + 0)
101f : 4c e2 0f JMP $0fe2 ; (sformat.s69 + 0)
.s73:
1022 : a5 4d __ LDA T4 + 0 
1024 : 85 1d __ STA P2 
1026 : a5 4e __ LDA T4 + 1 
1028 : 85 1e __ STA P3 
102a : ad f3 9f LDA $9ff3 ; (sstack + 5)
102d : 85 35 __ STA T0 + 0 
102f : ad f4 9f LDA $9ff4 ; (sstack + 6)
1032 : 85 36 __ STA T0 + 1 
1034 : a0 00 __ LDY #$00
1036 : b1 35 __ LDA (T0 + 0),y 
1038 : 85 1f __ STA P4 
103a : c8 __ __ INY
103b : b1 35 __ LDA (T0 + 0),y 
103d : 85 20 __ STA P5 
103f : 18 __ __ CLC
1040 : a5 35 __ LDA T0 + 0 
1042 : 69 02 __ ADC #$02
1044 : 8d f3 9f STA $9ff3 ; (sstack + 5)
1047 : a5 36 __ LDA T0 + 1 
1049 : 69 00 __ ADC #$00
104b : 8d f4 9f STA $9ff4 ; (sstack + 6)
104e : a9 d6 __ LDA #$d6
1050 : 85 1b __ STA P0 
1052 : a9 9f __ LDA #$9f
1054 : 85 1c __ STA P1 
1056 : 20 8f 12 JSR $128f ; (nformi.s4 + 0)
1059 : 4c 35 0e JMP $0e35 ; (sformat.s96 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
;  12, "/mnt/d/F256/oscar64/include/stdio.h"
.l4:
105c : a0 00 __ LDY #$00
105e : b1 1c __ LDA (P1),y ; (str + 0)
1060 : d0 01 __ BNE $1063 ; (puts.s5 + 0)
.s3:
1062 : 60 __ __ RTS
.s5:
1063 : 85 1b __ STA P0 
1065 : e6 1c __ INC P1 ; (str + 0)
1067 : d0 02 __ BNE $106b ; (puts.s7 + 0)
.s6:
1069 : e6 1d __ INC P2 ; (str + 1)
.s7:
106b : 20 71 10 JSR $1071 ; (putpch.s4 + 0)
106e : 4c 5c 10 JMP $105c ; (puts.l4 + 0)
--------------------------------------------------------------------
putpch: ; putpch(u8)->void
;  69, "/mnt/d/F256/oscar64/include/conio.h"
.s4:
1071 : a5 1b __ LDA P0 ; (c + 0)
1073 : c9 0a __ CMP #$0a
1075 : d0 03 __ BNE $107a ; (putpch.s5 + 0)
1077 : 4c fa 11 JMP $11fa ; (putpch.s20 + 0)
.s5:
107a : c9 0d __ CMP #$0d
107c : f0 f9 __ BEQ $1077 ; (putpch.s4 + 6)
.s6:
107e : c9 09 __ CMP #$09
1080 : d0 0d __ BNE $108f ; (putpch.s7 + 0)
.s13:
1082 : ad 14 d0 LDA $d014 
1085 : 29 03 __ AND #$03
1087 : 85 3b __ STA T3 + 0 
1089 : ad 15 d0 LDA $d015 
108c : 4c 3f 11 JMP $113f ; (putpch.l14 + 0)
.s7:
108f : a5 01 __ LDA $01 
1091 : 85 3c __ STA T5 + 0 
1093 : a9 00 __ LDA #$00
1095 : 85 01 __ STA $01 
1097 : ad 14 d0 LDA $d014 
109a : 85 35 __ STA T0 + 0 
109c : ad 15 d0 LDA $d015 
109f : 85 36 __ STA T0 + 1 
10a1 : ad 16 d0 LDA $d016 
10a4 : 85 37 __ STA T1 + 0 
10a6 : 0a __ __ ASL
10a7 : 85 29 __ STA ACCU + 0 
10a9 : ad 17 d0 LDA $d017 
10ac : 85 38 __ STA T1 + 1 
10ae : 2a __ __ ROL
10af : 06 29 __ ASL ACCU + 0 
10b1 : 2a __ __ ROL
10b2 : aa __ __ TAX
10b3 : a9 03 __ LDA #$03
10b5 : 85 01 __ STA $01 
10b7 : 18 __ __ CLC
10b8 : a5 29 __ LDA ACCU + 0 
10ba : 65 37 __ ADC T1 + 0 
10bc : 85 39 __ STA T2 + 0 
10be : 8a __ __ TXA
10bf : 65 38 __ ADC T1 + 1 
10c1 : 06 39 __ ASL T2 + 0 
10c3 : 2a __ __ ROL
10c4 : 06 39 __ ASL T2 + 0 
10c6 : 2a __ __ ROL
10c7 : 06 39 __ ASL T2 + 0 
10c9 : 2a __ __ ROL
10ca : 06 39 __ ASL T2 + 0 
10cc : 2a __ __ ROL
10cd : aa __ __ TAX
10ce : 18 __ __ CLC
10cf : a5 39 __ LDA T2 + 0 
10d1 : 65 35 __ ADC T0 + 0 
10d3 : 85 39 __ STA T2 + 0 
10d5 : 8a __ __ TXA
10d6 : 65 36 __ ADC T0 + 1 
10d8 : 18 __ __ CLC
10d9 : 69 c0 __ ADC #$c0
10db : 85 3a __ STA T2 + 1 
10dd : ad f4 21 LDA $21f4 ; (f256k_color + 0)
10e0 : a0 00 __ LDY #$00
10e2 : 91 39 __ STA (T2 + 0),y 
10e4 : a9 02 __ LDA #$02
10e6 : 85 01 __ STA $01 
10e8 : a5 1b __ LDA P0 ; (c + 0)
10ea : 91 39 __ STA (T2 + 0),y 
10ec : 18 __ __ CLC
10ed : a5 35 __ LDA T0 + 0 
10ef : 69 01 __ ADC #$01
10f1 : 85 35 __ STA T0 + 0 
10f3 : a5 36 __ LDA T0 + 1 
10f5 : 69 00 __ ADC #$00
10f7 : d0 0c __ BNE $1105 ; (putpch.s9 + 0)
.s12:
10f9 : a5 37 __ LDA T1 + 0 
10fb : 85 39 __ STA T2 + 0 
10fd : a5 35 __ LDA T0 + 0 
10ff : c9 50 __ CMP #$50
1101 : a6 38 __ LDX T1 + 1 
1103 : 90 1f __ BCC $1124 ; (putpch.s8 + 0)
.s9:
1105 : 84 35 __ STY T0 + 0 
1107 : 18 __ __ CLC
1108 : a5 37 __ LDA T1 + 0 
110a : 69 01 __ ADC #$01
110c : 85 39 __ STA T2 + 0 
110e : a5 38 __ LDA T1 + 1 
1110 : 69 00 __ ADC #$00
1112 : d0 07 __ BNE $111b ; (putpch.s10 + 0)
.s11:
1114 : aa __ __ TAX
1115 : a5 39 __ LDA T2 + 0 
1117 : c9 1e __ CMP #$1e
1119 : 90 09 __ BCC $1124 ; (putpch.s8 + 0)
.s10:
111b : 20 2b 12 JSR $122b ; (f256k_scroll.s4 + 0)
111e : a9 1d __ LDA #$1d
1120 : 85 39 __ STA T2 + 0 
1122 : a2 00 __ LDX #$00
.s8:
1124 : a9 00 __ LDA #$00
1126 : 85 01 __ STA $01 
1128 : a5 35 __ LDA T0 + 0 
112a : 8d 14 d0 STA $d014 
112d : a9 00 __ LDA #$00
112f : 8d 15 d0 STA $d015 
1132 : a5 39 __ LDA T2 + 0 
1134 : 8d 16 d0 STA $d016 
1137 : 8e 17 d0 STX $d017 
113a : a5 3c __ LDA T5 + 0 
.s24:
113c : 85 01 __ STA $01 
.s3:
113e : 60 __ __ RTS
.l14:
113f : a5 01 __ LDA $01 
1141 : 85 3c __ STA T5 + 0 
1143 : a9 00 __ LDA #$00
1145 : 85 01 __ STA $01 
1147 : ad 14 d0 LDA $d014 
114a : 85 35 __ STA T0 + 0 
114c : ad 15 d0 LDA $d015 
114f : 85 36 __ STA T0 + 1 
1151 : ad 16 d0 LDA $d016 
1154 : 85 37 __ STA T1 + 0 
1156 : 0a __ __ ASL
1157 : 85 29 __ STA ACCU + 0 
1159 : ad 17 d0 LDA $d017 
115c : 85 38 __ STA T1 + 1 
115e : 2a __ __ ROL
115f : 06 29 __ ASL ACCU + 0 
1161 : 2a __ __ ROL
1162 : aa __ __ TAX
1163 : a9 03 __ LDA #$03
1165 : 85 01 __ STA $01 
1167 : 18 __ __ CLC
1168 : a5 29 __ LDA ACCU + 0 
116a : 65 37 __ ADC T1 + 0 
116c : 85 39 __ STA T2 + 0 
116e : 8a __ __ TXA
116f : 65 38 __ ADC T1 + 1 
1171 : 06 39 __ ASL T2 + 0 
1173 : 2a __ __ ROL
1174 : 06 39 __ ASL T2 + 0 
1176 : 2a __ __ ROL
1177 : 06 39 __ ASL T2 + 0 
1179 : 2a __ __ ROL
117a : 06 39 __ ASL T2 + 0 
117c : 2a __ __ ROL
117d : aa __ __ TAX
117e : 18 __ __ CLC
117f : a5 39 __ LDA T2 + 0 
1181 : 65 35 __ ADC T0 + 0 
1183 : 85 39 __ STA T2 + 0 
1185 : 8a __ __ TXA
1186 : 65 36 __ ADC T0 + 1 
1188 : 18 __ __ CLC
1189 : 69 c0 __ ADC #$c0
118b : 85 3a __ STA T2 + 1 
118d : ad f4 21 LDA $21f4 ; (f256k_color + 0)
1190 : a0 00 __ LDY #$00
1192 : 91 39 __ STA (T2 + 0),y 
1194 : a9 02 __ LDA #$02
1196 : 85 01 __ STA $01 
1198 : a9 20 __ LDA #$20
119a : 91 39 __ STA (T2 + 0),y 
119c : 18 __ __ CLC
119d : a5 35 __ LDA T0 + 0 
119f : 69 01 __ ADC #$01
11a1 : 85 35 __ STA T0 + 0 
11a3 : a5 36 __ LDA T0 + 1 
11a5 : 69 00 __ ADC #$00
11a7 : d0 0c __ BNE $11b5 ; (putpch.s16 + 0)
.s19:
11a9 : a5 37 __ LDA T1 + 0 
11ab : 85 39 __ STA T2 + 0 
11ad : a5 35 __ LDA T0 + 0 
11af : c9 50 __ CMP #$50
11b1 : a6 38 __ LDX T1 + 1 
11b3 : 90 1f __ BCC $11d4 ; (putpch.s15 + 0)
.s16:
11b5 : 84 35 __ STY T0 + 0 
11b7 : 18 __ __ CLC
11b8 : a5 37 __ LDA T1 + 0 
11ba : 69 01 __ ADC #$01
11bc : 85 39 __ STA T2 + 0 
11be : a5 38 __ LDA T1 + 1 
11c0 : 69 00 __ ADC #$00
11c2 : d0 07 __ BNE $11cb ; (putpch.s17 + 0)
.s18:
11c4 : aa __ __ TAX
11c5 : a5 39 __ LDA T2 + 0 
11c7 : c9 1e __ CMP #$1e
11c9 : 90 09 __ BCC $11d4 ; (putpch.s15 + 0)
.s17:
11cb : 20 2b 12 JSR $122b ; (f256k_scroll.s4 + 0)
11ce : a9 1d __ LDA #$1d
11d0 : 85 39 __ STA T2 + 0 
11d2 : a2 00 __ LDX #$00
.s15:
11d4 : a9 00 __ LDA #$00
11d6 : 85 01 __ STA $01 
11d8 : a5 35 __ LDA T0 + 0 
11da : 8d 14 d0 STA $d014 
11dd : a9 00 __ LDA #$00
11df : 8d 15 d0 STA $d015 
11e2 : a5 39 __ LDA T2 + 0 
11e4 : 8d 16 d0 STA $d016 
11e7 : 8e 17 d0 STX $d017 
11ea : a5 3c __ LDA T5 + 0 
11ec : 85 01 __ STA $01 
11ee : e6 3b __ INC T3 + 0 
11f0 : a5 3b __ LDA T3 + 0 
11f2 : c9 04 __ CMP #$04
11f4 : b0 03 __ BCS $11f9 ; (putpch.s15 + 37)
11f6 : 4c 3f 11 JMP $113f ; (putpch.l14 + 0)
11f9 : 60 __ __ RTS
.s20:
11fa : a5 01 __ LDA $01 
11fc : 85 39 __ STA T2 + 0 
11fe : a9 00 __ LDA #$00
1200 : 85 01 __ STA $01 
1202 : ad 16 d0 LDA $d016 
1205 : 69 00 __ ADC #$00
1207 : aa __ __ TAX
1208 : ad 17 d0 LDA $d017 
120b : 69 00 __ ADC #$00
120d : d0 04 __ BNE $1213 ; (putpch.s22 + 0)
.s23:
120f : e0 1e __ CPX #$1e
1211 : 90 05 __ BCC $1218 ; (putpch.s21 + 0)
.s22:
1213 : 20 2b 12 JSR $122b ; (f256k_scroll.s4 + 0)
1216 : a2 1d __ LDX #$1d
.s21:
1218 : a9 00 __ LDA #$00
121a : 8d 14 d0 STA $d014 
121d : 8d 15 d0 STA $d015 
1220 : 8e 16 d0 STX $d016 
1223 : 8d 17 d0 STA $d017 
1226 : a5 39 __ LDA T2 + 0 
1228 : 85 01 __ STA $01 
122a : 60 __ __ RTS
--------------------------------------------------------------------
f256k_scroll: ; f256k_scroll()->void
; 219, "/mnt/d/F256/oscar64/include/conio.c"
.s4:
122b : a9 02 __ LDA #$02
122d : 85 01 __ STA $01 
122f : a9 00 __ LDA #$00
1231 : 85 29 __ STA ACCU + 0 
1233 : a9 c0 __ LDA #$c0
1235 : 85 2a __ STA ACCU + 1 
.l5:
1237 : a0 50 __ LDY #$50
1239 : b1 29 __ LDA (ACCU + 0),y 
123b : a0 00 __ LDY #$00
123d : 91 29 __ STA (ACCU + 0),y 
123f : e6 29 __ INC ACCU + 0 
1241 : d0 02 __ BNE $1245 ; (f256k_scroll.s16 + 0)
.s15:
1243 : e6 2a __ INC ACCU + 1 
.s16:
1245 : a5 29 __ LDA ACCU + 0 
1247 : c9 10 __ CMP #$10
1249 : d0 ec __ BNE $1237 ; (f256k_scroll.l5 + 0)
.s12:
124b : a5 2a __ LDA ACCU + 1 
124d : c9 c9 __ CMP #$c9
124f : d0 e6 __ BNE $1237 ; (f256k_scroll.l5 + 0)
.s6:
1251 : a9 20 __ LDA #$20
1253 : a2 50 __ LDX #$50
.l7:
1255 : ca __ __ DEX
1256 : 9d 10 c9 STA $c910,x 
1259 : d0 fa __ BNE $1255 ; (f256k_scroll.l7 + 0)
.s8:
125b : 84 29 __ STY ACCU + 0 
125d : a9 03 __ LDA #$03
125f : 85 01 __ STA $01 
1261 : a9 c0 __ LDA #$c0
1263 : 85 2a __ STA ACCU + 1 
.l9:
1265 : a0 50 __ LDY #$50
1267 : b1 29 __ LDA (ACCU + 0),y 
1269 : a0 00 __ LDY #$00
126b : 91 29 __ STA (ACCU + 0),y 
126d : e6 29 __ INC ACCU + 0 
126f : d0 02 __ BNE $1273 ; (f256k_scroll.s18 + 0)
.s17:
1271 : e6 2a __ INC ACCU + 1 
.s18:
1273 : a5 29 __ LDA ACCU + 0 
1275 : c9 10 __ CMP #$10
1277 : d0 ec __ BNE $1265 ; (f256k_scroll.l9 + 0)
.s11:
1279 : a5 2a __ LDA ACCU + 1 
127b : c9 c9 __ CMP #$c9
127d : d0 e6 __ BNE $1265 ; (f256k_scroll.l9 + 0)
.s10:
127f : ad f4 21 LDA $21f4 ; (f256k_color + 0)
1282 : a2 10 __ LDX #$10
.l13:
1284 : 8d 10 c9 STA $c910 
1287 : e8 __ __ INX
1288 : e0 60 __ CPX #$60
128a : d0 f8 __ BNE $1284 ; (f256k_scroll.l13 + 0)
.s14:
128c : 84 01 __ STY $01 
.s3:
128e : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->u8
;  79, "/mnt/d/F256/oscar64/include/stdio.c"
.s4:
128f : a9 00 __ LDA #$00
1291 : 85 35 __ STA T5 + 0 
1293 : a0 04 __ LDY #$04
1295 : b1 1b __ LDA (P0),y ; (si + 0)
1297 : 85 36 __ STA T6 + 0 
1299 : a5 21 __ LDA P6 ; (s + 0)
129b : f0 13 __ BEQ $12b0 ; (nformi.s5 + 0)
.s33:
129d : 24 20 __ BIT P5 ; (v + 1)
129f : 10 0f __ BPL $12b0 ; (nformi.s5 + 0)
.s34:
12a1 : 38 __ __ SEC
12a2 : a9 00 __ LDA #$00
12a4 : e5 1f __ SBC P4 ; (v + 0)
12a6 : 85 1f __ STA P4 ; (v + 0)
12a8 : a9 00 __ LDA #$00
12aa : e5 20 __ SBC P5 ; (v + 1)
12ac : 85 20 __ STA P5 ; (v + 1)
12ae : e6 35 __ INC T5 + 0 
.s5:
12b0 : a9 10 __ LDA #$10
12b2 : 85 37 __ STA T7 + 0 
12b4 : a5 1f __ LDA P4 ; (v + 0)
12b6 : 05 20 __ ORA P5 ; (v + 1)
12b8 : f0 33 __ BEQ $12ed ; (nformi.s6 + 0)
.s28:
12ba : a5 1f __ LDA P4 ; (v + 0)
12bc : 85 29 __ STA ACCU + 0 
12be : a5 20 __ LDA P5 ; (v + 1)
12c0 : 85 2a __ STA ACCU + 1 
.l29:
12c2 : a5 36 __ LDA T6 + 0 
12c4 : 85 11 __ STA WORK + 0 
12c6 : a9 00 __ LDA #$00
12c8 : 85 12 __ STA WORK + 1 
12ca : 20 c3 1f JSR $1fc3 ; (divmod + 0)
12cd : a5 13 __ LDA WORK + 2 
12cf : c9 0a __ CMP #$0a
12d1 : b0 04 __ BCS $12d7 ; (nformi.s32 + 0)
.s30:
12d3 : a9 30 __ LDA #$30
12d5 : 90 06 __ BCC $12dd ; (nformi.s31 + 0)
.s32:
12d7 : a0 03 __ LDY #$03
12d9 : b1 1b __ LDA (P0),y ; (si + 0)
12db : e9 0a __ SBC #$0a
.s31:
12dd : 18 __ __ CLC
12de : 65 13 __ ADC WORK + 2 
12e0 : a6 37 __ LDX T7 + 0 
12e2 : 9d dd 9f STA $9fdd,x ; (buf32[0] + 15)
12e5 : c6 37 __ DEC T7 + 0 
12e7 : a5 29 __ LDA ACCU + 0 
12e9 : 05 2a __ ORA ACCU + 1 
12eb : d0 d5 __ BNE $12c2 ; (nformi.l29 + 0)
.s6:
12ed : a0 02 __ LDY #$02
12ef : b1 1b __ LDA (P0),y ; (si + 0)
12f1 : c9 ff __ CMP #$ff
12f3 : d0 04 __ BNE $12f9 ; (nformi.s27 + 0)
.s7:
12f5 : a9 0f __ LDA #$0f
12f7 : d0 05 __ BNE $12fe ; (nformi.s39 + 0)
.s27:
12f9 : 38 __ __ SEC
12fa : a9 10 __ LDA #$10
12fc : f1 1b __ SBC (P0),y ; (si + 0)
.s39:
12fe : a8 __ __ TAY
12ff : c4 37 __ CPY T7 + 0 
1301 : b0 0d __ BCS $1310 ; (nformi.s8 + 0)
.s26:
1303 : a9 30 __ LDA #$30
.l40:
1305 : a6 37 __ LDX T7 + 0 
1307 : 9d dd 9f STA $9fdd,x ; (buf32[0] + 15)
130a : c6 37 __ DEC T7 + 0 
130c : c4 37 __ CPY T7 + 0 
130e : 90 f5 __ BCC $1305 ; (nformi.l40 + 0)
.s8:
1310 : a0 07 __ LDY #$07
1312 : b1 1b __ LDA (P0),y ; (si + 0)
1314 : f0 1c __ BEQ $1332 ; (nformi.s9 + 0)
.s24:
1316 : a5 36 __ LDA T6 + 0 
1318 : c9 10 __ CMP #$10
131a : d0 16 __ BNE $1332 ; (nformi.s9 + 0)
.s25:
131c : a0 03 __ LDY #$03
131e : b1 1b __ LDA (P0),y ; (si + 0)
1320 : a8 __ __ TAY
1321 : a9 30 __ LDA #$30
1323 : a6 37 __ LDX T7 + 0 
1325 : ca __ __ DEX
1326 : ca __ __ DEX
1327 : 86 37 __ STX T7 + 0 
1329 : 9d de 9f STA $9fde,x ; (buffer[0] + 0)
132c : 98 __ __ TYA
132d : 69 16 __ ADC #$16
132f : 9d df 9f STA $9fdf,x ; (buffer[0] + 1)
.s9:
1332 : a9 00 __ LDA #$00
1334 : 85 29 __ STA ACCU + 0 
1336 : a5 35 __ LDA T5 + 0 
1338 : f0 0c __ BEQ $1346 ; (nformi.s10 + 0)
.s23:
133a : a9 2d __ LDA #$2d
.s22:
133c : a6 37 __ LDX T7 + 0 
133e : 9d dd 9f STA $9fdd,x ; (buf32[0] + 15)
1341 : c6 37 __ DEC T7 + 0 
1343 : 4c 50 13 JMP $1350 ; (nformi.s11 + 0)
.s10:
1346 : a0 05 __ LDY #$05
1348 : b1 1b __ LDA (P0),y ; (si + 0)
134a : f0 04 __ BEQ $1350 ; (nformi.s11 + 0)
.s21:
134c : a9 2b __ LDA #$2b
134e : d0 ec __ BNE $133c ; (nformi.s22 + 0)
.s11:
1350 : a6 37 __ LDX T7 + 0 
1352 : a0 06 __ LDY #$06
1354 : b1 1b __ LDA (P0),y ; (si + 0)
1356 : d0 2b __ BNE $1383 ; (nformi.s17 + 0)
.l12:
1358 : 8a __ __ TXA
1359 : 18 __ __ CLC
135a : a0 01 __ LDY #$01
135c : 71 1b __ ADC (P0),y ; (si + 0)
135e : b0 04 __ BCS $1364 ; (nformi.s15 + 0)
.s16:
1360 : c9 11 __ CMP #$11
1362 : 90 0a __ BCC $136e ; (nformi.s13 + 0)
.s15:
1364 : a0 00 __ LDY #$00
1366 : b1 1b __ LDA (P0),y ; (si + 0)
1368 : 9d dd 9f STA $9fdd,x ; (buf32[0] + 15)
136b : ca __ __ DEX
136c : b0 ea __ BCS $1358 ; (nformi.l12 + 0)
.s13:
136e : e0 10 __ CPX #$10
1370 : b0 0e __ BCS $1380 ; (nformi.s41 + 0)
.s14:
1372 : 88 __ __ DEY
.l37:
1373 : bd de 9f LDA $9fde,x ; (buffer[0] + 0)
1376 : 91 1d __ STA (P2),y ; (str + 0)
1378 : c8 __ __ INY
1379 : e8 __ __ INX
137a : e0 10 __ CPX #$10
137c : 90 f5 __ BCC $1373 ; (nformi.l37 + 0)
.s38:
137e : 84 29 __ STY ACCU + 0 
.s41:
1380 : a5 29 __ LDA ACCU + 0 
.s3:
1382 : 60 __ __ RTS
.s17:
1383 : e0 10 __ CPX #$10
1385 : b0 1a __ BCS $13a1 ; (nformi.l18 + 0)
.s20:
1387 : a0 00 __ LDY #$00
.l35:
1389 : bd de 9f LDA $9fde,x ; (buffer[0] + 0)
138c : 91 1d __ STA (P2),y ; (str + 0)
138e : c8 __ __ INY
138f : e8 __ __ INX
1390 : e0 10 __ CPX #$10
1392 : 90 f5 __ BCC $1389 ; (nformi.l35 + 0)
.s36:
1394 : 84 29 __ STY ACCU + 0 
1396 : b0 09 __ BCS $13a1 ; (nformi.l18 + 0)
.s19:
1398 : 88 __ __ DEY
1399 : b1 1b __ LDA (P0),y ; (si + 0)
139b : a4 29 __ LDY ACCU + 0 
139d : 91 1d __ STA (P2),y ; (str + 0)
139f : e6 29 __ INC ACCU + 0 
.l18:
13a1 : a5 29 __ LDA ACCU + 0 
13a3 : a0 01 __ LDY #$01
13a5 : d1 1b __ CMP (P0),y ; (si + 0)
13a7 : 90 ef __ BCC $1398 ; (nformi.s19 + 0)
13a9 : 60 __ __ RTS
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->u8
; 137, "/mnt/d/F256/oscar64/include/stdio.c"
.s4:
13aa : a9 00 __ LDA #$00
13ac : 85 35 __ STA T4 + 0 
13ae : a5 23 __ LDA P8 ; (s + 0)
13b0 : f0 1f __ BEQ $13d1 ; (nforml.s5 + 0)
.s35:
13b2 : 24 22 __ BIT P7 ; (v + 3)
13b4 : 10 1b __ BPL $13d1 ; (nforml.s5 + 0)
.s36:
13b6 : 38 __ __ SEC
13b7 : a9 00 __ LDA #$00
13b9 : e5 1f __ SBC P4 ; (v + 0)
13bb : 85 1f __ STA P4 ; (v + 0)
13bd : a9 00 __ LDA #$00
13bf : e5 20 __ SBC P5 ; (v + 1)
13c1 : 85 20 __ STA P5 ; (v + 1)
13c3 : a9 00 __ LDA #$00
13c5 : e5 21 __ SBC P6 ; (v + 2)
13c7 : 85 21 __ STA P6 ; (v + 2)
13c9 : a9 00 __ LDA #$00
13cb : e5 22 __ SBC P7 ; (v + 3)
13cd : 85 22 __ STA P7 ; (v + 3)
13cf : e6 35 __ INC T4 + 0 
.s5:
13d1 : a9 10 __ LDA #$10
13d3 : 85 36 __ STA T5 + 0 
13d5 : a5 22 __ LDA P7 ; (v + 3)
13d7 : f0 03 __ BEQ $13dc ; (nforml.s31 + 0)
13d9 : 4c a6 14 JMP $14a6 ; (nforml.l28 + 0)
.s31:
13dc : a5 21 __ LDA P6 ; (v + 2)
13de : d0 f9 __ BNE $13d9 ; (nforml.s5 + 8)
.s32:
13e0 : a5 20 __ LDA P5 ; (v + 1)
13e2 : d0 f5 __ BNE $13d9 ; (nforml.s5 + 8)
.s33:
13e4 : c5 1f __ CMP P4 ; (v + 0)
13e6 : 90 f1 __ BCC $13d9 ; (nforml.s5 + 8)
.s6:
13e8 : a0 02 __ LDY #$02
13ea : b1 1b __ LDA (P0),y ; (si + 0)
13ec : c9 ff __ CMP #$ff
13ee : d0 04 __ BNE $13f4 ; (nforml.s27 + 0)
.s7:
13f0 : a9 0f __ LDA #$0f
13f2 : d0 05 __ BNE $13f9 ; (nforml.s41 + 0)
.s27:
13f4 : 38 __ __ SEC
13f5 : a9 10 __ LDA #$10
13f7 : f1 1b __ SBC (P0),y ; (si + 0)
.s41:
13f9 : a8 __ __ TAY
13fa : c4 36 __ CPY T5 + 0 
13fc : b0 0d __ BCS $140b ; (nforml.s8 + 0)
.s26:
13fe : a9 30 __ LDA #$30
.l42:
1400 : a6 36 __ LDX T5 + 0 
1402 : 9d dd 9f STA $9fdd,x ; (buf32[0] + 15)
1405 : c6 36 __ DEC T5 + 0 
1407 : c4 36 __ CPY T5 + 0 
1409 : 90 f5 __ BCC $1400 ; (nforml.l42 + 0)
.s8:
140b : a0 07 __ LDY #$07
140d : b1 1b __ LDA (P0),y ; (si + 0)
140f : f0 1d __ BEQ $142e ; (nforml.s9 + 0)
.s24:
1411 : a0 04 __ LDY #$04
1413 : b1 1b __ LDA (P0),y ; (si + 0)
1415 : c9 10 __ CMP #$10
1417 : d0 15 __ BNE $142e ; (nforml.s9 + 0)
.s25:
1419 : 88 __ __ DEY
141a : b1 1b __ LDA (P0),y ; (si + 0)
141c : a8 __ __ TAY
141d : a9 30 __ LDA #$30
141f : a6 36 __ LDX T5 + 0 
1421 : ca __ __ DEX
1422 : ca __ __ DEX
1423 : 86 36 __ STX T5 + 0 
1425 : 9d de 9f STA $9fde,x ; (buffer[0] + 0)
1428 : 98 __ __ TYA
1429 : 69 16 __ ADC #$16
142b : 9d df 9f STA $9fdf,x ; (buffer[0] + 1)
.s9:
142e : a9 00 __ LDA #$00
1430 : 85 29 __ STA ACCU + 0 
1432 : a5 35 __ LDA T4 + 0 
1434 : f0 0c __ BEQ $1442 ; (nforml.s10 + 0)
.s23:
1436 : a9 2d __ LDA #$2d
.s22:
1438 : a6 36 __ LDX T5 + 0 
143a : 9d dd 9f STA $9fdd,x ; (buf32[0] + 15)
143d : c6 36 __ DEC T5 + 0 
143f : 4c 4c 14 JMP $144c ; (nforml.s11 + 0)
.s10:
1442 : a0 05 __ LDY #$05
1444 : b1 1b __ LDA (P0),y ; (si + 0)
1446 : f0 04 __ BEQ $144c ; (nforml.s11 + 0)
.s21:
1448 : a9 2b __ LDA #$2b
144a : d0 ec __ BNE $1438 ; (nforml.s22 + 0)
.s11:
144c : a6 36 __ LDX T5 + 0 
144e : a0 06 __ LDY #$06
1450 : b1 1b __ LDA (P0),y ; (si + 0)
1452 : d0 2b __ BNE $147f ; (nforml.s17 + 0)
.l12:
1454 : 8a __ __ TXA
1455 : 18 __ __ CLC
1456 : a0 01 __ LDY #$01
1458 : 71 1b __ ADC (P0),y ; (si + 0)
145a : b0 04 __ BCS $1460 ; (nforml.s15 + 0)
.s16:
145c : c9 11 __ CMP #$11
145e : 90 0a __ BCC $146a ; (nforml.s13 + 0)
.s15:
1460 : a0 00 __ LDY #$00
1462 : b1 1b __ LDA (P0),y ; (si + 0)
1464 : 9d dd 9f STA $9fdd,x ; (buf32[0] + 15)
1467 : ca __ __ DEX
1468 : b0 ea __ BCS $1454 ; (nforml.l12 + 0)
.s13:
146a : e0 10 __ CPX #$10
146c : b0 0e __ BCS $147c ; (nforml.s43 + 0)
.s14:
146e : 88 __ __ DEY
.l39:
146f : bd de 9f LDA $9fde,x ; (buffer[0] + 0)
1472 : 91 1d __ STA (P2),y ; (str + 0)
1474 : c8 __ __ INY
1475 : e8 __ __ INX
1476 : e0 10 __ CPX #$10
1478 : 90 f5 __ BCC $146f ; (nforml.l39 + 0)
.s40:
147a : 84 29 __ STY ACCU + 0 
.s43:
147c : a5 29 __ LDA ACCU + 0 
.s3:
147e : 60 __ __ RTS
.s17:
147f : e0 10 __ CPX #$10
1481 : b0 1a __ BCS $149d ; (nforml.l18 + 0)
.s20:
1483 : a0 00 __ LDY #$00
.l37:
1485 : bd de 9f LDA $9fde,x ; (buffer[0] + 0)
1488 : 91 1d __ STA (P2),y ; (str + 0)
148a : c8 __ __ INY
148b : e8 __ __ INX
148c : e0 10 __ CPX #$10
148e : 90 f5 __ BCC $1485 ; (nforml.l37 + 0)
.s38:
1490 : 84 29 __ STY ACCU + 0 
1492 : b0 09 __ BCS $149d ; (nforml.l18 + 0)
.s19:
1494 : 88 __ __ DEY
1495 : b1 1b __ LDA (P0),y ; (si + 0)
1497 : a4 29 __ LDY ACCU + 0 
1499 : 91 1d __ STA (P2),y ; (str + 0)
149b : e6 29 __ INC ACCU + 0 
.l18:
149d : a5 29 __ LDA ACCU + 0 
149f : a0 01 __ LDY #$01
14a1 : d1 1b __ CMP (P0),y ; (si + 0)
14a3 : 90 ef __ BCC $1494 ; (nforml.s19 + 0)
14a5 : 60 __ __ RTS
.l28:
14a6 : a0 04 __ LDY #$04
14a8 : b1 1b __ LDA (P0),y ; (si + 0)
14aa : 85 11 __ STA WORK + 0 
14ac : a5 1f __ LDA P4 ; (v + 0)
14ae : 85 29 __ STA ACCU + 0 
14b0 : a5 20 __ LDA P5 ; (v + 1)
14b2 : 85 2a __ STA ACCU + 1 
14b4 : a5 21 __ LDA P6 ; (v + 2)
14b6 : 85 2b __ STA ACCU + 2 
14b8 : a5 22 __ LDA P7 ; (v + 3)
14ba : 85 2c __ STA ACCU + 3 
14bc : a9 00 __ LDA #$00
14be : 85 12 __ STA WORK + 1 
14c0 : 85 13 __ STA WORK + 2 
14c2 : 85 14 __ STA WORK + 3 
14c4 : 20 08 21 JSR $2108 ; (divmod32 + 0)
14c7 : a5 15 __ LDA WORK + 4 
14c9 : c9 0a __ CMP #$0a
14cb : b0 04 __ BCS $14d1 ; (nforml.s34 + 0)
.s29:
14cd : a9 30 __ LDA #$30
14cf : 90 06 __ BCC $14d7 ; (nforml.s30 + 0)
.s34:
14d1 : a0 03 __ LDY #$03
14d3 : b1 1b __ LDA (P0),y ; (si + 0)
14d5 : e9 0a __ SBC #$0a
.s30:
14d7 : 18 __ __ CLC
14d8 : 65 15 __ ADC WORK + 4 
14da : a6 36 __ LDX T5 + 0 
14dc : 9d dd 9f STA $9fdd,x ; (buf32[0] + 15)
14df : c6 36 __ DEC T5 + 0 
14e1 : a5 29 __ LDA ACCU + 0 
14e3 : 85 1f __ STA P4 ; (v + 0)
14e5 : a5 2a __ LDA ACCU + 1 
14e7 : 85 20 __ STA P5 ; (v + 1)
14e9 : a5 2b __ LDA ACCU + 2 
14eb : 85 21 __ STA P6 ; (v + 2)
14ed : a5 2c __ LDA ACCU + 3 
14ef : 85 22 __ STA P7 ; (v + 3)
14f1 : d0 b3 __ BNE $14a6 ; (nforml.l28 + 0)
14f3 : 4c dc 13 JMP $13dc ; (nforml.s31 + 0)
--------------------------------------------------------------------
nformf: ; nformf(const struct sinfo*,u8*,float,u8)->u8
; 199, "/mnt/d/F256/oscar64/include/stdio.c"
.s4:
14f6 : a5 24 __ LDA P9 ; (f + 1)
14f8 : 85 36 __ STA T0 + 1 
14fa : a5 25 __ LDA P10 ; (f + 2)
14fc : 85 37 __ STA T0 + 2 
14fe : a5 26 __ LDA P11 ; (f + 3)
1500 : 29 7f __ AND #$7f
1502 : 05 25 __ ORA P10 ; (f + 2)
1504 : 05 24 __ ORA P9 ; (f + 1)
1506 : 05 23 __ ORA P8 ; (f + 0)
1508 : f0 21 __ BEQ $152b ; (nformf.s5 + 0)
.s107:
150a : 24 26 __ BIT P11 ; (f + 3)
150c : 10 1d __ BPL $152b ; (nformf.s5 + 0)
.s106:
150e : a9 2d __ LDA #$2d
1510 : a0 00 __ LDY #$00
1512 : 91 21 __ STA (P6),y ; (str + 0)
1514 : a5 26 __ LDA P11 ; (f + 3)
1516 : 49 80 __ EOR #$80
1518 : 85 1e __ STA P3 
151a : 85 26 __ STA P11 ; (f + 3)
151c : a5 23 __ LDA P8 ; (f + 0)
151e : 85 1b __ STA P0 
1520 : a5 24 __ LDA P9 ; (f + 1)
1522 : 85 1c __ STA P1 
1524 : a5 25 __ LDA P10 ; (f + 2)
1526 : 85 1d __ STA P2 
1528 : 4c 35 1a JMP $1a35 ; (nformf.s104 + 0)
.s5:
152b : a5 23 __ LDA P8 ; (f + 0)
152d : 85 1b __ STA P0 
152f : a5 24 __ LDA P9 ; (f + 1)
1531 : 85 1c __ STA P1 
1533 : a5 25 __ LDA P10 ; (f + 2)
1535 : 85 1d __ STA P2 
1537 : a5 26 __ LDA P11 ; (f + 3)
1539 : 85 1e __ STA P3 
153b : a0 05 __ LDY #$05
153d : b1 1f __ LDA (P4),y ; (si + 0)
153f : f0 09 __ BEQ $154a ; (nformf.s6 + 0)
.s103:
1541 : a9 2b __ LDA #$2b
1543 : a0 00 __ LDY #$00
1545 : 91 21 __ STA (P6),y ; (str + 0)
1547 : 4c 35 1a JMP $1a35 ; (nformf.s104 + 0)
.s6:
154a : 20 46 1a JSR $1a46 ; (isinf.s4 + 0)
154d : a2 00 __ LDX #$00
154f : 86 46 __ STX T9 + 0 
1551 : a8 __ __ TAY
1552 : f0 05 __ BEQ $1559 ; (nformf.s7 + 0)
.s101:
1554 : a9 02 __ LDA #$02
1556 : 4c 05 1a JMP $1a05 ; (nformf.s102 + 0)
.s7:
1559 : a5 1f __ LDA P4 ; (si + 0)
155b : 85 3d __ STA T2 + 0 
155d : a5 20 __ LDA P5 ; (si + 1)
155f : 85 3e __ STA T2 + 1 
1561 : a0 02 __ LDY #$02
1563 : b1 1f __ LDA (P4),y ; (si + 0)
1565 : c9 ff __ CMP #$ff
1567 : d0 02 __ BNE $156b ; (nformf.s100 + 0)
.s8:
1569 : a9 06 __ LDA #$06
.s100:
156b : 85 3f __ STA T3 + 0 
156d : 85 44 __ STA T6 + 0 
156f : a9 00 __ LDA #$00
1571 : 85 41 __ STA T4 + 0 
1573 : 85 42 __ STA T4 + 1 
1575 : a5 26 __ LDA P11 ; (f + 3)
1577 : 85 38 __ STA T0 + 3 
1579 : 29 7f __ AND #$7f
157b : 05 25 __ ORA P10 ; (f + 2)
157d : 05 24 __ ORA P9 ; (f + 1)
157f : a6 23 __ LDX P8 ; (f + 0)
1581 : 86 35 __ STX T0 + 0 
1583 : 05 23 __ ORA P8 ; (f + 0)
1585 : d0 03 __ BNE $158a ; (nformf.s67 + 0)
1587 : 4c be 16 JMP $16be ; (nformf.s9 + 0)
.s67:
158a : a5 26 __ LDA P11 ; (f + 3)
158c : 10 03 __ BPL $1591 ; (nformf.s95 + 0)
158e : 4c 10 16 JMP $1610 ; (nformf.l80 + 0)
.s95:
1591 : c9 44 __ CMP #$44
1593 : d0 0d __ BNE $15a2 ; (nformf.l99 + 0)
.s96:
1595 : a5 25 __ LDA P10 ; (f + 2)
1597 : c9 7a __ CMP #$7a
1599 : d0 07 __ BNE $15a2 ; (nformf.l99 + 0)
.s97:
159b : a5 24 __ LDA P9 ; (f + 1)
159d : d0 03 __ BNE $15a2 ; (nformf.l99 + 0)
.s98:
159f : 8a __ __ TXA
15a0 : f0 02 __ BEQ $15a4 ; (nformf.l90 + 0)
.l99:
15a2 : 90 54 __ BCC $15f8 ; (nformf.s68 + 0)
.l90:
15a4 : 18 __ __ CLC
15a5 : a5 41 __ LDA T4 + 0 
15a7 : 69 03 __ ADC #$03
15a9 : 85 41 __ STA T4 + 0 
15ab : 90 02 __ BCC $15af ; (nformf.s121 + 0)
.s120:
15ad : e6 42 __ INC T4 + 1 
.s121:
15af : a5 35 __ LDA T0 + 0 
15b1 : 85 29 __ STA ACCU + 0 
15b3 : a5 36 __ LDA T0 + 1 
15b5 : 85 2a __ STA ACCU + 1 
15b7 : a5 37 __ LDA T0 + 2 
15b9 : 85 2b __ STA ACCU + 2 
15bb : a5 38 __ LDA T0 + 3 
15bd : 85 2c __ STA ACCU + 3 
15bf : a9 00 __ LDA #$00
15c1 : 85 11 __ STA WORK + 0 
15c3 : 85 12 __ STA WORK + 1 
15c5 : a9 7a __ LDA #$7a
15c7 : 85 13 __ STA WORK + 2 
15c9 : a9 44 __ LDA #$44
15cb : 85 14 __ STA WORK + 3 
15cd : 20 f5 1c JSR $1cf5 ; (freg + 20)
15d0 : 20 db 1e JSR $1edb ; (crt_fdiv + 0)
15d3 : a5 29 __ LDA ACCU + 0 
15d5 : 85 35 __ STA T0 + 0 
15d7 : a5 2a __ LDA ACCU + 1 
15d9 : 85 36 __ STA T0 + 1 
15db : a6 2b __ LDX ACCU + 2 
15dd : 86 37 __ STX T0 + 2 
15df : a5 2c __ LDA ACCU + 3 
15e1 : 85 38 __ STA T0 + 3 
15e3 : 30 13 __ BMI $15f8 ; (nformf.s68 + 0)
.s91:
15e5 : c9 44 __ CMP #$44
15e7 : d0 b9 __ BNE $15a2 ; (nformf.l99 + 0)
.s92:
15e9 : e0 7a __ CPX #$7a
15eb : d0 b5 __ BNE $15a2 ; (nformf.l99 + 0)
.s93:
15ed : a5 2a __ LDA ACCU + 1 
15ef : 38 __ __ SEC
15f0 : d0 b0 __ BNE $15a2 ; (nformf.l99 + 0)
.s94:
15f2 : a5 29 __ LDA ACCU + 0 
15f4 : f0 ae __ BEQ $15a4 ; (nformf.l90 + 0)
15f6 : d0 aa __ BNE $15a2 ; (nformf.l99 + 0)
.s68:
15f8 : a5 38 __ LDA T0 + 3 
15fa : 30 14 __ BMI $1610 ; (nformf.l80 + 0)
.s86:
15fc : c9 3f __ CMP #$3f
15fe : d0 0e __ BNE $160e ; (nformf.s85 + 0)
.s87:
1600 : a5 37 __ LDA T0 + 2 
1602 : c9 80 __ CMP #$80
1604 : d0 08 __ BNE $160e ; (nformf.s85 + 0)
.s88:
1606 : a5 36 __ LDA T0 + 1 
1608 : d0 04 __ BNE $160e ; (nformf.s85 + 0)
.s89:
160a : a5 35 __ LDA T0 + 0 
160c : f0 49 __ BEQ $1657 ; (nformf.s69 + 0)
.s85:
160e : b0 47 __ BCS $1657 ; (nformf.s69 + 0)
.l80:
1610 : 38 __ __ SEC
1611 : a5 41 __ LDA T4 + 0 
1613 : e9 03 __ SBC #$03
1615 : 85 41 __ STA T4 + 0 
1617 : b0 02 __ BCS $161b ; (nformf.s116 + 0)
.s115:
1619 : c6 42 __ DEC T4 + 1 
.s116:
161b : a9 00 __ LDA #$00
161d : 85 29 __ STA ACCU + 0 
161f : 85 2a __ STA ACCU + 1 
1621 : a9 7a __ LDA #$7a
1623 : 85 2b __ STA ACCU + 2 
1625 : a9 44 __ LDA #$44
1627 : 85 2c __ STA ACCU + 3 
1629 : a2 35 __ LDX #$35
162b : 20 e5 1c JSR $1ce5 ; (freg + 4)
162e : 20 13 1e JSR $1e13 ; (crt_fmul + 0)
1631 : a5 29 __ LDA ACCU + 0 
1633 : 85 35 __ STA T0 + 0 
1635 : a5 2a __ LDA ACCU + 1 
1637 : 85 36 __ STA T0 + 1 
1639 : a6 2b __ LDX ACCU + 2 
163b : 86 37 __ STX T0 + 2 
163d : a5 2c __ LDA ACCU + 3 
163f : 85 38 __ STA T0 + 3 
1641 : 30 cd __ BMI $1610 ; (nformf.l80 + 0)
.s81:
1643 : c9 3f __ CMP #$3f
1645 : 90 c9 __ BCC $1610 ; (nformf.l80 + 0)
.s122:
1647 : d0 0e __ BNE $1657 ; (nformf.s69 + 0)
.s82:
1649 : e0 80 __ CPX #$80
164b : 90 c3 __ BCC $1610 ; (nformf.l80 + 0)
.s123:
164d : d0 08 __ BNE $1657 ; (nformf.s69 + 0)
.s83:
164f : a5 2a __ LDA ACCU + 1 
1651 : d0 bb __ BNE $160e ; (nformf.s85 + 0)
.s84:
1653 : a5 29 __ LDA ACCU + 0 
1655 : d0 b7 __ BNE $160e ; (nformf.s85 + 0)
.s69:
1657 : a5 38 __ LDA T0 + 3 
1659 : 30 63 __ BMI $16be ; (nformf.s9 + 0)
.s75:
165b : c9 41 __ CMP #$41
165d : d0 0e __ BNE $166d ; (nformf.l79 + 0)
.s76:
165f : a5 37 __ LDA T0 + 2 
1661 : c9 20 __ CMP #$20
1663 : d0 08 __ BNE $166d ; (nformf.l79 + 0)
.s77:
1665 : a5 36 __ LDA T0 + 1 
1667 : d0 04 __ BNE $166d ; (nformf.l79 + 0)
.s78:
1669 : a5 35 __ LDA T0 + 0 
166b : f0 02 __ BEQ $166f ; (nformf.l70 + 0)
.l79:
166d : 90 4f __ BCC $16be ; (nformf.s9 + 0)
.l70:
166f : e6 41 __ INC T4 + 0 
1671 : d0 02 __ BNE $1675 ; (nformf.s119 + 0)
.s118:
1673 : e6 42 __ INC T4 + 1 
.s119:
1675 : a5 35 __ LDA T0 + 0 
1677 : 85 29 __ STA ACCU + 0 
1679 : a5 36 __ LDA T0 + 1 
167b : 85 2a __ STA ACCU + 1 
167d : a5 37 __ LDA T0 + 2 
167f : 85 2b __ STA ACCU + 2 
1681 : a5 38 __ LDA T0 + 3 
1683 : 85 2c __ STA ACCU + 3 
1685 : a9 00 __ LDA #$00
1687 : 85 11 __ STA WORK + 0 
1689 : 85 12 __ STA WORK + 1 
168b : a9 20 __ LDA #$20
168d : 85 13 __ STA WORK + 2 
168f : a9 41 __ LDA #$41
1691 : 85 14 __ STA WORK + 3 
1693 : 20 f5 1c JSR $1cf5 ; (freg + 20)
1696 : 20 db 1e JSR $1edb ; (crt_fdiv + 0)
1699 : a5 29 __ LDA ACCU + 0 
169b : 85 35 __ STA T0 + 0 
169d : a5 2a __ LDA ACCU + 1 
169f : 85 36 __ STA T0 + 1 
16a1 : a6 2b __ LDX ACCU + 2 
16a3 : 86 37 __ STX T0 + 2 
16a5 : a5 2c __ LDA ACCU + 3 
16a7 : 85 38 __ STA T0 + 3 
16a9 : 30 13 __ BMI $16be ; (nformf.s9 + 0)
.s71:
16ab : c9 41 __ CMP #$41
16ad : d0 be __ BNE $166d ; (nformf.l79 + 0)
.s72:
16af : e0 20 __ CPX #$20
16b1 : d0 ba __ BNE $166d ; (nformf.l79 + 0)
.s73:
16b3 : a5 2a __ LDA ACCU + 1 
16b5 : 38 __ __ SEC
16b6 : d0 b5 __ BNE $166d ; (nformf.l79 + 0)
.s74:
16b8 : a5 29 __ LDA ACCU + 0 
16ba : f0 b3 __ BEQ $166f ; (nformf.l70 + 0)
16bc : d0 af __ BNE $166d ; (nformf.l79 + 0)
.s9:
16be : ad ee 9f LDA $9fee ; (sstack + 0)
16c1 : c9 65 __ CMP #$65
16c3 : d0 04 __ BNE $16c9 ; (nformf.s11 + 0)
.s10:
16c5 : a9 01 __ LDA #$01
16c7 : d0 02 __ BNE $16cb ; (nformf.s12 + 0)
.s11:
16c9 : a9 00 __ LDA #$00
.s12:
16cb : 85 47 __ STA T10 + 0 
16cd : a6 3f __ LDX T3 + 0 
16cf : e8 __ __ INX
16d0 : 86 43 __ STX T5 + 0 
16d2 : ad ee 9f LDA $9fee ; (sstack + 0)
16d5 : c9 67 __ CMP #$67
16d7 : d0 13 __ BNE $16ec ; (nformf.s13 + 0)
.s63:
16d9 : a5 42 __ LDA T4 + 1 
16db : 30 08 __ BMI $16e5 ; (nformf.s64 + 0)
.s66:
16dd : d0 06 __ BNE $16e5 ; (nformf.s64 + 0)
.s65:
16df : a5 41 __ LDA T4 + 0 
16e1 : c9 04 __ CMP #$04
16e3 : 90 07 __ BCC $16ec ; (nformf.s13 + 0)
.s64:
16e5 : a9 01 __ LDA #$01
16e7 : 85 47 __ STA T10 + 0 
16e9 : 4c 6b 19 JMP $196b ; (nformf.s53 + 0)
.s13:
16ec : a5 47 __ LDA T10 + 0 
16ee : d0 f9 __ BNE $16e9 ; (nformf.s64 + 4)
.s14:
16f0 : 24 42 __ BIT T4 + 1 
16f2 : 10 43 __ BPL $1737 ; (nformf.s15 + 0)
.s52:
16f4 : a5 35 __ LDA T0 + 0 
16f6 : 85 29 __ STA ACCU + 0 
16f8 : a5 36 __ LDA T0 + 1 
16fa : 85 2a __ STA ACCU + 1 
16fc : a5 37 __ LDA T0 + 2 
16fe : 85 2b __ STA ACCU + 2 
1700 : a5 38 __ LDA T0 + 3 
1702 : 85 2c __ STA ACCU + 3 
.l108:
1704 : a9 00 __ LDA #$00
1706 : 85 11 __ STA WORK + 0 
1708 : 85 12 __ STA WORK + 1 
170a : a9 20 __ LDA #$20
170c : 85 13 __ STA WORK + 2 
170e : a9 41 __ LDA #$41
1710 : 85 14 __ STA WORK + 3 
1712 : 20 f5 1c JSR $1cf5 ; (freg + 20)
1715 : 20 db 1e JSR $1edb ; (crt_fdiv + 0)
1718 : 18 __ __ CLC
1719 : a5 41 __ LDA T4 + 0 
171b : 69 01 __ ADC #$01
171d : 85 41 __ STA T4 + 0 
171f : a5 42 __ LDA T4 + 1 
1721 : 69 00 __ ADC #$00
1723 : 85 42 __ STA T4 + 1 
1725 : 30 dd __ BMI $1704 ; (nformf.l108 + 0)
.s109:
1727 : a5 2c __ LDA ACCU + 3 
1729 : 85 38 __ STA T0 + 3 
172b : a5 2b __ LDA ACCU + 2 
172d : 85 37 __ STA T0 + 2 
172f : a5 2a __ LDA ACCU + 1 
1731 : 85 36 __ STA T0 + 1 
1733 : a5 29 __ LDA ACCU + 0 
1735 : 85 35 __ STA T0 + 0 
.s15:
1737 : 18 __ __ CLC
1738 : a5 3f __ LDA T3 + 0 
173a : 65 41 __ ADC T4 + 0 
173c : 18 __ __ CLC
173d : 69 01 __ ADC #$01
173f : 85 43 __ STA T5 + 0 
1741 : c9 07 __ CMP #$07
1743 : 90 14 __ BCC $1759 ; (nformf.s51 + 0)
.s16:
1745 : ad 74 22 LDA $2274 ; (fround5[0] + 24)
1748 : 85 39 __ STA T1 + 0 
174a : ad 75 22 LDA $2275 ; (fround5[0] + 25)
174d : 85 3a __ STA T1 + 1 
174f : ad 76 22 LDA $2276 ; (fround5[0] + 26)
1752 : 85 3b __ STA T1 + 2 
1754 : ad 77 22 LDA $2277 ; (fround5[0] + 27)
1757 : b0 15 __ BCS $176e ; (nformf.s17 + 0)
.s51:
1759 : 0a __ __ ASL
175a : 0a __ __ ASL
175b : aa __ __ TAX
175c : bd 58 22 LDA $2258,x ; (pcmHeader[0] + 40)
175f : 85 39 __ STA T1 + 0 
1761 : bd 59 22 LDA $2259,x ; (pcmHeader[0] + 41)
1764 : 85 3a __ STA T1 + 1 
1766 : bd 5a 22 LDA $225a,x ; (pcmHeader[0] + 42)
1769 : 85 3b __ STA T1 + 2 
176b : bd 5b 22 LDA $225b,x ; (pcmHeader[0] + 43)
.s17:
176e : 85 3c __ STA T1 + 3 
1770 : a5 35 __ LDA T0 + 0 
1772 : 85 29 __ STA ACCU + 0 
1774 : a5 36 __ LDA T0 + 1 
1776 : 85 2a __ STA ACCU + 1 
1778 : a5 37 __ LDA T0 + 2 
177a : 85 2b __ STA ACCU + 2 
177c : a5 38 __ LDA T0 + 3 
177e : 85 2c __ STA ACCU + 3 
1780 : a2 39 __ LDX #$39
1782 : 20 e5 1c JSR $1ce5 ; (freg + 4)
1785 : 20 2c 1d JSR $1d2c ; (faddsub + 6)
1788 : a5 2a __ LDA ACCU + 1 
178a : 85 24 __ STA P9 ; (f + 1)
178c : a5 2b __ LDA ACCU + 2 
178e : 85 25 __ STA P10 ; (f + 2)
1790 : a6 29 __ LDX ACCU + 0 
1792 : a5 2c __ LDA ACCU + 3 
1794 : 85 26 __ STA P11 ; (f + 3)
1796 : 30 3a __ BMI $17d2 ; (nformf.s18 + 0)
.s46:
1798 : c9 41 __ CMP #$41
179a : d0 0d __ BNE $17a9 ; (nformf.s50 + 0)
.s47:
179c : a5 25 __ LDA P10 ; (f + 2)
179e : c9 20 __ CMP #$20
17a0 : d0 07 __ BNE $17a9 ; (nformf.s50 + 0)
.s48:
17a2 : a5 24 __ LDA P9 ; (f + 1)
17a4 : d0 03 __ BNE $17a9 ; (nformf.s50 + 0)
.s49:
17a6 : 8a __ __ TXA
17a7 : f0 02 __ BEQ $17ab ; (nformf.s45 + 0)
.s50:
17a9 : 90 27 __ BCC $17d2 ; (nformf.s18 + 0)
.s45:
17ab : a9 00 __ LDA #$00
17ad : 85 11 __ STA WORK + 0 
17af : 85 12 __ STA WORK + 1 
17b1 : a9 20 __ LDA #$20
17b3 : 85 13 __ STA WORK + 2 
17b5 : a9 41 __ LDA #$41
17b7 : 85 14 __ STA WORK + 3 
17b9 : 20 f5 1c JSR $1cf5 ; (freg + 20)
17bc : 20 db 1e JSR $1edb ; (crt_fdiv + 0)
17bf : a5 2a __ LDA ACCU + 1 
17c1 : 85 24 __ STA P9 ; (f + 1)
17c3 : a5 2b __ LDA ACCU + 2 
17c5 : 85 25 __ STA P10 ; (f + 2)
17c7 : a5 2c __ LDA ACCU + 3 
17c9 : 85 26 __ STA P11 ; (f + 3)
17cb : a6 3f __ LDX T3 + 0 
17cd : ca __ __ DEX
17ce : 86 44 __ STX T6 + 0 
17d0 : a6 29 __ LDX ACCU + 0 
.s18:
17d2 : 38 __ __ SEC
17d3 : a5 43 __ LDA T5 + 0 
17d5 : e5 44 __ SBC T6 + 0 
17d7 : 85 3f __ STA T3 + 0 
17d9 : a9 00 __ LDA #$00
17db : e9 00 __ SBC #$00
17dd : 85 40 __ STA T3 + 1 
17df : a9 14 __ LDA #$14
17e1 : c5 43 __ CMP T5 + 0 
17e3 : b0 02 __ BCS $17e7 ; (nformf.s19 + 0)
.s44:
17e5 : 85 43 __ STA T5 + 0 
.s19:
17e7 : a5 3f __ LDA T3 + 0 
17e9 : d0 08 __ BNE $17f3 ; (nformf.s21 + 0)
.s20:
17eb : a9 30 __ LDA #$30
17ed : a4 46 __ LDY T9 + 0 
17ef : 91 21 __ STA (P6),y ; (str + 0)
17f1 : e6 46 __ INC T9 + 0 
.s21:
17f3 : a9 00 __ LDA #$00
17f5 : 85 48 __ STA T11 + 0 
17f7 : c5 3f __ CMP T3 + 0 
17f9 : f0 6f __ BEQ $186a ; (nformf.l43 + 0)
.s23:
17fb : c9 07 __ CMP #$07
17fd : 90 04 __ BCC $1803 ; (nformf.s24 + 0)
.l42:
17ff : a9 30 __ LDA #$30
1801 : b0 55 __ BCS $1858 ; (nformf.l25 + 0)
.s24:
1803 : 86 29 __ STX ACCU + 0 
1805 : 86 35 __ STX T0 + 0 
1807 : a5 24 __ LDA P9 ; (f + 1)
1809 : 85 2a __ STA ACCU + 1 
180b : 85 36 __ STA T0 + 1 
180d : a5 25 __ LDA P10 ; (f + 2)
180f : 85 2b __ STA ACCU + 2 
1811 : 85 37 __ STA T0 + 2 
1813 : a5 26 __ LDA P11 ; (f + 3)
1815 : 85 2c __ STA ACCU + 3 
1817 : 85 38 __ STA T0 + 3 
1819 : 20 75 20 JSR $2075 ; (f32_to_i16 + 0)
181c : a5 29 __ LDA ACCU + 0 
181e : 85 45 __ STA T7 + 0 
1820 : 20 c1 20 JSR $20c1 ; (sint16_to_float + 0)
1823 : a2 35 __ LDX #$35
1825 : 20 e5 1c JSR $1ce5 ; (freg + 4)
1828 : a5 2c __ LDA ACCU + 3 
182a : 49 80 __ EOR #$80
182c : 85 2c __ STA ACCU + 3 
182e : 20 2c 1d JSR $1d2c ; (faddsub + 6)
1831 : a9 00 __ LDA #$00
1833 : 85 11 __ STA WORK + 0 
1835 : 85 12 __ STA WORK + 1 
1837 : a9 20 __ LDA #$20
1839 : 85 13 __ STA WORK + 2 
183b : a9 41 __ LDA #$41
183d : 85 14 __ STA WORK + 3 
183f : 20 f5 1c JSR $1cf5 ; (freg + 20)
1842 : 20 13 1e JSR $1e13 ; (crt_fmul + 0)
1845 : a5 2a __ LDA ACCU + 1 
1847 : 85 24 __ STA P9 ; (f + 1)
1849 : a5 2b __ LDA ACCU + 2 
184b : 85 25 __ STA P10 ; (f + 2)
184d : a5 2c __ LDA ACCU + 3 
184f : 85 26 __ STA P11 ; (f + 3)
1851 : 18 __ __ CLC
1852 : a5 45 __ LDA T7 + 0 
1854 : 69 30 __ ADC #$30
1856 : a6 29 __ LDX ACCU + 0 
.l25:
1858 : a4 46 __ LDY T9 + 0 
185a : 91 21 __ STA (P6),y ; (str + 0)
185c : e6 46 __ INC T9 + 0 
185e : e6 48 __ INC T11 + 0 
1860 : a5 48 __ LDA T11 + 0 
1862 : c5 43 __ CMP T5 + 0 
1864 : b0 14 __ BCS $187a ; (nformf.s26 + 0)
.s22:
1866 : c5 3f __ CMP T3 + 0 
1868 : d0 91 __ BNE $17fb ; (nformf.s23 + 0)
.l43:
186a : a9 2e __ LDA #$2e
186c : a4 46 __ LDY T9 + 0 
186e : 91 21 __ STA (P6),y ; (str + 0)
1870 : e6 46 __ INC T9 + 0 
1872 : a5 48 __ LDA T11 + 0 
1874 : c9 07 __ CMP #$07
1876 : 90 8b __ BCC $1803 ; (nformf.s24 + 0)
1878 : b0 85 __ BCS $17ff ; (nformf.l42 + 0)
.s26:
187a : a5 47 __ LDA T10 + 0 
187c : f0 66 __ BEQ $18e4 ; (nformf.s27 + 0)
.s38:
187e : a0 03 __ LDY #$03
1880 : b1 3d __ LDA (T2 + 0),y 
1882 : 69 03 __ ADC #$03
1884 : a4 46 __ LDY T9 + 0 
1886 : 91 21 __ STA (P6),y ; (str + 0)
1888 : c8 __ __ INY
1889 : 84 46 __ STY T9 + 0 
188b : 24 42 __ BIT T4 + 1 
188d : 30 06 __ BMI $1895 ; (nformf.s41 + 0)
.s39:
188f : a9 2b __ LDA #$2b
1891 : 91 21 __ STA (P6),y ; (str + 0)
1893 : d0 11 __ BNE $18a6 ; (nformf.s40 + 0)
.s41:
1895 : a9 2d __ LDA #$2d
1897 : 91 21 __ STA (P6),y ; (str + 0)
1899 : 38 __ __ SEC
189a : a9 00 __ LDA #$00
189c : e5 41 __ SBC T4 + 0 
189e : 85 41 __ STA T4 + 0 
18a0 : a9 00 __ LDA #$00
18a2 : e5 42 __ SBC T4 + 1 
18a4 : 85 42 __ STA T4 + 1 
.s40:
18a6 : e6 46 __ INC T9 + 0 
18a8 : a5 41 __ LDA T4 + 0 
18aa : 85 29 __ STA ACCU + 0 
18ac : a5 42 __ LDA T4 + 1 
18ae : 85 2a __ STA ACCU + 1 
18b0 : a9 0a __ LDA #$0a
18b2 : 85 11 __ STA WORK + 0 
18b4 : a9 00 __ LDA #$00
18b6 : 85 12 __ STA WORK + 1 
18b8 : 20 89 1f JSR $1f89 ; (divs16 + 0)
18bb : 18 __ __ CLC
18bc : a5 29 __ LDA ACCU + 0 
18be : 69 30 __ ADC #$30
18c0 : a4 46 __ LDY T9 + 0 
18c2 : 91 21 __ STA (P6),y ; (str + 0)
18c4 : e6 46 __ INC T9 + 0 
18c6 : a5 41 __ LDA T4 + 0 
18c8 : 85 29 __ STA ACCU + 0 
18ca : a5 42 __ LDA T4 + 1 
18cc : 85 2a __ STA ACCU + 1 
18ce : a9 0a __ LDA #$0a
18d0 : 85 11 __ STA WORK + 0 
18d2 : a9 00 __ LDA #$00
18d4 : 85 12 __ STA WORK + 1 
18d6 : 20 48 20 JSR $2048 ; (mods16 + 0)
18d9 : 18 __ __ CLC
18da : a5 13 __ LDA WORK + 2 
18dc : 69 30 __ ADC #$30
18de : a4 46 __ LDY T9 + 0 
18e0 : 91 21 __ STA (P6),y ; (str + 0)
18e2 : e6 46 __ INC T9 + 0 
.s27:
18e4 : a5 46 __ LDA T9 + 0 
18e6 : a0 01 __ LDY #$01
18e8 : d1 1f __ CMP (P4),y ; (si + 0)
18ea : b0 6d __ BCS $1959 ; (nformf.s3 + 0)
.s28:
18ec : a0 06 __ LDY #$06
18ee : b1 1f __ LDA (P4),y ; (si + 0)
18f0 : f0 04 __ BEQ $18f6 ; (nformf.s29 + 0)
.s110:
18f2 : a6 46 __ LDX T9 + 0 
18f4 : 90 66 __ BCC $195c ; (nformf.l36 + 0)
.s29:
18f6 : a5 46 __ LDA T9 + 0 
18f8 : f0 40 __ BEQ $193a ; (nformf.s30 + 0)
.s35:
18fa : e9 00 __ SBC #$00
18fc : a8 __ __ TAY
18fd : a9 00 __ LDA #$00
18ff : e9 00 __ SBC #$00
1901 : aa __ __ TAX
1902 : 98 __ __ TYA
1903 : 18 __ __ CLC
1904 : 65 21 __ ADC P6 ; (str + 0)
1906 : 85 39 __ STA T1 + 0 
1908 : 8a __ __ TXA
1909 : 65 22 __ ADC P7 ; (str + 1)
190b : 85 3a __ STA T1 + 1 
190d : a9 01 __ LDA #$01
190f : 85 3f __ STA T3 + 0 
1911 : a6 46 __ LDX T9 + 0 
1913 : 38 __ __ SEC
.l111:
1914 : a0 01 __ LDY #$01
1916 : b1 1f __ LDA (P4),y ; (si + 0)
1918 : e5 3f __ SBC T3 + 0 
191a : 85 3d __ STA T2 + 0 
191c : a9 00 __ LDA #$00
191e : e5 40 __ SBC T3 + 1 
1920 : 18 __ __ CLC
1921 : 65 22 __ ADC P7 ; (str + 1)
1923 : 85 3e __ STA T2 + 1 
1925 : 88 __ __ DEY
1926 : b1 39 __ LDA (T1 + 0),y 
1928 : a4 21 __ LDY P6 ; (str + 0)
192a : 91 3d __ STA (T2 + 0),y 
192c : a5 39 __ LDA T1 + 0 
192e : d0 02 __ BNE $1932 ; (nformf.s114 + 0)
.s113:
1930 : c6 3a __ DEC T1 + 1 
.s114:
1932 : c6 39 __ DEC T1 + 0 
1934 : e6 3f __ INC T3 + 0 
1936 : e4 3f __ CPX T3 + 0 
1938 : b0 da __ BCS $1914 ; (nformf.l111 + 0)
.s30:
193a : a9 00 __ LDA #$00
193c : 85 3f __ STA T3 + 0 
193e : 90 08 __ BCC $1948 ; (nformf.l31 + 0)
.s33:
1940 : a9 20 __ LDA #$20
1942 : a4 3f __ LDY T3 + 0 
1944 : 91 21 __ STA (P6),y ; (str + 0)
1946 : e6 3f __ INC T3 + 0 
.l31:
1948 : a0 01 __ LDY #$01
194a : b1 1f __ LDA (P4),y ; (si + 0)
194c : 38 __ __ SEC
194d : e5 46 __ SBC T9 + 0 
194f : 90 ef __ BCC $1940 ; (nformf.s33 + 0)
.s34:
1951 : c5 3f __ CMP T3 + 0 
1953 : 90 02 __ BCC $1957 ; (nformf.s32 + 0)
.s112:
1955 : d0 e9 __ BNE $1940 ; (nformf.s33 + 0)
.s32:
1957 : b1 1f __ LDA (P4),y ; (si + 0)
.s3:
1959 : 85 29 __ STA ACCU + 0 
195b : 60 __ __ RTS
.l36:
195c : 8a __ __ TXA
195d : a0 01 __ LDY #$01
195f : d1 1f __ CMP (P4),y ; (si + 0)
1961 : b0 f4 __ BCS $1957 ; (nformf.s32 + 0)
.s37:
1963 : a8 __ __ TAY
1964 : a9 20 __ LDA #$20
1966 : 91 21 __ STA (P6),y ; (str + 0)
1968 : e8 __ __ INX
1969 : 90 f1 __ BCC $195c ; (nformf.l36 + 0)
.s53:
196b : a5 43 __ LDA T5 + 0 
196d : c9 07 __ CMP #$07
196f : 90 14 __ BCC $1985 ; (nformf.s62 + 0)
.s54:
1971 : ad 74 22 LDA $2274 ; (fround5[0] + 24)
1974 : 85 39 __ STA T1 + 0 
1976 : ad 75 22 LDA $2275 ; (fround5[0] + 25)
1979 : 85 3a __ STA T1 + 1 
197b : ad 76 22 LDA $2276 ; (fround5[0] + 26)
197e : 85 3b __ STA T1 + 2 
1980 : ad 77 22 LDA $2277 ; (fround5[0] + 27)
1983 : b0 15 __ BCS $199a ; (nformf.s55 + 0)
.s62:
1985 : 0a __ __ ASL
1986 : 0a __ __ ASL
1987 : aa __ __ TAX
1988 : bd 58 22 LDA $2258,x ; (pcmHeader[0] + 40)
198b : 85 39 __ STA T1 + 0 
198d : bd 59 22 LDA $2259,x ; (pcmHeader[0] + 41)
1990 : 85 3a __ STA T1 + 1 
1992 : bd 5a 22 LDA $225a,x ; (pcmHeader[0] + 42)
1995 : 85 3b __ STA T1 + 2 
1997 : bd 5b 22 LDA $225b,x ; (pcmHeader[0] + 43)
.s55:
199a : 85 3c __ STA T1 + 3 
199c : a5 35 __ LDA T0 + 0 
199e : 85 29 __ STA ACCU + 0 
19a0 : a5 36 __ LDA T0 + 1 
19a2 : 85 2a __ STA ACCU + 1 
19a4 : a5 37 __ LDA T0 + 2 
19a6 : 85 2b __ STA ACCU + 2 
19a8 : a5 38 __ LDA T0 + 3 
19aa : 85 2c __ STA ACCU + 3 
19ac : a2 39 __ LDX #$39
19ae : 20 e5 1c JSR $1ce5 ; (freg + 4)
19b1 : 20 2c 1d JSR $1d2c ; (faddsub + 6)
19b4 : a5 2a __ LDA ACCU + 1 
19b6 : 85 24 __ STA P9 ; (f + 1)
19b8 : a5 2b __ LDA ACCU + 2 
19ba : 85 25 __ STA P10 ; (f + 2)
19bc : a6 29 __ LDX ACCU + 0 
19be : a5 2c __ LDA ACCU + 3 
19c0 : 85 26 __ STA P11 ; (f + 3)
19c2 : 10 03 __ BPL $19c7 ; (nformf.s57 + 0)
19c4 : 4c d2 17 JMP $17d2 ; (nformf.s18 + 0)
.s57:
19c7 : c9 41 __ CMP #$41
19c9 : d0 0d __ BNE $19d8 ; (nformf.s61 + 0)
.s58:
19cb : a5 25 __ LDA P10 ; (f + 2)
19cd : c9 20 __ CMP #$20
19cf : d0 07 __ BNE $19d8 ; (nformf.s61 + 0)
.s59:
19d1 : a5 24 __ LDA P9 ; (f + 1)
19d3 : d0 03 __ BNE $19d8 ; (nformf.s61 + 0)
.s60:
19d5 : 8a __ __ TXA
19d6 : f0 02 __ BEQ $19da ; (nformf.s56 + 0)
.s61:
19d8 : 90 ea __ BCC $19c4 ; (nformf.s55 + 42)
.s56:
19da : a9 00 __ LDA #$00
19dc : 85 11 __ STA WORK + 0 
19de : 85 12 __ STA WORK + 1 
19e0 : a9 20 __ LDA #$20
19e2 : 85 13 __ STA WORK + 2 
19e4 : a9 41 __ LDA #$41
19e6 : 85 14 __ STA WORK + 3 
19e8 : 20 f5 1c JSR $1cf5 ; (freg + 20)
19eb : 20 db 1e JSR $1edb ; (crt_fdiv + 0)
19ee : a5 2a __ LDA ACCU + 1 
19f0 : 85 24 __ STA P9 ; (f + 1)
19f2 : a5 2b __ LDA ACCU + 2 
19f4 : 85 25 __ STA P10 ; (f + 2)
19f6 : a5 2c __ LDA ACCU + 3 
19f8 : 85 26 __ STA P11 ; (f + 3)
19fa : a6 29 __ LDX ACCU + 0 
19fc : e6 41 __ INC T4 + 0 
19fe : d0 c4 __ BNE $19c4 ; (nformf.s55 + 42)
.s117:
1a00 : e6 42 __ INC T4 + 1 
1a02 : 4c d2 17 JMP $17d2 ; (nformf.s18 + 0)
.s102:
1a05 : 86 35 __ STX T0 + 0 
1a07 : 85 39 __ STA T1 + 0 
1a09 : a0 03 __ LDY #$03
1a0b : b1 1f __ LDA (P4),y ; (si + 0)
1a0d : 18 __ __ CLC
1a0e : 69 08 __ ADC #$08
1a10 : a4 35 __ LDY T0 + 0 
1a12 : 91 21 __ STA (P6),y ; (str + 0)
1a14 : 18 __ __ CLC
1a15 : a0 03 __ LDY #$03
1a17 : b1 1f __ LDA (P4),y ; (si + 0)
1a19 : 69 0d __ ADC #$0d
1a1b : a4 35 __ LDY T0 + 0 
1a1d : c8 __ __ INY
1a1e : 91 21 __ STA (P6),y ; (str + 0)
1a20 : a0 03 __ LDY #$03
1a22 : b1 1f __ LDA (P4),y ; (si + 0)
1a24 : 18 __ __ CLC
1a25 : 69 05 __ ADC #$05
1a27 : a4 39 __ LDY T1 + 0 
1a29 : 91 21 __ STA (P6),y ; (str + 0)
1a2b : 18 __ __ CLC
1a2c : a5 46 __ LDA T9 + 0 
1a2e : 69 03 __ ADC #$03
1a30 : 85 46 __ STA T9 + 0 
1a32 : 4c e4 18 JMP $18e4 ; (nformf.s27 + 0)
.s104:
1a35 : 20 46 1a JSR $1a46 ; (isinf.s4 + 0)
1a38 : a2 01 __ LDX #$01
1a3a : 86 46 __ STX T9 + 0 
1a3c : a8 __ __ TAY
1a3d : d0 03 __ BNE $1a42 ; (nformf.s105 + 0)
1a3f : 4c 59 15 JMP $1559 ; (nformf.s7 + 0)
.s105:
1a42 : a9 03 __ LDA #$03
1a44 : d0 bf __ BNE $1a05 ; (nformf.s102 + 0)
--------------------------------------------------------------------
isinf: ; isinf(float)->bool
;  26, "/mnt/d/F256/oscar64/include/math.h"
.s4:
1a46 : 06 1d __ ASL P2 ; (f + 2)
1a48 : a5 1e __ LDA P3 ; (f + 3)
1a4a : 2a __ __ ROL
1a4b : c9 ff __ CMP #$ff
1a4d : d0 03 __ BNE $1a52 ; (isinf.s6 + 0)
.s5:
1a4f : a9 01 __ LDA #$01
1a51 : 60 __ __ RTS
.s6:
1a52 : a9 00 __ LDA #$00
.s3:
1a54 : 60 __ __ RTS
--------------------------------------------------------------------
1a55 : __ __ __ BYT 25 30 32 78 00                                  : %02x.
--------------------------------------------------------------------
PCMLoopPass: ; PCMLoopPass()->i8
;  25, "/mnt/d/F256/f256lib-oscar64/doodles/sfx6/src/muSfxPlay.h"
.s4:
1a5a : ad f5 21 LDA $21f5 ; (globalPause + 0)
1a5d : d0 29 __ BNE $1a88 ; (PCMLoopPass.s6 + 0)
.s5:
1a5f : ad f6 21 LDA $21f6 ; (countActiveChannels + 0)
1a62 : f0 24 __ BEQ $1a88 ; (PCMLoopPass.s6 + 0)
.s7:
1a64 : ad 04 d7 LDA $d704 
1a67 : 85 29 __ STA ACCU + 0 
1a69 : ad 05 d7 LDA $d705 
1a6c : 29 07 __ AND #$07
1a6e : 85 2a __ STA ACCU + 1 
1a70 : 38 __ __ SEC
1a71 : a9 00 __ LDA #$00
1a73 : e5 29 __ SBC ACCU + 0 
1a75 : aa __ __ TAX
1a76 : a9 08 __ LDA #$08
1a78 : e5 2a __ SBC ACCU + 1 
1a7a : 85 35 __ STA T4 + 0 
1a7c : 8a __ __ TXA
1a7d : 0a __ __ ASL
1a7e : 26 35 __ ROL T4 + 0 
1a80 : 0a __ __ ASL
1a81 : 26 35 __ ROL T4 + 0 
1a83 : 0a __ __ ASL
1a84 : 26 35 __ ROL T4 + 0 
1a86 : d0 05 __ BNE $1a8d ; (PCMLoopPass.s8 + 0)
.s6:
1a88 : a9 00 __ LDA #$00
.s3:
1a8a : 85 29 __ STA ACCU + 0 
1a8c : 60 __ __ RTS
.s8:
1a8d : a9 00 __ LDA #$00
1a8f : 85 38 __ STA T9 + 0 
.l9:
1a91 : a9 00 __ LDA #$00
1a93 : a8 __ __ TAY
.l38:
1a94 : 99 a0 23 STA $23a0,y ; (sums[0] + 0)
1a97 : 99 a1 23 STA $23a1,y ; (sums[0] + 1)
1a9a : c8 __ __ INY
1a9b : c8 __ __ INY
1a9c : c0 40 __ CPY #$40
1a9e : d0 f4 __ BNE $1a94 ; (PCMLoopPass.l38 + 0)
.s10:
1aa0 : 85 39 __ STA T10 + 0 
1aa2 : 85 36 __ STA T5 + 0 
.l11:
1aa4 : a4 36 __ LDY T5 + 0 
1aa6 : b9 08 23 LDA $2308,y ; (sfx[0].isPlaying + 0)
1aa9 : d0 03 __ BNE $1aae ; (PCMLoopPass.s26 + 0)
1aab : 4c 3f 1b JMP $1b3f ; (PCMLoopPass.s12 + 0)
.s26:
1aae : b9 04 23 LDA $2304,y ; (sfx[0].size + 0)
1ab1 : 38 __ __ SEC
1ab2 : f9 06 23 SBC $2306,y ; (sfx[0].offset + 0)
1ab5 : 85 37 __ STA T7 + 0 
1ab7 : b9 05 23 LDA $2305,y ; (sfx[0].size + 1)
1aba : f9 07 23 SBC $2307,y ; (sfx[0].offset + 1)
1abd : d0 06 __ BNE $1ac5 ; (PCMLoopPass.s27 + 0)
.s34:
1abf : a5 37 __ LDA T7 + 0 
1ac1 : c9 20 __ CMP #$20
1ac3 : 90 04 __ BCC $1ac9 ; (PCMLoopPass.s28 + 0)
.s27:
1ac5 : a9 20 __ LDA #$20
1ac7 : 85 37 __ STA T7 + 0 
.s28:
1ac9 : 85 1f __ STA P4 
1acb : b9 00 23 LDA $2300,y ; (sfx[0].startAddr + 0)
1ace : 18 __ __ CLC
1acf : 79 06 23 ADC $2306,y ; (sfx[0].offset + 0)
1ad2 : 85 1b __ STA P0 
1ad4 : b9 01 23 LDA $2301,y ; (sfx[0].startAddr + 1)
1ad7 : 79 07 23 ADC $2307,y ; (sfx[0].offset + 1)
1ada : 85 1c __ STA P1 
1adc : b9 02 23 LDA $2302,y ; (sfx[0].startAddr + 2)
1adf : 69 00 __ ADC #$00
1ae1 : 85 1d __ STA P2 
1ae3 : b9 03 23 LDA $2303,y ; (sfx[0].startAddr + 3)
1ae6 : 69 00 __ ADC #$00
1ae8 : 85 1e __ STA P3 
1aea : 20 af 1b JSR $1baf ; (peek24Block.s4 + 0)
1aed : a5 37 __ LDA T7 + 0 
1aef : f0 2a __ BEQ $1b1b ; (PCMLoopPass.s29 + 0)
.s33:
1af1 : a2 00 __ LDX #$00
1af3 : a0 00 __ LDY #$00
.l35:
1af5 : b9 c9 22 LDA $22c9,y ; (blk[0] + 0)
1af8 : 38 __ __ SEC
1af9 : e9 80 __ SBC #$80
1afb : 85 29 __ STA ACCU + 0 
1afd : a9 00 __ LDA #$00
1aff : e9 00 __ SBC #$00
1b01 : 85 2a __ STA ACCU + 1 
1b03 : bd a0 23 LDA $23a0,x ; (sums[0] + 0)
1b06 : 18 __ __ CLC
1b07 : 65 29 __ ADC ACCU + 0 
1b09 : 9d a0 23 STA $23a0,x ; (sums[0] + 0)
1b0c : bd a1 23 LDA $23a1,x ; (sums[0] + 1)
1b0f : 65 2a __ ADC ACCU + 1 
1b11 : 9d a1 23 STA $23a1,x ; (sums[0] + 1)
1b14 : e8 __ __ INX
1b15 : e8 __ __ INX
1b16 : c8 __ __ INY
1b17 : c4 37 __ CPY T7 + 0 
1b19 : 90 da __ BCC $1af5 ; (PCMLoopPass.l35 + 0)
.s29:
1b1b : a6 36 __ LDX T5 + 0 
1b1d : bd 06 23 LDA $2306,x ; (sfx[0].offset + 0)
1b20 : 18 __ __ CLC
1b21 : 65 37 __ ADC T7 + 0 
1b23 : 9d 06 23 STA $2306,x ; (sfx[0].offset + 0)
1b26 : a8 __ __ TAY
1b27 : bd 07 23 LDA $2307,x ; (sfx[0].offset + 1)
1b2a : 69 00 __ ADC #$00
1b2c : 9d 07 23 STA $2307,x ; (sfx[0].offset + 1)
1b2f : dd 05 23 CMP $2305,x ; (sfx[0].size + 1)
1b32 : d0 04 __ BNE $1b38 ; (PCMLoopPass.s32 + 0)
.s31:
1b34 : 98 __ __ TYA
1b35 : dd 04 23 CMP $2304,x ; (sfx[0].size + 0)
.s32:
1b38 : 90 05 __ BCC $1b3f ; (PCMLoopPass.s12 + 0)
.s30:
1b3a : a5 39 __ LDA T10 + 0 
1b3c : 20 e1 1b JSR $1be1 ; (stopSound.s4 + 0)
.s12:
1b3f : 18 __ __ CLC
1b40 : a5 36 __ LDA T5 + 0 
1b42 : 69 0a __ ADC #$0a
1b44 : 85 36 __ STA T5 + 0 
1b46 : e6 39 __ INC T10 + 0 
1b48 : a5 39 __ LDA T10 + 0 
1b4a : c9 10 __ CMP #$10
1b4c : b0 03 __ BCS $1b51 ; (PCMLoopPass.s13 + 0)
1b4e : 4c a4 1a JMP $1aa4 ; (PCMLoopPass.l11 + 0)
.s13:
1b51 : a9 00 __ LDA #$00
1b53 : 85 29 __ STA ACCU + 0 
.l14:
1b55 : 0a __ __ ASL
1b56 : a8 __ __ TAY
1b57 : be a0 23 LDX $23a0,y ; (sums[0] + 0)
1b5a : b9 a1 23 LDA $23a1,y ; (sums[0] + 1)
1b5d : 30 09 __ BMI $1b68 ; (PCMLoopPass.s15 + 0)
.s25:
1b5f : d0 03 __ BNE $1b64 ; (PCMLoopPass.s23 + 0)
.s24:
1b61 : 8a __ __ TXA
1b62 : 10 04 __ BPL $1b68 ; (PCMLoopPass.s15 + 0)
.s23:
1b64 : a2 7f __ LDX #$7f
1b66 : d0 0f __ BNE $1b77 ; (PCMLoopPass.s16 + 0)
.s15:
1b68 : b9 a1 23 LDA $23a1,y ; (sums[0] + 1)
1b6b : 49 80 __ EOR #$80
1b6d : c9 7f __ CMP #$7f
1b6f : d0 02 __ BNE $1b73 ; (PCMLoopPass.s22 + 0)
.s21:
1b71 : e0 80 __ CPX #$80
.s22:
1b73 : b0 02 __ BCS $1b77 ; (PCMLoopPass.s16 + 0)
.s20:
1b75 : a2 80 __ LDX #$80
.s16:
1b77 : 8a __ __ TXA
1b78 : 49 80 __ EOR #$80
1b7a : a6 29 __ LDX ACCU + 0 
1b7c : e8 __ __ INX
1b7d : 86 29 __ STX ACCU + 0 
1b7f : 9d cd 9f STA $9fcd,x ; (buff[0] + 41)
1b82 : 8a __ __ TXA
1b83 : e0 20 __ CPX #$20
1b85 : d0 ce __ BNE $1b55 ; (PCMLoopPass.l14 + 0)
.s17:
1b87 : a2 00 __ LDX #$00
.l36:
1b89 : bd ce 9f LDA $9fce,x ; (buf32[0] + 0)
1b8c : 8d 07 d7 STA $d707 
1b8f : e8 __ __ INX
1b90 : e0 20 __ CPX #$20
1b92 : d0 f5 __ BNE $1b89 ; (PCMLoopPass.l36 + 0)
.s37:
1b94 : ad f6 21 LDA $21f6 ; (countActiveChannels + 0)
1b97 : f0 0e __ BEQ $1ba7 ; (PCMLoopPass.s18 + 0)
.s19:
1b99 : e6 38 __ INC T9 + 0 
1b9b : a5 38 __ LDA T9 + 0 
1b9d : c5 35 __ CMP T4 + 0 
1b9f : b0 03 __ BCS $1ba4 ; (PCMLoopPass.s19 + 11)
1ba1 : 4c 91 1a JMP $1a91 ; (PCMLoopPass.l9 + 0)
1ba4 : 4c 88 1a JMP $1a88 ; (PCMLoopPass.s6 + 0)
.s18:
1ba7 : 20 93 09 JSR $0993 ; (silencePad.s4 + 0)
1baa : a9 01 __ LDA #$01
1bac : 4c 8a 1a JMP $1a8a ; (PCMLoopPass.s3 + 0)
--------------------------------------------------------------------
peek24Block: ; peek24Block(u32,u8)->void
;   6, "/mnt/d/F256/f256lib-oscar64/doodles/sfx6/src/muGen2RAM.h"
.s4:
1baf : a5 1b __ LDA P0 
1bb1 : 85 05 __ STA $05 
1bb3 : a5 1c __ LDA P1 
1bb5 : 85 06 __ STA $06 
1bb7 : a5 1d __ LDA P2 
1bb9 : 85 07 __ STA $07 
1bbb : a4 1f __ LDY P4 
1bbd : 88 __ __ DEY
1bbe : a6 00 __ LDX $00 
1bc0 : a5 01 __ LDA $01 
1bc2 : 85 04 __ STA $04 
1bc4 : 08 __ __ PHP
1bc5 : 78 __ __ SEI
1bc6 : 8a __ __ TXA
1bc7 : 09 08 __ ORA #$08
1bc9 : 85 00 __ STA $00 
1bcb : a5 04 __ LDA $04 
1bcd : 09 30 __ ORA #$30
1bcf : 85 01 __ STA $01 
1bd1 : b7 __ __ INV
1bd2 : 05 99 __ ORA $99 
1bd4 : c9 22 __ CMP #$22
1bd6 : 88 __ __ DEY
1bd7 : 10 f8 __ BPL $1bd1 ; (peek24Block.s4 + 34)
1bd9 : 86 00 __ STX $00 
1bdb : a5 04 __ LDA $04 
1bdd : 85 01 __ STA $01 
1bdf : 28 __ __ PLP
.s3:
1be0 : 60 __ __ RTS
--------------------------------------------------------------------
stopSound: ; stopSound(u8)->void
;  24, "/mnt/d/F256/f256lib-oscar64/doodles/sfx6/src/muSfxPlay.h"
.s4:
1be1 : a8 __ __ TAY
1be2 : a9 00 __ LDA #$00
1be4 : be df 21 LDX $21df,y ; (__multab10L + 0)
1be7 : 9d 06 23 STA $2306,x ; (sfx[0].offset + 0)
1bea : 9d 07 23 STA $2307,x ; (sfx[0].offset + 1)
1bed : 9d 08 23 STA $2308,x ; (sfx[0].isPlaying + 0)
1bf0 : ce f6 21 DEC $21f6 ; (countActiveChannels + 0)
.s3:
1bf3 : 60 __ __ RTS
--------------------------------------------------------------------
dealKeyboard: ; dealKeyboard()->void
;  52, "/mnt/d/F256/f256lib-oscar64/doodles/sfx6/src/sfx6.c"
.s4:
1bf4 : 20 41 1c JSR $1c41 ; (kernelNextEvent.s4 + 0)
1bf7 : ad f9 21 LDA $21f9 ; (kernelEventData.type + 0)
1bfa : c9 08 __ CMP #$08
1bfc : d0 24 __ BNE $1c22 ; (dealKeyboard.s3 + 0)
.s5:
1bfe : ad fd 21 LDA $21fd ; (kernelEventData.u + 1)
1c01 : c9 35 __ CMP #$35
1c03 : d0 05 __ BNE $1c0a ; (dealKeyboard.s6 + 0)
.s21:
1c05 : a9 04 __ LDA #$04
.s22:
1c07 : 4c 71 1c JMP $1c71 ; (startSound.s4 + 0)
.s6:
1c0a : 90 17 __ BCC $1c23 ; (dealKeyboard.s13 + 0)
.s7:
1c0c : c9 37 __ CMP #$37
1c0e : d0 04 __ BNE $1c14 ; (dealKeyboard.s8 + 0)
.s12:
1c10 : a9 06 __ LDA #$06
1c12 : d0 f3 __ BNE $1c07 ; (dealKeyboard.s22 + 0)
.s8:
1c14 : b0 04 __ BCS $1c1a ; (dealKeyboard.s9 + 0)
.s11:
1c16 : a9 05 __ LDA #$05
1c18 : 90 ed __ BCC $1c07 ; (dealKeyboard.s22 + 0)
.s9:
1c1a : c9 38 __ CMP #$38
1c1c : d0 04 __ BNE $1c22 ; (dealKeyboard.s3 + 0)
.s10:
1c1e : a9 07 __ LDA #$07
1c20 : d0 e5 __ BNE $1c07 ; (dealKeyboard.s22 + 0)
.s3:
1c22 : 60 __ __ RTS
.s13:
1c23 : c9 33 __ CMP #$33
1c25 : d0 04 __ BNE $1c2b ; (dealKeyboard.s14 + 0)
.s20:
1c27 : a9 02 __ LDA #$02
1c29 : d0 dc __ BNE $1c07 ; (dealKeyboard.s22 + 0)
.s14:
1c2b : 90 04 __ BCC $1c31 ; (dealKeyboard.s16 + 0)
.s15:
1c2d : a9 03 __ LDA #$03
1c2f : b0 d6 __ BCS $1c07 ; (dealKeyboard.s22 + 0)
.s16:
1c31 : c9 31 __ CMP #$31
1c33 : d0 04 __ BNE $1c39 ; (dealKeyboard.s17 + 0)
.s19:
1c35 : a9 00 __ LDA #$00
1c37 : f0 ce __ BEQ $1c07 ; (dealKeyboard.s22 + 0)
.s17:
1c39 : c9 32 __ CMP #$32
1c3b : d0 e5 __ BNE $1c22 ; (dealKeyboard.s3 + 0)
.s18:
1c3d : a9 01 __ LDA #$01
1c3f : d0 c6 __ BNE $1c07 ; (dealKeyboard.s22 + 0)
--------------------------------------------------------------------
kernelNextEvent: ; kernelNextEvent()->u8
;  66, "/mnt/d/F256/f256lib-oscar64/f256lib/f_kernel.h"
.s4:
1c41 : a9 00 __ LDA #$00
1c43 : 8d c6 22 STA $22c6 ; (_kern_target + 0)
1c46 : 8d f9 21 STA $21f9 ; (kernelEventData.type + 0)
1c49 : a9 ff __ LDA #$ff
1c4b : 8d c7 22 STA $22c7 ; (_kern_target + 1)
1c4e : 4c 51 1c JMP $1c51 ; (_kernelCallWrapper.s4 + 0)
--------------------------------------------------------------------
_kernelCallWrapper: ; _kernelCallWrapper()->u8
;  56, "/mnt/d/F256/f256lib-oscar64/f256lib/f_kernel.h"
.s4:
1c51 : 20 59 1c JSR $1c59 ; (_kernelCallRaw + 0)
1c54 : 85 29 __ STA ACCU + 0 
.s3:
1c56 : a5 29 __ LDA ACCU + 0 
1c58 : 60 __ __ RTS
--------------------------------------------------------------------
_kernelCallRaw: ; _kernelCallRaw
1c59 : ad c6 22 LDA $22c6 ; (_kern_target + 0)
1c5c : 8d 66 1c STA $1c66 ; (_kernelCallRaw + 13)
1c5f : ad c7 22 LDA $22c7 ; (_kern_target + 1)
1c62 : 8d 67 1c STA $1c67 ; (_kernelCallRaw + 14)
1c65 : 20 00 00 JSR $0000 
1c68 : aa __ __ TAX
1c69 : a9 00 __ LDA #$00
1c6b : 6a __ __ ROR
1c6c : 8d c8 22 STA $22c8 ; (_kernelError + 0)
1c6f : 8a __ __ TXA
1c70 : 60 __ __ RTS
--------------------------------------------------------------------
startSound: ; startSound(u8)->void
;  23, "/mnt/d/F256/f256lib-oscar64/doodles/sfx6/src/muSfxPlay.h"
.s4:
1c71 : aa __ __ TAX
1c72 : a9 00 __ LDA #$00
1c74 : bc df 21 LDY $21df,x ; (__multab10L + 0)
1c77 : 99 06 23 STA $2306,y ; (sfx[0].offset + 0)
1c7a : 99 07 23 STA $2307,y ; (sfx[0].offset + 1)
1c7d : a9 01 __ LDA #$01
1c7f : be 08 23 LDX $2308,y ; (sfx[0].isPlaying + 0)
1c82 : 99 08 23 STA $2308,y ; (sfx[0].isPlaying + 0)
1c85 : 8a __ __ TXA
1c86 : d0 03 __ BNE $1c8b ; (startSound.s3 + 0)
.s5:
1c88 : ee f6 21 INC $21f6 ; (countActiveChannels + 0)
.s3:
1c8b : 60 __ __ RTS
--------------------------------------------------------------------
f256Reset: ; f256Reset()->void
; 212, "/mnt/d/F256/f256lib-oscar64/f256lib/f256lib.h"
.s4:
1c8c : 78 __ __ SEI
1c8d : a9 07 __ LDA #$07
1c8f : 85 0f __ STA $0f 
1c91 : a9 de __ LDA #$de
1c93 : 8d a2 d6 STA $d6a2 
1c96 : a9 ad __ LDA #$ad
1c98 : 8d a3 d6 STA $d6a3 
1c9b : a9 f0 __ LDA #$f0
1c9d : 8d a0 d6 STA $d6a0 
1ca0 : a9 00 __ LDA #$00
1ca2 : 8d a0 d6 STA $d6a0 
1ca5 : 6c fc ff JMP ($fffc)
.s3:
1ca8 : 60 __ __ RTS
--------------------------------------------------------------------
mul16by8: ; mul16by8
1ca9 : 4a __ __ LSR
1caa : f0 2e __ BEQ $1cda ; (mul16by8 + 49)
1cac : a2 00 __ LDX #$00
1cae : a0 00 __ LDY #$00
1cb0 : 90 13 __ BCC $1cc5 ; (mul16by8 + 28)
1cb2 : a4 29 __ LDY ACCU + 0 
1cb4 : a6 2a __ LDX ACCU + 1 
1cb6 : b0 0d __ BCS $1cc5 ; (mul16by8 + 28)
1cb8 : 85 10 __ STA $10 
1cba : 18 __ __ CLC
1cbb : 98 __ __ TYA
1cbc : 65 29 __ ADC ACCU + 0 
1cbe : a8 __ __ TAY
1cbf : 8a __ __ TXA
1cc0 : 65 2a __ ADC ACCU + 1 
1cc2 : aa __ __ TAX
1cc3 : a5 10 __ LDA $10 
1cc5 : 06 29 __ ASL ACCU + 0 
1cc7 : 26 2a __ ROL ACCU + 1 
1cc9 : 4a __ __ LSR
1cca : 90 f9 __ BCC $1cc5 ; (mul16by8 + 28)
1ccc : d0 ea __ BNE $1cb8 ; (mul16by8 + 15)
1cce : 18 __ __ CLC
1ccf : 98 __ __ TYA
1cd0 : 65 29 __ ADC ACCU + 0 
1cd2 : 85 29 __ STA ACCU + 0 
1cd4 : 8a __ __ TXA
1cd5 : 65 2a __ ADC ACCU + 1 
1cd7 : 85 2a __ STA ACCU + 1 
1cd9 : 60 __ __ RTS
1cda : b0 04 __ BCS $1ce0 ; (mul16by8 + 55)
1cdc : 85 29 __ STA ACCU + 0 
1cde : 85 2a __ STA ACCU + 1 
1ce0 : 60 __ __ RTS
--------------------------------------------------------------------
freg: ; freg
1ce1 : b1 27 __ LDA (IP + 0),y 
1ce3 : c8 __ __ INY
1ce4 : aa __ __ TAX
1ce5 : b5 00 __ LDA $00,x 
1ce7 : 85 11 __ STA WORK + 0 
1ce9 : b5 01 __ LDA $01,x 
1ceb : 85 12 __ STA WORK + 1 
1ced : b5 02 __ LDA $02,x 
1cef : 85 13 __ STA WORK + 2 
1cf1 : b5 03 __ LDA $03,x 
1cf3 : 85 14 __ STA WORK + 3 
1cf5 : a5 13 __ LDA WORK + 2 
1cf7 : 0a __ __ ASL
1cf8 : a5 14 __ LDA WORK + 3 
1cfa : 2a __ __ ROL
1cfb : 85 16 __ STA WORK + 5 
1cfd : f0 06 __ BEQ $1d05 ; (freg + 36)
1cff : a5 13 __ LDA WORK + 2 
1d01 : 09 80 __ ORA #$80
1d03 : 85 13 __ STA WORK + 2 
1d05 : a5 2b __ LDA ACCU + 2 
1d07 : 0a __ __ ASL
1d08 : a5 2c __ LDA ACCU + 3 
1d0a : 2a __ __ ROL
1d0b : 85 15 __ STA WORK + 4 
1d0d : f0 06 __ BEQ $1d15 ; (freg + 52)
1d0f : a5 2b __ LDA ACCU + 2 
1d11 : 09 80 __ ORA #$80
1d13 : 85 2b __ STA ACCU + 2 
1d15 : 60 __ __ RTS
1d16 : 06 2c __ ASL ACCU + 3 
1d18 : a5 15 __ LDA WORK + 4 
1d1a : 6a __ __ ROR
1d1b : 85 2c __ STA ACCU + 3 
1d1d : b0 06 __ BCS $1d25 ; (freg + 68)
1d1f : a5 2b __ LDA ACCU + 2 
1d21 : 29 7f __ AND #$7f
1d23 : 85 2b __ STA ACCU + 2 
1d25 : 60 __ __ RTS
--------------------------------------------------------------------
faddsub: ; faddsub
1d26 : a5 14 __ LDA WORK + 3 
1d28 : 49 80 __ EOR #$80
1d2a : 85 14 __ STA WORK + 3 
1d2c : a9 ff __ LDA #$ff
1d2e : c5 15 __ CMP WORK + 4 
1d30 : f0 04 __ BEQ $1d36 ; (faddsub + 16)
1d32 : c5 16 __ CMP WORK + 5 
1d34 : d0 11 __ BNE $1d47 ; (faddsub + 33)
1d36 : a5 2c __ LDA ACCU + 3 
1d38 : 09 7f __ ORA #$7f
1d3a : 85 2c __ STA ACCU + 3 
1d3c : a9 80 __ LDA #$80
1d3e : 85 2b __ STA ACCU + 2 
1d40 : a9 00 __ LDA #$00
1d42 : 85 29 __ STA ACCU + 0 
1d44 : 85 2a __ STA ACCU + 1 
1d46 : 60 __ __ RTS
1d47 : 38 __ __ SEC
1d48 : a5 15 __ LDA WORK + 4 
1d4a : e5 16 __ SBC WORK + 5 
1d4c : f0 38 __ BEQ $1d86 ; (faddsub + 96)
1d4e : aa __ __ TAX
1d4f : b0 25 __ BCS $1d76 ; (faddsub + 80)
1d51 : e0 e9 __ CPX #$e9
1d53 : b0 0e __ BCS $1d63 ; (faddsub + 61)
1d55 : a5 16 __ LDA WORK + 5 
1d57 : 85 15 __ STA WORK + 4 
1d59 : a9 00 __ LDA #$00
1d5b : 85 29 __ STA ACCU + 0 
1d5d : 85 2a __ STA ACCU + 1 
1d5f : 85 2b __ STA ACCU + 2 
1d61 : f0 23 __ BEQ $1d86 ; (faddsub + 96)
1d63 : a5 2b __ LDA ACCU + 2 
1d65 : 4a __ __ LSR
1d66 : 66 2a __ ROR ACCU + 1 
1d68 : 66 29 __ ROR ACCU + 0 
1d6a : e8 __ __ INX
1d6b : d0 f8 __ BNE $1d65 ; (faddsub + 63)
1d6d : 85 2b __ STA ACCU + 2 
1d6f : a5 16 __ LDA WORK + 5 
1d71 : 85 15 __ STA WORK + 4 
1d73 : 4c 86 1d JMP $1d86 ; (faddsub + 96)
1d76 : e0 18 __ CPX #$18
1d78 : b0 33 __ BCS $1dad ; (faddsub + 135)
1d7a : a5 13 __ LDA WORK + 2 
1d7c : 4a __ __ LSR
1d7d : 66 12 __ ROR WORK + 1 
1d7f : 66 11 __ ROR WORK + 0 
1d81 : ca __ __ DEX
1d82 : d0 f8 __ BNE $1d7c ; (faddsub + 86)
1d84 : 85 13 __ STA WORK + 2 
1d86 : a5 2c __ LDA ACCU + 3 
1d88 : 29 80 __ AND #$80
1d8a : 85 2c __ STA ACCU + 3 
1d8c : 45 14 __ EOR WORK + 3 
1d8e : 30 31 __ BMI $1dc1 ; (faddsub + 155)
1d90 : 18 __ __ CLC
1d91 : a5 29 __ LDA ACCU + 0 
1d93 : 65 11 __ ADC WORK + 0 
1d95 : 85 29 __ STA ACCU + 0 
1d97 : a5 2a __ LDA ACCU + 1 
1d99 : 65 12 __ ADC WORK + 1 
1d9b : 85 2a __ STA ACCU + 1 
1d9d : a5 2b __ LDA ACCU + 2 
1d9f : 65 13 __ ADC WORK + 2 
1da1 : 85 2b __ STA ACCU + 2 
1da3 : 90 08 __ BCC $1dad ; (faddsub + 135)
1da5 : 66 2b __ ROR ACCU + 2 
1da7 : 66 2a __ ROR ACCU + 1 
1da9 : 66 29 __ ROR ACCU + 0 
1dab : e6 15 __ INC WORK + 4 
1dad : a5 15 __ LDA WORK + 4 
1daf : c9 ff __ CMP #$ff
1db1 : f0 83 __ BEQ $1d36 ; (faddsub + 16)
1db3 : 4a __ __ LSR
1db4 : 05 2c __ ORA ACCU + 3 
1db6 : 85 2c __ STA ACCU + 3 
1db8 : b0 06 __ BCS $1dc0 ; (faddsub + 154)
1dba : a5 2b __ LDA ACCU + 2 
1dbc : 29 7f __ AND #$7f
1dbe : 85 2b __ STA ACCU + 2 
1dc0 : 60 __ __ RTS
1dc1 : 38 __ __ SEC
1dc2 : a5 29 __ LDA ACCU + 0 
1dc4 : e5 11 __ SBC WORK + 0 
1dc6 : 85 29 __ STA ACCU + 0 
1dc8 : a5 2a __ LDA ACCU + 1 
1dca : e5 12 __ SBC WORK + 1 
1dcc : 85 2a __ STA ACCU + 1 
1dce : a5 2b __ LDA ACCU + 2 
1dd0 : e5 13 __ SBC WORK + 2 
1dd2 : 85 2b __ STA ACCU + 2 
1dd4 : b0 19 __ BCS $1def ; (faddsub + 201)
1dd6 : 38 __ __ SEC
1dd7 : a9 00 __ LDA #$00
1dd9 : e5 29 __ SBC ACCU + 0 
1ddb : 85 29 __ STA ACCU + 0 
1ddd : a9 00 __ LDA #$00
1ddf : e5 2a __ SBC ACCU + 1 
1de1 : 85 2a __ STA ACCU + 1 
1de3 : a9 00 __ LDA #$00
1de5 : e5 2b __ SBC ACCU + 2 
1de7 : 85 2b __ STA ACCU + 2 
1de9 : a5 2c __ LDA ACCU + 3 
1deb : 49 80 __ EOR #$80
1ded : 85 2c __ STA ACCU + 3 
1def : a5 2b __ LDA ACCU + 2 
1df1 : 30 ba __ BMI $1dad ; (faddsub + 135)
1df3 : 05 2a __ ORA ACCU + 1 
1df5 : 05 29 __ ORA ACCU + 0 
1df7 : f0 0f __ BEQ $1e08 ; (faddsub + 226)
1df9 : c6 15 __ DEC WORK + 4 
1dfb : f0 0b __ BEQ $1e08 ; (faddsub + 226)
1dfd : 06 29 __ ASL ACCU + 0 
1dff : 26 2a __ ROL ACCU + 1 
1e01 : 26 2b __ ROL ACCU + 2 
1e03 : 10 f4 __ BPL $1df9 ; (faddsub + 211)
1e05 : 4c ad 1d JMP $1dad ; (faddsub + 135)
1e08 : a9 00 __ LDA #$00
1e0a : 85 29 __ STA ACCU + 0 
1e0c : 85 2a __ STA ACCU + 1 
1e0e : 85 2b __ STA ACCU + 2 
1e10 : 85 2c __ STA ACCU + 3 
1e12 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul: ; crt_fmul
1e13 : a5 29 __ LDA ACCU + 0 
1e15 : 05 2a __ ORA ACCU + 1 
1e17 : 05 2b __ ORA ACCU + 2 
1e19 : f0 0e __ BEQ $1e29 ; (crt_fmul + 22)
1e1b : a5 11 __ LDA WORK + 0 
1e1d : 05 12 __ ORA WORK + 1 
1e1f : 05 13 __ ORA WORK + 2 
1e21 : d0 09 __ BNE $1e2c ; (crt_fmul + 25)
1e23 : 85 29 __ STA ACCU + 0 
1e25 : 85 2a __ STA ACCU + 1 
1e27 : 85 2b __ STA ACCU + 2 
1e29 : 85 2c __ STA ACCU + 3 
1e2b : 60 __ __ RTS
1e2c : a5 2c __ LDA ACCU + 3 
1e2e : 45 14 __ EOR WORK + 3 
1e30 : 29 80 __ AND #$80
1e32 : 85 2c __ STA ACCU + 3 
1e34 : a9 ff __ LDA #$ff
1e36 : c5 15 __ CMP WORK + 4 
1e38 : f0 42 __ BEQ $1e7c ; (crt_fmul + 105)
1e3a : c5 16 __ CMP WORK + 5 
1e3c : f0 3e __ BEQ $1e7c ; (crt_fmul + 105)
1e3e : a9 00 __ LDA #$00
1e40 : 85 17 __ STA WORK + 6 
1e42 : 85 18 __ STA WORK + 7 
1e44 : 85 19 __ STA WORK + 8 
1e46 : a4 29 __ LDY ACCU + 0 
1e48 : a5 11 __ LDA WORK + 0 
1e4a : d0 06 __ BNE $1e52 ; (crt_fmul + 63)
1e4c : a5 12 __ LDA WORK + 1 
1e4e : f0 0a __ BEQ $1e5a ; (crt_fmul + 71)
1e50 : d0 05 __ BNE $1e57 ; (crt_fmul + 68)
1e52 : 20 ad 1e JSR $1ead ; (crt_fmul8 + 0)
1e55 : a5 12 __ LDA WORK + 1 
1e57 : 20 ad 1e JSR $1ead ; (crt_fmul8 + 0)
1e5a : a5 13 __ LDA WORK + 2 
1e5c : 20 ad 1e JSR $1ead ; (crt_fmul8 + 0)
1e5f : 38 __ __ SEC
1e60 : a5 19 __ LDA WORK + 8 
1e62 : 30 06 __ BMI $1e6a ; (crt_fmul + 87)
1e64 : 06 17 __ ASL WORK + 6 
1e66 : 26 18 __ ROL WORK + 7 
1e68 : 2a __ __ ROL
1e69 : 18 __ __ CLC
1e6a : 29 7f __ AND #$7f
1e6c : 85 19 __ STA WORK + 8 
1e6e : a5 15 __ LDA WORK + 4 
1e70 : 65 16 __ ADC WORK + 5 
1e72 : 90 19 __ BCC $1e8d ; (crt_fmul + 122)
1e74 : e9 7f __ SBC #$7f
1e76 : b0 04 __ BCS $1e7c ; (crt_fmul + 105)
1e78 : c9 ff __ CMP #$ff
1e7a : d0 15 __ BNE $1e91 ; (crt_fmul + 126)
1e7c : a5 2c __ LDA ACCU + 3 
1e7e : 09 7f __ ORA #$7f
1e80 : 85 2c __ STA ACCU + 3 
1e82 : a9 80 __ LDA #$80
1e84 : 85 2b __ STA ACCU + 2 
1e86 : a9 00 __ LDA #$00
1e88 : 85 29 __ STA ACCU + 0 
1e8a : 85 2a __ STA ACCU + 1 
1e8c : 60 __ __ RTS
1e8d : e9 7e __ SBC #$7e
1e8f : 90 15 __ BCC $1ea6 ; (crt_fmul + 147)
1e91 : 4a __ __ LSR
1e92 : 05 2c __ ORA ACCU + 3 
1e94 : 85 2c __ STA ACCU + 3 
1e96 : a9 00 __ LDA #$00
1e98 : 6a __ __ ROR
1e99 : 05 19 __ ORA WORK + 8 
1e9b : 85 2b __ STA ACCU + 2 
1e9d : a5 18 __ LDA WORK + 7 
1e9f : 85 2a __ STA ACCU + 1 
1ea1 : a5 17 __ LDA WORK + 6 
1ea3 : 85 29 __ STA ACCU + 0 
1ea5 : 60 __ __ RTS
1ea6 : a9 00 __ LDA #$00
1ea8 : 85 2c __ STA ACCU + 3 
1eaa : f0 d8 __ BEQ $1e84 ; (crt_fmul + 113)
1eac : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul8: ; crt_fmul8
1ead : 38 __ __ SEC
1eae : 6a __ __ ROR
1eaf : 90 1e __ BCC $1ecf ; (crt_fmul8 + 34)
1eb1 : aa __ __ TAX
1eb2 : 18 __ __ CLC
1eb3 : 98 __ __ TYA
1eb4 : 65 17 __ ADC WORK + 6 
1eb6 : 85 17 __ STA WORK + 6 
1eb8 : a5 18 __ LDA WORK + 7 
1eba : 65 2a __ ADC ACCU + 1 
1ebc : 85 18 __ STA WORK + 7 
1ebe : a5 19 __ LDA WORK + 8 
1ec0 : 65 2b __ ADC ACCU + 2 
1ec2 : 6a __ __ ROR
1ec3 : 85 19 __ STA WORK + 8 
1ec5 : 8a __ __ TXA
1ec6 : 66 18 __ ROR WORK + 7 
1ec8 : 66 17 __ ROR WORK + 6 
1eca : 4a __ __ LSR
1ecb : f0 0d __ BEQ $1eda ; (crt_fmul8 + 45)
1ecd : b0 e2 __ BCS $1eb1 ; (crt_fmul8 + 4)
1ecf : 66 19 __ ROR WORK + 8 
1ed1 : 66 18 __ ROR WORK + 7 
1ed3 : 66 17 __ ROR WORK + 6 
1ed5 : 4a __ __ LSR
1ed6 : 90 f7 __ BCC $1ecf ; (crt_fmul8 + 34)
1ed8 : d0 d7 __ BNE $1eb1 ; (crt_fmul8 + 4)
1eda : 60 __ __ RTS
--------------------------------------------------------------------
crt_fdiv: ; crt_fdiv
1edb : a5 29 __ LDA ACCU + 0 
1edd : 05 2a __ ORA ACCU + 1 
1edf : 05 2b __ ORA ACCU + 2 
1ee1 : d0 03 __ BNE $1ee6 ; (crt_fdiv + 11)
1ee3 : 85 2c __ STA ACCU + 3 
1ee5 : 60 __ __ RTS
1ee6 : a5 2c __ LDA ACCU + 3 
1ee8 : 45 14 __ EOR WORK + 3 
1eea : 29 80 __ AND #$80
1eec : 85 2c __ STA ACCU + 3 
1eee : a5 16 __ LDA WORK + 5 
1ef0 : f0 62 __ BEQ $1f54 ; (crt_fdiv + 121)
1ef2 : a5 15 __ LDA WORK + 4 
1ef4 : c9 ff __ CMP #$ff
1ef6 : f0 5c __ BEQ $1f54 ; (crt_fdiv + 121)
1ef8 : a9 00 __ LDA #$00
1efa : 85 17 __ STA WORK + 6 
1efc : 85 18 __ STA WORK + 7 
1efe : 85 19 __ STA WORK + 8 
1f00 : a2 18 __ LDX #$18
1f02 : a5 29 __ LDA ACCU + 0 
1f04 : c5 11 __ CMP WORK + 0 
1f06 : a5 2a __ LDA ACCU + 1 
1f08 : e5 12 __ SBC WORK + 1 
1f0a : a5 2b __ LDA ACCU + 2 
1f0c : e5 13 __ SBC WORK + 2 
1f0e : 90 13 __ BCC $1f23 ; (crt_fdiv + 72)
1f10 : a5 29 __ LDA ACCU + 0 
1f12 : e5 11 __ SBC WORK + 0 
1f14 : 85 29 __ STA ACCU + 0 
1f16 : a5 2a __ LDA ACCU + 1 
1f18 : e5 12 __ SBC WORK + 1 
1f1a : 85 2a __ STA ACCU + 1 
1f1c : a5 2b __ LDA ACCU + 2 
1f1e : e5 13 __ SBC WORK + 2 
1f20 : 85 2b __ STA ACCU + 2 
1f22 : 38 __ __ SEC
1f23 : 26 17 __ ROL WORK + 6 
1f25 : 26 18 __ ROL WORK + 7 
1f27 : 26 19 __ ROL WORK + 8 
1f29 : ca __ __ DEX
1f2a : f0 0a __ BEQ $1f36 ; (crt_fdiv + 91)
1f2c : 06 29 __ ASL ACCU + 0 
1f2e : 26 2a __ ROL ACCU + 1 
1f30 : 26 2b __ ROL ACCU + 2 
1f32 : b0 dc __ BCS $1f10 ; (crt_fdiv + 53)
1f34 : 90 cc __ BCC $1f02 ; (crt_fdiv + 39)
1f36 : 38 __ __ SEC
1f37 : a5 19 __ LDA WORK + 8 
1f39 : 30 06 __ BMI $1f41 ; (crt_fdiv + 102)
1f3b : 06 17 __ ASL WORK + 6 
1f3d : 26 18 __ ROL WORK + 7 
1f3f : 2a __ __ ROL
1f40 : 18 __ __ CLC
1f41 : 29 7f __ AND #$7f
1f43 : 85 19 __ STA WORK + 8 
1f45 : a5 15 __ LDA WORK + 4 
1f47 : e5 16 __ SBC WORK + 5 
1f49 : 90 1a __ BCC $1f65 ; (crt_fdiv + 138)
1f4b : 18 __ __ CLC
1f4c : 69 7f __ ADC #$7f
1f4e : b0 04 __ BCS $1f54 ; (crt_fdiv + 121)
1f50 : c9 ff __ CMP #$ff
1f52 : d0 15 __ BNE $1f69 ; (crt_fdiv + 142)
1f54 : a5 2c __ LDA ACCU + 3 
1f56 : 09 7f __ ORA #$7f
1f58 : 85 2c __ STA ACCU + 3 
1f5a : a9 80 __ LDA #$80
1f5c : 85 2b __ STA ACCU + 2 
1f5e : a9 00 __ LDA #$00
1f60 : 85 2a __ STA ACCU + 1 
1f62 : 85 29 __ STA ACCU + 0 
1f64 : 60 __ __ RTS
1f65 : 69 7f __ ADC #$7f
1f67 : 90 15 __ BCC $1f7e ; (crt_fdiv + 163)
1f69 : 4a __ __ LSR
1f6a : 05 2c __ ORA ACCU + 3 
1f6c : 85 2c __ STA ACCU + 3 
1f6e : a9 00 __ LDA #$00
1f70 : 6a __ __ ROR
1f71 : 05 19 __ ORA WORK + 8 
1f73 : 85 2b __ STA ACCU + 2 
1f75 : a5 18 __ LDA WORK + 7 
1f77 : 85 2a __ STA ACCU + 1 
1f79 : a5 17 __ LDA WORK + 6 
1f7b : 85 29 __ STA ACCU + 0 
1f7d : 60 __ __ RTS
1f7e : a9 00 __ LDA #$00
1f80 : 85 2c __ STA ACCU + 3 
1f82 : 85 2b __ STA ACCU + 2 
1f84 : 85 2a __ STA ACCU + 1 
1f86 : 85 29 __ STA ACCU + 0 
1f88 : 60 __ __ RTS
--------------------------------------------------------------------
divs16: ; divs16
1f89 : 24 2a __ BIT ACCU + 1 
1f8b : 10 0d __ BPL $1f9a ; (divs16 + 17)
1f8d : 20 a7 1f JSR $1fa7 ; (negaccu + 0)
1f90 : 24 12 __ BIT WORK + 1 
1f92 : 10 0d __ BPL $1fa1 ; (divs16 + 24)
1f94 : 20 b5 1f JSR $1fb5 ; (negtmp + 0)
1f97 : 4c c3 1f JMP $1fc3 ; (divmod + 0)
1f9a : 24 12 __ BIT WORK + 1 
1f9c : 10 f9 __ BPL $1f97 ; (divs16 + 14)
1f9e : 20 b5 1f JSR $1fb5 ; (negtmp + 0)
1fa1 : 20 c3 1f JSR $1fc3 ; (divmod + 0)
1fa4 : 4c a7 1f JMP $1fa7 ; (negaccu + 0)
--------------------------------------------------------------------
negaccu: ; negaccu
1fa7 : 38 __ __ SEC
1fa8 : a9 00 __ LDA #$00
1faa : e5 29 __ SBC ACCU + 0 
1fac : 85 29 __ STA ACCU + 0 
1fae : a9 00 __ LDA #$00
1fb0 : e5 2a __ SBC ACCU + 1 
1fb2 : 85 2a __ STA ACCU + 1 
1fb4 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp: ; negtmp
1fb5 : 38 __ __ SEC
1fb6 : a9 00 __ LDA #$00
1fb8 : e5 11 __ SBC WORK + 0 
1fba : 85 11 __ STA WORK + 0 
1fbc : a9 00 __ LDA #$00
1fbe : e5 12 __ SBC WORK + 1 
1fc0 : 85 12 __ STA WORK + 1 
1fc2 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
1fc3 : a5 2a __ LDA ACCU + 1 
1fc5 : d0 31 __ BNE $1ff8 ; (divmod + 53)
1fc7 : a5 12 __ LDA WORK + 1 
1fc9 : d0 1e __ BNE $1fe9 ; (divmod + 38)
1fcb : 85 14 __ STA WORK + 3 
1fcd : a2 04 __ LDX #$04
1fcf : 06 29 __ ASL ACCU + 0 
1fd1 : 2a __ __ ROL
1fd2 : c5 11 __ CMP WORK + 0 
1fd4 : 90 02 __ BCC $1fd8 ; (divmod + 21)
1fd6 : e5 11 __ SBC WORK + 0 
1fd8 : 26 29 __ ROL ACCU + 0 
1fda : 2a __ __ ROL
1fdb : c5 11 __ CMP WORK + 0 
1fdd : 90 02 __ BCC $1fe1 ; (divmod + 30)
1fdf : e5 11 __ SBC WORK + 0 
1fe1 : 26 29 __ ROL ACCU + 0 
1fe3 : ca __ __ DEX
1fe4 : d0 eb __ BNE $1fd1 ; (divmod + 14)
1fe6 : 85 13 __ STA WORK + 2 
1fe8 : 60 __ __ RTS
1fe9 : a5 29 __ LDA ACCU + 0 
1feb : 85 13 __ STA WORK + 2 
1fed : a5 2a __ LDA ACCU + 1 
1fef : 85 14 __ STA WORK + 3 
1ff1 : a9 00 __ LDA #$00
1ff3 : 85 29 __ STA ACCU + 0 
1ff5 : 85 2a __ STA ACCU + 1 
1ff7 : 60 __ __ RTS
1ff8 : a5 12 __ LDA WORK + 1 
1ffa : d0 1f __ BNE $201b ; (divmod + 88)
1ffc : a5 11 __ LDA WORK + 0 
1ffe : 30 1b __ BMI $201b ; (divmod + 88)
2000 : a9 00 __ LDA #$00
2002 : 85 14 __ STA WORK + 3 
2004 : a2 10 __ LDX #$10
2006 : 06 29 __ ASL ACCU + 0 
2008 : 26 2a __ ROL ACCU + 1 
200a : 2a __ __ ROL
200b : c5 11 __ CMP WORK + 0 
200d : 90 02 __ BCC $2011 ; (divmod + 78)
200f : e5 11 __ SBC WORK + 0 
2011 : 26 29 __ ROL ACCU + 0 
2013 : 26 2a __ ROL ACCU + 1 
2015 : ca __ __ DEX
2016 : d0 f2 __ BNE $200a ; (divmod + 71)
2018 : 85 13 __ STA WORK + 2 
201a : 60 __ __ RTS
201b : a9 00 __ LDA #$00
201d : 85 13 __ STA WORK + 2 
201f : 85 14 __ STA WORK + 3 
2021 : 84 10 __ STY $10 
2023 : a0 10 __ LDY #$10
2025 : 18 __ __ CLC
2026 : 26 29 __ ROL ACCU + 0 
2028 : 26 2a __ ROL ACCU + 1 
202a : 26 13 __ ROL WORK + 2 
202c : 26 14 __ ROL WORK + 3 
202e : 38 __ __ SEC
202f : a5 13 __ LDA WORK + 2 
2031 : e5 11 __ SBC WORK + 0 
2033 : aa __ __ TAX
2034 : a5 14 __ LDA WORK + 3 
2036 : e5 12 __ SBC WORK + 1 
2038 : 90 04 __ BCC $203e ; (divmod + 123)
203a : 86 13 __ STX WORK + 2 
203c : 85 14 __ STA WORK + 3 
203e : 88 __ __ DEY
203f : d0 e5 __ BNE $2026 ; (divmod + 99)
2041 : 26 29 __ ROL ACCU + 0 
2043 : 26 2a __ ROL ACCU + 1 
2045 : a4 10 __ LDY $10 
2047 : 60 __ __ RTS
--------------------------------------------------------------------
mods16: ; mods16
2048 : 24 2a __ BIT ACCU + 1 
204a : 10 10 __ BPL $205c ; (mods16 + 20)
204c : 20 a7 1f JSR $1fa7 ; (negaccu + 0)
204f : 24 12 __ BIT WORK + 1 
2051 : 10 03 __ BPL $2056 ; (mods16 + 14)
2053 : 20 b5 1f JSR $1fb5 ; (negtmp + 0)
2056 : 20 c3 1f JSR $1fc3 ; (divmod + 0)
2059 : 4c 67 20 JMP $2067 ; (negtmpb + 0)
205c : 24 12 __ BIT WORK + 1 
205e : 10 03 __ BPL $2063 ; (mods16 + 27)
2060 : 20 b5 1f JSR $1fb5 ; (negtmp + 0)
2063 : 4c c3 1f JMP $1fc3 ; (divmod + 0)
2066 : 60 __ __ RTS
--------------------------------------------------------------------
negtmpb: ; negtmpb
2067 : 38 __ __ SEC
2068 : a9 00 __ LDA #$00
206a : e5 13 __ SBC WORK + 2 
206c : 85 13 __ STA WORK + 2 
206e : a9 00 __ LDA #$00
2070 : e5 14 __ SBC WORK + 3 
2072 : 85 14 __ STA WORK + 3 
2074 : 60 __ __ RTS
--------------------------------------------------------------------
f32_to_i16: ; f32_to_i16
2075 : 20 05 1d JSR $1d05 ; (freg + 36)
2078 : a5 15 __ LDA WORK + 4 
207a : c9 7f __ CMP #$7f
207c : b0 07 __ BCS $2085 ; (f32_to_i16 + 16)
207e : a9 00 __ LDA #$00
2080 : 85 29 __ STA ACCU + 0 
2082 : 85 2a __ STA ACCU + 1 
2084 : 60 __ __ RTS
2085 : e9 8e __ SBC #$8e
2087 : 90 16 __ BCC $209f ; (f32_to_i16 + 42)
2089 : 24 2c __ BIT ACCU + 3 
208b : 30 09 __ BMI $2096 ; (f32_to_i16 + 33)
208d : a9 ff __ LDA #$ff
208f : 85 29 __ STA ACCU + 0 
2091 : a9 7f __ LDA #$7f
2093 : 85 2a __ STA ACCU + 1 
2095 : 60 __ __ RTS
2096 : a9 00 __ LDA #$00
2098 : 85 29 __ STA ACCU + 0 
209a : a9 80 __ LDA #$80
209c : 85 2a __ STA ACCU + 1 
209e : 60 __ __ RTS
209f : aa __ __ TAX
20a0 : a5 2a __ LDA ACCU + 1 
20a2 : 46 2b __ LSR ACCU + 2 
20a4 : 6a __ __ ROR
20a5 : e8 __ __ INX
20a6 : d0 fa __ BNE $20a2 ; (f32_to_i16 + 45)
20a8 : 24 2c __ BIT ACCU + 3 
20aa : 10 0e __ BPL $20ba ; (f32_to_i16 + 69)
20ac : 38 __ __ SEC
20ad : 49 ff __ EOR #$ff
20af : 69 00 __ ADC #$00
20b1 : 85 29 __ STA ACCU + 0 
20b3 : a9 00 __ LDA #$00
20b5 : e5 2b __ SBC ACCU + 2 
20b7 : 85 2a __ STA ACCU + 1 
20b9 : 60 __ __ RTS
20ba : 85 29 __ STA ACCU + 0 
20bc : a5 2b __ LDA ACCU + 2 
20be : 85 2a __ STA ACCU + 1 
20c0 : 60 __ __ RTS
--------------------------------------------------------------------
sint16_to_float: ; sint16_to_float
20c1 : 24 2a __ BIT ACCU + 1 
20c3 : 30 03 __ BMI $20c8 ; (sint16_to_float + 7)
20c5 : 4c df 20 JMP $20df ; (uint16_to_float + 0)
20c8 : 38 __ __ SEC
20c9 : a9 00 __ LDA #$00
20cb : e5 29 __ SBC ACCU + 0 
20cd : 85 29 __ STA ACCU + 0 
20cf : a9 00 __ LDA #$00
20d1 : e5 2a __ SBC ACCU + 1 
20d3 : 85 2a __ STA ACCU + 1 
20d5 : 20 df 20 JSR $20df ; (uint16_to_float + 0)
20d8 : a5 2c __ LDA ACCU + 3 
20da : 09 80 __ ORA #$80
20dc : 85 2c __ STA ACCU + 3 
20de : 60 __ __ RTS
--------------------------------------------------------------------
uint16_to_float: ; uint16_to_float
20df : a5 29 __ LDA ACCU + 0 
20e1 : 05 2a __ ORA ACCU + 1 
20e3 : d0 05 __ BNE $20ea ; (uint16_to_float + 11)
20e5 : 85 2b __ STA ACCU + 2 
20e7 : 85 2c __ STA ACCU + 3 
20e9 : 60 __ __ RTS
20ea : a2 8e __ LDX #$8e
20ec : a5 2a __ LDA ACCU + 1 
20ee : 30 06 __ BMI $20f6 ; (uint16_to_float + 23)
20f0 : ca __ __ DEX
20f1 : 06 29 __ ASL ACCU + 0 
20f3 : 2a __ __ ROL
20f4 : 10 fa __ BPL $20f0 ; (uint16_to_float + 17)
20f6 : 0a __ __ ASL
20f7 : 85 2b __ STA ACCU + 2 
20f9 : a5 29 __ LDA ACCU + 0 
20fb : 85 2a __ STA ACCU + 1 
20fd : 8a __ __ TXA
20fe : 4a __ __ LSR
20ff : 85 2c __ STA ACCU + 3 
2101 : a9 00 __ LDA #$00
2103 : 85 29 __ STA ACCU + 0 
2105 : 66 2b __ ROR ACCU + 2 
2107 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
2108 : 84 10 __ STY $10 
210a : a0 20 __ LDY #$20
210c : a9 00 __ LDA #$00
210e : 85 15 __ STA WORK + 4 
2110 : 85 16 __ STA WORK + 5 
2112 : 85 17 __ STA WORK + 6 
2114 : 85 18 __ STA WORK + 7 
2116 : a5 13 __ LDA WORK + 2 
2118 : 05 14 __ ORA WORK + 3 
211a : d0 78 __ BNE $2194 ; (divmod32 + 140)
211c : a5 12 __ LDA WORK + 1 
211e : d0 27 __ BNE $2147 ; (divmod32 + 63)
2120 : 18 __ __ CLC
2121 : 26 29 __ ROL ACCU + 0 
2123 : 26 2a __ ROL ACCU + 1 
2125 : 26 2b __ ROL ACCU + 2 
2127 : 26 2c __ ROL ACCU + 3 
2129 : 2a __ __ ROL
212a : 90 05 __ BCC $2131 ; (divmod32 + 41)
212c : e5 11 __ SBC WORK + 0 
212e : 38 __ __ SEC
212f : b0 06 __ BCS $2137 ; (divmod32 + 47)
2131 : c5 11 __ CMP WORK + 0 
2133 : 90 02 __ BCC $2137 ; (divmod32 + 47)
2135 : e5 11 __ SBC WORK + 0 
2137 : 88 __ __ DEY
2138 : d0 e7 __ BNE $2121 ; (divmod32 + 25)
213a : 85 15 __ STA WORK + 4 
213c : 26 29 __ ROL ACCU + 0 
213e : 26 2a __ ROL ACCU + 1 
2140 : 26 2b __ ROL ACCU + 2 
2142 : 26 2c __ ROL ACCU + 3 
2144 : a4 10 __ LDY $10 
2146 : 60 __ __ RTS
2147 : a5 2c __ LDA ACCU + 3 
2149 : d0 10 __ BNE $215b ; (divmod32 + 83)
214b : a6 2b __ LDX ACCU + 2 
214d : 86 2c __ STX ACCU + 3 
214f : a6 2a __ LDX ACCU + 1 
2151 : 86 2b __ STX ACCU + 2 
2153 : a6 29 __ LDX ACCU + 0 
2155 : 86 2a __ STX ACCU + 1 
2157 : 85 29 __ STA ACCU + 0 
2159 : a0 18 __ LDY #$18
215b : 18 __ __ CLC
215c : 26 29 __ ROL ACCU + 0 
215e : 26 2a __ ROL ACCU + 1 
2160 : 26 2b __ ROL ACCU + 2 
2162 : 26 2c __ ROL ACCU + 3 
2164 : 26 15 __ ROL WORK + 4 
2166 : 26 16 __ ROL WORK + 5 
2168 : 90 0c __ BCC $2176 ; (divmod32 + 110)
216a : a5 15 __ LDA WORK + 4 
216c : e5 11 __ SBC WORK + 0 
216e : aa __ __ TAX
216f : a5 16 __ LDA WORK + 5 
2171 : e5 12 __ SBC WORK + 1 
2173 : 38 __ __ SEC
2174 : b0 0c __ BCS $2182 ; (divmod32 + 122)
2176 : 38 __ __ SEC
2177 : a5 15 __ LDA WORK + 4 
2179 : e5 11 __ SBC WORK + 0 
217b : aa __ __ TAX
217c : a5 16 __ LDA WORK + 5 
217e : e5 12 __ SBC WORK + 1 
2180 : 90 04 __ BCC $2186 ; (divmod32 + 126)
2182 : 86 15 __ STX WORK + 4 
2184 : 85 16 __ STA WORK + 5 
2186 : 88 __ __ DEY
2187 : d0 d3 __ BNE $215c ; (divmod32 + 84)
2189 : 26 29 __ ROL ACCU + 0 
218b : 26 2a __ ROL ACCU + 1 
218d : 26 2b __ ROL ACCU + 2 
218f : 26 2c __ ROL ACCU + 3 
2191 : a4 10 __ LDY $10 
2193 : 60 __ __ RTS
2194 : a0 10 __ LDY #$10
2196 : a5 2c __ LDA ACCU + 3 
2198 : 85 16 __ STA WORK + 5 
219a : a5 2b __ LDA ACCU + 2 
219c : 85 15 __ STA WORK + 4 
219e : a9 00 __ LDA #$00
21a0 : 85 2b __ STA ACCU + 2 
21a2 : 85 2c __ STA ACCU + 3 
21a4 : 18 __ __ CLC
21a5 : 26 29 __ ROL ACCU + 0 
21a7 : 26 2a __ ROL ACCU + 1 
21a9 : 26 15 __ ROL WORK + 4 
21ab : 26 16 __ ROL WORK + 5 
21ad : 26 17 __ ROL WORK + 6 
21af : 26 18 __ ROL WORK + 7 
21b1 : a5 15 __ LDA WORK + 4 
21b3 : c5 11 __ CMP WORK + 0 
21b5 : a5 16 __ LDA WORK + 5 
21b7 : e5 12 __ SBC WORK + 1 
21b9 : a5 17 __ LDA WORK + 6 
21bb : e5 13 __ SBC WORK + 2 
21bd : aa __ __ TAX
21be : a5 18 __ LDA WORK + 7 
21c0 : e5 14 __ SBC WORK + 3 
21c2 : 90 11 __ BCC $21d5 ; (divmod32 + 205)
21c4 : 86 17 __ STX WORK + 6 
21c6 : 85 18 __ STA WORK + 7 
21c8 : a5 15 __ LDA WORK + 4 
21ca : e5 11 __ SBC WORK + 0 
21cc : 85 15 __ STA WORK + 4 
21ce : a5 16 __ LDA WORK + 5 
21d0 : e5 12 __ SBC WORK + 1 
21d2 : 85 16 __ STA WORK + 5 
21d4 : 38 __ __ SEC
21d5 : 88 __ __ DEY
21d6 : d0 cd __ BNE $21a5 ; (divmod32 + 157)
21d8 : 26 29 __ ROL ACCU + 0 
21da : 26 2a __ ROL ACCU + 1 
21dc : a4 10 __ LDY $10 
21de : 60 __ __ RTS
--------------------------------------------------------------------
__multab10L:
21df : __ __ __ BYT 00 0a 14 1e 28 32 3c 46 50 5a 64 6e 78 82 8c 96 : ....(2<FPZdnx...
--------------------------------------------------------------------
_ccolor:
21ef : __ __ __ BYT f0                                              : .
--------------------------------------------------------------------
_MAX_COL:
21f0 : __ __ __ BYT 50                                              : P
--------------------------------------------------------------------
_MAX_ROW:
21f1 : __ __ __ BYT 1e                                              : .
--------------------------------------------------------------------
_col:
21f2 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
_row:
21f3 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
f256k_color:
21f4 : __ __ __ BYT f0                                              : .
--------------------------------------------------------------------
globalPause:
21f5 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
countActiveChannels:
21f6 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
kernelArgs:
21f7 : __ __ __ BSS	2
--------------------------------------------------------------------
kernelEventData:
21f9 : __ __ __ BSS	7
--------------------------------------------------------------------
textColors:
2200 : __ __ __ BYT 00 00 00 dd 00 33 00 00 99 dd 22 dd 00 77 22 55 : .....3...."..w"U
2210 : __ __ __ BYT 55 55 22 22 ff 66 aa ff 88 55 00 ff 66 00 aa aa : UU"".f...U..f...
2220 : __ __ __ BYT aa ff 99 88 00 dd 00 ff ff 00 55 ff 99 ff ff ff : ..........U.....
--------------------------------------------------------------------
pcmHeader:
2230 : __ __ __ BYT 52 49 46 46 06 3a 00 00 57 41 56 45 66 6d 74 20 : RIFF.:..WAVEfmt 
2240 : __ __ __ BYT 10 00 00 00 01 00 01 00 22 56 00 00 22 56 00 00 : ........"V.."V..
2250 : __ __ __ BYT 01 00 08 00 64 61 74 61 ff ff ff ff             : ....data....
--------------------------------------------------------------------
fround5:
225c : __ __ __ BYT 00 00 00 3f cd cc 4c 3d 0a d7 a3 3b 6f 12 03 3a : ...?..L=...;o..:
226c : __ __ __ BYT 17 b7 51 38 ac c5 a7 36 bd 37 06 35             : ..Q8...6.7.5
--------------------------------------------------------------------
_BITMAP_CLUT:
2278 : __ __ __ BSS	3
--------------------------------------------------------------------
_tileSize:
227b : __ __ __ BSS	3
--------------------------------------------------------------------
_spriteCtl:
227e : __ __ __ BSS	64
--------------------------------------------------------------------
_dirStream:
22be : __ __ __ BSS	8
--------------------------------------------------------------------
_kern_target:
22c6 : __ __ __ BSS	2
--------------------------------------------------------------------
_kernelError:
22c8 : __ __ __ BSS	1
--------------------------------------------------------------------
blk:
22c9 : __ __ __ BSS	32
--------------------------------------------------------------------
sfx:
2300 : __ __ __ BSS	160
--------------------------------------------------------------------
sums:
23a0 : __ __ __ BSS	64
--------------------------------------------------------------------
camera_sfx:
10000 : __ __ __ BYT 52 49 46 46 06 3a 00 00 57 41 56 45 66 6d 74 20 : RIFF.:..WAVEfmt 
10010 : __ __ __ BYT 10 00 00 00 01 00 01 00 22 56 00 00 22 56 00 00 : ........"V.."V..
10020 : __ __ __ BYT 01 00 08 00 64 61 74 61 e2 39 00 00 7f 80 7f 80 : ....data.9......
10030 : __ __ __ BYT 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f : ................
10040 : __ __ __ BYT 80 7f 80 7f 80 80 80 7f 80 7f 80 80 7f 80 80 7f : ................
10050 : __ __ __ BYT 80 80 7f 80 7f 80 7f 80 80 80 80 7f 80 80 80 80 : ................
10060 : __ __ __ BYT 80 80 80 7f 80 7f 80 7f 80 7f 80 7f 80 80 7f 80 : ................
10070 : __ __ __ BYT 80 7f 80 7f 80 80 7f 80 7f 80 7f 80 7f 80 7f 80 : ................
10080 : __ __ __ BYT 7f 80 7f 80 7f 80 7f 80 80 7f 80 7f 80 7f 80 80 : ................
10090 : __ __ __ BYT 7f 80 7f 80 7f 80 80 7f 80 80 80 80 80 80 80 80 : ................
100a0 : __ __ __ BYT 7f 80 7f 80 80 80 7f 80 7f 80 80 7f 80 7f 80 80 : ................
100b0 : __ __ __ BYT 80 7f 80 7f 80 7f 80 80 80 80 7f 80 80 80 7f 80 : ................
100c0 : __ __ __ BYT 80 80 80 80 80 7f 80 80 7f 80 7f 80 7f 80 80 80 : ................
100d0 : __ __ __ BYT 80 7f 80 7f 80 7f 80 7f 80 7f 80 80 7f 7f 80 7f : ................
100e0 : __ __ __ BYT 80 7f 80 7f 80 80 7f 80 7f 80 80 7f 80 7f 7f 80 : ................
100f0 : __ __ __ BYT 7f 80 7f 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f : ................
10100 : __ __ __ BYT 80 7f 80 7f 80 7f 80 80 7f 7f 80 7f 80 7f 80 7f : ................
10110 : __ __ __ BYT 80 80 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f : ................
10120 : __ __ __ BYT 80 7f 80 80 7f 80 7f 80 7f 80 7f 80 80 80 7f 80 : ................
10130 : __ __ __ BYT 7f 80 80 7f 80 7f 80 7f 80 80 80 80 7f 80 7f 80 : ................
10140 : __ __ __ BYT 80 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 : ................
10150 : __ __ __ BYT 7f 80 7f 80 80 80 7f 80 7f 80 7f 80 80 7f 80 7f : ................
10160 : __ __ __ BYT 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 80 80 : ................
10170 : __ __ __ BYT 7f 80 7f 80 7f 80 80 7f 80 7f 80 80 7f 80 80 7f : ................
10180 : __ __ __ BYT 80 7f 80 80 7f 80 7f 80 7f 80 7f 80 80 80 7f 80 : ................
10190 : __ __ __ BYT 80 7f 80 7f 80 80 7f 80 7f 80 7f 80 7f 7f 80 7f : ................
101a0 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 7f 80 80 7f 80 7f 80 : ................
101b0 : __ __ __ BYT 7f 80 80 7f 80 7f 80 80 7f 80 7f 80 80 7f 7f 80 : ................
101c0 : __ __ __ BYT 7f 80 80 7f 80 7f 80 7f 80 80 7f 80 7f 80 7f 80 : ................
101d0 : __ __ __ BYT 80 7f 80 80 80 80 80 7f 80 7f 80 80 7f 80 7f 80 : ................
101e0 : __ __ __ BYT 80 80 80 7f 80 80 80 80 80 80 7f 80 80 7f 80 7f : ................
101f0 : __ __ __ BYT 80 7f 80 7f 80 80 7f 80 7f 80 7f 80 80 7f 80 7f : ................
10200 : __ __ __ BYT 80 7f 80 7f 80 7f 80 7f 80 7f 80 80 7f 80 7f 80 : ................
10210 : __ __ __ BYT 7f 80 7f 80 7f 7f 80 80 7f 80 7f 7f 80 7f 80 7f : ................
10220 : __ __ __ BYT 80 7f 80 80 80 80 7f 80 80 80 80 80 80 80 80 80 : ................
10230 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 : ................
10240 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 80 80 80 7f 7f 80 : ................
10250 : __ __ __ BYT 7f 80 7f 80 80 7f 80 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
10260 : __ __ __ BYT 80 7f 80 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
10270 : __ __ __ BYT 7f 7f 7f 7f 7f 80 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
10280 : __ __ __ BYT 80 7f 80 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 80 7f : ................
10290 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 80 80 80 7f 7f 7f 7f 80 7f : ................
102a0 : __ __ __ BYT 80 80 80 80 80 80 80 80 7f 80 7f 80 7f 80 80 80 : ................
102b0 : __ __ __ BYT 80 7f 80 7f 80 7f 80 80 80 80 80 80 80 80 80 80 : ................
102c0 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 : ................
102d0 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 : ................
102e0 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 80 80 80 7f 80 7f : ................
102f0 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 7f 80 7f 80 7f 80 : ................
10300 : __ __ __ BYT 7f 7f 80 7f 80 7f 80 7f 7f 80 7f 7f 7f 7f 7f 7f : ................
10310 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
10320 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
10330 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 80 80 80 80 80 80 80 80 : ................
10340 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 : ................
10350 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 : ................
10360 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 : ................
10370 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 : ................
10380 : __ __ __ BYT 80 80 80 80 80 7f 80 7f 80 7f 80 7f 7f 7f 7f 7f : ................
10390 : __ __ __ BYT 80 7f 7f 80 7f 7f 7f 80 7f 7f 7f 7f 7f 7f 7f 7f : ................
103a0 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 80 7f 7f 7f 7f 7f 80 7f : ................
103b0 : __ __ __ BYT 7f 7f 80 80 80 7f 80 7f 80 80 7f 7f 7f 80 80 80 : ................
103c0 : __ __ __ BYT 7f 7f 7f 80 7f 80 80 7f 7f 80 7f 7f 80 80 7f 7f : ................
103d0 : __ __ __ BYT 80 80 7f 80 7f 80 7f 80 80 7f 7f 7f 80 7f 80 7f : ................
103e0 : __ __ __ BYT 80 7f 7f 80 80 7f 80 80 7f 7f 7f 80 80 7f 7f 7f : ................
103f0 : __ __ __ BYT 80 7f 7f 80 7f 7f 80 80 7f 80 80 80 80 7f 7f 80 : ................
10400 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 7f 80 80 7f 80 80 7f : ................
10410 : __ __ __ BYT 7f 80 7f 80 80 80 80 80 7f 80 80 7f 7f 7f 80 80 : ................
10420 : __ __ __ BYT 80 7f 7f 7f 80 80 7f 7f 7f 80 80 80 7f 7f 80 80 : ................
10430 : __ __ __ BYT 7f 7f 80 7f 7f 80 80 80 7f 7f 7f 7f 80 80 7f 80 : ................
10440 : __ __ __ BYT 80 7f 7f 80 80 80 7f 7f 7f 80 7f 7f 7f 80 80 7f : ................
10450 : __ __ __ BYT 7f 80 80 7f 80 7f 7f 80 80 7f 80 80 7f 80 7f 80 : ................
10460 : __ __ __ BYT 7f 80 7f 7f 7f 7f 7f 7f 7f 80 7f 7f 80 80 7f 7f : ................
10470 : __ __ __ BYT 7f 80 7e 7e 7d 7f 7b 7a 8b 8c 7d 7f 80 7e 86 82 : ..~~}.{z..}..~..
10480 : __ __ __ BYT 7a 7d 7b 78 7f 84 7d 79 81 87 87 82 7e 7f 84 85 : z}{x..}y....~...
10490 : __ __ __ BYT 7c 77 79 7f 86 81 7c 7b 7c 81 84 81 7f 82 7f 7c : |wy...|{|......|
104a0 : __ __ __ BYT 7e 7f 80 81 81 80 80 80 80 7f 7f 7f 7e 7f 7e 7e : ~...........~.~~
104b0 : __ __ __ BYT 7f 80 81 81 81 83 82 80 80 7f 7e 7e 7f 7e 7e 80 : ..........~~.~~.
104c0 : __ __ __ BYT 81 81 81 81 7f 80 7f 7d 7f 80 7f 7e 7f 7f 80 81 : .......}...~....
104d0 : __ __ __ BYT 80 81 80 7e 7f 80 7f 7f 7e 7f 7f 7f 7f 7f 7f 80 : ...~....~.......
104e0 : __ __ __ BYT 81 81 80 80 80 80 80 7f 7e 7e 7e 7f 7f 7f 7f 80 : ........~~~.....
104f0 : __ __ __ BYT 80 80 81 81 7f 80 80 80 80 7f 7f 80 80 7f 80 7f : ................
10500 : __ __ __ BYT 7f 80 80 80 80 81 80 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
10510 : __ __ __ BYT 7f 7f 80 80 7f 7e 7f 7f 80 80 80 80 7f 80 80 80 : .....~..........
10520 : __ __ __ BYT 80 80 7f 80 7f 7f 80 80 80 7f 7f 80 80 80 7f 7f : ................
10530 : __ __ __ BYT 80 80 80 7f 7f 80 7f 7f 80 81 80 80 7f 7f 7f 80 : ................
10540 : __ __ __ BYT 7f 7f 80 7f 7f 80 80 80 80 7f 7f 80 80 80 80 7f : ................
10550 : __ __ __ BYT 7f 80 7f 80 80 7f 80 80 80 80 80 7f 80 80 80 80 : ................
10560 : __ __ __ BYT 80 80 80 80 7f 7f 80 80 7f 80 80 7f 7e 7f 7f 7f : ............~...
10570 : __ __ __ BYT 80 7f 7f 7f 80 7e 7f 80 80 80 80 80 7f 7f 7f 7f : .....~..........
10580 : __ __ __ BYT 7e 7e 7f 7f 7f 7f 80 80 81 80 7f 7e 7e 80 7f 7f : ~~.........~~...
10590 : __ __ __ BYT 81 80 80 81 80 7f 7f 7f 7f 80 7f 7f 80 80 81 7f : ................
105a0 : __ __ __ BYT 7f 7f 80 80 7f 7f 7f 80 80 80 7f 7f 7e 7f 80 7f : ............~...
105b0 : __ __ __ BYT 7f 80 80 81 80 7f 7f 7f 80 80 7f 7f 80 80 80 80 : ................
105c0 : __ __ __ BYT 80 80 7f 7f 81 80 7f 7f 80 81 80 7f 7f 7f 81 81 : ................
105d0 : __ __ __ BYT 7f 80 80 7f 7f 7e 7e 7f 7f 7f 7f 80 80 81 81 81 : .....~~.........
105e0 : __ __ __ BYT 80 7f 7f 7e 7e 7f 7f 80 81 80 7f 7f 7f 7f 7f 7e : ...~~..........~
105f0 : __ __ __ BYT 7f 80 80 80 80 80 80 80 80 80 7f 7f 7f 80 81 80 : ................
10600 : __ __ __ BYT 7f 80 7f 7f 80 80 80 80 7f 80 80 7f 7f 7f 7e 7f : ..............~.
10610 : __ __ __ BYT 7f 7f 80 80 80 80 80 7f 7f 7f 7f 80 80 7f 80 80 : ................
10620 : __ __ __ BYT 80 80 7f 7f 80 80 7f 7f 7e 7e 7f 80 7f 80 80 80 : ........~~......
10630 : __ __ __ BYT 80 80 7f 7f 7f 7f 7e 7f 7f 7f 7f 80 80 80 80 7f : ......~.........
10640 : __ __ __ BYT 80 80 80 80 7f 7f 80 80 7f 80 80 80 7f 7f 7f 7f : ................
10650 : __ __ __ BYT 7f 7f 7f 80 80 7f 80 7f 7f 81 7f 7f 80 80 80 81 : ................
10660 : __ __ __ BYT 80 7f 7f 80 80 7f 7f 80 80 81 81 7f 80 7f 80 81 : ................
10670 : __ __ __ BYT 80 80 7f 80 81 7f 7e 7f 7e 7e 7f 7e 7f 80 80 81 : ......~.~~.~....
10680 : __ __ __ BYT 81 7f 80 7f 7f 80 7f 7f 80 80 80 7f 7f 7f 7f 7f : ................
10690 : __ __ __ BYT 80 81 80 7f 80 80 7f 80 80 80 80 7f 7e 7e 7f 7f : ............~~..
106a0 : __ __ __ BYT 7f 80 80 80 80 80 7f 7f 80 80 7f 7f 80 80 7f 7f : ................
106b0 : __ __ __ BYT 7f 7e 7f 80 7f 7f 7f 7f 80 80 7f 7f 7f 7e 80 80 : .~...........~..
106c0 : __ __ __ BYT 7e 80 80 7f 80 7f 7f 80 80 7f 81 80 80 81 80 81 : ~...............
106d0 : __ __ __ BYT 80 7f 7e 7e 7f 7f 7f 80 81 81 80 81 7f 7d 7e 7f : ..~~.........}~.
106e0 : __ __ __ BYT 81 81 80 7e 7f 80 7e 7f 7f 7e 81 80 7f 81 80 81 : ...~..~..~......
106f0 : __ __ __ BYT 81 7f 7f 7f 7f 7f 7f 7f 80 80 81 82 80 80 80 7e : ...............~
10700 : __ __ __ BYT 7f 81 7f 7d 7f 81 80 80 7f 7f 7f 7f 81 7f 7d 7f : ...}..........}.
10710 : __ __ __ BYT 80 7e 7e 7f 80 81 80 82 81 7e 7f 80 7f 80 81 7f : .~~......~......
10720 : __ __ __ BYT 7f 80 80 80 7f 7f 83 80 7e 81 81 81 7f 7d 7e 7c : ........~....}~|
10730 : __ __ __ BYT 7d 82 81 80 81 80 80 7f 7f 7f 7c 7d 82 80 7f 82 : }.........|}....
10740 : __ __ __ BYT 81 7e 80 80 7e 7f 7f 7f 7e 7c 7f 82 81 81 82 7e : .~..~...~|.....~
10750 : __ __ __ BYT 7e 81 7d 7d 7f 7f 83 83 80 80 80 7f 82 80 7f 80 : ~.}}............
10760 : __ __ __ BYT 7c 7d 7e 7d 84 83 7d 80 83 81 7f 7f 7d 7c 80 81 : |}~}..}.....}|..
10770 : __ __ __ BYT 80 80 81 7e 7e 81 80 7f 7f 7e 7f 7f 80 81 81 81 : ...~~....~......
10780 : __ __ __ BYT 80 7d 7c 7d 7f 80 82 84 7f 7f 84 80 7e 82 81 7e : .}|}........~..~
10790 : __ __ __ BYT 7e 7d 7e 81 81 7f 80 82 82 80 7b 7e 81 7f 7e 7d : ~}~.......{~..~}
107a0 : __ __ __ BYT 81 80 80 80 7b 7f 7e 7d 80 7e 80 83 81 80 7f 7d : ....{.~}.~.....}
107b0 : __ __ __ BYT 7f 81 7f 7e 7e 7f 82 82 7f 81 82 81 81 82 7e 7c : ...~~.........~|
107c0 : __ __ __ BYT 7e 7d 7e 82 82 80 81 81 80 7f 7c 7e 7d 7d 81 80 : ~}~.......|~}}..
107d0 : __ __ __ BYT 7e 80 7f 7d 7f 7e 82 82 7e 80 7e 7c 7e 81 82 7d : ~..}.~..~.~|~..}
107e0 : __ __ __ BYT 80 82 7f 7f 81 81 80 82 81 81 7d 7a 81 81 80 83 : ..........}z....
107f0 : __ __ __ BYT 7f 7f 84 82 7f 7f 7a 7d 82 80 7e 81 80 7e 7e 7e : ......z}..~..~~~
10800 : __ __ __ BYT 7e 7d 80 81 7e 7e 7e 84 80 7c 83 80 7c 80 7f 7e : ~}..~~~..|..|..~
10810 : __ __ __ BYT 82 81 7f 81 7f 82 81 7a 7f 85 7f 7e 83 80 7e 83 : .......z...~..~.
10820 : __ __ __ BYT 82 7d 7d 81 80 7d 7f 81 7f 7c 81 81 7c 7f 83 7e : .}}..}...|..|..~
10830 : __ __ __ BYT 7d 83 81 7c 7f 82 7d 80 81 7f 7f 7e 82 81 7d 80 : }..|..}....~..}.
10840 : __ __ __ BYT 80 7b 7f 84 7e 7e 83 81 7f 81 82 80 7c 7f 82 7c : .{..~~......|..|
10850 : __ __ __ BYT 7e 83 7f 7d 81 80 7e 7f 82 7f 7e 82 7f 7f 82 7f : ~..}..~...~.....
10860 : __ __ __ BYT 81 80 7d 7f 7d 7d 82 7e 7c 83 80 7d 85 7f 7a 82 : ..}.}}.~|..}..z.
10870 : __ __ __ BYT 7e 7e 82 7e 80 81 7d 7f 81 80 7f 7e 81 82 7c 7f : ~~.~..}....~..|.
10880 : __ __ __ BYT 83 7e 81 84 80 7f 7e 82 7e 7c 83 80 7c 7f 81 80 : .~....~.~|..|...
10890 : __ __ __ BYT 7d 80 84 7f 7f 81 7d 7a 80 7f 7d 81 7f 84 81 7f : }.....}z..}.....
108a0 : __ __ __ BYT 83 81 80 7d 7d 7f 7f 80 81 7f 7d 81 81 81 7f 80 : ...}}.....}.....
108b0 : __ __ __ BYT 81 7c 7e 81 7c 81 82 7f 7f 7e 81 81 81 7f 83 7e : .|~.|....~.....~
108c0 : __ __ __ BYT 7c 7e 79 82 82 83 86 83 81 84 79 72 90 79 76 7d : |~y.......yr.yv}
108d0 : __ __ __ BYT 5e 87 95 86 98 80 6a 80 80 70 7b 82 75 71 8c 97 : ^.....j..p{.uq..
108e0 : __ __ __ BYT 7f 7f 86 89 85 73 72 7a 82 87 8f 86 71 82 81 72 : .....srz....q..r
108f0 : __ __ __ BYT 87 85 7a 88 8b 81 7d 73 74 87 87 82 84 7a 7b 8b : ..z...}st....z{.
10900 : __ __ __ BYT 7f 6e 77 7b 7e 88 84 83 7e 7c 86 83 80 75 73 81 : .nw{~...~|...us.
10910 : __ __ __ BYT 80 7c 7d 86 88 87 85 82 85 80 7a 79 78 7e 7d 7a : .|}.......zyx~}z
10920 : __ __ __ BYT 80 8b 8b 83 80 7d 82 7e 7c 7f 7b 80 81 7e 7b 7e : .....}.~|.{..~{~
10930 : __ __ __ BYT 7f 7b 83 82 82 83 7b 7b 7c 80 87 80 79 79 7f 86 : .{....{{|...yy..
10940 : __ __ __ BYT 86 83 81 84 81 7d 7d 79 80 82 84 84 7e 7e 83 86 : .....}}y....~~..
10950 : __ __ __ BYT 82 75 74 83 82 80 82 7f 7c 82 82 78 7e 7b 7b 84 : .ut.....|..x~{{.
10960 : __ __ __ BYT 80 7e 79 81 88 86 86 80 73 78 84 7b 7d 7f 7f 88 : .~y.....sx.{}...
10970 : __ __ __ BYT 82 80 84 81 81 86 80 7b 80 7d 7d 84 7f 7a 7d 81 : .......{.}}..z}.
10980 : __ __ __ BYT 81 83 7e 7b 7f 7c 7f 84 7f 7c 83 7f 7d 83 7d 79 : ..~{.|...|..}.}y
10990 : __ __ __ BYT 7d 83 84 83 7d 7a 81 82 83 7f 7f 81 80 81 80 81 : }...}z..........
109a0 : __ __ __ BYT 7e 7d 7c 7d 80 83 82 80 81 82 82 81 80 7d 7e 7d : ~}|}.........}~}
109b0 : __ __ __ BYT 7c 7e 7f 80 81 7f 7f 81 81 82 82 80 7e 7e 7c 7e : |~..........~~|~
109c0 : __ __ __ BYT 82 81 80 7e 80 82 80 80 7d 7b 80 82 80 80 7d 7d : ...~....}{....}}
109d0 : __ __ __ BYT 7d 7f 7f 7d 80 80 81 81 7e 7d 80 80 80 81 81 82 : }..}....~}......
109e0 : __ __ __ BYT 82 80 7c 80 80 7e 82 7c 7c 7e 81 83 85 84 80 7f : ..|..~.||~......
109f0 : __ __ __ BYT 7e 7c 74 7e 86 7d 8a 82 76 79 76 8d 8c 7b 85 76 : ~|t~.}..vyv..{.v
10a00 : __ __ __ BYT 72 8b 81 6e 7d 83 7f 81 7f 86 8b 7e 7c 82 77 79 : r..n}......~|.wy
10a10 : __ __ __ BYT 85 80 7c 82 84 81 84 83 81 7f 7a 7d 87 83 7d 80 : ..|.......z}..}.
10a20 : __ __ __ BYT 7b 7a 80 83 83 83 83 7f 7c 7c 7c 7a 7e 83 82 7e : {z......|||z~..~
10a30 : __ __ __ BYT 7d 80 80 83 82 7d 7e 80 7e 7e 7d 7c 7e 7e 82 88 : }....}~.~~}|~~..
10a40 : __ __ __ BYT 87 83 7f 7d 7e 7d 7c 7c 7d 81 82 80 81 82 83 82 : ...}~}||}.......
10a50 : __ __ __ BYT 7d 7f 81 7d 7e 7e 80 80 7f 80 7f 80 80 80 81 82 : }..}~~..........
10a60 : __ __ __ BYT 81 7e 80 7f 7c 80 80 80 81 7e 7e 80 82 80 80 80 : .~..|....~~.....
10a70 : __ __ __ BYT 7e 7e 7d 7d 7f 80 81 82 7f 7e 81 80 7e 7e 7f 7f : ~~}}.....~..~~..
10a80 : __ __ __ BYT 80 7f 80 80 7f 7f 7f 80 7e 7f 7f 80 7f 80 81 7e : ........~......~
10a90 : __ __ __ BYT 81 83 81 82 82 7d 7f 88 83 84 7f 68 7c 8c 6f 74 : .....}.....h|.ot
10aa0 : __ __ __ BYT 79 6b 75 82 87 78 7f 84 69 7d 85 5d 7f 9b 90 a6 : yku..x..i}.]....
10ab0 : __ __ __ BYT 99 7e 7e 96 7d 56 89 95 80 97 8d 77 9f a6 74 76 : .~~.}V.....w..tv
10ac0 : __ __ __ BYT 7b 67 77 8d 86 83 8e 85 6d 6e 79 6c 80 99 71 6c : {gw.....mnyl..ql
10ad0 : __ __ __ BYT 72 62 92 99 73 76 73 73 76 8a 8b 70 79 76 6a 89 : rb..svssv..pyvj.
10ae0 : __ __ __ BYT a2 85 7e 7e 69 7c 90 97 85 79 80 80 8c 83 7b 7c : ..~~i|...y....{|
10af0 : __ __ __ BYT 78 7f 88 86 87 8b 7d 7c 7b 7b 8c 88 7e 89 84 79 : x.....}|{{..~..y
10b00 : __ __ __ BYT 84 7d 85 90 76 7b 87 7f 79 7e 7f 78 7f 7f 79 81 : .}..v{..y~.x..y.
10b10 : __ __ __ BYT 82 78 7d 83 81 80 79 76 7c 82 78 71 7d 85 82 7e : .x}...yv|.xq}..~
10b20 : __ __ __ BYT 81 7a 78 7a 75 82 87 7e 7d 7a 80 8b 81 7a 81 7d : .zxzu..~}z...z.}
10b30 : __ __ __ BYT 7d 85 81 80 83 7f 79 7c 86 83 81 8a 83 7e 7a 73 : }.....y|.....~zs
10b40 : __ __ __ BYT 7f 81 7c 7e 7d 7f 83 88 80 79 7b 7b 7f 80 80 81 : ..|~}....y{{....
10b50 : __ __ __ BYT 83 7e 7c 83 82 83 86 81 7b 86 86 80 8b 85 80 84 : .~|.....{.......
10b60 : __ __ __ BYT 7f 7c 83 85 80 82 7f 80 85 82 81 81 7f 84 82 7f : .|..............
10b70 : __ __ __ BYT 81 7d 81 7e 7a 82 80 7e 86 7f 7a 7f 7b 7f 80 7f : .}.~z..~..z.{...
10b80 : __ __ __ BYT 82 83 84 7f 7d 7d 7c 7e 7e 81 86 81 7d 80 81 83 : ....}}|~~...}...
10b90 : __ __ __ BYT 7f 7b 7b 7f 81 7d 7d 7e 82 82 7b 7b 7f 7c 7e 80 : .{{..}}~..{{.|~.
10ba0 : __ __ __ BYT 7d 7c 7e 81 83 81 7c 7c 7f 7c 7c 80 7f 7d 7f 7d : }|~...||.||..}.}
10bb0 : __ __ __ BYT 7d 82 7e 7d 7f 7d 7e 7f 7f 7e 81 80 7e 7e 7e 7f : }.~}.}~..~..~~~.
10bc0 : __ __ __ BYT 7f 80 82 80 7e 7d 7c 80 81 7f 7f 7d 7d 81 81 80 : ....~}|....}}...
10bd0 : __ __ __ BYT 7e 7f 82 83 81 7d 7d 81 80 7f 7e 7d 82 82 80 7f : ~....}}...~}....
10be0 : __ __ __ BYT 7c 7c 7f 81 81 80 7d 7e 81 82 80 83 82 80 80 7d : ||....}~.......}
10bf0 : __ __ __ BYT 82 83 83 87 82 82 83 7f 82 85 84 84 82 83 84 7f : ................
10c00 : __ __ __ BYT 81 81 7d 82 83 7f 83 83 81 81 7f 7c 7d 82 80 7d : ..}........|}..}
10c10 : __ __ __ BYT 81 80 7d 7e 7d 7d 81 80 7e 7f 7f 7c 7e 7f 82 83 : ..}~}}..~..|~...
10c20 : __ __ __ BYT 7e 7c 7d 7e 81 81 7e 7e 7d 7d 81 82 7e 7f 80 7e : ~|}~..~~}}..~..~
10c30 : __ __ __ BYT 80 81 7f 7f 82 82 7f 81 7e 7d 81 80 80 80 7f 7d : ........~}.....}
10c40 : __ __ __ BYT 80 80 7e 7f 81 81 7f 7f 7e 7d 7f 80 7e 7f 7d 7d : ..~.....~}..~.}}
10c50 : __ __ __ BYT 7e 7e 7e 7f 7d 7b 7c 7e 7e 7e 80 7e 7e 7e 7d 7e : ~~~.}{|~~~.~~~}~
10c60 : __ __ __ BYT 7e 7e 7e 7e 7f 7f 7e 7e 81 80 7e 7e 7f 7f 80 80 : ~~~~..~~..~~....
10c70 : __ __ __ BYT 7f 80 81 81 7f 80 80 7f 80 80 80 80 7f 7e 7e 81 : .............~~.
10c80 : __ __ __ BYT 83 80 80 7f 7e 80 81 80 81 80 7e 7f 81 82 81 81 : ....~.....~.....
10c90 : __ __ __ BYT 81 81 80 82 82 82 84 81 81 83 82 81 83 83 81 82 : ................
10ca0 : __ __ __ BYT 82 81 82 81 82 81 81 81 7f 81 7f 7f 81 80 7f 7e : ...............~
10cb0 : __ __ __ BYT 7e 80 7e 7f 80 7f 7f 7e 7c 7f 80 7e 80 7f 7f 7f : ~.~....~|..~....
10cc0 : __ __ __ BYT 7f 7f 80 7f 7f 7f 7f 81 7f 80 80 7e 7f 7f 80 81 : ...........~....
10cd0 : __ __ __ BYT 81 80 7f 7f 80 80 80 80 7f 7f 80 80 80 7f 7e 7e : ..............~~
10ce0 : __ __ __ BYT 80 7f 7e 7f 7f 7e 7d 7f 7f 7d 7e 7e 7c 7d 7f 7f : ..~..~}..}~~|}..
10cf0 : __ __ __ BYT 7e 7e 7e 7e 7e 7f 7d 7d 7f 7d 7d 81 7f 7e 7f 7d : ~~~~~.}}.}}..~.}
10d00 : __ __ __ BYT 7d 7f 80 80 7f 7e 7e 80 81 7f 7f 80 7f 7e 7f 80 : }....~~......~..
10d10 : __ __ __ BYT 80 7f 7f 7f 80 80 7f 7f 7f 7f 7f 80 81 81 80 7f : ................
10d20 : __ __ __ BYT 7f 80 81 80 80 81 80 81 80 80 81 82 80 7f 82 81 : ................
10d30 : __ __ __ BYT 81 81 81 82 82 80 80 82 82 80 80 83 81 81 82 80 : ................
10d40 : __ __ __ BYT 81 81 80 80 80 81 82 80 81 81 7f 7f 7f 80 81 80 : ................
10d50 : __ __ __ BYT 7f 80 7f 7e 81 80 7f 7f 7f 7f 7f 7e 7f 7f 80 7f : ...~.......~....
10d60 : __ __ __ BYT 7e 80 7f 7f 80 7f 80 7f 7f 7f 7e 81 80 7e 7f 7f : ~.........~..~..
10d70 : __ __ __ BYT 7e 7f 7f 7f 7f 7f 7f 7d 7e 7f 7f 80 7f 7e 7f 7f : ~......}~....~..
10d80 : __ __ __ BYT 7f 7f 7e 7d 7f 7f 7f 7f 80 7e 7e 7e 7e 7f 7f 7f : ..~}.....~~~~...
10d90 : __ __ __ BYT 7f 7f 7f 80 7f 7f 7f 80 7f 7e 7f 7f 80 80 7f 7f : .........~......
10da0 : __ __ __ BYT 7f 80 80 7f 80 80 80 7f 7f 80 80 80 80 7f 7f 80 : ................
10db0 : __ __ __ BYT 80 80 7f 80 80 7f 80 80 80 80 7f 7f 7f 80 81 80 : ................
10dc0 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 80 81 81 82 81 80 : ................
10dd0 : __ __ __ BYT 81 80 80 80 81 81 81 80 80 81 81 81 80 80 7f 80 : ................
10de0 : __ __ __ BYT 80 80 80 80 80 80 80 7f 7f 80 80 7f 7f 7f 80 80 : ................
10df0 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 80 7f 7f 7f 7f 7f 7f 7f 7f : ................
10e00 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
10e10 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
10e20 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
10e30 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 80 80 80 80 80 80 80 80 80 : ................
10e40 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 : ................
10e50 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 : ................
10e60 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 : ................
10e70 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 : ................
10e80 : __ __ __ BYT 80 80 80 80 7f 7f 7f 7f 7f 7f 7f 7f 7f 80 80 80 : ................
10e90 : __ __ __ BYT 80 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
10ea0 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
10eb0 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
10ec0 : __ __ __ BYT 7f 7f 7f 80 7f 7f 7f 7f 80 80 80 80 80 7f 80 80 : ................
10ed0 : __ __ __ BYT 7f 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 : ................
10ee0 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 7f 7f 7f 7f 7f 7f : ................
10ef0 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 80 7f 7f 80 80 80 80 80 : ................
10f00 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 : ................
10f10 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 7f 7f 80 80 80 80 80 : ................
10f20 : __ __ __ BYT 80 80 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
10f30 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 80 7f 7f 7f 80 80 80 7f 80 : ................
10f40 : __ __ __ BYT 80 80 7f 7f 7f 7f 80 80 80 80 80 80 80 7f 7f 7f : ................
10f50 : __ __ __ BYT 7f 80 80 80 7f 80 7f 80 7f 7f 7f 7f 7f 7f 7f 7f : ................
10f60 : __ __ __ BYT 7f 7f 80 80 7f 7f 7f 80 80 80 7f 80 80 80 80 80 : ................
10f70 : __ __ __ BYT 80 80 80 7f 7f 7f 80 80 7f 7f 7f 7f 7f 7f 7f 7f : ................
10f80 : __ __ __ BYT 80 7f 80 80 7f 7f 7f 7e 81 81 80 80 7f 80 80 7f : .......~........
10f90 : __ __ __ BYT 7f 7f 81 81 80 7f 7e 7f 80 7f 80 80 81 7f 7d 7f : ......~.......}.
10fa0 : __ __ __ BYT 80 80 81 7f 7f 7f 7f 7f 7f 80 80 80 80 80 80 7f : ................
10fb0 : __ __ __ BYT 7e 7f 7e 7f 80 80 7f 7f 80 80 80 80 7f 7e 7f 80 : ~.~..........~..
10fc0 : __ __ __ BYT 80 81 80 7f 7f 80 81 81 80 7e 7e 7f 7f 7f 80 80 : .........~~.....
10fd0 : __ __ __ BYT 7f 80 80 80 7f 7f 7f 7f 7f 80 80 80 7f 7f 7f 80 : ................
10fe0 : __ __ __ BYT 80 80 80 7f 7f 80 80 7f 7f 80 80 81 81 80 80 80 : ................
10ff0 : __ __ __ BYT 7f 7e 7f 7f 80 80 7f 80 80 80 80 7f 7f 7f 7f 7f : .~..............
11000 : __ __ __ BYT 7f 7f 7f 7f 80 7f 80 7f 80 80 7f 80 80 80 7f 80 : ................
11010 : __ __ __ BYT 80 80 80 80 80 80 7f 80 80 7f 7f 7f 80 7f 7f 80 : ................
11020 : __ __ __ BYT 7f 80 80 7f 7f 7f 7f 7f 7f 7f 7f 7f 80 80 81 82 : ................
11030 : __ __ __ BYT 81 80 7d 7f 80 80 82 7e 7e 7f 7f 7f 7e 7f 80 83 : ..}....~~...~...
11040 : __ __ __ BYT 81 80 81 7e 80 80 7f 80 80 7f 7f 7f 7f 7f 7e 80 : ...~..........~.
11050 : __ __ __ BYT 81 7e 7c 7f 80 7f 81 80 80 80 7f 80 81 81 7e 7d : .~|...........~}
11060 : __ __ __ BYT 7f 80 80 7f 7e 80 81 81 80 7f 7f 81 81 7f 80 80 : ....~...........
11070 : __ __ __ BYT 80 80 7f 80 7e 7e 7e 7f 7f 7f 80 80 80 7e 7e 7e : ....~~~......~~~
11080 : __ __ __ BYT 7e 80 80 80 80 80 80 80 7f 80 7f 7f 80 80 81 80 : ~...............
11090 : __ __ __ BYT 80 80 80 80 7f 80 7f 7f 80 81 80 80 80 80 80 7f : ................
110a0 : __ __ __ BYT 7f 7f 80 80 80 7f 7e 7f 7f 7f 7f 7f 80 80 80 80 : ......~.........
110b0 : __ __ __ BYT 7f 80 80 80 81 80 7f 80 7f 7f 80 7f 80 7f 7e 80 : ..............~.
110c0 : __ __ __ BYT 7f 81 81 7f 80 81 81 80 80 81 80 81 81 7f 7f 7b : ...............{
110d0 : __ __ __ BYT 79 7c 7d 7d 7e 80 83 84 84 85 83 7f 7d 79 79 7b : y|}}~.......}yy{
110e0 : __ __ __ BYT 7c 7d 80 82 82 83 82 80 80 7f 80 80 80 80 7f 7f : |}..............
110f0 : __ __ __ BYT 80 80 80 81 81 80 80 7f 80 80 80 7f 7e 7e 7f 80 : ............~~..
11100 : __ __ __ BYT 80 81 80 81 80 7f 7e 7e 7e 7e 7e 7d 81 80 81 7f : ......~~~~~}....
11110 : __ __ __ BYT 7e 83 80 7d 7a 7d 7f 83 83 81 7e 7b 7e 82 82 81 : ~..}z}....~{~...
11120 : __ __ __ BYT 80 7c 82 81 7d 83 7f 7d 80 84 7c 83 85 7c 81 80 : .|..}..}..|..|..
11130 : __ __ __ BYT 86 8e 8c 79 7c 7e 72 7c 68 66 82 87 92 92 7e 7c : ...y|~r|hf....~|
11140 : __ __ __ BYT 7c 7a 8a 8b 80 7b 7b 7c 84 7c 66 76 87 8d 8a 7b : |z...{{|.|fv...{
11150 : __ __ __ BYT 77 75 7b 81 8f 92 87 7a 69 6d 82 8c 8a 93 80 70 : wu{....zim.....p
11160 : __ __ __ BYT 76 79 8b 83 7b 7e 89 8b 7a 77 80 8e 8a 7d 73 78 : vy..{~..zw...}sx
11170 : __ __ __ BYT 8b 8b 7f 76 79 81 89 7f 79 81 80 7f 83 83 79 77 : ...vy...y.....yw
11180 : __ __ __ BYT 78 7c 88 86 7f 7c 7e 80 7e 7a 7c 80 85 87 85 80 : x|...|~.~z|.....
11190 : __ __ __ BYT 7b 7a 7c 85 7e 74 7e 85 84 83 7e 7f 85 81 80 7f : {z|.~t~...~.....
111a0 : __ __ __ BYT 80 82 7e 81 82 80 7d 7e 80 82 80 7b 7f 82 84 81 : ..~...}~...{....
111b0 : __ __ __ BYT 7e 81 83 81 7e 81 7f 7d 7a 79 7d 7f 80 80 82 80 : ~...~..}zy}.....
111c0 : __ __ __ BYT 7f 7e 7e 81 80 7e 7d 80 81 80 7e 7b 7f 81 81 81 : .~~..~}...~{....
111d0 : __ __ __ BYT 81 80 80 81 80 81 80 7e 80 80 81 80 7f 7f 81 81 : .......~........
111e0 : __ __ __ BYT 7e 7e 7f 82 80 7e 7e 7f 80 7f 80 7f 7f 7e 7d 7f : ~~...~~......~}.
111f0 : __ __ __ BYT 7f 7f 7f 7f 7e 7f 7f 7f 80 81 81 80 7f 7f 80 81 : ....~...........
11200 : __ __ __ BYT 81 80 7f 7f 7f 80 80 81 81 81 80 7f 7f 7f 80 7f : ................
11210 : __ __ __ BYT 7f 80 80 7f 7e 7e 7f 7f 7f 7f 7f 80 80 7f 7f 7f : ....~~..........
11220 : __ __ __ BYT 7f 7f 80 7f 80 80 80 80 80 81 81 81 81 81 80 80 : ................
11230 : __ __ __ BYT 7f 80 81 81 81 80 80 80 7f 7f 80 7f 7f 7f 7f 7f : ................
11240 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7e 7f 80 80 7f 7f : ..........~.....
11250 : __ __ __ BYT 7f 80 80 7f 7f 7f 7f 80 80 80 80 80 80 80 80 80 : ................
11260 : __ __ __ BYT 80 80 80 80 80 80 80 7f 7f 7f 7f 7f 7f 80 7f 7f : ................
11270 : __ __ __ BYT 7f 7f 7f 80 7f 7d 7e 7f 7f 7f 80 80 7f 7f 7f 7f : .....}~.........
11280 : __ __ __ BYT 7e 7f 80 80 7f 7f 7e 7f 7f 80 81 81 80 80 7f 80 : ~.....~.........
11290 : __ __ __ BYT 80 80 80 80 80 80 80 7f 7f 7f 80 80 80 80 80 80 : ................
112a0 : __ __ __ BYT 80 7f 7f 7f 7f 7f 7f 7f 80 7f 7f 7f 80 80 7f 7f : ................
112b0 : __ __ __ BYT 7f 80 80 80 80 80 7f 80 80 80 80 7f 80 80 80 80 : ................
112c0 : __ __ __ BYT 80 80 7f 80 80 80 80 80 80 80 7f 80 80 80 7f 7f : ................
112d0 : __ __ __ BYT 7f 80 80 7f 80 80 80 80 7f 7f 80 80 80 80 80 80 : ................
112e0 : __ __ __ BYT 80 7f 7f 80 7f 80 7f 7f 7f 7f 7f 7f 80 80 7f 7f : ................
112f0 : __ __ __ BYT 80 7f 7f 7f 80 80 7f 7f 80 80 80 7f 7f 7f 80 7f : ................
11300 : __ __ __ BYT 7f 7c 80 84 7c 7c 80 80 82 80 7d 7f 80 7f 80 82 : .|..||....}.....
11310 : __ __ __ BYT 7f 7f 7f 7c 7e 81 80 7f 80 81 80 82 7e 7c 80 82 : ...|~.......~|..
11320 : __ __ __ BYT 85 83 7e 7c 7d 7b 7b 7c 7e 81 83 81 80 7e 7e 80 : ..~|}{{|~....~~.
11330 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7e 7e 80 80 81 83 81 80 81 81 : ......~~........
11340 : __ __ __ BYT 81 80 7f 7f 7e 7e 7f 80 81 81 81 81 80 7f 7f 7f : ....~~..........
11350 : __ __ __ BYT 7e 7e 7f 7f 80 80 7f 7f 80 80 81 81 7f 7f 7f 7f : ~~..............
11360 : __ __ __ BYT 81 81 80 7f 7f 7e 7f 7f 7f 80 81 80 80 7f 7f 7f : .....~..........
11370 : __ __ __ BYT 7f 7e 7f 7f 7f 80 80 7f 7f 81 80 80 80 80 80 80 : .~..............
11380 : __ __ __ BYT 80 80 7f 7f 7f 80 80 80 81 80 7f 7f 7f 7f 80 80 : ................
11390 : __ __ __ BYT 7e 7e 7f 7f 7f 7f 7f 7f 7f 80 80 80 80 7f 7f 7e : ~~.............~
113a0 : __ __ __ BYT 7f 80 7f 80 80 80 80 80 80 7f 7f 7f 80 80 80 80 : ................
113b0 : __ __ __ BYT 7f 80 80 7f 7f 7f 7f 7f 7f 80 80 7f 7f 7f 7f 7f : ................
113c0 : __ __ __ BYT 80 81 81 80 7f 7f 7e 7f 7f 7f 7f 80 80 7f 80 81 : ......~.........
113d0 : __ __ __ BYT 81 80 7f 7e 7f 80 7f 7f 7f 7f 80 7f 7f 7f 80 80 : ...~............
113e0 : __ __ __ BYT 7f 7f 81 80 7f 81 81 7f 7f 7f 7f 7f 7e 7f 80 80 : ............~...
113f0 : __ __ __ BYT 81 80 80 80 80 80 80 7f 7f 7f 7f 80 80 80 80 7f : ................
11400 : __ __ __ BYT 7e 7f 81 81 81 81 7e 7e 7e 7e 7f 80 80 7f 7f 7e : ~.....~~~~.....~
11410 : __ __ __ BYT 81 82 80 80 81 7f 7f 7e 7e 7e 7d 80 80 80 80 80 : .......~~~}.....
11420 : __ __ __ BYT 81 80 80 7f 7d 7d 7e 80 7f 81 81 7f 80 83 81 7e : ....}}~........~
11430 : __ __ __ BYT 80 7f 7e 7e 7e 7e 7f 7f 81 7f 80 82 80 80 7e 80 : ..~~~~........~.
11440 : __ __ __ BYT 7f 7e 81 81 80 7f 81 81 7d 7f 7f 7f 81 7b 7e 81 : .~......}....{~.
11450 : __ __ __ BYT 80 82 81 7f 80 84 7f 7d 7d 7b 80 81 82 80 7d 81 : .......}}{....}.
11460 : __ __ __ BYT 83 7f 80 81 7c 7f 80 7e 80 82 80 7d 80 80 7f 7f : ....|..~...}....
11470 : __ __ __ BYT 7f 7f 7e 7d 7d 80 7e 80 84 81 81 82 7f 7d 80 7e : ..~}}.~......}.~
11480 : __ __ __ BYT 7d 7f 80 81 81 80 80 81 81 81 82 80 7e 7f 81 7e : }...........~..~
11490 : __ __ __ BYT 7d 80 7d 7e 81 7f 7c 82 84 7c 7d 80 7e 7e 81 7e : }.}~..|..|}.~~.~
114a0 : __ __ __ BYT 7e 81 7f 81 7f 7f 81 7f 7f 7e 7c 7f 81 80 81 81 : ~........~|.....
114b0 : __ __ __ BYT 81 81 82 7f 7c 80 7e 7f 81 7d 80 82 81 80 81 84 : ....|.~..}......
114c0 : __ __ __ BYT 82 81 7c 7c 7c 7b 82 7f 7f 81 7f 7f 80 84 7f 7c : ..|||{.........|
114d0 : __ __ __ BYT 7e 7f 80 81 81 7f 7d 7e 7e 7f 81 7e 80 81 7f 81 : ~.....}~~..~....
114e0 : __ __ __ BYT 7f 7f 81 7f 7e 7f 82 83 7f 7d 81 82 80 7f 80 80 : ....~....}......
114f0 : __ __ __ BYT 82 82 7f 7d 7d 80 7e 7e 81 7f 7f 84 84 7e 7c 7d : ...}}.~~.....~|}
11500 : __ __ __ BYT 7e 7d 7f 81 7f 7f 7f 7e 7e 82 82 7e 7e 80 7e 7d : ~}.....~~..~~.~}
11510 : __ __ __ BYT 7f 7f 81 81 80 81 82 7f 7f 81 80 7f 81 81 81 7f : ................
11520 : __ __ __ BYT 7f 80 7f 82 80 7c 81 82 81 7f 7f 7f 7d 7f 7e 7c : .....|......}.~|
11530 : __ __ __ BYT 80 81 7f 7e 7e 7d 7e 80 80 7f 7f 7f 80 7f 7e 82 : ...~~}~.......~.
11540 : __ __ __ BYT 81 7e 80 80 81 82 7f 7e 7f 81 82 83 81 7e 81 7e : .~.....~.....~.~
11550 : __ __ __ BYT 7c 81 82 7f 7e 81 81 7e 7f 80 7e 7e 7f 7e 7d 7f : |...~..~..~~.~}.
11560 : __ __ __ BYT 82 81 7f 7e 7e 7c 7f 83 7e 7c 7d 7f 80 7e 83 84 : ...~~|..~|}..~..
11570 : __ __ __ BYT 7e 80 83 7f 7f 81 7f 7e 7d 7f 82 7d 81 85 7e 80 : ~......~}..}..~.
11580 : __ __ __ BYT 84 7f 7e 7f 7f 82 7c 7c 82 7d 7d 81 82 7f 81 83 : ..~...||.}}.....
11590 : __ __ __ BYT 7d 7e 80 7e 7d 81 82 7d 7d 83 82 7d 81 81 7c 7d : }~.~}..}}..}..|}
115a0 : __ __ __ BYT 81 7f 7e 82 80 7d 80 81 81 80 80 7f 7c 7e 80 7f : ..~..}......|~..
115b0 : __ __ __ BYT 81 7f 7f 81 81 80 81 81 7d 80 80 81 81 7e 82 80 : ........}....~..
115c0 : __ __ __ BYT 7c 82 7f 7c 81 81 7c 80 82 7b 80 82 7e 7f 7e 80 : |..|..|..{..~.~.
115d0 : __ __ __ BYT 7d 7e 80 7c 7f 81 7f 80 81 81 7d 81 7f 7c 82 81 : }~.|......}..|..
115e0 : __ __ __ BYT 7f 81 82 81 80 82 7d 7e 82 80 81 7f 80 7f 7f 80 : ......}~........
115f0 : __ __ __ BYT 7f 81 81 7d 7e 7f 7f 7f 80 7a 7c 83 7f 80 81 7d : ...}~....z|....}
11600 : __ __ __ BYT 7e 82 82 7f 7f 7f 81 83 7f 7e 81 7e 80 82 7f 7f : ~........~.~....
11610 : __ __ __ BYT 82 81 7c 80 82 7d 7f 7f 7e 80 81 7f 7e 7f 81 7f : ..|..}..~...~...
11620 : __ __ __ BYT 7e 7f 7c 81 82 7e 81 82 80 7f 80 7d 7e 82 80 7f : ~.|..~.....}~...
11630 : __ __ __ BYT 80 7e 81 81 80 81 7f 80 7d 82 7e 7b 83 7c 7e 83 : .~......}.~{.|~.
11640 : __ __ __ BYT 80 7e 7f 7f 7f 7f 80 80 7b 80 84 7e 80 82 7d 81 : .~......{..~..}.
11650 : __ __ __ BYT 81 7c 80 81 80 80 7e 7e 81 7f 80 80 7d 81 7f 80 : .|....~~....}...
11660 : __ __ __ BYT 7f 7e 82 7d 7f 82 7e 80 82 7f 7f 80 7f 81 80 7d : .~.}..~........}
11670 : __ __ __ BYT 81 81 7e 82 7e 7d 82 80 7f 7f 7d 7f 80 7d 82 80 : ..~.~}....}..}..
11680 : __ __ __ BYT 7d 80 81 7f 7d 83 80 7d 82 7f 7c 83 81 7c 80 82 : }...}..}..|..|..
11690 : __ __ __ BYT 80 81 7f 80 82 7d 80 80 7e 7d 82 81 7c 83 7c 80 : .....}..~}..|.|.
116a0 : __ __ __ BYT 81 7b 83 7f 80 7f 7e 7f 7e 81 7b 7f 83 7e 81 81 : .{....~.~.{..~..
116b0 : __ __ __ BYT 7e 86 82 7c 80 7f 7d 86 82 77 80 80 7e 83 7e 7d : ~..|..}..w..~.~}
116c0 : __ __ __ BYT 81 7f 7d 81 7e 7c 82 80 7f 80 80 80 7f 7f 80 7e : ..}.~|.........~
116d0 : __ __ __ BYT 81 81 7f 80 7f 81 81 82 82 81 7e 7d 80 7c 80 84 : ..........~}.|..
116e0 : __ __ __ BYT 7d 7e 83 81 7e 7c 7d 7f 7e 81 84 81 7b 7f 81 7b : }~..~|}.~...{..{
116f0 : __ __ __ BYT 80 82 80 81 80 80 80 7e 81 81 7e 82 81 7c 80 82 : .......~..~..|..
11700 : __ __ __ BYT 7d 7f 80 81 84 7f 7a 7e 7d 7f 83 7b 7f 84 7a 7f : }.....z~}..{..z.
11710 : __ __ __ BYT 85 81 7f 7d 7e 82 80 7d 7f 7e 80 83 7d 7e 81 7e : ...}~..}.~..}~.~
11720 : __ __ __ BYT 82 7f 7c 82 7f 7f 81 7f 7f 80 80 82 80 7d 80 80 : ..|..........}..
11730 : __ __ __ BYT 7f 80 81 81 7f 7f 80 81 81 80 81 7f 7e 7f 80 7e : ............~..~
11740 : __ __ __ BYT 7f 81 7c 7e 7e 7c 82 82 80 82 80 80 81 7e 7f 81 : ..|~~|.......~..
11750 : __ __ __ BYT 7f 81 7e 7c 81 80 7d 82 7f 80 87 7f 7b 80 7f 81 : ..~|..}.....{...
11760 : __ __ __ BYT 81 7c 7e 7c 7f 84 7a 7c 82 7e 80 84 80 7d 7f 83 : .|~|..z|.~...}..
11770 : __ __ __ BYT 83 80 7b 7d 80 80 81 7c 7e 80 82 83 7c 80 81 80 : ..{}...|~...|...
11780 : __ __ __ BYT 81 80 7e 80 82 7f 7f 7e 7f 81 80 7f 7c 7f 81 81 : ..~....~....|...
11790 : __ __ __ BYT 83 7d 7f 84 7e 81 7f 7c 80 81 80 7f 7e 7c 7d 80 : .}..~..|....~|}.
117a0 : __ __ __ BYT 84 84 7e 7e 81 7f 82 81 7c 82 81 7e 7f 7b 7f 80 : ..~~....|..~.{..
117b0 : __ __ __ BYT 83 81 7d 82 7f 7a 82 83 7e 82 7d 7a 80 7f 7f 80 : ..}..z..~.}z....
117c0 : __ __ __ BYT 7f 80 7f 7a 81 86 7d 7d 81 80 82 80 7f 7f 7e 80 : ...z..}}......~.
117d0 : __ __ __ BYT 7d 7f 83 81 82 7e 80 83 7d 7e 83 80 7e 81 7d 7f : }....~..}~..~.}.
117e0 : __ __ __ BYT 7f 7e 84 7e 7d 81 7f 7f 83 81 7a 7f 82 82 80 7d : .~.~}.....z....}
117f0 : __ __ __ BYT 80 7d 7e 84 7f 7e 7e 7e 83 80 7f 82 80 80 7f 7f : .}~..~~~........
11800 : __ __ __ BYT 81 81 81 80 7e 7c 80 82 81 7e 7f 84 7b 7d 82 7f : ....~|...~..{}..
11810 : __ __ __ BYT 81 80 7c 7e 80 7c 7d 80 82 82 7d 7e 82 80 7e 7e : ..|~.|}...}~..~~
11820 : __ __ __ BYT 81 80 7e 80 7f 80 81 7e 80 7d 80 83 7e 80 80 7e : ..~....~.}..~..~
11830 : __ __ __ BYT 7f 81 84 81 7b 7f 82 7e 7d 80 80 7f 82 81 7d 80 : ....{..~}.....}.
11840 : __ __ __ BYT 84 80 7e 82 81 7e 7e 81 7e 7e 82 80 7f 7e 80 81 : ..~..~~.~~...~..
11850 : __ __ __ BYT 7e 81 7f 80 84 7c 7f 7f 7d 84 7f 7e 7f 7c 82 7d : ~....|..}..~.|.}
11860 : __ __ __ BYT 7f 85 7f 7d 82 80 7d 83 7f 7c 82 7b 7d 84 7f 81 : ...}..}..|.{}...
11870 : __ __ __ BYT 80 7f 82 81 7d 7f 83 80 7f 7e 7e 82 82 7c 7c 81 : ....}....~~..||.
11880 : __ __ __ BYT 81 83 81 7a 7b 80 81 83 83 7d 7e 82 7f 7b 7d 81 : ...z{....}~..{}.
11890 : __ __ __ BYT 83 7f 7c 7f 7e 82 82 7f 80 7f 81 80 7e 7f 7f 7f : ..|.~.......~...
118a0 : __ __ __ BYT 81 80 7d 81 81 7f 7f 7d 83 82 7f 80 7f 7e 7f 81 : ..}....}.....~..
118b0 : __ __ __ BYT 80 7e 80 7e 7f 83 7f 7b 81 84 7c 7d 80 80 82 7a : .~.~...{..|}...z
118c0 : __ __ __ BYT 7b 83 7e 7e 83 81 82 7f 7c 7f 80 80 80 80 7f 81 : {.~~....|.......
118d0 : __ __ __ BYT 84 7c 7c 80 7f 82 80 7f 81 7b 7f 85 80 7c 81 84 : .||......{...|..
118e0 : __ __ __ BYT 7f 7b 7f 81 7f 7f 81 80 7b 80 84 80 7f 81 82 7c : .{......{......|
118f0 : __ __ __ BYT 7d 84 7e 7e 81 7f 80 80 7f 80 7e 7f 83 82 80 7b : }.~~......~....{
11900 : __ __ __ BYT 80 80 7e 82 7e 81 80 7c 81 7e 7d 81 84 7e 7e 82 : ..~.~..|.~}..~~.
11910 : __ __ __ BYT 7c 80 7e 7f 83 7a 7d 82 81 81 7f 82 82 7e 7d 80 : |.~..z}......~}.
11920 : __ __ __ BYT 7d 7f 85 81 7b 7e 80 82 80 7f 83 7e 7c 81 80 80 : }...{~.....~|...
11930 : __ __ __ BYT 81 83 7e 7e 82 7e 81 81 7e 81 7e 7e 7f 82 7f 7d : ..~~.~..~.~~...}
11940 : __ __ __ BYT 84 7e 7e 80 80 7f 7d 82 80 80 80 7e 7f 7e 83 81 : .~~...}....~.~..
11950 : __ __ __ BYT 7e 7f 7d 7e 81 7f 81 82 7e 81 80 7d 80 83 7c 7b : ~.}~....~..}..|{
11960 : __ __ __ BYT 81 7f 7f 7f 80 81 7a 7b 85 81 7e 83 81 7e 7f 81 : ......z{..~..~..
11970 : __ __ __ BYT 7c 7b 82 85 7f 7c 7f 80 82 7f 7f 82 7c 7d 86 81 : |{...|......|}..
11980 : __ __ __ BYT 7d 81 82 7f 7e 7f 7d 7f 83 80 7e 7b 80 81 80 81 : }...~.}...~{....
11990 : __ __ __ BYT 7f 83 7d 7c 83 7c 81 82 7f 7d 7c 83 80 83 7f 7d : ..}|.|...}|....}
119a0 : __ __ __ BYT 84 7d 81 7f 7d 7e 7e 85 7c 7f 83 7a 81 84 81 7a : .}..}~~.|..z...z
119b0 : __ __ __ BYT 7c 83 7e 81 7e 7e 80 77 83 84 7b 7e 82 83 7d 81 : |.~.~~.w..{~..}.
119c0 : __ __ __ BYT 7d 7b 81 81 82 7d 7b 82 82 7f 7f 84 81 7a 82 82 : }{...}{......z..
119d0 : __ __ __ BYT 7a 80 82 81 81 7e 7d 81 82 82 83 7b 7b 83 80 80 : z....~}....{{...
119e0 : __ __ __ BYT 81 83 7e 7a 80 80 7f 81 83 7f 79 80 80 7f 82 82 : ..~z......y.....
119f0 : __ __ __ BYT 81 7c 7d 81 81 7f 7e 83 7e 7d 84 7e 7c 82 85 7b : .|}...~.~}.~|..{
11a00 : __ __ __ BYT 7b 85 7e 7e 83 83 7c 76 81 85 7b 7f 87 80 7d 82 : {.~~..|v..{...}.
11a10 : __ __ __ BYT 80 7a 7d 84 82 7c 7c 85 82 79 83 86 7b 7c 82 81 : .z}..||..y..{|..
11a20 : __ __ __ BYT 7d 81 86 7e 7b 7f 81 7f 80 84 7f 7b 7e 80 7f 7f : }..~{......{~...
11a30 : __ __ __ BYT 84 80 7c 83 82 7b 80 81 7d 7e 80 7f 7f 7f 80 83 : ..|..{..}~......
11a40 : __ __ __ BYT 7e 7e 82 7e 7f 82 80 7d 7e 80 7e 7e 81 83 7e 7c : ~~.~...}~.~~..~|
11a50 : __ __ __ BYT 83 81 7b 82 84 78 79 85 80 78 80 85 84 7f 7e 81 : ..{..xy..x....~.
11a60 : __ __ __ BYT 79 7e 88 7e 77 81 85 7c 7d 87 82 7d 7e 7f 7d 7d : y~.~w..|}..}~.}}
11a70 : __ __ __ BYT 86 81 7d 7f 80 7e 7e 84 82 7f 7f 80 7c 7c 82 83 : ..}..~~.....||..
11a80 : __ __ __ BYT 7e 7f 81 7e 7e 83 81 7b 80 82 80 7d 7d 85 80 7e : ~..~~..{...}}..~
11a90 : __ __ __ BYT 7f 7e 7d 7e 88 7f 7d 81 80 7f 7a 83 82 7c 83 80 : .~}~..}...z..|..
11aa0 : __ __ __ BYT 7d 7d 84 82 77 7c 85 80 78 83 86 7d 80 84 7b 76 : }}..w|..x..}..{v
11ab0 : __ __ __ BYT 84 87 7d 79 80 84 7a 81 88 7d 79 81 86 7a 7c 88 : ..}y..z..}y..z|.
11ac0 : __ __ __ BYT 81 7c 81 83 7b 7e 86 7e 7c 80 81 7e 7e 84 81 7e : .|..{~.~|..~~..~
11ad0 : __ __ __ BYT 7d 80 80 7c 84 81 7b 7d 81 80 7f 82 80 83 7e 7b : }..|..{}......~{
11ae0 : __ __ __ BYT 80 7d 82 83 7c 80 83 7e 7d 82 7f 7e 82 7c 7e 7e : .}..|..~}..~.|~~
11af0 : __ __ __ BYT 85 84 76 7c 84 81 7b 84 86 7b 7e 80 7f 78 80 89 : ..v|..{..{~..x..
11b00 : __ __ __ BYT 7d 7b 83 80 78 84 86 7c 7b 82 85 7b 7e 84 80 7d : }{..x..|{..{~..}
11b10 : __ __ __ BYT 80 84 7c 7e 86 7d 7a 7f 82 80 80 81 7f 7e 7f 83 : ..|~.}z......~..
11b20 : __ __ __ BYT 7e 7d 81 7e 81 80 80 81 7f 7c 82 80 7c 82 7d 80 : ~}.~.....|..|.}.
11b30 : __ __ __ BYT 81 7e 81 7f 80 7f 84 7e 7b 83 7a 7e 81 82 7f 7b : .~.....~{.z~...{
11b40 : __ __ __ BYT 82 80 7d 7b 83 84 7c 83 80 7a 7e 83 83 7c 7d 82 : ..}{..|..z~..|}.
11b50 : __ __ __ BYT 81 79 83 88 7c 7a 7f 82 7e 84 85 7f 7c 7f 85 7c : .y..|z..~...|..|
11b60 : __ __ __ BYT 81 85 7b 7b 81 84 7d 7e 82 80 7d 7e 88 7d 79 85 : ..{{..}~..}~.}y.
11b70 : __ __ __ BYT 7e 7b 7f 83 7e 7e 82 7e 81 7d 81 82 7f 84 7e 7e : ~{..~~.~.}....~~
11b80 : __ __ __ BYT 7d 7d 7f 82 81 7c 82 82 7d 80 83 7f 77 7d 86 7e : }}...|..}...w}.~
11b90 : __ __ __ BYT 7a 83 83 7e 7f 80 7d 7b 83 86 78 7a 85 7e 7a 86 : z..~..}{..xz.~z.
11ba0 : __ __ __ BYT 86 78 7e 85 80 7a 81 86 7c 7e 85 80 78 85 87 7b : .x~..z..|~..x..{
11bb0 : __ __ __ BYT 7e 7f 81 7a 82 85 79 7f 84 82 7c 81 81 7d 7f 7f : ~..z..y...|..}..
11bc0 : __ __ __ BYT 82 7d 7e 83 7e 7d 82 81 7c 82 82 7c 80 7c 7d 83 : .}~.~}..|..|.|}.
11bd0 : __ __ __ BYT 81 82 7d 7e 80 81 81 7f 81 78 7f 85 7d 7d 81 82 : ..}~.....x..}}..
11be0 : __ __ __ BYT 7d 7f 80 7f 7c 82 85 79 7c 82 80 7e 83 84 7b 7d : }...|..y|..~..{}
11bf0 : __ __ __ BYT 84 82 7b 7f 85 7b 7c 86 80 77 83 88 7a 7b 85 80 : ..{..{|..w..z{..
11c00 : __ __ __ BYT 7a 85 85 79 7e 81 82 7f 80 83 79 7e 82 7f 7d 82 : z..y~.....y~..}.
11c10 : __ __ __ BYT 86 7a 7f 81 7e 7f 82 83 7a 7e 7f 7e 80 84 82 7c : .z..~...z~.~...|
11c20 : __ __ __ BYT 7d 80 81 7d 82 7f 78 82 82 80 80 80 81 7c 7e 83 : }..}..x......|~.
11c30 : __ __ __ BYT 7b 7b 85 83 79 7d 84 7d 81 87 82 7a 7a 84 7f 7c : {{..y}.}...zz..|
11c40 : __ __ __ BYT 85 84 7b 7e 82 7d 82 85 83 79 79 81 7f 7f 84 84 : ..{~.}...yy.....
11c50 : __ __ __ BYT 79 7e 85 7e 7e 80 82 7b 7b 80 80 7e 83 84 80 7f : y~.~~..{{..~....
11c60 : __ __ __ BYT 7c 83 7e 7b 86 7f 7b 7e 80 7e 84 84 7b 80 81 80 : |.~{..{~.~..{...
11c70 : __ __ __ BYT 80 7e 81 7b 7d 81 7f 7e 80 87 80 7a 82 7f 79 82 : .~.{}..~...z..y.
11c80 : __ __ __ BYT 87 79 7c 82 7e 7f 85 82 7b 81 7f 7e 7f 81 84 7d : .y|.~...{..~...}
11c90 : __ __ __ BYT 7f 83 7f 7f 85 82 7d 7e 80 7e 7e 83 7f 7e 7e 80 : ......}~.~~..~~.
11ca0 : __ __ __ BYT 80 80 85 7f 7b 81 81 7c 82 83 7c 7e 82 80 7a 7f : ....{..|..|~..z.
11cb0 : __ __ __ BYT 82 81 7f 81 7e 79 83 84 7d 7d 81 80 7d 80 83 7f : ....~y..}}..}...
11cc0 : __ __ __ BYT 77 80 84 7d 7e 86 83 79 80 81 78 7c 87 84 7a 7f : w..}~..y..x|..z.
11cd0 : __ __ __ BYT 84 7c 7d 88 82 77 7f 84 7c 7b 84 83 7d 7f 83 81 : .|}..w..|{..}...
11ce0 : __ __ __ BYT 79 83 86 75 7e 84 7b 7f 84 80 7d 82 82 7e 7e 82 : y..u~.{...}..~~.
11cf0 : __ __ __ BYT 81 7a 80 81 7e 82 81 7d 81 81 7e 80 7c 7f 83 81 : .z..~..}..~.|...
11d00 : __ __ __ BYT 81 7c 7c 83 83 7f 80 7e 7d 7d 81 85 79 7b 85 7c : .||....~}}..y{.|
11d10 : __ __ __ BYT 7c 87 83 7b 81 83 7b 7a 82 84 7c 7b 85 81 78 85 : |..{..{z..|{..x.
11d20 : __ __ __ BYT 87 7b 7c 83 7e 7b 86 85 7c 7d 82 80 7c 82 88 7d : .{|.~{..|}..|..}
11d30 : __ __ __ BYT 78 81 81 7e 7f 83 80 7a 81 83 7e 82 83 7a 7b 83 : x..~...z..~..z{.
11d40 : __ __ __ BYT 81 7e 81 81 7e 7e 81 82 7c 7f 82 80 82 79 7f 83 : .~..~~..|....y..
11d50 : __ __ __ BYT 7e 82 80 7e 7e 80 7f 80 80 7b 81 83 7d 80 7f 81 : ~..~~....{..}...
11d60 : __ __ __ BYT 80 7f 81 77 7c 87 82 7b 7e 85 7b 7c 88 82 79 7f : ...w|..{~.{|..y.
11d70 : __ __ __ BYT 84 7c 7e 84 81 7c 81 85 7c 7a 86 83 76 7e 86 7d : .|~..|..|z..v~.}
11d80 : __ __ __ BYT 7d 87 7f 7a 83 82 7c 83 82 7a 7f 7e 7f 7f 81 83 : }..z..|..z.~....
11d90 : __ __ __ BYT 81 80 80 84 79 7c 84 7b 83 81 79 80 83 81 81 80 : ....y|.{..y.....
11da0 : __ __ __ BYT 7c 7f 7e 81 84 77 7b 86 80 80 83 80 7c 7d 83 80 : |.~..w{.....|}..
11db0 : __ __ __ BYT 76 82 87 78 7d 86 80 79 87 86 76 82 82 7c 7e 82 : v..x}..y..v..|~.
11dc0 : __ __ __ BYT 83 7d 7e 83 81 7b 85 87 78 7a 85 80 7a 84 82 7b : .}~..{..xz..z..{
11dd0 : __ __ __ BYT 80 86 7d 7c 82 7f 7c 7e 83 7c 7a 84 88 7e 7c 86 : ..}|..|~.|z..~|.
11de0 : __ __ __ BYT 7d 79 84 7f 7d 7f 7c 81 7f 82 84 80 7e 7e 81 7a : }y..}.|.....~~.z
11df0 : __ __ __ BYT 82 80 7a 81 82 81 7d 83 81 7b 80 81 79 81 86 79 : ..z...}..{..y..y
11e00 : __ __ __ BYT 81 81 7e 7e 83 81 7d 81 7d 80 7d 81 85 7d 7b 81 : ..~~..}.}.}..}{.
11e10 : __ __ __ BYT 80 7b 86 84 7a 7c 80 80 81 82 82 7f 7b 81 81 7f : .{..z|......{...
11e20 : __ __ __ BYT 80 84 7b 7b 84 7e 7d 81 85 7f 7f 81 7e 7d 7f 84 : ..{{.~}.....~}..
11e30 : __ __ __ BYT 7b 7d 80 81 80 81 85 7c 7d 80 81 7b 7e 85 7a 7d : {}.....|}..{~.z}
11e40 : __ __ __ BYT 83 80 7d 82 86 7c 7b 81 7d 7d 82 85 7f 7a 84 80 : ..}..|{.}}...z..
11e50 : __ __ __ BYT 7c 82 84 7e 7a 81 81 7e 7f 86 82 79 82 82 7f 82 : |..~z..~...y....
11e60 : __ __ __ BYT 84 7b 78 84 7f 7b 86 84 7d 7b 82 81 7f 83 81 7c : .{x..{..}{.....|
11e70 : __ __ __ BYT 78 82 84 78 83 88 7d 80 7f 7a 7b 84 86 78 7d 80 : x..x..}..z{..x}.
11e80 : __ __ __ BYT 80 83 81 84 79 7d 82 7e 78 7c 8b 7e 7c 81 7d 7f : ....y}.~x|.~|.}.
11e90 : __ __ __ BYT 85 86 77 79 82 7d 7d 83 84 7d 7c 86 83 79 81 85 : ..wy.}}..}|..y..
11ea0 : __ __ __ BYT 7c 7a 85 7c 78 87 86 7d 7b 88 80 79 86 82 78 7e : |z.|x..}{..y..x~
11eb0 : __ __ __ BYT 81 7f 81 81 83 7d 7c 84 83 78 7f 88 77 7b 89 7f : .....}|..x..w{..
11ec0 : __ __ __ BYT 7b 86 86 79 7d 84 80 78 81 84 7b 7c 81 87 7e 81 : {..y}..x..{|..~.
11ed0 : __ __ __ BYT 86 77 7e 83 7f 79 7f 86 7a 81 83 7f 7e 80 87 78 : .w~..y..z...~..x
11ee0 : __ __ __ BYT 7d 83 7c 7e 80 84 79 7c 89 7e 7a 86 82 78 81 81 : }.|~..y|.~z..x..
11ef0 : __ __ __ BYT 7b 82 81 82 7e 79 84 83 7b 86 86 78 7d 82 7b 7e : {...~y..{..x}.{~
11f00 : __ __ __ BYT 84 82 7a 7e 82 83 83 7d 82 7c 7d 84 7e 80 80 82 : ..z~...}.|}.~...
11f10 : __ __ __ BYT 7c 7c 7f 7f 82 80 85 7b 7b 80 82 81 7d 85 78 7a : ||.....{{...}.xz
11f20 : __ __ __ BYT 84 81 7d 7b 87 80 7d 84 7d 7d 7e 81 80 7a 81 7f : ..}{..}.}}~..z..
11f30 : __ __ __ BYT 7f 82 83 82 78 81 86 7c 7c 83 80 78 81 82 7b 81 : ....x..||..x..{.
11f40 : __ __ __ BYT 85 82 7d 7f 83 80 7b 83 82 79 7e 85 80 7d 84 81 : ..}...{..y~..}..
11f50 : __ __ __ BYT 7c 7f 82 81 7b 83 83 77 80 84 81 7e 81 84 79 80 : |...{..w...~..y.
11f60 : __ __ __ BYT 83 80 7c 7c 86 7a 7c 83 7e 7e 81 87 7b 7d 84 7c : ..||.z|.~~..{}.|
11f70 : __ __ __ BYT 7d 7e 86 7d 7a 86 80 7e 7f 85 7d 76 83 81 80 7e : }~.}z..~..}v...~
11f80 : __ __ __ BYT 85 80 75 85 81 7c 82 85 81 76 80 84 7d 7d 81 85 : ..u..|...v..}}..
11f90 : __ __ __ BYT 7a 7d 85 7e 7e 85 83 77 82 87 7c 7e 80 82 79 7f : z}.~~..w..|~..y.
11fa0 : __ __ __ BYT 87 7f 79 80 88 79 7f 85 80 7b 80 89 76 7c 85 7f : ..y..y...{..v|..
11fb0 : __ __ __ BYT 7e 81 83 7a 7d 84 81 7b 7d 86 7f 74 83 86 79 7f : ~..z}..{}..t..y.
11fc0 : __ __ __ BYT 86 7b 7a 87 7e 7d 83 82 80 76 82 85 7d 7d 84 82 : .{z.~}...v..}}..
11fd0 : __ __ __ BYT 75 84 85 7b 7e 83 81 79 83 84 79 7f 85 7e 7d 81 : u..{~..y..y..~}.
11fe0 : __ __ __ BYT 81 80 80 83 80 7c 7c 84 82 7a 80 83 7b 80 83 7d : .....||..z..{..}
11ff0 : __ __ __ BYT 83 83 7e 7b 7f 81 7f 83 7e 81 80 7c 80 81 83 7b : ..~{....~..|...{
12000 : __ __ __ BYT 81 81 78 82 81 7f 7e 85 80 79 86 7d 7d 82 7c 82 : ..x...~..y.}}.|.
12010 : __ __ __ BYT 7c 80 83 80 7e 81 86 76 7d 83 7c 81 7f 82 7e 7e : |...~..v}.|...~~
12020 : __ __ __ BYT 81 7e 80 80 85 79 7c 85 7a 80 82 81 80 7e 82 7c : .~...y|.z....~.|
12030 : __ __ __ BYT 83 80 7f 81 7b 82 7d 80 81 7f 83 7b 82 81 7f 7e : ....{.}....{...~
12040 : __ __ __ BYT 80 84 79 83 81 7e 7d 7b 89 7d 7c 86 7e 7c 81 83 : ..y..~}{.}|.~|..
12050 : __ __ __ BYT 76 7f 86 7f 7f 7c 89 7e 75 87 80 7a 7f 87 7e 77 : v....|.~u..z..~w
12060 : __ __ __ BYT 88 80 7a 7f 85 84 75 7f 85 7b 7e 86 83 73 7d 89 : ..z...u..{~..s}.
12070 : __ __ __ BYT 7f 7e 81 83 79 7c 88 7b 7c 89 85 77 7a 86 81 7d : .~..y|.{|..wz..}
12080 : __ __ __ BYT 80 86 7e 79 84 81 79 81 88 7d 78 86 83 7a 7f 85 : ..~y..y..}x..z..
12090 : __ __ __ BYT 7d 79 86 81 7a 7d 85 85 7c 80 81 80 7a 81 86 75 : }y..z}..|...z..u
120a0 : __ __ __ BYT 7f 86 7c 7c 85 83 7a 7f 82 81 79 79 89 7f 76 86 : ..||..z...yy..v.
120b0 : __ __ __ BYT 85 79 7d 88 7c 76 85 84 7b 7c 85 82 79 81 85 7d : .y}.|v..{|..y..}
120c0 : __ __ __ BYT 79 85 85 75 7f 86 7b 7b 84 87 7f 79 84 81 78 86 : y..u..{{...y..x.
120d0 : __ __ __ BYT 85 76 7d 87 7f 7e 81 81 81 78 80 86 7b 7d 89 80 : .v}..~...x..{}..
120e0 : __ __ __ BYT 78 81 80 80 80 84 81 78 7d 84 82 7a 82 83 74 7e : x......x}..z..t~
120f0 : __ __ __ BYT 87 81 7b 82 85 76 78 84 80 7e 81 87 7e 79 87 7e : ..{..vx..~..~y.~
12100 : __ __ __ BYT 7a 84 86 7f 74 7f 83 7e 7e 86 86 76 80 85 7d 7c : z...t..~~..v..}|
12110 : __ __ __ BYT 84 83 77 7e 83 7c 7f 86 84 79 7c 82 82 7e 80 86 : ..w~.|...y|..~..
12120 : __ __ __ BYT 7c 78 84 7d 7c 84 83 81 7c 80 81 7f 7c 83 84 77 : |x.}|...|...|..w
12130 : __ __ __ BYT 80 83 80 7d 82 86 79 7f 82 80 7e 7d 85 78 78 87 : ...}..y...~}.xx.
12140 : __ __ __ BYT 81 7e 82 84 7b 7a 82 82 7d 78 86 83 76 85 81 7b : .~..{z..}x..v..{
12150 : __ __ __ BYT 80 81 81 79 7f 85 7d 7b 85 84 76 7b 85 82 7e 81 : ...y..}{..v{..~.
12160 : __ __ __ BYT 83 79 7c 86 7e 7b 81 84 80 7f 81 80 7e 7e 86 7e : .y|.~{......~~.~
12170 : __ __ __ BYT 76 83 84 7e 7c 84 81 78 83 83 7f 7e 83 83 76 7d : v..~|..x...~..v}
12180 : __ __ __ BYT 86 84 7a 81 87 75 80 86 7e 7c 7d 86 7c 7a 86 83 : ..z..u..~|}.|z..
12190 : __ __ __ BYT 7b 7e 87 7a 79 84 82 7f 78 86 84 76 84 84 7c 7d : {~.zy...x..v..|}
121a0 : __ __ __ BYT 88 80 74 81 85 7d 7a 84 84 79 81 88 7e 76 85 86 : ..t..}z..y..~v..
121b0 : __ __ __ BYT 75 80 87 79 7c 85 82 7d 80 87 7d 79 83 83 7c 7d : u..y|..}..}y..|}
121c0 : __ __ __ BYT 83 7e 7a 81 85 7b 80 86 7e 7f 7e 83 82 79 7d 84 : .~z..{..~.~..y}.
121d0 : __ __ __ BYT 7f 7a 8a 83 77 83 84 7e 76 84 82 75 87 81 7a 7f : .z..w..~v..u..z.
121e0 : __ __ __ BYT 83 86 79 7d 84 82 79 7b 88 78 7c 84 7e 80 7f 87 : ..y}..y{.x|.~...
121f0 : __ __ __ BYT 7d 79 85 7f 78 7f 87 7f 7a 7f 83 7e 7d 88 83 75 : }y..x...z..~}..u
12200 : __ __ __ BYT 81 81 79 82 85 7f 79 82 83 7f 84 83 80 78 80 82 : ..y...y......x..
12210 : __ __ __ BYT 7d 82 81 83 7b 80 85 7d 82 80 81 7f 7d 82 7d 80 : }...{..}....}.}.
12220 : __ __ __ BYT 7f 81 82 7a 82 82 7c 81 84 7c 77 85 81 7c 7f 83 : ...z..|..|w..|..
12230 : __ __ __ BYT 82 7b 80 81 7c 7d 86 81 77 81 84 7d 7f 86 80 79 : .{..|}..w..}...y
12240 : __ __ __ BYT 82 82 7a 7c 83 86 7d 79 83 81 7c 86 85 79 7d 82 : ..z|..}y..|..y}.
12250 : __ __ __ BYT 7c 7c 81 84 7d 7d 85 81 7b 82 84 7b 7e 82 7e 7c : ||..}}..{..{~.~|
12260 : __ __ __ BYT 81 83 80 7e 81 82 7b 80 86 7d 7b 80 7f 7d 82 84 : ...~..{..}{..}..
12270 : __ __ __ BYT 80 7c 7e 85 7f 7a 85 7f 75 85 85 79 7e 83 7e 7b : .|~..z..u..y~.~{
12280 : __ __ __ BYT 83 82 7d 7b 81 84 78 7c 86 7f 7d 83 84 7b 7d 83 : ..}{..x|..}..{}.
12290 : __ __ __ BYT 80 7c 7f 88 7e 77 82 82 7c 82 89 7c 78 81 81 7e : .|..~w..|..|x..~
122a0 : __ __ __ BYT 7f 86 81 7b 81 82 7b 7f 84 7f 7d 7e 7e 7f 80 81 : ...{..{...}~~...
122b0 : __ __ __ BYT 81 80 82 82 7f 81 81 7f 7f 7e 7d 81 82 80 82 7f : .........~}.....
122c0 : __ __ __ BYT 80 82 7d 7c 84 7d 7b 85 7b 7c 83 82 80 7e 80 7e : ..}|.}{.{|...~.~
122d0 : __ __ __ BYT 80 7d 80 81 75 7f 83 7e 7e 82 84 7b 7c 7f 7d 7c : .}..u..~~..{|.}|
122e0 : __ __ __ BYT 85 86 77 7f 83 7f 81 83 80 7e 82 7d 81 80 7e 84 : ..w......~.}..~.
122f0 : __ __ __ BYT 81 7f 80 7f 7f 81 81 81 81 7a 80 83 7e 80 81 7f : .........z..~...
12300 : __ __ __ BYT 7b 80 81 7c 81 7d 7d 7e 7c 81 81 82 7f 7f 82 80 : {..|.}}~|.......
12310 : __ __ __ BYT 7c 7a 86 81 7d 83 7c 7d 83 86 7d 7d 84 7d 78 81 : |z..}.|}..}}.}x.
12320 : __ __ __ BYT 8a 7c 77 83 84 7d 7f 86 7f 78 82 7e 79 82 86 7f : .|w..}...x.~y...
12330 : __ __ __ BYT 7a 7f 81 7a 7d 8a 83 79 7c 81 7e 7b 8a 81 79 83 : z..z}..y|.~{..y.
12340 : __ __ __ BYT 80 7d 7f 87 80 7b 7d 7f 81 80 85 82 7a 82 84 7d : .}...{}.....z..}
12350 : __ __ __ BYT 80 84 7e 7b 82 7f 80 80 80 85 7e 80 7d 7f 7e 7d : ..~{......~.}.~}
12360 : __ __ __ BYT 85 79 82 83 7a 7f 82 87 7b 7a 7e 7e 7d 80 84 77 : .y..z...{z~~}..w
12370 : __ __ __ BYT 81 89 7c 7d 84 81 79 78 80 84 7f 84 87 7b 7f 86 : ..|}..yx.....{..
12380 : __ __ __ BYT 7b 79 82 81 7b 80 7f 7c 7f 87 8c 7f 78 7d 80 7b : {y..{..|....x}.{
12390 : __ __ __ BYT 7e 80 76 81 83 7a 81 85 85 7f 7d 81 80 7d 7e 83 : ~.v..z....}..}~.
123a0 : __ __ __ BYT 7c 7b 82 7d 7e 86 82 7e 82 84 7f 7b 81 7e 7c 82 : |{.}~..~...{.~|.
123b0 : __ __ __ BYT 7e 80 7f 80 87 7d 7d 80 7b 7d 84 84 77 7d 82 7d : ~....}}.{}..w}.}
123c0 : __ __ __ BYT 7f 82 86 7e 7c 82 7a 7d 88 84 79 7a 7f 82 7e 86 : ...~|.z}..yz..~.
123d0 : __ __ __ BYT 85 7a 80 80 80 7f 83 88 7c 7d 80 81 80 7f 86 7e : .z......|}.....~
123e0 : __ __ __ BYT 7d 80 81 7e 7e 86 80 7d 7f 7f 83 80 7f 7f 7c 7d : }..~~..}......|}
123f0 : __ __ __ BYT 80 81 84 85 7e 7d 7c 7d 81 7a 82 83 7d 82 7e 7e : ....~}|}.z..}.~~
12400 : __ __ __ BYT 82 82 7a 7f 88 7c 7b 80 81 79 78 83 7f 7c 86 87 : ..z..|{..yx..|..
12410 : __ __ __ BYT 7d 7b 7e 7e 79 84 88 77 78 7e 7e 7d 84 88 7d 83 : }{~~y..wx~~}..}.
12420 : __ __ __ BYT 80 7c 80 7d 87 7c 79 83 80 80 80 83 7c 7d 81 80 : .|.}.|y.....|}..
12430 : __ __ __ BYT 82 7f 82 7f 7c 7e 82 80 7f 85 7d 79 7e 82 7d 81 : ....|~....}y~.}.
12440 : __ __ __ BYT 87 7f 7f 7f 7f 7b 7c 84 7f 7f 7d 80 82 81 85 7c : .....{|...}....|
12450 : __ __ __ BYT 80 7f 7a 7f 7f 81 7b 7f 84 81 80 84 86 7c 7d 82 : ..z...{......|}.
12460 : __ __ __ BYT 7d 7d 81 81 7b 7e 85 82 78 84 8d 7c 7d 84 7c 78 : }}..{~..x..|}.|x
12470 : __ __ __ BYT 83 87 7b 7b 83 82 7c 85 87 7b 7c 81 81 7d 7f 82 : ..{{..|..{|..}..
12480 : __ __ __ BYT 7e 7c 81 84 7d 80 83 7c 7d 81 7f 7d 85 82 7c 81 : ~|..}..|}..}..|.
12490 : __ __ __ BYT 7e 7f 81 7c 7f 82 7e 80 7f 7b 83 81 7e 81 81 7e : ~..|..~..{..~..~
124a0 : __ __ __ BYT 7c 83 7e 77 7f 81 7d 7f 86 81 7c 81 7e 7c 7d 82 : |.~w..}...|.~|}.
124b0 : __ __ __ BYT 85 7d 81 7f 79 7c 82 88 7e 82 7f 77 7d 7f 82 7b : .}..y|..~..w}..{
124c0 : __ __ __ BYT 7f 86 80 7d 80 84 7c 7e 84 7e 81 86 80 7c 7d 7f : ...}..|~.~...|}.
124d0 : __ __ __ BYT 80 82 83 84 7f 7d 7e 7e 7b 7e 84 7f 81 80 7b 82 : .....}~~{~....{.
124e0 : __ __ __ BYT 7c 79 80 83 82 80 80 81 7e 7b 84 83 81 84 7e 78 : |y......~{....~x
124f0 : __ __ __ BYT 7e 84 7c 7e 82 7c 81 80 82 81 7e 84 7f 83 82 7d : ~.|~.|....~....}
12500 : __ __ __ BYT 80 7b 7d 7f 80 80 82 82 7c 85 84 7b 80 82 7f 7f : .{}.....|..{....
12510 : __ __ __ BYT 80 82 7e 79 7d 7f 81 80 81 81 7b 82 81 7d 81 82 : ..~y}.....{..}..
12520 : __ __ __ BYT 80 80 7f 7a 82 82 7f 86 7e 7c 83 83 81 7d 7e 7f : ...z....~|...}~.
12530 : __ __ __ BYT 7e 80 81 82 7d 7e 7e 7a 81 7e 7c 7f 82 83 80 80 : ~...}~~z.~|.....
12540 : __ __ __ BYT 7e 7d 80 81 84 82 7f 7f 7e 7e 81 7e 7d 80 7f 80 : ~}......~~.~}...
12550 : __ __ __ BYT 81 80 7b 7e 83 7b 7f 83 7e 80 81 7d 7c 7f 80 81 : ..{~.{..~..}|...
12560 : __ __ __ BYT 7d 7e 80 7e 82 83 84 83 84 80 7e 7e 7d 7e 7d 7e : }~.~......~~}~}~
12570 : __ __ __ BYT 7d 80 82 7f 7e 80 7d 7f 83 7c 80 80 7d 85 7e 7b : }...~.}..|..}.~{
12580 : __ __ __ BYT 80 80 7e 80 80 7e 81 7f 7f 81 81 84 84 82 80 80 : ..~..~..........
12590 : __ __ __ BYT 80 7e 7c 7f 7d 7e 82 7c 7e 84 7f 7c 7f 81 80 7e : .~|.}~.|~..|...~
125a0 : __ __ __ BYT 80 7f 7b 7e 82 7f 7f 82 80 80 80 7e 80 80 81 80 : ..{~.......~....
125b0 : __ __ __ BYT 7f 81 80 80 80 7f 80 7f 7d 80 81 7e 7e 7e 7f 80 : ........}..~~~..
125c0 : __ __ __ BYT 7f 81 7d 7f 82 81 7d 7d 7f 7f 81 82 82 7c 81 85 : ..}...}}.....|..
125d0 : __ __ __ BYT 7e 7d 80 82 7f 80 81 82 7d 7f 83 7b 7e 83 7c 7c : ~}......}..{~.||
125e0 : __ __ __ BYT 82 7f 7f 7f 7b 81 83 7f 80 80 7e 7f 80 7f 7e 7e : ....{.....~...~~
125f0 : __ __ __ BYT 80 80 81 81 80 7f 7f 82 80 80 82 7e 7f 84 83 7d : ...........~...}
12600 : __ __ __ BYT 7d 7f 7d 7f 7f 80 7d 7f 83 7e 7f 83 7f 7e 80 7f : }.}...}..~...~..
12610 : __ __ __ BYT 7f 7f 80 7f 7d 80 83 80 7c 81 80 7f 81 7b 7f 80 : ....}...|....{..
12620 : __ __ __ BYT 7e 84 80 7c 81 84 81 81 80 7e 80 80 7e 7f 7b 7c : ~..|.....~..~.{|
12630 : __ __ __ BYT 84 80 82 86 7f 7e 7f 7f 7e 7e 7e 7f 7d 80 84 80 : .....~..~~~.}...
12640 : __ __ __ BYT 7e 7f 7e 7f 80 7e 7e 7d 81 82 7e 7f 81 81 80 81 : ~.~..~~}..~.....
12650 : __ __ __ BYT 7f 7c 81 82 80 7f 80 80 82 81 7f 81 7b 7b 85 82 : .|..........{{..
12660 : __ __ __ BYT 7e 80 81 7f 80 82 7e 7d 7c 81 80 7f 83 7e 7d 80 : ~.....~}|....~}.
12670 : __ __ __ BYT 81 7f 7e 7f 80 7d 7d 80 7e 7f 83 82 7f 80 81 7f : ..~..}}.~.......
12680 : __ __ __ BYT 7d 7e 7f 7e 80 80 7f 7f 81 82 80 82 81 7f 7f 7f : }~.~............
12690 : __ __ __ BYT 80 7f 7d 81 83 81 80 80 80 7e 80 80 7c 7b 80 82 : ..}......~..|{..
126a0 : __ __ __ BYT 80 80 7f 7f 7f 81 81 7d 7c 7d 7e 7e 80 7f 7d 7f : .......}|}~~..}.
126b0 : __ __ __ BYT 82 81 7f 80 81 7f 80 81 7e 7f 84 81 80 81 81 81 : ........~.......
126c0 : __ __ __ BYT 82 80 7e 7f 7e 80 81 7f 7f 80 81 81 80 7f 7c 7e : ..~.~.........|~
126d0 : __ __ __ BYT 7f 80 81 7e 7f 7f 7e 80 7f 7d 7d 7f 7f 80 7f 7f : ...~..~..}}.....
126e0 : __ __ __ BYT 7f 80 82 7f 7f 80 7f 7f 80 7e 7e 81 81 81 82 80 : .........~~.....
126f0 : __ __ __ BYT 7f 7f 7f 81 7f 80 80 7f 81 80 80 81 80 7f 80 7f : ................
12700 : __ __ __ BYT 7f 80 7f 7e 7d 7f 7f 7f 80 7f 7f 7f 7f 80 80 7e : ...~}..........~
12710 : __ __ __ BYT 7f 80 7f 80 80 7e 7f 80 7e 81 80 7f 81 80 80 80 : .....~..~.......
12720 : __ __ __ BYT 7f 7f 80 81 7f 7f 80 80 7f 80 7f 80 80 80 7f 7f : ................
12730 : __ __ __ BYT 80 80 7f 7e 7f 80 7f 7f 80 7f 7f 80 80 7f 80 7f : ...~............
12740 : __ __ __ BYT 7f 80 7f 80 7f 7f 7f 7f 81 80 7f 80 80 7f 80 7f : ................
12750 : __ __ __ BYT 7f 80 80 7f 80 80 7f 80 80 80 81 7f 7f 80 7f 7f : ................
12760 : __ __ __ BYT 7f 80 80 80 80 7f 7e 80 80 7f 7f 7f 80 7f 7f 7f : ......~.........
12770 : __ __ __ BYT 7f 7f 7f 80 80 7f 7f 80 80 7f 80 80 7e 7f 81 7f : ............~...
12780 : __ __ __ BYT 80 81 80 7f 7f 80 80 80 80 80 7f 7f 80 80 80 80 : ................
12790 : __ __ __ BYT 7f 80 7f 80 7f 7f 80 7f 7e 80 7f 7f 7f 80 80 80 : ........~.......
127a0 : __ __ __ BYT 80 7f 7f 7f 7f 80 80 80 80 80 7f 7f 7f 7f 80 80 : ................
127b0 : __ __ __ BYT 7f 7f 80 80 80 80 7f 7f 80 80 80 7f 7e 7f 80 80 : ............~...
127c0 : __ __ __ BYT 80 80 80 80 80 7f 7f 80 80 80 7f 7f 7f 80 80 7f : ................
127d0 : __ __ __ BYT 80 7f 7f 80 7f 7f 7f 7f 80 7f 7e 80 80 7f 7f 80 : ..........~.....
127e0 : __ __ __ BYT 7f 7f 7f 80 7f 7f 80 80 80 7f 7f 7f 7f 80 80 80 : ................
127f0 : __ __ __ BYT 80 80 7f 80 80 80 80 80 80 80 80 80 80 80 7f 7f : ................
12800 : __ __ __ BYT 7f 7f 7f 7f 80 7f 7f 80 7f 7f 80 7f 7f 7f 80 80 : ................
12810 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 80 7f 80 80 7f 80 80 7f 7f 80 : ................
12820 : __ __ __ BYT 80 7f 80 7f 7f 7f 80 80 80 80 80 80 80 7f 7f 80 : ................
12830 : __ __ __ BYT 7f 80 80 80 80 7f 80 7f 80 7f 7f 7f 80 80 7f 7f : ................
12840 : __ __ __ BYT 7f 80 80 7f 7f 7f 7f 7f 80 80 7f 80 80 80 7f 80 : ................
12850 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 7f 80 80 7f 80 80 7f : ................
12860 : __ __ __ BYT 80 7f 80 80 7f 80 7f 7f 7f 7f 80 7f 7f 80 7f 80 : ................
12870 : __ __ __ BYT 80 7f 80 80 7f 7f 80 80 7f 7f 7f 80 7f 7f 80 80 : ................
12880 : __ __ __ BYT 7f 80 80 80 7f 7f 7f 7f 80 80 7f 7f 80 80 80 7f : ................
12890 : __ __ __ BYT 80 80 7f 80 80 80 80 80 80 7f 7f 7f 80 7f 7f 80 : ................
128a0 : __ __ __ BYT 80 7f 80 80 7f 7f 80 7f 7f 80 7f 7f 80 7f 7f 7f : ................
128b0 : __ __ __ BYT 80 80 7f 80 80 80 80 7f 80 7f 7f 80 80 80 80 7f : ................
128c0 : __ __ __ BYT 80 80 80 80 7f 7f 7f 80 7f 7f 80 7f 7f 80 7f 7f : ................
128d0 : __ __ __ BYT 7f 7f 80 7f 7f 80 7f 80 7f 7f 7f 80 7f 7f 80 80 : ................
128e0 : __ __ __ BYT 7f 7f 80 80 7f 7f 7f 7f 7f 80 7f 80 80 80 80 7f : ................
128f0 : __ __ __ BYT 80 80 80 7f 7f 80 80 80 80 7f 80 80 80 80 7f 7f : ................
12900 : __ __ __ BYT 80 7f 7f 80 7f 7f 80 7f 80 80 7f 7f 7f 7f 7f 7f : ................
12910 : __ __ __ BYT 7f 80 80 7f 80 7f 80 80 7f 7f 80 80 7f 80 7f 80 : ................
12920 : __ __ __ BYT 80 7f 80 80 80 80 80 7f 7f 80 80 80 80 7f 7f 80 : ................
12930 : __ __ __ BYT 7f 80 7f 7f 80 7f 7f 80 80 7f 80 7f 7f 7f 7f 80 : ................
12940 : __ __ __ BYT 7f 7f 7f 7f 7f 80 7f 7f 7f 7f 80 80 7f 80 7f 7f : ................
12950 : __ __ __ BYT 80 80 80 80 80 7f 80 80 80 7f 80 80 80 80 80 80 : ................
12960 : __ __ __ BYT 80 80 80 80 80 80 80 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
12970 : __ __ __ BYT 7f 7f 7f 7f 80 80 80 80 7f 7f 7f 7f 7f 7f 7f 80 : ................
12980 : __ __ __ BYT 80 7f 80 80 7f 80 80 80 80 80 7f 7f 80 7f 80 80 : ................
12990 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 80 80 80 80 80 7f 7f 7f : ................
129a0 : __ __ __ BYT 7f 7f 80 7f 7f 80 80 80 7f 7f 7f 7f 80 80 7f 7f : ................
129b0 : __ __ __ BYT 7f 80 80 7f 7f 80 80 80 80 7f 80 80 80 80 80 80 : ................
129c0 : __ __ __ BYT 80 80 80 80 80 7f 80 80 80 80 80 7f 80 80 80 7f : ................
129d0 : __ __ __ BYT 7f 80 7f 7f 7f 7f 7f 7f 80 7f 7f 7f 80 7f 7f 7f : ................
129e0 : __ __ __ BYT 7f 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 : ................
129f0 : __ __ __ BYT 80 7f 80 80 7f 80 80 7f 7f 7f 7f 7f 7f 80 80 7f : ................
12a00 : __ __ __ BYT 7f 7f 7f 80 80 80 80 80 80 80 80 80 7f 7f 7f 80 : ................
12a10 : __ __ __ BYT 80 80 80 80 7f 80 7f 7f 7f 80 7f 7f 7f 7f 7f 7f : ................
12a20 : __ __ __ BYT 7f 7f 80 80 7f 7f 7f 7f 80 80 7f 80 80 80 7f 80 : ................
12a30 : __ __ __ BYT 7f 80 7f 7f 7f 80 80 7f 7f 80 7f 7f 7f 7f 7f 7f : ................
12a40 : __ __ __ BYT 7f 7f 7f 80 80 7f 80 7f 80 80 7f 80 80 7f 80 80 : ................
12a50 : __ __ __ BYT 7f 80 80 7f 7f 80 80 7f 80 80 7f 80 80 80 80 7f : ................
12a60 : __ __ __ BYT 80 80 80 80 7f 80 80 7f 7f 7f 80 80 80 7f 80 80 : ................
12a70 : __ __ __ BYT 80 7f 7f 80 7f 7f 7f 7f 7f 80 7f 7f 7f 80 7f 7f : ................
12a80 : __ __ __ BYT 7f 7f 7f 7f 80 7f 7f 7f 80 80 80 80 80 80 80 80 : ................
12a90 : __ __ __ BYT 80 80 80 80 7f 7f 80 80 80 80 7f 7f 80 80 7f 7f : ................
12aa0 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 80 7f 7f 80 80 7f 80 7f 80 80 : ................
12ab0 : __ __ __ BYT 80 80 80 80 80 7f 80 80 80 80 80 80 80 80 80 80 : ................
12ac0 : __ __ __ BYT 7f 7f 80 7f 80 80 7f 7f 80 7f 7f 80 80 80 80 80 : ................
12ad0 : __ __ __ BYT 7f 80 80 80 7f 80 80 7f 80 80 7f 80 80 80 80 80 : ................
12ae0 : __ __ __ BYT 80 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
12af0 : __ __ __ BYT 7f 7f 80 80 7f 80 80 7f 80 7f 7f 7f 7f 80 7f 7f : ................
12b00 : __ __ __ BYT 80 7f 7f 80 7f 7f 7f 80 7f 7f 80 7f 7f 7f 7f 7f : ................
12b10 : __ __ __ BYT 80 80 80 80 7f 80 80 80 80 80 80 80 80 80 80 80 : ................
12b20 : __ __ __ BYT 7f 80 80 7f 7f 80 7f 7f 7f 80 7f 80 80 7f 7f 80 : ................
12b30 : __ __ __ BYT 7f 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 : ................
12b40 : __ __ __ BYT 80 7f 80 7f 7f 7f 80 7f 7f 7f 7f 80 7f 80 7f 7f : ................
12b50 : __ __ __ BYT 7f 80 80 7f 7f 7f 80 80 80 80 80 80 80 80 80 80 : ................
12b60 : __ __ __ BYT 80 80 80 80 80 80 80 7f 7f 80 80 80 80 80 7f 7f : ................
12b70 : __ __ __ BYT 7f 7f 7f 7f 80 80 7f 80 80 7f 80 7f 7f 80 7f 80 : ................
12b80 : __ __ __ BYT 80 80 7f 80 80 7f 80 80 7f 80 80 7f 7f 7f 7f 7f : ................
12b90 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 80 7f 7f 7f 7f 7f 80 80 : ................
12ba0 : __ __ __ BYT 80 7f 80 7f 80 80 80 7f 7f 7f 80 80 80 7f 80 7f : ................
12bb0 : __ __ __ BYT 7f 80 80 80 7f 7f 7f 80 80 80 80 7f 80 80 80 80 : ................
12bc0 : __ __ __ BYT 80 80 80 80 80 80 80 80 7f 80 80 80 80 80 7f 7f : ................
12bd0 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 80 80 80 7f 80 7f 80 80 : ................
12be0 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 7f 80 7f 80 7f 80 7f : ................
12bf0 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 80 80 80 7f 7f 7f 7f 80 80 : ................
12c00 : __ __ __ BYT 7f 80 80 80 80 80 80 80 7f 7f 80 80 80 80 7f 80 : ................
12c10 : __ __ __ BYT 80 7f 80 7f 7f 7f 7f 7f 80 80 80 80 7f 80 80 80 : ................
12c20 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 : ................
12c30 : __ __ __ BYT 80 80 80 80 80 7f 7f 7f 80 80 80 7f 80 7f 7f 7f : ................
12c40 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 : ................
12c50 : __ __ __ BYT 7f 80 7f 80 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
12c60 : __ __ __ BYT 7f 7f 7f 7f 7f 80 7f 7f 7f 7f 7f 80 7f 80 80 7f : ................
12c70 : __ __ __ BYT 7f 80 80 80 80 7f 7f 7f 80 80 7f 80 7f 7f 7f 80 : ................
12c80 : __ __ __ BYT 80 80 7f 80 7f 80 80 80 80 80 80 80 80 80 80 80 : ................
12c90 : __ __ __ BYT 80 80 80 7f 80 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
12ca0 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 80 80 7f 80 80 80 80 80 80 : ................
12cb0 : __ __ __ BYT 80 80 80 80 80 80 7f 80 7f 80 80 80 7f 80 7f 80 : ................
12cc0 : __ __ __ BYT 80 7f 80 7f 80 80 80 80 80 80 80 80 80 80 80 80 : ................
12cd0 : __ __ __ BYT 80 80 80 80 80 80 80 80 7f 80 80 80 80 7f 7f 7f : ................
12ce0 : __ __ __ BYT 7f 80 7f 7f 7f 7f 7f 7f 80 7f 7f 7f 80 80 80 80 : ................
12cf0 : __ __ __ BYT 80 7f 80 80 80 80 80 7f 7f 7f 80 7f 7f 7f 7f 7f : ................
12d00 : __ __ __ BYT 80 7f 7f 7f 7f 7f 7f 7f 80 7f 7f 7f 7f 7f 80 7f : ................
12d10 : __ __ __ BYT 7f 80 7f 80 7f 80 7f 80 7f 80 80 7f 7f 7f 7f 80 : ................
12d20 : __ __ __ BYT 7f 80 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 80 : ................
12d30 : __ __ __ BYT 7f 80 7f 80 80 80 7f 7f 7f 7f 7f 80 7f 80 7f 80 : ................
12d40 : __ __ __ BYT 80 80 80 7f 7f 7f 80 7f 80 80 80 80 80 80 80 80 : ................
12d50 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 : ................
12d60 : __ __ __ BYT 80 80 80 7f 7f 7f 7f 80 80 80 7f 80 7f 80 80 80 : ................
12d70 : __ __ __ BYT 80 80 7f 80 80 80 80 80 80 80 80 80 80 80 80 80 : ................
12d80 : __ __ __ BYT 80 80 80 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 80 7f : ................
12d90 : __ __ __ BYT 80 80 7f 80 80 80 80 80 80 80 80 80 80 7f 80 80 : ................
12da0 : __ __ __ BYT 80 80 80 80 7f 80 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
12db0 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 80 7f 80 7f 80 : ................
12dc0 : __ __ __ BYT 7f 80 80 80 7f 7f 7f 7f 7f 7f 7f 7f 7f 80 7f 7f : ................
12dd0 : __ __ __ BYT 7f 7f 7f 7f 7f 80 7f 7f 7f 80 7f 80 80 80 80 80 : ................
12de0 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 80 7f 7f 7f 80 80 : ................
12df0 : __ __ __ BYT 80 7f 7f 80 7f 80 80 80 80 80 7f 80 7f 80 80 80 : ................
12e00 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 7f 80 80 80 80 80 : ................
12e10 : __ __ __ BYT 7f 80 7f 7f 7f 80 80 80 80 80 80 80 80 80 80 80 : ................
12e20 : __ __ __ BYT 80 80 80 80 80 80 7f 80 80 80 7f 7f 7f 80 7f 7f : ................
12e30 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 80 80 7f 80 7f : ................
12e40 : __ __ __ BYT 80 80 80 80 80 80 7f 80 7f 80 80 80 80 80 80 80 : ................
12e50 : __ __ __ BYT 80 7f 7f 7f 80 80 80 7f 7f 7f 80 7f 7f 80 7f 80 : ................
12e60 : __ __ __ BYT 7f 80 7f 7f 80 7f 80 7f 80 80 7f 80 7f 80 7f 80 : ................
12e70 : __ __ __ BYT 7f 80 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
12e80 : __ __ __ BYT 7f 7f 7f 7f 7f 80 7f 80 80 80 80 7f 7f 7f 7f 80 : ................
12e90 : __ __ __ BYT 7f 80 7f 7f 7f 7f 7f 80 7f 80 7f 80 7f 80 7f 7f : ................
12ea0 : __ __ __ BYT 80 7f 80 80 80 80 80 80 80 80 80 80 80 80 80 80 : ................
12eb0 : __ __ __ BYT 80 80 7f 80 7f 80 7f 80 7f 7f 80 7f 80 7f 80 7f : ................
12ec0 : __ __ __ BYT 80 7f 80 80 7f 80 7f 80 80 80 80 80 80 7f 80 80 : ................
12ed0 : __ __ __ BYT 80 80 80 80 7f 80 7f 80 7f 7f 80 7f 80 7f 80 7f : ................
12ee0 : __ __ __ BYT 7f 80 7f 80 7f 7f 7f 80 80 80 80 80 80 7f 80 7f : ................
12ef0 : __ __ __ BYT 80 7f 80 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
12f00 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 80 7f 80 7f 7f 80 80 : ................
12f10 : __ __ __ BYT 80 80 80 80 7f 80 80 80 80 80 7f 80 80 7f 7f 7f : ................
12f20 : __ __ __ BYT 7f 7f 7f 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f : ................
12f30 : __ __ __ BYT 80 80 7f 80 80 80 80 80 80 7f 7f 80 80 7f 80 80 : ................
12f40 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 80 7f 80 7f 80 7f : ................
12f50 : __ __ __ BYT 80 80 80 80 80 80 80 80 7f 7f 7f 80 7f 80 7f 80 : ................
12f60 : __ __ __ BYT 80 80 7f 80 80 7f 80 7f 80 80 80 80 80 7f 80 7f : ................
12f70 : __ __ __ BYT 80 80 7f 80 7f 80 7f 80 7f 80 80 7f 80 7f 7f 7f : ................
12f80 : __ __ __ BYT 7f 80 7f 80 7f 7f 7f 7f 7f 80 7f 80 7f 7f 80 7f : ................
12f90 : __ __ __ BYT 80 7f 80 7f 80 80 80 80 80 80 7f 7f 80 7f 80 80 : ................
12fa0 : __ __ __ BYT 80 7f 7f 7f 7f 7f 7f 7f 7f 7f 80 7f 80 7f 80 7f : ................
12fb0 : __ __ __ BYT 80 80 80 7f 80 80 80 80 7f 80 7f 80 80 80 7f 80 : ................
12fc0 : __ __ __ BYT 7f 7f 80 7f 80 80 7f 7f 7f 7f 80 7f 7f 7f 80 7f : ................
12fd0 : __ __ __ BYT 80 7f 80 7f 7f 80 80 80 80 80 80 80 80 80 80 80 : ................
12fe0 : __ __ __ BYT 80 80 7f 80 80 80 80 80 80 80 7f 80 80 7f 7f 7f : ................
12ff0 : __ __ __ BYT 80 7f 80 80 7f 80 7f 80 80 7f 80 7f 7f 80 7f 7f : ................
13000 : __ __ __ BYT 7f 7f 7f 80 7f 80 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
13010 : __ __ __ BYT 80 7f 80 7f 7f 80 7f 80 7f 80 7f 80 80 7f 80 7f : ................
13020 : __ __ __ BYT 7f 7f 80 7f 80 7f 7f 7f 7f 80 7f 80 7f 7f 80 7f : ................
13030 : __ __ __ BYT 80 7f 7f 80 7f 7f 7f 7f 80 7f 80 80 80 80 80 7f : ................
13040 : __ __ __ BYT 80 7f 80 80 80 80 80 80 80 80 80 80 80 80 7f 80 : ................
13050 : __ __ __ BYT 80 80 80 7f 80 7f 80 80 80 80 80 80 80 80 80 80 : ................
13060 : __ __ __ BYT 80 80 80 80 80 80 7f 7f 7f 7f 7f 80 80 7f 80 7f : ................
13070 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 80 7f 80 7f 80 80 80 80 : ................
13080 : __ __ __ BYT 80 80 80 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 7f : ................
13090 : __ __ __ BYT 7f 7f 7f 80 7f 7f 7f 7f 7f 7f 7f 80 7f 7f 80 7f : ................
130a0 : __ __ __ BYT 80 7f 80 7f 80 80 7f 80 7f 7f 80 7f 80 7f 7f 7f : ................
130b0 : __ __ __ BYT 7f 7f 80 7f 7f 7f 7f 7f 80 7f 80 7f 80 80 7f 80 : ................
130c0 : __ __ __ BYT 7f 7f 80 7f 80 80 80 80 80 80 80 80 7f 80 7f 80 : ................
130d0 : __ __ __ BYT 80 80 80 80 7f 80 7f 80 80 80 80 80 80 80 80 80 : ................
130e0 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 7f : ................
130f0 : __ __ __ BYT 80 7f 80 7f 80 7f 7f 7f 80 7f 7f 7f 80 7f 7f 7f : ................
13100 : __ __ __ BYT 7f 7f 7f 80 7f 80 80 7f 80 7f 80 80 80 7f 80 7f : ................
13110 : __ __ __ BYT 7f 80 7f 80 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 80 : ................
13120 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 80 7f 80 : ................
13130 : __ __ __ BYT 7f 7f 7f 80 7f 80 7f 80 7f 80 7f 7f 7f 7f 80 80 : ................
13140 : __ __ __ BYT 80 7f 80 7f 80 7f 80 7f 80 80 80 80 80 80 7f 80 : ................
13150 : __ __ __ BYT 7f 80 80 80 80 80 80 80 80 7f 80 7f 80 80 80 7f : ................
13160 : __ __ __ BYT 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 80 80 80 : ................
13170 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 7f : ................
13180 : __ __ __ BYT 80 80 80 80 80 80 80 7f 80 80 80 80 7f 80 80 7f : ................
13190 : __ __ __ BYT 80 7f 80 80 80 80 7f 7f 7f 80 7f 80 7f 80 7f 7f : ................
131a0 : __ __ __ BYT 7f 7f 7f 80 7f 7f 7f 7f 80 7f 80 7f 80 7f 80 7f : ................
131b0 : __ __ __ BYT 80 7f 80 7f 80 7f 7f 80 7f 80 80 7f 7f 7f 7f 80 : ................
131c0 : __ __ __ BYT 80 7f 7f 7f 7f 80 7f 80 7f 80 7f 80 7f 80 80 80 : ................
131d0 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 80 80 80 80 7f 80 : ................
131e0 : __ __ __ BYT 7f 80 7f 80 7f 80 80 7f 80 7f 7f 80 80 80 7f 80 : ................
131f0 : __ __ __ BYT 7f 80 7f 80 7f 80 80 80 80 80 80 80 80 80 7f 80 : ................
13200 : __ __ __ BYT 80 7f 80 7f 80 7f 80 7f 7f 80 7f 7f 80 7f 80 80 : ................
13210 : __ __ __ BYT 7f 80 7f 7f 80 80 7f 80 80 80 80 80 7f 80 7f 80 : ................
13220 : __ __ __ BYT 80 80 80 7f 7f 80 7f 80 7f 7f 7f 7f 80 7f 80 7f : ................
13230 : __ __ __ BYT 7f 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 7f 80 : ................
13240 : __ __ __ BYT 7f 80 7f 80 7f 7f 80 7f 7f 7f 7f 7f 7f 80 7f 80 : ................
13250 : __ __ __ BYT 7f 80 80 7f 80 7f 80 7f 80 80 80 80 80 80 7f 80 : ................
13260 : __ __ __ BYT 7f 80 80 80 80 80 80 80 7f 80 80 80 80 80 7f 80 : ................
13270 : __ __ __ BYT 7f 80 7f 80 80 80 80 7f 80 80 80 7f 80 80 80 80 : ................
13280 : __ __ __ BYT 80 80 80 80 7f 80 7f 80 7f 80 7f 7f 80 7f 80 7f : ................
13290 : __ __ __ BYT 80 7f 7f 80 7f 80 7f 7f 80 7f 80 7f 80 7f 80 7f : ................
132a0 : __ __ __ BYT 80 80 7f 80 7f 80 7f 80 80 7f 80 7f 7f 7f 7f 7f : ................
132b0 : __ __ __ BYT 7f 7f 80 7f 80 7f 80 7f 7f 80 80 80 80 80 7f 80 : ................
132c0 : __ __ __ BYT 7f 80 7f 7f 80 7f 80 80 80 80 80 80 80 7f 7f 7f : ................
132d0 : __ __ __ BYT 7f 7f 7f 7f 80 7f 80 7f 80 80 80 80 7f 80 7f 80 : ................
132e0 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 7f 80 7f 80 80 80 80 : ................
132f0 : __ __ __ BYT 80 80 80 80 7f 80 80 80 80 80 7f 80 7f 80 80 7f : ................
13300 : __ __ __ BYT 80 7f 80 80 80 80 80 80 80 80 7f 80 7f 80 7f 80 : ................
13310 : __ __ __ BYT 80 80 80 80 80 80 80 80 7f 7f 80 7f 80 7f 80 80 : ................
13320 : __ __ __ BYT 7f 80 7f 80 7f 80 80 7f 80 7f 7f 80 7f 7f 80 7f : ................
13330 : __ __ __ BYT 80 7f 80 7f 7f 80 7f 7f 7f 7f 80 7f 80 7f 80 7f : ................
13340 : __ __ __ BYT 80 7f 7f 7f 7f 7f 7f 80 7f 80 80 7f 80 7f 7f 80 : ................
13350 : __ __ __ BYT 80 7f 7f 7f 80 7f 80 7f 80 80 7f 7f 7f 80 7f 80 : ................
13360 : __ __ __ BYT 7f 80 7f 7f 7f 7f 80 7f 80 80 7f 80 7f 80 7f 80 : ................
13370 : __ __ __ BYT 7f 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f : ................
13380 : __ __ __ BYT 80 80 80 7f 80 7f 80 7f 80 80 80 80 80 80 80 80 : ................
13390 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 80 80 7f 80 7f 80 : ................
133a0 : __ __ __ BYT 80 80 80 80 7f 80 7f 80 80 80 80 7f 80 7f 80 7f : ................
133b0 : __ __ __ BYT 80 80 80 7f 80 80 80 80 80 7f 80 7f 80 7f 80 7f : ................
133c0 : __ __ __ BYT 80 7f 7f 80 7f 80 7f 7f 7f 7f 80 7f 80 7f 7f 7f : ................
133d0 : __ __ __ BYT 7f 7f 7f 7f 80 7f 80 7f 80 7f 7f 80 7f 7f 7f 7f : ................
133e0 : __ __ __ BYT 7f 7f 7f 80 7f 7f 7f 7f 7f 7f 7f 80 7f 80 7f 80 : ................
133f0 : __ __ __ BYT 7f 80 80 80 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f : ................
13400 : __ __ __ BYT 7f 80 7f 80 7f 7f 80 7f 80 80 7f 80 80 80 80 80 : ................
13410 : __ __ __ BYT 7f 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 : ................
13420 : __ __ __ BYT 80 80 7f 80 80 80 80 80 80 7f 80 80 80 80 7f 80 : ................
13430 : __ __ __ BYT 80 80 7f 80 80 80 80 80 80 80 80 80 80 80 80 80 : ................
13440 : __ __ __ BYT 80 80 7f 80 7f 80 7f 80 7f 80 80 7f 80 7f 80 7f : ................
13450 : __ __ __ BYT 80 7f 80 7f 7f 7f 80 7f 80 80 80 80 80 7f 80 7f : ................
13460 : __ __ __ BYT 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f : ................
13470 : __ __ __ BYT 80 7f 7f 80 80 7f 7f 80 7f 80 7f 80 80 7f 80 7f : ................
13480 : __ __ __ BYT 80 7f 80 7f 80 80 7f 80 7f 80 7f 7f 80 7f 80 7f : ................
13490 : __ __ __ BYT 80 7f 80 7f 80 7f 7f 80 7f 80 7f 80 7f 80 7f 80 : ................
134a0 : __ __ __ BYT 7f 80 7f 80 80 80 7f 80 80 80 80 80 80 80 80 80 : ................
134b0 : __ __ __ BYT 80 80 80 80 80 7f 80 7f 80 80 7f 80 7f 80 80 80 : ................
134c0 : __ __ __ BYT 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 : ................
134d0 : __ __ __ BYT 7f 80 80 7f 80 7f 80 7f 80 7f 80 7f 80 80 80 7f : ................
134e0 : __ __ __ BYT 80 7f 80 7f 80 80 7f 80 7f 80 7f 80 80 7f 80 7f : ................
134f0 : __ __ __ BYT 80 7f 7f 7f 7f 80 7f 80 7f 7f 80 7f 80 7f 80 7f : ................
13500 : __ __ __ BYT 80 7f 7f 80 7f 80 7f 80 80 7f 80 7f 80 7f 80 7f : ................
13510 : __ __ __ BYT 80 7f 80 7f 80 80 80 80 7f 80 80 80 7f 80 7f 80 : ................
13520 : __ __ __ BYT 7f 80 80 7f 80 80 80 80 80 80 80 7f 80 7f 80 80 : ................
13530 : __ __ __ BYT 80 7f 80 7f 80 80 80 7f 80 7f 80 7f 80 80 7f 80 : ................
13540 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 7f 80 7f 80 7f 80 : ................
13550 : __ __ __ BYT 7f 80 7f 7f 80 7f 80 7f 80 80 7f 80 7f 80 7f 80 : ................
13560 : __ __ __ BYT 80 7f 80 7f 80 7f 80 80 7f 80 80 80 7f 80 7f 80 : ................
13570 : __ __ __ BYT 80 7f 80 7f 80 7f 80 80 7f 80 80 7f 80 7f 80 7f : ................
13580 : __ __ __ BYT 80 7f 80 7f 80 7f 80 7f 80 80 80 80 80 80 7f 80 : ................
13590 : __ __ __ BYT 7f 80 7f 80 80 7f 80 7f 80 7f 80 7f 80 80 7f 80 : ................
135a0 : __ __ __ BYT 7f 80 7f 80 80 7f 80 80 80 80 7f 80 7f 7f 80 7f : ................
135b0 : __ __ __ BYT 7f 80 7f 80 80 7f 80 80 7f 80 7f 80 7f 80 7f 80 : ................
135c0 : __ __ __ BYT 7f 80 7f 80 7f 80 7f 80 80 7f 80 80 7f 80 80 7f : ................
135d0 : __ __ __ BYT 80 7f 7f 80 7f 80 7f 80 7f 80 80 80 7f 80 7f 80 : ................
135e0 : __ __ __ BYT 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 80 80 : ................
135f0 : __ __ __ BYT 7f 80 7f 80 7f 80 7f 80 7f 80 80 80 80 80 80 80 : ................
13600 : __ __ __ BYT 80 80 80 7f 80 80 7f 80 7f 80 80 80 80 80 80 80 : ................
13610 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 : ................
13620 : __ __ __ BYT 80 80 7f 80 7f 80 7f 7f 80 7f 80 7f 80 7f 80 80 : ................
13630 : __ __ __ BYT 7f 80 7f 80 7f 80 7f 80 7f 80 80 7f 80 7f 80 7f : ................
13640 : __ __ __ BYT 80 7f 7f 80 80 7f 80 7f 7f 80 7f 80 7f 80 80 80 : ................
13650 : __ __ __ BYT 80 80 80 80 80 7f 80 7f 80 80 7f 80 80 7f 80 7f : ................
13660 : __ __ __ BYT 80 80 7f 80 7f 80 7f 80 80 7f 80 80 7f 80 7f 80 : ................
13670 : __ __ __ BYT 80 80 80 80 80 80 80 80 7f 80 7f 80 7f 80 7f 80 : ................
13680 : __ __ __ BYT 7f 80 80 80 80 80 7f 80 7f 80 80 80 7f 80 7f 80 : ................
13690 : __ __ __ BYT 7f 80 80 7f 80 80 80 80 80 7f 80 7f 80 7f 80 80 : ................
136a0 : __ __ __ BYT 7f 80 80 80 80 7f 80 7f 80 80 7f 80 7f 80 80 7f : ................
136b0 : __ __ __ BYT 80 80 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 80 : ................
136c0 : __ __ __ BYT 7f 80 7f 80 7f 7f 80 80 7f 80 7f 80 7f 7f 7f 80 : ................
136d0 : __ __ __ BYT 7f 80 7f 80 80 7f 80 7f 80 7f 80 7f 80 80 7f 80 : ................
136e0 : __ __ __ BYT 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 80 7f 80 80 : ................
136f0 : __ __ __ BYT 7f 80 7f 80 80 80 80 80 80 7f 80 7f 80 7f 80 80 : ................
13700 : __ __ __ BYT 7f 80 80 80 7f 80 7f 80 7f 80 7f 80 80 7f 80 7f : ................
13710 : __ __ __ BYT 80 7f 80 80 7f 80 7f 80 80 80 80 7f 80 7f 80 80 : ................
13720 : __ __ __ BYT 7f 80 7f 80 80 80 80 80 7f 80 80 7f 80 7f 80 7f : ................
13730 : __ __ __ BYT 80 80 7f 80 7f 80 7f 80 80 80 7f 80 7f 80 80 7f : ................
13740 : __ __ __ BYT 80 7f 80 80 7f 80 80 80 7f 80 7f 80 7f 7f 80 7f : ................
13750 : __ __ __ BYT 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 80 7f : ................
13760 : __ __ __ BYT 80 7f 80 7f 80 7f 80 7f 80 80 7f 80 80 7f 80 7f : ................
13770 : __ __ __ BYT 80 80 7f 80 7f 80 7f 80 7f 80 80 80 80 80 7f 80 : ................
13780 : __ __ __ BYT 7f 80 7f 80 7f 80 7f 80 80 7f 80 80 7f 80 80 7f : ................
13790 : __ __ __ BYT 80 7f 80 7f 80 80 7f 80 7f 80 7f 80 7f 80 7f 80 : ................
137a0 : __ __ __ BYT 7f 80 80 7f 80 7f 80 7f 80 7f 80 80 80 80 7f 80 : ................
137b0 : __ __ __ BYT 7f 80 80 80 80 7f 80 7f 80 7f 80 7f 80 7f 80 80 : ................
137c0 : __ __ __ BYT 7f 80 7f 80 80 80 7f 80 7f 80 7f 80 80 80 80 7f : ................
137d0 : __ __ __ BYT 80 80 80 7f 80 80 7f 80 7f 80 7f 80 7f 80 80 80 : ................
137e0 : __ __ __ BYT 80 7f 80 7f 80 7f 80 80 80 7f 80 80 7f 80 7f 80 : ................
137f0 : __ __ __ BYT 80 80 7f 80 7f 80 7f 80 80 7f 80 80 7f 80 7f 80 : ................
13800 : __ __ __ BYT 7f 80 80 7f 80 80 7f 80 7f 80 7f 80 80 7f 80 7f : ................
13810 : __ __ __ BYT 80 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 : ................
13820 : __ __ __ BYT 7f 80 7f 80 80 7f 80 7f 80 80 7f 80 80 7f 80 7f : ................
13830 : __ __ __ BYT 80 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 : ................
13840 : __ __ __ BYT 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 80 : ................
13850 : __ __ __ BYT 7f 80 7f 80 7f 80 7f 7f 80 7f 7f 80 7f 80 7f 80 : ................
13860 : __ __ __ BYT 7f 80 80 80 80 80 7f 80 80 7f 80 7f 80 80 80 80 : ................
13870 : __ __ __ BYT 80 7f 80 7f 80 7f 80 80 7f 80 7f 80 80 7f 80 80 : ................
13880 : __ __ __ BYT 7f 80 80 7f 80 7f 80 80 7f 80 80 7f 80 7f 80 80 : ................
13890 : __ __ __ BYT 7f 80 80 7f 80 7f 80 80 80 80 80 80 7f 80 7f 80 : ................
138a0 : __ __ __ BYT 7f 80 80 80 80 80 80 80 80 7f 80 80 7f 80 80 7f : ................
138b0 : __ __ __ BYT 80 7f 80 7f 80 7f 7f 80 7f 80 80 80 80 7f 80 80 : ................
138c0 : __ __ __ BYT 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 : ................
138d0 : __ __ __ BYT 80 7f 80 7f 80 7f 80 7f 80 80 80 80 80 7f 80 80 : ................
138e0 : __ __ __ BYT 7f 80 7f 80 80 7f 80 7f 7f 80 7f 80 7f 80 80 80 : ................
138f0 : __ __ __ BYT 80 7f 80 80 80 80 80 7f 80 7f 80 80 7f 80 7f 80 : ................
13900 : __ __ __ BYT 7f 80 7f 80 7f 80 7f 80 80 80 80 7f 80 7f 80 80 : ................
13910 : __ __ __ BYT 7f 80 7f 80 7f 80 80 7f 80 80 7f 80 80 7f 80 7f : ................
13920 : __ __ __ BYT 80 7f 80 7f 80 7f 80 80 7f 80 7f 80 7f 80 7f 80 : ................
13930 : __ __ __ BYT 80 7f 80 7f 80 7f 80 7f 80 80 7f 80 7f 80 7f 80 : ................
13940 : __ __ __ BYT 80 80 7f 80 7f 80 7f 80 80 7f 80 7f 80 7f 80 80 : ................
13950 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 80 7f 80 7f 80 7f : ................
13960 : __ __ __ BYT 80 7f 80 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 : ................
13970 : __ __ __ BYT 7f 80 7f 80 80 80 7f 80 7f 80 7f 80 7f 80 7f 80 : ................
13980 : __ __ __ BYT 7f 80 7f 80 80 7f 80 7f 80 80 7f 80 7f 80 7f 80 : ................
13990 : __ __ __ BYT 80 7f 80 7f 80 7f 80 80 80 80 80 80 80 80 80 80 : ................
139a0 : __ __ __ BYT 7f 80 7f 80 7f 7f 80 7f 80 7f 80 80 7f 80 80 7f : ................
139b0 : __ __ __ BYT 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 80 7f 80 : ................
139c0 : __ __ __ BYT 7f 80 7f 80 7f 80 7f 80 80 7f 80 80 7f 80 7f 80 : ................
139d0 : __ __ __ BYT 7f 80 80 80 80 7f 80 7f 80 80 7f 80 7f 80 7f 80 : ................
139e0 : __ __ __ BYT 7f 80 80 7f 80 7f 80 7f 80 7f 80 80 7f 80 7f 80 : ................
139f0 : __ __ __ BYT 80 7f 80 80 7f 80 7f 80 7f 80 7f 80 80 7f 80 7f : ................
13a00 : __ __ __ BYT 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f       : ..............
--------------------------------------------------------------------
bong_sfx:
20000 : __ __ __ BYT 52 49 46 46 46 2d 00 00 57 41 56 45 66 6d 74 20 : RIFFF-..WAVEfmt 
20010 : __ __ __ BYT 10 00 00 00 01 00 01 00 22 56 00 00 22 56 00 00 : ........"V.."V..
20020 : __ __ __ BYT 01 00 08 00 64 61 74 61 22 2d 00 00 80 7f 7f 7f : ....data"-......
20030 : __ __ __ BYT 80 7f 80 7f 80 7f 80 80 7f 7f 7f 7f 80 80 80 80 : ................
20040 : __ __ __ BYT 80 80 80 80 7f 7f 7f 7f 80 80 80 80 80 80 80 7f : ................
20050 : __ __ __ BYT 7f 7f 7f 80 80 7f 7f 7f 7f 7f 80 7f 80 7f 7f 7f : ................
20060 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
20070 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 80 80 7f 7f 80 80 80 : ................
20080 : __ __ __ BYT 7f 7f 80 80 80 80 80 80 80 80 80 80 80 80 80 80 : ................
20090 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 7f 7f 7f 7f 7f 7f 7f : ................
200a0 : __ __ __ BYT 7f 7f 7f 7f 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e : ....~~~~~~~~~~~~
200b0 : __ __ __ BYT 7e 7e 7e 7e 7e 7e 7e 7e 7f 7f 7f 7f 7f 7f 80 80 : ~~~~~~~~........
200c0 : __ __ __ BYT 80 80 80 80 80 80 80 80 81 81 81 81 80 80 80 81 : ................
200d0 : __ __ __ BYT 81 81 81 80 80 80 80 80 80 7f 7f 7f 7f 80 7f 7f : ................
200e0 : __ __ __ BYT 7e 7e 7e 7e 7e 7e 7e 7d 7e 7d 7e 7e 7e 7e 7e 7e : ~~~~~~~}~}~~~~~~
200f0 : __ __ __ BYT 7e 7e 7d 7d 7d 7d 7e 7e 7e 7e 7e 7e 7d 7d 7d 7c : ~~}}}}~~~~~~}}}|
20100 : __ __ __ BYT 7c 7d 7f 81 83 83 80 7d 7d 83 90 9b a3 a5 9f 8f : |}.....}}.......
20110 : __ __ __ BYT 7a 66 59 53 52 61 7f 9e a8 98 82 71 63 68 69 5b : zfYSRa.....qchi[
20120 : __ __ __ BYT 53 55 6a 86 a1 af b2 a7 88 64 52 64 76 8c 9f 96 : SUj......dRdv...
20130 : __ __ __ BYT 95 95 99 9d 9f a2 a0 9f 9a 98 91 80 70 65 60 5b : ............pe`[
20140 : __ __ __ BYT 59 56 58 5c 5e 5c 5a 5e 62 66 69 6b 6e 72 76 7a : YVX\^\Z^bfiknrvz
20150 : __ __ __ BYT 7d 80 82 84 84 85 8a 8c 89 83 86 96 a2 ab af b1 : }...............
20160 : __ __ __ BYT b5 b7 b4 aa 93 85 8f 99 9f 98 8f 8c 85 83 82 80 : ................
20170 : __ __ __ BYT 7d 79 75 72 74 74 6c 59 47 39 36 3f 4b 58 5a 51 : }yurttlYG96?KXZQ
20180 : __ __ __ BYT 48 46 4b 51 57 5a 5d 60 65 6a 70 75 7a 80 85 89 : HFKQWZ]`ejpuz...
20190 : __ __ __ BYT 8d 92 96 99 9b 9b 99 96 93 94 9c ad bc be bd bd : ................
201a0 : __ __ __ BYT bc be be bd ba b5 b2 ac a8 a3 9e 98 92 8b 85 7f : ................
201b0 : __ __ __ BYT 7a 75 70 6c 67 63 5d 58 55 53 4e 44 3c 36 36 36 : zuplgc]XUSND<666
201c0 : __ __ __ BYT 38 3a 3d 42 47 4c 50 55 5b 61 67 6d 74 79 7e 82 : 8:=BGLPU[agmty~.
201d0 : __ __ __ BYT 87 8b 8d 8d 8d 8e 94 a1 ac b4 ba bc be bf c0 c1 : ................
201e0 : __ __ __ BYT c1 be bb b7 b1 ad a7 a2 9d 97 91 8b 85 80 7b 76 : ..............{v
201f0 : __ __ __ BYT 72 6c 67 63 61 5e 56 4e 46 3f 3c 3a 3b 3d 3f 43 : rlgca^VNF?<:;=?C
20200 : __ __ __ BYT 47 4c 50 55 5a 5f 64 6a 70 75 7b 81 86 8c 8e 90 : GLPUZ_djpu{.....
20210 : __ __ __ BYT 91 92 95 9b a4 a9 ad b3 b9 be c0 c0 bf bc bb b8 : ................
20220 : __ __ __ BYT b4 af aa a5 a0 9c 98 93 8d 89 85 82 80 7c 76 6b : .............|vk
20230 : __ __ __ BYT 5d 4f 46 43 41 3e 3d 3c 3d 3f 43 47 4b 4e 52 57 : ]OFCA>=<=?CGKNRW
20240 : __ __ __ BYT 5c 62 68 6d 72 76 7c 7e 7f 80 82 8b 9e ae b5 ba : \bhmrv|~........
20250 : __ __ __ BYT bd c1 c5 c6 c2 b6 ad ac b1 b2 ad a7 a1 9d 99 95 : ................
20260 : __ __ __ BYT 91 8c 86 82 7d 77 72 6c 68 62 59 50 4d 51 59 5d : ....}wrlhbYPMQY]
20270 : __ __ __ BYT 5e 5d 56 4f 4b 4c 51 56 58 58 5a 5e 63 69 70 74 : ^]VOKLQVXXZ^cipt
20280 : __ __ __ BYT 78 7e 83 88 8d 91 95 9a 9e a0 a2 a1 9e 99 97 9a : x~..............
20290 : __ __ __ BYT aa b7 be c5 c7 ce d0 c7 b7 a2 8d 81 83 8e 97 96 : ................
202a0 : __ __ __ BYT 91 8d 89 88 88 87 81 76 65 57 56 5b 60 60 5f 5e : .......veWV[``_^
202b0 : __ __ __ BYT 5e 5f 60 61 5f 59 54 4f 4b 47 45 48 4c 51 57 5a : ^_`a_YTOKGEHLQWZ
202c0 : __ __ __ BYT 5d 5e 5f 62 67 6b 70 75 7a 81 88 8e 93 98 9c 9f : ]^_bgkpuz.......
202d0 : __ __ __ BYT a2 a4 a6 a8 a8 a8 a6 a3 a2 a4 a5 a6 a6 a6 a6 a5 : ................
202e0 : __ __ __ BYT a1 99 91 8c 8b 8b 89 86 81 7e 7d 7e 80 82 82 82 : .........~}~....
202f0 : __ __ __ BYT 81 7f 7e 7e 7f 81 83 84 83 83 83 83 81 7d 7a 76 : ..~~.........}zv
20300 : __ __ __ BYT 74 75 7a 7d 7d 7d 7f 80 7f 7f 7e 7b 7a 79 78 77 : tuz}}}....~{zyxw
20310 : __ __ __ BYT 75 73 73 74 73 71 6f 6c 6a 67 65 65 63 62 62 60 : usstsqoljgeecbb`
20320 : __ __ __ BYT 5f 5f 5e 5f 61 62 63 63 64 65 67 6a 6e 70 70 70 : __^_abccdegjnppp
20330 : __ __ __ BYT 70 72 74 79 7d 81 83 86 88 8a 8e 94 9b a0 a5 aa : prty}...........
20340 : __ __ __ BYT ad af af ae ad ac aa aa ae b3 b9 bf bf ba b4 ac : ................
20350 : __ __ __ BYT a5 a1 a0 9e 9b 97 93 8f 8c 89 85 81 7e 7d 7c 79 : ............~}|y
20360 : __ __ __ BYT 77 74 72 70 6f 6d 6a 67 64 62 62 63 62 61 61 60 : wtrpomjgdbbcbaa`
20370 : __ __ __ BYT 60 60 60 60 60 5f 5e 5f 5f 60 61 61 62 63 63 63 : `````_^__`aabccc
20380 : __ __ __ BYT 64 65 67 6a 6a 69 6a 6a 6a 6a 6a 6a 6b 6d 6e 6e : degjjijjjjjjkmnn
20390 : __ __ __ BYT 6e 6f 6f 6f 6f 6f 70 71 72 74 77 7a 7c 7d 7e 80 : nooooopqrtwz|}~.
203a0 : __ __ __ BYT 82 85 87 89 89 8b 8f 91 95 97 97 99 9b 9e a1 a2 : ................
203b0 : __ __ __ BYT a3 a2 a2 a4 a6 a7 a6 a5 a5 a5 a6 a7 a9 aa a9 a7 : ................
203c0 : __ __ __ BYT a4 a2 a2 a0 9f 9e 9c 99 96 94 92 8f 8b 85 80 80 : ................
203d0 : __ __ __ BYT 87 8c 8a 88 85 80 7d 7a 74 6c 67 64 64 65 63 5f : ......}ztlgddec_
203e0 : __ __ __ BYT 5e 60 63 65 66 60 5b 55 52 50 4a 44 40 3c 3c 3b : ^`cef`[URPJD@<<;
203f0 : __ __ __ BYT 3c 3c 3d 3f 42 48 50 57 5d 62 68 6b 6f 72 77 7e : <<=?BHPW]bhkorw~
20400 : __ __ __ BYT 85 8b 90 93 95 97 98 99 9a 9a 9a 99 96 94 93 93 : ................
20410 : __ __ __ BYT 93 93 92 91 8f 8e 8d 8c 8a 89 89 89 8a 8b 8b 8b : ................
20420 : __ __ __ BYT 8a 88 88 87 88 8b 8d 91 93 95 98 98 99 98 98 97 : ................
20430 : __ __ __ BYT 95 94 95 95 95 95 93 92 92 91 91 91 90 8f 8e 8e : ................
20440 : __ __ __ BYT 8c 8d 8c 8c 8c 8b 8b 89 88 85 82 7d 79 76 73 74 : ...........}yvst
20450 : __ __ __ BYT 76 76 72 6d 69 68 6b 6d 6d 6c 6a 69 67 65 63 63 : vvrmihkmmljigecc
20460 : __ __ __ BYT 63 63 62 62 62 61 5e 5b 59 5a 5c 5d 5f 5f 5e 5c : ccbbba^[YZ\]__^\
20470 : __ __ __ BYT 5a 58 58 57 58 5a 5e 64 6a 6e 6c 68 64 63 67 6d : ZXXWXZ^djnlhdcgm
20480 : __ __ __ BYT 78 80 88 8c 8c 8a 86 89 91 9b a4 aa ac ac ae b0 : x...............
20490 : __ __ __ BYT b2 b3 b4 b4 b4 b3 b1 b1 af ab a8 a5 a3 a2 a0 9f : ................
204a0 : __ __ __ BYT 9c 99 94 8f 8a 85 83 81 82 82 82 83 84 86 87 86 : ................
204b0 : __ __ __ BYT 86 88 89 8a 8c 8d 8e 8e 8d 8d 8d 8c 8b 88 86 84 : ................
204c0 : __ __ __ BYT 83 81 80 7f 7e 80 80 81 80 7f 7c 79 77 75 73 6f : ....~.....|ywuso
204d0 : __ __ __ BYT 6a 67 65 64 63 61 60 60 5f 5f 5e 5d 5c 5b 58 57 : jgedca``__^]\[XW
204e0 : __ __ __ BYT 56 56 56 56 55 53 55 56 57 58 58 59 5a 5c 5f 5f : VVVVUSUVWXXYZ\__
204f0 : __ __ __ BYT 60 61 64 68 6d 72 76 7a 7e 82 88 8c 8d 91 94 98 : `adhmrvz~.......
20500 : __ __ __ BYT 9c 9e a0 a1 a2 a2 a2 a2 a4 a9 b1 bb c8 d1 d1 cf : ................
20510 : __ __ __ BYT cf d0 ce c2 bb b7 b1 ac a7 a2 9b 98 94 91 8e 8b : ................
20520 : __ __ __ BYT 8a 87 83 7f 7d 7b 79 77 74 71 6f 6f 6e 6e 6c 6b : ....}{ywtqoonnlk
20530 : __ __ __ BYT 69 68 66 65 64 62 62 62 64 66 66 66 64 63 64 66 : ihfedbbbdfffdcdf
20540 : __ __ __ BYT 67 68 67 67 66 66 65 64 62 60 60 5f 5f 5f 5e 5e : ghggffedb``___^^
20550 : __ __ __ BYT 5f 60 62 63 63 64 65 66 67 69 6c 6f 72 73 74 74 : _`bccdefgilorstt
20560 : __ __ __ BYT 73 73 76 7a 7c 7f 81 83 86 8a 8d 92 96 98 9a 9b : ssvz|...........
20570 : __ __ __ BYT 9d 9f a1 a4 a6 a7 a9 ab ad ae af b0 b1 b2 b2 b2 : ................
20580 : __ __ __ BYT b1 b0 af ae ad ac a9 a7 a3 a0 9d 99 96 92 8f 8c : ................
20590 : __ __ __ BYT 88 85 81 7d 79 76 74 71 6f 6c 68 63 61 61 62 62 : ...}yvtqolhcaabb
205a0 : __ __ __ BYT 63 63 62 62 62 62 60 5c 58 52 4d 49 49 49 4b 4e : ccbbbb`\XRMIIIKN
205b0 : __ __ __ BYT 51 53 54 56 58 5b 5d 5e 60 62 63 64 64 65 67 68 : QSTVX[]^`bcddegh
205c0 : __ __ __ BYT 69 6a 6c 6f 71 72 73 75 76 77 7a 7d 7d 7e 80 82 : ijloqrsuvwz}}~..
205d0 : __ __ __ BYT 85 89 8d 90 93 94 96 98 9a 9b 9c 9e a0 a3 a4 a5 : ................
205e0 : __ __ __ BYT a7 a9 ac ad af b2 b5 b8 b8 b8 b6 b6 b6 b7 b5 b3 : ................
205f0 : __ __ __ BYT b1 ad ab a9 a6 a3 a0 9d 9a 96 94 92 90 8d 86 81 : ................
20600 : __ __ __ BYT 7b 76 72 6f 6d 6b 6a 69 69 65 62 61 5f 5f 5c 58 : {vromkjiieba__\X
20610 : __ __ __ BYT 53 4e 4d 4a 49 48 46 47 48 4b 4e 52 55 57 58 57 : SNMJIHFGHKNRUWXW
20620 : __ __ __ BYT 54 51 51 52 54 56 59 5c 61 65 69 6b 6e 71 75 78 : TQQRTVY\aeiknqux
20630 : __ __ __ BYT 7b 7d 7e 7f 80 80 80 80 80 81 81 83 86 89 8c 8f : {}~.............
20640 : __ __ __ BYT 91 93 94 95 97 98 9a 9b 9b 9c 9c 9d 9e 9e a0 a1 : ................
20650 : __ __ __ BYT a1 a1 a2 a2 a3 a3 a4 a4 a4 a4 a5 a6 a6 a6 a6 a5 : ................
20660 : __ __ __ BYT a5 a5 a4 a2 a0 9e 9d 9a 96 94 92 8f 8c 89 84 7f : ................
20670 : __ __ __ BYT 7b 76 73 74 76 78 7a 7a 78 76 71 6e 6a 66 61 5d : {vstvxzzxvqnjfa]
20680 : __ __ __ BYT 5a 57 56 56 57 59 5b 5e 60 5f 5e 5a 54 4f 48 45 : ZWVVWY[^`_^ZTOHE
20690 : __ __ __ BYT 42 42 43 45 4b 50 57 5f 64 67 6b 6e 6f 70 73 74 : BBCEKPW_dgknopst
206a0 : __ __ __ BYT 76 79 7a 7e 82 86 8a 8c 8f 91 92 93 94 94 94 94 : vyz~............
206b0 : __ __ __ BYT 94 94 93 93 94 97 9b 9c 9f a0 a1 a2 a3 a3 a0 9e : ................
206c0 : __ __ __ BYT 9c 9a 9b 9b 9b 9d 9d 9d 9e 9e 9f 9f a1 a1 a1 a1 : ................
206d0 : __ __ __ BYT a0 9f 9e 9e 9e 9d 9c 9b 99 97 96 94 91 8f 8b 88 : ................
206e0 : __ __ __ BYT 83 7e 7b 78 77 77 76 76 76 75 76 76 74 73 71 6d : .~{xwwvvvuvvtsqm
206f0 : __ __ __ BYT 69 64 60 5a 55 52 4f 4e 50 51 51 52 53 54 56 57 : id`ZURONPQQRSTVW
20700 : __ __ __ BYT 58 56 51 4a 45 40 3d 40 43 48 4c 51 56 5a 5e 62 : XVQJE@=@CHLQVZ^b
20710 : __ __ __ BYT 65 68 6a 6c 70 75 7b 81 86 8b 8f 93 95 94 93 92 : ehjlpu{.........
20720 : __ __ __ BYT 92 94 95 98 9c a0 a5 a7 a9 ab ad b0 b3 b5 b7 b7 : ................
20730 : __ __ __ BYT b6 b5 b4 b3 b1 ad aa a7 a4 a2 9f 9d 9b 99 98 97 : ................
20740 : __ __ __ BYT 97 95 94 94 93 91 8f 8d 8b 89 85 81 7e 7a 79 79 : ............~zyy
20750 : __ __ __ BYT 7b 7d 7e 7e 7d 7c 7a 79 77 76 73 72 6f 6c 6a 68 : {}~~}|zywvsroljh
20760 : __ __ __ BYT 67 66 64 62 5f 5c 58 56 53 51 4e 4d 4e 50 52 53 : gfdb_\XVSQNMNPRS
20770 : __ __ __ BYT 53 53 53 52 50 4e 4d 4c 4c 4d 4f 52 56 5a 5f 64 : SSSRPNMLLMORVZ_d
20780 : __ __ __ BYT 68 6c 71 78 7e 83 89 8e 94 9a 9e a1 a4 a7 ab b0 : hlqx~...........
20790 : __ __ __ BYT b6 bc bf c2 c4 c5 c6 c6 c4 c1 bd b9 b6 b1 ad a9 : ................
207a0 : __ __ __ BYT a5 a1 9d 9b 9a 99 93 8b 83 7b 75 70 6d 68 62 5d : .........{upmhb]
207b0 : __ __ __ BYT 5c 5c 5f 64 6a 70 72 72 70 6e 70 73 74 73 6f 6c : \\_djprrpnpstsol
207c0 : __ __ __ BYT 6a 69 6a 6b 70 74 77 79 79 78 77 79 7b 7e 80 80 : jijkptwyyxwy{~..
207d0 : __ __ __ BYT 7e 7a 77 73 72 71 71 71 71 71 73 78 7b 7e 7e 7d : ~zwsrqqqqqsx{~~}
207e0 : __ __ __ BYT 7a 76 72 6e 6b 68 66 65 64 63 64 65 66 68 6a 6e : zvrnkhfedcdefhjn
207f0 : __ __ __ BYT 70 74 79 7c 7e 81 85 8c 93 9a 9f a2 a5 a7 aa ac : pty|~...........
20800 : __ __ __ BYT ac ab a9 a8 a8 a5 a4 a1 a2 a5 a8 ab ac ab a7 a4 : ................
20810 : __ __ __ BYT a2 9f 9a 94 8b 81 79 73 6d 68 65 64 63 64 65 64 : ......ysmhedcded
20820 : __ __ __ BYT 63 60 5c 58 54 51 4e 4d 4e 52 58 5b 60 65 6c 71 : c`\XTQNMNRX[`elq
20830 : __ __ __ BYT 73 73 72 74 76 75 75 75 7a 81 89 91 98 9e a2 a6 : ssrtvuuuz.......
20840 : __ __ __ BYT a7 a5 a2 9e 98 92 8c 87 84 84 84 84 84 86 88 8a : ................
20850 : __ __ __ BYT 8b 89 86 83 80 7e 7d 7d 7d 7d 7e 7f 80 81 83 85 : .....~}}}}~.....
20860 : __ __ __ BYT 85 86 86 87 88 88 88 85 83 81 81 84 88 8a 8d 8e : ................
20870 : __ __ __ BYT 8f 91 91 92 93 92 90 8c 85 7f 79 75 75 76 77 76 : ..........yuuvwv
20880 : __ __ __ BYT 75 74 72 70 6c 66 5f 5b 58 54 50 4d 4b 4b 4d 50 : utrplf_[XTPMKKMP
20890 : __ __ __ BYT 55 5d 66 6c 6d 6c 69 65 62 62 65 69 6d 71 75 7a : U]flmliebbeimquz
208a0 : __ __ __ BYT 81 8a 93 9b a0 a3 a1 9d 9e 9f 9f 9f 9d 9e a0 a1 : ................
208b0 : __ __ __ BYT a2 a1 9f 9e 9c 99 96 92 8e 8b 89 86 84 84 83 84 : ................
208c0 : __ __ __ BYT 84 85 85 85 87 88 89 89 8b 8c 8b 8b 8b 8a 89 86 : ................
208d0 : __ __ __ BYT 85 85 89 8e 90 92 94 96 98 9a 99 96 92 8d 89 83 : ................
208e0 : __ __ __ BYT 7e 77 72 6d 69 68 68 6a 6b 6a 68 66 63 60 5f 5d : ~wrmihhjkjhfc`_]
208f0 : __ __ __ BYT 5c 5b 5a 5a 5a 58 57 56 56 57 58 57 56 55 55 56 : \[ZZZXWVVWXWVUUV
20900 : __ __ __ BYT 57 5a 5c 5e 63 69 73 7c 84 8b 8e 8e 8c 8b 8c 8e : WZ\^cis|........
20910 : __ __ __ BYT 91 94 97 9a 9d a1 a4 a9 ae b1 b4 b3 b2 b1 af ae : ................
20920 : __ __ __ BYT ac aa a8 a3 9c 96 90 8d 8b 88 85 80 7c 79 76 74 : ............|yvt
20930 : __ __ __ BYT 73 71 6e 6d 6d 6e 70 72 73 76 79 79 7b 7e 7e 80 : sqnmmnprsvyy{~~.
20940 : __ __ __ BYT 82 84 85 85 85 84 83 83 85 88 8a 8a 88 87 87 88 : ................
20950 : __ __ __ BYT 8b 8d 8d 8d 8c 8b 89 89 88 86 83 80 7c 77 72 6e : ............|wrn
20960 : __ __ __ BYT 6b 68 65 64 62 61 5e 5c 59 55 51 4c 4a 4a 4a 4a : khedba^\YUQLJJJJ
20970 : __ __ __ BYT 4a 4b 4d 51 56 5c 62 68 6c 6f 72 74 77 7a 7b 7d : JKMQV\bhlortwz{}
20980 : __ __ __ BYT 7e 82 87 8d 94 9c a5 ab b0 b0 af ad ab ab aa ab : ~...............
20990 : __ __ __ BYT aa a9 a7 a7 a9 a9 ab ae b0 b2 b4 b4 b3 b1 ac a6 : ................
209a0 : __ __ __ BYT 9e 96 90 8b 87 84 7f 7a 75 70 6c 68 64 61 5f 5d : .......zuplhda_]
209b0 : __ __ __ BYT 5c 5c 5c 5d 5f 62 66 6a 6c 6f 70 72 73 73 74 74 : \\\]_bfjloprsstt
209c0 : __ __ __ BYT 74 75 76 77 79 7b 7d 80 82 84 84 84 84 85 85 85 : tuvwy{}.........
209d0 : __ __ __ BYT 83 80 7d 7a 78 77 76 75 73 72 72 71 71 6e 6a 66 : ..}zxwvusrrqqnjf
209e0 : __ __ __ BYT 62 61 60 60 62 64 66 67 68 6a 6b 6b 6d 6c 6d 6f : ba``bdfghjkkmlmo
209f0 : __ __ __ BYT 71 74 77 7a 7f 84 8b 91 97 9c a2 a8 ac ae ad ab : qtwz............
20a00 : __ __ __ BYT aa a7 a4 a4 a4 a5 a6 a6 a7 a7 a7 a8 a7 a7 a6 a4 : ................
20a10 : __ __ __ BYT a1 9f 9c 9a 98 97 97 97 95 93 8f 8c 89 85 81 7c : ...............|
20a20 : __ __ __ BYT 74 6e 66 61 5c 58 57 55 55 54 54 54 54 53 53 52 : tnfa\XWUUTTTTSSR
20a30 : __ __ __ BYT 51 50 4f 4e 4e 4e 4f 50 53 57 5c 63 68 6e 72 74 : QPONNNOPSW\chnrt
20a40 : __ __ __ BYT 77 7a 7e 82 86 89 8d 93 97 9b 9c 9b 99 96 95 92 : wz~.............
20a50 : __ __ __ BYT 91 91 92 94 96 97 97 96 94 92 90 8f 8d 8a 87 83 : ................
20a60 : __ __ __ BYT 80 7c 79 76 74 72 73 74 75 77 79 7b 7d 7f 80 81 : .|yvtrstuwy{}...
20a70 : __ __ __ BYT 83 84 84 84 85 8a 8f 94 99 9d a0 a0 9e 9b 98 94 : ................
20a80 : __ __ __ BYT 90 90 8e 8c 8b 88 88 89 8a 8a 88 85 82 7f 7c 79 : ..............|y
20a90 : __ __ __ BYT 75 71 6e 6c 6d 6d 6d 6c 6b 6a 6a 6a 69 68 67 67 : uqnlmmmlkjjjihgg
20aa0 : __ __ __ BYT 68 67 66 64 62 61 61 62 64 66 66 67 68 69 69 68 : hgfdbaabdffghiih
20ab0 : __ __ __ BYT 67 67 68 69 6d 70 75 7b 82 8b 92 98 9b 9d a0 a2 : gghimpu{........
20ac0 : __ __ __ BYT a4 a4 a4 a3 a0 9f 9e 9d 9d 9d 9e a0 a1 a2 a2 a1 : ................
20ad0 : __ __ __ BYT 9f 9d 9a 97 95 94 92 91 8f 8d 8a 89 89 8d 8f 8c : ................
20ae0 : __ __ __ BYT 89 86 84 82 81 80 7f 7c 79 78 74 72 70 6d 6b 6b : .......|yxtrpmkk
20af0 : __ __ __ BYT 6a 68 66 63 62 63 63 62 61 61 5f 5f 5f 61 61 63 : jhfcbccbaa___aac
20b00 : __ __ __ BYT 65 66 67 66 66 65 67 68 6a 6b 6b 6b 6a 68 64 62 : efgffeghjkkkjhdb
20b10 : __ __ __ BYT 62 62 65 68 6b 6e 71 74 77 7a 7d 7f 84 88 8a 8d : bbehknqtwz}.....
20b20 : __ __ __ BYT 90 94 99 9d a0 a1 a2 a2 a4 a5 a5 a6 a5 a5 a5 a3 : ................
20b30 : __ __ __ BYT a3 a2 a1 a1 a2 a3 a5 a7 a8 a7 a6 a4 a1 9f 9c 9a : ................
20b40 : __ __ __ BYT 98 95 93 90 8f 8d 8b 89 87 86 84 81 7e 7a 77 75 : ............~zwu
20b50 : __ __ __ BYT 73 72 71 6f 6e 6d 6c 6c 6d 6e 6f 70 6f 6d 6b 69 : srqonmllmnopomki
20b60 : __ __ __ BYT 68 66 65 65 64 64 64 64 65 64 64 63 60 5d 58 56 : hfeeddddeddc`]XV
20b70 : __ __ __ BYT 55 54 55 55 55 55 56 5a 60 65 69 6b 6b 6d 6e 6f : UTUUUUVZ`eikkmno
20b80 : __ __ __ BYT 71 73 75 77 77 79 7d 80 84 86 88 8b 8c 8e 91 93 : qsuwwy}.........
20b90 : __ __ __ BYT 95 98 9c 9f 9f a1 a3 a5 a6 a8 aa ab ac ad ac ac : ................
20ba0 : __ __ __ BYT aa a9 a9 a8 aa ac ac ac aa a8 a4 9f 9a 95 91 8e : ................
20bb0 : __ __ __ BYT 8b 87 82 7f 7d 7c 79 76 75 73 72 72 72 72 71 6e : ....}|yvusrrrrqn
20bc0 : __ __ __ BYT 6b 69 67 66 66 64 63 61 5e 5c 59 58 58 5b 5c 5d : kigffdca^\YXX[\]
20bd0 : __ __ __ BYT 5d 5d 5d 5d 5d 5e 60 62 64 66 6a 6c 6d 70 71 74 : ]]]]]^`bdfjlmpqt
20be0 : __ __ __ BYT 75 75 76 77 7a 7a 7a 7a 79 79 79 7b 7c 7e 7f 81 : uuvwzzzzyyy{|~..
20bf0 : __ __ __ BYT 82 84 86 87 88 89 8c 8f 90 92 93 95 98 97 96 96 : ................
20c00 : __ __ __ BYT 95 97 98 99 9b 9c 9d 9e 9f a0 9f 9e 9e 9d 9e 9e : ................
20c10 : __ __ __ BYT 9c 9a 98 98 9b 9f a2 a4 a5 a4 a3 a0 9d 9c 9a 96 : ................
20c20 : __ __ __ BYT 91 8a 83 7c 77 72 6f 6a 65 61 5d 5a 57 54 51 4d : ...|wrojea]ZWTQM
20c30 : __ __ __ BYT 4b 49 47 48 49 4c 50 55 56 56 56 57 59 5a 5c 5d : KIGHILPUVVVWYZ\]
20c40 : __ __ __ BYT 5d 5f 62 66 6a 6e 73 7a 81 88 8f 91 91 90 8f 90 : ]_bfjnsz........
20c50 : __ __ __ BYT 93 97 9b 9e 9f 9f 9e 9f a2 a4 a3 a2 a1 a1 a1 9d : ................
20c60 : __ __ __ BYT 98 90 88 82 7e 7c 78 74 71 71 72 73 73 74 78 7a : ....~|xtqqrsstxz
20c70 : __ __ __ BYT 7d 7e 7d 7f 82 86 89 88 86 89 8d 92 94 94 93 93 : }~}.............
20c80 : __ __ __ BYT 94 95 95 93 94 97 97 96 92 8e 8c 8a 88 85 7f 7a : ...............z
20c90 : __ __ __ BYT 78 74 70 6c 68 64 61 60 60 61 62 61 61 60 5e 5e : xtplhda``abaa`^^
20ca0 : __ __ __ BYT 5d 5a 56 54 53 54 58 5d 62 66 6a 6d 71 77 7d 82 : ]ZVTSTX]bfjmqw}.
20cb0 : __ __ __ BYT 86 8a 8c 8d 8e 90 92 95 98 9b 9d 9e 9e 9c 99 9a : ................
20cc0 : __ __ __ BYT 9e a3 a6 a7 a8 a8 ab ac aa a6 a3 a2 a2 9e 96 8d : ................
20cd0 : __ __ __ BYT 85 7f 7d 7b 79 79 79 79 78 77 77 76 73 6f 6a 64 : ..}{yyyyxwwvsojd
20ce0 : __ __ __ BYT 5f 5e 5e 5d 5e 5e 62 66 68 6b 6c 6d 6c 6a 67 66 : _^^]^^bfhklmljgf
20cf0 : __ __ __ BYT 67 69 6b 6e 71 73 74 76 7a 7d 7c 7a 78 79 7c 7f : giknqstvz}|zxy|.
20d00 : __ __ __ BYT 80 83 86 8c 93 97 99 97 93 8d 88 83 7f 7e 7d 7d : .............~}}
20d10 : __ __ __ BYT 7f 83 88 8c 8d 8d 8c 8b 89 88 86 85 85 84 84 86 : ................
20d20 : __ __ __ BYT 8a 8d 8f 8e 8c 8a 89 89 87 88 8a 8c 8d 8e 90 92 : ................
20d30 : __ __ __ BYT 94 94 93 93 92 91 8f 8e 8c 89 88 88 89 88 87 84 : ................
20d40 : __ __ __ BYT 80 7c 79 79 79 76 71 6b 63 5c 5a 58 59 58 56 54 : .|yyyvqkc\ZXYXVT
20d50 : __ __ __ BYT 53 56 59 5c 5e 5d 5d 5d 5d 5d 5d 5f 62 66 6a 70 : SVY\^]]]]]]_bfjp
20d60 : __ __ __ BYT 76 7a 7e 80 85 89 8b 8c 8e 90 94 97 9b a0 a5 a8 : vz~.............
20d70 : __ __ __ BYT a8 a8 a7 a6 a5 a2 9f 9c 9b 9b 9b 99 96 94 92 90 : ................
20d80 : __ __ __ BYT 8d 8a 87 83 7e 79 77 74 72 74 78 7c 7c 7d 7d 7d : ....~ywtrtx||}}}
20d90 : __ __ __ BYT 7d 7d 7c 79 75 71 70 72 77 7c 7e 7f 7e 7e 7d 7d : }}|yuqprw|~.~~}}
20da0 : __ __ __ BYT 7d 7d 7d 7d 7e 7e 7e 7d 7d 7f 7f 7d 7a 78 74 71 : }}}}~~~}}..}zxtq
20db0 : __ __ __ BYT 6e 6d 6b 6a 69 69 6a 6c 6f 6f 6d 6a 65 64 64 64 : nmkjiijloomjeddd
20dc0 : __ __ __ BYT 65 67 6a 6c 6e 70 73 77 7c 7f 81 83 85 86 87 89 : egjlnpsw|.......
20dd0 : __ __ __ BYT 8b 8c 8d 8d 8d 8f 90 92 94 95 96 96 97 99 9c a0 : ................
20de0 : __ __ __ BYT a3 a5 a6 a6 a6 a7 a8 a6 a2 9d 98 94 91 92 94 94 : ................
20df0 : __ __ __ BYT 92 90 8d 8c 8c 8c 8b 87 82 7d 77 72 70 6f 6f 6e : .........}wrpoon
20e00 : __ __ __ BYT 6a 67 66 66 67 68 65 61 5e 5b 59 59 5a 5d 5e 5e : jgffghea^[YYZ]^^
20e10 : __ __ __ BYT 5e 5e 5e 60 61 61 60 5f 5d 5d 61 65 69 6f 74 78 : ^^^`aa`_]]aeiotx
20e20 : __ __ __ BYT 7a 7d 7f 80 81 80 80 80 80 80 81 85 89 8d 91 91 : z}..............
20e30 : __ __ __ BYT 92 92 94 97 97 97 95 94 95 96 97 9a 9c a0 a3 a3 : ................
20e40 : __ __ __ BYT a2 a0 9d 9a 97 94 90 8d 8b 8c 8c 8d 8f 8f 90 90 : ................
20e50 : __ __ __ BYT 90 90 8d 89 84 82 82 81 81 80 7f 7d 7a 77 73 6f : ...........}zwso
20e60 : __ __ __ BYT 6a 63 5d 58 57 58 59 5c 5e 5f 5d 5a 58 57 56 53 : jc]XWXY\^_]ZXWVS
20e70 : __ __ __ BYT 4f 4f 52 57 5c 62 67 6e 73 75 76 78 7d 80 81 82 : OORW\bgnsuvx}...
20e80 : __ __ __ BYT 84 89 8e 96 9d a3 a6 a5 a4 a2 a1 a1 a0 9f 9f 9d : ................
20e90 : __ __ __ BYT 9a 97 96 97 97 96 94 92 91 8d 8a 86 82 7f 7c 7a : ..............|z
20ea0 : __ __ __ BYT 77 75 76 76 7a 7f 82 85 86 86 86 86 87 85 81 7c : wuvvz..........|
20eb0 : __ __ __ BYT 78 77 7a 7e 84 87 86 84 81 81 82 82 80 7c 7a 77 : xwz~.........|zw
20ec0 : __ __ __ BYT 76 75 76 78 77 75 72 6e 69 66 65 62 60 61 63 66 : vuvxwurnifeb`acf
20ed0 : __ __ __ BYT 6b 6e 72 75 75 73 72 73 72 71 71 71 72 75 79 7c : knruusrsrqqqruy|
20ee0 : __ __ __ BYT 80 84 88 8c 8e 8f 8f 8d 8d 8f 91 92 90 8f 8f 8e : ................
20ef0 : __ __ __ BYT 8e 8f 8e 8d 8e 8c 8c 8c 8e 90 92 92 90 8e 8c 89 : ................
20f00 : __ __ __ BYT 88 87 84 81 7d 79 77 76 77 77 76 74 73 75 77 79 : ....}ywvwwvtsuwy
20f10 : __ __ __ BYT 7c 7d 7d 7d 7e 7e 7e 7f 80 80 80 80 7f 7f 80 81 : |}}}~~~.........
20f20 : __ __ __ BYT 84 84 85 84 84 83 82 82 81 81 81 80 7f 7d 7c 7b : .............}|{
20f30 : __ __ __ BYT 7b 79 76 73 71 70 6f 71 73 76 78 79 7a 7b 7b 7b : {yvsqpoqsvxyz{{{
20f40 : __ __ __ BYT 7d 7d 7e 7f 7f 7f 7f 80 84 89 8e 92 96 98 97 96 : }}~.............
20f50 : __ __ __ BYT 97 99 9b 99 97 92 8e 8d 8e 8f 90 8f 8d 89 86 84 : ................
20f60 : __ __ __ BYT 84 84 84 82 7e 79 73 71 71 72 72 70 6e 6c 6d 6e : ....~ysqqrrpnlmn
20f70 : __ __ __ BYT 6e 6e 6f 6e 6c 6a 68 67 66 66 68 6a 6d 70 70 70 : nnonljhgffhjmppp
20f80 : __ __ __ BYT 71 73 75 75 73 71 71 75 7a 7d 80 83 87 8b 8e 8f : qsuusqquz}......
20f90 : __ __ __ BYT 8e 8d 8b 88 87 86 86 85 85 85 87 89 8a 8a 89 88 : ................
20fa0 : __ __ __ BYT 86 85 83 81 81 80 80 80 80 82 83 86 89 8b 8e 8f : ................
20fb0 : __ __ __ BYT 8f 8e 8d 8d 8d 8f 90 92 94 95 97 96 95 94 91 8f : ................
20fc0 : __ __ __ BYT 8c 88 85 81 7e 7d 7d 7c 7a 78 76 76 75 72 6d 69 : ....~}}|zxvvurmi
20fd0 : __ __ __ BYT 65 64 64 64 64 63 63 63 63 62 61 61 60 61 61 62 : eddddccccbaa`aab
20fe0 : __ __ __ BYT 64 66 69 6b 6d 6e 72 74 77 7a 7a 7b 7c 7e 82 87 : dfikmnrtwzz{|~..
20ff0 : __ __ __ BYT 8c 90 92 95 97 98 98 97 97 97 98 98 98 97 96 96 : ................
21000 : __ __ __ BYT 98 9b 9e a1 a1 9e 9b 97 94 91 8f 8c 8b 8a 8b 89 : ................
21010 : __ __ __ BYT 87 83 80 7d 7b 7b 7c 7c 79 77 75 73 75 76 75 74 : ...}{{||ywusuvut
21020 : __ __ __ BYT 72 73 75 76 74 72 70 6d 6b 6a 6a 6b 6d 6f 70 6f : rsuvtrpmkjjkmopo
21030 : __ __ __ BYT 6e 6e 6d 6c 6a 69 68 68 65 63 62 63 65 68 6b 6f : nnmljihhecbcehko
21040 : __ __ __ BYT 72 73 74 73 72 73 73 75 74 75 78 7a 7d 7e 80 84 : rstsrssutuxz}~..
21050 : __ __ __ BYT 88 8b 8d 8f 90 91 93 95 97 99 9b 9c 9d 9d 9d 9c : ................
21060 : __ __ __ BYT 9d 9c 9c 9d 9d 9d 9e 9f 9f 9f 9e 9d 9c 9c 9c 9c : ................
21070 : __ __ __ BYT 9c 99 95 92 8f 8e 8e 8e 8e 8d 8b 8a 89 87 85 82 : ................
21080 : __ __ __ BYT 7e 7b 78 75 71 6f 6f 6f 6e 6b 68 66 62 60 5d 5a : ~{xuqooonkhfb`]Z
21090 : __ __ __ BYT 59 59 57 57 56 54 54 56 58 59 58 57 54 51 4f 50 : YYWWVTTVXYXWTQOP
210a0 : __ __ __ BYT 51 53 56 58 5b 5f 63 68 6d 71 77 7c 7e 82 85 89 : QSVX[_chmqw|~...
210b0 : __ __ __ BYT 90 98 9e a4 a8 a8 aa ac ae b1 b2 b3 b1 ae ab a8 : ................
210c0 : __ __ __ BYT a5 a5 a4 a4 a4 a0 9c 98 93 91 8f 8d 8c 8b 89 88 : ................
210d0 : __ __ __ BYT 88 88 87 85 84 83 81 7f 7e 7c 7a 7a 7a 7b 7d 7d : ........~|zzz{}}
210e0 : __ __ __ BYT 7c 7c 7a 79 7a 7a 7a 79 79 79 79 78 76 76 73 72 : ||zyzzzyyyyxvvsr
210f0 : __ __ __ BYT 6f 6d 6c 6b 6a 67 66 66 66 64 62 61 5f 5d 5c 5c : omlkjgfffdba_]\\
21100 : __ __ __ BYT 5a 5a 58 55 55 55 57 5a 5c 5e 5f 61 64 68 6c 71 : ZZXUUUWZ\^_adhlq
21110 : __ __ __ BYT 76 7a 7e 80 83 89 8e 94 99 9c a0 a2 a4 a5 a7 aa : vz~.............
21120 : __ __ __ BYT ab ad af b0 b1 b3 b5 b7 ba bc be bd bc b8 b4 b0 : ................
21130 : __ __ __ BYT ad a9 a5 a1 9e 9b 97 92 8f 8c 88 84 81 7f 7d 79 : ..............}y
21140 : __ __ __ BYT 76 72 70 6d 6b 69 67 64 62 60 5e 5c 5a 59 58 58 : vrpmkigdb`^\ZYXX
21150 : __ __ __ BYT 59 5a 5d 5e 5e 5d 5d 5c 5c 5d 5d 5d 5c 5a 59 58 : YZ]^^]]\\]]]\ZYX
21160 : __ __ __ BYT 58 59 59 5a 5d 5e 61 64 66 6a 6d 70 73 76 79 7c : XYYZ]^adfjmpsvy|
21170 : __ __ __ BYT 80 82 85 88 8a 8c 8e 90 94 98 9c 9e a1 a1 a3 a4 : ................
21180 : __ __ __ BYT a5 a7 a8 ac ad ad ac a8 a5 a4 a4 a4 a4 a3 a1 9f : ................
21190 : __ __ __ BYT 9c 9b 9b 9b 9b 98 96 93 8f 8c 8a 87 84 81 7d 79 : ..............}y
211a0 : __ __ __ BYT 75 73 71 70 6f 6f 6e 6e 6e 6e 6e 6d 6b 69 66 63 : usqpoonnnnnmkifc
211b0 : __ __ __ BYT 61 5d 5a 5a 5b 5b 5c 5b 5a 5a 5c 5f 61 62 62 5f : a]ZZ[[\[ZZ\_abb_
211c0 : __ __ __ BYT 5e 60 61 63 65 65 67 68 69 6b 6e 72 75 78 7c 7f : ^`aceeghiknrux|.
211d0 : __ __ __ BYT 83 88 8c 91 95 98 99 9b 9d 9d 9e 9f a0 a1 a3 a4 : ................
211e0 : __ __ __ BYT a4 a5 a7 aa ac b0 b3 b4 b3 b0 ae ac aa a6 a0 9b : ................
211f0 : __ __ __ BYT 97 93 90 8c 88 85 84 83 83 83 83 7f 7a 76 72 6d : ............zvrm
21200 : __ __ __ BYT 66 5f 5c 59 58 58 59 5b 5d 5f 61 64 65 66 66 65 : f_\YXXY[]_adeffe
21210 : __ __ __ BYT 63 64 68 6c 71 75 79 7c 7e 7c 79 73 6f 6f 71 75 : cdhlquy|~|ysooqu
21220 : __ __ __ BYT 7b 7f 81 83 84 85 86 84 7e 78 71 6c 69 69 6a 6e : {.......~xqliijn
21230 : __ __ __ BYT 75 7b 81 85 87 88 86 86 87 89 89 88 87 8a 90 96 : u{..............
21240 : __ __ __ BYT 9d a0 a0 9e 9c 9c 9c 9d 9e 9e 9f a1 a2 a4 a4 a2 : ................
21250 : __ __ __ BYT 9f 9b 97 92 8d 89 85 81 7d 7a 7a 7b 79 76 71 6d : ........}zz{yvqm
21260 : __ __ __ BYT 67 61 5a 54 51 4e 4c 4c 4d 4f 52 54 57 5a 5e 62 : gaZTQNLLMORTWZ^b
21270 : __ __ __ BYT 63 66 67 69 6c 6e 71 75 77 7c 81 88 90 93 95 98 : cfgilnquw|......
21280 : __ __ __ BYT 9a 9d a0 a4 a5 a7 a9 ab ae af ae a8 a1 9a 93 8d : ................
21290 : __ __ __ BYT 86 80 7b 79 77 78 77 75 73 71 6f 6e 6d 6c 6a 69 : ..{ywxwusqonmlji
212a0 : __ __ __ BYT 67 68 6c 70 75 79 7f 86 8d 93 96 97 97 95 92 8f : ghlpuy..........
212b0 : __ __ __ BYT 8e 8e 8f 90 8f 8e 8c 8a 89 85 83 80 7c 79 76 74 : ............|yvt
212c0 : __ __ __ BYT 71 6f 6d 69 65 60 5b 57 54 52 50 4f 4f 50 52 56 : qomie`[WTRPOOPRV
212d0 : __ __ __ BYT 5b 60 65 69 6d 70 73 77 7a 7d 81 88 91 99 9f a4 : [`eimpswz}......
212e0 : __ __ __ BYT a8 ac af b2 b4 b5 b4 b4 b4 b4 b3 b1 af ac a7 a1 : ................
212f0 : __ __ __ BYT 9b 94 8c 84 7e 7a 78 77 75 71 6d 69 63 5e 59 55 : ....~zxwuqmic^YU
21300 : __ __ __ BYT 51 50 50 52 57 5f 67 6d 71 73 76 79 7b 7d 7e 80 : QPPRW_gmqsvy{}~.
21310 : __ __ __ BYT 81 83 85 86 88 88 88 87 85 85 85 82 7f 7c 7a 76 : .............|zv
21320 : __ __ __ BYT 72 70 6f 70 6f 6d 69 66 65 66 66 68 6a 6c 6f 71 : rpopomifeffhjloq
21330 : __ __ __ BYT 74 77 7b 7e 81 83 85 86 87 89 8f 96 9d a2 a5 a8 : tw{~............
21340 : __ __ __ BYT aa ad b1 b2 b1 af ad ac ac aa a8 a5 a1 9e 9b 97 : ................
21350 : __ __ __ BYT 90 88 7f 78 73 6e 6a 66 62 5f 5b 58 56 55 55 54 : ...xsnjfb_[XVUUT
21360 : __ __ __ BYT 53 52 51 50 51 56 5c 61 67 6d 71 76 7c 81 87 89 : SRQPQV\agmqv|...
21370 : __ __ __ BYT 89 88 88 8a 8d 90 94 98 99 99 97 95 92 8e 88 81 : ................
21380 : __ __ __ BYT 7d 7a 78 77 77 77 78 76 73 71 6e 6d 6d 6d 6e 70 : }zxwwwxvsqnmmmnp
21390 : __ __ __ BYT 73 77 7c 80 84 88 89 8a 8b 8b 8a 8b 8d 91 97 9e : sw|.............
213a0 : __ __ __ BYT a4 a7 a8 a9 a9 a8 a5 a1 9d 9b 98 96 94 91 8e 8b : ................
213b0 : __ __ __ BYT 86 82 7f 79 72 6a 63 5f 5c 59 58 59 59 59 58 55 : ...yrjc_\YXYYYXU
213c0 : __ __ __ BYT 53 52 51 52 54 56 5b 61 69 74 7c 81 85 88 8a 8c : SRQRTV[ait|.....
213d0 : __ __ __ BYT 8d 8b 8a 88 89 8b 8e 93 97 9b 9c 9d 9d 9a 98 93 : ................
213e0 : __ __ __ BYT 8f 8a 85 80 7e 7d 7c 7d 7c 7a 79 76 73 72 71 70 : ....~}|}|zyvsrqp
213f0 : __ __ __ BYT 70 72 74 77 7b 7f 84 88 8b 8b 8c 8c 8d 8f 90 92 : prtw{...........
21400 : __ __ __ BYT 94 98 9b 9f a0 a0 a0 9d 9b 96 90 87 80 7d 7b 7b : .............}{{
21410 : __ __ __ BYT 7c 7d 7c 79 77 72 6e 6a 64 5f 5a 57 57 58 5a 5e : |}|ywrnjd_ZWWXZ^
21420 : __ __ __ BYT 61 66 68 66 63 62 63 66 6a 6e 72 78 7e 86 8c 8f : afhfcbcfjnrx~...
21430 : __ __ __ BYT 90 8f 8e 8d 8d 8e 91 92 94 97 9a 9c 9d 9c 9a 97 : ................
21440 : __ __ __ BYT 92 8c 86 83 82 81 81 81 82 84 86 86 85 82 7f 7d : ...............}
21450 : __ __ __ BYT 7a 79 7b 7e 80 82 84 86 88 8a 8a 88 85 82 82 83 : zy{~............
21460 : __ __ __ BYT 85 87 89 89 89 88 86 82 7e 7b 77 73 6f 6f 6f 70 : ........~{wsooop
21470 : __ __ __ BYT 70 70 70 6e 6c 69 65 63 62 60 60 60 61 62 65 6a : pppnliecb```abej
21480 : __ __ __ BYT 6f 73 77 7b 7f 82 87 8b 8e 90 91 91 92 92 92 92 : osw{............
21490 : __ __ __ BYT 92 93 95 96 97 98 98 98 97 96 94 91 8f 8e 8b 89 : ................
214a0 : __ __ __ BYT 85 80 7c 78 75 74 74 73 72 71 72 74 76 77 75 73 : ..|xuttsrqrtvwus
214b0 : __ __ __ BYT 71 72 74 75 78 7b 7e 81 85 89 8d 90 92 91 90 8e : qrtux{~.........
214c0 : __ __ __ BYT 8c 8c 8b 89 85 7f 7a 75 73 73 73 72 72 74 75 75 : ......zusssrrtuu
214d0 : __ __ __ BYT 73 71 71 6f 6f 70 6f 70 72 73 75 79 7a 7d 7e 7f : sqqoopoprsuyz}~.
214e0 : __ __ __ BYT 81 83 86 8a 8d 90 94 97 98 99 99 97 94 91 8e 8d : ................
214f0 : __ __ __ BYT 8d 8d 8d 8d 8c 8b 86 81 7b 76 71 6d 6a 68 67 69 : ........{vqmjhgi
21500 : __ __ __ BYT 6b 6d 6e 6e 71 74 77 79 79 77 76 75 77 7a 7f 81 : kmnnqtwyywvuwz..
21510 : __ __ __ BYT 82 82 82 84 86 86 85 84 84 84 85 86 88 89 8b 8a : ................
21520 : __ __ __ BYT 88 86 83 81 7e 7c 7c 7b 7b 7a 79 79 77 76 73 71 : ....~||{{zyywvsq
21530 : __ __ __ BYT 6e 6d 6c 6d 70 73 76 79 7b 7d 80 83 86 87 88 88 : nmlmpsvy{}......
21540 : __ __ __ BYT 8a 8d 91 93 94 94 93 93 94 94 95 95 93 91 8d 8a : ................
21550 : __ __ __ BYT 89 89 89 86 85 84 83 83 81 7f 7d 79 75 70 6b 67 : ..........}yupkg
21560 : __ __ __ BYT 64 63 63 63 65 67 69 68 67 65 63 61 62 65 68 6c : dcccegihgecabehl
21570 : __ __ __ BYT 71 75 79 7d 80 83 83 83 83 82 83 85 88 8b 8e 90 : quy}............
21580 : __ __ __ BYT 92 92 93 93 94 94 91 8f 8c 89 89 88 87 86 86 86 : ................
21590 : __ __ __ BYT 85 84 82 80 7c 7b 7a 7a 7a 79 78 78 7a 7d 80 82 : ....|{zzzyxxz}..
215a0 : __ __ __ BYT 85 87 89 88 87 85 83 83 84 87 87 88 89 89 88 85 : ................
215b0 : __ __ __ BYT 83 80 7d 7a 79 77 76 78 79 7a 78 76 72 6f 6b 66 : ..}zywvxyzxvrokf
215c0 : __ __ __ BYT 62 60 5e 5e 5e 61 64 67 6a 6b 6d 6e 6f 70 70 72 : b`^^^adgjkmnoppr
215d0 : __ __ __ BYT 76 7a 7e 82 86 8a 8d 8f 90 91 93 96 9a 9d a1 a2 : vz~.............
215e0 : __ __ __ BYT a3 a3 a3 a3 a3 a2 9f 9c 98 95 93 92 90 8d 89 85 : ................
215f0 : __ __ __ BYT 83 81 80 7d 7b 78 75 74 71 6e 6c 6a 69 6a 69 6a : ...}{xutqnljijij
21600 : __ __ __ BYT 6a 6b 6d 6e 72 74 76 77 79 7d 80 83 82 81 81 83 : jkmnrtvwy}......
21610 : __ __ __ BYT 84 85 84 83 82 81 82 81 81 82 82 81 80 7e 7c 7a : .............~|z
21620 : __ __ __ BYT 78 76 75 75 74 73 73 73 73 74 74 75 76 78 79 7a : xvuutssssttuvxyz
21630 : __ __ __ BYT 7d 7f 80 81 82 82 82 83 83 84 85 87 89 8b 8d 8f : }...............
21640 : __ __ __ BYT 90 90 8f 8e 8f 8f 8f 8f 8d 8c 8a 89 89 88 87 85 : ................
21650 : __ __ __ BYT 83 81 7f 7d 7b 7a 79 79 79 79 79 79 79 78 77 76 : ...}{zyyyyyyyxwv
21660 : __ __ __ BYT 76 76 76 77 77 78 7a 7c 7e 7f 81 82 84 84 84 84 : vvvwwxz|~.......
21670 : __ __ __ BYT 84 85 85 86 87 88 88 88 89 89 88 87 84 81 80 7e : ...............~
21680 : __ __ __ BYT 7d 7c 7a 7a 79 78 78 78 78 78 78 77 77 76 76 76 : }|zzyxxxxxxwwvvv
21690 : __ __ __ BYT 77 78 78 79 7b 7c 7d 7e 7e 7f 7f 7e 7f 7f 80 81 : wxxy{|}~~..~....
216a0 : __ __ __ BYT 82 84 84 84 84 83 83 83 82 82 82 82 82 82 82 82 : ................
216b0 : __ __ __ BYT 82 82 82 82 82 81 81 80 80 7f 7f 7f 80 80 81 81 : ................
216c0 : __ __ __ BYT 82 82 83 84 85 86 87 87 87 88 87 87 87 86 87 87 : ................
216d0 : __ __ __ BYT 85 85 86 86 85 84 84 83 83 81 80 80 7e 7d 7a 78 : ............~}zx
216e0 : __ __ __ BYT 76 74 72 70 6f 6e 6d 6d 6c 6d 6d 6d 6d 6d 6d 6d : vtrponmmlmmmmmmm
216f0 : __ __ __ BYT 6d 6d 6e 6f 70 72 74 76 79 7a 7d 7f 80 81 82 84 : mmnoprtvyz}.....
21700 : __ __ __ BYT 85 85 86 88 8a 8a 8c 8c 8c 8c 8c 8c 8d 8d 8d 8d : ................
21710 : __ __ __ BYT 8d 8d 8e 8e 8e 8d 8d 8b 89 88 86 84 83 82 82 82 : ................
21720 : __ __ __ BYT 81 82 82 81 80 7f 7e 7e 7d 7c 7c 7c 7c 7d 7e 7f : ......~~}||||}~.
21730 : __ __ __ BYT 7f 80 80 80 80 80 80 81 81 81 81 80 7f 7e 7d 7c : .............~}|
21740 : __ __ __ BYT 7a 79 76 75 73 73 72 72 72 72 72 71 70 6f 6d 6d : zyvussrrrrrqpomm
21750 : __ __ __ BYT 6b 6b 6b 6c 6d 6e 6f 71 72 75 77 78 7a 7b 7d 7e : kkklmnoqruwxz{}~
21760 : __ __ __ BYT 80 82 84 87 89 8b 8d 8f 90 92 93 93 93 93 94 93 : ................
21770 : __ __ __ BYT 92 90 8d 8b 8b 8a 89 8a 8a 8b 8b 8a 8b 8a 89 87 : ................
21780 : __ __ __ BYT 84 81 7f 7d 7d 7d 7d 7c 7c 7c 7c 7c 7d 7c 7c 7b : ...}}}}|||||}||{
21790 : __ __ __ BYT 7a 7a 7a 7c 7d 7d 7c 7a 7a 7a 7b 7b 7b 7a 79 79 : zzz|}}|zzz{{{zyy
217a0 : __ __ __ BYT 78 78 78 78 76 74 73 73 73 73 73 72 71 70 70 72 : xxxxvtsssssrqppr
217b0 : __ __ __ BYT 72 73 74 75 76 78 79 7b 7e 7f 80 81 82 85 85 87 : rstuvxy{~.......
217c0 : __ __ __ BYT 89 8a 8c 8e 90 92 94 96 97 97 97 97 97 95 94 93 : ................
217d0 : __ __ __ BYT 90 8f 8f 8f 8e 8c 89 87 85 84 83 82 80 7f 7e 7c : ..............~|
217e0 : __ __ __ BYT 7c 7a 79 78 75 74 73 72 72 72 72 72 72 71 71 6f : |zyxutsrrrrrrqqo
217f0 : __ __ __ BYT 70 70 6f 6e 6e 6f 71 72 74 74 73 73 73 75 76 77 : pponnoqrttsssuvw
21800 : __ __ __ BYT 78 79 79 79 7b 7c 7c 7d 7d 7d 7d 7e 7f 80 80 81 : xyyy{||}}}}~....
21810 : __ __ __ BYT 81 82 84 85 85 87 88 88 8a 8b 8d 8f 8f 90 92 94 : ................
21820 : __ __ __ BYT 96 97 98 97 97 96 96 96 95 95 94 92 91 90 8e 8c : ................
21830 : __ __ __ BYT 88 85 81 7e 7b 77 77 76 75 72 6e 6d 6c 6a 69 68 : ...~{wwvurnmljih
21840 : __ __ __ BYT 66 64 63 63 64 65 67 68 69 6b 6d 6e 71 72 73 75 : fdccdeghikmnqrsu
21850 : __ __ __ BYT 77 78 7a 7c 7e 7f 81 83 85 86 88 89 8a 8a 8b 8b : wxz|~...........
21860 : __ __ __ BYT 8b 8b 8b 8b 8b 8a 89 88 87 84 81 80 80 80 80 80 : ................
21870 : __ __ __ BYT 81 82 84 85 85 85 85 85 84 84 85 87 89 8b 8b 8c : ................
21880 : __ __ __ BYT 8c 8b 8c 8b 8a 88 85 83 82 82 82 82 82 81 80 7e : ...............~
21890 : __ __ __ BYT 7c 7a 76 73 72 71 72 72 73 73 72 71 71 70 6f 6d : |zvsrqrrssrqqpom
218a0 : __ __ __ BYT 6c 6c 6c 6e 71 73 76 78 7a 7d 7d 7d 7d 7d 7d 7d : lllnqsvxz}}}}}}}
218b0 : __ __ __ BYT 7e 80 82 85 89 8b 8c 8c 8b 89 88 88 89 8b 8d 91 : ~...............
218c0 : __ __ __ BYT 94 94 94 93 91 8f 8c 89 88 86 85 85 86 87 86 84 : ................
218d0 : __ __ __ BYT 81 7c 78 75 72 71 72 73 76 78 7a 7c 7c 7a 78 75 : .|xurqrsvxz||zxu
218e0 : __ __ __ BYT 72 71 71 74 75 78 7a 7a 79 77 76 76 76 76 76 78 : rqqtuxzzywvvvvvx
218f0 : __ __ __ BYT 7b 7e 81 84 85 84 82 80 80 7f 80 82 85 88 8a 8b : {~..............
21900 : __ __ __ BYT 8b 8b 8a 87 85 83 82 81 81 82 85 87 88 89 88 86 : ................
21910 : __ __ __ BYT 84 81 80 7f 7e 7f 81 81 81 81 80 81 81 82 81 7f : ....~...........
21920 : __ __ __ BYT 7f 7f 81 81 82 83 83 83 81 80 7f 7d 7c 7b 79 78 : ...........}|{yx
21930 : __ __ __ BYT 77 76 75 75 75 75 75 73 72 71 70 6f 70 71 73 74 : wvuuuuusrqpopqst
21940 : __ __ __ BYT 75 76 77 79 7b 7d 7e 7e 7e 7f 82 85 88 8b 8d 8e : uvwy{}~~~.......
21950 : __ __ __ BYT 8f 91 92 91 91 90 90 92 94 94 93 91 8f 8d 8c 8c : ................
21960 : __ __ __ BYT 8a 87 84 7f 7d 7d 7d 7c 7a 76 74 72 70 70 6f 70 : ....}}}|zvtrppop
21970 : __ __ __ BYT 71 71 73 75 77 78 78 76 75 75 76 79 7b 7e 7e 7f : qqsuwxxvuuvy{~~.
21980 : __ __ __ BYT 81 84 86 85 84 81 7f 7e 7e 7f 7f 7f 7e 7e 7e 7f : .......~~...~~~.
21990 : __ __ __ BYT 7e 7c 7a 79 79 7a 7b 7c 7c 7c 7c 7c 7d 7d 7e 7e : ~|zyyz{|||||}}~~
219a0 : __ __ __ BYT 7d 7e 7f 83 84 85 86 86 88 8c 8e 90 90 8e 8e 8d : }~..............
219b0 : __ __ __ BYT 8e 90 91 91 90 8e 8d 8c 8b 89 85 82 7d 7a 78 76 : ............}zxv
219c0 : __ __ __ BYT 75 73 71 70 6e 6d 6d 6a 69 67 67 68 69 6b 6c 6c : usqpnmmjigghikll
219d0 : __ __ __ BYT 6c 6d 6e 71 73 75 77 79 7c 7f 81 83 84 84 85 87 : lmnqsuwy|.......
219e0 : __ __ __ BYT 88 8a 8b 8b 8c 8b 8b 8b 8b 8b 8b 8b 8b 8a 88 87 : ................
219f0 : __ __ __ BYT 84 81 80 80 81 81 82 83 83 84 85 85 86 87 87 86 : ................
21a00 : __ __ __ BYT 86 88 88 89 89 88 87 85 84 83 82 82 82 82 82 81 : ................
21a10 : __ __ __ BYT 80 7d 7a 78 74 72 71 71 71 71 71 71 72 71 6f 6d : .}zxtrqqqqqqrqom
21a20 : __ __ __ BYT 6b 69 6a 6b 6d 6f 70 70 70 73 75 78 7b 7d 7f 81 : kijkmopppsux{}..
21a30 : __ __ __ BYT 84 85 85 85 85 84 85 85 86 87 89 8b 8c 8d 8e 8f : ................
21a40 : __ __ __ BYT 90 8e 8d 8d 8c 8a 8a 8b 8c 8d 8b 89 88 87 86 86 : ................
21a50 : __ __ __ BYT 85 85 86 85 85 85 84 82 80 7e 7c 7a 78 77 76 77 : .........~|zxwvw
21a60 : __ __ __ BYT 79 7a 7b 7a 79 78 76 74 72 71 71 70 70 70 70 70 : yz{zyxvtrqqppppp
21a70 : __ __ __ BYT 70 70 71 72 74 75 76 78 79 7c 7e 7f 80 80 80 80 : ppqrtuvxy|~.....
21a80 : __ __ __ BYT 80 81 82 84 86 88 8b 8d 8e 8e 8e 8d 8c 8c 8b 89 : ................
21a90 : __ __ __ BYT 88 88 89 88 88 88 87 86 85 85 85 86 85 85 86 86 : ................
21aa0 : __ __ __ BYT 86 84 80 7f 7e 7d 7e 7e 7f 7f 7f 7f 80 80 7f 7d : ....~}~~.......}
21ab0 : __ __ __ BYT 7b 79 77 76 74 73 72 72 71 71 72 73 73 73 73 74 : {ywvtsrrqqrsssst
21ac0 : __ __ __ BYT 75 75 76 78 7a 7c 7e 7f 7f 7f 80 81 84 87 89 8c : uuvxz|~.........
21ad0 : __ __ __ BYT 8f 90 91 91 90 8f 8c 8a 88 87 87 87 87 86 87 87 : ................
21ae0 : __ __ __ BYT 86 85 82 80 7e 7b 79 77 75 75 76 76 78 78 77 77 : ....~{ywuuvvxxww
21af0 : __ __ __ BYT 77 78 79 7a 7a 7b 7c 7d 7d 7d 7e 7e 7d 7d 7e 7e : wxyzz{|}}}~~}}~~
21b00 : __ __ __ BYT 80 83 84 86 86 86 85 84 82 81 7f 7d 7a 79 79 79 : ...........}zyyy
21b10 : __ __ __ BYT 79 7a 7a 7b 7d 7e 7f 7e 7d 7c 7d 7d 7d 7e 7e 7e : yzz{}~.~}|}}}~~~
21b20 : __ __ __ BYT 80 84 88 8b 8c 8c 8d 8c 8d 90 90 90 8f 8e 8c 8a : ................
21b30 : __ __ __ BYT 89 88 87 85 81 7e 7c 7b 7a 7b 7c 7b 7a 78 75 72 : .....~|{z{|{zxur
21b40 : __ __ __ BYT 70 6d 6a 69 68 69 6c 70 73 75 76 76 77 78 79 79 : pmjihilpsuvvwxyy
21b50 : __ __ __ BYT 78 79 7b 7f 82 85 88 89 89 89 8b 8b 89 89 87 85 : xy{.............
21b60 : __ __ __ BYT 85 86 86 85 84 82 81 80 7f 7f 7f 80 80 82 83 85 : ................
21b70 : __ __ __ BYT 85 84 83 81 7f 7e 7d 7d 7e 7f 81 84 86 88 8a 89 : .....~}}~.......
21b80 : __ __ __ BYT 89 88 87 87 85 84 81 80 80 7f 7f 7f 7e 7d 7c 7b : ............~}|{
21b90 : __ __ __ BYT 7b 79 78 76 75 73 72 71 6f 6e 6d 6c 6c 6c 6d 6d : {yxvusrqonmlllmm
21ba0 : __ __ __ BYT 6f 72 75 77 7b 7d 7e 7f 7f 7f 7f 80 80 83 85 88 : oruw{}~.........
21bb0 : __ __ __ BYT 8c 8e 91 91 92 91 8e 8c 89 87 86 85 84 82 82 81 : ................
21bc0 : __ __ __ BYT 81 81 81 80 81 82 81 82 83 83 83 81 81 80 7e 7e : ..............~~
21bd0 : __ __ __ BYT 7d 7e 7f 81 83 85 88 89 89 88 88 87 86 84 82 7f : }~..............
21be0 : __ __ __ BYT 7d 7b 79 79 79 7a 7a 79 79 79 79 77 76 74 72 70 : }{yyyzzyyyywvtrp
21bf0 : __ __ __ BYT 6e 6e 6d 6d 6d 6e 6f 71 73 75 77 7a 7c 7e 7f 80 : nnmmmnoqsuwz|~..
21c00 : __ __ __ BYT 81 82 83 85 85 85 86 88 89 8b 8c 8d 8f 8f 8f 8f : ................
21c10 : __ __ __ BYT 8f 8d 8b 89 87 85 84 83 82 81 81 81 81 80 7f 7e : ...............~
21c20 : __ __ __ BYT 7e 7c 7b 7a 7a 7a 7a 7b 7c 7d 7d 7e 7f 7f 80 81 : ~|{zzzz{|}}~....
21c30 : __ __ __ BYT 81 83 83 84 84 83 83 82 81 80 7f 7f 7e 7e 7d 7d : ............~~}}
21c40 : __ __ __ BYT 7d 7c 7b 7a 79 78 77 77 76 76 76 76 76 76 77 78 : }|{zyxwwvvvvvvwx
21c50 : __ __ __ BYT 79 7b 7b 7c 7e 7e 7f 80 80 82 82 83 84 85 86 87 : y{{|~~..........
21c60 : __ __ __ BYT 88 88 88 89 88 88 87 87 86 85 84 84 83 81 81 7f : ................
21c70 : __ __ __ BYT 7e 7e 7d 7e 7e 7e 7e 7e 7e 7d 7d 7d 7c 7c 7c 7c : ~~}~~~~~~}}}||||
21c80 : __ __ __ BYT 7c 7d 7e 7e 7e 7e 7f 7f 7f 80 80 81 81 81 82 82 : |}~~~~..........
21c90 : __ __ __ BYT 82 82 81 81 80 7f 80 7f 7f 7f 7f 7e 7e 7d 7c 7a : ...........~~}|z
21ca0 : __ __ __ BYT 79 79 78 77 76 76 76 77 78 79 79 7a 7c 7c 7d 7e : yyxwvvvwxyyz||}~
21cb0 : __ __ __ BYT 7f 80 81 84 85 87 88 88 89 88 87 87 86 87 87 87 : ................
21cc0 : __ __ __ BYT 88 88 87 85 83 81 80 7f 7d 7c 7b 7a 78 79 79 79 : ........}|{zxyyy
21cd0 : __ __ __ BYT 79 78 76 75 75 76 77 78 7c 7e 80 81 82 83 84 85 : yxvuuvwx|~......
21ce0 : __ __ __ BYT 84 84 84 85 85 86 86 86 88 89 8a 89 87 84 81 7e : ...............~
21cf0 : __ __ __ BYT 7d 7d 7e 7d 7d 7d 7d 7e 7c 7a 79 76 75 74 75 76 : }}~}}}}~|zyvutuv
21d00 : __ __ __ BYT 77 79 7a 7c 7c 7c 7c 7c 7b 7c 7f 82 85 88 8a 8a : wyz|||||{|......
21d10 : __ __ __ BYT 8a 89 88 86 85 83 82 82 83 83 83 82 80 7f 7c 7a : ..............|z
21d20 : __ __ __ BYT 78 76 76 75 74 74 75 76 76 75 76 76 77 79 7a 7d : xvvuttuvvuvvwyz}
21d30 : __ __ __ BYT 7f 81 83 85 86 86 88 89 88 89 89 8a 8c 8b 8a 8a : ................
21d40 : __ __ __ BYT 8a 89 89 87 85 83 81 7e 7c 7b 7a 79 79 79 7a 7a : .......~|{zyyyzz
21d50 : __ __ __ BYT 79 78 76 75 75 75 75 75 77 79 7a 7c 7e 7f 81 81 : yxvuuuuuwyz|~...
21d60 : __ __ __ BYT 82 82 83 84 86 87 88 87 85 85 84 84 84 83 84 83 : ................
21d70 : __ __ __ BYT 84 83 82 81 7f 7d 7a 78 76 75 75 75 76 77 78 78 : .....}zxvuuuvwxx
21d80 : __ __ __ BYT 79 7a 7b 7b 7c 7c 7e 80 81 83 85 88 8a 8b 8c 8c : yz{{||~.........
21d90 : __ __ __ BYT 8c 8c 8c 8d 8d 8d 8d 8c 8c 8a 88 85 84 83 80 7f : ................
21da0 : __ __ __ BYT 7e 7d 7c 7a 7a 7a 78 77 76 74 72 71 71 70 70 70 : ~}|zzzxwvtrqqppp
21db0 : __ __ __ BYT 72 72 73 74 76 78 7a 7a 7a 7c 7d 7f 81 82 83 83 : rrstvxzzz|}.....
21dc0 : __ __ __ BYT 83 85 86 87 88 88 88 87 87 86 83 81 7f 7f 80 80 : ................
21dd0 : __ __ __ BYT 80 80 80 7e 7d 7a 79 78 78 79 7a 7d 7f 80 80 80 : ...~}zyxxyz}....
21de0 : __ __ __ BYT 81 82 84 85 87 89 8b 8d 8f 8e 8d 8b 89 88 86 86 : ................
21df0 : __ __ __ BYT 85 84 85 84 83 82 80 7e 7c 7a 78 78 77 75 74 75 : .......~|zxxwutu
21e00 : __ __ __ BYT 75 74 75 75 74 73 72 72 72 73 74 75 77 78 79 7b : utuutsrrrstuwxy{
21e10 : __ __ __ BYT 7b 7c 7e 7f 82 83 85 87 87 88 87 87 87 87 87 86 : {|~.............
21e20 : __ __ __ BYT 86 85 85 84 84 83 81 80 80 7f 80 80 80 80 7e 7e : ..............~~
21e30 : __ __ __ BYT 7e 7e 7e 7e 7f 81 82 83 83 82 81 80 81 81 82 83 : ~~~~............
21e40 : __ __ __ BYT 85 87 88 87 87 84 82 82 81 81 82 81 81 80 7d 7b : ..............}{
21e50 : __ __ __ BYT 78 76 73 72 72 73 75 76 75 75 73 72 72 71 72 74 : xvsrrsuvuusrrqrt
21e60 : __ __ __ BYT 76 78 7b 7e 80 80 81 82 83 86 88 8a 8b 8c 8d 8d : vx{~............
21e70 : __ __ __ BYT 8f 8e 8d 8c 89 87 85 85 84 82 80 7d 7b 79 78 77 : ...........}{yxw
21e80 : __ __ __ BYT 75 73 72 72 73 75 78 7a 7d 7f 80 81 82 81 82 83 : usrrsuxz}.......
21e90 : __ __ __ BYT 85 86 87 88 89 89 89 89 89 87 85 83 80 7f 7e 7e : ..............~~
21ea0 : __ __ __ BYT 7d 7c 7b 7a 79 77 75 74 73 72 72 73 75 76 78 7a : }|{zywutsrrsuvxz
21eb0 : __ __ __ BYT 7a 7b 7c 7d 7e 7f 81 83 85 87 89 8b 8c 8d 8c 8c : z{|}~...........
21ec0 : __ __ __ BYT 8c 8b 8b 8a 89 89 88 87 85 83 81 7f 7e 7c 7a 7a : ............~|zz
21ed0 : __ __ __ BYT 7a 7a 79 78 76 73 73 73 73 74 75 78 79 7b 7d 7d : zzyxvsssstuxy{}}
21ee0 : __ __ __ BYT 7e 7e 80 81 82 84 85 85 85 84 84 83 83 83 82 81 : ~~..............
21ef0 : __ __ __ BYT 81 7f 7f 7d 7c 7b 7a 7a 7a 7a 7b 7e 7f 80 80 80 : ...}|{zzzz{~....
21f00 : __ __ __ BYT 80 80 80 7f 80 82 83 85 86 86 87 88 88 88 88 88 : ................
21f10 : __ __ __ BYT 89 89 88 88 85 84 81 7f 7f 7e 7d 7c 7c 7b 79 77 : .........~}||{yw
21f20 : __ __ __ BYT 76 75 75 75 75 74 74 75 76 76 76 77 78 7a 7c 7d : vuuuuttuvvvwxz|}
21f30 : __ __ __ BYT 7f 7f 7f 7f 7f 80 82 82 84 85 86 88 88 88 87 85 : ................
21f40 : __ __ __ BYT 85 86 85 85 83 81 80 7f 7f 7f 7f 7e 7d 7d 7f 80 : ...........~}}..
21f50 : __ __ __ BYT 81 82 81 81 80 80 80 81 82 84 85 86 88 87 85 84 : ................
21f60 : __ __ __ BYT 83 82 81 80 7f 7f 7f 7e 7d 7c 7a 79 77 76 75 75 : .......~}|zywvuu
21f70 : __ __ __ BYT 74 74 74 75 75 75 74 73 73 74 75 76 78 79 7b 7d : tttuuutsstuvxy{}
21f80 : __ __ __ BYT 7e 7f 80 82 84 86 88 89 89 8b 8b 8c 8d 8b 8a 89 : ~...............
21f90 : __ __ __ BYT 88 88 87 86 84 83 81 80 80 80 80 7f 7e 7e 7d 7e : ............~~}~
21fa0 : __ __ __ BYT 7d 7c 7c 7c 7d 7f 7f 80 80 80 80 7f 80 7f 80 80 : }|||}...........
21fb0 : __ __ __ BYT 81 83 84 82 81 7f 7d 7c 7a 7a 79 78 78 78 77 76 : ......}|zzyxxxwv
21fc0 : __ __ __ BYT 74 72 71 71 72 74 76 78 7b 7d 7d 7e 7e 7f 7f 81 : trqqrtvx{}}~~...
21fd0 : __ __ __ BYT 84 86 88 8a 8b 8b 8b 8a 8a 89 89 8a 8b 8c 8c 8a : ................
21fe0 : __ __ __ BYT 89 88 86 84 82 80 7e 7b 7a 7a 7a 78 77 76 76 77 : ......~{zzzxwvvw
21ff0 : __ __ __ BYT 76 76 77 78 78 78 79 7a 7c 7e 80 81 81 81 82 82 : vvwxxxyz|~......
22000 : __ __ __ BYT 81 81 81 81 81 82 83 83 82 81 7e 7d 7c 7a 79 79 : ..........~}|zyy
22010 : __ __ __ BYT 79 79 79 79 79 79 78 77 77 78 7a 7c 7e 80 82 85 : yyyyyyxwwxz|~...
22020 : __ __ __ BYT 86 87 87 88 8b 8b 8d 8d 8e 90 91 90 8f 8d 8a 87 : ................
22030 : __ __ __ BYT 85 83 82 80 7e 7c 7a 79 78 77 76 75 73 71 70 70 : ....~|zyxwvusqpp
22040 : __ __ __ BYT 70 70 71 73 76 78 79 7a 7b 7c 7b 7c 7e 7f 80 82 : ppqsvxyz{|{|~...
22050 : __ __ __ BYT 84 85 85 84 84 84 84 83 83 83 84 84 84 84 82 80 : ................
22060 : __ __ __ BYT 7f 7d 7c 7c 7d 7e 80 81 81 82 82 82 82 83 84 85 : .}||}~..........
22070 : __ __ __ BYT 86 86 85 86 87 88 88 87 86 84 82 81 80 80 80 7e : ...............~
22080 : __ __ __ BYT 7d 7c 7a 78 75 73 73 72 73 73 74 75 76 77 76 76 : }|zxussrsstuvwvv
22090 : __ __ __ BYT 76 76 77 79 7b 7d 7f 81 82 83 85 86 88 88 89 88 : vvwy{}..........
220a0 : __ __ __ BYT 88 88 88 87 86 84 83 82 81 81 82 82 81 80 7e 7e : ..............~~
220b0 : __ __ __ BYT 7d 7d 7e 7e 7e 7e 7f 7f 80 80 81 82 82 84 85 85 : }}~~~~..........
220c0 : __ __ __ BYT 86 85 85 84 85 84 84 84 83 84 82 81 7f 7e 7c 79 : .............~|y
220d0 : __ __ __ BYT 77 75 74 72 71 71 71 71 70 70 70 70 71 72 74 75 : wutrqqqqppppqrtu
220e0 : __ __ __ BYT 77 79 7c 7e 80 82 84 85 87 88 8a 8c 8d 8e 8f 90 : wy|~............
220f0 : __ __ __ BYT 90 8f 8e 8e 8d 8c 8b 89 88 86 84 82 81 7f 7e 7c : ..............~|
22100 : __ __ __ BYT 7a 79 78 76 76 77 78 78 79 7a 7a 7c 7d 7d 7e 7f : zyxvvwxxyzz|}}~.
22110 : __ __ __ BYT 81 82 84 86 86 87 87 87 87 86 85 83 82 81 81 80 : ................
22120 : __ __ __ BYT 7f 7d 7c 7a 78 75 73 72 71 70 71 71 70 70 70 71 : .}|zxusrqpqqpppq
22130 : __ __ __ BYT 71 72 73 74 76 79 7d 80 82 85 88 88 89 8b 8c 8d : qrstvy}.........
22140 : __ __ __ BYT 8e 8f 90 91 91 90 8e 8c 8b 89 87 85 84 82 80 7f : ................
22150 : __ __ __ BYT 7e 7c 79 77 76 75 75 76 76 76 76 75 75 75 76 77 : ~|ywvuuvvvvuuuvw
22160 : __ __ __ BYT 78 7a 7c 7e 80 81 81 82 83 85 86 86 87 88 88 89 : xz|~............
22170 : __ __ __ BYT 89 88 88 87 86 84 84 82 81 80 7e 7d 7c 79 78 77 : ..........~}|yxw
22180 : __ __ __ BYT 76 75 75 75 76 77 78 78 78 79 79 7a 7c 7d 7e 80 : vuuuvwxxxyyz|}~.
22190 : __ __ __ BYT 80 82 84 86 88 88 89 89 89 89 8a 89 89 87 85 83 : ................
221a0 : __ __ __ BYT 81 80 7f 7e 7d 7d 7c 7b 7b 7a 79 77 76 77 76 77 : ...~}}|{{zywvwvw
221b0 : __ __ __ BYT 77 79 79 7a 7c 7c 7e 7e 7e 7f 80 82 83 84 84 85 : wyyz||~~~.......
221c0 : __ __ __ BYT 85 85 87 86 85 85 85 85 85 86 86 85 85 83 81 80 : ................
221d0 : __ __ __ BYT 7f 7e 7d 7c 7c 7c 7c 7c 7c 7c 7c 7c 7b 7b 7b 7c : .~}|||||||||{{{|
221e0 : __ __ __ BYT 7d 7e 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 80 80 : }~..............
221f0 : __ __ __ BYT 80 7f 7e 7e 7d 7d 7d 7d 7d 7d 7e 7e 7f 80 80 80 : ..~~}}}}}}~~....
22200 : __ __ __ BYT 80 80 80 81 81 82 83 84 84 85 85 84 84 84 83 83 : ................
22210 : __ __ __ BYT 82 81 81 81 81 82 81 80 7f 7d 7c 7c 7c 7d 7d 7e : .........}|||}}~
22220 : __ __ __ BYT 7e 7e 7e 7d 7c 7c 7c 7d 7e 7e 7f 7f 80 80 81 80 : ~~~}|||}~~......
22230 : __ __ __ BYT 80 7f 7e 7e 7e 7f 80 7f 7f 7f 7e 7d 7d 7c 7a 7a : ..~~~.....~}}|zz
22240 : __ __ __ BYT 7b 7c 7d 7d 7d 7d 7d 7c 7b 7b 7b 7c 7d 7d 7e 7f : {|}}}}}|{{{|}}~.
22250 : __ __ __ BYT 80 80 81 82 82 83 84 84 84 85 86 86 87 87 88 87 : ................
22260 : __ __ __ BYT 87 87 86 85 85 84 84 83 81 80 7f 7e 7d 7c 7d 7c : ...........~}|}|
22270 : __ __ __ BYT 7c 7c 7b 7b 7a 7b 7b 7c 7d 7d 7d 7d 7d 7d 7d 7d : ||{{z{{|}}}}}}}}
22280 : __ __ __ BYT 7d 7d 7d 7e 7e 7e 7e 7e 7d 7d 7d 7c 7c 7c 7c 7d : }}}~~~~~}}}||||}
22290 : __ __ __ BYT 7d 7d 7e 7d 7d 7d 7d 7d 7e 7f 7f 80 80 80 80 80 : }}~}}}}}~.......
222a0 : __ __ __ BYT 80 80 80 80 81 82 83 84 84 84 84 83 82 81 81 81 : ................
222b0 : __ __ __ BYT 82 82 82 83 84 84 84 83 82 82 82 81 81 81 81 81 : ................
222c0 : __ __ __ BYT 81 80 7f 7e 7e 7d 7d 7d 7d 7d 7c 7b 7a 7a 7a 7a : ...~~}}}}}|{zzzz
222d0 : __ __ __ BYT 7a 7a 7a 7a 7a 7a 7a 7a 7a 7a 7a 7b 7a 7b 7a 7b : zzzzzzzzzzz{z{z{
222e0 : __ __ __ BYT 7a 7a 7b 7c 7c 7d 7f 7f 80 81 82 83 84 84 84 84 : zz{||}..........
222f0 : __ __ __ BYT 84 85 87 87 88 88 88 87 87 87 86 87 87 87 86 85 : ................
22300 : __ __ __ BYT 85 83 82 81 7f 7f 7e 7e 7d 7c 7c 7b 7a 79 78 77 : ......~~}||{zyxw
22310 : __ __ __ BYT 77 77 77 78 79 7a 7b 7c 7d 7d 7d 7d 7d 7e 80 81 : wwwxyz{|}}}}}~..
22320 : __ __ __ BYT 81 82 82 81 81 81 80 80 80 81 81 82 83 82 82 81 : ................
22330 : __ __ __ BYT 80 7f 7e 7e 7e 7d 7e 7e 7e 7e 7e 7e 7d 7d 7d 7d : ..~~~}~~~~~~}}}}
22340 : __ __ __ BYT 7d 7e 7f 80 80 81 81 81 81 81 80 80 81 81 81 82 : }~..............
22350 : __ __ __ BYT 82 82 82 81 80 7f 80 7f 7f 7f 7f 7f 7f 7f 7e 7d : ..............~}
22360 : __ __ __ BYT 7d 7c 7c 7a 7a 7c 7c 7c 7c 7c 7d 7d 7d 7e 7d 7e : }||zz|||||}}}~}~
22370 : __ __ __ BYT 7f 80 81 82 84 84 85 86 85 85 85 85 84 85 85 85 : ................
22380 : __ __ __ BYT 85 85 85 85 84 83 81 80 7f 7e 7d 7d 7c 7b 7a 7a : .........~}}|{zz
22390 : __ __ __ BYT 7a 79 78 78 78 78 78 7a 7a 7a 7c 7c 7c 7c 7c 7d : zyxxxxxzzz|||||}
223a0 : __ __ __ BYT 7d 7e 7f 7f 80 81 81 81 82 81 80 80 7f 80 80 81 : }~..............
223b0 : __ __ __ BYT 81 81 81 81 80 80 7f 7f 7e 7e 7f 7f 80 81 81 81 : ........~~......
223c0 : __ __ __ BYT 81 81 81 81 82 82 84 85 85 85 85 85 83 82 81 82 : ................
223d0 : __ __ __ BYT 82 82 82 82 82 81 80 7e 7d 7c 7b 7a 7a 79 79 7a : .......~}|{zzyyz
223e0 : __ __ __ BYT 7a 7a 7a 7a 7a 7a 79 7a 79 7a 7c 7d 7e 7e 7f 7f : zzzzzzyzyz|}~~..
223f0 : __ __ __ BYT 80 80 7f 80 81 81 82 83 83 83 82 81 81 7f 7f 7f : ................
22400 : __ __ __ BYT 7f 7f 7f 80 7f 80 80 80 80 80 80 80 80 80 81 82 : ................
22410 : __ __ __ BYT 82 83 83 83 83 82 82 82 82 82 81 81 81 81 80 80 : ................
22420 : __ __ __ BYT 7f 7e 7e 7d 7d 7c 7d 7d 7d 7c 7c 7c 7a 7a 79 79 : .~~}}|}}}|||zzyy
22430 : __ __ __ BYT 79 79 79 7a 7a 7a 7b 7c 7c 7d 7e 7e 7f 80 81 81 : yyyzzz{||}~~....
22440 : __ __ __ BYT 81 82 82 83 83 84 84 84 85 84 85 84 83 83 82 82 : ................
22450 : __ __ __ BYT 82 81 81 81 81 80 80 80 80 80 81 81 81 81 80 7f : ................
22460 : __ __ __ BYT 7f 7e 7e 7e 7f 80 80 81 81 81 80 7f 7f 7e 7d 7d : .~~~.........~}}
22470 : __ __ __ BYT 7d 7d 7d 7d 7e 7d 7e 7d 7d 7c 7c 7c 7c 7c 7c 7c : }}}}~}~}}|||||||
22480 : __ __ __ BYT 7c 7c 7c 7c 7c 7d 7d 7d 7e 7e 7e 7e 7e 7e 7f 7f : |||||}}}~~~~~~..
22490 : __ __ __ BYT 7f 80 7f 81 81 82 84 84 85 85 85 85 85 84 84 84 : ................
224a0 : __ __ __ BYT 83 82 82 82 82 81 81 80 7f 7f 7f 7e 7e 7e 7d 7d : ...........~~~}}
224b0 : __ __ __ BYT 7c 7c 7c 7c 7d 7d 7d 7e 7e 7e 7f 7e 7e 7e 7f 7f : ||||}}}~~~.~~~..
224c0 : __ __ __ BYT 7f 7f 7f 80 81 81 81 81 81 82 81 80 7f 7f 7f 7e : ...............~
224d0 : __ __ __ BYT 7e 7f 7f 7f 7f 7f 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e : ~.....~~~~~~~~~~
224e0 : __ __ __ BYT 7e 7e 7e 7e 7e 7e 7f 80 80 80 80 80 80 7f 7f 7f : ~~~~~~..........
224f0 : __ __ __ BYT 7f 80 7f 80 81 81 81 81 80 80 7f 7e 7e 7e 7d 7d : ...........~~~}}
22500 : __ __ __ BYT 7d 7d 7d 7e 7e 7e 7f 7f 80 7f 7f 7f 7f 7f 7f 7f : }}}~~~..........
22510 : __ __ __ BYT 7f 7f 7f 80 81 81 81 81 81 81 81 80 81 81 81 80 : ................
22520 : __ __ __ BYT 80 80 80 80 80 81 81 81 80 7f 7f 7f 7e 7e 7e 7d : ............~~~}
22530 : __ __ __ BYT 7d 7d 7e 7e 7e 7d 7e 7e 7d 7d 7d 7c 7d 7d 7d 7d : }}~~~}~~}}}|}}}}
22540 : __ __ __ BYT 7e 7e 7e 7f 7f 7f 7f 7f 7f 7f 7e 7e 7e 7f 7f 7f : ~~~.......~~~...
22550 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 80 80 81 81 81 81 80 80 81 80 : ................
22560 : __ __ __ BYT 81 81 81 81 82 83 82 82 82 80 80 80 80 80 81 81 : ................
22570 : __ __ __ BYT 82 82 81 81 80 7f 7f 7e 7d 7e 7e 7d 7d 7c 7c 7b : .......~}~~}}||{
22580 : __ __ __ BYT 7b 7b 7b 7c 7c 7d 7d 7d 7c 7c 7c 7c 7c 7e 7e 7f : {{{||}}}|||||~~.
22590 : __ __ __ BYT 80 80 81 81 80 80 80 80 80 81 81 81 81 81 81 81 : ................
225a0 : __ __ __ BYT 81 81 81 81 81 81 81 81 81 81 81 81 80 80 80 80 : ................
225b0 : __ __ __ BYT 80 81 80 80 80 7f 7f 7f 7e 7e 7e 7d 7e 7e 7f 7f : ........~~~}~~..
225c0 : __ __ __ BYT 7f 7f 7e 7d 7c 7c 7c 7c 7c 7c 7d 7d 7d 7d 7c 7d : ..~}||||||}}}}|}
225d0 : __ __ __ BYT 7c 7c 7c 7c 7d 7d 7d 7e 7e 7f 80 80 80 81 82 83 : ||||}}}~~.......
225e0 : __ __ __ BYT 83 84 84 83 82 81 81 82 82 82 83 84 85 84 83 82 : ................
225f0 : __ __ __ BYT 80 80 7f 7e 7e 7f 7f 7f 80 80 80 80 7f 7f 7f 7e : ...~~..........~
22600 : __ __ __ BYT 7f 7e 7e 7e 7d 7d 7d 7e 7e 7e 7f 7f 7f 7f 7e 7e : .~~~}}}~~~....~~
22610 : __ __ __ BYT 7e 7d 7d 7d 7d 7e 7e 7e 7f 7e 7e 7e 7e 7e 7d 7d : ~}}}}~~~.~~~~~}}
22620 : __ __ __ BYT 7c 7d 7c 7d 7d 7e 7f 80 81 81 81 81 80 80 80 81 : |}|}}~..........
22630 : __ __ __ BYT 81 81 82 83 84 84 84 84 84 83 83 82 82 82 81 81 : ................
22640 : __ __ __ BYT 81 81 80 7f 7f 7f 7f 7e 7e 7e 7d 7c 7c 7a 7a 7a : .......~~~}||zzz
22650 : __ __ __ BYT 7c 7c 7d 7e 7e 7f 7f 7f 7e 7e 7e 7d 7e 7e 7f 7f : ||}~~...~~~}~~..
22660 : __ __ __ BYT 80 81 81 81 81 80 80 80 80 7f 7f 7e 7e 7e 7e 7f : ...........~~~~.
22670 : __ __ __ BYT 7f 80 80 81 81 81 81 80 80 80 80 80 81 81 82 82 : ................
22680 : __ __ __ BYT 82 83 82 82 82 81 80 7f 7f 7f 7e 7e 7e 7e 7e 7e : ..........~~~~~~
22690 : __ __ __ BYT 7e 7e 7d 7c 7c 7c 7c 7a 7a 7a 7b 7c 7c 7d 7d 7e : ~~}||||zzz{||}}~
226a0 : __ __ __ BYT 7e 7e 7f 7f 7f 7f 7e 7e 7f 7f 80 81 82 82 82 83 : ~~....~~........
226b0 : __ __ __ BYT 82 82 82 82 82 81 81 81 81 81 81 81 81 80 80 80 : ................
226c0 : __ __ __ BYT 7f 7f 7e 7d 7d 7d 7d 7d 7e 7e 7f 7f 7e 7e 7e 7e : ..~}}}}}~~..~~~~
226d0 : __ __ __ BYT 7e 7e 7e 7e 7e 7d 7e 7f 7f 80 80 80 80 80 80 80 : ~~~~~}~.........
226e0 : __ __ __ BYT 7f 7e 7e 7e 7f 7f 7f 7f 7f 80 7f 7f 7f 7f 7e 7d : .~~~..........~}
226f0 : __ __ __ BYT 7e 7e 7e 7f 7f 7f 80 80 80 81 81 81 82 82 81 81 : ~~~.............
22700 : __ __ __ BYT 81 81 81 81 81 81 81 82 82 81 80 80 7f 7e 7e 7d : .............~~}
22710 : __ __ __ BYT 7c 7c 7c 7c 7c 7c 7c 7c 7c 7c 7c 7d 7d 7d 7e 7e : |||||||||||}}}~~
22720 : __ __ __ BYT 7e 7e 7e 7e 7f 7f 80 81 81 81 81 81 81 81 81 81 : ~~~~............
22730 : __ __ __ BYT 81 81 81 81 81 81 81 81 80 80 80 80 7f 7f 7f 7f : ................
22740 : __ __ __ BYT 7f 7e 7e 7e 7f 7f 80 80 81 81 80 80 80 80 80 80 : .~~~............
22750 : __ __ __ BYT 81 81 81 81 82 81 81 80 80 7f 7e 7e 7e 7e 7d 7d : ..........~~~~}}
22760 : __ __ __ BYT 7c 7c 7c 7a 7a 7b 7a 7b 7c 7c 7d 7c 7c 7c 7d 7e : |||zz{z{||}|||}~
22770 : __ __ __ BYT 7e 7f 7f 80 81 81 81 81 81 81 81 81 81 81 81 81 : ~...............
22780 : __ __ __ BYT 81 81 82 82 82 82 82 82 81 81 80 7f 7f 80 80 80 : ................
22790 : __ __ __ BYT 81 81 81 80 80 80 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
227a0 : __ __ __ BYT 7e 7e 7e 7e 7e 7e 7e 7e 7d 7c 7c 7a 7a 7c 7c 7d : ~~~~~~~~}||zz||}
227b0 : __ __ __ BYT 7e 7e 7e 7e 7d 7d 7c 7c 7d 7c 7e 7e 7f 80 80 80 : ~~~~}}||}|~~....
227c0 : __ __ __ BYT 80 80 81 81 81 82 82 82 82 81 81 81 81 81 82 82 : ................
227d0 : __ __ __ BYT 83 83 82 82 81 80 7f 7f 7f 80 80 80 80 80 80 80 : ................
227e0 : __ __ __ BYT 80 80 80 7f 7f 7f 7e 7e 7e 7d 7d 7d 7d 7e 7e 7e : ......~~~}}}}~~~
227f0 : __ __ __ BYT 7e 7e 7e 7e 7e 7e 7d 7d 7d 7d 7d 7d 7d 7d 7e 7e : ~~~~~~}}}}}}}}~~
22800 : __ __ __ BYT 7e 7e 7e 7e 7f 7e 7d 7e 7e 7f 7f 80 81 82 82 82 : ~~~~.~}~~.......
22810 : __ __ __ BYT 83 82 82 82 82 82 82 82 82 82 82 83 83 83 83 82 : ................
22820 : __ __ __ BYT 81 81 81 80 7f 7f 7f 7e 7e 7e 7d 7d 7d 7d 7d 7c : .......~~~}}}}}|
22830 : __ __ __ BYT 7c 7c 7c 7c 7c 7c 7c 7c 7c 7d 7d 7e 7e 7e 7f 7f : |||||||||}}~~~..
22840 : __ __ __ BYT 7f 7f 7e 7e 7f 7f 7f 80 80 80 80 80 80 81 80 80 : ..~~............
22850 : __ __ __ BYT 81 80 80 80 80 80 80 80 7f 80 80 80 81 81 80 80 : ................
22860 : __ __ __ BYT 80 81 81 81 82 82 82 82 82 82 82 81 81 81 80 7f : ................
22870 : __ __ __ BYT 7f 7e 7e 7e 7d 7d 7d 7c 7c 7b 7b 7c 7c 7c 7c 7c : .~~~}}}||{{|||||
22880 : __ __ __ BYT 7c 7c 7c 7c 7c 7d 7e 7e 7e 7f 7f 7f 80 80 80 80 : |||||}~~~.......
22890 : __ __ __ BYT 80 81 81 81 81 82 82 81 81 81 81 81 80 80 80 80 : ................
228a0 : __ __ __ BYT 80 80 80 80 7f 80 80 80 81 80 80 80 80 80 80 80 : ................
228b0 : __ __ __ BYT 7f 80 80 80 81 81 81 81 81 80 80 80 80 80 80 80 : ................
228c0 : __ __ __ BYT 7f 7f 7e 7d 7d 7c 7c 7c 7b 7a 7b 7a 7b 7b 7b 7b : ..~}}|||{z{z{{{{
228d0 : __ __ __ BYT 7b 7c 7d 7d 7d 7e 7e 7f 80 80 81 81 82 82 83 83 : {|}}}~~.........
228e0 : __ __ __ BYT 84 85 85 84 84 85 84 84 84 83 82 82 81 81 81 80 : ................
228f0 : __ __ __ BYT 7f 7f 7f 7e 7d 7d 7d 7d 7c 7c 7d 7d 7d 7d 7e 7e : ...~}}}}||}}}}~~
22900 : __ __ __ BYT 7e 7e 7e 7f 7f 7e 7e 7f 7f 7f 7f 7f 7f 7f 7e 7f : ~~~..~~.......~.
22910 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7e 7e 7d 7d 7d 7d 7d 7d 7d 7d : ......~~}}}}}}}}
22920 : __ __ __ BYT 7d 7d 7d 7e 7f 7f 80 81 81 82 83 84 84 85 85 85 : }}}~............
22930 : __ __ __ BYT 85 85 85 85 85 85 84 84 82 81 80 80 80 7f 7f 7f : ................
22940 : __ __ __ BYT 7e 7e 7d 7c 7d 7c 7c 7b 7b 7b 7a 7a 7a 7a 7a 7a : ~~}|}||{{{zzzzzz
22950 : __ __ __ BYT 7c 7c 7d 7e 7e 7e 7f 7f 7f 7f 7f 7f 7e 7f 7f 7f : ||}~~~......~...
22960 : __ __ __ BYT 7f 7f 7f 7f 7f 80 7f 7f 7f 80 7f 7f 7f 80 80 81 : ................
22970 : __ __ __ BYT 81 81 81 81 82 82 82 82 82 83 83 84 84 84 84 83 : ................
22980 : __ __ __ BYT 84 83 82 82 82 82 81 80 80 7f 7d 7d 7c 7c 7c 7b : ..........}}|||{
22990 : __ __ __ BYT 7a 7a 7a 7a 7a 79 79 79 7a 7a 7b 7c 7d 7e 7e 7e : zzzzzyyyzz{|}~~~
229a0 : __ __ __ BYT 7f 7f 7f 7f 80 80 80 81 81 81 82 82 82 82 82 82 : ................
229b0 : __ __ __ BYT 81 82 82 81 81 81 81 80 80 7f 7f 7f 7f 7f 80 80 : ................
229c0 : __ __ __ BYT 80 7f 7f 7f 7f 7f 7f 80 80 80 80 80 80 80 80 80 : ................
229d0 : __ __ __ BYT 7f 7f 7f 7e 7f 7e 7e 7e 7e 7e 7e 7e 7d 7d 7d 7d : ...~.~~~~~~~}}}}
229e0 : __ __ __ BYT 7c 7c 7c 7c 7d 7c 7c 7c 7c 7c 7d 7e 7e 7f 7f 80 : ||||}|||||}~~...
229f0 : __ __ __ BYT 80 80 81 81 81 81 81 81 82 82 83 83 83 83 82 82 : ................
22a00 : __ __ __ BYT 81 81 81 81 81 80 80 80 81 81 81 80 80 80 80 7f : ................
22a10 : __ __ __ BYT 7f 7f 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7f 7e : ..~~~~~~~~~~~~.~
22a20 : __ __ __ BYT 7e 7e 7e 7d 7d 7d 7d 7d 7d 7e 7e 7e 7e 7d 7e 7d : ~~~}}}}}}~~~~}~}
22a30 : __ __ __ BYT 7d 7d 7d 7d 7e 7e 7e 7e 7f 7f 80 80 80 80 80 80 : }}}}~~~~........
22a40 : __ __ __ BYT 80 81 81 82 81 82 82 82 83 83 83 83 82 82 82 82 : ................
22a50 : __ __ __ BYT 81 81 81 81 80 80 80 7f 7f 80 7f 7f 7f 7f 7e 7d : ..............~}
22a60 : __ __ __ BYT 7e 7d 7d 7d 7d 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e : ~}}}}~~~~~~~~~~~
22a70 : __ __ __ BYT 7e 7d 7e 7e 7e 7e 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ~}~~~~..........
22a80 : __ __ __ BYT 7f 7f 7f 80 80 80 80 80 81 81 81 81 81 81 81 81 : ................
22a90 : __ __ __ BYT 80 80 80 80 7f 7f 80 80 80 81 81 80 80 7f 7f 80 : ................
22aa0 : __ __ __ BYT 7f 7f 80 7f 7f 7f 7f 80 80 7f 7f 7f 7e 7e 7e 7e : ............~~~~
22ab0 : __ __ __ BYT 7d 7d 7e 7e 7e 7e 7e 7f 7f 7f 7e 7e 7e 7f 7f 7f : }}~~~~~...~~~...
22ac0 : __ __ __ BYT 7e 7e 7e 7e 7f 7f 7f 80 80 80 80 80 80 80 80 7f : ~~~~............
22ad0 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 80 80 80 80 7f 7f : ................
22ae0 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7e 7e 7e : .............~~~
22af0 : __ __ __ BYT 7e 7e 7e 7e 7e 7e 7f 7f 80 80 7f 7f 7f 7f 7f 7f : ~~~~~~..........
22b00 : __ __ __ BYT 7f 7f 7f 80 7f 80 7f 80 80 7f 80 7f 80 7f 7f 7f : ................
22b10 : __ __ __ BYT 7f 7f 7f 7f 80 7f 80 7f 7f 7f 80 7f 7f 7f 7f 7f : ................
22b20 : __ __ __ BYT 7f 7f 80 80 80 80 80 80 80 80 80 80 80 80 80 80 : ................
22b30 : __ __ __ BYT 80 80 7f 7f 7f 7f 80 7f 7f 7f 7e 7e 7e 7e 7e 7d : ..........~~~~~}
22b40 : __ __ __ BYT 7e 7e 7e 7e 7e 7e 7e 7f 7f 7f 7f 7f 7f 7f 7f 7f : ~~~~~~~.........
22b50 : __ __ __ BYT 7f 7f 7f 80 80 81 81 81 81 80 80 80 80 7f 7f 7f : ................
22b60 : __ __ __ BYT 7f 7f 7f 7f 80 80 80 80 7f 7e 7e 7e 7e 7e 7e 7e : .........~~~~~~~
22b70 : __ __ __ BYT 7e 7e 7e 7e 7f 7f 80 80 80 80 80 80 80 7f 7f 7f : ~~~~............
22b80 : __ __ __ BYT 7f 80 80 80 80 80 81 81 81 81 80 80 7f 7f 7f 7f : ................
22b90 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7e 7e 7e 7e : ............~~~~
22ba0 : __ __ __ BYT 7f 7f 7f 7f 7f 80 80 80 80 80 80 80 80 80 80 7f : ................
22bb0 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7e 7e 7e 7d 7d 7d : ..........~~~}}}
22bc0 : __ __ __ BYT 7d 7d 7e 7e 7f 7f 7f 7f 7e 7f 7f 7f 7f 80 81 81 : }}~~....~.......
22bd0 : __ __ __ BYT 81 81 81 81 81 81 81 81 81 81 81 80 80 80 80 7f : ................
22be0 : __ __ __ BYT 7f 7f 7f 7e 7e 7e 7f 7e 7e 7e 7e 7e 7e 7e 7e 7e : ...~~~.~~~~~~~~~
22bf0 : __ __ __ BYT 7e 7e 7f 7f 7f 7f 7f 7f 7f 7f 7f 80 80 80 80 81 : ~~..............
22c00 : __ __ __ BYT 81 80 80 80 80 80 7f 7f 7f 7f 7f 7f 7e 7f 7e 7e : ............~.~~
22c10 : __ __ __ BYT 7e 7d 7d 7d 7d 7e 7e 7e 7e 7e 7e 7f 7f 7f 7f 7f : ~}}}}~~~~~~.....
22c20 : __ __ __ BYT 80 80 81 81 81 81 81 81 81 81 81 81 80 81 80 80 : ................
22c30 : __ __ __ BYT 80 7f 7f 7f 7f 7e 7e 7f 7e 7e 7e 7e 7e 7e 7e 7e : .....~~.~~~~~~~~
22c40 : __ __ __ BYT 7e 7e 7e 7e 7e 7f 7f 7f 80 7f 7f 7f 7f 7f 7f 7f : ~~~~~...........
22c50 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 80 7f 7f 80 7f 7f : ................
22c60 : __ __ __ BYT 7e 7e 7e 7e 7e 7e 7e 7e 7e 7f 7e 7e 7e 7e 7f 7f : ~~~~~~~~~.~~~~..
22c70 : __ __ __ BYT 7f 7f 7f 80 7f 7f 80 80 80 80 80 81 81 81 81 80 : ................
22c80 : __ __ __ BYT 80 80 80 80 80 80 7f 7f 7f 7f 7f 7e 7e 7e 7e 7e : ...........~~~~~
22c90 : __ __ __ BYT 7e 7e 7e 7e 7e 7e 7f 7f 7f 7f 7f 7f 7f 7f 7f 80 : ~~~~~~..........
22ca0 : __ __ __ BYT 7f 7f 7f 80 7f 7f 7f 7f 80 7f 80 7f 7f 80 7f 7f : ................
22cb0 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7e 7e 7e 7e 7f 7f : ..........~~~~..
22cc0 : __ __ __ BYT 7f 7f 7f 7f 7f 80 80 80 7f 7f 7f 7f 80 80 80 80 : ................
22cd0 : __ __ __ BYT 80 80 80 7f 80 7f 80 7f 80 80 80 80 7f 7f 7f 7e : ...............~
22ce0 : __ __ __ BYT 7e 7e 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ~~..............
22cf0 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 80 80 80 80 80 80 80 80 80 : ................
22d00 : __ __ __ BYT 80 80 7f 80 80 7f 7f 80 7f 7f 7f 7f 7f 7f 7f 7f : ................
22d10 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 80 80 7f : ................
22d20 : __ __ __ BYT 80 7f 7f 80 7f 7f 80 80 80 80 80 80 80 7f 7f 7f : ................
22d30 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
22d40 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 80 7f 80 80 80 80 80       : ..............
--------------------------------------------------------------------
coin_sfx:
30000 : __ __ __ BYT 52 49 46 46 fe 1b 00 00 57 41 56 45 66 6d 74 20 : RIFF....WAVEfmt 
30010 : __ __ __ BYT 10 00 00 00 01 00 01 00 22 56 00 00 22 56 00 00 : ........"V.."V..
30020 : __ __ __ BYT 01 00 08 00 64 61 74 61 da 1b 00 00 80 80 80 80 : ....data........
30030 : __ __ __ BYT 80 7f 80 7f 80 80 80 7f 80 7f 80 80 7f 80 80 80 : ................
30040 : __ __ __ BYT 80 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 7f 80 7f : ................
30050 : __ __ __ BYT 80 7f 80 80 80 7f 80 7f 80 7f 80 80 7f 80 7f 80 : ................
30060 : __ __ __ BYT 7f 80 80 7f 80 7f 80 7f 80 7f 80 7f 80 80 7f 80 : ................
30070 : __ __ __ BYT 7f 80 80 80 7f 80 7f 80 7f 80 7f 80 80 7f 80 7f : ................
30080 : __ __ __ BYT 80 80 7f 80 7f 80 7f 80 80 7f 80 7f 80 7f 80 7f : ................
30090 : __ __ __ BYT 80 80 7f 80 7f 80 7f 80 7f 80 80 7f 80 7f 80 80 : ................
300a0 : __ __ __ BYT 7f 80 7f 80 7f 80 7f 80 7f 80 80 7f 80 7f 80 7f : ................
300b0 : __ __ __ BYT 80 7f 80 80 7f 80 80 80 7f 80 7f 80 7f 80 7f 80 : ................
300c0 : __ __ __ BYT 7f 80 7f 80 7f 80 80 80 7f 80 80 7f 80 7f 80 7f : ................
300d0 : __ __ __ BYT 80 7f 80 80 80 80 80 80 7f 80 7f 80 7f 7f 80 7f : ................
300e0 : __ __ __ BYT 80 7f 80 7f 80 80 7f 80 80 7f 80 7f 80 80 7f 80 : ................
300f0 : __ __ __ BYT 7f 80 7f 80 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f : ................
30100 : __ __ __ BYT 80 7f 80 7f 80 7f 80 80 80 80 80 80 80 80 80 7f : ................
30110 : __ __ __ BYT 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f : ................
30120 : __ __ __ BYT 80 7f 80 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 : ................
30130 : __ __ __ BYT 7f 80 7f 80 80 7f 80 7f 80 7f 80 80 7f 80 7f 80 : ................
30140 : __ __ __ BYT 7f 80 80 80 7f 80 7f 80 80 7f 80 7f 80 80 7f 80 : ................
30150 : __ __ __ BYT 7f 80 80 7f 80 7f 80 7f 80 80 80 80 80 80 80 80 : ................
30160 : __ __ __ BYT 7f 80 7f 80 7f 80 7f 80 7f 80 7f 7f 80 7f 80 7f : ................
30170 : __ __ __ BYT 80 80 7f 80 7f 7f 80 7f 80 7f 80 80 80 80 80 80 : ................
30180 : __ __ __ BYT 80 80 7f 80 7f 80 7f 80 7f 80 7f 80 80 7f 80 80 : ................
30190 : __ __ __ BYT 7f 80 80 7f 80 7f 80 80 7f 80 80 80 80 80 80 80 : ................
301a0 : __ __ __ BYT 80 7f 80 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 : ................
301b0 : __ __ __ BYT 7f 80 80 7f 80 7f 80 80 7f 80 7f 80 7f 80 7f 80 : ................
301c0 : __ __ __ BYT 7f 80 7f 80 80 7f 80 7f 80 7f 80 80 7f 80 80 7f : ................
301d0 : __ __ __ BYT 80 7f 80 80 80 7f 80 7f 80 7f 80 80 7f 80 7f 80 : ................
301e0 : __ __ __ BYT 7f 80 7f 80 7f 80 7f 80 80 80 80 7f 80 7f 80 7f : ................
301f0 : __ __ __ BYT 80 7f 80 7f 80 7f 80 80 80 7f 80 7f 80 7f 80 7f : ................
30200 : __ __ __ BYT 80 7f 80 7f 80 7f 80 7f 80 7f 80 80 7f 80 7f 80 : ................
30210 : __ __ __ BYT 7f 80 80 80 80 80 7f 80 80 80 80 7f 80 7f 80 7f : ................
30220 : __ __ __ BYT 80 7f 80 7f 80 80 80 7f 80 7f 80 7f 80 80 7f 80 : ................
30230 : __ __ __ BYT 7f 80 7f 80 7f 80 80 80 80 80 80 80 80 80 7f 80 : ................
30240 : __ __ __ BYT 7f 80 7f 80 7f 80 7f 80 80 80 80 7f 80 80 7f 80 : ................
30250 : __ __ __ BYT 7f 80 7f 80 7f 7f 80 80 80 7f 80 80 7f 80 7f 80 : ................
30260 : __ __ __ BYT 7f 80 80 80 7f 80 7f 7f 80 80 80 7f 7f 80 80 7f : ................
30270 : __ __ __ BYT 7f 80 7f 80 80 80 7f 7f 7f 80 80 7f 80 80 7f 80 : ................
30280 : __ __ __ BYT 7f 80 7f 80 80 7f 7f 7f 80 80 7f 7f 80 7f 80 7f : ................
30290 : __ __ __ BYT 80 7f 80 80 7f 80 7f 7f 80 80 7f 7f 80 80 80 7f : ................
302a0 : __ __ __ BYT 7f 80 80 80 7f 80 80 7f 80 80 80 80 7f 80 80 7f : ................
302b0 : __ __ __ BYT 80 80 80 7f 80 80 80 7f 80 7f 7f 80 7f 80 7f 80 : ................
302c0 : __ __ __ BYT 80 80 7f 7f 80 7f 7f 7f 80 80 7f 7f 80 7f 80 80 : ................
302d0 : __ __ __ BYT 7f 80 7f 80 80 7f 80 7f 80 7f 7f 80 7f 80 7f 80 : ................
302e0 : __ __ __ BYT 80 7f 80 7f 80 7f 80 7f 7f 80 80 7f 80 7f 7f 80 : ................
302f0 : __ __ __ BYT 80 7f 7f 80 7f 7f 80 80 80 7f 80 80 80 7f 7f 80 : ................
30300 : __ __ __ BYT 80 80 7f 7f 80 80 80 7f 7f 80 7f 80 80 80 7f 80 : ................
30310 : __ __ __ BYT 7f 80 80 7f 80 7f 80 7f 80 80 7f 80 7f 80 7f 80 : ................
30320 : __ __ __ BYT 80 7f 80 7f 80 80 7f 80 7f 7f 80 7f 80 80 7f 80 : ................
30330 : __ __ __ BYT 80 80 7f 80 7f 80 80 80 7f 7f 80 80 7f 7f 80 80 : ................
30340 : __ __ __ BYT 80 7f 80 7f 7f 7f 80 7f 80 80 80 7f 7f 80 80 7f : ................
30350 : __ __ __ BYT 7f 80 80 7f 7f 80 80 80 80 7f 80 80 7f 7f 80 7f : ................
30360 : __ __ __ BYT 7f 7f 80 80 7f 7f 80 7f 7f 7f 80 80 7f 80 7f 7f : ................
30370 : __ __ __ BYT 7f 7f 81 7f 7f 7f 81 80 7f 80 7f 80 7e 7f 81 7f : ............~...
30380 : __ __ __ BYT 7f 7f 80 80 7f 81 80 7f 7f 7f 80 80 7f 7f 80 7f : ................
30390 : __ __ __ BYT 7f 80 81 80 7f 7f 80 81 7f 7f 80 7f 80 7f 7f 7f : ................
303a0 : __ __ __ BYT 80 80 81 80 7e 7f 81 81 7d 7e 82 7f 7e 80 81 80 : ....~...}~..~...
303b0 : __ __ __ BYT 7e 81 80 80 7f 7e 80 7f 7f 7f 81 80 7e 81 7f 7f : ~....~......~...
303c0 : __ __ __ BYT 7e 80 81 7d 81 7f 81 7e 7f 7d 85 84 69 89 8b 7a : ~..}...~.}..i..z
303d0 : __ __ __ BYT 80 7a 8c 76 82 81 79 8c 70 90 79 7b 88 75 8d 71 : .z.v..y.p.y{.u.q
303e0 : __ __ __ BYT 88 80 78 89 75 88 88 81 73 7a 87 78 82 82 80 7b : ..x.u...sz.x...{
303f0 : __ __ __ BYT 82 83 7d 86 80 79 7c 85 7a 85 7d 7b 84 7d 84 7c : ..}..y|.z.}{.}.|
30400 : __ __ __ BYT 81 84 7d 82 7d 83 7c 7d 83 7b 86 7a 80 83 7f 82 : ..}.}.|}.{.z....
30410 : __ __ __ BYT 7d 82 7f 7c 80 81 80 7e 81 80 7e 7f 7d 81 80 7f : }..|...~..~.}...
30420 : __ __ __ BYT 7f 83 7e 80 81 7c 82 7d 81 81 7d 7e 7d 82 85 7b : ..~..|.}..}~}..{
30430 : __ __ __ BYT 80 82 80 7a 83 83 7d 82 7b 85 7b 83 81 7a 86 78 : ...z..}.{.{..z.x
30440 : __ __ __ BYT 84 80 7c 82 7c 86 79 82 83 7d 82 78 85 7d 82 7f : ..|.|.y..}.x.}..
30450 : __ __ __ BYT 7d 86 79 82 7c 82 80 7d 87 7a 83 7c 80 83 7a 86 : }.y.|..}.z.|..z.
30460 : __ __ __ BYT 7b 85 7e 7c 85 7b 84 7a 82 82 7b 84 7b 85 7c 7e : {.~|.{.z..{.{.|~
30470 : __ __ __ BYT 83 7c 84 79 82 81 7f 81 7a 85 7d 80 81 7e 83 7a : .|.y....z.}..~.z
30480 : __ __ __ BYT 83 7f 80 80 7c 84 7b 81 7e 80 83 79 83 7e 82 7e : ....|.{.~..y.~.~
30490 : __ __ __ BYT 7c 84 7c 84 7c 82 81 7b 83 7d 84 7c 7e 83 7d 82 : |.|.|..{.}.|~.}.
304a0 : __ __ __ BYT 7a 85 80 7d 81 7d 85 7b 7f 80 80 81 7b 84 7e 80 : z..}.}.{....{.~.
304b0 : __ __ __ BYT 7e 80 85 7a 81 7f 81 7f 7c 83 7f 81 7c 81 82 7d : ~..z....|...|..}
304c0 : __ __ __ BYT 7f 7e 84 7c 7d 82 80 82 7a 82 82 7e 7e 7f 85 7d : .~.|}...z..~~..}
304d0 : __ __ __ BYT 7e 7f 83 81 7a 81 81 81 7c 7f 84 7d 7e 7e 83 80 : ~...z...|..}~~..
304e0 : __ __ __ BYT 7c 80 80 82 7b 7f 83 7f 7f 7c 83 81 7c 7f 80 83 : |...{....|..|...
304f0 : __ __ __ BYT 7d 7e 81 81 80 7c 82 82 7f 7d 80 82 7e 7e 7f 83 : }~...|...}..~~..
30500 : __ __ __ BYT 7f 7c 81 81 81 7b 80 83 7f 7e 7c 84 7f 7e 7e 81 : .|...{...~|..~~.
30510 : __ __ __ BYT 84 7a 80 80 82 7f 7b 84 7f 7f 7d 81 83 7c 7f 7f : .z....{...}..|..
30520 : __ __ __ BYT 84 7e 7c 82 80 80 7b 81 83 7e 7d 7e 84 7f 7c 7f : .~|...{..~}~..|.
30530 : __ __ __ BYT 83 81 7b 80 82 81 7d 7e 84 7f 7d 7d 83 81 7b 7f : ..{...}~..}}..{.
30540 : __ __ __ BYT 81 83 7c 7d 84 80 7f 7c 82 83 7c 7e 80 84 7c 7d : ..|}...|..|~..|}
30550 : __ __ __ BYT 82 81 7f 7a 83 83 7e 7d 7f 85 7d 7c 81 82 80 7a : ...z..~}..}|...z
30560 : __ __ __ BYT 82 82 80 7c 7e 85 7e 7d 7e 83 81 7a 80 82 81 7b : ...|~.~}~..z...{
30570 : __ __ __ BYT 7f 84 7f 7d 7d 84 80 7c 7f 81 82 7b 7e 83 81 7e : ...}}..|...{~..~
30580 : __ __ __ BYT 7d 83 81 7d 7e 81 82 7c 7f 81 81 7e 7d 82 80 7f : }..}~..|...~}...
30590 : __ __ __ BYT 7e 81 81 7d 7f 80 81 7e 7e 81 80 7f 7e 81 80 7e : ~..}...~~...~..~
305a0 : __ __ __ BYT 7f 7f 81 7e 80 80 7f 7f 7f 81 7f 7f 7f 80 80 7e : ...~...........~
305b0 : __ __ __ BYT 81 7f 80 7f 80 80 7e 80 80 81 7e 7f 80 80 7f 7e : ......~...~....~
305c0 : __ __ __ BYT 81 80 7e 7f 80 81 7e 7e 81 80 7f 7e 81 80 7e 7f : ..~...~~...~..~.
305d0 : __ __ __ BYT 80 81 7e 7f 80 80 7f 7e 81 80 7f 7e 80 81 7e 7f : ..~....~...~..~.
305e0 : __ __ __ BYT 80 80 7f 7e 81 7f 80 7f 7f 80 7f 80 7e 81 7f 7f : ...~........~...
305f0 : __ __ __ BYT 81 7e 81 7e 80 80 7f 81 7f 80 7f 80 80 7e 81 7f : .~.~.........~..
30600 : __ __ __ BYT 81 7e 7f 81 7e 80 7f 82 7f 7d 81 7f 81 7d 81 81 : .~..~....}...}..
30610 : __ __ __ BYT 7e 7f 7e 83 7e 7e 80 80 82 7c 80 81 7f 7f 7d 83 : ~.~.~~...|....}.
30620 : __ __ __ BYT 80 7d 7f 80 83 7c 7f 81 81 7e 7d 83 80 7f 7d 81 : .}...|...~}...}.
30630 : __ __ __ BYT 82 7d 7f 80 82 7e 7d 82 80 80 7d 80 82 7e 7e 7f : .}...~}...}..~~.
30640 : __ __ __ BYT 83 7f 7d 80 81 80 7d 80 82 80 7d 7e 83 80 7d 7e : ..}...}...}~..}~
30650 : __ __ __ BYT 81 82 7c 7f 81 81 7e 7c 83 81 7e 7c 81 83 7d 7d : ..|...~|..~|..}}
30660 : __ __ __ BYT 81 83 7e 7c 82 82 7e 7d 80 83 7d 7e 80 82 80 7b : ..~|..~}..}~...{
30670 : __ __ __ BYT 83 81 7f 7d 7f 84 7e 7d 80 83 80 7c 80 82 80 7c : ...}..~}...|...|
30680 : __ __ __ BYT 7f 83 7f 7e 7e 83 80 7c 80 81 82 7d 7e 82 80 7f : ...~~..|...}~...
30690 : __ __ __ BYT 7d 82 80 7d 7f 80 82 7d 7f 81 80 80 7d 81 80 7f : }..}...}....}...
306a0 : __ __ __ BYT 7f 7f 81 7e 7f 80 7f 81 7d 81 7f 80 7f 7e 81 7e : ...~....}....~.~
306b0 : __ __ __ BYT 81 7e 80 80 7f 7f 7e 81 80 7f 7f 80 80 80 7f 7f : .~....~.........
306c0 : __ __ __ BYT 80 80 7e 81 80 7e 80 7f 81 7e 80 81 7f 80 7e 81 : ..~..~...~....~.
306d0 : __ __ __ BYT 80 7f 7f 7f 81 7f 7e 80 80 7f 7f 81 7e 80 7f 80 : ......~.....~...
306e0 : __ __ __ BYT 80 7f 81 7d 81 80 7f 7f 7f 82 7f 7e 81 80 80 7e : ...}.......~...~
306f0 : __ __ __ BYT 80 80 7f 7e 80 82 7d 80 7f 81 7e 7e 80 80 81 7d : ...~..}...~~...}
30700 : __ __ __ BYT 7f 83 7f 7d 80 7f 82 7c 80 81 81 7e 80 80 80 7e : ...}...|...~...~
30710 : __ __ __ BYT 7f 82 7e 80 7e 7f 81 80 7d 80 80 81 7e 7f 81 7f : ..~.~...}...~...
30720 : __ __ __ BYT 7e 80 7f 7f 7f 80 80 80 7e 7f 84 7d 7f 81 81 7f : ~.......~..}....
30730 : __ __ __ BYT 7c 80 80 81 7f 7d 82 81 7f 7e 7f 81 80 7e 80 82 : |....}...~...~..
30740 : __ __ __ BYT 7e 7e 82 7f 80 7c 7f 84 7e 7e 7e 83 80 80 7d 80 : ~~...|..~~~...}.
30750 : __ __ __ BYT 83 80 87 76 6f 9c 74 73 8c 7b 8c 70 88 78 83 82 : ...vo.ts.{.p.x..
30760 : __ __ __ BYT 7c 8b 6e 8d 7c 7f 80 75 90 76 84 8c 5f 9b 70 80 : |.n.|..u.v.._.p.
30770 : __ __ __ BYT 8c 70 91 63 9d 81 6e 85 90 7b 6c 8e 80 7e 70 85 : .p.c..n..{l..~p.
30780 : __ __ __ BYT 97 70 76 84 87 7a 73 95 7d 85 6d 88 8a 73 82 78 : .pv..zs.}.m..s.x
30790 : __ __ __ BYT 94 71 83 7f 7b 88 72 89 7d 86 77 79 91 74 86 77 : .q..{.r.}.wy.t.w
307a0 : __ __ __ BYT 87 7e 7c 83 78 8c 73 87 80 7d 7e 86 85 66 90 8d : .~|.x.s..}~..f..
307b0 : __ __ __ BYT 68 77 8c 92 65 8b 7f 7e 8e 65 9a 67 8f 7c 74 94 : hw..e..~.e.g.|t.
307c0 : __ __ __ BYT 69 99 6b 8f 7d 76 92 69 95 6a 90 7a 78 93 64 9f : i.k.}v.i.j.zx.d.
307d0 : __ __ __ BYT 65 8e 79 80 8e 58 a7 72 83 73 8a 97 5e 90 70 8e : e.y..X.r.s..^.p.
307e0 : __ __ __ BYT 7b 6e 90 75 8d 73 8c 7c 7a 87 78 88 75 84 81 7e : {n.u.s.|z.x.u..~
307f0 : __ __ __ BYT 81 7d 8c 7b 64 ad 67 7a 84 7d 90 64 a3 59 a4 71 : .}.{d.gz.}.d.Y.q
30800 : __ __ __ BYT 70 9c 5f a3 5b 9a 7a 76 93 64 9e 63 97 72 7c 90 : p._.[.zv.d.c.r|.
30810 : __ __ __ BYT 67 9c 5e 9c 71 82 87 6c 9b 64 96 70 7f 8f 71 81 : g.^.q..l.d.p..q.
30820 : __ __ __ BYT 81 8c 73 7c 8e 72 79 81 84 88 74 83 82 86 6f 81 : ..s|.ry...t...o.
30830 : __ __ __ BYT 91 72 7f 80 89 76 79 8b 88 7b 6e 91 85 74 76 85 : .r...vy..{n..tv.
30840 : __ __ __ BYT 98 68 7c 89 7c 89 6f 83 91 75 6e 92 8f 68 7c 88 : .h|.|.o..un..h|.
30850 : __ __ __ BYT 84 7e 75 89 83 7a 74 8c 8a 71 7d 81 8d 72 79 8a : .~u..zt..q}..ry.
30860 : __ __ __ BYT 83 7c 73 8c 82 79 7d 82 8b 75 81 7e 89 7c 74 8a : .|s..y}..u.~.|t.
30870 : __ __ __ BYT 81 82 6d 8b 82 7f 7d 76 91 75 80 7d 88 82 6e 8e : ..m...}v.u.}..n.
30880 : __ __ __ BYT 7c 86 73 83 8c 73 84 75 91 76 7d 80 81 87 6e 93 : |.s..s.u.v}...n.
30890 : __ __ __ BYT 76 84 7a 7e 89 70 89 74 92 77 79 8b 77 89 72 8a : v.z~.p.t.wy.w.r.
308a0 : __ __ __ BYT 75 84 8c 6c 8a 81 8b 73 7c 8b 70 8d 6e 88 80 76 : u..l...s|.p.n..v
308b0 : __ __ __ BYT 92 6c 91 76 89 7d 73 91 6f 91 6d 87 87 75 88 6e : .l.v.}s.o.m..u.n
308c0 : __ __ __ BYT 9a 6e 83 83 77 90 64 97 75 83 81 72 99 68 86 86 : .n..w.d.u..r.h..
308d0 : __ __ __ BYT 7e 88 6a 8c 7d 83 7c 75 98 69 8b 77 8a 81 6d 93 : ~.j.}.|u.i.w..m.
308e0 : __ __ __ BYT 77 89 6d 8a 82 7c 83 6a a0 74 6d 91 86 84 62 99 : w.m..|.j.tm...b.
308f0 : __ __ __ BYT 78 7f 7d 73 9e 64 8d 78 8e 79 73 96 6f 8d 6f 8f : x.}s.d.x.ys.o.o.
30900 : __ __ __ BYT 7f 71 8e 75 8e 6e 87 84 79 88 6d 93 76 81 7c 7f : .q.u.n..y.m.v.|.
30910 : __ __ __ BYT 8e 6a 8c 7e 82 7b 79 90 74 87 79 86 79 77 97 6e : .j.~.{y.t.y.yw.n
30920 : __ __ __ BYT 87 75 88 88 71 8c 68 96 7a 78 88 75 97 61 91 79 : .u..q.h.zx.u.a.y
30930 : __ __ __ BYT 84 84 67 a3 66 93 68 8d 8b 68 93 68 a1 63 8d 81 : ..g.f.h..h.h.c..
30940 : __ __ __ BYT 72 95 63 9d 6d 88 77 7e 94 62 98 6d 92 76 7a 8f : r.c.m.w~.b.m.vz.
30950 : __ __ __ BYT 6f 94 67 93 7a 7e 81 78 93 69 8f 75 88 81 72 8d : o.g.z~.x.i.u..r.
30960 : __ __ __ BYT 77 8a 70 86 84 7b 83 76 8e 78 81 7d 81 84 75 87 : w.p..{.v.x.}..u.
30970 : __ __ __ BYT 7c 86 78 7e 88 7a 83 78 88 7e 7b 84 7e 85 74 84 : |.x~.z.x.~{.~.t.
30980 : __ __ __ BYT 84 7c 82 77 8a 7a 81 7e 80 84 75 8a 77 87 7a 80 : .|.w.z.~..u.w.z.
30990 : __ __ __ BYT 86 77 87 74 8f 79 79 84 84 7f 6e 90 80 7e 7a 84 : .w.t.yy...n..~z.
309a0 : __ __ __ BYT 87 77 82 7e 84 78 82 81 7f 7e 7c 88 7b 80 7b 87 : .w.~.x...~|.{.{.
309b0 : __ __ __ BYT 7f 77 84 81 82 76 84 83 80 7c 7b 8a 7a 7f 7b 88 : .w...v...|{.z.{.
309c0 : __ __ __ BYT 80 76 86 7e 85 76 83 83 7d 80 79 8a 7c 7c 7d 85 : .v.~.v..}.y.||}.
309d0 : __ __ __ BYT 83 76 83 82 83 7a 7e 85 7f 7b 7b 87 86 71 85 83 : .v...z~..{{..q..
309e0 : __ __ __ BYT 7c 7d 7d 8a 7b 82 79 87 85 7b 74 7a 94 79 79 84 : |}}.{.y..{tz.yy.
309f0 : __ __ __ BYT 84 7d 77 85 84 7c 7c 7d 8c 76 7e 80 88 7c 73 8b : .}w..||}.v~..|s.
30a00 : __ __ __ BYT 7c 8b 6c 89 88 70 86 7a 90 6f 80 86 7e 85 6e 93 : |.l..p.z.o..~.n.
30a10 : __ __ __ BYT 77 82 79 81 8c 6c 91 73 8c 75 7e 8b 73 8d 6f 8f : w.y..l.s.u~.s.o.
30a20 : __ __ __ BYT 77 7f 85 78 8c 6e 8e 78 82 81 79 8c 70 8e 76 85 : w..x.n.x..y.p.v.
30a30 : __ __ __ BYT 81 77 89 73 91 76 80 81 79 8b 73 8b 77 84 81 78 : .w.s.v..y.s.w..x
30a40 : __ __ __ BYT 8c 73 89 78 85 80 79 8a 75 89 77 84 81 7b 86 77 : .s.x..y.u.w..{.w
30a50 : __ __ __ BYT 8b 76 83 82 7a 87 76 89 7a 80 81 7c 88 75 88 7b : .v..z.v.z..|.u.{
30a60 : __ __ __ BYT 81 83 78 89 76 87 7b 80 84 77 8a 76 88 7a 81 84 : ..x.v.{..w.v.z..
30a70 : __ __ __ BYT 76 8c 74 8a 79 81 83 77 8d 71 8c 76 84 82 76 8c : v.t.y..w.q.v..v.
30a80 : __ __ __ BYT 71 8e 73 86 81 79 88 72 91 6f 8a 7e 7c 86 73 90 : q.s..y.r.o.~|.s.
30a90 : __ __ __ BYT 6f 8c 78 80 87 74 8b 71 91 75 80 83 7b 88 6f 8f : o.x..t.q.u..{.o.
30aa0 : __ __ __ BYT 78 85 79 7e 8b 73 88 75 8d 79 7c 86 7b 87 71 8b : x.y~.s.u.y|.{.q.
30ab0 : __ __ __ BYT 7d 80 7d 7d 8a 76 82 7d 88 7c 79 86 7f 82 76 86 : }.}}.v.}.|y...v.
30ac0 : __ __ __ BYT 84 7b 7e 7d 89 7b 7b 81 83 82 75 87 81 7e 7b 7f : .{~}.{{...u..~{.
30ad0 : __ __ __ BYT 88 7b 80 7a 8b 7d 76 86 80 84 74 86 81 7e 7e 7d : .{.z.}v...t..~~}
30ae0 : __ __ __ BYT 8c 74 82 80 83 80 76 8a 7b 84 77 85 84 77 85 7a : .t....v.{.w..w.z
30af0 : __ __ __ BYT 8b 74 83 82 7e 83 75 8c 77 86 79 83 85 74 8a 77 : .t..~.u.w.y..t.w
30b00 : __ __ __ BYT 89 76 82 84 7a 86 75 8c 77 83 7e 7f 86 74 8a 77 : .v..z.u.w.~..t.w
30b10 : __ __ __ BYT 87 7b 7e 85 78 88 76 87 7c 7f 81 7b 88 77 84 7c : .{~.x.v.|..{.w.|
30b20 : __ __ __ BYT 84 7e 7a 8a 70 8c 7e 7b 87 76 86 7b 88 78 7c 87 : .~z.p.~{.v.{.x|.
30b30 : __ __ __ BYT 7c 84 74 8b 7f 7a 81 7c 8b 72 84 82 81 7e 77 8d : |.t..z.|.r...~w.
30b40 : __ __ __ BYT 7a 81 78 87 83 74 87 7c 88 73 82 88 79 82 76 90 : z.x..t.|.s..y.v.
30b50 : __ __ __ BYT 78 7b 83 80 86 70 8b 7e 81 7a 7f 8c 73 84 7b 8a : x{...p.~.z..s.{.
30b60 : __ __ __ BYT 79 79 8a 7b 84 74 8b 7d 79 81 80 8b 71 86 7e 84 : yy.{.t.}y...q.~.
30b70 : __ __ __ BYT 7b 76 8c 7b 84 77 87 81 77 84 7d 88 75 83 82 7d : {v.{.w..w.}.u..}
30b80 : __ __ __ BYT 81 7b 87 7a 82 7d 81 83 7a 84 7c 83 7d 7f 83 7c : .{.z.}..z.|.}..|
30b90 : __ __ __ BYT 82 7b 83 80 7f 7f 7e 84 7c 80 7f 81 80 7b 82 80 : .{....~.|....{..
30ba0 : __ __ __ BYT 81 7c 7e 84 7e 7e 7e 85 7f 7a 82 81 82 79 80 86 : .|~.~~~..z...y..
30bb0 : __ __ __ BYT 7d 7c 7d 87 7d 79 83 84 81 76 84 84 7e 7b 7f 89 : }|}.}y...v..~{..
30bc0 : __ __ __ BYT 79 7d 7f 87 7e 77 85 84 7e 75 86 85 7a 7c 82 87 : y}..~w..~u..z|..
30bd0 : __ __ __ BYT 79 7c 83 84 7c 79 87 81 7d 7b 84 85 79 7e 81 85 : y|..|y..}{..y~..
30be0 : __ __ __ BYT 7b 7c 84 81 7e 7b 85 80 7d 7e 80 84 7a 7f 81 82 : {|..~{..}~..z...
30bf0 : __ __ __ BYT 7f 7b 84 80 7f 7c 82 83 7c 7f 7e 85 7d 7d 81 81 : .{...|..|.~.}}..
30c00 : __ __ __ BYT 82 78 83 81 80 7c 7d 87 7c 7f 7b 86 80 79 82 80 : .x...|}.|.{..y..
30c10 : __ __ __ BYT 85 77 81 84 7f 7d 7a 8a 7c 7e 7c 85 83 75 85 7f : .w...}z.|~|..u..
30c20 : __ __ __ BYT 85 77 80 87 7c 80 78 8b 7d 7a 7e 85 87 71 85 82 : .w..|.x.}z~..q..
30c30 : __ __ __ BYT 82 7a 7c 8a 7b 80 79 88 80 79 82 80 87 75 82 83 : .z|.{.y..y...u..
30c40 : __ __ __ BYT 81 7d 7a 8a 7c 7f 7b 85 82 78 82 7e 88 78 7e 85 : .}z.|.{..x.~.x~.
30c50 : __ __ __ BYT 80 7f 78 88 7f 7e 7b 82 86 77 80 7f 87 7a 7b 86 : ..x..~{..w...z{.
30c60 : __ __ __ BYT 7f 80 77 87 82 7c 7d 80 88 76 7f 82 84 7d 79 87 : ..w..|}..v...}y.
30c70 : __ __ __ BYT 7e 7f 7b 85 83 79 80 80 86 79 7e 84 80 7f 79 87 : ~.{..y...y~...y.
30c80 : __ __ __ BYT 80 7c 7e 82 85 78 80 82 83 7b 7c 87 7e 7e 7b 86 : .|~..x...{|.~~{.
30c90 : __ __ __ BYT 80 79 81 82 83 77 82 83 7f 7d 7c 89 7c 7c 7e 86 : .y...w...}|.||~.
30ca0 : __ __ __ BYT 80 76 85 81 82 77 83 86 7b 7d 7d 8a 79 7c 81 85 : .v...w..{}}.y|..
30cb0 : __ __ __ BYT 80 75 87 81 80 77 83 88 79 7e 7f 89 79 7c 84 83 : .u...w..y~..y|..
30cc0 : __ __ __ BYT 7f 76 87 82 7e 79 83 88 78 7d 81 88 7a 7a 85 83 : .v..~y..x}..zz..
30cd0 : __ __ __ BYT 7e 78 85 83 7d 7a 83 85 7b 7c 81 86 7c 7c 81 85 : ~x..}z..{|..||..
30ce0 : __ __ __ BYT 7d 7a 84 82 7f 7a 83 83 7d 7c 80 86 7c 7c 80 86 : }z...z..}|..||..
30cf0 : __ __ __ BYT 7d 79 83 83 7f 78 83 84 7e 7b 7f 86 7d 7c 7f 85 : }y...x..~{..}|..
30d00 : __ __ __ BYT 7f 7a 81 84 7f 7a 81 83 7f 7a 81 83 7d 7d 80 84 : .z...z...z..}}..
30d10 : __ __ __ BYT 7d 7e 7e 85 7f 79 83 82 80 7a 83 82 7e 7d 7e 87 : }~~..y...z..~}~.
30d20 : __ __ __ BYT 7b 7f 7f 82 80 7b 83 7f 83 79 81 83 7d 7f 7e 85 : {....{...y..}.~.
30d30 : __ __ __ BYT 7c 7f 80 81 7f 7b 85 7d 80 7e 80 82 7d 80 7e 83 : |....{.}.~..}.~.
30d40 : __ __ __ BYT 7d 7f 81 7f 80 7e 82 7f 7f 80 7f 80 7f 80 7f 7e : }....~.........~
30d50 : __ __ __ BYT 80 7f 80 7f 80 80 7f 80 7e 81 7f 7f 7f 7f 83 7d : ........~......}
30d60 : __ __ __ BYT 81 80 7f 81 7d 81 7d 82 7d 80 81 7e 82 7d 82 7d : ....}.}.}..~.}.}
30d70 : __ __ __ BYT 81 7f 7f 81 7d 83 7c 82 7e 7f 82 7d 82 7d 83 7f : ....}.|.~..}.}..
30d80 : __ __ __ BYT 7e 80 7f 83 7b 81 80 81 7f 7d 83 7f 80 7b 83 82 : ~...{....}...{..
30d90 : __ __ __ BYT 7c 7f 80 83 7c 7e 81 81 7f 7b 84 7f 7f 7e 80 83 : |...|~...{...~..
30da0 : __ __ __ BYT 7b 80 80 81 7d 7f 83 7e 80 7d 82 81 7c 80 7f 82 : {...}..~.}..|...
30db0 : __ __ __ BYT 7d 7f 80 80 81 7a 84 80 7e 7f 7f 83 7d 80 7d 84 : }....z..~...}.}.
30dc0 : __ __ __ BYT 80 7a 83 7e 83 7b 7f 84 7e 7f 7b 87 7d 7f 7f 80 : .z.~.{..~.{.}...
30dd0 : __ __ __ BYT 84 78 82 80 83 7b 7e 85 7d 81 7a 85 7f 7b 81 81 : .x...{~.}.z..{..
30de0 : __ __ __ BYT 82 78 83 82 7f 7c 7e 86 7e 7c 7e 85 7f 7b 80 84 : .x...|~.~|~..{..
30df0 : __ __ __ BYT 80 79 81 84 7f 7b 81 84 7e 7d 7f 84 7e 7c 82 82 : .y...{..~}..~|..
30e00 : __ __ __ BYT 7e 7d 82 80 7e 7d 82 81 7c 7f 82 80 7c 80 82 81 : ~}..~}..|...|...
30e10 : __ __ __ BYT 7c 7f 82 80 7e 7f 82 7f 7f 7d 83 80 7c 82 7f 81 : |...~....}..|...
30e20 : __ __ __ BYT 7c 81 7f 80 84 76 81 81 82 7f 7f 81 7d 84 7b 82 : |....v......}.{.
30e30 : __ __ __ BYT 80 80 7e 7e 83 7c 81 7f 81 7e 7e 82 7f 80 7b 84 : ..~~.|...~~...{.
30e40 : __ __ __ BYT 80 7d 7f 80 84 7b 7f 81 83 7c 7d 84 7e 80 7d 85 : .}...{...|}.~.}.
30e50 : __ __ __ BYT 80 7b 80 81 84 79 7f 84 7f 7e 7d 84 7f 7c 80 82 : .{...y...~}..|..
30e60 : __ __ __ BYT 81 7a 80 83 80 7c 80 83 7f 7e 7f 82 7f 7d 80 80 : .z...|...~...}..
30e70 : __ __ __ BYT 81 7c 7f 83 7f 7e 7e 82 7e 7e 81 80 7f 7e 82 7f : .|...~~.~~...~..
30e80 : __ __ __ BYT 7e 81 7f 80 7e 81 7f 80 7f 7f 81 7e 81 7e 81 7f : ~...~......~.~..
30e90 : __ __ __ BYT 7f 80 7f 7e 80 80 7f 80 7f 81 7c 82 7f 7f 80 7e : ...~......|....~
30ea0 : __ __ __ BYT 81 7d 82 7f 7f 80 7e 83 7c 7f 82 7f 80 7d 82 80 : .}....~.|....}..
30eb0 : __ __ __ BYT 7f 7d 82 82 7b 7f 80 85 78 82 83 77 85 7f 84 7c : .}..{...x..w...|
30ec0 : __ __ __ BYT 7b 81 84 80 7a 82 82 7f 7b 81 82 7f 7c 80 83 7d : {...z...{...|..}
30ed0 : __ __ __ BYT 7f 7f 82 7d 7e 81 80 80 7b 82 81 80 7d 7f 82 80 : ...}~...{...}...
30ee0 : __ __ __ BYT 7f 7c 84 7d 7e 81 7f 82 7d 80 7f 82 7e 7c 82 80 : .|.}~...}...~|..
30ef0 : __ __ __ BYT 80 7c 83 7f 80 7d 81 81 7d 82 7d 82 7d 7e 83 80 : .|...}..}.}.}~..
30f00 : __ __ __ BYT 7e 7d 82 83 7c 7d 82 83 7d 7c 85 80 7d 7e 82 80 : ~}..|}..}|..}~..
30f10 : __ __ __ BYT 7d 7f 81 83 7b 7e 83 80 7d 7d 85 7e 7d 7e 82 82 : }...{~..}}.~}~..
30f20 : __ __ __ BYT 79 84 81 7f 7d 7f 85 7d 7c 7f 87 7c 7c 82 81 81 : y...}..}|..||...
30f30 : __ __ __ BYT 78 85 81 7d 7e 80 85 7a 81 7e 84 7e 7a 84 80 81 : x..}~..z.~.~z...
30f40 : __ __ __ BYT 7a 84 81 7e 7e 80 84 7b 7f 7e 85 7d 7e 81 7f 82 : z..~~..{.~.}~...
30f50 : __ __ __ BYT 79 83 82 7f 7e 7e 85 7d 7e 7f 84 7e 7d 81 80 82 : y...~~.}~..~}...
30f60 : __ __ __ BYT 7a 82 80 81 7d 7d 85 7f 7e 7b 85 80 7b 81 82 80 : z...}}..~{..{...
30f70 : __ __ __ BYT 7c 7f 82 80 7d 7e 83 82 7b 7f 85 7f 7b 84 80 7f : |...}~..{...{...
30f80 : __ __ __ BYT 7d 80 83 7c 80 7f 82 7f 7e 80 81 80 7c 81 81 80 : }..|....~...|...
30f90 : __ __ __ BYT 7c 7f 84 7e 7e 7e 83 7e 7d 81 7f 82 7b 81 82 7f : |..~~~.~}...{...
30fa0 : __ __ __ BYT 7e 7e 85 7d 7c 83 80 80 7c 81 83 7e 7c 80 84 7c : ~~.}|...|..~|..|
30fb0 : __ __ __ BYT 7f 81 81 7f 7d 81 80 80 7c 80 83 7e 7e 7f 83 7f : ....}...|..~~...
30fc0 : __ __ __ BYT 7d 81 80 80 7c 80 83 7e 7e 80 84 7e 7c 83 81 7e : }...|..~~..~|..~
30fd0 : __ __ __ BYT 7d 80 82 7f 7c 81 84 7b 7f 81 81 7e 7d 82 81 7e : }...|..{...~}..~
30fe0 : __ __ __ BYT 7c 84 81 7c 7e 82 80 7e 7f 81 82 7c 80 81 81 7e : |..|~..~...|...~
30ff0 : __ __ __ BYT 7c 84 7f 7e 7e 81 82 7c 80 80 83 7e 7c 82 81 7e : |..~~..|...~|..~
31000 : __ __ __ BYT 7e 82 7f 7f 7f 7f 82 7d 7f 81 80 7e 7e 83 7e 80 : ~......}...~~.~.
31010 : __ __ __ BYT 7e 81 82 7c 80 81 81 7d 7c 84 81 7c 7f 81 82 7b : ~..|...}|..|...{
31020 : __ __ __ BYT 82 7f 81 7f 7d 84 7d 81 7c 82 80 7d 81 7d 84 7c : ....}.}.|..}.}.|
31030 : __ __ __ BYT 80 80 7f 81 7c 84 7d 81 7f 7f 82 7c 82 7e 83 7c : ....|.}....|.~.|
31040 : __ __ __ BYT 7f 82 7f 7f 7d 84 7d 7f 80 7f 81 7d 80 7f 81 7e : ....}.}....}...~
31050 : __ __ __ BYT 7e 83 7e 80 7d 82 80 7d 80 7f 82 7d 7f 81 80 7f : ~.~.}..}...}....
31060 : __ __ __ BYT 7e 81 7f 7f 7f 7f 82 7d 80 7f 82 7d 7e 83 7d 81 : ~......}...}~.}.
31070 : __ __ __ BYT 7e 81 7f 7f 7f 7f 83 7b 7f 81 81 7f 7c 83 80 7f : ~......{....|...
31080 : __ __ __ BYT 7d 82 82 7b 82 7e 83 7c 7f 81 7f 80 7b 84 7f 7f : }..{.~.|....{...
31090 : __ __ __ BYT 7e 81 83 7a 81 81 81 7d 7f 83 7d 81 7c 83 81 7b : ~..z...}..}.|..{
310a0 : __ __ __ BYT 81 7f 83 7a 80 82 80 7f 7b 86 7e 7e 7f 81 82 7b : ...z....{.~~...{
310b0 : __ __ __ BYT 81 80 80 7e 7e 84 7d 7f 7d 83 80 7b 81 80 82 7a : ...~~.}.}..{...z
310c0 : __ __ __ BYT 83 82 7e 7e 7d 85 7e 7e 7e 84 80 7b 82 80 81 7c : ..~~}.~~~..{...|
310d0 : __ __ __ BYT 80 82 7f 7d 80 83 7c 7f 80 82 7f 7d 81 80 80 7d : ...}..|....}...}
310e0 : __ __ __ BYT 81 81 7e 7d 80 83 7e 7d 81 82 7e 7d 82 82 7e 7d : ..~}..~}..~}..~}
310f0 : __ __ __ BYT 80 83 7e 7d 81 81 7f 7d 80 81 80 7d 80 83 7e 7f : ..~}...}...}..~.
31100 : __ __ __ BYT 80 82 7e 7d 82 7f 80 7d 82 81 7d 7f 80 84 7a 7f : ..~}...}..}...z.
31110 : __ __ __ BYT 83 80 7e 7c 85 7e 7f 7d 81 82 7c 80 7e 84 7c 7e : ..~|.~.}..|.~.|~
31120 : __ __ __ BYT 82 7f 80 7b 84 80 7e 7f 80 83 7b 81 7f 82 7e 7d : ...{..~...{...~}
31130 : __ __ __ BYT 83 7e 80 7b 83 80 7d 80 80 82 7b 82 80 80 7f 7c : .~.{..}...{....|
31140 : __ __ __ BYT 84 7d 80 7d 81 82 7c 81 7e 83 7c 7f 82 7f 80 7c : .}.}..|.~.|....|
31150 : __ __ __ BYT 84 7e 7e 80 7f 82 7c 81 7e 82 7f 7c 83 7e 81 7b : .~~...|.~..|.~.{
31160 : __ __ __ BYT 83 80 7c 82 7e 83 7b 81 80 7f 81 7c 84 7e 81 7d : ..|.~.{....|.~.}
31170 : __ __ __ BYT 80 84 7a 81 7f 83 7c 7e 84 7c 82 7b 84 7f 7e 80 : ..z...|~.|.{..~.
31180 : __ __ __ BYT 7e 85 7a 81 7f 82 7f 7b 85 7e 80 7d 82 80 7c 82 : ~.z....{.~.}..|.
31190 : __ __ __ BYT 7e 84 7b 80 81 7e 81 7b 84 7e 80 7e 81 83 79 82 : ~.{..~.{.~.~..y.
311a0 : __ __ __ BYT 7f 82 7c 7e 83 7e 81 7c 83 7f 7d 80 7f 83 7a 81 : ..|~.~.|..}...z.
311b0 : __ __ __ BYT 81 81 7e 7d 85 7c 80 7e 82 80 7c 80 80 83 7b 80 : ..~}.|.~..|...{.
311c0 : __ __ __ BYT 81 80 7f 7c 84 7e 7e 7e 82 80 7b 82 80 81 7d 7e : ...|.~~~..{...}~
311d0 : __ __ __ BYT 83 7f 7e 7e 83 80 7c 80 81 81 7c 80 83 7e 7d 7f : ..~~..|...|..~}.
311e0 : __ __ __ BYT 84 7e 7d 80 81 80 7c 81 81 7f 7d 7f 84 7e 7d 7f : .~}...|...}..~}.
311f0 : __ __ __ BYT 84 7f 7b 81 81 80 7c 81 82 7e 7e 7e 84 7d 7d 80 : ..{...|..~~~.}}.
31200 : __ __ __ BYT 82 7f 7b 83 80 80 7c 81 83 7c 7f 7f 84 7d 7e 80 : ..{...|..|...}~.
31210 : __ __ __ BYT 81 80 7b 83 80 7f 7c 81 83 7c 7e 80 84 7d 7d 82 : ..{...|..|~..}}.
31220 : __ __ __ BYT 80 80 7b 83 81 7e 7f 7f 84 7b 80 80 82 7e 7c 84 : ..{..~...{...~|.
31230 : __ __ __ BYT 7e 80 7c 82 81 7c 81 7e 84 7c 7f 82 7f 80 7b 84 : ~.|..|.~.|....{.
31240 : __ __ __ BYT 7f 7f 7e 80 84 7a 81 7f 82 7d 7d 84 7e 80 7b 83 : ..~..z...}}.~.{.
31250 : __ __ __ BYT 81 7c 80 7f 83 7b 81 80 80 7f 7c 84 7d 81 7d 81 : .|...{....|.}.}.
31260 : __ __ __ BYT 81 7c 81 7e 83 7c 7f 82 7f 7f 7c 84 7f 7e 7f 80 : .|.~.|....|..~..
31270 : __ __ __ BYT 82 7c 81 7f 81 7e 7e 83 7e 80 7c 83 7f 7e 81 7e : .|...~~.~.|..~.~
31280 : __ __ __ BYT 83 7b 82 80 7f 80 7d 84 7c 81 7f 80 81 7c 82 7e : .{....}.|....|.~
31290 : __ __ __ BYT 83 7c 7f 83 7d 81 7d 83 7e 7f 80 7e 82 7c 81 7f : .|..}.}.~..~.|..
312a0 : __ __ __ BYT 80 7f 7e 82 7e 80 7e 81 80 7e 81 7f 80 7e 80 80 : ..~.~.~..~...~..
312b0 : __ __ __ BYT 80 7f 7f 82 7f 7f 7f 80 80 7e 7f 81 80 7f 80 81 : .........~......
312c0 : __ __ __ BYT 7f 7f 7f 80 80 7e 80 80 80 7e 80 81 7f 7f 80 81 : .....~...~......
312d0 : __ __ __ BYT 7f 7e 81 80 7f 7e 81 80 7f 80 7f 81 7f 80 7f 80 : .~...~..........
312e0 : __ __ __ BYT 80 7f 80 80 80 7e 80 80 7f 7f 7f 80 7f 80 7f 80 : .....~..........
312f0 : __ __ __ BYT 7f 7f 81 7f 80 7f 80 81 7f 7f 7f 81 7e 7f 81 7f : ............~...
31300 : __ __ __ BYT 80 7e 81 7f 80 7f 7f 81 7e 80 7f 81 7f 7f 81 7f : .~......~.......
31310 : __ __ __ BYT 80 7f 81 7f 7f 80 7e 81 7d 81 7f 80 80 7e 82 7e : ......~.}....~.~
31320 : __ __ __ BYT 81 7d 81 81 7d 81 7d 82 7d 80 80 7f 81 7d 82 7e : .}..}.}.}....}.~
31330 : __ __ __ BYT 81 7f 7f 81 7d 81 7e 81 7f 7f 81 7e 81 7e 81 7f : ....}.~....~.~..
31340 : __ __ __ BYT 7f 80 7f 81 7e 81 7e 80 80 7e 81 7e 80 7e 80 7f : ....~.~..~.~.~..
31350 : __ __ __ BYT 7f 80 7e 81 7f 80 7f 7f 80 7e 80 7f 80 7f 80 81 : ..~......~......
31360 : __ __ __ BYT 7e 80 7f 81 7f 7f 80 7f 80 7e 80 7f 80 80 7f 81 : ~........~......
31370 : __ __ __ BYT 7f 80 7f 80 80 7f 81 7e 80 7f 7f 80 7f 81 7f 80 : .......~........
31380 : __ __ __ BYT 7f 80 80 7f 80 7e 81 80 7e 80 7f 80 7f 80 80 7f : .....~..~.......
31390 : __ __ __ BYT 80 7f 81 7f 7f 80 7f 80 7f 80 80 7f 7f 7f 80 7e : ...............~
313a0 : __ __ __ BYT 80 80 7f 80 7e 80 80 7f 7f 80 81 7f 7f 7f 80 7f : ....~...........
313b0 : __ __ __ BYT 7f 80 7f 80 7f 80 7f 7f 7f 80 80 7e 80 80 80 7f : ...........~....
313c0 : __ __ __ BYT 7f 80 7f 80 7f 80 7f 7e 80 80 80 7f 80 80 7f 7f : .......~........
313d0 : __ __ __ BYT 7f 81 7f 7f 80 80 80 7e 80 80 80 7e 7f 81 7e 7f : .......~...~..~.
313e0 : __ __ __ BYT 80 80 80 7e 80 80 7f 7e 81 80 7f 7f 7f 81 7f 7f : ...~...~........
313f0 : __ __ __ BYT 80 80 7f 7f 80 7f 80 7f 80 81 7f 80 7f 80 7f 7f : ................
31400 : __ __ __ BYT 80 80 7f 7e 81 80 7e 7f 80 80 7f 7f 80 80 7f 7f : ...~..~.........
31410 : __ __ __ BYT 80 80 7f 7f 80 80 7f 7f 80 7f 7f 7f 80 80 7f 80 : ................
31420 : __ __ __ BYT 7f 80 7f 7f 80 7f 80 7f 80 7f 7f 80 80 7f 7f 80 : ................
31430 : __ __ __ BYT 80 7f 80 7f 80 80 7f 7f 80 80 7f 80 7f 80 7f 7f : ................
31440 : __ __ __ BYT 81 7f 80 80 7f 80 7f 80 7f 80 7f 7f 80 7f 80 7f : ................
31450 : __ __ __ BYT 7f 80 80 7f 80 80 7f 80 7f 7f 80 7f 80 7f 7f 80 : ................
31460 : __ __ __ BYT 7f 80 7f 80 80 80 7f 7f 80 80 7f 80 80 80 80 7f : ................
31470 : __ __ __ BYT 80 80 7f 7f 7f 80 7f 7f 7f 80 80 7f 7f 80 80 7f : ................
31480 : __ __ __ BYT 7f 7f 80 7f 7f 80 7f 7f 80 80 7f 7f 7f 80 7e 80 : ..............~.
31490 : __ __ __ BYT 80 80 7f 7f 81 7f 80 7e 80 81 7e 80 7f 81 7f 7f : .......~..~.....
314a0 : __ __ __ BYT 80 7f 81 7e 81 7f 80 80 7f 81 7e 80 7f 80 7f 7e : ...~......~....~
314b0 : __ __ __ BYT 81 7e 81 7e 80 80 7e 81 7e 81 7e 80 81 7e 81 7e : .~.~..~.~.~..~.~
314c0 : __ __ __ BYT 81 7f 80 80 7f 81 7e 80 7f 80 80 7f 81 7f 80 7f : ......~.........
314d0 : __ __ __ BYT 80 80 7f 80 7f 80 7f 7f 80 80 7f 7f 80 80 7f 7f : ................
314e0 : __ __ __ BYT 81 7f 7f 7f 80 80 7f 80 7f 80 7f 7f 80 7f 80 7f : ................
314f0 : __ __ __ BYT 80 7f 7f 80 7f 80 7f 80 7f 7f 80 7e 81 7f 7f 80 : ...........~....
31500 : __ __ __ BYT 7f 81 7e 80 7f 80 7f 7e 81 7f 80 7f 80 80 7f 80 : ..~....~........
31510 : __ __ __ BYT 7f 80 7f 80 80 7f 80 7f 80 7f 7f 80 80 7f 7f 80 : ................
31520 : __ __ __ BYT 80 7f 80 7f 80 80 7f 80 7f 80 7f 80 80 7f 80 7f : ................
31530 : __ __ __ BYT 80 80 7f 7f 80 80 80 7f 7f 80 7f 80 80 7f 80 7f : ................
31540 : __ __ __ BYT 80 80 7f 80 7f 80 7f 80 7f 7f 80 7f 80 7f 80 7f : ................
31550 : __ __ __ BYT 80 7f 80 7f 7f 80 7f 80 7f 80 7f 80 80 7f 80 7f : ................
31560 : __ __ __ BYT 80 80 7f 7f 7f 80 7f 7f 7f 80 7f 7f 80 7f 80 7f : ................
31570 : __ __ __ BYT 7f 80 80 7f 7f 80 7f 7f 80 7f 80 7f 80 7f 7f 80 : ................
31580 : __ __ __ BYT 7f 80 7e 80 7f 80 80 7f 80 7f 80 7e 80 80 7f 80 : ..~........~....
31590 : __ __ __ BYT 7e 81 7e 80 80 7f 80 7e 81 7f 80 7f 7f 81 7e 80 : ~.~....~......~.
315a0 : __ __ __ BYT 80 80 7f 80 80 7f 80 7e 81 7f 7f 80 7f 81 7e 80 : .......~......~.
315b0 : __ __ __ BYT 7f 80 7f 7f 81 7f 80 7e 81 80 7f 7f 80 80 7e 80 : .......~......~.
315c0 : __ __ __ BYT 7f 80 7f 7f 80 7f 80 7f 81 7f 7f 80 7f 80 7f 80 : ................
315d0 : __ __ __ BYT 7f 80 7f 7f 81 7e 81 7e 80 80 7e 81 7e 81 7e 80 : .....~.~..~.~.~.
315e0 : __ __ __ BYT 80 7f 81 7e 81 7f 7f 80 7e 81 7e 81 7f 80 80 7f : ...~....~.~.....
315f0 : __ __ __ BYT 81 7e 81 7f 80 80 7f 81 7e 81 7e 80 80 7e 80 7e : .~......~.~..~.~
31600 : __ __ __ BYT 81 7f 7f 80 7f 80 7e 80 7f 80 7f 7f 80 7f 80 80 : ......~.........
31610 : __ __ __ BYT 80 7f 80 7f 7f 80 7f 80 80 7f 7f 80 80 7f 7f 80 : ................
31620 : __ __ __ BYT 80 7f 7f 80 80 7f 7f 80 80 80 7f 7f 81 7f 7f 80 : ................
31630 : __ __ __ BYT 7f 80 7f 80 7f 80 7f 7f 80 7f 80 7f 80 80 7f 80 : ................
31640 : __ __ __ BYT 7f 80 7f 80 7f 7f 80 7f 80 7f 80 7f 7f 80 7f 80 : ................
31650 : __ __ __ BYT 7f 80 80 7f 80 7f 80 7f 80 80 7f 80 7f 80 7f 7f : ................
31660 : __ __ __ BYT 80 7f 80 7f 80 80 7f 80 7f 80 7f 80 7f 7f 80 7f : ................
31670 : __ __ __ BYT 81 7f 80 80 7f 80 7e 81 7f 80 7f 7f 80 7f 80 7f : ......~.........
31680 : __ __ __ BYT 80 7f 7f 80 7f 80 7f 80 80 7f 7f 80 80 7f 7f 80 : ................
31690 : __ __ __ BYT 80 7f 7f 80 80 7f 7f 80 80 80 7e 80 80 7f 7f 80 : ..........~.....
316a0 : __ __ __ BYT 81 7e 80 7f 80 80 7e 81 7f 80 7e 80 81 7e 80 7f : .~....~...~..~..
316b0 : __ __ __ BYT 81 7e 7f 80 7f 80 7e 81 80 7f 7f 80 81 7e 80 7f : .~....~......~..
316c0 : __ __ __ BYT 80 7f 7f 80 7f 80 7e 80 80 7f 7f 7f 81 7e 80 80 : ......~......~..
316d0 : __ __ __ BYT 80 7f 7f 81 7f 7f 7f 81 7f 7f 80 80 80 7e 80 80 : .............~..
316e0 : __ __ __ BYT 7f 7f 7f 81 7f 80 7f 80 80 7f 80 7f 81 7e 80 80 : .............~..
316f0 : __ __ __ BYT 7f 80 7e 81 7f 7f 7f 80 80 7e 80 7f 80 7f 7f 81 : ..~......~......
31700 : __ __ __ BYT 7e 80 7f 80 7f 7f 80 7f 80 7e 80 80 7f 7f 7f 80 : ~........~......
31710 : __ __ __ BYT 7f 7f 80 80 80 7f 80 80 7f 80 7f 81 7f 7f 80 80 : ................
31720 : __ __ __ BYT 80 7e 80 80 7f 80 7f 81 7f 80 7f 80 80 7e 80 7f : .~...........~..
31730 : __ __ __ BYT 81 7e 7f 81 7f 80 7e 81 7f 7f 80 7f 81 7e 81 7f : .~....~......~..
31740 : __ __ __ BYT 7f 80 7e 81 7e 80 7f 7f 80 7e 81 7e 81 7f 7f 80 : ..~.~....~.~....
31750 : __ __ __ BYT 7e 81 7e 81 7f 7f 80 7e 81 7e 80 7f 80 80 7e 82 : ~.~....~.~....~.
31760 : __ __ __ BYT 7e 80 7f 7f 80 7e 81 7f 80 7f 80 80 7e 80 7f 80 : ~....~......~...
31770 : __ __ __ BYT 7f 7f 80 7f 80 7f 80 7f 7f 80 7f 80 80 7f 80 80 : ................
31780 : __ __ __ BYT 80 7f 7f 81 7f 80 7f 80 80 7f 80 7f 80 7f 80 80 : ................
31790 : __ __ __ BYT 7e 80 7f 80 7f 7f 80 7f 80 7e 80 80 7f 80 7f 81 : ~........~......
317a0 : __ __ __ BYT 7e 80 80 80 80 7e 81 7f 80 7f 7f 81 7e 80 7f 80 : ~....~......~...
317b0 : __ __ __ BYT 7f 7f 80 7f 80 7e 80 7f 7f 80 7f 81 7f 7f 7f 80 : .....~..........
317c0 : __ __ __ BYT 80 7e 80 7f 80 7e 80 80 7f 80 7f 80 7f 80 7f 80 : .~...~..........
317d0 : __ __ __ BYT 7f 7f 81 7f 80 7f 80 7f 7f 80 7f 81 7f 80 7f 80 : ................
317e0 : __ __ __ BYT 80 7e 81 7f 80 7e 80 80 7e 80 7f 81 7f 80 80 7f : .~...~..~.......
317f0 : __ __ __ BYT 80 7e 80 7f 80 7f 80 80 7f 80 7f 80 7f 7f 80 7f : .~..............
31800 : __ __ __ BYT 80 7f 80 7f 7f 80 7f 80 7f 80 80 80 80 7f 80 7f : ................
31810 : __ __ __ BYT 80 7f 80 80 7e 80 7f 80 7f 80 80 7f 80 7f 80 7f : ....~...........
31820 : __ __ __ BYT 7f 80 7f 80 7f 80 80 80 7f 80 80 7f 80 80 80 7f : ................
31830 : __ __ __ BYT 80 80 80 80 7f 80 80 80 7f 80 80 80 7f 7f 80 7f : ................
31840 : __ __ __ BYT 80 7f 80 7f 80 80 7f 80 7e 80 7f 80 80 7f 80 7e : ........~......~
31850 : __ __ __ BYT 81 7e 80 7f 7f 80 7f 80 7f 80 7f 7f 80 7f 80 7e : .~.............~
31860 : __ __ __ BYT 80 7f 7f 80 7f 80 7f 80 7f 80 7f 7f 80 7f 80 7f : ................
31870 : __ __ __ BYT 80 7f 7f 80 7f 80 7f 7f 80 7f 80 7f 80 80 7f 80 : ................
31880 : __ __ __ BYT 7f 80 7f 80 80 7f 80 7f 80 7f 80 80 7f 80 7f 80 : ................
31890 : __ __ __ BYT 80 7f 7f 7f 80 7f 80 7f 80 80 7f 80 80 80 7f 80 : ................
318a0 : __ __ __ BYT 80 7f 7f 80 7f 80 7f 80 7f 7f 80 7f 80 7e 80 7f : .............~..
318b0 : __ __ __ BYT 7f 7f 80 81 7e 80 7f 80 7f 7f 80 7f 81 7e 80 7f : ....~........~..
318c0 : __ __ __ BYT 80 80 7f 81 7e 80 7f 80 80 7f 81 7f 80 7f 80 7f : ....~...........
318d0 : __ __ __ BYT 7f 80 7f 80 7f 80 7f 80 7f 7f 80 7f 80 7f 81 7f : ................
318e0 : __ __ __ BYT 80 7f 80 80 7f 80 7f 80 7f 80 80 7f 80 7f 80 7f : ................
318f0 : __ __ __ BYT 7f 7f 80 80 7f 80 80 7f 80 80 7f 7f 7f 80 7f 7f : ................
31900 : __ __ __ BYT 7f 80 80 7f 80 7f 80 7f 7f 80 7f 80 7f 80 7f 80 : ................
31910 : __ __ __ BYT 7f 80 80 7f 7f 80 80 7f 7f 80 80 7f 7f 80 80 7f : ................
31920 : __ __ __ BYT 7f 80 7f 80 80 80 7f 7f 80 7f 80 7f 80 80 7f 80 : ................
31930 : __ __ __ BYT 7e 81 7e 80 7f 80 80 7e 80 7f 80 7f 7f 80 7f 80 : ~.~....~........
31940 : __ __ __ BYT 7f 80 7f 7f 80 7f 80 7f 80 80 7f 7f 80 80 7f 80 : ................
31950 : __ __ __ BYT 80 7f 80 7f 7f 80 7f 80 7f 80 7f 7f 80 7f 80 7f : ................
31960 : __ __ __ BYT 80 80 7f 7f 7f 80 7f 80 80 80 7f 7f 80 7f 80 7f : ................
31970 : __ __ __ BYT 80 80 7f 80 7f 80 7f 80 80 7f 80 7f 7f 80 7f 80 : ................
31980 : __ __ __ BYT 7f 80 7f 7f 80 7f 80 7f 80 80 7f 80 7f 80 7f 80 : ................
31990 : __ __ __ BYT 80 7f 80 7f 80 7f 80 80 7f 80 7f 80 7f 80 80 7f : ................
319a0 : __ __ __ BYT 80 80 80 7f 7f 80 7f 7f 80 80 80 7f 80 80 7f 80 : ................
319b0 : __ __ __ BYT 7f 80 7f 80 7f 80 80 7f 80 7f 80 7f 7f 80 7f 80 : ................
319c0 : __ __ __ BYT 7f 81 7f 7f 80 7f 80 7e 81 7f 7f 80 7f 81 7e 80 : .......~......~.
319d0 : __ __ __ BYT 7f 80 7f 7f 80 7f 80 7f 80 80 7f 80 7f 80 7f 7f : ................
319e0 : __ __ __ BYT 80 7f 80 7f 80 80 7f 80 7f 80 7f 7f 80 7f 80 7f : ................
319f0 : __ __ __ BYT 80 80 7f 80 80 80 7f 80 80 7f 80 7f 80 7f 7f 7f : ................
31a00 : __ __ __ BYT 80 80 7f 80 80 80 7f 7f 80 80 7f 7f 80 80 7f 80 : ................
31a10 : __ __ __ BYT 80 7f 7f 7f 80 7f 80 7f 80 80 7f 80 7f 80 7f 80 : ................
31a20 : __ __ __ BYT 80 7f 80 7f 80 7f 7f 80 80 80 7f 80 7f 80 7f 7f : ................
31a30 : __ __ __ BYT 80 7f 80 7f 80 7f 7f 80 7f 80 7f 80 7f 80 7f 80 : ................
31a40 : __ __ __ BYT 7f 7f 80 7f 80 7f 7f 80 80 7f 7f 80 7f 80 7f 80 : ................
31a50 : __ __ __ BYT 80 7f 7f 7f 80 7f 7f 80 80 7f 80 80 7f 80 7f 80 : ................
31a60 : __ __ __ BYT 80 7f 80 7f 80 7f 7f 80 80 7f 7f 80 80 7f 7f 7f : ................
31a70 : __ __ __ BYT 80 7f 7f 7f 80 80 7f 80 80 80 7f 80 80 7f 7f 7f : ................
31a80 : __ __ __ BYT 80 7f 7f 80 80 80 7f 80 7f 80 7f 80 80 7f 7f 7f : ................
31a90 : __ __ __ BYT 80 7f 80 80 80 80 7f 80 7f 80 7f 80 80 7f 80 7f : ................
31aa0 : __ __ __ BYT 80 7f 80 7f 80 80 7e 80 7f 80 7f 80 80 7f 80 7f : ......~.........
31ab0 : __ __ __ BYT 81 7f 80 80 7f 80 7f 81 7f 80 7f 80 80 7e 80 7f : .............~..
31ac0 : __ __ __ BYT 80 7f 7f 80 7f 80 7f 80 80 7f 80 7f 80 7f 7f 80 : ................
31ad0 : __ __ __ BYT 7f 80 7f 80 7f 7f 80 7f 80 7f 80 7f 7f 80 7f 81 : ................
31ae0 : __ __ __ BYT 7f 80 7f 80 80 7f 80 7f 80 7f 7f 80 7f 80 7f 80 : ................
31af0 : __ __ __ BYT 7f 7f 80 7f 80 7f 80 7f 7f 7f 7f 80 7f 80 7f 7f : ................
31b00 : __ __ __ BYT 80 7f 80 7f 7f 80 7f 80 7f 80 80 7f 80 7f 80 7f : ................
31b10 : __ __ __ BYT 80 80 7f 80 7f 80 7f 80 7f 7f 80 7f 80 7f 80 7f : ................
31b20 : __ __ __ BYT 80 7f 7f 80 7f 80 7f 80 80 7f 80 7f 80 7f 80 7f : ................
31b30 : __ __ __ BYT 80 80 7f 80 7f 80 7f 80 80 7f 80 7f 80 7f 80 80 : ................
31b40 : __ __ __ BYT 7f 80 7f 80 7f 7f 80 7f 80 7f 80 7f 7f 80 7f 80 : ................
31b50 : __ __ __ BYT 7f 80 7f 80 80 7f 80 7f 80 7f 80 80 7f 80 7f 80 : ................
31b60 : __ __ __ BYT 7f 80 80 7f 80 7e 80 7f 80 7f 7f 80 7f 80 7f 80 : .....~..........
31b70 : __ __ __ BYT 7f 7f 80 7f 80 7f 80 7f 7f 80 7f 80 7f 7f 80 7f : ................
31b80 : __ __ __ BYT 80 7f 80 7f 7f 80 7f 80 7f 80 80 7f 80 7f 80 7f : ................
31b90 : __ __ __ BYT 7f 80 7f 80 7f 80 7f 7f 80 7f 80 7f 80 80 7f 80 : ................
31ba0 : __ __ __ BYT 7f 80 7f 80 80 7f 80 7e 80 7f 80 7f 7f 80 7f 80 : .......~........
31bb0 : __ __ __ BYT 7f 80 7f 7f 80 7f 80 7f 80 80 7f 80 7f 80 7f 7f : ................
31bc0 : __ __ __ BYT 80 7f 80 7e 80 7f 7f 80 7f 81 7e 80 7f 7f 80 7f : ...~......~.....
31bd0 : __ __ __ BYT 80 7f 80 7f 7f 80 7f 80 7f 80 7f 7f 80 7f 80 7f : ................
31be0 : __ __ __ BYT 80 7f 7f 80 7f 80 7f 80 7f 7f 80 7f 80 7f 80 7f : ................
31bf0 : __ __ __ BYT 80 80 7f 80 7f 7f 80 7f 80 7f 80 7f 80 80 7f 80 : ................
31c00 : __ __ __ BYT 7f 80 7f 80 80 7f                               : ......
--------------------------------------------------------------------
tief_sfx:
40000 : __ __ __ BYT 52 49 46 46 54 5a 00 00 57 41 56 45 66 6d 74 20 : RIFFTZ..WAVEfmt 
40010 : __ __ __ BYT 10 00 00 00 01 00 01 00 22 56 00 00 22 56 00 00 : ........"V.."V..
40020 : __ __ __ BYT 01 00 08 00 64 61 74 61 2f 5a 00 00 80 80 7f 80 : ....data/Z......
40030 : __ __ __ BYT 7f 80 80 7f 80 7f 80 7f 80 7f 80 7f 7f 7f 80 7f : ................
40040 : __ __ __ BYT 80 80 80 80 7f 80 7f 7f 7f 80 80 80 80 80 80 7f : ................
40050 : __ __ __ BYT 80 7f 80 80 80 80 80 80 80 7f 7f 7f 7f 80 7f 80 : ................
40060 : __ __ __ BYT 80 80 80 7f 80 7f 80 7f 80 7f 80 7f 7f 7f 7f 7f : ................
40070 : __ __ __ BYT 80 7f 80 7f 80 80 80 80 7f 7f 7f 80 80 80 80 80 : ................
40080 : __ __ __ BYT 7f 80 7f 80 7f 7f 80 80 80 7f 80 7f 80 7f 80 7f : ................
40090 : __ __ __ BYT 7f 80 7f 80 7f 80 80 80 80 80 80 80 80 80 80 80 : ................
400a0 : __ __ __ BYT 80 80 80 80 7f 80 7f 80 7f 80 7f 7f 7f 7f 80 80 : ................
400b0 : __ __ __ BYT 80 7f 80 7f 7f 80 80 80 7f 80 80 80 80 7f 7f 7f : ................
400c0 : __ __ __ BYT 7f 80 7f 80 7f 7f 7f 7f 80 80 80 80 80 7f 80 7f : ................
400d0 : __ __ __ BYT 80 7f 7f 80 80 80 80 80 7f 80 7f 80 7f 7f 80 7f : ................
400e0 : __ __ __ BYT 80 7f 80 80 80 80 80 80 7f 7f 7f 7f 80 80 7f 80 : ................
400f0 : __ __ __ BYT 7f 80 80 80 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f : ................
40100 : __ __ __ BYT 80 80 80 7f 80 80 80 7f 7f 7f 80 7f 80 80 80 7f : ................
40110 : __ __ __ BYT 7f 80 80 7f 80 7f 80 7f 80 7f 80 80 80 80 7f 7f : ................
40120 : __ __ __ BYT 80 7f 80 80 80 7f 7f 80 7f 80 7f 80 7f 80 7f 80 : ................
40130 : __ __ __ BYT 7f 80 7f 7f 80 80 80 7f 80 7f 7f 7f 7f 80 7f 80 : ................
40140 : __ __ __ BYT 7f 7f 7f 80 80 80 80 7f 80 80 7f 7f 80 7f 7f 80 : ................
40150 : __ __ __ BYT 7f 80 7f 80 80 80 7f 7f 80 80 80 80 80 80 80 80 : ................
40160 : __ __ __ BYT 80 80 7f 80 7f 80 80 7f 7f 80 7f 80 7f 7f 80 7f : ................
40170 : __ __ __ BYT 80 80 7f 7f 7f 7f 80 80 80 80 80 80 80 7f 80 7f : ................
40180 : __ __ __ BYT 80 7f 80 80 80 80 80 7f 7f 7f 7f 80 7f 80 7f 7f : ................
40190 : __ __ __ BYT 7f 80 80 7f 80 80 80 80 7f 80 7f 80 7f 80 7f 80 : ................
401a0 : __ __ __ BYT 7f 80 80 80 80 80 7f 7f 7f 80 80 80 7f 80 80 7f : ................
401b0 : __ __ __ BYT 7f 7f 80 7f 80 7f 80 80 7f 80 7f 80 7f 80 7f 80 : ................
401c0 : __ __ __ BYT 7f 80 7f 80 80 7f 80 7f 80 7f 80 7f 7f 7f 80 80 : ................
401d0 : __ __ __ BYT 80 7f 80 80 80 7f 80 7f 80 7f 7f 7f 7f 7f 7f 80 : ................
401e0 : __ __ __ BYT 80 80 7f 7f 7f 80 7f 7f 7f 7f 7f 7f 7f 7f 80 7f : ................
401f0 : __ __ __ BYT 80 80 80 7f 80 7f 80 80 7f 7f 7f 7f 7f 7f 80 7f : ................
40200 : __ __ __ BYT 7f 7f 7f 7f 7f 80 80 80 80 80 80 7f 80 80 80 80 : ................
40210 : __ __ __ BYT 80 80 7f 80 7f 7f 7f 7f 7f 80 7f 7f 7f 7f 7f 7f : ................
40220 : __ __ __ BYT 80 80 7f 7f 80 80 80 7f 7f 7f 7f 7f 7f 80 80 7f : ................
40230 : __ __ __ BYT 80 80 7f 7f 7f 80 80 80 7f 7f 7f 7f 7f 80 80 80 : ................
40240 : __ __ __ BYT 80 80 80 80 80 7f 7f 7f 7f 7f 80 7f 7f 7f 7f 7f : ................
40250 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 80 80 80 80 7f 7f : ................
40260 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 80 7f 7f 80 7f 7f 80 80 80 : ................
40270 : __ __ __ BYT 80 80 7f 7f 7f 7f 80 80 81 81 80 80 7f 7e 7d 7e : .............~}~
40280 : __ __ __ BYT 7e 7f 80 80 80 7f 7f 7f 7f 7f 7f 80 80 80 7f 7f : ~...............
40290 : __ __ __ BYT 80 7f 7f 80 80 80 80 80 80 80 80 7f 7f 7f 7f 7e : ...............~
402a0 : __ __ __ BYT 7f 81 81 80 80 80 7f 7e 7e 7e 7f 80 80 80 7f 80 : .......~~~......
402b0 : __ __ __ BYT 7f 80 80 81 81 80 80 80 80 7f 7f 7f 7f 7f 7f 7f : ................
402c0 : __ __ __ BYT 7f 80 80 7f 7f 7f 80 81 80 80 80 7f 7f 7f 7e 7f : ..............~.
402d0 : __ __ __ BYT 80 80 80 7f 7f 7f 7f 7f 7f 7f 7f 7f 80 7f 7f 80 : ................
402e0 : __ __ __ BYT 80 81 80 7f 7e 7e 7e 7e 7e 7f 80 80 80 80 80 7f : ....~~~~~.......
402f0 : __ __ __ BYT 80 80 7f 7e 7e 80 82 82 80 7f 7f 7f 7f 7e 7e 7e : ...~~........~~~
40300 : __ __ __ BYT 7f 81 83 83 82 7f 7d 7c 7d 7f 81 82 82 80 7f 7e : ......}|}......~
40310 : __ __ __ BYT 7d 7e 7e 7e 7e 7e 7f 7f 80 81 82 84 85 85 85 87 : }~~~~~..........
40320 : __ __ __ BYT 8a 8c 88 7f 77 72 71 71 70 6f 70 74 79 7d 80 84 : ....wrqqpopty}..
40330 : __ __ __ BYT 86 86 86 84 82 82 84 88 8e 97 9f a2 9d 91 83 73 : ...............s
40340 : __ __ __ BYT 66 5d 59 5b 61 69 70 71 70 6e 6c 6d 70 73 78 81 : f]Y[aipqpnlmpsx.
40350 : __ __ __ BYT 8d 9b a5 a9 a2 96 8a 81 7d 7d 83 8c 94 97 93 87 : ........}}......
40360 : __ __ __ BYT 77 65 54 4b 4a 4e 57 60 68 70 77 7e 81 7f 7d 7b : weTKJNW`hpw~..}{
40370 : __ __ __ BYT 7b 7d 81 88 93 a2 b0 b9 b9 b5 ac a1 97 8a 7c 6d : {}............|m
40380 : __ __ __ BYT 63 5f 60 65 6c 72 75 77 78 79 79 77 75 73 74 76 : c_`elruwxyywustv
40390 : __ __ __ BYT 7a 7f 84 89 90 98 a2 ab b3 b9 bc bc b7 ae a2 97 : z...............
403a0 : __ __ __ BYT 8d 82 75 66 57 4b 46 48 4e 56 5d 63 6b 73 7f 8e : ..ufWKFHNV]cks..
403b0 : __ __ __ BYT 9e aa b1 b3 af a9 a3 9c 95 8c 85 7c 72 66 5c 53 : ...........|rf\S
403c0 : __ __ __ BYT 4d 4a 4b 50 57 5d 64 6c 74 7c 84 8c 95 9d a2 a3 : MJKPW]dlt|......
403d0 : __ __ __ BYT a0 9c 96 8f 87 7d 72 66 61 62 68 71 7a 83 87 8a : .....}rfabhqz...
403e0 : __ __ __ BYT 8c 8f 8d 89 84 7e 7b 7a 7c 7c 7a 78 79 7b 7c 7a : .....~{z||zxy{|z
403f0 : __ __ __ BYT 76 70 6b 67 64 64 68 6c 70 76 7f 8a 97 a2 a8 a7 : vpkgddhlpv......
40400 : __ __ __ BYT a0 98 91 8b 84 7c 75 71 6d 67 62 62 64 66 68 69 : .....|uqmgbbdfhi
40410 : __ __ __ BYT 67 65 64 66 68 6b 71 78 7f 88 93 9f aa b1 b2 ac : gedfhkqx........
40420 : __ __ __ BYT a2 97 8e 85 7c 71 69 66 65 65 63 62 69 71 77 79 : ....|qifeecbiqwy
40430 : __ __ __ BYT 79 75 6e 6b 6f 75 7d 89 96 a3 a8 a3 9b 91 85 79 : yunkou}........y
40440 : __ __ __ BYT 6f 67 61 5f 64 70 80 92 a2 ab ab aa aa a7 a1 94 : oga_dp..........
40450 : __ __ __ BYT 7f 65 4a 38 35 3c 4b 5f 6f 7d 91 a8 b7 bc b9 ae : .eJ85<K_o}......
40460 : __ __ __ BYT 98 80 6d 5f 5b 67 83 a2 b4 b3 a6 95 88 76 5c 4b : ..m_[g.......v\K
40470 : __ __ __ BYT 4b 57 68 79 83 82 78 6c 67 6b 77 88 a0 b3 b2 9f : KWhy..xlgkw.....
40480 : __ __ __ BYT 87 7a 7a 85 9f b7 b9 ab 99 88 83 8b 99 9c 8e 76 : .zz............v
40490 : __ __ __ BYT 5e 4c 4d 60 71 73 6a 5f 59 60 77 8e 92 86 7e 84 : ^LM`qsj_Y`w...~.
404a0 : __ __ __ BYT 8f 9c ab ac 9a 89 85 8a 95 a2 a6 9b 8d 88 8c 96 : ................
404b0 : __ __ __ BYT 9f 95 75 59 56 5b 5b 61 66 5c 51 53 5e 6e 81 97 : ..uYV[[af\QS^n..
404c0 : __ __ __ BYT a3 9a 81 71 72 7d 94 ad b8 b2 a6 98 8c 89 8e 95 : ...qr}..........
404d0 : __ __ __ BYT 9e a5 9e 82 64 4b 31 22 2e 44 51 62 7e 98 a6 a3 : ....dK1".DQb~...
404e0 : __ __ __ BYT 90 79 6b 68 6e 7a 8f a8 b6 b6 b2 a3 89 72 5a 39 : .ykhnz.......rZ9
404f0 : __ __ __ BYT 27 31 49 5f 71 82 99 b2 c2 c7 c0 ae a0 92 79 5d : '1I_q.........y]
40500 : __ __ __ BYT 43 31 39 52 61 6d 83 96 9b 9e a3 a5 a2 99 8e 81 : C19Ram..........
40510 : __ __ __ BYT 75 6f 6f 6f 6f 65 58 59 60 63 67 6f 73 76 86 a0 : uooooeXY`cgosv..
40520 : __ __ __ BYT af ab 9c 8c 82 81 89 92 96 90 83 73 65 53 4f 66 : ...........seSOf
40530 : __ __ __ BYT 7b 7c 76 6b 5d 5b 6a 76 78 83 94 91 83 7f 82 8d : {|vk][jvx.......
40540 : __ __ __ BYT a4 b8 b4 a1 96 94 8b 7e 72 5c 3c 2f 39 40 4b 66 : .......~r\</9@Kf
40550 : __ __ __ BYT 7a 7d 82 8b 9a ac b1 a6 8e 77 7a 91 a4 a7 a2 96 : z}.......wz.....
40560 : __ __ __ BYT 7f 67 5a 54 5a 65 62 5a 59 5f 6a 74 7b 88 93 8d : .gZTZebZY_jt{...
40570 : __ __ __ BYT 7e 76 7d 92 ac c2 ca b4 8b 6c 5d 50 47 47 4e 5d : ~v}......l]PGGN]
40580 : __ __ __ BYT 6d 7f 8b 89 7f 74 66 69 7f 91 a1 b5 c0 b9 a9 97 : m....tfi........
40590 : __ __ __ BYT 85 71 54 39 35 46 5c 72 82 92 ab b9 b4 a9 99 84 : .qT95F\r........
405a0 : __ __ __ BYT 78 77 79 79 7a 7d 80 80 7d 7b 78 76 77 7e 87 8a : xwyyz}..}{xvw~..
405b0 : __ __ __ BYT 82 75 75 7e 83 86 86 81 7c 79 75 6f 6a 70 7c 87 : .uu~....|yuojp|.
405c0 : __ __ __ BYT 98 ac b5 b5 b0 a8 a1 8b 64 46 33 28 35 55 70 91 : ........dF3(5Up.
405d0 : __ __ __ BYT b9 cb cb cc c3 ae 99 84 76 6e 61 56 56 55 56 57 : ........vnaVVUVW
405e0 : __ __ __ BYT 5b 71 87 83 75 78 87 9a af c2 c6 bb aa 9c 89 6b : [q..ux.........k
405f0 : __ __ __ BYT 4b 39 3f 59 78 93 ad bc b0 96 79 64 68 7b 90 9f : K9?Yx.....ydh{..
40600 : __ __ __ BYT 9b 93 8d 77 59 54 65 72 7d 91 a3 ad ad 96 7c 78 : ...wYTer}.....|x
40610 : __ __ __ BYT 7b 84 92 8e 7c 63 44 35 41 57 7a a2 b8 bd ba aa : {...|cD5AWz.....
40620 : __ __ __ BYT 90 82 82 83 80 6b 48 37 49 66 7b 96 ad a1 86 7e : .....kH7If{....~
40630 : __ __ __ BYT 81 88 96 9c 89 69 5c 6a 7b 8d a1 9c 82 6e 69 73 : .....i\j{....nis
40640 : __ __ __ BYT 84 84 6b 56 61 83 ab cb c9 a7 7f 6f 76 6a 47 48 : ..kVa......ovjGH
40650 : __ __ __ BYT 74 9b 9f 89 8c ad ad 84 62 5e 60 5b 66 8c a1 8d : t.......b^`[f...
40660 : __ __ __ BYT 77 77 65 4e 68 89 91 ae ca b4 97 81 58 3e 44 5e : wweNh.......X>D^
40670 : __ __ __ BYT 86 a4 b0 b4 9c 76 67 61 5d 73 91 9f aa 9d 6d 53 : .....vga]s....mS
40680 : __ __ __ BYT 4e 50 7c a2 97 95 8f 63 58 75 83 90 ac ab 76 47 : NP|....cXu....vG
40690 : __ __ __ BYT 53 6a 69 7b 95 85 60 5c 84 b0 ab 88 7b 83 74 53 : Sji{..`\....{.tS
406a0 : __ __ __ BYT 53 7e a5 9d 6f 48 4c 74 9b a7 8c 5e 4e 6f a2 b8 : S~..oHLt...^No..
406b0 : __ __ __ BYT 9b 6a 55 63 7c 83 7a 80 9b aa 94 62 43 58 84 87 : .jUc|.z....bCX..
406c0 : __ __ __ BYT 78 96 b1 8f 66 6e 81 7e 82 92 88 87 a1 94 6b 60 : x...fn.~......k`
406d0 : __ __ __ BYT 5f 65 7e 8c 97 a0 99 97 90 76 63 56 56 72 8c 98 : _e~......vcVVr..
406e0 : __ __ __ BYT 9d 9c 8b 70 6a 6d 75 88 88 85 85 6c 6b 84 89 8f : ...pjmu....lk...
406f0 : __ __ __ BYT 90 7b 6e 6b 70 87 9a 88 68 6c 80 7e 7a 7c 78 76 : .{nkp...hl.~z|xv
40700 : __ __ __ BYT 80 8b 7d 5f 5c 7b 98 97 7e 6c 70 79 7e 87 8d 83 : ..}_\{..~lpy~...
40710 : __ __ __ BYT 70 69 77 84 7f 6d 62 75 90 92 8c 8f 89 73 67 73 : piw..mbu.....sgs
40720 : __ __ __ BYT 84 88 84 86 8e 89 7a 6e 6a 6e 76 87 97 92 8b 8d : ......znjnv.....
40730 : __ __ __ BYT 8f 8b 7b 70 71 73 7f 8d 8c 88 8b 91 91 7d 6a 6b : ..{pqs.......}jk
40740 : __ __ __ BYT 6e 74 84 8b 88 8b 91 8d 7c 74 70 63 6d 89 88 7c : nt......|tpcm..|
40750 : __ __ __ BYT 8a 97 8a 79 6e 6b 7b 8f 94 8d 7c 6e 71 7e 86 89 : ...ynk{...|nq~..
40760 : __ __ __ BYT 89 7c 6a 6b 77 87 92 86 78 77 78 81 8b 84 78 78 : .|jkw...xwx...xx
40770 : __ __ __ BYT 7f 88 8a 78 68 75 8d 95 83 73 79 7f 81 80 73 6d : ...xhu...sy...sm
40780 : __ __ __ BYT 72 80 8a 81 7a 7d 80 84 81 75 6f 77 86 87 7b 79 : r...z}...uow..{y
40790 : __ __ __ BYT 82 85 7a 71 77 81 86 82 7c 7f 83 7f 7c 7c 7c 7f : ..zqw...|...|||.
407a0 : __ __ __ BYT 7e 77 78 80 81 80 7e 7f 86 82 78 78 7f 86 83 7d : ~wx...~...xx...}
407b0 : __ __ __ BYT 7d 82 82 7c 79 7c 7f 81 7c 7a 7f 7f 7c 7b 78 77 : }..|y|..|z..|{xw
407c0 : __ __ __ BYT 79 7d 81 83 81 7e 7f 82 7f 7b 7d 7f 81 80 82 83 : y}...~...{}.....
407d0 : __ __ __ BYT 80 7e 7e 80 7f 7e 81 82 7e 80 83 81 83 83 82 84 : .~~..~..~.......
407e0 : __ __ __ BYT 83 7d 7c 80 80 7e 80 81 7c 7c 80 7e 79 79 7d 82 : .}|..~..||.~yy}.
407f0 : __ __ __ BYT 82 83 85 85 86 87 89 8d 8c 89 8d 8b 80 7a 7c 7b : .............z|{
40800 : __ __ __ BYT 78 79 7a 7a 7c 7c 78 75 71 71 77 7a 7f 87 87 86 : xyzz||xuqqwz....
40810 : __ __ __ BYT 8a 89 88 85 84 8d 90 8e 8d 88 81 85 8a 86 80 7b : ...............{
40820 : __ __ __ BYT 70 6b 7a 90 9b 93 7d 69 63 6d 80 8f 8d 79 61 62 : pkz...}icm...yab
40830 : __ __ __ BYT 79 88 8b 88 7d 73 76 85 93 95 90 88 79 73 79 82 : y...}sv.....ysy.
40840 : __ __ __ BYT 88 89 8a 90 92 90 8a 86 7e 6d 63 70 86 92 89 76 : ........~mcp...v
40850 : __ __ __ BYT 64 5d 6d 8b 97 83 6a 6f 89 9a 98 8f 8e 95 95 87 : d]m...jo........
40860 : __ __ __ BYT 7c 7f 83 7b 69 5a 5b 6e 81 86 7c 75 74 6e 6b 7d : |..{iZ[n..|utnk}
40870 : __ __ __ BYT 94 99 89 7d 89 a0 a5 99 8e 8f 98 a0 a0 93 7e 72 : ...}..........~r
40880 : __ __ __ BYT 78 83 81 74 6b 69 67 62 5f 66 73 7d 80 76 6a 6a : x..tkigb_fs}.vjj
40890 : __ __ __ BYT 77 8c 98 91 84 7e 7c 83 94 9e 9a 8c 80 7c 82 90 : w....~|......|..
408a0 : __ __ __ BYT 9d a0 95 84 84 95 99 8c 80 7c 7e 7c 73 70 70 6c : .........|~|sppl
408b0 : __ __ __ BYT 6f 76 74 6b 66 68 68 63 64 6f 79 7a 74 6e 69 6e : ovtkfhhcdoyztnin
408c0 : __ __ __ BYT 7f 8a 8c 8a 88 8e 98 9e 9f 9c 96 8f 8b 8f 92 8d : ................
408d0 : __ __ __ BYT 84 81 81 7c 6f 67 71 84 8f 8d 83 7a 71 69 6b 75 : ...|ogq....zqiku
408e0 : __ __ __ BYT 79 7a 7a 79 7c 81 7a 6a 66 72 7d 7a 6d 66 70 80 : yzzy|.zjfr}zmfp.
408f0 : __ __ __ BYT 83 78 6d 6f 7c 89 91 95 95 94 94 95 93 94 9b a1 : .xmo|...........
40900 : __ __ __ BYT 9f 98 91 8a 81 75 6e 73 7e 81 79 70 71 76 71 63 : .....uns~.ypqvqc
40910 : __ __ __ BYT 5c 65 75 76 6c 66 6d 7e 8c 8e 80 72 72 79 82 8d : \euvlfm~...rry..
40920 : __ __ __ BYT 93 94 91 8d 8e 94 91 8a 88 88 86 81 73 66 67 76 : ............sfgv
40930 : __ __ __ BYT 7e 78 71 6f 6c 70 7c 88 89 7b 6a 63 68 73 7a 7f : ~xqolp|..{jchsz.
40940 : __ __ __ BYT 89 8e 87 7b 74 7c 8d 9b 9d 95 8b 81 79 7f 8a 82 : ...{t|......y...
40950 : __ __ __ BYT 71 73 88 99 92 7b 6a 6f 83 90 8a 78 66 5f 62 6f : qs...{jo...xf_bo
40960 : __ __ __ BYT 7f 86 85 86 88 85 7b 76 77 77 76 7a 80 86 8d 94 : ......{vwwvz....
40970 : __ __ __ BYT 90 83 76 71 77 82 82 74 66 64 6a 77 84 81 79 7f : ..vqw..tfdjw..y.
40980 : __ __ __ BYT 96 ab af a4 91 83 84 8b 88 76 63 5d 68 79 7d 71 : .........vc]hy}q
40990 : __ __ __ BYT 62 60 68 6d 70 7a 88 93 97 93 8c 80 75 7b 92 9d : b`hmpz......u{..
409a0 : __ __ __ BYT 8a 6c 65 79 8d 83 65 59 69 86 97 89 6c 5e 6f 8d : .ley..eYi...l^o.
409b0 : __ __ __ BYT a1 a1 90 7c 7b 8e a2 a5 9a 8f 86 7e 73 6c 73 82 : ...|{......~sls.
409c0 : __ __ __ BYT 86 76 64 63 65 64 6b 7c 80 6d 5f 6c 86 93 8d 88 : .vdcedk|.m_l....
409d0 : __ __ __ BYT 92 9f a1 94 82 75 78 87 94 91 85 78 6e 6d 77 87 : .....ux....xnmw.
409e0 : __ __ __ BYT 8f 8d 84 7f 7a 6f 64 63 6e 7c 83 80 7e 87 96 99 : ....zodcn|..~...
409f0 : __ __ __ BYT 8c 7e 7c 84 94 a7 a5 8a 6f 67 6e 77 7b 71 5e 56 : .~|.....ognw{q^V
40a00 : __ __ __ BYT 68 85 96 91 7d 6d 73 86 8c 82 7b 7f 8a 8e 88 7e : h...}ms...{....~
40a10 : __ __ __ BYT 75 6d 6b 73 7d 80 7f 82 88 82 72 64 66 76 8f a1 : umks}.....rdfv..
40a20 : __ __ __ BYT 99 76 59 60 85 a5 aa 9a 85 77 79 80 80 7d 7e 7e : .vY`.....wy..}~~
40a30 : __ __ __ BYT 75 69 61 60 66 75 85 8b 85 79 6e 6b 77 88 96 a0 : uia`fu...ynkw...
40a40 : __ __ __ BYT a8 aa 9f 8a 7a 79 85 8f 8d 7e 6a 5d 61 71 74 68 : ....zy...~j]aqth
40a50 : __ __ __ BYT 62 6c 78 80 82 82 85 8c 97 9b 92 81 71 6d 79 90 : blx.........qmy.
40a60 : __ __ __ BYT 9e 96 87 80 81 7d 76 76 83 92 96 8b 78 73 82 96 : .....}vv....xs..
40a70 : __ __ __ BYT 97 8d 85 80 75 6d 72 7b 7a 6e 60 5b 66 75 7d 7d : ....umr{zn`[fu}}
40a80 : __ __ __ BYT 7d 86 96 9b 8f 86 8d 99 9a 91 89 88 8c 8a 7c 6a : }.............|j
40a90 : __ __ __ BYT 60 60 69 7a 8b 90 87 7b 73 6e 72 7e 8b 8e 8b 8c : ``iz...{snr~....
40aa0 : __ __ __ BYT 8e 8b 81 77 71 72 7c 87 85 73 67 70 80 86 85 87 : ...wqr|..sgp....
40ab0 : __ __ __ BYT 8b 89 85 81 82 83 7e 75 73 77 7b 7a 7a 7e 85 89 : ......~usw{zz~..
40ac0 : __ __ __ BYT 85 7d 7a 7f 86 85 7a 71 74 80 86 87 8b 8c 84 7e : .}z...zqt......~
40ad0 : __ __ __ BYT 85 90 8b 7c 75 7e 8d 92 89 7d 78 7b 81 88 8c 8b : ...|u~...}x{....
40ae0 : __ __ __ BYT 88 86 81 71 5d 59 67 74 72 68 68 75 7d 78 71 6f : ...q]Ygtrhhu}xqo
40af0 : __ __ __ BYT 72 7a 88 91 90 8b 87 87 89 90 98 9d 9d 99 96 91 : rz..............
40b00 : __ __ __ BYT 83 71 66 6c 7b 84 7b 6b 6a 7b 8d 93 8a 76 68 6c : .qfl{.{kj{...vhl
40b10 : __ __ __ BYT 7a 7c 70 67 6c 76 7a 7a 7a 7d 83 8e 97 96 8a 7a : z|pglvzzz}.....z
40b20 : __ __ __ BYT 74 7d 90 9b 95 85 7c 7f 81 7b 75 7b 86 8d 8e 8d : t}....|..{u{....
40b30 : __ __ __ BYT 8a 86 7f 78 75 80 8e 8c 76 60 5c 65 6f 79 86 8c : ...xu...v`\eoy..
40b40 : __ __ __ BYT 84 74 67 67 78 8e 99 96 8f 8d 91 95 93 8d 84 78 : .tggx..........x
40b50 : __ __ __ BYT 6e 6d 76 7f 81 7f 7b 76 74 78 83 90 93 87 79 7e : nmv...{vtx....y~
40b60 : __ __ __ BYT 8e 8f 7a 6a 73 89 91 87 7f 84 8e 91 8c 81 75 6f : ..zjs.........uo
40b70 : __ __ __ BYT 70 71 73 72 6c 61 5c 60 69 76 84 8c 8b 88 8a 90 : pqsrla\`iv......
40b80 : __ __ __ BYT 94 94 91 8a 84 82 82 81 81 82 80 76 70 78 88 8e : ...........vpx..
40b90 : __ __ __ BYT 84 76 73 7c 87 8b 86 7d 79 7e 84 80 75 6d 6c 70 : .vs|...}y~..umlp
40ba0 : __ __ __ BYT 74 75 76 7a 80 84 89 90 94 94 8e 81 71 68 70 83 : tuvz........qhp.
40bb0 : __ __ __ BYT 93 95 89 7a 72 72 78 81 87 84 77 6c 6e 7f 8f 92 : ...zrrx...wln...
40bc0 : __ __ __ BYT 86 76 72 7b 87 8b 85 7b 79 84 92 93 87 7a 76 77 : .vr{...{y....zvw
40bd0 : __ __ __ BYT 78 75 73 74 75 74 73 73 79 80 7f 74 6b 71 81 8c : xustutssy..tkq..
40be0 : __ __ __ BYT 8c 88 87 8a 89 81 7a 77 7b 83 8b 91 96 93 87 7c : ......zw{......|
40bf0 : __ __ __ BYT 7a 80 83 7d 70 65 5f 66 77 85 83 73 67 69 75 80 : z..}pe_fw..sgiu.
40c00 : __ __ __ BYT 7f 75 70 78 89 96 9c 9e 9e 9b 92 87 85 8c 8f 89 : .upx............
40c10 : __ __ __ BYT 80 7a 79 7a 78 72 6c 65 60 64 71 80 87 81 77 72 : .zyzxrle`dq...wr
40c20 : __ __ __ BYT 73 78 81 87 84 7e 7f 86 90 94 91 8b 88 89 87 7e : sx...~.........~
40c30 : __ __ __ BYT 72 6e 73 78 7c 86 94 9a 90 7d 70 6f 6f 6d 71 83 : rnsx|....}poomq.
40c40 : __ __ __ BYT 92 91 87 81 81 84 83 7a 74 78 83 88 86 84 89 8e : .......ztx......
40c50 : __ __ __ BYT 88 79 6d 69 68 6b 73 7f 87 89 8a 8f 95 92 86 79 : .ymihks........y
40c60 : __ __ __ BYT 70 6e 73 7e 88 88 80 82 90 9a 90 7e 72 72 76 79 : pns~.......~rrvy
40c70 : __ __ __ BYT 7a 7b 7f 86 8a 84 76 6d 6e 6f 70 79 85 8a 88 86 : z{....vmnopy....
40c80 : __ __ __ BYT 84 84 85 86 81 75 6b 72 89 9f a7 a5 9b 8a 7b 74 : .....ukr......{t
40c90 : __ __ __ BYT 71 6a 62 62 6e 81 93 99 92 87 7c 75 6e 66 5f 63 : qjbbn.....|unf_c
40ca0 : __ __ __ BYT 73 88 99 9b 8b 75 6a 71 83 8e 89 81 8b 9d a2 95 : s....ujq........
40cb0 : __ __ __ BYT 83 79 78 77 73 6e 6c 75 89 95 8f 82 7c 7c 78 6d : .yxwsnlu....||xm
40cc0 : __ __ __ BYT 67 6a 73 81 95 a0 9a 8d 84 7f 80 86 85 75 65 67 : gjs..........ueg
40cd0 : __ __ __ BYT 7c 8e 90 87 7f 78 6f 65 64 6d 7a 87 8f 8f 85 79 : |....xoedmz....y
40ce0 : __ __ __ BYT 72 73 7b 84 85 81 7f 82 8b 90 8e 8c 8a 83 7a 76 : rs{...........zv
40cf0 : __ __ __ BYT 79 80 86 89 87 83 80 7f 81 83 7e 71 69 73 85 93 : y.........~qis..
40d00 : __ __ __ BYT 94 8a 7a 70 72 79 7d 7b 7b 82 8f 96 8e 7b 6c 6c : ..zpry}{{....{ll
40d10 : __ __ __ BYT 7d 8d 8f 87 83 88 8f 8c 7e 6d 66 68 6e 78 82 86 : }.......~mfhnx..
40d20 : __ __ __ BYT 7f 72 6b 71 79 76 6f 6f 7a 86 88 83 82 8b 96 97 : .rkqyvooz.......
40d30 : __ __ __ BYT 8b 7b 75 7a 7e 7f 84 8e 95 91 88 87 87 7e 6d 66 : .{uz~........~mf
40d40 : __ __ __ BYT 6a 6d 6e 79 8b 99 9a 8f 7f 6f 66 62 65 70 81 92 : jmny.....ofbep..
40d50 : __ __ __ BYT 9c 95 85 7b 7a 7b 78 6b 5e 64 7e 98 a3 9d 8e 82 : ...{z{xk^d~.....
40d60 : __ __ __ BYT 7e 7a 73 6c 67 6c 81 99 a5 a5 9a 86 78 76 75 6e : ~zslgl......xvun
40d70 : __ __ __ BYT 69 72 87 99 9b 92 8a 7f 70 68 69 6d 6d 6e 78 89 : ir......phimmnx.
40d80 : __ __ __ BYT 94 92 8a 82 75 68 64 6b 7a 8a 92 91 8e 90 98 9c : ....uhdkz.......
40d90 : __ __ __ BYT 90 78 67 64 68 74 8a 9d 9f 92 8b 8d 8c 7b 62 57 : .xgdht.......{bW
40da0 : __ __ __ BYT 5f 75 8f 98 87 72 70 75 6e 60 5c 68 7b 89 8e 8f : _u...rpun`\h{...
40db0 : __ __ __ BYT 8f 90 97 9c 95 83 70 65 68 7c 96 a3 9c 89 78 6c : ......peh|....xl
40dc0 : __ __ __ BYT 68 6c 6e 6d 76 88 97 98 90 8c 8b 7f 6a 59 53 59 : hlnmv.......jYSY
40dd0 : __ __ __ BYT 6c 82 93 9b 9f 9b 8d 7d 74 73 6d 68 76 91 a2 a1 : l......}tsmhv...
40de0 : __ __ __ BYT 95 89 80 75 67 5c 59 63 77 90 a1 a3 9c 8c 76 65 : ...ug\Ycw.....ve
40df0 : __ __ __ BYT 62 6a 76 83 8c 8d 8d 8d 85 73 6a 73 83 87 77 63 : bjv......sjs..wc
40e00 : __ __ __ BYT 65 80 9a a5 a3 98 83 6c 63 6e 7c 79 6e 72 8d ab : e......lcn|ynr..
40e10 : __ __ __ BYT ad 94 73 62 64 6c 72 73 75 7f 93 a4 a4 95 81 72 : ..sbdlrsu......r
40e20 : __ __ __ BYT 71 6e 62 5e 72 8f a2 a3 98 95 95 89 73 62 63 72 : qnb^r.......sbcr
40e30 : __ __ __ BYT 82 8b 91 96 90 7c 70 74 7a 70 5f 5e 71 84 88 85 : .....|ptzp_^q...
40e40 : __ __ __ BYT 89 96 9c 93 82 6e 64 68 70 78 84 95 a2 a3 9a 8c : .....ndhpx......
40e50 : __ __ __ BYT 82 7b 70 6a 6d 72 77 80 8a 99 a6 a0 8a 73 5f 56 : .{pjmrw......s_V
40e60 : __ __ __ BYT 58 62 75 8d 98 96 8e 88 84 7d 6c 5f 65 7a 88 87 : Xbu......}l_ez..
40e70 : __ __ __ BYT 82 84 8f 95 91 87 77 66 63 6f 7d 82 85 93 a7 a8 : ......wfco}.....
40e80 : __ __ __ BYT 91 73 61 62 70 7e 81 7a 75 7b 8c 9f a1 90 78 67 : .sabp~.zu{....xg
40e90 : __ __ __ BYT 6a 7b 81 7a 78 84 97 a0 97 82 6e 60 5c 5f 66 70 : j{.zx.....n`\_fp
40ea0 : __ __ __ BYT 81 94 a2 a4 95 77 5d 57 60 6d 75 79 83 97 a9 ac : .....w]W`muy....
40eb0 : __ __ __ BYT 9c 7c 61 5a 63 72 84 90 91 8e 93 9b 95 7d 65 5d : .|aZcr.......}e]
40ec0 : __ __ __ BYT 67 76 7e 7f 86 97 a6 a5 92 74 5b 55 5f 75 85 86 : gv~......t[U_u..
40ed0 : __ __ __ BYT 80 86 9d af a5 85 67 59 59 66 77 81 88 96 a2 a2 : ......gYYfw.....
40ee0 : __ __ __ BYT 91 77 5d 50 54 67 82 93 8f 89 98 ab a7 8a 65 56 : .w]PTg........eV
40ef0 : __ __ __ BYT 62 77 8d 9a 95 85 79 83 9a 9c 7c 55 49 5a 6f 86 : bw....y...|UIZo.
40f00 : __ __ __ BYT 9b 9b 8d 86 86 82 6d 51 49 5a 72 85 8f 8e 84 80 : ......mQIZr.....
40f10 : __ __ __ BYT 93 a8 9e 7b 5e 5b 6b 83 99 9f 97 93 99 9a 82 60 : ...{^[k........`
40f20 : __ __ __ BYT 51 5a 73 96 a9 a3 90 7b 73 82 8a 75 59 4e 58 74 : QZs....{s..uYNXt
40f30 : __ __ __ BYT 94 9b 86 6f 72 90 a0 84 59 4d 5e 74 88 99 9c 8e : ...or...YM^t....
40f40 : __ __ __ BYT 7c 7d 91 8f 69 50 5d 75 84 8f 97 9b 9b 9b 9a 90 : |}..iP]u........
40f50 : __ __ __ BYT 7f 6b 5f 69 83 9b 9e 84 6f 7c 90 87 67 51 59 76 : .k_i....o|..gQYv
40f60 : __ __ __ BYT 87 82 7e 85 93 a3 a5 91 73 5f 5a 62 6c 6e 72 7b : ..~.....s_Zblnr{
40f70 : __ __ __ BYT 8b 9f a5 95 76 5a 58 71 8b 8e 7d 73 85 9e 9f 90 : ....vZXq..}s....
40f80 : __ __ __ BYT 83 81 80 79 6b 61 5e 62 71 8b 9b 9c 94 83 6e 67 : ...yka^bq.....ng
40f90 : __ __ __ BYT 68 62 5d 62 76 92 a1 a1 a3 a2 90 77 68 5f 5b 62 : hb]bv......wh_[b
40fa0 : __ __ __ BYT 78 98 a7 a1 9a 8e 76 66 65 67 64 5d 5f 75 92 a4 : x.....vfegd]_u..
40fb0 : __ __ __ BYT a9 a1 8b 73 65 66 69 62 60 72 8d 9e a4 a4 98 81 : ...sefib`r......
40fc0 : __ __ __ BYT 72 70 6b 5d 58 69 85 9e ad af a1 82 64 5d 68 6b : rpk]Xi......d]hk
40fd0 : __ __ __ BYT 6b 7b 91 9f a7 a9 a0 8a 74 76 7f 71 59 56 6b 88 : k{......tv.qYVk.
40fe0 : __ __ __ BYT a1 ac a5 8b 6c 60 69 6d 64 62 70 8c a7 b2 b0 a0 : ....l`imdbp.....
40ff0 : __ __ __ BYT 83 6e 6e 6c 5f 5a 65 82 a1 ae ad 9e 7c 5e 5d 69 : .nnl_Ze.....|^]i
41000 : __ __ __ BYT 6b 6f 77 81 98 b0 b9 af 93 79 70 6f 68 5f 5e 6a : kow......ypoh_^j
41010 : __ __ __ BYT 85 a4 b3 ac 91 6f 60 61 5c 55 61 75 85 95 a9 b7 : .....o`a\Uau....
41020 : __ __ __ BYT af 94 73 60 61 62 6a 7b 8a 96 a9 b6 b1 94 6f 5d : ..s`abj{......o]
41030 : __ __ __ BYT 5c 59 62 78 85 85 91 ae b6 9f 7d 67 66 66 68 6f : \Ybx......}gffho
41040 : __ __ __ BYT 6a 64 7d a9 b6 a0 80 63 59 59 5c 6b 7a 7e 87 a2 : jd}....cYY\kz~..
41050 : __ __ __ BYT b1 a1 85 69 5f 62 62 69 75 7b 88 a3 b5 ae 98 79 : ...i_bbiu{.....y
41060 : __ __ __ BYT 65 63 5e 57 5f 77 8d 9f ae ab 91 6d 58 5a 5e 63 : ec^W_w.....mXZ^c
41070 : __ __ __ BYT 75 90 9e a4 af ad 96 78 64 5c 56 59 6e 8c a3 aa : u......xd\VYn...
41080 : __ __ __ BYT a7 9f 8e 77 65 5e 57 55 62 7c 93 9e a7 a9 9c 83 : ...we^WUb|......
41090 : __ __ __ BYT 6d 61 57 52 60 7b 96 a7 ad a9 98 7e 6b 64 5d 57 : maWR`{.....~kd]W
410a0 : __ __ __ BYT 60 78 94 a5 a8 a2 93 7b 6d 6d 65 55 55 6e 91 a8 : `x.....{mmeUUn..
410b0 : __ __ __ BYT b0 a8 91 76 6b 6a 5d 4f 59 74 8e 9e ac b3 a2 85 : ...vkj]OYt......
410c0 : __ __ __ BYT 6f 6b 65 56 56 6b 89 a4 b0 b0 a0 86 6f 67 65 57 : okeVVk......ogeW
410d0 : __ __ __ BYT 54 68 87 a3 af b0 a4 88 6d 66 65 58 51 61 7d 94 : Th......mfeXQa}.
410e0 : __ __ __ BYT 9f aa af 9f 7e 65 62 5e 53 5c 78 93 a1 aa b1 a5 : ....~eb^S\x.....
410f0 : __ __ __ BYT 84 6a 65 5f 53 56 6b 87 98 9f aa b0 9f 7b 60 59 : .je_SVk......{`Y
41100 : __ __ __ BYT 52 4d 5e 81 98 9d a7 af a2 83 67 61 5b 4f 51 6b : RM^.......ga[OQk
41110 : __ __ __ BYT 8b 98 9d ab ad 92 72 63 5d 52 49 58 79 8f 9e ad : ......rc]RIXy...
41120 : __ __ __ BYT b1 a0 80 65 5c 57 4f 54 73 93 a1 a9 ad a3 89 6f : ...e\WOTs......o
41130 : __ __ __ BYT 65 62 53 4b 5c 7e 9a a3 a5 a5 98 7d 66 60 5d 54 : ebSK\~.....}f`]T
41140 : __ __ __ BYT 55 72 92 9f a5 ac a6 90 77 69 65 5c 53 60 82 a0 : Ur......wie\S`..
41150 : __ __ __ BYT ab a8 a1 91 77 66 63 5a 53 5c 77 91 99 9b a6 ab : ....wfcZS\w.....
41160 : __ __ __ BYT a0 88 70 66 61 57 5e 7b 96 a3 a6 aa a9 90 71 61 : ..pfaW^{......qa
41170 : __ __ __ BYT 5a 55 5a 75 90 9b a1 aa ae 9e 81 68 5e 5a 56 61 : ZUZu.......h^ZVa
41180 : __ __ __ BYT 7f 98 a3 a7 a9 9e 83 6d 65 5e 53 51 61 7d 94 9e : .......me^SQa}..
41190 : __ __ __ BYT a6 ab 9f 82 68 5f 5f 57 59 71 8e a0 a8 a8 9d 85 : ....h__WYq......
411a0 : __ __ __ BYT 72 69 62 58 52 5c 76 8d 98 9c a1 a3 98 80 6b 63 : ribXR\v.......kc
411b0 : __ __ __ BYT 5d 58 64 7e 93 9d a2 a7 a2 8b 72 65 5d 56 60 7e : ]Xd~......re]V`~
411c0 : __ __ __ BYT 9b a5 a4 a3 a2 99 82 68 5e 5b 50 53 6c 87 9b a5 : .......h^[PSl...
411d0 : __ __ __ BYT a6 a0 8b 71 61 5b 55 56 6e 8f a0 a1 a1 a7 9d 80 : ...qa[UVn.......
411e0 : __ __ __ BYT 67 61 5d 51 53 6b 85 97 a3 ab a7 8e 72 64 5f 56 : ga]QSk......rd_V
411f0 : __ __ __ BYT 55 6c 8c a0 a5 a9 a9 97 7c 6b 63 5a 52 59 70 8c : Ul......|kcZRYp.
41200 : __ __ __ BYT a2 aa ab a0 86 71 66 5f 57 54 60 7c 97 a7 ac a8 : .....qf_WT`|....
41210 : __ __ __ BYT 97 7d 6c 6a 63 55 53 6a 8c a4 aa a9 a2 93 84 76 : .}ljcUSj.......v
41220 : __ __ __ BYT 6b 5f 52 4f 63 85 a5 b2 a8 92 78 6a 6a 66 56 53 : k_ROc.....xjjfVS
41230 : __ __ __ BYT 67 87 9e a8 ab a2 96 8f 80 6c 64 5e 59 60 7a 9a : g........ld^Y`z.
41240 : __ __ __ BYT b0 ab 98 85 78 6e 60 54 56 63 7a 91 9b a4 af b0 : ....xn`TVcz.....
41250 : __ __ __ BYT a2 8a 77 72 6a 5b 5b 6f 8c a5 ae a6 96 83 72 64 : ..wrj[[o......rd
41260 : __ __ __ BYT 58 52 57 6a 89 9f aa b2 ae 96 79 6c 6e 6a 5b 52 : XRWj......ylnj[R
41270 : __ __ __ BYT 61 84 a5 af a2 89 71 65 62 5a 54 56 67 86 a2 ad : a.....qebZTVg...
41280 : __ __ __ BYT ab 9d 82 6e 6e 6a 5a 54 60 79 95 aa af a5 92 7d : ...nnjZT`y.....}
41290 : __ __ __ BYT 74 6e 63 59 59 69 88 a5 b0 a5 8d 77 75 7c 6f 58 : tncYYi.....wu|oX
412a0 : __ __ __ BYT 53 5f 78 94 a6 ad a9 98 81 78 79 6f 5f 58 5f 75 : S_x......xyo_X_u
412b0 : __ __ __ BYT 96 af b0 9a 7d 71 76 73 61 5a 67 80 98 a7 ae a8 : ....}qvsaZg.....
412c0 : __ __ __ BYT 90 7c 7b 7e 71 5f 5c 64 73 8f aa b3 a9 8f 75 71 : .|{~q_\ds.....uq
412d0 : __ __ __ BYT 78 76 6b 5e 5b 70 95 af ad 94 79 70 7f 87 75 5a : xvk^[p....yp..uZ
412e0 : __ __ __ BYT 51 61 7f 9b ad b3 ab 94 7c 72 6f 65 58 58 6d 8e : Qa......|roeXXm.
412f0 : __ __ __ BYT a9 ac 97 7c 77 87 87 6d 56 54 60 72 89 9d a4 a0 : ...|w..mVT`r....
41300 : __ __ __ BYT 98 8e 86 7b 66 56 55 60 7c 9f ab a1 93 85 80 7e : ...{fVU`|......~
41310 : __ __ __ BYT 6e 59 51 54 64 81 9b a5 a5 9e 89 78 74 6d 5b 50 : nYQTd......xtm[P
41320 : __ __ __ BYT 53 6a 8e a5 a9 a8 9c 83 73 6e 67 5d 55 5a 71 91 : Sj......sng]UZq.
41330 : __ __ __ BYT a8 af a7 92 7c 73 6d 60 53 55 6a 8d a9 b1 a9 97 : ....|sm`SUj.....
41340 : __ __ __ BYT 7e 74 77 6e 5e 57 60 7a 9c af ac 9a 82 73 74 70 : ~twn^W`z.....stp
41350 : __ __ __ BYT 61 56 58 6a 88 a5 b3 af 9a 7b 70 78 73 60 57 61 : aVXj.....{pxs`Wa
41360 : __ __ __ BYT 7e a0 af aa 9a 82 72 74 71 62 58 5a 6b 87 a3 b1 : ~.....rtqbXZk...
41370 : __ __ __ BYT ad 99 7d 70 75 72 64 59 61 7d 9b ad ac 9b 80 71 : ..}purdYa}.....q
41380 : __ __ __ BYT 73 6f 61 57 59 6c 89 a2 b0 ac 97 79 6e 72 69 5b : soaWYl.....ynri[
41390 : __ __ __ BYT 57 60 79 97 a9 ad a3 89 6e 6c 71 68 5a 56 63 82 : W`y.....nlqhZVc.
413a0 : __ __ __ BYT a0 ac a9 97 78 6a 71 6b 5a 55 5d 72 8f a4 ab a1 : ....xjqkZU]r....
413b0 : __ __ __ BYT 8a 72 6e 74 6c 5b 56 64 80 9b a8 a5 91 77 70 76 : .rntl[Vd.....wpv
413c0 : __ __ __ BYT 6d 5f 5a 5d 6f 8c a2 a9 a1 8b 78 74 74 6b 5f 59 : m_Z]o.....xttk_Y
413d0 : __ __ __ BYT 5f 79 99 ac ab 97 7c 73 76 70 63 5d 5e 6d 8c a7 : _y....|svpc]^m..
413e0 : __ __ __ BYT ae a6 8e 78 76 77 6b 61 5f 68 80 9e ae ac 98 7f : ...xvwka_h......
413f0 : __ __ __ BYT 75 79 77 6c 62 61 6f 8b a5 ae a2 89 74 76 7b 71 : uywlbao.....tv{q
41400 : __ __ __ BYT 68 64 66 7b 9c b1 b0 9f 84 78 7b 76 6e 67 61 6a : hdf{.....x{vngaj
41410 : __ __ __ BYT 86 a5 b3 a7 8b 74 74 79 72 6a 65 65 78 97 ac ae : .....ttyrjeex...
41420 : __ __ __ BYT 9f 88 76 73 73 70 6a 62 69 84 9e ab a7 92 7c 73 : ..vsspjbi.....|s
41430 : __ __ __ BYT 76 74 6b 62 5d 6b 87 a0 ae a8 95 81 77 77 76 6c : vtkb]k......wwvl
41440 : __ __ __ BYT 64 65 75 8e a6 ac 9d 86 77 75 76 6e 64 5f 66 7d : deu.....wuvnd_f}
41450 : __ __ __ BYT 95 a5 a7 97 84 7c 7b 78 6c 61 5f 67 7a 95 a8 a9 : .....|{xla_gz...
41460 : __ __ __ BYT 9f 8a 75 71 72 6b 63 62 71 8c a1 a8 9d 86 76 72 : ..uqrkcbq.....vr
41470 : __ __ __ BYT 72 6f 65 5c 5f 74 91 a4 a7 9c 88 75 71 70 64 5a : roe\_t.....uqpdZ
41480 : __ __ __ BYT 5e 6c 86 a0 a9 a1 8d 7d 77 73 6e 65 5c 60 73 8f : ^l.....}wsne\`s.
41490 : __ __ __ BYT a4 a9 9e 86 74 70 6e 65 5c 5b 65 7e 9f ae ac 9f : ....tpne\[e~....
414a0 : __ __ __ BYT 88 78 74 71 68 5d 5c 6a 89 a7 b2 ac 92 77 72 72 : .xtqh]\j.....wrr
414b0 : __ __ __ BYT 6a 5f 58 5e 75 96 ac af a5 8d 78 74 74 6b 60 5c : j_X^u.....xttk`\
414c0 : __ __ __ BYT 64 7d a0 b1 ab 94 7c 76 75 6c 62 5c 61 7a 9c af : d}....|vulb\az..
414d0 : __ __ __ BYT ae 9a 80 72 77 7a 72 67 5f 62 76 97 b0 ae 96 79 : ...rwzrg_bv....y
414e0 : __ __ __ BYT 6b 71 76 76 6e 61 63 7e 9e b1 aa 90 7b 72 6f 73 : kqvvnac~....{ros
414f0 : __ __ __ BYT 7c 78 6a 6b 85 a2 ac a0 87 75 75 7a 78 74 66 59 : |xjk.....uuzxtfY
41500 : __ __ __ BYT 64 81 9d a9 9e 8a 79 6e 6e 79 7c 6b 5f 75 9b af : d.....ynny|k_u..
41510 : __ __ __ BYT a6 8c 74 6a 6f 76 7e 79 5e 53 6d 91 aa a8 93 7a : ..tjov~y^Sm....z
41520 : __ __ __ BYT 65 64 7c 92 87 64 59 7b a4 ae 9f 89 70 67 70 7c : ed|..dY{....pgp|
41530 : __ __ __ BYT 7e 68 51 62 8c aa a9 8e 73 66 66 7c 98 90 66 50 : ~hQb....sff|..fP
41540 : __ __ __ BYT 67 91 ab a6 8a 6d 5d 6a 89 9e 8d 5f 4c 65 84 98 : g....m]j..._Le..
41550 : __ __ __ BYT 9f 9b 8a 6f 6a 8c 9f 7e 55 58 78 9a ac a5 8e 74 : ...oj..~UXx....t
41560 : __ __ __ BYT 67 7f 9e 95 68 4c 57 72 90 a6 a8 96 7e 72 82 96 : g...hLWr....~r..
41570 : __ __ __ BYT 87 5c 48 58 7a 9c ad a6 8e 72 6f 87 89 69 4e 51 : .\HXz....ro..iNQ
41580 : __ __ __ BYT 69 88 9f a8 a2 8f 77 76 8f 93 6f 4f 52 6d 92 ae : i.....wv..oORm..
41590 : __ __ __ BYT b3 a3 88 75 72 6d 5c 56 65 79 8d 9d a9 ae a0 81 : ...urm\Vey......
415a0 : __ __ __ BYT 71 81 8b 71 54 5a 78 96 ab b1 aa 93 76 6d 6a 59 : q..qTZx.....vmjY
415b0 : __ __ __ BYT 51 60 79 8f 98 9e ac ac 93 78 6e 6c 61 54 5c 76 : Q`y......xnlaT\v
415c0 : __ __ __ BYT 8d 9d a7 a5 95 79 62 5e 5b 5a 6b 83 98 a2 a0 9e : .....yb^[Zk.....
415d0 : __ __ __ BYT 99 87 72 68 6c 68 55 49 57 77 97 a7 a7 9a 7f 5f : ..rhlhUIWw....._
415e0 : __ __ __ BYT 55 57 55 5b 70 8d a6 aa a4 98 7f 6a 68 6d 68 59 : UWU[p......jhmhY
415f0 : __ __ __ BYT 51 62 82 9a a2 a4 9e 85 69 5e 5c 58 5d 70 88 a0 : Qb......i^\X]p..
41600 : __ __ __ BYT ac a1 8f 79 61 5a 5f 67 73 76 6f 77 8f a5 ac a5 : ...yaZ_gsvow....
41610 : __ __ __ BYT 90 75 62 5c 5c 6c 85 94 9d a8 a6 95 7e 67 59 5a : .ub\\l......~gYZ
41620 : __ __ __ BYT 6a 80 8f 83 6c 6f 8c a5 a5 93 7e 6b 60 5d 64 75 : j...lo....~k`]du
41630 : __ __ __ BYT 83 87 8f 94 94 96 8b 6d 58 5e 78 98 9e 7f 5f 5e : .......mX^x..._^
41640 : __ __ __ BYT 7a 9f aa 97 7f 66 53 54 61 72 85 8b 8c 94 a0 a2 : z....fSTar......
41650 : __ __ __ BYT 8a 64 55 68 89 9e 8b 60 53 73 9e b4 ad 96 7d 67 : .dUh...`Ss....}g
41660 : __ __ __ BYT 5c 5b 5f 6d 7c 91 a7 ae a4 93 7d 69 63 6d 82 8a : \[_m|.....}icm..
41670 : __ __ __ BYT 71 55 5e 83 a6 b0 a6 95 7b 5f 58 5e 68 7b 87 90 : qU^.....{_X^h{..
41680 : __ __ __ BYT a8 b9 af 9a 87 76 6e 6f 7c 8a 79 58 58 85 b2 ba : .....vno|.yXX...
41690 : __ __ __ BYT a9 91 79 69 61 59 5a 6b 84 a0 b2 ae 9a 81 6f 6a : ..yiaYZk......oj
416a0 : __ __ __ BYT 68 68 74 7d 6f 5f 75 a2 b2 ab 9f 89 77 6e 60 57 : hht}o_u.....wn`W
416b0 : __ __ __ BYT 5e 70 8c aa b5 a8 8f 79 76 7c 73 62 5c 5f 66 73 : ^p.....yv|sb\_fs
416c0 : __ __ __ BYT 88 9b a5 aa a3 92 7f 6d 61 60 67 78 95 ab ae 9e : .......ma`gx....
416d0 : __ __ __ BYT 83 6f 77 81 76 68 5f 5b 63 71 82 8e 95 a3 ae a5 : .ow.vh_[cq......
416e0 : __ __ __ BYT 8e 75 65 63 67 7d a3 b4 a3 85 71 72 7f 80 7b 6e : .uecg}....qr..{n
416f0 : __ __ __ BYT 58 51 5d 6f 83 8c 90 9f a9 a0 8a 70 63 62 62 6d : XQ]o.......pcbbm
41700 : __ __ __ BYT 8b a5 a4 90 7b 74 80 8b 8d 83 64 49 4c 5e 76 8d : ....{t....dIL^v.
41710 : __ __ __ BYT 94 9a a7 a8 94 78 66 5f 58 5a 70 8c 95 8c 92 a4 : .....xf_XZp.....
41720 : __ __ __ BYT a3 92 82 76 67 57 54 5f 73 89 94 9e ab a9 96 7e : ...vgWT_s......~
41730 : __ __ __ BYT 6c 64 60 62 71 8c 9f 9a 8e 88 85 84 7c 6b 5d 56 : ld`bq.......|k]V
41740 : __ __ __ BYT 56 60 71 83 92 9f a7 a3 96 87 7b 71 66 61 67 73 : V`q.......{qfags
41750 : __ __ __ BYT 8b 9f 9a 8d 8f 95 8e 79 69 64 64 63 65 72 88 98 : .......yiddcer..
41760 : __ __ __ BYT a1 a6 a6 9f 8c 72 67 69 6d 7a 90 a5 a7 99 96 9c : .....rgimz......
41770 : __ __ __ BYT 95 81 6d 61 5d 5c 63 75 89 98 a4 aa a5 99 85 75 : ..ma]\cu.......u
41780 : __ __ __ BYT 6e 65 5d 5d 6e 8d a3 a8 a3 95 83 77 6d 5f 56 55 : ne]]n......wm_VU
41790 : __ __ __ BYT 5e 74 89 96 a2 a7 9e 8c 74 67 62 58 55 65 80 96 : ^t......tgbXUe..
417a0 : __ __ __ BYT a2 ab a6 8d 76 6c 64 5a 50 4f 59 73 8a 95 a0 a8 : ....vldZPOYs....
417b0 : __ __ __ BYT 9e 86 6e 64 60 53 4e 5d 78 91 9e a3 a4 96 7b 68 : ..nd`SN]x.....{h
417c0 : __ __ __ BYT 64 5f 50 4a 53 67 82 93 9c a9 a6 8c 71 67 64 56 : d_PJSg......qgdV
417d0 : __ __ __ BYT 4b 56 73 8f 9c a1 a5 9e 87 70 68 6b 60 51 52 62 : KVs......phk`QRb
417e0 : __ __ __ BYT 7d 92 9d a9 af a2 87 73 6e 68 5a 54 64 82 96 9c : }......snhZTd...
417f0 : __ __ __ BYT 9f a4 a0 89 75 74 70 5d 54 5f 73 83 90 9b a6 ac : ....utp]T_s.....
41800 : __ __ __ BYT a1 8d 76 65 61 60 69 84 98 97 92 95 9b 96 89 7b : ..vea`i........{
41810 : __ __ __ BYT 6e 60 57 5b 6c 7a 82 8b 97 a3 a6 a1 90 76 65 65 : n`W[lz.......vee
41820 : __ __ __ BYT 72 8b 97 84 69 69 82 95 9e a1 93 79 64 5f 65 6a : r...ii.....yd_ej
41830 : __ __ __ BYT 6a 71 86 9b a5 a5 9d 8c 7a 72 6f 70 76 72 67 69 : jq......zropvrgi
41840 : __ __ __ BYT 7a 8c 97 98 8e 84 79 70 6f 6e 6d 6f 77 81 8a 8e : z.....yponmow...
41850 : __ __ __ BYT 91 8f 88 7f 7a 79 78 72 6d 6b 70 78 7e 83 87 8a : ....zyxrmkpx~...
41860 : __ __ __ BYT 87 82 7b 74 71 70 72 7b 83 8a 8e 91 94 8e 86 85 : ..{tqpr{........
41870 : __ __ __ BYT 80 78 77 77 78 7b 80 83 81 83 89 8c 89 83 80 81 : .xwwx{..........
41880 : __ __ __ BYT 81 80 7d 7a 7a 7e 86 8c 8b 85 7b 75 78 80 85 89 : ..}zz~....{ux...
41890 : __ __ __ BYT 8b 8a 86 80 78 76 78 79 7b 7f 81 83 86 85 7d 75 : ....xvxy{.....}u
418a0 : __ __ __ BYT 73 76 7b 81 87 8a 8c 8f 8f 8c 86 83 88 8d 8b 84 : sv{.............
418b0 : __ __ __ BYT 7b 72 71 77 7d 81 84 80 7b 7e 83 82 80 7e 7d 7f : {rqw}...{~...~}.
418c0 : __ __ __ BYT 84 8a 8c 86 76 67 68 73 7d 83 8c 93 92 85 70 60 : ....vghs}.....p`
418d0 : __ __ __ BYT 63 73 80 83 7c 7b 88 98 96 78 55 51 68 7b 7b 72 : cs..|{...xUQh{{r
418e0 : __ __ __ BYT 74 88 95 83 61 52 69 90 a7 9a 78 62 70 88 87 6d : t...aRi...xbp..m
418f0 : __ __ __ BYT 5d 6c 88 8f 7d 6a 68 6d 70 6f 76 87 99 9c 8b 72 : ]l..}jhmpov....r
41900 : __ __ __ BYT 66 75 8c 8d 7a 74 84 93 83 67 68 83 92 85 76 83 : fu..zt...gh...v.
41910 : __ __ __ BYT a2 b6 a7 7b 54 53 76 99 95 78 6c 88 aa a6 87 7d : ...{TSv..xl....}
41920 : __ __ __ BYT 92 a5 9c 7f 6c 70 81 88 7d 6d 6b 7f 9e ae 9e 82 : ....lp..}mk.....
41930 : __ __ __ BYT 7b 8b 98 98 94 92 8e 84 7e 7f 7c 72 72 84 9c a9 : {.......~.|rr...
41940 : __ __ __ BYT a6 99 88 7d 7b 7c 7d 87 9a a5 a0 8e 79 73 81 89 : ...}{|}.....ys..
41950 : __ __ __ BYT 7d 70 78 91 a7 a9 95 7e 76 7f 85 80 80 8d 95 8c : }px....~v.......
41960 : __ __ __ BYT 78 67 62 67 6b 6c 72 80 90 97 94 8f 8b 85 85 84 : xgbgklr.........
41970 : __ __ __ BYT 7a 6c 67 68 65 63 68 6d 68 67 78 8e 95 89 7c 7a : zlghechmhgx...|z
41980 : __ __ __ BYT 81 83 79 6c 6b 6e 63 4e 47 57 6e 80 89 8c 8f 9a : ..ylkncNGWn.....
41990 : __ __ __ BYT a6 a4 8e 74 6a 6e 6c 60 56 5a 65 64 5a 60 7b 95 : ...tjnl`VZedZ`{.
419a0 : __ __ __ BYT a2 a4 a3 a5 a7 a2 96 84 73 6a 65 5e 5c 64 6e 77 : ........sje^\dnw
419b0 : __ __ __ BYT 7c 82 95 ac b5 ab 99 8d 90 99 9a 90 7b 68 67 71 : |...........{hgq
419c0 : __ __ __ BYT 72 6e 6f 79 86 95 a5 ae a9 9a 8f 8a 86 81 89 9e : rnoy............
419d0 : __ __ __ BYT a7 94 76 69 75 7f 72 5e 5e 72 88 92 89 77 6b 71 : ..viu.r^^r...wkq
419e0 : __ __ __ BYT 82 8f 92 98 aa b0 9e 86 7e 83 88 7e 69 5d 60 6a : ........~..~i]`j
419f0 : __ __ __ BYT 6f 69 60 66 79 88 8a 86 8a 98 a1 9b 8d 87 8b 8f : oi`fy...........
41a00 : __ __ __ BYT 87 70 57 4e 53 56 51 4f 59 6e 81 83 77 6e 76 89 : .pWNSVQOYn..wnv.
41a10 : __ __ __ BYT 96 92 88 85 87 84 7a 68 58 57 5e 5b 4e 45 49 5b : ......zhXW^[NEI[
41a20 : __ __ __ BYT 70 76 6c 62 65 74 80 86 8a 94 a2 a5 98 84 77 77 : pvlbet........ww
41a30 : __ __ __ BYT 7a 71 5d 50 53 5d 5f 57 4f 4f 59 6c 7f 88 8a 93 : zq]PS]_WOOYl....
41a40 : __ __ __ BYT 9f a1 97 87 83 94 a4 9d 86 6a 52 4e 5d 66 60 57 : .........jRN]f`W
41a50 : __ __ __ BYT 57 62 6d 71 73 7a 82 89 90 97 a4 b3 bb b3 9e 85 : Wbmqsz..........
41a60 : __ __ __ BYT 78 81 93 8e 6e 4f 49 52 5c 60 62 63 69 7d 93 9b : x...nOIR\`bci}..
41a70 : __ __ __ BYT 9b a7 ba bf b1 a0 a1 b0 ad 90 72 65 62 61 5c 52 : ..........reba\R
41a80 : __ __ __ BYT 51 61 75 7b 6d 62 70 8d a3 ab a8 a4 ab af a1 8a : Qau{mbp.........
41a90 : __ __ __ BYT 86 98 a5 92 6d 5b 69 76 6b 51 45 53 73 8e 8b 75 : ....m[ivkQESs..u
41aa0 : __ __ __ BYT 6c 7e 92 92 87 8c aa bf b8 9d 83 7b 85 8b 7d 6c : l~.........{..}l
41ab0 : __ __ __ BYT 6c 76 78 6d 65 66 67 62 5f 67 75 88 9a a2 9e 95 : lvxmefgb_gu.....
41ac0 : __ __ __ BYT 9a a9 af a3 94 8e 8b 86 84 86 7f 67 54 53 5d 61 : ...........gTS]a
41ad0 : __ __ __ BYT 65 6e 79 82 8e 9b a4 a8 a9 a6 a4 ab b0 aa 9a 86 : eny.............
41ae0 : __ __ __ BYT 75 73 7e 84 75 5e 5e 77 91 98 8c 7c 7d 93 a3 9d : us~.u^^w...|}...
41af0 : __ __ __ BYT 91 8b 89 88 84 78 71 7a 8a 86 72 6d 7e 8e 8d 7e : .....xqz..rm~..~
41b00 : __ __ __ BYT 6d 6d 83 9b 94 75 64 6e 7c 7b 72 6e 7a 8a 85 6b : mm...udn|{rnz..k
41b10 : __ __ __ BYT 5d 6c 86 96 90 80 7c 8d 9b 91 73 5e 69 84 95 93 : ]l....|...s^i...
41b20 : __ __ __ BYT 8b 8a 89 7a 66 6b 8b a2 9d 83 6d 6d 83 97 8d 65 : ...zfk....mm...e
41b30 : __ __ __ BYT 43 4d 75 90 8c 78 6c 69 6a 75 89 a0 a8 96 72 61 : CMu..xliju....ra
41b40 : __ __ __ BYT 75 98 a4 8b 60 45 53 7f 9f 91 6d 5c 62 6c 74 80 : u...`ES...m\blt.
41b50 : __ __ __ BYT 8c 90 85 79 76 7b 80 7e 6e 5a 5e 7f a1 a5 87 6b : ...yv{.~nZ^....k
41b60 : __ __ __ BYT 6b 83 99 9d 93 81 70 71 80 87 7d 71 6a 63 5f 6a : k.....pq..}qjc_j
41b70 : __ __ __ BYT 80 88 73 51 47 5b 7c 95 a4 a7 98 7d 71 7c 8c 95 : ..sQG[|....}q|..
41b80 : __ __ __ BYT 9a 99 8c 7e 78 7a 7b 73 68 66 6e 7a 83 8b 91 92 : ...~xz{shfnz....
41b90 : __ __ __ BYT 8c 80 72 70 7d 8e 9c a1 92 70 5e 70 91 a9 b5 b8 : ..rp}....p^p....
41ba0 : __ __ __ BYT a7 88 7a 8b a6 b1 a8 91 7a 76 8c aa b1 95 6d 5d : ..z.....zv....m]
41bb0 : __ __ __ BYT 69 7a 87 96 a1 98 7e 6c 70 80 94 9e 95 83 7f 8b : iz....~lp.......
41bc0 : __ __ __ BYT 9c a2 99 8c 88 8d 90 8a 80 7a 79 77 70 6c 72 79 : .........zywplry
41bd0 : __ __ __ BYT 71 63 62 6a 70 74 74 6e 6a 70 82 97 9d 8f 7a 6f : qcbjpttnjp....zo
41be0 : __ __ __ BYT 78 8e 9d 9c 92 81 72 72 7d 86 83 79 6d 65 6a 82 : x.....rr}..ymej.
41bf0 : __ __ __ BYT 98 94 82 71 62 5c 66 75 7d 80 7d 71 64 5c 5c 67 : ...qb\fu}.}qd\\g
41c00 : __ __ __ BYT 7d 89 84 85 97 9a 7d 61 5c 62 6c 7e 8b 86 72 66 : }.....}a\bl~..rf
41c10 : __ __ __ BYT 6b 70 6d 72 87 9a 9b 90 82 75 6a 61 5e 69 84 9c : kpmr.....uja^i..
41c20 : __ __ __ BYT a0 93 7c 67 6e 90 a3 9b 92 92 93 90 87 75 6c 7b : ..|gn........ul{
41c30 : __ __ __ BYT 8f 8b 7d 7b 80 86 89 7f 72 7b 8b 82 69 5c 60 6f : ..}{....r{..i\`o
41c40 : __ __ __ BYT 81 89 85 87 94 9b 8e 78 6f 75 84 8e 8e 8b 86 78 : .......xou.....x
41c50 : __ __ __ BYT 69 67 6e 78 88 9a a0 94 89 8c 93 92 8b 83 7d 7f : ignx..........}.
41c60 : __ __ __ BYT 87 8c 8b 83 7c 80 89 87 83 86 8d 8b 82 81 88 89 : ....|...........
41c70 : __ __ __ BYT 88 8d 8f 87 7e 75 6e 70 77 83 91 94 87 7d 7b 76 : ....~unpw....}{v
41c80 : __ __ __ BYT 74 82 93 95 89 81 7d 78 75 70 63 5b 65 77 86 8c : t.....}xupc[ew..
41c90 : __ __ __ BYT 82 6e 61 61 6b 7b 86 85 7b 6e 65 62 67 70 75 74 : .naak{..{nebgput
41ca0 : __ __ __ BYT 72 75 7e 83 7b 6d 66 67 6d 7a 81 76 66 61 63 67 : ru~.{mfgmz.vfacg
41cb0 : __ __ __ BYT 71 7c 82 80 78 6e 67 63 60 66 75 80 7b 72 6f 6d : q|..xngc`fu.{rom
41cc0 : __ __ __ BYT 6e 75 7b 77 71 75 7f 81 76 65 5c 5e 67 75 89 96 : nu{wqu..ve\^gu..
41cd0 : __ __ __ BYT 8d 74 64 62 66 70 81 8b 81 6e 63 60 5c 59 5b 5f : .tdbfp...nc`\Y[_
41ce0 : __ __ __ BYT 6d 88 9b 9b 8a 71 5e 62 73 7b 80 8e 93 88 7e 7c : m....q^bs{....~|
41cf0 : __ __ __ BYT 70 65 73 86 83 79 78 76 6f 6d 68 61 64 78 8c 8f : pes..yxvomhadx..
41d00 : __ __ __ BYT 83 7b 85 91 8c 77 72 86 9d a2 94 82 83 95 97 81 : .{...wr.........
41d10 : __ __ __ BYT 75 87 a7 b3 9d 7b 6f 77 79 74 72 75 7e 8f 9c 98 : u....{owytru~...
41d20 : __ __ __ BYT 93 a4 b1 a0 88 91 ae be b6 9f 88 75 67 64 68 6a : ...........ugdhj
41d30 : __ __ __ BYT 6b 71 7c 84 8b 94 9c 97 87 81 95 b1 bc b4 a9 9b : kq|.............
41d40 : __ __ __ BYT 83 6c 69 70 70 6e 75 7f 87 89 81 72 65 62 72 8a : .lippnu....rebr.
41d50 : __ __ __ BYT 98 9a 9e a3 99 85 81 94 a4 9c 88 7e 86 8e 84 71 : ...........~...q
41d60 : __ __ __ BYT 69 6e 78 79 6e 64 6a 78 78 6f 74 89 99 94 7d 67 : inxyndjxxot...}g
41d70 : __ __ __ BYT 65 74 7e 79 74 78 80 83 7e 74 6a 64 5f 60 6c 7c : et~ytx..~tjd_`l|
41d80 : __ __ __ BYT 85 80 75 6c 63 5c 5d 68 75 7c 7b 7a 7b 7e 82 83 : ..ulc\]hu|{z{~..
41d90 : __ __ __ BYT 7c 75 7d 8e 94 83 6f 6b 71 6f 68 6b 7b 8d 91 89 : |u}...okqohk{...
41da0 : __ __ __ BYT 80 7c 82 92 a1 a3 a2 a9 b2 a9 91 83 8c 98 98 92 : .|..............
41db0 : __ __ __ BYT 8d 8b 89 88 8d 9a a4 a9 ac a8 97 89 8b 96 9c 99 : ................
41dc0 : __ __ __ BYT 98 9c 9f 9e 99 8a 7c 7a 87 9c ae b1 ac a4 94 7f : ......|z........
41dd0 : __ __ __ BYT 6f 68 67 6a 72 7b 87 94 a0 9f 91 85 82 82 85 8f : ohgjr{..........
41de0 : __ __ __ BYT 9f ae b1 a1 8a 78 6c 64 69 7c 8f 93 8e 8f 8e 7f : .....xldi|......
41df0 : __ __ __ BYT 6d 6b 76 7c 7a 7a 7f 80 7c 7a 7c 7a 77 7f 92 9d : mkv|zz..|z|zw...
41e00 : __ __ __ BYT 96 89 85 89 8b 8d 95 a0 a1 98 93 98 a4 ae b3 ae : ................
41e10 : __ __ __ BYT a3 9f a6 ac a7 a0 9d 9e 9f 96 87 7e 84 8c 90 99 : ...........~....
41e20 : __ __ __ BYT a6 ad ab a5 9a 8a 81 85 89 87 85 89 8b 82 6d 5e : ..............m^
41e30 : __ __ __ BYT 67 7a 82 7b 76 7c 86 8f 95 92 83 72 6e 73 78 79 : gz.{v|.....rnsxy
41e40 : __ __ __ BYT 7e 85 87 7c 75 7a 7f 79 6d 61 59 5a 63 6c 6b 5b : ~..|uz.ymaYZclk[
41e50 : __ __ __ BYT 4a 41 3f 44 53 5e 5b 4e 48 4b 4b 48 4d 52 4d 46 : JA?DS^[NHKKHMRMF
41e60 : __ __ __ BYT 49 4f 4f 4d 50 58 5f 65 6c 6f 68 63 67 6d 6f 72 : IOOMPX_elohcgmor
41e70 : __ __ __ BYT 74 6f 66 61 63 67 65 60 5d 63 70 77 72 69 62 5f : tofacge`]cpwrib_
41e80 : __ __ __ BYT 61 63 5f 56 50 4e 4b 42 33 27 26 2f 37 3b 3c 3e : ac_VPNKB3'&/7;<>
41e90 : __ __ __ BYT 40 42 46 4b 51 56 58 56 57 5b 60 63 62 5f 5d 60 : @BFKQVXVW[`cb_]`
41ea0 : __ __ __ BYT 6a 78 7f 7e 81 8d 98 9e a2 a3 a3 aa b3 b3 af b1 : jx.~............
41eb0 : __ __ __ BYT b4 ae a7 aa b1 b2 b0 ac a7 a6 a5 9b 8d 84 86 8f : ................
41ec0 : __ __ __ BYT 94 8a 7f 81 82 75 66 67 73 77 6b 5e 5c 5f 5d 5a : .....ufgswk^\_]Z
41ed0 : __ __ __ BYT 60 69 69 64 64 64 5c 59 5f 61 5d 61 6b 72 74 73 : `iiddd\Y_a]akrts
41ee0 : __ __ __ BYT 75 7b 82 8a 91 98 9e a0 a0 a3 a4 9d 92 88 85 8e : u{..............
41ef0 : __ __ __ BYT 99 9a 93 8d 8c 8b 88 81 79 71 6f 76 7a 77 71 6e : ........yqovzwqn
41f00 : __ __ __ BYT 6a 63 5b 5b 6b 7d 84 7f 79 76 76 76 74 72 75 76 : jc[[k}..yvvvtruv
41f10 : __ __ __ BYT 70 6b 71 79 7e 87 93 92 88 8d a1 af ae ac b0 b5 : pkqy~...........
41f20 : __ __ __ BYT b2 a9 a4 a2 a7 b5 c1 bf b8 ba bd b3 a3 9d a0 a1 : ................
41f30 : __ __ __ BYT 9e 9f a2 a4 a4 a4 a3 a1 97 85 76 75 81 90 95 8b : ..........vu....
41f40 : __ __ __ BYT 82 84 8d 95 98 98 94 8d 87 82 83 89 90 8d 86 84 : ................
41f50 : __ __ __ BYT 85 89 92 9e a4 a7 a8 a9 ac ad a6 9d 94 88 7f 83 : ................
41f60 : __ __ __ BYT 92 a4 b0 ae 9b 86 7c 7c 84 93 9c 96 8e 96 a3 a3 : ......||........
41f70 : __ __ __ BYT 98 91 98 a3 9f 8b 7a 75 79 73 5d 49 48 53 5a 5a : ......zuys]IHSZZ
41f80 : __ __ __ BYT 5d 6c 84 94 8e 7c 77 86 92 8a 7e 7d 86 89 82 79 : ]l...|w...~}...y
41f90 : __ __ __ BYT 77 79 78 74 73 7a 8a a1 b0 ab 9e 9d a8 ae aa a5 : wyxtsz..........
41fa0 : __ __ __ BYT a2 9b 95 92 8d 84 7b 77 78 77 72 72 7c 7f 78 7b : ......{wxwrr|.x{
41fb0 : __ __ __ BYT 86 88 80 7b 76 73 73 73 6a 5d 57 5a 67 74 70 5c : ...{vsssj]WZgtp\
41fc0 : __ __ __ BYT 4e 51 55 54 54 56 56 58 62 72 82 8c 93 90 7e 6a : NQUTTVVXbr....~j
41fd0 : __ __ __ BYT 6e 8b a0 9c 8d 83 81 82 87 88 7e 72 71 78 80 8c : n.........~rqx..
41fe0 : __ __ __ BYT 9a 9c 88 6a 5b 69 84 8e 84 7a 72 69 69 70 6d 5f : ...j[i...zriipm_
41ff0 : __ __ __ BYT 53 49 41 4a 64 6e 5b 3f 36 41 4f 53 4e 4a 45 41 : SIAJdn[?6AOSNJEA
42000 : __ __ __ BYT 3f 41 3f 3b 3c 42 48 54 68 76 70 60 5a 61 6d 74 : ?A?;<BHThvp`Zamt
42010 : __ __ __ BYT 78 80 86 82 7a 7b 84 8a 90 98 9e a3 b4 ca cd bc : x...z{..........
42020 : __ __ __ BYT aa 9e 95 99 ae c8 d8 d6 c1 aa a4 ad b0 a7 9b 99 : ................
42030 : __ __ __ BYT a4 b5 ba ab 94 83 77 73 79 86 91 91 83 6d 5e 5f : ......wsy....m^_
42040 : __ __ __ BYT 66 64 5e 60 6f 81 88 7c 67 5e 6a 79 74 63 59 59 : fd^`o..|g^jytcYY
42050 : __ __ __ BYT 56 4d 4c 58 69 76 7a 77 75 82 93 95 88 80 80 7d : VMLXivzwu......}
42060 : __ __ __ BYT 6f 5e 5b 6d 84 86 73 64 65 6d 77 7d 7b 80 96 a2 : o^[m..sdemw}{...
42070 : __ __ __ BYT 8c 72 73 79 71 6a 70 76 79 7d 78 69 5b 5b 63 6d : .rsyqjpvy}xi[[cm
42080 : __ __ __ BYT 72 75 82 8b 7f 6d 6d 77 7b 7f 86 83 7a 78 78 71 : ru...mmw{...zxxq
42090 : __ __ __ BYT 6c 72 76 75 76 78 79 78 7c 81 84 86 88 8b 93 9d : lrvuvxyx|.......
420a0 : __ __ __ BYT a7 ac ab a5 9f 9c 99 96 99 a3 a9 9e 8a 81 8b 9b : ................
420b0 : __ __ __ BYT a4 a7 ab b5 c0 be ad 9b 96 9a 9c 9c 9a 91 86 80 : ................
420c0 : __ __ __ BYT 7b 78 7e 8b 97 9b 96 8c 87 87 7e 6c 60 60 63 65 : {x~.......~l``ce
420d0 : __ __ __ BYT 67 5e 49 3e 46 52 56 56 5c 63 61 55 50 5e 76 80 : g^I>FRVV\caUP^v.
420e0 : __ __ __ BYT 70 55 46 49 55 62 69 5f 4d 45 45 44 43 4a 55 5d : pUFIUbi_MEEDCJU]
420f0 : __ __ __ BYT 68 80 a0 b3 a3 80 6d 71 77 80 8f 92 81 70 6b 69 : h.....mqw....pki
42100 : __ __ __ BYT 6c 7b 91 9d 9f a2 ab b0 ab a0 97 91 87 7e 7d 88 : l{...........~}.
42110 : __ __ __ BYT 93 95 91 8c 86 8a 9d b3 b7 ae a3 99 8f 8c 91 92 : ................
42120 : __ __ __ BYT 8c 88 8a 8e 93 99 9c 9d 9f a4 ae b8 bc b6 aa 9d : ................
42130 : __ __ __ BYT 95 94 9f b2 b7 ac 9d 93 8e 8c 8b 86 7f 80 88 92 : ................
42140 : __ __ __ BYT 97 95 8d 86 84 88 92 9c 9c 93 87 7e 77 75 74 6e : ...........~wutn
42150 : __ __ __ BYT 62 5a 5d 6b 77 77 6d 65 64 66 65 63 60 5e 60 6c : bZ]kwwmedfec`^`l
42160 : __ __ __ BYT 79 80 81 80 7a 71 70 7e 90 9b 9a 8d 7b 70 70 74 : y...zqp~....{ppt
42170 : __ __ __ BYT 74 71 71 79 82 83 7e 7c 7a 77 7b 87 99 ac b6 b0 : tqqy..~|zw{.....
42180 : __ __ __ BYT a0 95 94 9a 99 89 74 6c 72 7e 8e 95 87 70 67 70 : ......tlr~...pgp
42190 : __ __ __ BYT 7e 8c 92 8a 7e 79 78 74 72 6c 5b 4a 45 4f 67 84 : ~...~yxtrl[JEOg.
421a0 : __ __ __ BYT 8c 77 5e 56 5d 69 70 70 6d 6f 70 6b 6a 70 6e 62 : .w^V]ippmopkjpnb
421b0 : __ __ __ BYT 5e 66 70 7f 8d 8d 7e 6d 64 66 71 7b 7b 79 78 7a : ^fp...~mdfq{{yxz
421c0 : __ __ __ BYT 82 8d 8a 7f 80 8e 93 87 7b 73 6c 66 62 63 70 85 : ........{slfbcp.
421d0 : __ __ __ BYT 8c 7d 6b 64 6b 79 89 90 8d 86 80 79 6a 56 47 41 : .}kdky.....yjVGA
421e0 : __ __ __ BYT 43 4c 5b 6e 7d 7c 71 71 7d 88 95 9f 9c 8e 89 93 : CL[n}|qq}.......
421f0 : __ __ __ BYT 94 7e 67 62 65 62 62 66 66 5e 5c 66 76 80 88 8e : .~gbebbff^\fv...
42200 : __ __ __ BYT 8a 7f 80 93 a2 9a 86 81 88 86 78 6b 65 65 6a 75 : ..........xkeeju
42210 : __ __ __ BYT 78 6c 64 73 86 7f 67 62 79 8e 8c 83 82 81 7a 76 : xlds..gby.....zv
42220 : __ __ __ BYT 7b 86 93 9b 9b 93 83 72 66 61 63 66 70 80 84 7b : {......rfacfp..{
42230 : __ __ __ BYT 77 79 76 73 7e 8e 95 94 91 90 91 8e 85 7e 83 8c : wyvs~........~..
42240 : __ __ __ BYT 90 8f 8b 83 81 87 8c 8a 8a 91 97 99 9a 9b 9e a7 : ................
42250 : __ __ __ BYT b5 be bf b4 a4 9b a0 aa ac a5 9a 93 90 8a 83 7d : ...............}
42260 : __ __ __ BYT 77 72 6d 6f 7a 85 86 80 76 72 80 91 8e 80 79 7d : wrmoz...vr....y}
42270 : __ __ __ BYT 81 7a 6b 5f 58 52 4b 41 3b 3e 42 44 49 54 67 7c : .zk_XRKA;>BDITg|
42280 : __ __ __ BYT 80 71 68 78 91 94 81 75 7b 85 80 6f 66 73 8e 9f : .qhx...u{..ofs..
42290 : __ __ __ BYT 96 81 78 7b 82 86 88 88 8e 95 96 95 9a ac bc bd : ..x{............
422a0 : __ __ __ BYT bb c1 c4 c0 c0 bd b0 a2 96 8e 88 82 7f 84 8f 9d : ................
422b0 : __ __ __ BYT a9 af b1 b5 bf c6 b8 98 8d a5 c2 c9 be af 9c 83 : ................
422c0 : __ __ __ BYT 70 6d 7e 98 ad af a5 9e 98 8d 86 8c 93 95 96 98 : pm~.............
422d0 : __ __ __ BYT 94 88 7b 72 71 73 70 6a 69 68 65 6c 7e 86 84 8a : ..{rqspjihel~...
422e0 : __ __ __ BYT 96 8a 67 4e 4e 57 5d 69 7a 85 81 6e 55 45 40 43 : ..gNNW]iz..nUE@C
422f0 : __ __ __ BYT 52 69 7d 88 86 72 53 3f 41 4c 53 57 62 75 87 8c : Ri}..rS?ALSWbu..
42300 : __ __ __ BYT 89 86 7a 64 59 64 77 85 8a 82 6d 61 6c 77 72 64 : ..zdYdw...malwrd
42310 : __ __ __ BYT 57 52 5b 6f 88 9e a0 8e 7c 73 73 7a 83 8b 98 a3 : WR[o....|ssz....
42320 : __ __ __ BYT a0 8f 81 81 84 7b 6d 6a 71 78 7a 7a 81 89 86 7f : .....{mjqxzz....
42330 : __ __ __ BYT 81 86 8c 9b a9 a0 89 7e 81 7f 7a 7e 88 86 75 69 : .......~..z~..ui
42340 : __ __ __ BYT 6a 71 76 77 74 71 77 8a 9c 99 84 77 77 77 74 72 : jqvwtqw....wwwtr
42350 : __ __ __ BYT 71 72 77 7a 7e 7a 6c 61 60 5f 59 5f 73 80 77 66 : qrwz~zla`_Y_s.wf
42360 : __ __ __ BYT 67 78 84 80 71 62 5e 68 78 7f 76 66 5e 62 69 69 : gx..qb^hx.vf^bii
42370 : __ __ __ BYT 63 5c 58 56 5b 68 74 78 76 73 71 74 7b 81 82 7e : c\XV[htxvsqt{..~
42380 : __ __ __ BYT 70 5e 55 5c 6b 75 78 79 76 6a 61 68 79 80 76 69 : p^U\kuxyvjahy.vi
42390 : __ __ __ BYT 68 72 82 8c 87 77 63 57 59 5f 64 6d 76 73 66 5f : hr...wcWY_dmvsf_
423a0 : __ __ __ BYT 68 73 74 6f 69 64 66 70 78 77 70 6b 67 62 5d 5a : hstoidfpxwpkgb]Z
423b0 : __ __ __ BYT 57 56 56 5a 62 6c 73 76 77 75 6e 67 66 6b 6f 73 : WVVZblsvwungfkos
423c0 : __ __ __ BYT 7a 83 89 8a 82 79 77 7e 87 92 9d a9 af ac ab b2 : z....yw~........
423d0 : __ __ __ BYT b8 b6 a9 96 8d 93 9e a3 a0 99 96 9a 9d 9c a0 a9 : ................
423e0 : __ __ __ BYT ae af b2 b5 ba c1 c1 b6 aa a7 ab b0 ae ad af b1 : ................
423f0 : __ __ __ BYT af a9 a6 a9 aa a3 9b 98 9a 9a 93 8b 89 8b 8a 86 : ................
42400 : __ __ __ BYT 80 79 75 7b 89 96 99 95 90 8b 83 80 84 87 85 7f : .yu{............
42410 : __ __ __ BYT 7b 7c 7c 79 70 60 53 54 5e 65 64 5c 50 4e 57 63 : {||yp`ST^ed\PNWc
42420 : __ __ __ BYT 6d 75 73 6e 73 82 93 97 8c 7a 6d 6c 70 6d 65 5e : musns....zmlpme^
42430 : __ __ __ BYT 5b 56 55 5c 6a 79 83 86 89 8f 94 99 97 88 77 72 : [VU\jy........wr
42440 : __ __ __ BYT 77 7a 78 77 79 7b 76 6b 66 6c 77 86 99 a7 a8 a0 : wzxwy{vkflw.....
42450 : __ __ __ BYT 9a 98 98 99 9b 99 99 9b 9b 95 91 92 96 99 a0 a9 : ................
42460 : __ __ __ BYT b3 c0 c9 c5 bb b5 b1 ae ab a4 9b 92 8c 8c 93 9e : ................
42470 : __ __ __ BYT a7 a7 9f 9a 9a 9b 9b 98 95 95 9a a1 a7 a9 aa ab : ................
42480 : __ __ __ BYT a0 8e 85 88 8f 95 9d 9d 8e 7c 77 78 71 6a 6d 76 : .........|wxqjmv
42490 : __ __ __ BYT 7a 7a 7c 80 87 89 82 73 63 5d 67 7b 84 7b 72 7a : zz|....sc]g{.{rz
424a0 : __ __ __ BYT 86 82 75 71 75 73 6d 67 66 6b 72 75 76 71 67 5d : ..uqusmgfkruvqg]
424b0 : __ __ __ BYT 56 55 5d 66 69 67 62 5c 5a 5f 64 67 67 66 69 6a : VU]figb\Z_dggfij
424c0 : __ __ __ BYT 68 68 64 5a 52 54 62 74 75 61 4d 47 44 3e 3a 3b : hhdZRTbtuaMGD>:;
424d0 : __ __ __ BYT 3d 3c 3d 44 4e 54 52 4b 49 50 5d 70 84 8a 82 7b : =<=DNTRKIP]p...{
424e0 : __ __ __ BYT 7d 7f 78 6f 68 63 5e 5d 61 6a 76 7d 7b 78 7a 82 : }.xohc^]ajv}{xz.
424f0 : __ __ __ BYT 8b 90 91 91 94 98 99 93 8a 80 7a 76 6d 67 6a 76 : ..........zvmgjv
42500 : __ __ __ BYT 82 85 81 80 85 85 78 6c 6d 76 7d 7e 7f 7f 7e 7f : ......xlmv}~..~.
42510 : __ __ __ BYT 83 82 80 80 86 90 99 9e 9c 99 95 8d 85 81 81 84 : ................
42520 : __ __ __ BYT 87 87 87 86 83 82 81 80 80 86 8e 99 9f 94 86 84 : ................
42530 : __ __ __ BYT 86 86 85 88 8a 86 7e 7d 7f 7e 79 76 74 6e 64 5f : ......~}.~yvtnd_
42540 : __ __ __ BYT 6a 78 70 5c 55 5b 64 74 87 96 9a 9b 9e a2 a6 a7 : jxp\U[dt........
42550 : __ __ __ BYT a4 9d 8f 79 6b 71 7c 73 5b 4e 51 57 5d 66 77 8b : ...ykq|s[NQW]fw.
42560 : __ __ __ BYT 94 8e 88 8b 8e 8b 8a 8a 86 83 81 7d 77 75 76 77 : ...........}wuvw
42570 : __ __ __ BYT 76 77 7b 87 98 9c 90 89 8d 8d 8c 91 95 93 8e 88 : vw{.............
42580 : __ __ __ BYT 84 84 86 8b 94 9d a0 99 93 97 9c 9c a1 ad b1 ac : ................
42590 : __ __ __ BYT a2 98 94 94 8e 86 85 88 91 9c 9d 91 86 81 82 87 : ................
425a0 : __ __ __ BYT 8f 98 a6 af ad a0 94 90 8e 80 70 70 7f 8f 8f 78 : ..........pp...x
425b0 : __ __ __ BYT 63 68 76 7b 7d 83 8f 9c a6 a6 9f 93 87 80 7c 76 : chv{}.........|v
425c0 : __ __ __ BYT 70 6b 6d 67 52 44 4e 5e 61 60 62 67 6c 6c 66 58 : pkmgRDN^a`bgllfX
425d0 : __ __ __ BYT 46 39 3e 4f 5d 5a 50 4f 59 61 64 68 73 81 85 7f : F9>O]ZPOYadhs...
425e0 : __ __ __ BYT 7d 82 86 7e 71 62 54 4d 4f 58 5f 60 60 66 70 79 : }..~qbTMOX_``fpy
425f0 : __ __ __ BYT 7d 82 8e 99 9c 99 9a 9c 97 8d 7f 73 72 7f 91 96 : }..........sr...
42600 : __ __ __ BYT 8a 7e 7b 7b 7b 7b 7d 81 87 88 82 7c 7a 7a 76 6f : .~{{{{}....|zzvo
42610 : __ __ __ BYT 6c 75 88 9d aa a4 91 81 7d 7e 80 82 87 8a 8b 8f : lu......}~......
42620 : __ __ __ BYT 97 9e a2 a3 a1 9b 94 93 99 a2 9f 8f 7f 7d 85 8b : .............}..
42630 : __ __ __ BYT 8d 8a 84 85 8f 95 90 88 8a 91 91 8b 8b 93 93 83 : ................
42640 : __ __ __ BYT 70 6c 75 82 8b 8c 85 7f 7f 82 81 80 82 82 7d 7c : plu...........}|
42650 : __ __ __ BYT 88 94 96 91 84 7a 7d 83 7e 75 72 72 6f 6a 63 61 : .....z}.~urrojca
42660 : __ __ __ BYT 63 63 59 4a 53 76 86 6f 56 52 5d 68 67 59 53 61 : ccYJSv.oVR]hgYSa
42670 : __ __ __ BYT 72 72 60 4f 4a 4e 4d 48 46 52 6a 70 5e 53 5a 60 : rr`OJNMHFRjp^SZ`
42680 : __ __ __ BYT 61 5f 5e 62 6d 76 77 74 74 77 7a 7c 80 84 84 85 : a_^bmvwttwz|....
42690 : __ __ __ BYT 8b 93 9d a1 9e 9c 9d 9e 9c 9c a3 ad b5 b8 ba bd : ................
426a0 : __ __ __ BYT c3 cd d5 d4 cd c7 c4 c2 be bc ba b5 b0 ab a8 a9 : ................
426b0 : __ __ __ BYT ad b0 b0 b2 b6 ba ba b7 b2 ab a6 a1 9b 99 9c a0 : ................
426c0 : __ __ __ BYT 9e 95 8f 92 99 99 96 94 96 97 91 87 7a 70 6f 73 : ............zpos
426d0 : __ __ __ BYT 77 77 72 6d 6b 6a 68 68 70 78 78 75 76 7c 81 80 : wwrmkjhhpxxuv|..
426e0 : __ __ __ BYT 7b 78 79 7b 7d 7f 7d 73 69 65 67 6d 71 72 72 72 : {xy{}.}siegmqrrr
426f0 : __ __ __ BYT 74 74 70 6b 67 66 67 66 64 60 5b 57 56 56 56 57 : ttpkgfgfd`[WVVVW
42700 : __ __ __ BYT 5a 5c 5a 59 5c 5f 5e 57 52 53 58 55 48 3e 42 52 : Z\ZY\_^WRSXUH>BR
42710 : __ __ __ BYT 64 6f 6d 61 57 52 4c 47 45 47 48 47 44 42 44 48 : domaWRLGEGHGDBDH
42720 : __ __ __ BYT 4d 4e 4f 5b 70 85 92 95 8e 85 7e 7b 7c 7a 7b 80 : MNO[p.....~{|z{.
42730 : __ __ __ BYT 87 8d 8f 8b 85 83 89 96 a7 b5 b8 b2 ae ad ac a6 : ................
42740 : __ __ __ BYT 9b 8c 81 82 8a 93 9d a3 a1 98 8d 89 8e 9b a6 a3 : ................
42750 : __ __ __ BYT 98 90 91 98 a0 9d 8f 80 84 96 9c 8e 7b 73 73 6f : ............{sso
42760 : __ __ __ BYT 65 5f 62 68 6b 68 62 60 66 6e 72 71 6f 7a 90 9a : e_bhkhb`fnrqoz..
42770 : __ __ __ BYT 8d 79 75 7a 7c 7c 7d 81 83 83 80 79 73 76 7a 77 : .yuz||}....ysvzw
42780 : __ __ __ BYT 71 6f 70 71 73 72 70 70 74 77 77 75 75 77 75 6f : qopqsrpptwwuuwuo
42790 : __ __ __ BYT 68 64 69 6e 6c 64 5d 58 54 52 51 4e 49 47 46 46 : hdinld]XTRQNIGFF
427a0 : __ __ __ BYT 4a 58 6a 73 70 6a 6d 72 73 74 76 74 72 71 6c 63 : JXjspjmrstvtrqlc
427b0 : __ __ __ BYT 5d 5c 5e 60 64 69 70 7b 84 8a 95 a2 ad b4 bd c4 : ]\^`dip{........
427c0 : __ __ __ BYT bf b3 ab a6 a2 a2 a6 a9 a7 a3 9d 95 8f 8e 97 a0 : ................
427d0 : __ __ __ BYT a4 a7 b2 c2 c9 c2 b1 a3 9f a0 9e 9b 95 8e 8c 92 : ................
427e0 : __ __ __ BYT 94 8b 7d 72 70 76 82 8e 98 9e 9f 98 8f 8c 8e 8f : ..}rpv..........
427f0 : __ __ __ BYT 8a 85 84 86 87 87 86 85 83 81 81 82 84 85 86 87 : ................
42800 : __ __ __ BYT 86 84 85 8c 91 93 94 93 8a 7e 7b 85 90 96 95 91 : .........~{.....
42810 : __ __ __ BYT 91 97 9a 96 8d 84 83 82 7e 7c 80 83 7e 74 70 73 : ........~|..~tps
42820 : __ __ __ BYT 77 79 76 74 78 80 88 8a 83 78 6f 6b 6c 6e 6e 6d : wyvtx....xoklnnm
42830 : __ __ __ BYT 69 65 66 6e 73 72 70 6f 6e 6e 6f 71 70 69 63 61 : iefnsrponnoqpica
42840 : __ __ __ BYT 68 74 7e 7f 79 72 72 7b 82 7f 7c 7f 87 8e 93 96 : ht~.yrr{..|.....
42850 : __ __ __ BYT 99 9a 98 96 97 9f a6 a8 a7 a8 ab ae a9 9e 98 98 : ................
42860 : __ __ __ BYT 9d a4 a5 a0 9c 9b 99 95 90 8d 8b 88 87 8a 8f 93 : ................
42870 : __ __ __ BYT 93 90 8c 8e 93 98 9a 98 93 8c 83 79 75 72 69 5d : ...........yuri]
42880 : __ __ __ BYT 56 5d 69 6b 63 5d 61 6b 73 76 75 75 76 77 72 67 : V]ikc]aksvuuvwrg
42890 : __ __ __ BYT 5f 60 62 5f 59 5a 62 6b 6b 62 5b 5d 64 67 64 60 : _`b_YZbkkb[]dgd`
428a0 : __ __ __ BYT 5d 5e 5f 60 62 67 6b 6a 68 6a 6d 72 76 77 73 6e : ]^_`bgkjhjmrvwsn
428b0 : __ __ __ BYT 6a 6a 6b 6b 6c 71 7b 83 85 81 7e 7a 75 73 72 73 : jjkklq{...~zusrs
428c0 : __ __ __ BYT 78 7e 7f 7d 7d 7f 81 83 85 8a 94 9d 9d 97 93 96 : x~.}}...........
428d0 : __ __ __ BYT 98 94 87 79 74 77 7b 82 8e 9a a3 aa a8 9f 98 96 : ...ytw{.........
428e0 : __ __ __ BYT 91 87 80 81 86 86 7b 6d 69 70 74 75 78 7d 80 83 : ......{miptux}..
428f0 : __ __ __ BYT 83 7c 71 64 57 4b 42 3e 42 4c 54 5b 6a 7b 7e 72 : .|qdWKB>BLT[j{~r
42900 : __ __ __ BYT 69 6c 6e 67 61 63 63 5e 56 4f 47 43 4d 62 74 7b : ilngacc^VOGCMbt{
42910 : __ __ __ BYT 7f 89 8c 7e 6f 6d 70 6b 63 60 62 64 66 6c 76 7a : ...~ompkc`bdflvz
42920 : __ __ __ BYT 75 73 77 77 72 75 7c 7e 79 76 75 73 6f 68 62 60 : uswwru|~yvusohb`
42930 : __ __ __ BYT 64 6c 7c 90 96 8c 81 7d 7c 7c 7f 84 89 8b 8c 8f : dl|....}||......
42940 : __ __ __ BYT 91 8e 8a 85 83 84 88 8e 93 95 95 92 8f 8e 8f 93 : ................
42950 : __ __ __ BYT 96 98 9a 9d 9f a0 a3 a5 a2 9b 98 99 9b 9e a1 9f : ................
42960 : __ __ __ BYT 99 98 9d a2 a8 ac ab aa ac ae ad ab aa a9 a7 a2 : ................
42970 : __ __ __ BYT 9e a0 a4 a4 a1 9c 99 9a 9f a0 9e 9b 9b 9e a1 a4 : ................
42980 : __ __ __ BYT a6 a5 a1 9a 8d 7f 77 75 77 78 78 7a 7d 7a 74 72 : ......wuwxxz}ztr
42990 : __ __ __ BYT 75 77 77 74 72 74 74 6d 62 5b 59 56 4e 42 3f 4b : uwwtrttmb[YVNB?K
429a0 : __ __ __ BYT 60 6c 66 5c 5f 69 6b 60 56 57 5c 5a 56 55 59 5f : `lf\_ik`VW\ZVUY_
429b0 : __ __ __ BYT 59 4b 42 45 4e 5b 65 67 69 74 82 87 83 87 96 a3 : YKBEN[egit......
429c0 : __ __ __ BYT a9 ae ae ab a6 9e 94 8c 83 7c 78 75 75 78 7d 81 : .........|xuux}.
429d0 : __ __ __ BYT 81 81 86 8d 92 99 a0 a3 a2 9e 99 96 94 91 8c 84 : ................
429e0 : __ __ __ BYT 80 81 7f 78 76 7d 87 8d 8f 8d 84 7d 7f 85 87 87 : ...xv}.....}....
429f0 : __ __ __ BYT 87 88 8e 95 96 95 95 8f 86 88 93 9f a6 a3 9b 91 : ................
42a00 : __ __ __ BYT 8a 88 89 87 84 82 85 8c 8f 8b 82 7d 7a 78 78 7c : ...........}zxx|
42a10 : __ __ __ BYT 7f 7d 7d 82 86 88 88 86 82 7f 81 87 8c 8b 88 87 : .}}.............
42a20 : __ __ __ BYT 88 8b 8c 8c 8b 88 86 87 88 8a 8a 87 82 7e 7c 7b : .............~|{
42a30 : __ __ __ BYT 7e 83 87 87 85 86 89 8c 8b 8b 8c 8d 88 81 78 6f : ~.............xo
42a40 : __ __ __ BYT 67 5e 57 55 54 50 4b 48 46 48 4c 51 58 63 70 7b : g^WUTPKHFHLQXcp{
42a50 : __ __ __ BYT 80 7e 7b 78 72 6b 64 5f 5b 56 4e 44 3b 33 2d 2c : .~{xrkd_[VND;3-,
42a60 : __ __ __ BYT 2c 2d 31 39 45 55 65 6f 6d 64 5e 5f 66 6e 75 77 : ,-19EUeomd^_fnuw
42a70 : __ __ __ BYT 75 70 6a 64 63 68 6a 64 5d 5c 61 69 6a 64 5e 61 : upjdchjd]\aijd^a
42a80 : __ __ __ BYT 67 71 7d 89 90 96 9e a5 ab b9 c8 c3 ac 99 95 96 : gq}.............
42a90 : __ __ __ BYT 98 9c 9d 98 8e 88 8b 92 95 96 98 9d a7 ac aa a3 : ................
42aa0 : __ __ __ BYT 99 8f 8c 8e 94 9d a7 a8 9c 91 8e 91 95 99 98 91 : ................
42ab0 : __ __ __ BYT 91 96 96 91 8f 91 94 9b a3 a9 ab aa a9 a6 a4 a4 : ................
42ac0 : __ __ __ BYT a7 a7 a4 9e 9a 9d a2 a4 a3 9e 98 98 9d a3 a6 a5 : ................
42ad0 : __ __ __ BYT a2 9c 96 93 94 92 8c 86 82 80 7d 7a 76 6f 64 60 : ..........}zvod`
42ae0 : __ __ __ BYT 67 6e 70 70 6e 65 5a 57 59 5c 5d 5d 5b 56 4e 4a : gnppneZWY\]][VNJ
42af0 : __ __ __ BYT 4b 4b 48 49 52 5d 66 6c 6c 6a 6c 76 82 8e 90 86 : KKHIR]flljlv....
42b00 : __ __ __ BYT 7d 7e 82 83 83 7e 74 6e 72 77 7a 7b 77 72 75 7e : }~...~tnrwz{wru~
42b10 : __ __ __ BYT 87 8d 90 8a 81 84 8f 98 9c 9e 9e 9e 9f 9b 93 87 : ................
42b20 : __ __ __ BYT 7d 76 72 71 70 6e 6d 6e 6d 6b 6d 75 83 95 a4 ab : }vrqpnmnmkmu....
42b30 : __ __ __ BYT ac aa a5 9b 91 8d 8c 8a 85 7e 78 73 6d 67 63 66 : .........~xsmgcf
42b40 : __ __ __ BYT 6d 77 7e 7d 77 74 74 73 70 6e 70 72 70 6e 6b 67 : mw~}wttspnprpnkg
42b50 : __ __ __ BYT 64 64 66 6a 6e 70 72 73 75 77 79 7c 80 81 82 85 : ddfjnprsuwy|....
42b60 : __ __ __ BYT 87 89 8b 8b 86 83 87 8d 91 94 96 97 96 93 90 90 : ................
42b70 : __ __ __ BYT 90 90 91 93 91 8e 8d 8b 85 7b 76 75 73 71 71 6f : .........{vusqqo
42b80 : __ __ __ BYT 68 5c 50 4a 4a 4f 53 53 55 58 5f 69 6c 63 5d 62 : h\PJJOSSUX_ilc]b
42b90 : __ __ __ BYT 67 67 69 6a 68 65 64 65 64 64 64 64 64 68 6f 77 : ggijhededddddhow
42ba0 : __ __ __ BYT 7f 80 83 89 8f 8f 91 95 99 9f a7 ac ac a8 a4 a3 : ................
42bb0 : __ __ __ BYT a4 a8 a9 a2 9a 9a 9f a2 9e 9a 97 95 96 9b a3 a8 : ................
42bc0 : __ __ __ BYT a9 a8 aa ad ad ac ab a4 9f a3 a9 a8 a2 9c 97 92 : ................
42bd0 : __ __ __ BYT 8f 8f 8f 8a 83 7e 7a 77 71 6a 64 61 62 67 6e 74 : .....~zwqjdabgnt
42be0 : __ __ __ BYT 7b 83 85 80 7b 7b 7d 76 67 5b 55 59 61 66 61 56 : {...{{}vg[UYafaV
42bf0 : __ __ __ BYT 4b 45 41 3e 42 4a 4e 4d 4d 51 55 55 54 55 5b 66 : KEA>BJNMMQUUTU[f
42c00 : __ __ __ BYT 75 81 85 83 81 7f 7b 77 78 7a 78 71 68 64 66 68 : u.....{wxzxqhdfh
42c10 : __ __ __ BYT 6a 6e 72 76 78 7c 81 88 92 9b 9f a1 a5 ab ae a8 : jnrvx|..........
42c20 : __ __ __ BYT 9b 92 91 90 8f 8b 85 7f 7b 7b 7c 7d 7e 7d 76 6f : ........{{|}~}vo
42c30 : __ __ __ BYT 6c 6e 71 71 6e 6e 73 7a 7e 81 81 83 85 88 8a 8a : lnqqnnsz~.......
42c40 : __ __ __ BYT 88 89 8b 8c 8a 8a 8c 8f 90 8e 8e 92 95 95 92 91 : ................
42c50 : __ __ __ BYT 93 95 97 99 99 9a 9d a1 a3 a4 a5 a6 a3 9b 94 90 : ................
42c60 : __ __ __ BYT 8e 8b 87 82 7f 7e 7e 7b 74 6a 63 5e 5c 60 65 66 : .....~~{tjc^\`ef
42c70 : __ __ __ BYT 66 67 65 63 60 5d 5c 61 66 67 68 69 69 6c 6f 6e : fgec`]\afghiilon
42c80 : __ __ __ BYT 6c 70 79 7f 82 86 89 88 86 83 82 86 8b 90 95 99 : lpy.............
42c90 : __ __ __ BYT 9e a5 ab aa a7 a8 ac b0 b2 b4 b5 b3 b1 af ac a9 : ................
42ca0 : __ __ __ BYT a6 a2 9e 9c 99 95 90 89 83 7d 79 77 78 79 78 76 : .........}ywxyxv
42cb0 : __ __ __ BYT 71 6b 67 63 5f 5a 55 52 4f 4c 47 43 40 3e 3c 3c : qkgc_ZUROLGC@><<
42cc0 : __ __ __ BYT 40 46 4e 57 5a 55 53 5c 68 6c 6b 6a 6c 70 73 77 : @FNWZUS\hlkjlpsw
42cd0 : __ __ __ BYT 7a 7c 7d 7c 7e 83 8b 95 99 97 98 a2 ae b3 b0 ac : z|}|~...........
42ce0 : __ __ __ BYT ac b0 b3 b6 b8 b8 b6 b3 b0 ae ac ab a9 a6 a4 a5 : ................
42cf0 : __ __ __ BYT a7 a7 a5 a2 9d 97 92 8e 8a 86 85 86 84 80 7c 79 : ..............|y
42d00 : __ __ __ BYT 75 74 77 7a 7f 82 82 80 7b 73 6c 69 66 63 61 61 : utwz....{slifcaa
42d10 : __ __ __ BYT 5f 5a 57 57 59 5c 5f 63 67 6c 6f 71 70 6d 6c 6f : _ZWWY\_cgloqpmlo
42d20 : __ __ __ BYT 73 74 76 7b 7e 7f 80 82 85 8b 90 95 99 9b 9a 96 : stv{~...........
42d30 : __ __ __ BYT 92 8d 87 84 84 84 87 8a 8c 8c 8b 88 87 88 8b 8d : ................
42d40 : __ __ __ BYT 8d 8d 8a 87 84 83 80 7a 76 76 7b 80 85 86 85 81 : .......zvv{.....
42d50 : __ __ __ BYT 7f 7f 7d 7a 77 77 77 77 78 79 77 72 6e 6c 6e 74 : ..}zwwwwxywrnlnt
42d60 : __ __ __ BYT 79 7b 7c 7c 7d 7e 7d 79 76 76 77 77 77 76 74 6f : y{||}~}yvvwwwvto
42d70 : __ __ __ BYT 6c 6c 6e 70 73 76 78 7b 7c 7b 74 6c 68 64 60 5c : llnpsvx{|{tlhd`\
42d80 : __ __ __ BYT 58 52 4d 4b 4a 4a 4d 52 57 60 69 73 7c 7f 76 6b : XRMKJJMRW`is|.vk
42d90 : __ __ __ BYT 64 63 63 66 68 66 62 60 60 5f 61 64 66 68 6a 6e : dccfhfb``_adfhjn
42da0 : __ __ __ BYT 75 79 77 6f 68 67 6b 72 77 7a 7a 7a 7b 7c 7d 80 : uywohgkrwzzz{|}.
42db0 : __ __ __ BYT 81 82 83 83 85 8a 93 98 96 92 92 95 96 94 90 8d : ................
42dc0 : __ __ __ BYT 8a 89 8c 92 97 99 97 94 92 95 9a 9d 9c 9b 9d 9f : ................
42dd0 : __ __ __ BYT 9e 9b 98 97 9b a4 ab ad ab a9 a6 a0 9a 93 90 90 : ................
42de0 : __ __ __ BYT 8f 8e 8e 8d 88 83 83 87 8b 8e 8f 8c 87 85 84 81 : ................
42df0 : __ __ __ BYT 7a 73 71 72 72 71 70 6f 6e 6c 6c 6c 68 64 62 64 : zsqrrqponlllhdbd
42e00 : __ __ __ BYT 67 67 67 67 69 6c 70 73 74 73 74 78 7f 84 86 85 : ggggilpststx....
42e10 : __ __ __ BYT 82 7f 7d 79 76 74 75 79 80 88 90 95 96 93 91 91 : ..}yvtuy........
42e20 : __ __ __ BYT 95 98 99 98 94 90 8b 84 7e 7a 79 7a 79 78 77 76 : ........~zyzyxwv
42e30 : __ __ __ BYT 74 6f 69 65 63 61 5e 5c 5c 5e 61 65 6d 77 7d 82 : toieca^\\^aemw}.
42e40 : __ __ __ BYT 88 8e 90 8d 8b 89 88 86 82 7d 79 74 71 72 76 7b : .........}ytqrv{
42e50 : __ __ __ BYT 81 89 8d 90 97 a1 a7 a8 a7 a7 a7 a6 a6 a6 a7 a8 : ................
42e60 : __ __ __ BYT ab af b2 b2 b1 ae a7 a0 9c 9a 98 96 93 91 92 94 : ................
42e70 : __ __ __ BYT 96 96 98 9c a0 a3 a3 a2 9f 99 90 87 82 7f 7c 78 : ..............|x
42e80 : __ __ __ BYT 74 73 75 77 78 79 7b 7c 7a 78 78 78 77 75 72 6f : tsuwxy{|zxxxwuro
42e90 : __ __ __ BYT 6d 6c 6a 68 66 65 64 62 62 65 6a 71 74 76 78 7b : mljhfedbbejqtvx{
42ea0 : __ __ __ BYT 7d 7e 80 81 84 87 88 89 8c 90 90 8d 89 83 7e 7e : }~............~~
42eb0 : __ __ __ BYT 80 7f 7a 76 72 6f 6d 6e 70 72 73 73 74 75 74 74 : ..zvromnprsstutt
42ec0 : __ __ __ BYT 76 79 7c 7c 7b 7b 7b 78 74 6f 6c 6b 6b 6a 66 62 : vy||{{{xtolkkjfb
42ed0 : __ __ __ BYT 5e 5b 59 5a 5f 67 70 74 73 73 76 7a 7d 7d 7a 7b : ^[YZ_gptssvz}}z{
42ee0 : __ __ __ BYT 7f 83 85 87 89 89 89 8b 8c 8d 8e 8f 8d 8b 8a 8c : ................
42ef0 : __ __ __ BYT 8e 8f 8f 92 95 95 95 96 96 96 98 9a 9a 9a 9d 9d : ................
42f00 : __ __ __ BYT 9c 9d 9e 9d 99 95 93 94 93 8f 8a 88 88 89 8a 8a : ................
42f10 : __ __ __ BYT 89 89 8a 8a 89 89 89 8b 8a 84 7b 72 6a 65 64 63 : ..........{rjedc
42f20 : __ __ __ BYT 61 5d 5a 58 55 51 4f 53 5b 61 61 60 61 60 5c 54 : a]ZXUQOS[aa`a`\T
42f30 : __ __ __ BYT 4d 4a 48 46 41 3c 38 36 37 38 3b 41 47 49 44 41 : MJHFA<8678;AGIDA
42f40 : __ __ __ BYT 44 49 4c 4b 49 47 48 4b 4c 4c 50 59 65 6f 74 73 : DILKIGHKLLPYeots
42f50 : __ __ __ BYT 6f 6b 69 6b 6c 6c 6b 6b 6b 6a 6b 6d 6e 70 75 80 : okikllkkkjkmnpu.
42f60 : __ __ __ BYT 8b 91 8c 87 8b 8f 8b 85 86 89 8b 8e 90 8f 8c 8b : ................
42f70 : __ __ __ BYT 8a 87 87 89 8b 87 80 7c 80 82 7e 7a 7d 82 86 8b : .......|..~z}...
42f80 : __ __ __ BYT 91 90 8d 8d 8f 91 93 95 94 96 9b 9c 96 91 93 99 : ................
42f90 : __ __ __ BYT 9d 9c 9a 98 97 97 97 96 98 9d a0 a2 a2 a2 a1 9d : ................
42fa0 : __ __ __ BYT 99 95 93 96 99 98 93 8e 8c 8c 8c 8e 91 92 91 90 : ................
42fb0 : __ __ __ BYT 8e 89 84 80 7b 74 70 72 74 71 6c 6b 6d 6d 6f 74 : ....{tprtqlkmmot
42fc0 : __ __ __ BYT 78 79 7a 7c 7e 80 83 85 83 81 83 88 8e 93 97 99 : xyz|~...........
42fd0 : __ __ __ BYT 97 94 98 9f a4 a6 a4 a3 a3 a2 a2 a4 a2 9d 9b a0 : ................
42fe0 : __ __ __ BYT a8 b0 b9 bd b6 ad af b7 bd bc b7 b2 ad a9 a6 a0 : ................
42ff0 : __ __ __ BYT 98 90 8d 8d 8f 92 93 91 89 82 82 89 90 92 8d 88 : ................
43000 : __ __ __ BYT 87 86 83 7f 7c 7c 80 84 84 82 81 7e 79 77 7a 7e : ....||.....~ywz~
43010 : __ __ __ BYT 83 84 84 84 86 87 85 84 85 88 8b 8e 8f 8f 92 94 : ................
43020 : __ __ __ BYT 93 93 97 99 98 98 98 9a 9c 9c 98 95 92 8f 8b 89 : ................
43030 : __ __ __ BYT 8c 92 95 94 91 8c 88 84 81 80 80 7e 7a 75 71 6d : ...........~zuqm
43040 : __ __ __ BYT 69 66 65 65 67 6a 6a 67 63 5f 5a 55 53 52 4f 4c : ifeegjjgc_ZUSROL
43050 : __ __ __ BYT 46 41 3f 3f 41 43 47 4b 4f 55 5b 5f 62 65 67 67 : FA??ACGKOU[_begg
43060 : __ __ __ BYT 66 67 6c 72 76 7a 7d 7c 77 71 6f 6d 6d 6d 6d 6d : fglrvz}|wqommmmm
43070 : __ __ __ BYT 6d 6e 6e 6c 6a 6b 6d 72 7b 83 86 83 7c 76 74 76 : mnnljkmr{...|vtv
43080 : __ __ __ BYT 74 6c 68 6b 71 75 72 6e 6c 69 62 5e 61 65 64 65 : tlhkqurnlib^aede
43090 : __ __ __ BYT 69 6d 71 75 75 73 74 7a 7e 7e 7b 77 76 75 71 70 : imquustz~~{wvuqp
430a0 : __ __ __ BYT 70 6d 6a 6c 72 76 75 71 6d 6b 6a 68 64 5e 5a 59 : pmjlrvuqmkjhd^ZY
430b0 : __ __ __ BYT 59 5d 64 6a 66 5e 5d 60 60 5f 5f 5f 5e 5c 5c 5c : Y]djf^]``___^\\\
430c0 : __ __ __ BYT 5d 5d 5c 5c 5d 61 67 69 65 61 64 6a 6f 73 73 72 : ]]\\]agieadjossr
430d0 : __ __ __ BYT 71 72 77 7d 7f 7e 7f 84 89 8a 88 86 85 85 86 8a : qrw}.~..........
430e0 : __ __ __ BYT 8e 8e 8e 8c 8a 8a 8c 8c 89 87 89 8c 8e 8e 8b 8a : ................
430f0 : __ __ __ BYT 8a 8c 8d 8c 8a 8a 8c 8c 8b 8d 90 92 93 8f 88 84 : ................
43100 : __ __ __ BYT 85 86 86 87 88 89 8b 89 86 86 87 87 88 8b 92 99 : ................
43110 : __ __ __ BYT 9a 93 8e 8f 91 91 93 94 91 8d 8c 8b 89 89 8a 8b : ................
43120 : __ __ __ BYT 8c 8f 94 97 97 95 96 97 97 93 90 8f 8e 8c 89 85 : ................
43130 : __ __ __ BYT 84 82 81 86 8e 95 96 95 98 a0 a3 9f 9a 97 96 95 : ................
43140 : __ __ __ BYT 95 93 8f 8b 88 84 82 83 88 8b 89 89 8e 95 96 92 : ................
43150 : __ __ __ BYT 8f 8e 8d 8c 8b 8b 8c 8d 8c 8c 8d 8d 8d 8f 91 93 : ................
43160 : __ __ __ BYT 95 94 94 95 97 98 9a 9d 9f a2 a5 a8 a9 ac b0 b1 : ................
43170 : __ __ __ BYT b1 b2 b4 b6 b9 bb bd c0 c4 c6 c5 c2 bd b8 b5 b5 : ................
43180 : __ __ __ BYT b5 b3 b0 ae ab a9 a7 a6 a5 a3 a2 a2 a1 9f 9c 97 : ................
43190 : __ __ __ BYT 90 8a 86 83 80 7b 75 71 6e 6b 69 63 5e 5a 59 57 : .....{uqnkic^ZYW
431a0 : __ __ __ BYT 55 56 5a 60 67 6c 6a 66 64 65 64 62 61 62 61 5c : UVZ`gljfdedbaba\
431b0 : __ __ __ BYT 59 56 55 54 50 4d 51 5a 64 67 63 5e 60 64 65 64 : YVUTPMQZdgc^`ded
431c0 : __ __ __ BYT 66 6a 6c 6d 6d 6b 6a 6a 67 64 65 6a 6e 6e 6d 6e : fjlmmkjjgdejnnmn
431d0 : __ __ __ BYT 74 7b 7f 80 81 81 81 7f 7a 74 71 71 71 6f 69 64 : t{......ztqqqoid
431e0 : __ __ __ BYT 63 61 5e 5f 61 62 62 62 63 61 5d 59 54 50 4f 51 : ca^_abbbca]YTPOQ
431f0 : __ __ __ BYT 51 4e 48 45 45 42 3f 3d 3c 3b 3b 3c 3e 3f 40 43 : QNHEEB?=<;;<>?@C
43200 : __ __ __ BYT 46 49 4c 4f 51 55 59 5c 5d 5f 65 69 69 6a 6c 6e : FILOQUY\]_eiijln
43210 : __ __ __ BYT 71 71 71 72 74 78 7d 80 85 8a 8f 93 97 9b 9f a4 : qqqrtx}.........
43220 : __ __ __ BYT a7 a9 aa ab aa a5 a0 9e 9c 9c 9d 9e 9c 97 94 95 : ................
43230 : __ __ __ BYT 97 97 96 93 90 8d 8c 8b 89 85 82 7e 7a 77 76 73 : ...........~zwvs
43240 : __ __ __ BYT 6e 65 5f 5d 5d 5e 5b 56 51 4e 50 52 53 53 53 57 : ne_]]^[VQNPRSSSW
43250 : __ __ __ BYT 5a 5b 59 57 58 5a 5c 5e 60 63 65 67 69 6d 72 76 : Z[YWXZ\^`cegimrv
43260 : __ __ __ BYT 7a 7c 7f 84 89 8b 8b 8e 93 98 9a 9d a0 a2 a1 a0 : z|..............
43270 : __ __ __ BYT a1 a2 a2 a1 a1 a0 9f 9d 9b 9b a1 a8 aa a7 a3 a4 : ................
43280 : __ __ __ BYT a8 a8 a7 a6 a3 a0 9d 9b 98 95 93 90 8d 8e 93 96 : ................
43290 : __ __ __ BYT 97 95 93 93 93 95 97 98 98 97 95 95 96 96 94 92 : ................
432a0 : __ __ __ BYT 92 94 96 96 95 92 8e 8c 8d 91 92 92 92 90 8e 8c : ................
432b0 : __ __ __ BYT 8a 87 84 81 81 82 82 80 7d 79 77 77 7a 7a 78 78 : ........}ywwzzxx
432c0 : __ __ __ BYT 7b 7b 79 76 75 74 75 76 76 76 77 78 7a 7a 7a 7b : {{yvutuvvvwxzzz{
432d0 : __ __ __ BYT 7c 7d 7e 80 80 81 84 89 8c 8d 8e 91 95 97 99 9b : |}~.............
432e0 : __ __ __ BYT 9e a0 a2 a2 a4 a5 a5 a6 a7 a8 a9 a9 a9 a8 a7 a8 : ................
432f0 : __ __ __ BYT aa af b7 bf c7 cc ce cc c4 bc ba bc b9 b2 ac a8 : ................
43300 : __ __ __ BYT a5 9f 98 93 95 9d a3 a8 ad ad aa a4 9c 97 98 95 : ................
43310 : __ __ __ BYT 90 8c 8a 88 84 80 7d 7d 7e 7d 79 77 75 72 6d 69 : ......}}~}ywurmi
43320 : __ __ __ BYT 67 65 61 5d 5b 59 56 55 54 55 57 57 56 55 53 50 : gea][YVUTUWWVUSP
43330 : __ __ __ BYT 4f 4c 48 45 43 3f 3b 36 31 2e 2d 2c 2d 2e 2e 2e : OLHEC?;61.-,-...
43340 : __ __ __ BYT 2f 31 34 38 3a 3b 3e 41 43 46 46 47 47 47 47 4a : /148:;>ACFFGGGGJ
43350 : __ __ __ BYT 4e 50 53 56 59 5c 5e 62 65 68 6a 6d 73 7a 7f 7d : NPSVY\^behjmsz.}
43360 : __ __ __ BYT 75 72 7e 8a 8a 83 7e 7f 7d 77 72 71 6f 6d 6b 6c : ur~...~.}wrqomkl
43370 : __ __ __ BYT 70 75 74 6e 68 6e 79 7c 75 6f 6f 70 69 61 5f 62 : putnhny|uoopia_b
43380 : __ __ __ BYT 65 67 68 66 64 64 67 6a 6f 75 7c 82 86 87 84 81 : eghfddgjou|.....
43390 : __ __ __ BYT 84 8b 94 9e a6 ac ae ad aa a9 a6 a4 a4 a9 ae b1 : ................
433a0 : __ __ __ BYT b2 ae a6 a1 a3 a8 af b9 c2 c5 c1 bd bc b7 ae a6 : ................
433b0 : __ __ __ BYT a1 9e 9a 96 95 94 8f 89 86 86 89 8d 8d 88 85 8b : ................
433c0 : __ __ __ BYT 92 93 8e 8b 8c 8d 8a 86 86 8b 91 92 8d 89 89 87 : ................
433d0 : __ __ __ BYT 84 86 8d 93 95 90 87 82 82 80 7e 7e 83 8a 8d 89 : ..........~~....
433e0 : __ __ __ BYT 83 7f 7e 7c 7b 7c 7e 7d 7a 76 75 75 75 75 74 74 : ..~|{|~}zvuuuutt
433f0 : __ __ __ BYT 75 75 74 72 6f 6c 69 67 65 65 66 63 60 60 61 63 : uutroligeefc``ac
43400 : __ __ __ BYT 64 64 66 6a 6d 70 71 70 70 71 6e 68 63 62 5f 5a : ddfjmpqppqnhcb_Z
43410 : __ __ __ BYT 57 56 54 53 53 56 59 5c 5f 62 63 64 65 65 64 62 : WVTSSVY\_bcdeedb
43420 : __ __ __ BYT 61 60 5f 5d 5d 5e 5f 60 64 6a 6f 71 71 72 75 7a : a`_]]^_`djoqqruz
43430 : __ __ __ BYT 7d 7f 82 87 8d 91 95 98 9c a3 ab b1 b2 b0 ad ab : }...............
43440 : __ __ __ BYT a9 a8 a9 aa a8 a5 a4 a5 a7 a6 a4 a4 a8 ac ad ab : ................
43450 : __ __ __ BYT a5 9d 97 95 95 93 8f 8b 88 85 80 7d 7c 7b 78 76 : ...........}|{xv
43460 : __ __ __ BYT 75 75 75 74 75 77 7a 7c 7e 80 82 83 84 85 86 87 : uuutuwz|~.......
43470 : __ __ __ BYT 8b 8d 8e 8e 90 93 94 96 98 9a 9b 9d 9f a1 a2 a2 : ................
43480 : __ __ __ BYT a2 a3 a4 a5 a6 a6 a6 a6 a7 a7 a7 a8 a8 a8 a8 a8 : ................
43490 : __ __ __ BYT a6 a4 a1 9e 9b 97 95 92 8f 8b 88 85 82 7e 7a 75 : .............~zu
434a0 : __ __ __ BYT 72 71 6e 6a 68 6a 69 65 60 5c 59 56 53 51 51 52 : rqnjhjie`\YVSQQR
434b0 : __ __ __ BYT 52 51 4e 4d 4e 4d 4a 46 48 4d 4e 4c 4b 4b 4b 4b : RQNMNMJFHMNLKKKK
434c0 : __ __ __ BYT 4c 4f 53 56 59 5b 5d 60 63 64 65 66 67 68 69 6b : LOSVY[]`cdefghik
434d0 : __ __ __ BYT 6e 70 72 73 73 75 77 78 79 7b 7d 81 83 84 84 87 : nprssuwxy{}.....
434e0 : __ __ __ BYT 88 89 8a 8c 8e 8f 90 90 90 90 91 93 94 96 97 99 : ................
434f0 : __ __ __ BYT 99 99 99 98 97 97 98 95 92 92 93 92 90 90 8f 8d : ................
43500 : __ __ __ BYT 8b 88 87 85 82 80 7e 7b 79 77 74 70 6e 6e 6e 6c : ......~{ywtpnnnl
43510 : __ __ __ BYT 6a 6a 6a 68 65 64 63 62 62 61 61 61 61 61 61 63 : jjjhedcbbaaaaaac
43520 : __ __ __ BYT 65 67 68 6a 6b 6e 70 72 74 76 79 7a 7b 7c 7e 81 : eghjknprtvyz{|~.
43530 : __ __ __ BYT 83 85 86 88 8a 8c 8e 8f 92 96 98 98 9a 9c 9e 9e : ................
43540 : __ __ __ BYT 9e 9f a1 a3 a4 a3 a4 a5 a6 a7 a6 a4 a4 a5 a7 a7 : ................
43550 : __ __ __ BYT a6 a5 a5 a5 a5 a4 a3 a2 a1 a1 a0 a0 a0 9f 9e 9b : ................
43560 : __ __ __ BYT 97 93 8f 8b 86 82 80 7d 7a 76 71 6d 69 65 62 62 : .......}zvqmiebb
43570 : __ __ __ BYT 61 60 5e 5d 5b 59 56 52 4e 4b 49 49 47 44 41 3e : a`^][YVRNKIIGDA>
43580 : __ __ __ BYT 3b 3a 3a 3c 3c 39 38 3b 3e 41 44 46 48 4c 50 53 : ;::<<98;>ADFHLPS
43590 : __ __ __ BYT 58 5e 62 64 67 6b 70 75 77 78 79 7d 81 86 89 8b : X^bdgkpuwxy}....
435a0 : __ __ __ BYT 8e 92 96 99 9d a2 a6 a6 a3 a1 a0 a1 a2 a2 a2 a3 : ................
435b0 : __ __ __ BYT a4 a4 a5 a8 a9 aa aa ab ac ae ae ad ab a6 a1 9f : ................
435c0 : __ __ __ BYT a0 a2 a5 a8 ab aa a9 a8 a7 a3 9e 98 96 94 92 90 : ................
435d0 : __ __ __ BYT 8d 89 86 84 82 82 85 89 8c 8c 8c 8c 8c 8a 85 7e : ...............~
435e0 : __ __ __ BYT 79 75 72 6f 6c 6a 68 69 6b 6d 6f 72 75 77 79 7d : yuroljhikmoruwy}
435f0 : __ __ __ BYT 81 84 86 89 8b 8b 8c 8d 8e 8e 8a 84 7d 7b 7f 89 : ............}{..
43600 : __ __ __ BYT 92 95 94 95 99 9a 98 95 95 94 94 94 94 94 92 8b : ................
43610 : __ __ __ BYT 80 75 70 73 7c 81 80 7e 7d 7d 7a 76 74 71 70 6e : .ups|..~}}zvtqpn
43620 : __ __ __ BYT 6c 6b 6c 6e 6e 6c 6a 6b 6c 6d 6d 6c 6c 6b 6a 6a : lklnnljklmmllkjj
43630 : __ __ __ BYT 6b 6d 6e 6e 6e 6f 73 79 7f 81 81 80 81 81 80 7f : kmnnnosy........
43640 : __ __ __ BYT 7f 7f 7d 7c 7b 7c 7c 7c 7a 7a 7b 7e 84 89 8a 89 : ..}|{|||zz{~....
43650 : __ __ __ BYT 87 86 85 83 82 80 7e 7c 7b 7a 79 77 74 73 71 70 : ......~|{zywtsqp
43660 : __ __ __ BYT 6f 6c 6a 6a 69 69 68 68 67 66 64 62 61 61 63 64 : oljjiihhgfdbaacd
43670 : __ __ __ BYT 65 65 65 66 65 63 60 5f 5e 5d 5c 5a 5a 5a 5b 5b : eeefec`_^]\ZZZ[[
43680 : __ __ __ BYT 5c 5d 5f 61 65 68 6b 6d 6e 6e 6d 6b 69 67 66 65 : \]_aehkmnnmkigfe
43690 : __ __ __ BYT 64 63 63 64 65 67 69 6a 6b 6c 6d 6e 6f 70 71 72 : dccdegijklmnopqr
436a0 : __ __ __ BYT 72 72 71 70 6e 6d 6e 70 72 74 76 77 78 7a 7e 80 : rrqpnmnprtvwxz~.
436b0 : __ __ __ BYT 81 81 82 83 84 85 86 86 86 85 86 86 87 88 8a 8c : ................
436c0 : __ __ __ BYT 8d 8d 8f 91 93 93 93 95 97 98 99 9b 9d a0 a3 a7 : ................
436d0 : __ __ __ BYT aa ab a8 a7 a8 aa aa a7 a5 a5 a5 a5 a6 a6 a6 a7 : ................
436e0 : __ __ __ BYT a8 a8 aa ae b1 b4 b5 b2 af af b0 af ad ac ac ad : ................
436f0 : __ __ __ BYT ac ac ad ad ac aa a9 a8 a6 a3 9f 9a 95 91 8d 88 : ................
43700 : __ __ __ BYT 83 80 7d 7a 77 74 72 71 70 6f 6e 6c 6c 6c 6a 67 : ..}zwtrqponllljg
43710 : __ __ __ BYT 64 60 5d 5a 57 54 52 51 51 4f 4e 4d 4e 4e 4e 4f : d`]ZWTRQQONMNNNO
43720 : __ __ __ BYT 50 51 53 54 55 57 5a 5b 5d 60 62 64 67 6a 6d 70 : PQSTUWZ[]`bdgjmp
43730 : __ __ __ BYT 73 76 79 7c 7f 82 85 87 89 8b 8f 92 94 96 97 99 : svy|............
43740 : __ __ __ BYT 9c 9d 9e 9f 9f a0 a1 a1 a2 a3 a4 a6 a6 a6 a5 a5 : ................
43750 : __ __ __ BYT a6 a6 a5 a4 a3 a5 a6 a7 a6 a6 a6 a5 a0 9a 95 91 : ................
43760 : __ __ __ BYT 8e 8b 87 82 7e 7b 79 77 74 72 71 70 6f 6e 6e 6e : ....~{ywtrqponnn
43770 : __ __ __ BYT 6e 6c 6b 6a 69 66 62 5e 5b 5a 59 57 53 51 50 52 : nlkjifb^[ZYWSQPR
43780 : __ __ __ BYT 52 51 52 57 5d 5f 5e 5f 66 6e 73 71 6e 6f 72 74 : RQRW]_^_fnsqnort
43790 : __ __ __ BYT 76 76 75 74 73 75 78 7a 7b 7d 81 84 84 82 81 83 : vvutsuxz{}......
437a0 : __ __ __ BYT 86 87 85 85 87 89 8b 8d 8f 91 92 95 98 9a 99 96 : ................
437b0 : __ __ __ BYT 96 99 99 94 8d 8c 90 93 90 8b 88 85 80 7d 7d 7e : .............}}~
437c0 : __ __ __ BYT 7e 7e 7f 81 82 83 86 8a 8d 8c 8b 8e 92 95 95 93 : ~~..............
437d0 : __ __ __ BYT 91 8e 89 86 86 87 85 82 81 83 83 82 80 80 80 80 : ................
437e0 : __ __ __ BYT 7f 7f 7e 7e 7d 7d 7c 7b 7a 7a 79 7a 7a 79 79 79 : ..~~}}|{zzyzzyyy
437f0 : __ __ __ BYT 79 78 77 76 75 73 71 70 6f 6d 6d 6c 6b 6b 6a 69 : yxwvusqpommlkkji
43800 : __ __ __ BYT 68 68 67 67 67 68 69 6a 6b 6c 6d 6f 70 72 74 75 : hhggghijklmoprtu
43810 : __ __ __ BYT 77 7a 7d 7f 80 80 81 83 86 87 89 8a 8b 8c 8e 90 : wz}.............
43820 : __ __ __ BYT 91 92 93 94 95 95 95 95 96 96 96 95 94 94 95 96 : ................
43830 : __ __ __ BYT 96 95 95 96 96 96 94 93 92 92 91 8f 8d 8b 8a 89 : ................
43840 : __ __ __ BYT 88 86 84 84 83 81 80 7e 7e 7e 7e 7c 79 76 73 71 : .......~~~~|yvsq
43850 : __ __ __ BYT 6f 6b 68 65 62 60 5f 5c 59 57 55 54 53 52 51 50 : okheb`_\YWUTSRQP
43860 : __ __ __ BYT 50 50 50 4e 4c 4b 4a 48 44 41 3f 3d 3d 3c 3b 3d : PPPNLKJHDA?==<;=
43870 : __ __ __ BYT 44 4b 50 53 57 5b 61 65 67 67 66 66 66 66 66 66 : DKPSW[aeggffffff
43880 : __ __ __ BYT 65 64 64 65 66 68 6b 6f 75 7b 81 85 89 8d 93 98 : eddefhkou{......
43890 : __ __ __ BYT 99 99 97 97 98 99 99 98 97 97 97 96 96 95 94 94 : ................
438a0 : __ __ __ BYT 94 95 97 97 98 99 9b 9d 9e 9f a0 a2 a4 a6 a8 a8 : ................
438b0 : __ __ __ BYT a9 aa aa a9 a9 a8 a7 a8 a9 aa a9 a9 a9 aa aa aa : ................
438c0 : __ __ __ BYT aa aa aa ab ab ab ab a9 a8 a7 a6 a4 a1 9f 9d 9b : ................
438d0 : __ __ __ BYT 97 92 8f 8c 8b 88 86 84 82 82 83 87 8a 8a 89 87 : ................
438e0 : __ __ __ BYT 86 85 85 84 82 7f 7d 7a 77 72 6f 6e 6d 6c 6b 6b : ......}zwronmlkk
438f0 : __ __ __ BYT 6a 69 69 6b 6d 6c 6a 68 66 66 67 69 6a 6d 6f 6e : jiikmljhffgijmon
43900 : __ __ __ BYT 6d 6c 6e 70 70 6e 6c 6a 69 66 63 60 5d 5a 58 57 : mlnppnljifc`]ZXW
43910 : __ __ __ BYT 56 56 57 58 5a 5f 62 61 5f 5e 61 64 65 64 63 64 : VVWXZ_ba_^adedcd
43920 : __ __ __ BYT 65 66 65 64 64 66 68 6b 6d 6f 71 72 73 75 77 79 : efeddfhkmoqrsuwy
43930 : __ __ __ BYT 7a 7c 7e 7f 80 83 86 89 8b 8e 91 94 96 98 9b 9d : z|~.............
43940 : __ __ __ BYT 9f a1 a4 a7 aa ad af af ae ad ab a7 a4 a5 a5 a5 : ................
43950 : __ __ __ BYT a6 a5 a4 a4 a5 a5 a4 a4 a3 a2 a2 a2 a2 a3 a4 a3 : ................
43960 : __ __ __ BYT a1 9f 9d 99 94 90 8e 8d 8c 8a 89 87 86 85 85 84 : ................
43970 : __ __ __ BYT 83 83 83 82 81 80 7f 7f 7e 7c 7b 7a 79 79 78 77 : ........~|{zyyxw
43980 : __ __ __ BYT 76 75 74 73 72 72 73 74 75 75 75 75 75 75 75 75 : vutsrrstuuuuuuuu
43990 : __ __ __ BYT 75 74 73 70 6e 6d 6c 6a 68 67 66 63 61 60 5f 5d : utspnmljhgfca`_]
439a0 : __ __ __ BYT 5c 5c 5b 5a 59 59 59 5a 5b 5d 5f 5e 5d 5c 5d 5e : \\[ZYYYZ[]_^]\]^
439b0 : __ __ __ BYT 5d 5d 5f 61 62 63 65 67 68 69 69 69 69 6b 6d 6e : ]]_abceghiiiikmn
439c0 : __ __ __ BYT 6f 72 75 78 7a 7c 80 84 87 88 89 8c 8f 90 8f 8c : oruxz|..........
439d0 : __ __ __ BYT 8a 8c 8e 8d 89 89 8e 93 93 8e 8a 8b 8e 8f 91 94 : ................
439e0 : __ __ __ BYT 98 9c 9f a1 a2 a5 a7 a6 a2 9f 9f a0 9f 99 94 96 : ................
439f0 : __ __ __ BYT 9b 9b 95 8e 8b 8a 8a 89 89 88 89 89 8b 8c 8c 8d : ................
43a00 : __ __ __ BYT 8e 91 96 9b 9c 9a 97 96 97 99 99 96 93 92 92 92 : ................
43a10 : __ __ __ BYT 90 8d 8b 8a 88 85 82 7e 7c 7a 7b 7e 81 82 80 7f : .......~|z{~....
43a20 : __ __ __ BYT 7e 7f 81 82 81 81 80 80 82 83 83 81 81 80 7f 7e : ~..............~
43a30 : __ __ __ BYT 7b 79 78 79 7a 7b 7a 79 79 7a 7a 7a 7a 7b 7a 7a : {yxyz{zyyzzzz{zz
43a40 : __ __ __ BYT 7a 7a 7a 7b 7b 79 78 78 77 76 75 73 72 72 71 6f : zzz{{yxxwvusrrqo
43a50 : __ __ __ BYT 6d 6a 67 65 63 60 5e 5c 5b 59 58 56 55 54 53 53 : mjgec`^\[YXVUTSS
43a60 : __ __ __ BYT 52 52 52 52 52 53 54 55 54 54 52 51 4f 4f 4f 4e : RRRRRSTUTTRQOOON
43a70 : __ __ __ BYT 4c 4b 4b 4b 4a 4a 4b 4b 4b 4d 4f 51 52 54 56 59 : LKKKJJKKKMOQRTVY
43a80 : __ __ __ BYT 5b 5e 60 62 65 66 68 6b 6f 73 77 7a 7d 81 85 88 : [^`befhkoswz}...
43a90 : __ __ __ BYT 8c 90 94 96 9a 9e a1 a2 a3 a3 a2 a2 a4 a6 a8 a8 : ................
43aa0 : __ __ __ BYT a7 a8 a8 a8 a8 a9 aa ad b1 b3 b4 b3 b2 b0 ae ac : ................
43ab0 : __ __ __ BYT ac aa a7 a4 a0 9d 9a 99 99 99 98 96 95 94 93 92 : ................
43ac0 : __ __ __ BYT 91 8f 8f 90 91 90 8e 8c 89 86 84 83 82 80 7d 7b : ..............}{
43ad0 : __ __ __ BYT 79 78 79 7a 7a 7b 7b 7c 7b 7c 7e 80 80 7f 80 81 : yxyzz{{|{|~.....
43ae0 : __ __ __ BYT 82 83 85 87 87 88 87 87 88 8a 8b 8c 8d 8d 8d 8c : ................
43af0 : __ __ __ BYT 8c 8b 89 87 85 85 85 84 84 84 83 83 83 83 85 86 : ................
43b00 : __ __ __ BYT 85 83 81 81 82 83 84 85 84 84 84 83 80 7c 78 76 : .............|xv
43b10 : __ __ __ BYT 74 72 73 75 78 79 79 7a 7b 7b 7b 7c 7d 7c 7c 7b : trsuxyyz{{{|}||{
43b20 : __ __ __ BYT 7b 7c 7e 80 81 82 83 83 82 80 80 80 81 82 83 87 : {|~.............
43b30 : __ __ __ BYT 89 8a 8b 8d 8e 8f 8f 8f 90 90 90 8f 8f 8f 8f 90 : ................
43b40 : __ __ __ BYT 90 90 8f 90 90 8f 8d 8c 8c 8a 88 87 85 82 7f 7c : ...............|
43b50 : __ __ __ BYT 7a 79 77 75 74 73 72 71 72 72 71 70 70 6f 6f 70 : zywutsrqrrqppoop
43b60 : __ __ __ BYT 70 6f 6e 6d 6c 6a 68 66 65 63 61 5e 5b 59 58 57 : ponmljhfeca^[YXW
43b70 : __ __ __ BYT 57 56 55 55 56 57 58 5a 5b 5d 5e 5f 60 62 65 67 : WVUUVWXZ[]^_`beg
43b80 : __ __ __ BYT 68 68 6a 6d 70 73 74 76 77 7a 7d 80 83 85 86 87 : hhjmpstvwz}.....
43b90 : __ __ __ BYT 88 8a 8a 88 86 86 87 89 8b 8b 89 87 85 84 81 7e : ...............~
43ba0 : __ __ __ BYT 7c 7c 7c 7b 7a 79 78 7b 7f 80 80 7f 80 83 85 85 : |||{zyx{........
43bb0 : __ __ __ BYT 84 82 82 83 85 87 87 84 82 80 7f 7c 79 77 75 72 : ...........|ywur
43bc0 : __ __ __ BYT 70 6d 6a 67 65 64 65 65 65 65 66 68 6a 6c 6f 71 : pmjgedeeeefhjloq
43bd0 : __ __ __ BYT 74 76 79 7a 7b 7c 7d 7e 7e 7f 80 81 83 84 85 83 : tvyz{|}~~.......
43be0 : __ __ __ BYT 80 7e 7d 7c 7a 78 79 79 78 77 77 77 76 76 75 74 : .~}|zxyyxwwwvvut
43bf0 : __ __ __ BYT 74 74 73 74 74 75 76 79 7c 81 87 8d 92 96 99 9a : ttsttuvy|.......
43c00 : __ __ __ BYT 9b 99 97 95 95 92 8d 88 84 83 84 86 85 81 80 80 : ................
43c10 : __ __ __ BYT 7f 7d 7c 7d 7e 81 84 88 8d 90 94 99 9e a4 a8 aa : .}|}~...........
43c20 : __ __ __ BYT ab ac ad ac a8 a4 a2 a3 a6 a9 a9 a6 a2 a2 a1 9e : ................
43c30 : __ __ __ BYT 9b 9b 9d 9f a1 a3 a3 a2 a1 a2 a3 a4 a5 a5 a5 a5 : ................
43c40 : __ __ __ BYT a5 a6 a6 a6 a6 a6 a6 a6 a5 a3 a0 9d 9b 98 96 93 : ................
43c50 : __ __ __ BYT 93 93 94 95 95 93 92 92 92 93 92 90 90 8f 8c 8a : ................
43c60 : __ __ __ BYT 89 89 88 86 85 85 85 84 82 7f 7c 7b 7a 78 75 73 : ..........|{zxus
43c70 : __ __ __ BYT 72 71 71 72 73 74 74 75 76 77 77 76 75 73 72 71 : rqqrsttuvwwvusrq
43c80 : __ __ __ BYT 72 71 6f 6e 6d 6c 6c 6b 69 68 66 64 61 5e 5b 58 : rqonmllkihfda^[X
43c90 : __ __ __ BYT 57 56 56 55 55 55 54 54 54 55 56 56 57 59 5a 5b : WVVUUUTTTUVVWYZ[
43ca0 : __ __ __ BYT 5c 5d 5d 5e 5e 5f 61 61 60 5f 5e 5e 5c 5b 59 59 : \]]^^_aa`_^^\[YY
43cb0 : __ __ __ BYT 59 59 5a 5a 5a 5b 5b 5c 5e 60 62 64 66 68 6a 6c : YYZZZ[[\^`bdfhjl
43cc0 : __ __ __ BYT 6e 6f 71 74 77 79 7a 7b 7d 7e 7f 81 83 85 86 89 : noqtwyz{}~......
43cd0 : __ __ __ BYT 8b 8d 90 93 95 94 92 90 91 92 91 8f 8e 8e 8f 8f : ................
43ce0 : __ __ __ BYT 8e 8d 8d 8e 8d 8a 89 88 88 87 85 87 8a 8d 8f 90 : ................
43cf0 : __ __ __ BYT 92 94 95 96 97 96 93 90 8d 8b 87 82 7d 7a 78 76 : ............}zxv
43d00 : __ __ __ BYT 73 70 6e 6c 69 66 62 60 60 60 5e 5c 5d 60 63 66 : spnlifb```^\]`cf
43d10 : __ __ __ BYT 67 69 6b 6d 70 72 72 73 74 74 74 72 70 6f 6e 6d : gikmprrstttrponm
43d20 : __ __ __ BYT 6c 6c 6c 6c 6d 6d 6d 6d 6e 6f 6f 70 71 72 72 73 : llllmmmmnoopqrrs
43d30 : __ __ __ BYT 75 76 78 7a 7b 7d 7f 82 84 86 87 88 88 88 87 85 : uvxz{}..........
43d40 : __ __ __ BYT 84 84 85 86 86 86 87 87 86 84 84 83 84 85 86 87 : ................
43d50 : __ __ __ BYT 88 8a 8a 8a 8c 8d 8e 90 91 93 93 93 94 94 93 91 : ................
43d60 : __ __ __ BYT 90 8d 8c 8b 8a 89 89 89 88 87 86 85 84 83 83 84 : ................
43d70 : __ __ __ BYT 85 85 86 87 88 89 8a 8b 8a 8a 8b 8d 8e 8e 8e 8f : ................
43d80 : __ __ __ BYT 8f 8f 8f 90 91 93 94 94 94 94 95 95 95 96 96 97 : ................
43d90 : __ __ __ BYT 98 97 95 94 94 93 93 92 8f 8a 89 8a 8a 89 88 87 : ................
43da0 : __ __ __ BYT 86 85 83 80 7d 7b 7a 7a 7a 7b 7b 7b 7b 7c 7d 7e : ....}{zzz{{{{|}~
43db0 : __ __ __ BYT 7e 7e 80 80 7e 7c 7b 7b 7b 7a 7a 77 73 73 75 76 : ~~..~|{{{zzwssuv
43dc0 : __ __ __ BYT 75 75 75 74 74 72 70 6e 6c 6a 69 6a 6a 6a 69 6a : uuuttrpnljijjjij
43dd0 : __ __ __ BYT 6c 6e 6f 70 71 73 74 75 77 78 79 7b 7c 7e 7f 80 : lnopqstuwxy{|~..
43de0 : __ __ __ BYT 82 83 84 85 85 85 85 85 85 85 86 86 86 86 86 86 : ................
43df0 : __ __ __ BYT 87 87 86 86 87 88 87 87 87 87 87 87 87 88 89 8a : ................
43e00 : __ __ __ BYT 8a 89 89 89 89 8a 8a 89 88 88 88 87 86 86 85 85 : ................
43e10 : __ __ __ BYT 85 85 85 85 85 85 83 82 81 7f 7e 7e 7d 7c 7b 7a : ..........~~}|{z
43e20 : __ __ __ BYT 79 78 78 78 77 75 74 73 72 72 72 71 71 71 71 71 : yxxxwutsrrrqqqqq
43e30 : __ __ __ BYT 71 71 72 72 73 74 74 75 76 76 76 76 76 76 77 78 : qqrrsttuvvvvvvwx
43e40 : __ __ __ BYT 79 79 78 79 79 79 78 78 78 77 76 75 75 74 74 74 : yyxyyyxxxwvuuttt
43e50 : __ __ __ BYT 74 74 73 73 73 74 74 75 74 75 76 77 77 78 79 7a : ttsssttutuvwwxyz
43e60 : __ __ __ BYT 7b 7d 7e 80 82 84 85 86 88 8a 8b 8c 8c 8d 8f 90 : {}~.............
43e70 : __ __ __ BYT 91 8f 8e 8c 8c 8c 8d 8e 8e 8f 90 91 91 92 92 93 : ................
43e80 : __ __ __ BYT 93 92 92 93 94 96 98 98 98 99 9a 9b 9a 9b 9c 9c : ................
43e90 : __ __ __ BYT 9c 9b 9a 9b 9c 9b 99 96 92 8e 8d 8d 8c 8b 89 88 : ................
43ea0 : __ __ __ BYT 88 88 89 89 88 88 88 87 87 87 88 88 88 88 87 86 : ................
43eb0 : __ __ __ BYT 86 86 86 85 84 83 82 81 80 80 7f 7e 7c 79 77 74 : ...........~|ywt
43ec0 : __ __ __ BYT 72 70 6f 6e 6c 6b 6a 69 6a 6a 6a 6a 6b 6c 6c 6d : rponlkjijjjjkllm
43ed0 : __ __ __ BYT 6d 6e 6f 70 70 71 71 72 73 73 73 74 74 74 74 74 : mnoppqqrsssttttt
43ee0 : __ __ __ BYT 75 75 74 73 73 73 73 72 71 71 70 70 70 6f 6f 6f : uutssssrqqpppooo
43ef0 : __ __ __ BYT 70 71 71 71 71 70 70 71 72 72 72 71 70 70 71 72 : pqqqqppqrrrqppqr
43f00 : __ __ __ BYT 72 72 71 71 71 71 72 72 72 71 70 6f 6f 6f 6e 6e : rrqqqqrrrqpooonn
43f10 : __ __ __ BYT 6e 6d 6d 6d 6d 6d 6d 6d 6d 6c 6d 6d 6d 6c 6b 69 : nmmmmmmmmlmmmlki
43f20 : __ __ __ BYT 68 68 68 68 68 68 68 69 6a 6b 6c 6e 70 71 71 72 : hhhhhhhijklnpqqr
43f30 : __ __ __ BYT 72 72 73 75 75 74 73 74 76 76 76 75 74 73 73 74 : rrsuutstvvvutsst
43f40 : __ __ __ BYT 75 76 79 7b 7c 7b 79 76 74 75 76 78 79 7a 7b 7c : uvy{|{yvtuvxyz{|
43f50 : __ __ __ BYT 7c 7e 80 82 85 87 88 89 8a 8b 8c 8d 8f 8f 8f 90 : |~..............
43f60 : __ __ __ BYT 92 93 94 94 93 91 90 90 90 90 90 91 93 93 93 92 : ................
43f70 : __ __ __ BYT 93 93 93 94 95 96 97 98 99 9a 9a 9b 9c 9e 9f 9f : ................
43f80 : __ __ __ BYT 9f a0 a1 a1 a1 a1 a3 a4 a5 a6 a6 a4 a3 a2 a1 9e : ................
43f90 : __ __ __ BYT 9a 97 93 90 8e 8c 8a 89 88 87 87 86 85 85 85 85 : ................
43fa0 : __ __ __ BYT 85 85 85 85 85 85 86 87 87 87 87 87 87 87 87 88 : ................
43fb0 : __ __ __ BYT 88 89 8a 8a 88 87 85 84 82 7f 7c 79 78 76 74 72 : ..........|yxvtr
43fc0 : __ __ __ BYT 71 71 71 71 71 71 71 71 72 72 72 72 72 72 72 73 : qqqqqqqqrrrrrrrs
43fd0 : __ __ __ BYT 74 74 74 75 76 76 77 76 76 76 75 75 76 75 75 75 : tttuvvwvvvuuvuuu
43fe0 : __ __ __ BYT 75 75 74 74 73 71 70 6f 6e 6d 6c 6d 6e 71 75 78 : uuttsqponmlmnqux
43ff0 : __ __ __ BYT 79 78 78 79 7a 7a 7a 79 79 79 79 7a 7b 7b 7b 7c : yxxyzzzyyyyz{{{|
44000 : __ __ __ BYT 7c 7d 7d 7d 7e 7e 7e 7e 7e 7f 7f 80 80 80 80 80 : |}}}~~~~~.......
44010 : __ __ __ BYT 7f 7f 7d 7c 7a 79 79 79 7a 7c 7d 7e 7d 7c 7c 7d : ..}|zyyyz|}~}||}
44020 : __ __ __ BYT 7d 7d 7e 7e 7f 80 81 83 85 86 86 87 88 89 8a 8a : }}~~............
44030 : __ __ __ BYT 8a 8a 8a 8b 8b 8b 8c 8d 8e 91 92 92 93 93 93 92 : ................
44040 : __ __ __ BYT 8f 8c 89 85 81 7f 7c 79 77 77 76 75 74 74 74 75 : ......|ywwvutttu
44050 : __ __ __ BYT 75 76 77 78 79 7b 7c 7d 7d 7e 7f 80 80 7f 80 81 : uvwxy{|}}~......
44060 : __ __ __ BYT 83 85 86 87 88 8a 8b 8c 8b 8b 8a 8a 89 87 85 82 : ................
44070 : __ __ __ BYT 7f 7c 7b 7b 7a 79 77 76 73 71 6f 6d 6c 6c 6c 6b : .|{{zywvsqomlllk
44080 : __ __ __ BYT 6a 6a 6a 6a 6b 6b 6b 6a 6b 6b 6b 6b 6b 6d 70 72 : jjjjkkkjkkkkkmpr
44090 : __ __ __ BYT 74 75 76 77 77 77 77 78 79 7b 7b 7c 7e 80 80 80 : tuvwwwwxy{{|~...
440a0 : __ __ __ BYT 81 83 84 83 83 84 85 87 89 8a 8a 8a 8a 8a 89 87 : ................
440b0 : __ __ __ BYT 85 84 84 83 80 7d 7d 7c 7b 7a 79 79 78 78 77 77 : .....}}|{zyyxxww
440c0 : __ __ __ BYT 77 78 79 79 7a 79 79 79 79 7a 7b 7c 7c 7d 7d 7d : wxyyzyyyyz{||}}}
440d0 : __ __ __ BYT 7d 7e 80 82 85 89 8d 90 92 93 94 94 94 93 92 8f : }~..............
440e0 : __ __ __ BYT 8e 8d 8b 8a 88 87 85 83 82 81 7f 7d 7c 7b 7a 79 : ...........}|{zy
440f0 : __ __ __ BYT 79 78 77 77 76 75 75 74 74 74 74 73 74 75 76 78 : yxwwvuuttttstuvx
44100 : __ __ __ BYT 79 7b 7d 7e 7f 81 82 83 84 86 87 87 88 88 88 87 : y{}~............
44110 : __ __ __ BYT 85 84 84 84 82 80 7f 7e 7e 7e 7e 7f 80 81 82 83 : .......~~~~.....
44120 : __ __ __ BYT 84 84 84 84 84 83 82 81 80 7f 7f 7f 80 81 81 81 : ................
44130 : __ __ __ BYT 81 81 7f 7e 7d 7c 7b 7a 79 78 78 78 77 76 73 71 : ...~}|{zyxxxwvsq
44140 : __ __ __ BYT 6f 6e 6e 6e 6e 6e 6f 6f 70 71 73 76 79 7c 80 83 : onnnnnoopqsvy|..
44150 : __ __ __ BYT 85 88 89 8a 8b 8c 8b 89 89 89 89 89 8a 8b 8b 8b : ................
44160 : __ __ __ BYT 8b 8b 8a 89 87 86 84 83 81 80 7f 7d 7c 7a 78 75 : ...........}|zxu
44170 : __ __ __ BYT 72 70 6f 6e 6c 6b 6b 6c 6b 6c 6c 6d 6e 6f 70 72 : rponlkklkllmnopr
44180 : __ __ __ BYT 73 74 76 77 78 7a 7b 7c 7b 7c 7d 80 82 83 84 86 : stvwxz{|{|}.....
44190 : __ __ __ BYT 87 89 89 8a 8b 8b 8c 8c 8c 8c 8c 8b 8b 8a 8a 89 : ................
441a0 : __ __ __ BYT 88 87 87 87 87 86 86 86 86 86 86 87 87 87 87 87 : ................
441b0 : __ __ __ BYT 87 87 88 89 89 89 89 89 89 8a 89 8a 8a 8b 8c 8d : ................
441c0 : __ __ __ BYT 8e 8e 8e 8e 8f 8f 8f 8e 8e 8d 8d 8d 8d 8d 8d 8c : ................
441d0 : __ __ __ BYT 8c 8c 8c 8c 8b 8a 8a 8a 8a 89 88 88 87 87 87 87 : ................
441e0 : __ __ __ BYT 89 89 88 88 89 88 88 87 86 85 83 82 80 7e 7d 7b : .............~}{
441f0 : __ __ __ BYT 7a 79 78 77 76 76 75 74 74 74 74 73 73 72 72 72 : zyxwvvuttttssrrr
44200 : __ __ __ BYT 73 73 73 73 73 73 73 74 74 73 73 73 73 73 73 73 : sssssssttsssssss
44210 : __ __ __ BYT 73 73 74 75 77 77 78 79 7b 7b 7c 7c 7c 7c 7c 7b : sstuwwxy{{|||||{
44220 : __ __ __ BYT 7a 79 79 79 78 77 78 78 79 79 79 79 79 7a 7b 7b : zyyyxwxxyyyyyz{{
44230 : __ __ __ BYT 7b 7a 7a 7b 7b 7a 7a 7b 7b 7c 7c 7d 7d 7e 7f 7f : {zz{{zz{{||}}~..
44240 : __ __ __ BYT 7f 7f 7f 7f 7f 7e 7e 7d 7d 7d 7d 7d 7b 7a 79 79 : .....~~}}}}}{zyy
44250 : __ __ __ BYT 78 78 78 78 77 77 76 76 76 76 76 76 77 77 78 78 : xxxxwwvvvvvvwwxx
44260 : __ __ __ BYT 79 79 7a 7a 7b 7b 7b 7b 7b 7a 79 79 7a 7a 7a 7a : yyzz{{{{{zyyzzzz
44270 : __ __ __ BYT 7b 7b 7b 7b 7b 7c 7d 7f 80 82 83 83 84 84 84 84 : {{{{{|}.........
44280 : __ __ __ BYT 84 85 84 84 83 81 7e 7b 79 78 76 74 73 72 71 6f : ......~{yxvtsrqo
44290 : __ __ __ BYT 6e 6e 6e 6e 6d 6c 6c 6c 6c 6c 6c 6c 6d 6d 6d 6c : nnnnmlllllllmmml
442a0 : __ __ __ BYT 6b 6b 6b 6d 6e 6e 6e 6f 70 71 72 73 74 75 78 7a : kkkmnnnopqrstuxz
442b0 : __ __ __ BYT 7c 7f 81 84 86 87 89 8b 8d 8f 92 94 94 92 8f 8d : |...............
442c0 : __ __ __ BYT 8b 8b 8a 89 89 89 8a 8a 8a 8b 8c 8d 8d 8d 8d 8e : ................
442d0 : __ __ __ BYT 8e 8e 8e 8f 8f 8e 8e 8d 8d 8d 8c 8c 8b 8b 8b 8b : ................
442e0 : __ __ __ BYT 8b 8b 8b 8a 8a 8a 89 88 86 84 82 81 81 81 80 80 : ................
442f0 : __ __ __ BYT 80 7f 7d 7b 7a 7a 7b 7d 7d 7d 7d 7d 7d 7d 7e 80 : ..}{zz{}}}}}}}~.
44300 : __ __ __ BYT 81 82 82 83 84 85 85 85 87 88 8a 8c 8e 90 8f 8d : ................
44310 : __ __ __ BYT 8c 8d 8d 8d 8c 8c 8c 8c 8c 8c 8d 8d 8d 8d 8d 8e : ................
44320 : __ __ __ BYT 8e 8d 8b 89 88 88 88 87 87 87 88 88 87 84 82 81 : ................
44330 : __ __ __ BYT 82 84 84 83 83 83 82 81 81 81 81 81 81 80 7f 7f : ................
44340 : __ __ __ BYT 7f 7f 7e 7e 7e 7f 81 82 83 82 80 7f 7e 7e 7e 7e : ..~~~.......~~~~
44350 : __ __ __ BYT 7e 7e 7d 7c 7c 7c 7d 7d 7e 7d 7e 7f 80 81 81 81 : ~~}|||}}~}~.....
44360 : __ __ __ BYT 81 81 82 82 85 88 8b 8e 8f 8e 8d 8e 8e 8d 8c 8a : ................
44370 : __ __ __ BYT 88 87 87 86 85 84 84 84 83 80 7e 7d 7d 7c 7c 7a : ..........~}}||z
44380 : __ __ __ BYT 79 78 78 78 79 79 79 78 77 78 79 79 79 78 77 76 : yxxxyyyxwxyyyxwv
44390 : __ __ __ BYT 74 75 76 78 79 77 75 76 76 77 76 76 76 74 73 73 : tuvxywuvvwvvvtss
443a0 : __ __ __ BYT 74 77 7a 7b 7c 7d 7d 7d 7d 7e 7e 7c 7a 7a 79 79 : twz{|}}}}~~|zzyy
443b0 : __ __ __ BYT 78 76 75 74 73 72 71 70 6f 6f 70 70 71 72 71 71 : xvutsrqpooppqrqq
443c0 : __ __ __ BYT 71 71 71 71 71 72 72 74 75 75 75 75 74 72 72 73 : qqqqqrrtuuuutrrs
443d0 : __ __ __ BYT 75 77 77 75 75 75 76 75 74 74 74 73 72 72 72 72 : uwwuuuvutttsrrrr
443e0 : __ __ __ BYT 73 73 73 74 74 74 75 75 75 76 76 77 77 76 75 75 : ssstttuuuvvwwvuu
443f0 : __ __ __ BYT 74 74 73 72 72 72 73 73 74 75 76 77 77 77 77 77 : ttsrrrsstuvwwwww
44400 : __ __ __ BYT 78 79 7a 7b 7c 7d 7e 7e 7f 80 80 80 80 81 81 81 : xyz{|}~~........
44410 : __ __ __ BYT 82 82 82 82 82 82 82 82 82 81 80 80 80 7f 7f 7f : ................
44420 : __ __ __ BYT 7f 7f 80 80 80 81 81 81 82 83 83 84 84 83 83 82 : ................
44430 : __ __ __ BYT 81 80 7f 7f 7e 7d 7c 7b 7a 7a 79 79 79 79 79 7a : ....~}|{zzyyyyyz
44440 : __ __ __ BYT 7a 7b 7b 7c 7d 7e 7f 80 81 81 82 82 82 83 84 85 : z{{|}~..........
44450 : __ __ __ BYT 86 87 89 8c 8e 90 91 93 95 96 96 96 96 97 98 97 : ................
44460 : __ __ __ BYT 97 97 98 99 99 99 99 99 99 99 99 9a 9b 9b 9b 9a : ................
44470 : __ __ __ BYT 98 96 94 93 92 90 8f 8d 8c 8b 8a 89 89 88 88 88 : ................
44480 : __ __ __ BYT 88 87 86 86 86 85 84 83 83 82 82 81 7f 7e 7d 7c : .............~}|
44490 : __ __ __ BYT 7b 7b 7a 7a 7a 7b 7b 7d 7e 7f 7f 7f 80 80 80 80 : {{zzz{{}~.......
444a0 : __ __ __ BYT 81 83 83 84 85 86 87 88 89 8b 8c 8d 8e 8f 90 90 : ................
444b0 : __ __ __ BYT 91 91 91 91 91 91 90 8f 8e 8b 89 88 88 89 89 88 : ................
444c0 : __ __ __ BYT 87 87 87 87 86 85 85 85 83 82 80 7e 7c 7a 79 78 : ...........~|zyx
444d0 : __ __ __ BYT 77 76 74 73 71 70 6e 6d 6b 6a 69 68 67 66 65 64 : wvtsqpnmkjihgfed
444e0 : __ __ __ BYT 63 63 63 64 65 66 66 67 68 69 6a 6b 6c 6e 70 71 : cccdeffghijklnpq
444f0 : __ __ __ BYT 73 75 76 78 7a 7b 7c 7e 80 82 83 84 84 84 84 84 : suvxz{|~........
44500 : __ __ __ BYT 84 85 86 84 82 80 7e 7c 7a 78 76 74 74 74 74 75 : ......~|zxvttttu
44510 : __ __ __ BYT 74 72 72 72 72 73 73 73 73 72 71 71 71 71 71 70 : trrrrssssrqqqqqp
44520 : __ __ __ BYT 70 6f 6e 6e 6c 6c 6c 6c 6d 6d 6c 6c 6c 6d 6d 6d : ponnllllmmlllmmm
44530 : __ __ __ BYT 6e 6e 6e 6f 70 71 72 73 75 76 78 7a 7b 7d 7f 80 : nnnopqrsuvxz{}..
44540 : __ __ __ BYT 81 81 83 84 85 86 87 88 88 87 86 86 86 84 82 80 : ................
44550 : __ __ __ BYT 7e 7d 7c 7b 7b 7d 7e 7d 7c 7c 7c 7c 7b 7b 7b 7b : ~}|{{}~}||||{{{{
44560 : __ __ __ BYT 7a 7a 7b 7e 7f 7f 80 82 84 85 85 85 84 83 84 85 : zz{~............
44570 : __ __ __ BYT 85 83 81 80 80 81 81 80 7f 7e 7e 7f 80 7f 7f 7f : .........~~.....
44580 : __ __ __ BYT 80 81 82 82 82 82 82 82 83 83 82 80 7f 7e 7f 7f : .............~..
44590 : __ __ __ BYT 7f 80 83 85 86 87 87 88 88 8a 8b 8c 8c 8c 8c 8d : ................
445a0 : __ __ __ BYT 8d 8c 8b 89 88 87 86 85 84 82 80 81 82 82 82 83 : ................
445b0 : __ __ __ BYT 84 86 86 87 87 87 87 87 88 89 89 88 87 86 87 87 : ................
445c0 : __ __ __ BYT 87 86 85 85 85 86 86 86 86 86 87 88 88 88 88 88 : ................
445d0 : __ __ __ BYT 88 89 89 89 89 88 87 86 86 85 85 85 87 88 88 89 : ................
445e0 : __ __ __ BYT 8a 8a 8b 8c 8e 90 91 92 92 93 93 93 92 91 90 8f : ................
445f0 : __ __ __ BYT 8e 8c 8b 8a 88 86 85 83 82 81 80 7f 7e 7d 7c 7b : ............~}|{
44600 : __ __ __ BYT 7a 7a 7a 7a 7b 7c 7c 7b 7a 79 78 77 76 75 74 73 : zzzz{||{zyxwvuts
44610 : __ __ __ BYT 73 72 72 71 71 71 71 71 71 72 72 72 72 73 74 74 : srrqqqqqqrrrrstt
44620 : __ __ __ BYT 75 77 78 78 78 78 79 79 7a 7a 7b 7c 7d 7e 7f 7f : uwxxxxyyzz{|}~..
44630 : __ __ __ BYT 7f 80 81 82 83 84 84 86 87 88 88 89 89 8a 8b 8c : ................
44640 : __ __ __ BYT 8c 8c 8b 8a 89 88 86 85 84 83 81 80 7e 7d 7c 7b : ............~}|{
44650 : __ __ __ BYT 7a 7a 7a 7a 79 78 77 75 74 74 72 71 70 6f 6e 6e : zzzzyxwuttrqponn
44660 : __ __ __ BYT 6d 6c 6c 6b 6b 6b 6b 6b 6b 6b 6b 6c 6c 6c 6d 6d : mllkkkkkkkklllmm
44670 : __ __ __ BYT 6e 6f 6f 70 71 72 73 74 75 76 77 78 79 7a 7a 7a : noopqrstuvwxyzzz
44680 : __ __ __ BYT 7b 7b 7c 7c 7c 7d 7e 7f 80 80 81 81 82 83 85 85 : {{|||}~.........
44690 : __ __ __ BYT 85 86 86 86 86 85 85 84 84 83 82 81 80 7e 7c 7b : .............~|{
446a0 : __ __ __ BYT 7a 79 77 77 76 76 76 77 77 77 77 77 77 78 78 78 : zywwvvvwwwwwwxxx
446b0 : __ __ __ BYT 78 78 78 78 78 78 79 79 7a 7a 7b 7b 7b 7c 7c 7d : xxxxxxyyzz{{{||}
446c0 : __ __ __ BYT 7e 7e 7e 7f 7f 80 81 82 83 84 84 85 86 87 88 88 : ~~~.............
446d0 : __ __ __ BYT 89 89 89 89 89 89 89 88 87 87 86 86 85 85 85 85 : ................
446e0 : __ __ __ BYT 85 85 85 85 86 86 86 87 88 88 88 88 86 85 85 84 : ................
446f0 : __ __ __ BYT 82 81 81 81 82 81 80 7f 7e 7f 7f 7d 7c 7b 7b 7a : ........~..}|{{z
44700 : __ __ __ BYT 79 78 78 78 77 77 76 76 76 76 77 77 78 78 78 79 : yxxxwwvvvvwwxxxy
44710 : __ __ __ BYT 79 79 7a 7b 7c 7d 7d 7e 7f 7f 80 81 82 83 84 85 : yyz{|}}~........
44720 : __ __ __ BYT 86 86 87 88 89 88 88 89 89 88 88 87 87 87 86 86 : ................
44730 : __ __ __ BYT 86 85 85 85 85 86 86 87 87 87 88 89 89 89 89 89 : ................
44740 : __ __ __ BYT 88 87 87 86 86 86 86 87 88 88 88 86 86 85 85 84 : ................
44750 : __ __ __ BYT 83 82 82 81 7f 7d 7c 7b 7b 7b 7a 7a 7b 7b 7a 7a : .....}|{{{zz{{zz
44760 : __ __ __ BYT 7a 7a 7a 7b 7b 7a 7b 7b 7c 7c 7c 7c 7c 7c 7c 7d : zzz{{z{{|||||||}
44770 : __ __ __ BYT 7c 7c 7d 7e 80 81 81 81 81 81 80 80 81 81 81 81 : ||}~............
44780 : __ __ __ BYT 81 81 81 81 81 81 80 7f 7f 7f 80 81 82 82 82 82 : ................
44790 : __ __ __ BYT 83 83 83 83 83 84 84 83 82 82 82 81 81 81 82 82 : ................
447a0 : __ __ __ BYT 82 81 81 81 82 82 82 82 83 84 85 84 84 83 83 83 : ................
447b0 : __ __ __ BYT 83 83 83 82 81 80 80 80 7f 7e 7e 7e 7d 7c 7c 7c : .........~~~}|||
447c0 : __ __ __ BYT 7c 7b 7b 7b 7b 7b 7b 7b 7a 7a 7b 7d 7e 7f 7f 7f : |{{{{{{{zz{}~...
447d0 : __ __ __ BYT 7f 7e 7e 7d 7d 7d 7d 7e 7f 7e 7e 7e 7e 7e 7d 7d : .~~}}}}~.~~~~~}}
447e0 : __ __ __ BYT 7c 7d 7d 7d 7d 7d 7e 7e 7e 7f 80 80 81 81 82 83 : |}}}}}~~~.......
447f0 : __ __ __ BYT 83 83 83 82 82 82 83 83 84 83 82 82 82 82 82 82 : ................
44800 : __ __ __ BYT 82 83 83 83 82 82 82 81 80 7f 7e 7d 7c 7b 7b 79 : ..........~}|{{y
44810 : __ __ __ BYT 78 78 77 77 76 74 73 73 73 72 72 71 71 71 71 71 : xxwwvtsssrrqqqqq
44820 : __ __ __ BYT 71 71 72 73 73 74 74 74 75 75 76 76 76 76 76 77 : qqrsstttuuvvvvvw
44830 : __ __ __ BYT 78 79 7a 7b 7b 7b 7b 7c 7c 7c 7c 7d 7e 7e 7e 7e : xyz{{{{||||}~~~~
44840 : __ __ __ BYT 7f 7f 80 81 82 83 84 85 83 82 81 81 82 81 81 81 : ................
44850 : __ __ __ BYT 81 80 7f 7e 7d 7c 7c 7b 7a 79 78 78 77 77 76 76 : ...~}||{zyxxwwvv
44860 : __ __ __ BYT 78 79 79 78 77 78 78 77 76 76 77 77 77 78 78 78 : xyyxwxxwvvwwwxxx
44870 : __ __ __ BYT 78 78 79 79 79 79 79 79 79 79 79 79 7a 7a 7b 7b : xxyyyyyyyyyyzz{{
44880 : __ __ __ BYT 7b 7c 7c 7c 7d 7d 7e 7f 7f 80 80 81 82 82 82 83 : {|||}}~.........
44890 : __ __ __ BYT 84 84 84 85 85 85 86 86 87 87 87 88 87 87 87 87 : ................
448a0 : __ __ __ BYT 87 87 88 88 88 87 86 85 84 85 85 85 85 85 85 84 : ................
448b0 : __ __ __ BYT 82 81 80 7f 7f 7e 7d 7d 7c 7c 7b 7a 7a 7b 7c 7e : .....~}}||{zz{|~
448c0 : __ __ __ BYT 7e 7e 7e 7f 80 7f 7f 7f 7f 80 7f 7f 7f 7f 7e 7d : ~~~...........~}
448d0 : __ __ __ BYT 7e 7e 7e 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 80 80 7f : ~~~.............
448e0 : __ __ __ BYT 80 80 80 81 81 82 82 82 83 84 84 84 84 84 84 84 : ................
448f0 : __ __ __ BYT 84 84 85 85 85 85 85 86 87 88 89 89 8a 8a 8a 8b : ................
44900 : __ __ __ BYT 8b 8b 8b 8b 8b 8b 8b 8b 8b 8a 8a 89 89 89 89 88 : ................
44910 : __ __ __ BYT 86 86 85 84 83 82 82 82 82 81 81 80 80 80 80 80 : ................
44920 : __ __ __ BYT 80 80 80 80 80 81 81 81 81 81 82 81 81 81 81 80 : ................
44930 : __ __ __ BYT 7f 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7d 7d 7d 7c 7c : .~~~~~~~~~~}}}||
44940 : __ __ __ BYT 7c 7c 7c 7c 7c 7c 7d 7d 7d 7e 7e 7e 7e 7e 7f 7f : ||||||}}}~~~~~..
44950 : __ __ __ BYT 7e 7e 7e 7e 7e 7e 7e 7e 7f 7f 80 81 81 82 82 83 : ~~~~~~~~........
44960 : __ __ __ BYT 83 83 83 83 82 82 81 81 81 80 80 7f 7e 7d 7d 7c : ............~}}|
44970 : __ __ __ BYT 7c 7c 7b 7a 79 79 78 78 77 77 76 76 76 76 76 75 : ||{zyyxxwwvvvvvu
44980 : __ __ __ BYT 75 76 76 76 77 77 77 77 77 78 78 79 79 79 7a 7a : uvvvwwwwwxxyyyzz
44990 : __ __ __ BYT 7a 7b 7b 7c 7c 7d 7d 7d 7e 7e 7e 7e 7f 7f 80 80 : z{{||}}}~~~~....
449a0 : __ __ __ BYT 80 80 81 82 82 82 82 83 83 83 83 83 84 84 84 84 : ................
449b0 : __ __ __ BYT 84 83 83 82 82 82 82 81 81 81 81 81 81 81 81 80 : ................
449c0 : __ __ __ BYT 80 7f 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7d 7c 7b 7b : ..~~~~~~~~~~}|{{
449d0 : __ __ __ BYT 7b 7a 7a 7a 79 78 77 77 76 75 75 74 74 73 73 73 : {zzzyxwwvuuttsss
449e0 : __ __ __ BYT 74 73 73 73 73 73 73 73 74 75 76 76 76 77 78 78 : tssssssstuvvvwxx
449f0 : __ __ __ BYT 79 79 7a 7b 7b 7c 7d 7d 7e 7e 7f 7f 80 80 80 81 : yyz{{|}}~~......
44a00 : __ __ __ BYT 81 81 81 82 82 83 83 83 83 84 85 85 85 86 86 86 : ................
44a10 : __ __ __ BYT 86 86 87 87 87 86 85 85 86 86 86 85 84 84 84 84 : ................
44a20 : __ __ __ BYT 83 83 83 83 83 82 82 81 80 7f 7e 7d 7d 7d 7d 7c : ..........~}}}}|
44a30 : __ __ __ BYT 7c 7d 7e 7e 7f 7f 7e 7e 7e 7e 7e 7d 7d 7d 7d 7c : |}~~..~~~~~}}}}|
44a40 : __ __ __ BYT 7c 7d 7d 7d 7c 7c 7c 7d 7d 7d 7d 7d 7d 7d 7e 7e : |}}}|||}}}}}}}~~
44a50 : __ __ __ BYT 7d 7d 7d 7e 7e 7d 7d 7d 7c 7c 7c 7c 7c 7c 7c 7c : }}}~~}}}||||||||
44a60 : __ __ __ BYT 7c 7d 7d 7d 7d 7d 7d 7e 7e 7e 7e 7e 7f 7f 7f 7f : |}}}}}}~~~~~....
44a70 : __ __ __ BYT 7f 7f 80 80 80 80 80 80 80 80 80 80 81 82 82 82 : ................
44a80 : __ __ __ BYT 82 83 83 84 84 85 86 85 85 84 84 84 84 84 85 85 : ................
44a90 : __ __ __ BYT 85 84 84 83 83 82 81 80 7f 7f 7e 7d 7c 7c 7b 7b : ..........~}||{{
44aa0 : __ __ __ BYT 7b 7b 7b 7b 7b 7b 7b 7a 7b 7b 7c 7c 7c 7d 7e 7e : {{{{{{{z{{|||}~~
44ab0 : __ __ __ BYT 7e 7f 7f 7f 7f 80 80 80 81 81 81 82 82 82 82 82 : ~...............
44ac0 : __ __ __ BYT 83 84 83 83 82 81 81 80 80 80 80 7f 7f 7f 7f 7f : ................
44ad0 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
44ae0 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7e 7e 7e 7e 7e 7e 7e 7e 7f 80 : ......~~~~~~~~..
44af0 : __ __ __ BYT 80 81 81 81 82 82 81 81 80 81 81 81 81 81 82 82 : ................
44b00 : __ __ __ BYT 82 82 81 81 81 80 7f 7f 7f 7e 7d 7d 7c 7d 7c 7c : .........~}}|}||
44b10 : __ __ __ BYT 7c 7d 7d 7c 7c 7c 7d 7d 7d 7d 7d 7d 7e 7e 7f 80 : |}}|||}}}}}}~~..
44b20 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 80 81 81 81 81 81 : ................
44b30 : __ __ __ BYT 82 82 83 84 84 84 84 84 84 84 84 84 84 85 85 85 : ................
44b40 : __ __ __ BYT 84 84 84 84 84 84 83 83 83 83 83 82 82 81 81 81 : ................
44b50 : __ __ __ BYT 81 80 80 80 80 80 80 7f 7f 7f 7f 7f 7f 7f 80 80 : ................
44b60 : __ __ __ BYT 7f 7e 7e 7e 7e 7e 7e 7f 7f 7e 7f 7f 7f 7f 7e 7e : .~~~~~~..~....~~
44b70 : __ __ __ BYT 7e 7e 7e 7d 7d 7d 7d 7c 7c 7b 7b 7b 7b 7a 79 79 : ~~~}}}}||{{{{zyy
44b80 : __ __ __ BYT 7a 7a 7a 7a 7a 7b 7b 7b 7b 7b 7b 7c 7c 7c 7c 7c : zzzzz{{{{{{|||||
44b90 : __ __ __ BYT 7c 7d 7e 7e 7e 7e 7e 7e 7f 7e 7e 7e 7e 7e 7e 7e : |}~~~~~~.~~~~~~~
44ba0 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 80 80 80 80 80 81 81 81 81 : ................
44bb0 : __ __ __ BYT 81 81 82 82 82 82 82 82 82 82 81 81 81 81 81 81 : ................
44bc0 : __ __ __ BYT 80 80 7f 7f 7f 7e 7e 7e 7d 7d 7e 7e 7d 7d 7d 7e : .....~~~}}~~}}}~
44bd0 : __ __ __ BYT 7e 7e 7e 7e 7f 7f 7e 7d 7c 7c 7c 7c 7c 7c 7c 7c : ~~~~..~}||||||||
44be0 : __ __ __ BYT 7c 7c 7c 7c 7c 7c 7c 7c 7c 7b 7b 7b 7b 7b 7b 7b : |||||||||{{{{{{{
44bf0 : __ __ __ BYT 7b 7b 7b 7b 7b 7b 7b 7a 7a 7a 7a 7b 7b 7b 7b 7c : {{{{{{{zzzz{{{{|
44c00 : __ __ __ BYT 7c 7c 7d 7d 7d 7e 7e 7f 7f 80 80 81 81 81 81 81 : ||}}}~~.........
44c10 : __ __ __ BYT 82 82 82 81 82 81 81 81 81 81 81 81 80 80 80 80 : ................
44c20 : __ __ __ BYT 80 80 80 81 81 80 80 80 81 81 81 81 81 80 80 80 : ................
44c30 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 80 80 80 7f 7f 80 : ................
44c40 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 : ................
44c50 : __ __ __ BYT 80 80 80 80 80 80 7f 7f 7f 7f 7e 7e 7e 7e 7d 7d : ..........~~~~}}
44c60 : __ __ __ BYT 7d 7c 7c 7c 7b 7b 7b 7b 7b 7b 7b 7b 7b 7b 7b 7b : }|||{{{{{{{{{{{{
44c70 : __ __ __ BYT 7b 7b 7b 7b 7b 7b 7b 7b 7b 7c 7c 7c 7d 7d 7d 7e : {{{{{{{{{|||}}}~
44c80 : __ __ __ BYT 7e 7f 7f 80 80 80 80 81 81 81 81 82 82 82 82 82 : ~...............
44c90 : __ __ __ BYT 82 82 82 82 82 82 82 82 82 82 82 82 82 82 82 82 : ................
44ca0 : __ __ __ BYT 82 82 82 82 82 82 81 81 81 81 81 81 81 82 81 81 : ................
44cb0 : __ __ __ BYT 81 81 81 81 81 81 81 81 81 81 81 81 81 80 80 80 : ................
44cc0 : __ __ __ BYT 80 80 80 80 80 7f 80 80 80 80 80 7f 7f 7f 7f 7f : ................
44cd0 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7e 7e 7e 7e 7e 7e 7d 7d 7d : .......~~~~~~}}}
44ce0 : __ __ __ BYT 7d 7c 7c 7c 7c 7c 7d 7d 7d 7d 7d 7d 7d 7d 7d 7d : }|||||}}}}}}}}}}
44cf0 : __ __ __ BYT 7d 7d 7d 7d 7d 7d 7d 7d 7c 7c 7c 7c 7c 7c 7c 7c : }}}}}}}}||||||||
44d00 : __ __ __ BYT 7c 7d 7d 7d 7d 7d 7e 7e 7e 7e 7e 7e 7e 7e 7f 7f : |}}}}}~~~~~~~~..
44d10 : __ __ __ BYT 7f 7f 7f 7e 7e 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ...~~...........
44d20 : __ __ __ BYT 7f 7f 80 80 80 80 80 80 80 80 80 80 81 81 81 81 : ................
44d30 : __ __ __ BYT 81 81 81 81 81 82 82 82 82 82 82 82 82 81 81 81 : ................
44d40 : __ __ __ BYT 81 81 81 81 80 80 80 80 80 80 80 80 80 80 80 80 : ................
44d50 : __ __ __ BYT 80 80 80 80 80 80 80 80 7f 7f 7f 7f 7f 7f 7f 7f : ................
44d60 : __ __ __ BYT 7f 7f 7f 7f 7e 7e 7f 7f 7f 7f 7f 7f 7f 7e 7e 7f : ....~~.......~~.
44d70 : __ __ __ BYT 7f 7f 7f 7f 7e 7e 7e 7f 7f 7f 7e 7e 7e 7d 7d 7d : ....~~~...~~~}}}
44d80 : __ __ __ BYT 7d 7d 7c 7c 7c 7c 7c 7c 7c 7d 7d 7d 7d 7d 7d 7d : }}|||||||}}}}}}}
44d90 : __ __ __ BYT 7d 7d 7d 7d 7d 7d 7d 7d 7d 7d 7d 7d 7d 7d 7d 7d : }}}}}}}}}}}}}}}}
44da0 : __ __ __ BYT 7d 7d 7e 7e 7e 7e 7e 7f 7f 7f 7f 7f 7f 7f 7f 7f : }}~~~~~.........
44db0 : __ __ __ BYT 80 80 80 80 80 80 81 81 81 81 81 81 81 81 81 81 : ................
44dc0 : __ __ __ BYT 81 81 81 81 81 81 81 81 81 81 81 81 81 81 81 81 : ................
44dd0 : __ __ __ BYT 81 81 81 81 82 82 82 81 82 82 82 82 81 81 81 81 : ................
44de0 : __ __ __ BYT 81 81 81 81 81 81 80 80 80 7f 7f 7f 7f 7f 7f 7f : ................
44df0 : __ __ __ BYT 7f 7e 7e 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : .~~.............
44e00 : __ __ __ BYT 7f 7e 7e 7e 7e 7e 7e 7d 7d 7d 7c 7c 7c 7c 7c 7c : .~~~~~~}}}||||||
44e10 : __ __ __ BYT 7b 7b 7b 7b 7b 7b 7b 7b 7b 7b 7b 7b 7b 7b 7b 7c : {{{{{{{{{{{{{{{|
44e20 : __ __ __ BYT 7c 7c 7c 7c 7c 7c 7c 7d 7d 7d 7d 7d 7d 7d 7d 7e : |||||||}}}}}}}}~
44e30 : __ __ __ BYT 7e 7e 7e 7e 7e 7e 7e 7f 7f 7f 7f 80 80 80 80 80 : ~~~~~~~.........
44e40 : __ __ __ BYT 81 81 81 81 81 81 81 80 80 80 80 80 80 80 80 80 : ................
44e50 : __ __ __ BYT 7f 7f 7f 7f 7f 80 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
44e60 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7e 7e 7e 7e 7e 7e 7e 7e 7e 7f : ......~~~~~~~~~.
44e70 : __ __ __ BYT 7f 7f 7f 7f 7e 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 80 : ....~...........
44e80 : __ __ __ BYT 80 80 80 80 80 80 81 81 81 81 81 81 80 80 80 80 : ................
44e90 : __ __ __ BYT 80 80 80 80 7f 7f 7f 7f 7f 7f 7e 7e 7e 7e 7e 7e : ..........~~~~~~
44ea0 : __ __ __ BYT 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e : ~~~~~~~~~~~~~~~~
44eb0 : __ __ __ BYT 7e 7e 7e 7e 7e 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ~~~~~...........
44ec0 : __ __ __ BYT 7f 7f 80 80 80 80 80 80 80 80 80 81 81 81 81 81 : ................
44ed0 : __ __ __ BYT 81 80 80 81 80 80 80 80 80 80 80 80 80 80 7f 7f : ................
44ee0 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
44ef0 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
44f00 : __ __ __ BYT 7f 7f 7f 7f 80 80 80 80 80 80 80 80 80 80 80 80 : ................
44f10 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 7f 7f 7f 7f 7f 7f : ................
44f20 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7e 7e : ..............~~
44f30 : __ __ __ BYT 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e : ~~~~~~~~~~~~~~~~
44f40 : __ __ __ BYT 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e : ~~~~~~~~~~~~~~~~
44f50 : __ __ __ BYT 7e 7e 7e 7e 7e 7f 7f 7e 7e 7e 7e 7e 7e 7e 7e 7e : ~~~~~..~~~~~~~~~
44f60 : __ __ __ BYT 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7f 7f 7f 7f 7f 7f : ~~~~~~~~~~......
44f70 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
44f80 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 80 80 80 80 80 80 80 80 80 : ................
44f90 : __ __ __ BYT 80 80 80 80 80 80 80 7f 7f 7f 7f 80 80 80 80 80 : ................
44fa0 : __ __ __ BYT 80 80 80 7f 80 80 80 80 80 80 80 7f 80 80 80 80 : ................
44fb0 : __ __ __ BYT 80 80 80 80 7f 7f 7f 80 80 7f 7f 7f 7f 7f 7f 7f : ................
44fc0 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7e 7e 7e 7e 7e : ...........~~~~~
44fd0 : __ __ __ BYT 7e 7e 7e 7e 7e 7d 7d 7d 7d 7d 7d 7d 7d 7d 7d 7c : ~~~~~}}}}}}}}}}|
44fe0 : __ __ __ BYT 7c 7d 7d 7d 7d 7d 7d 7d 7d 7d 7d 7d 7d 7d 7d 7d : |}}}}}}}}}}}}}}}
44ff0 : __ __ __ BYT 7e 7e 7d 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7f 7f : ~~}~~~~~~~~~~~..
45000 : __ __ __ BYT 7f 7f 7f 7f 80 80 80 80 80 80 80 80 80 80 80 80 : ................
45010 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 : ................
45020 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 7f 7f 7f 7f 80 7f 7f : ................
45030 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
45040 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
45050 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
45060 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
45070 : __ __ __ BYT 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e : ~~~~~~~~~~~~~~~~
45080 : __ __ __ BYT 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7f 7f 7f 7e : ~~~~~~~~~~~~...~
45090 : __ __ __ BYT 7e 7f 7f 7f 7e 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ~...~...........
450a0 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 80 : ................
450b0 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 : ................
450c0 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 7f : ................
450d0 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
450e0 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7e 7e 7e 7e 7e 7e : ..........~~~~~~
450f0 : __ __ __ BYT 7e 7e 7e 7e 7e 7d 7d 7d 7d 7d 7d 7d 7d 7d 7d 7d : ~~~~~}}}}}}}}}}}
45100 : __ __ __ BYT 7d 7d 7d 7d 7d 7d 7d 7d 7d 7d 7d 7d 7e 7e 7e 7e : }}}}}}}}}}}}~~~~
45110 : __ __ __ BYT 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7f 7f 7f 7f 7f : ~~~~~~~~~~~.....
45120 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
45130 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
45140 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
45150 : __ __ __ BYT 7f 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 : ................
45160 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 : ................
45170 : __ __ __ BYT 80 80 80 80 80 80 80 80 81 81 80 80 80 80 81 81 : ................
45180 : __ __ __ BYT 81 81 81 81 81 81 81 81 81 81 80 80 80 80 80 80 : ................
45190 : __ __ __ BYT 80 80 80 80 7f 7f 7f 7f 7e 7e 7e 7e 7e 7e 7e 7e : ........~~~~~~~~
451a0 : __ __ __ BYT 7d 7d 7d 7d 7d 7d 7d 7d 7d 7d 7d 7d 7d 7d 7d 7d : }}}}}}}}}}}}}}}}
451b0 : __ __ __ BYT 7d 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e : }~~~~~~~~~~~~~~~
451c0 : __ __ __ BYT 7e 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ~...............
451d0 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
451e0 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
451f0 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7e 7e 7e 7e : ............~~~~
45200 : __ __ __ BYT 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e : ~~~~~~~~~~~~~~~~
45210 : __ __ __ BYT 7e 7e 7e 7f 7f 7e 7f 7f 7f 7f 7f 7f 7f 7f 7f 80 : ~~~..~..........
45220 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 80 80 81 81 81 81 : ................
45230 : __ __ __ BYT 81 80 80 80 80 80 80 80 80 80 80 80 80 80 7f 7f : ................
45240 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7e 7e : ..............~~
45250 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
45260 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
45270 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
45280 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
45290 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
452a0 : __ __ __ BYT 7e 7e 7f 7f 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e : ~~..~~~~~~~~~~~~
452b0 : __ __ __ BYT 7e 7e 7d 7e 7e 7d 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e : ~~}~~}~~~~~~~~~~
452c0 : __ __ __ BYT 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7f 7f 7f 7f : ~~~~~~~~~~~~....
452d0 : __ __ __ BYT 7f 7f 80 80 80 80 80 80 80 80 80 80 80 80 80 80 : ................
452e0 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 7f : ................
452f0 : __ __ __ BYT 80 7f 7f 7f 7f 80 80 80 80 80 80 80 80 80 80 80 : ................
45300 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
45310 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
45320 : __ __ __ BYT 7f 7f 7f 7f 7f 7e 7e 7e 7e 7f 7f 7f 7e 7e 7e 7e : .....~~~~...~~~~
45330 : __ __ __ BYT 7e 7e 7e 7e 7e 7f 7f 7e 7e 7f 7f 7f 7f 7f 7f 7f : ~~~~~..~~.......
45340 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
45350 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
45360 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
45370 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
45380 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 : ................
45390 : __ __ __ BYT 80 80 81 81 81 81 80 80 80 80 80 80 80 80 80 80 : ................
453a0 : __ __ __ BYT 80 80 80 80 80 80 80 80 7f 7f 7f 7f 80 80 7f 7f : ................
453b0 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7e 7e : ..............~~
453c0 : __ __ __ BYT 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e : ~~~~~~~~~~~~~~~~
453d0 : __ __ __ BYT 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e : ~~~~~~~~~~~~~~~~
453e0 : __ __ __ BYT 7e 7e 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ~~..............
453f0 : __ __ __ BYT 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7f 7e 7e 7e : ~~~~~~~~~~~~.~~~
45400 : __ __ __ BYT 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e : ~~~~~~~~~~~~~~~~
45410 : __ __ __ BYT 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e : ~~~~~~~~~~~~~~~~
45420 : __ __ __ BYT 7e 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ~...............
45430 : __ __ __ BYT 7f 7f 80 80 80 80 80 80 80 80 80 80 80 80 80 80 : ................
45440 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 : ................
45450 : __ __ __ BYT 80 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7e 7e : ..............~~
45460 : __ __ __ BYT 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7f : ~~~~~~~~~~~~~~~.
45470 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
45480 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
45490 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 80 80 80 80 80 80 80 80 : ................
454a0 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 80 7f 7f 7f 7f 7f : ................
454b0 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7e 7e 7e : .............~~~
454c0 : __ __ __ BYT 7f 7f 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e : ..~~~~~~~~~~~~~~
454d0 : __ __ __ BYT 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e : ~~~~~~~~~~~~~~~~
454e0 : __ __ __ BYT 7e 7e 7e 7e 7e 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ~~~~~...........
454f0 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
45500 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 80 80 7f 80 80 : ................
45510 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 : ................
45520 : __ __ __ BYT 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 : ................
45530 : __ __ __ BYT 80 80 80 7f 7f 7f 80 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
45540 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 80 80 7f 80 80 80 7f : ................
45550 : __ __ __ BYT 80 7f 80 80 80 80 7f 7f 80 7f 7f 7f 7f 7f 7f 7f : ................
45560 : __ __ __ BYT 7f 7f 7f 7f 80 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
45570 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
45580 : __ __ __ BYT 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 80 7f 7f : ................
45590 : __ __ __ BYT 7f 7f 7f 7f 7f 80 7f 80 7f 7f 80 7f 7f 7f 7f 7f : ................
455a0 : __ __ __ BYT 80 80 80 80 80 80 7f 80 7f 80 80 80 7f 7f 7f 7f : ................
455b0 : __ __ __ BYT 80 80 80 80 7f 80 7f 7f 7f 80 80 7f 80 7f 80 7f : ................
455c0 : __ __ __ BYT 80 80 7f 80 80 7f 80 7f 80 7f 80 80 80 80 80 7f : ................
455d0 : __ __ __ BYT 80 80 80 80 7f 80 7f 80 80 7f 80 7f 80 7f 80 7f : ................
455e0 : __ __ __ BYT 80 80 80 7f 80 80 80 7f 80 80 7f 80 7f 80 7f 80 : ................
455f0 : __ __ __ BYT 80 7f 80 7f 7f 7f 80 7f 80 7f 80 7f 80 7f 80 7f : ................
45600 : __ __ __ BYT 80 7f 7f 80 7f 80 7f 7f 7f 80 7f 80 7f 80 7f 80 : ................
45610 : __ __ __ BYT 7f 80 80 7f 80 80 7f 80 7f 80 7f 80 80 7f 80 7f : ................
45620 : __ __ __ BYT 80 7f 80 80 80 80 80 7f 80 80 7f 80 80 7f 80 7f : ................
45630 : __ __ __ BYT 80 7f 80 7f 80 7f 7f 80 80 7f 80 7f 80 7f 80 80 : ................
45640 : __ __ __ BYT 7f 80 7f 80 7f 80 80 80 7f 80 7f 80 80 80 80 80 : ................
45650 : __ __ __ BYT 7f 80 7f 80 80 7f 7f 80 7f 80 7f 80 7f 80 7f 80 : ................
45660 : __ __ __ BYT 80 7f 80 7f 7f 80 7f 80 80 80 80 7f 80 80 7f 80 : ................
45670 : __ __ __ BYT 7f 80 7f 80 7f 80 80 80 80 7f 80 80 7f 80 7f 80 : ................
45680 : __ __ __ BYT 80 7f 80 7f 80 7f 80 80 7f 80 80 80 80 80 80 7f : ................
45690 : __ __ __ BYT 80 7f 80 7f 80 7f 80 7f 80 80 7f 80 80 80 80 80 : ................
456a0 : __ __ __ BYT 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 : ................
456b0 : __ __ __ BYT 80 7f 7f 80 7f 80 80 7f 80 80 7f 80 7f 80 7f 80 : ................
456c0 : __ __ __ BYT 7f 80 80 80 80 80 80 80 7f 80 80 80 80 80 7f 80 : ................
456d0 : __ __ __ BYT 7f 80 7f 80 7f 80 80 7f 80 7f 80 7f 80 80 7f 80 : ................
456e0 : __ __ __ BYT 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 : ................
456f0 : __ __ __ BYT 80 7f 80 7f 80 7f 80 7f 80 7f 80 80 80 80 80 80 : ................
45700 : __ __ __ BYT 7f 80 7f 80 7f 7f 80 7f 80 7f 80 80 80 80 7f 80 : ................
45710 : __ __ __ BYT 7f 80 7f 80 80 7f 7f 80 7f 80 80 7f 80 80 7f 80 : ................
45720 : __ __ __ BYT 80 7f 80 7f 80 7f 80 7f 80 80 80 80 80 7f 80 80 : ................
45730 : __ __ __ BYT 7f 80 80 7f 80 7f 80 80 7f 80 7f 80 80 80 7f 80 : ................
45740 : __ __ __ BYT 7f 80 80 80 7f 80 7f 80 7f 80 7f 80 80 7f 80 7f : ................
45750 : __ __ __ BYT 80 7f 80 7f 80 7f 80 7f 80 80 80 80 80 7f 80 80 : ................
45760 : __ __ __ BYT 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 80 : ................
45770 : __ __ __ BYT 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 80 80 80 80 : ................
45780 : __ __ __ BYT 80 80 7f 80 7f 80 7f 80 80 80 7f 80 7f 80 7f 80 : ................
45790 : __ __ __ BYT 80 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 80 7f : ................
457a0 : __ __ __ BYT 80 7f 80 7f 80 80 7f 80 7f 80 7f 80 7f 80 7f 80 : ................
457b0 : __ __ __ BYT 7f 80 7f 80 7f 80 80 80 80 80 80 7f 80 7f 80 7f : ................
457c0 : __ __ __ BYT 80 7f 80 7f 80 7f 80 7f 80 7f 80 80 80 80 7f 80 : ................
457d0 : __ __ __ BYT 7f 80 7f 80 80 7f 80 7f 7f 80 7f 80 80 7f 80 80 : ................
457e0 : __ __ __ BYT 7f 80 7f 80 80 7f 80 7f 80 7f 80 80 7f 80 7f 80 : ................
457f0 : __ __ __ BYT 7f 80 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f : ................
45800 : __ __ __ BYT 80 7f 80 7f 80 7f 80 7f 80 7f 80 80 7f 80 7f 80 : ................
45810 : __ __ __ BYT 7f 80 7f 80 80 7f 80 7f 80 7f 80 7f 80 80 7f 80 : ................
45820 : __ __ __ BYT 7f 80 80 7f 80 80 7f 80 7f 80 80 7f 80 7f 80 7f : ................
45830 : __ __ __ BYT 80 80 7f 80 7f 80 80 7f 80 80 7f 80 7f 80 80 80 : ................
45840 : __ __ __ BYT 7f 80 7f 80 7f 80 80 7f 80 7f 80 7f 80 80 7f 80 : ................
45850 : __ __ __ BYT 7f 80 7f 80 7f 80 7f 80 7f 80 80 80 7f 80 7f 80 : ................
45860 : __ __ __ BYT 7f 80 80 7f 80 7f 80 7f 80 7f 80 80 7f 80 7f 7f : ................
45870 : __ __ __ BYT 80 7f 80 7f 80 80 7f 80 7f 80 7f 80 7f 80 7f 80 : ................
45880 : __ __ __ BYT 80 7f 80 7f 80 7f 80 7f 80 80 7f 80 7f 80 80 7f : ................
45890 : __ __ __ BYT 80 7f 80 7f 80 7f 80 80 7f 80 80 7f 80 7f 80 7f : ................
458a0 : __ __ __ BYT 80 7f 80 80 7f 80 80 7f 80 7f 80 7f 80 7f 80 7f : ................
458b0 : __ __ __ BYT 80 7f 80 80 7f 80 7f 80 80 7f 80 7f 80 80 7f 80 : ................
458c0 : __ __ __ BYT 7f 80 7f 80 7f 7f 80 7f 80 7f 80 7f 80 80 7f 80 : ................
458d0 : __ __ __ BYT 7f 80 80 7f 80 80 80 80 80 7f 80 80 7f 80 7f 80 : ................
458e0 : __ __ __ BYT 7f 80 80 7f 80 7f 80 7f 80 7f 80 80 7f 80 7f 80 : ................
458f0 : __ __ __ BYT 7f 80 80 7f 80 7f 80 80 80 7f 80 7f 80 7f 80 80 : ................
45900 : __ __ __ BYT 7f 80 7f 80 7f 80 80 7f 80 80 80 80 80 80 80 80 : ................
45910 : __ __ __ BYT 80 80 7f 80 7f 80 7f 80 7f 7f 80 7f 80 7f 80 80 : ................
45920 : __ __ __ BYT 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 80 7f 80 : ................
45930 : __ __ __ BYT 80 7f 80 80 7f 80 7f 80 80 7f 80 7f 80 7f 80 7f : ................
45940 : __ __ __ BYT 80 7f 80 7f 80 7f 80 7f 80 80 7f 80 80 7f 80 7f : ................
45950 : __ __ __ BYT 80 80 80 7f 80 80 7f 80 7f 80 7f 80 7f 80 7f 80 : ................
45960 : __ __ __ BYT 80 80 80 80 80 7f 80 7f 80 80 7f 80 7f 80 7f 80 : ................
45970 : __ __ __ BYT 7f 80 80 80 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f : ................
45980 : __ __ __ BYT 80 7f 80 80 7f 80 7f 80 80 80 80 80 7f 80 7f 80 : ................
45990 : __ __ __ BYT 7f 80 80 7f 80 7f 80 7f 80 80 7f 80 7f 80 7f 80 : ................
459a0 : __ __ __ BYT 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f 80 : ................
459b0 : __ __ __ BYT 7f 80 7f 80 80 7f 80 80 7f 80 7f 80 7f 80 7f 80 : ................
459c0 : __ __ __ BYT 7f 80 80 80 80 7f 80 7f 80 7f 80 80 80 80 80 7f : ................
459d0 : __ __ __ BYT 80 7f 80 7f 80 7f 80 80 7f 80 7f 80 7f 80 7f 80 : ................
459e0 : __ __ __ BYT 7f 80 7f 80 80 80 7f 80 80 7f 80 7f 80 7f 80 7f : ................
459f0 : __ __ __ BYT 80 80 7f 80 7f 80 7f 80 80 7f 80 7f 80 7f 80 80 : ................
45a00 : __ __ __ BYT 7f 80 80 7f 80 80 7f 80 7f 80 7f 80 7f 80 80 7f : ................
45a10 : __ __ __ BYT 80 7f 80 7f 80 7f 80 80 7f 80 80 7f 80 7f 80 80 : ................
45a20 : __ __ __ BYT 7f 80 7f 7f 80 7f 80 7f 80 7f 80 80 80 80 7f 80 : ................
45a30 : __ __ __ BYT 7f 80 7f 80 80 7f 80 7f 80 7f 80 7f 80 7f 80 7f : ................
45a40 : __ __ __ BYT 80 80 80 80 80 7f 80 80 80 80 7f 80 7f 80 7f 80 : ................
45a50 : __ __ __ BYT 80 7f 80 80 7f 80 7f 80 80 80 80 00             : ............

; Compiled with 1.32.267
--------------------------------------------------------------------
startup: ; startup
0200 : 78 __ __ SEI
0201 : d8 __ __ CLD
0202 : a9 00 __ LDA #$00
0204 : 85 01 __ STA $01 
0206 : a2 7a __ LDX #$7a
0208 : a0 64 __ LDY #$64
020a : a9 00 __ LDA #$00
020c : 85 27 __ STA IP + 0 
020e : 86 28 __ STX IP + 1 
0210 : e0 81 __ CPX #$81
0212 : f0 0b __ BEQ $021f ; (startup + 31)
0214 : 91 27 __ STA (IP + 0),y 
0216 : c8 __ __ INY
0217 : d0 fb __ BNE $0214 ; (startup + 20)
0219 : e8 __ __ INX
021a : d0 f2 __ BNE $020e ; (startup + 14)
021c : 91 27 __ STA (IP + 0),y 
021e : c8 __ __ INY
021f : c0 8a __ CPY #$8a
0221 : d0 f9 __ BNE $021c ; (startup + 28)
0223 : a9 00 __ LDA #$00
0225 : a2 80 __ LDX #$80
0227 : d0 03 __ BNE $022c ; (startup + 44)
0229 : 95 00 __ STA $00,x 
022b : e8 __ __ INX
022c : e0 80 __ CPX #$80
022e : d0 f9 __ BNE $0229 ; (startup + 41)
0230 : a9 51 __ LDA #$51
0232 : 85 31 __ STA SP + 0 
0234 : a9 9d __ LDA #$9d
0236 : 85 32 __ STA SP + 1 
0238 : 20 80 02 JSR $0280 ; (main.s4 + 0)
023b : 4c 3b 02 JMP $023b ; (startup + 59)
023e : 60 __ __ RTS
--------------------------------------------------------------------
main: ; main()->i16
;  30, "/mnt/d/F256/oscar64/include/crt.c"
.s4:
0280 : 20 b3 02 JSR $02b3 ; (f256Init.s4 + 0)
0283 : ad 64 7a LDA $7a64 ; (kernelArgs + 0)
0286 : 85 35 __ STA T0 + 0 
0288 : ad 65 7a LDA $7a65 ; (kernelArgs + 1)
028b : 85 36 __ STA T0 + 1 
028d : a0 08 __ LDY #$08
028f : b1 35 __ LDA (T0 + 0),y 
0291 : 8d fe 9f STA $9ffe ; (sstack + 50)
0294 : c8 __ __ INY
0295 : b1 35 __ LDA (T0 + 0),y 
0297 : 8d ff 9f STA $9fff ; (sstack + 51)
029a : c8 __ __ INY
029b : b1 35 __ LDA (T0 + 0),y 
029d : 4a __ __ LSR
029e : 8d fc 9f STA $9ffc ; (sstack + 48)
02a1 : a9 00 __ LDA #$00
02a3 : 8d fd 9f STA $9ffd ; (sstack + 49)
02a6 : 20 d4 07 JSR $07d4 ; (f256main.s1 + 0)
02a9 : 20 43 72 JSR $7243 ; (f256Reset.s4 + 0)
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
02e4 : 20 cf 06 JSR $06cf ; (tileReset.s4 + 0)
02e7 : 20 33 07 JSR $0733 ; (spriteReset.s4 + 0)
02ea : 20 5f 07 JSR $075f ; (fileReset.s4 + 0)
02ed : 20 6a 07 JSR $076a ; (randomReset.s4 + 0)
02f0 : 58 __ __ CLI
.s3:
02f1 : 60 __ __ RTS
--------------------------------------------------------------------
kernelReset: ; kernelReset()->void
;  82, "/mnt/d/F256/f256lib-oscar64/f256lib/f_kernel.h"
.s4:
02f2 : a9 f0 __ LDA #$f0
02f4 : 8d 64 7a STA $7a64 ; (kernelArgs + 0)
02f7 : a9 00 __ LDA #$00
02f9 : 8d 65 7a STA $7a65 ; (kernelArgs + 1)
02fc : a9 66 __ LDA #$66
02fe : 85 f0 __ STA $f0 
0300 : a9 7a __ LDA #$7a
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
03cb : 8d fe 63 STA $63fe ; (_ccolor + 0)
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
03e2 : bd 76 79 LDA $7976,x ; (textColors[0].g + 0)
03e5 : 85 21 __ STA P6 
03e7 : bd 77 79 LDA $7977,x ; (textColors[0].b + 0)
03ea : 85 22 __ STA P7 
03ec : bd 75 79 LDA $7975,x ; (textColors[0].r + 0)
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
042a : 8d ff 63 STA $63ff ; (_MAX_COL + 0)
042d : a5 1c __ LDA P1 ; (y + 0)
042f : f0 03 __ BEQ $0434 ; (textSetDouble.s7 + 0)
.s8:
0431 : 60 __ __ RTS
0432 : d0 02 __ BNE $0436 ; (textSetDouble.s9 + 0)
.s7:
0434 : a9 3c __ LDA #$3c
.s9:
0436 : 8d ff 64 STA $64ff ; (_MAX_ROW + 0)
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
04cf : ad ff 63 LDA $63ff ; (_MAX_COL + 0)
04d2 : 85 1b __ STA P0 
04d4 : ad ff 64 LDA $64ff ; (_MAX_ROW + 0)
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
052c : ad fe 63 LDA $63fe ; (_ccolor + 0)
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
0557 : 8d fe 67 STA $67fe ; (_col + 0)
055a : a2 00 __ LDX #$00
055c : 8e 15 d0 STX $d015 
055f : a5 1c __ LDA P1 ; (y + 0)
0561 : 8d 16 d0 STA $d016 
0564 : 8d ff 67 STA $67ff ; (_row + 0)
0567 : 8e 17 d0 STX $d017 
.s3:
056a : 60 __ __ RTS
--------------------------------------------------------------------
bitmapReset: ; bitmapReset()->void
;  19, "/mnt/d/F256/f256lib-oscar64/f256lib/f_bitmap.h"
.s4:
056b : a9 01 __ LDA #$01
056d : 8d 6e 7a STA $7a6e ; (_MAX_X + 1)
0570 : 85 1c __ STA P1 
0572 : a9 40 __ LDA #$40
0574 : 85 1b __ STA P0 
0576 : 8d 6d 7a STA $7a6d ; (_MAX_X + 0)
0579 : a9 f0 __ LDA #$f0
057b : 85 1d __ STA P2 
057d : a9 00 __ LDA #$00
057f : 85 1e __ STA P3 
0581 : 20 78 04 JSR $0478 ; (mathUnsignedMultiply.s4 + 0)
0584 : a5 29 __ LDA ACCU + 0 
0586 : 85 35 __ STA T1 + 0 
0588 : a5 2a __ LDA ACCU + 1 
058a : 85 39 __ STA T2 + 0 
058c : 85 36 __ STA T1 + 1 
058e : a5 2b __ LDA ACCU + 2 
0590 : 85 3a __ STA T2 + 1 
0592 : 85 37 __ STA T1 + 2 
0594 : a9 00 __ LDA #$00
0596 : 85 1d __ STA P2 
0598 : 8d 6f 7a STA $7a6f ; (_active + 0)
059b : a9 20 __ LDA #$20
059d : 85 1e __ STA P3 
059f : a9 ff __ LDA #$ff
05a1 : 8d 70 7a STA $7a70 ; (_color + 0)
05a4 : a5 2c __ LDA ACCU + 3 
05a6 : 85 38 __ STA T1 + 3 
05a8 : a2 05 __ LDX #$05
.l5:
05aa : 4a __ __ LSR
05ab : 66 3a __ ROR T2 + 1 
05ad : 66 39 __ ROR T2 + 0 
05af : ca __ __ DEX
05b0 : d0 f8 __ BNE $05aa ; (bitmapReset.l5 + 0)
.s6:
05b2 : a5 39 __ LDA T2 + 0 
05b4 : 85 1b __ STA P0 
05b6 : a5 3a __ LDA T2 + 1 
05b8 : 85 1c __ STA P1 
05ba : 20 78 04 JSR $0478 ; (mathUnsignedMultiply.s4 + 0)
05bd : a5 2c __ LDA ACCU + 3 
05bf : c5 38 __ CMP T1 + 3 
05c1 : d0 12 __ BNE $05d5 ; (bitmapReset.s8 + 0)
.s9:
05c3 : a5 2b __ LDA ACCU + 2 
05c5 : c5 37 __ CMP T1 + 2 
05c7 : d0 0c __ BNE $05d5 ; (bitmapReset.s8 + 0)
.s10:
05c9 : a5 2a __ LDA ACCU + 1 
05cb : c5 36 __ CMP T1 + 1 
05cd : d0 06 __ BNE $05d5 ; (bitmapReset.s8 + 0)
.s11:
05cf : a5 29 __ LDA ACCU + 0 
05d1 : c5 35 __ CMP T1 + 0 
05d3 : f0 0d __ BEQ $05e2 ; (bitmapReset.s7 + 0)
.s8:
05d5 : 18 __ __ CLC
05d6 : a5 1b __ LDA P0 
05d8 : 69 01 __ ADC #$01
05da : 85 39 __ STA T2 + 0 
05dc : a5 1c __ LDA P1 
05de : 69 00 __ ADC #$00
05e0 : 85 3a __ STA T2 + 1 
.s7:
05e2 : a5 39 __ LDA T2 + 0 
05e4 : 85 1b __ STA P0 
05e6 : a5 3a __ LDA T2 + 1 
05e8 : 85 1c __ STA P1 
05ea : 20 78 04 JSR $0478 ; (mathUnsignedMultiply.s4 + 0)
05ed : a9 00 __ LDA #$00
05ef : 85 1b __ STA P0 
05f1 : 85 1c __ STA P1 
05f3 : 8d 7d 7a STA $7a7d ; (_BITMAP_CLUT[0] + 0)
05f6 : 8d 7e 7a STA $7a7e ; (_BITMAP_CLUT[0] + 1)
05f9 : 8d 7f 7a STA $7a7f ; (_BITMAP_CLUT[0] + 2)
05fc : 38 __ __ SEC
05fd : e5 29 __ SBC ACCU + 0 
05ff : 8d 71 7a STA $7a71 ; (_BITMAP_BASE[0] + 0)
0602 : aa __ __ TAX
0603 : a9 00 __ LDA #$00
0605 : e5 2a __ SBC ACCU + 1 
0607 : 8d 72 7a STA $7a72 ; (_BITMAP_BASE[0] + 1)
060a : a9 08 __ LDA #$08
060c : e5 2b __ SBC ACCU + 2 
060e : 8d 73 7a STA $7a73 ; (_BITMAP_BASE[0] + 2)
0611 : a9 00 __ LDA #$00
0613 : e5 2c __ SBC ACCU + 3 
0615 : 8d 74 7a STA $7a74 ; (_BITMAP_BASE[0] + 3)
0618 : ad 71 7a LDA $7a71 ; (_BITMAP_BASE[0] + 0)
061b : 38 __ __ SEC
061c : e5 29 __ SBC ACCU + 0 
061e : 8d 75 7a STA $7a75 ; (_BITMAP_BASE[0] + 4)
0621 : ad 72 7a LDA $7a72 ; (_BITMAP_BASE[0] + 1)
0624 : e5 2a __ SBC ACCU + 1 
0626 : 8d 76 7a STA $7a76 ; (_BITMAP_BASE[0] + 5)
0629 : ad 73 7a LDA $7a73 ; (_BITMAP_BASE[0] + 2)
062c : e5 2b __ SBC ACCU + 2 
062e : 8d 77 7a STA $7a77 ; (_BITMAP_BASE[0] + 6)
0631 : ad 74 7a LDA $7a74 ; (_BITMAP_BASE[0] + 3)
0634 : e5 2c __ SBC ACCU + 3 
0636 : 8d 78 7a STA $7a78 ; (_BITMAP_BASE[0] + 7)
0639 : ad 75 7a LDA $7a75 ; (_BITMAP_BASE[0] + 4)
063c : 38 __ __ SEC
063d : e5 29 __ SBC ACCU + 0 
063f : 8d 79 7a STA $7a79 ; (_BITMAP_BASE[0] + 8)
0642 : ad 76 7a LDA $7a76 ; (_BITMAP_BASE[0] + 5)
0645 : e5 2a __ SBC ACCU + 1 
0647 : 8d 7a 7a STA $7a7a ; (_BITMAP_BASE[0] + 9)
064a : ad 77 7a LDA $7a77 ; (_BITMAP_BASE[0] + 6)
064d : e5 2b __ SBC ACCU + 2 
064f : 8d 7b 7a STA $7a7b ; (_BITMAP_BASE[0] + 10)
0652 : ad 78 7a LDA $7a78 ; (_BITMAP_BASE[0] + 7)
0655 : e5 2c __ SBC ACCU + 3 
0657 : 8d 7c 7a STA $7a7c ; (_BITMAP_BASE[0] + 11)
065a : 8e 01 d1 STX $d101 
065d : ad 72 7a LDA $7a72 ; (_BITMAP_BASE[0] + 1)
0660 : 8d 02 d1 STA $d102 
0663 : ad 73 7a LDA $7a73 ; (_BITMAP_BASE[0] + 2)
0666 : 8d 03 d1 STA $d103 
0669 : ad 75 7a LDA $7a75 ; (_BITMAP_BASE[0] + 4)
066c : 8d 09 d1 STA $d109 
066f : ad 76 7a LDA $7a76 ; (_BITMAP_BASE[0] + 5)
0672 : 8d 0a d1 STA $d10a 
0675 : ad 77 7a LDA $7a77 ; (_BITMAP_BASE[0] + 6)
0678 : 8d 0b d1 STA $d10b 
067b : ad 79 7a LDA $7a79 ; (_BITMAP_BASE[0] + 8)
067e : 8d 11 d1 STA $d111 
0681 : ad 7a 7a LDA $7a7a ; (_BITMAP_BASE[0] + 9)
0684 : 8d 12 d1 STA $d112 
0687 : ad 7b 7a LDA $7a7b ; (_BITMAP_BASE[0] + 10)
068a : 8d 13 d1 STA $d113 
068d : 20 9a 06 JSR $069a ; (bitmapSetVisible.s4 + 0)
0690 : e6 1b __ INC P0 
0692 : 20 9a 06 JSR $069a ; (bitmapSetVisible.s4 + 0)
0695 : e6 1b __ INC P0 
0697 : 4c 9a 06 JMP $069a ; (bitmapSetVisible.s4 + 0)
--------------------------------------------------------------------
bitmapSetVisible: ; bitmapSetVisible(u8,bool)->void
;  24, "/mnt/d/F256/f256lib-oscar64/f256lib/f_bitmap.h"
.s4:
069a : a4 1b __ LDY P0 ; (p + 0)
069c : 98 __ __ TYA
069d : a6 1c __ LDX P1 ; (v + 0)
069f : c0 01 __ CPY #$01
06a1 : f0 20 __ BEQ $06c3 ; (bitmapSetVisible.s11 + 0)
.s5:
06a3 : 09 00 __ ORA #$00
06a5 : f0 10 __ BEQ $06b7 ; (bitmapSetVisible.s9 + 0)
.s6:
06a7 : c9 02 __ CMP #$02
06a9 : d0 0b __ BNE $06b6 ; (bitmapSetVisible.s3 + 0)
.s7:
06ab : 8a __ __ TXA
06ac : f0 05 __ BEQ $06b3 ; (bitmapSetVisible.s15 + 0)
.s8:
06ae : b9 7d 7a LDA $7a7d,y ; (_BITMAP_CLUT[0] + 0)
06b1 : 09 01 __ ORA #$01
.s15:
06b3 : 8d 10 d1 STA $d110 
.s3:
06b6 : 60 __ __ RTS
.s9:
06b7 : 8a __ __ TXA
06b8 : f0 05 __ BEQ $06bf ; (bitmapSetVisible.s14 + 0)
.s10:
06ba : ad 7d 7a LDA $7a7d ; (_BITMAP_CLUT[0] + 0)
06bd : 09 01 __ ORA #$01
.s14:
06bf : 8d 00 d1 STA $d100 
06c2 : 60 __ __ RTS
.s11:
06c3 : 8a __ __ TXA
06c4 : f0 05 __ BEQ $06cb ; (bitmapSetVisible.s13 + 0)
.s12:
06c6 : ad 7e 7a LDA $7a7e ; (_BITMAP_CLUT[0] + 1)
06c9 : 09 01 __ ORA #$01
.s13:
06cb : 8d 08 d1 STA $d108 
06ce : 60 __ __ RTS
--------------------------------------------------------------------
tileReset: ; tileReset()->void
;  19, "/mnt/d/F256/f256lib-oscar64/f256lib/f_tile.h"
.s4:
06cf : a9 00 __ LDA #$00
06d1 : 85 1b __ STA P0 
06d3 : 85 1c __ STA P1 
06d5 : a9 08 __ LDA #$08
06d7 : 8d 80 7a STA $7a80 ; (_tileSize[0] + 0)
06da : 8d 81 7a STA $7a81 ; (_tileSize[0] + 1)
06dd : 8d 82 7a STA $7a82 ; (_tileSize[0] + 2)
06e0 : 20 ed 06 JSR $06ed ; (tileSetVisible.s4 + 0)
06e3 : e6 1b __ INC P0 
06e5 : 20 ed 06 JSR $06ed ; (tileSetVisible.s4 + 0)
06e8 : e6 1b __ INC P0 
06ea : 4c ed 06 JMP $06ed ; (tileSetVisible.s4 + 0)
--------------------------------------------------------------------
tileSetVisible: ; tileSetVisible(u8,bool)->void
;  18, "/mnt/d/F256/f256lib-oscar64/f256lib/f_tile.h"
.s4:
06ed : a5 1b __ LDA P0 ; (t + 0)
06ef : c9 01 __ CMP #$01
06f1 : f0 2d __ BEQ $0720 ; (tileSetVisible.s15 + 0)
.s5:
06f3 : aa __ __ TAX
06f4 : f0 17 __ BEQ $070d ; (tileSetVisible.s11 + 0)
.s6:
06f6 : c9 02 __ CMP #$02
06f8 : d0 12 __ BNE $070c ; (tileSetVisible.s3 + 0)
.s7:
06fa : ad 82 7a LDA $7a82 ; (_tileSize[0] + 2)
06fd : c9 08 __ CMP #$08
06ff : d0 04 __ BNE $0705 ; (tileSetVisible.s8 + 0)
.s10:
0701 : a9 10 __ LDA #$10
0703 : d0 02 __ BNE $0707 ; (tileSetVisible.s9 + 0)
.s8:
0705 : a9 00 __ LDA #$00
.s9:
0707 : 05 1c __ ORA P1 ; (v + 0)
0709 : 8d 18 d2 STA $d218 
.s3:
070c : 60 __ __ RTS
.s11:
070d : ad 80 7a LDA $7a80 ; (_tileSize[0] + 0)
0710 : c9 08 __ CMP #$08
0712 : d0 04 __ BNE $0718 ; (tileSetVisible.s12 + 0)
.s14:
0714 : a9 10 __ LDA #$10
0716 : d0 02 __ BNE $071a ; (tileSetVisible.s13 + 0)
.s12:
0718 : a9 00 __ LDA #$00
.s13:
071a : 05 1c __ ORA P1 ; (v + 0)
071c : 8d 00 d2 STA $d200 
071f : 60 __ __ RTS
.s15:
0720 : ad 81 7a LDA $7a81 ; (_tileSize[0] + 1)
0723 : c9 08 __ CMP #$08
0725 : d0 04 __ BNE $072b ; (tileSetVisible.s16 + 0)
.s18:
0727 : a9 10 __ LDA #$10
0729 : d0 02 __ BNE $072d ; (tileSetVisible.s17 + 0)
.s16:
072b : a9 00 __ LDA #$00
.s17:
072d : 05 1c __ ORA P1 ; (v + 0)
072f : 8d 0c d2 STA $d20c 
0732 : 60 __ __ RTS
--------------------------------------------------------------------
spriteReset: ; spriteReset()->void
;  18, "/mnt/d/F256/f256lib-oscar64/f256lib/f_sprite.h"
.s4:
0733 : a9 00 __ LDA #$00
0735 : 85 1c __ STA P1 
0737 : 85 1b __ STA P0 
.l5:
0739 : 20 45 07 JSR $0745 ; (spriteSetVisible.s4 + 0)
073c : e6 1b __ INC P0 
073e : a5 1b __ LDA P0 
0740 : c9 40 __ CMP #$40
0742 : 90 f5 __ BCC $0739 ; (spriteReset.l5 + 0)
.s3:
0744 : 60 __ __ RTS
--------------------------------------------------------------------
spriteSetVisible: ; spriteSetVisible(u8,bool)->void
;  17, "/mnt/d/F256/f256lib-oscar64/f256lib/f_sprite.h"
.s4:
0745 : a5 1b __ LDA P0 ; (s + 0)
0747 : aa __ __ TAX
0748 : 0a __ __ ASL
0749 : 0a __ __ ASL
074a : 0a __ __ ASL
074b : 85 29 __ STA ACCU + 0 
074d : bd 83 7a LDA $7a83,x ; (_spriteCtl[0] + 0)
0750 : 05 1c __ ORA P1 ; (v + 0)
0752 : aa __ __ TAX
0753 : a9 00 __ LDA #$00
0755 : 69 d9 __ ADC #$d9
0757 : 85 2a __ STA ACCU + 1 
0759 : 8a __ __ TXA
075a : a0 00 __ LDY #$00
075c : 91 29 __ STA (ACCU + 0),y 
.s3:
075e : 60 __ __ RTS
--------------------------------------------------------------------
fileReset: ; fileReset()->void
;  31, "/mnt/d/F256/f256lib-oscar64/f256lib/f_file.h"
.s4:
075f : a9 00 __ LDA #$00
0761 : a2 07 __ LDX #$07
.l5:
0763 : 9d c3 7a STA $7ac3,x ; (_dirStream[0] + 0)
0766 : ca __ __ DEX
0767 : 10 fa __ BPL $0763 ; (fileReset.l5 + 0)
.s3:
0769 : 60 __ __ RTS
--------------------------------------------------------------------
randomReset: ; randomReset()->void
;  16, "/mnt/d/F256/f256lib-oscar64/f256lib/f_random.h"
.s4:
076a : a9 dc __ LDA #$dc
076c : 8d cb 7a STA $7acb ; (_kern_target + 0)
076f : a9 ff __ LDA #$ff
0771 : 8d cc 7a STA $7acc ; (_kern_target + 1)
0774 : ad 64 7a LDA $7a64 ; (kernelArgs + 0)
0777 : 85 35 __ STA T0 + 0 
0779 : ad 65 7a LDA $7a65 ; (kernelArgs + 1)
077c : 85 36 __ STA T0 + 1 
077e : a9 c4 __ LDA #$c4
0780 : a0 0b __ LDY #$0b
0782 : 91 35 __ STA (T0 + 0),y 
0784 : a9 9f __ LDA #$9f
0786 : c8 __ __ INY
0787 : 91 35 __ STA (T0 + 0),y 
0789 : a9 08 __ LDA #$08
078b : c8 __ __ INY
078c : 91 35 __ STA (T0 + 0),y 
078e : 20 b4 07 JSR $07b4 ; (_kernelCallWrapper.s4 + 0)
0791 : ad ca 9f LDA $9fca ; (clock.seconds + 0)
0794 : 85 1b __ STA P0 
0796 : ad cb 9f LDA $9fcb ; (clock.centis + 0)
0799 : 85 1d __ STA P2 
079b : a9 00 __ LDA #$00
079d : 85 1c __ STA P1 
079f : 85 1e __ STA P3 
07a1 : 20 78 04 JSR $0478 ; (mathUnsignedMultiply.s4 + 0)
07a4 : a5 29 __ LDA ACCU + 0 
07a6 : 8d a4 d6 STA $d6a4 
07a9 : a5 2a __ LDA ACCU + 1 
07ab : 8d a5 d6 STA $d6a5 
07ae : a9 03 __ LDA #$03
07b0 : 8d a6 d6 STA $d6a6 
.s3:
07b3 : 60 __ __ RTS
--------------------------------------------------------------------
_kernelCallWrapper: ; _kernelCallWrapper()->u8
;  56, "/mnt/d/F256/f256lib-oscar64/f256lib/f_kernel.h"
.s4:
07b4 : 20 bc 07 JSR $07bc ; (_kernelCallRaw + 0)
07b7 : 85 29 __ STA ACCU + 0 
.s3:
07b9 : a5 29 __ LDA ACCU + 0 
07bb : 60 __ __ RTS
--------------------------------------------------------------------
_kernelCallRaw: ; _kernelCallRaw
07bc : ad cb 7a LDA $7acb ; (_kern_target + 0)
07bf : 8d c9 07 STA $07c9 ; (_kernelCallRaw + 13)
07c2 : ad cc 7a LDA $7acc ; (_kern_target + 1)
07c5 : 8d ca 07 STA $07ca ; (_kernelCallRaw + 14)
07c8 : 20 00 00 JSR $0000 
07cb : aa __ __ TAX
07cc : a9 00 __ LDA #$00
07ce : 6a __ __ ROR
07cf : 8d cd 7a STA $7acd ; (_kernelError + 0)
07d2 : 8a __ __ TXA
07d3 : 60 __ __ RTS
--------------------------------------------------------------------
f256main: ; f256main(i16,u8**)->i16
;1639, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s1:
07d4 : a2 03 __ LDX #$03
07d6 : b5 55 __ LDA T0 + 0,x 
07d8 : 9d 53 9d STA $9d53,x ; (f256main@stack + 0)
07db : ca __ __ DEX
07dc : 10 f8 __ BPL $07d6 ; (f256main.s1 + 2)
.s4:
07de : a9 00 __ LDA #$00
07e0 : 85 1b __ STA P0 
07e2 : 85 1c __ STA P1 
07e4 : 85 01 __ STA $01 
07e6 : a9 2f __ LDA #$2f
07e8 : 8d 00 d0 STA $d000 
07eb : a9 10 __ LDA #$10
07ed : 8d 01 d0 STA $d001 
07f0 : a9 01 __ LDA #$01
07f2 : 8d e0 d6 STA $d6e0 
07f5 : a9 00 __ LDA #$00
07f7 : 8d e2 d6 STA $d6e2 
07fa : a9 01 __ LDA #$01
07fc : 8d e3 d6 STA $d6e3 
07ff : a9 00 __ LDA #$00
0801 : 8d e4 d6 STA $d6e4 
0804 : a9 01 __ LDA #$01
0806 : 8d e5 d6 STA $d6e5 
0809 : 20 09 04 JSR $0409 ; (textSetDouble.s4 + 0)
080c : 20 7f 0e JSR $0e7f ; (initMyBitmap.s4 + 0)
080f : 20 a7 13 JSR $13a7 ; (initMySprites.s4 + 0)
0812 : a9 fd __ LDA #$fd
0814 : 85 20 __ STA P5 
0816 : a9 14 __ LDA #$14
0818 : 85 21 __ STA P6 
081a : 20 a4 14 JSR $14a4 ; (fpr_set_currentPath.s4 + 0)
081d : a9 01 __ LDA #$01
081f : 85 1b __ STA P0 
0821 : a9 00 __ LDA #$00
0823 : 85 1c __ STA P1 
0825 : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
0828 : a9 0f __ LDA #$0f
082a : 85 1b __ STA P0 
082c : a9 04 __ LDA #$04
082e : 85 1c __ STA P1 
0830 : 20 ff 14 JSR $14ff ; (textSetColor.s4 + 0)
0833 : a9 9f __ LDA #$9f
0835 : 85 23 __ STA P8 
0837 : a9 16 __ LDA #$16
0839 : 85 24 __ STA P9 
083b : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
083e : a9 28 __ LDA #$28
0840 : 85 1b __ STA P0 
0842 : a9 00 __ LDA #$00
0844 : 85 1c __ STA P1 
0846 : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
0849 : e6 1c __ INC P1 
084b : a9 0f __ LDA #$0f
084d : 85 1b __ STA P0 
084f : 20 ff 14 JSR $14ff ; (textSetColor.s4 + 0)
0852 : a9 ab __ LDA #$ab
0854 : 85 23 __ STA P8 
0856 : a9 16 __ LDA #$16
0858 : 85 24 __ STA P9 
085a : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
085d : a9 0f __ LDA #$0f
085f : 85 1b __ STA P0 
0861 : a9 00 __ LDA #$00
0863 : 85 1c __ STA P1 
0865 : 20 ff 14 JSR $14ff ; (textSetColor.s4 + 0)
0868 : 20 b6 16 JSR $16b6 ; (textFullClear.s4 + 0)
086b : a9 00 __ LDA #$00
086d : 85 1b __ STA P0 
086f : a9 2c __ LDA #$2c
0871 : 85 1c __ STA P1 
0873 : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
0876 : a9 4f __ LDA #$4f
0878 : 85 1d __ STA P2 
087a : a9 2c __ LDA #$2c
087c : 8d a5 79 STA $79a5 ; (cur_cli_y + 0)
087f : 20 76 17 JSR $1776 ; (initTextXY.s4 + 0)
0882 : a9 a7 __ LDA #$a7
0884 : 85 23 __ STA P8 
0886 : a9 17 __ LDA #$17
0888 : 85 24 __ STA P9 
088a : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
088d : a9 00 __ LDA #$00
088f : 85 25 __ STA P10 
0891 : a9 2c __ LDA #$2c
0893 : 8d cc 9f STA $9fcc ; (sstack + 0)
0896 : a9 4f __ LDA #$4f
0898 : 85 26 __ STA P11 
089a : a9 3a __ LDA #$3a
089c : 8d cd 9f STA $9fcd ; (sstack + 1)
089f : 20 bb 17 JSR $17bb ; (textPrintNewLine.s4 + 0)
08a2 : a9 46 __ LDA #$46
08a4 : 85 23 __ STA P8 
08a6 : a9 18 __ LDA #$18
08a8 : 85 24 __ STA P9 
08aa : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
08ad : a9 2c __ LDA #$2c
08af : 8d cc 9f STA $9fcc ; (sstack + 0)
08b2 : a9 3a __ LDA #$3a
08b4 : 8d cd 9f STA $9fcd ; (sstack + 1)
08b7 : 20 bb 17 JSR $17bb ; (textPrintNewLine.s4 + 0)
08ba : 20 5c 18 JSR $185c ; (wiz_init.s1 + 0)
08bd : a5 29 __ LDA ACCU + 0 
08bf : d0 07 __ BNE $08c8 ; (f256main.s76 + 0)
.s5:
08c1 : a9 29 __ LDA #$29
08c3 : a2 8d __ LDX #$8d
08c5 : 4c cc 08 JMP $08cc ; (f256main.s6 + 0)
.s76:
08c8 : a9 29 __ LDA #$29
08ca : a2 b5 __ LDX #$b5
.s6:
08cc : 86 23 __ STX P8 
08ce : 85 24 __ STA P9 
08d0 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
08d3 : a9 00 __ LDA #$00
08d5 : 85 25 __ STA P10 
08d7 : a9 2c __ LDA #$2c
08d9 : 8d cc 9f STA $9fcc ; (sstack + 0)
08dc : a9 4f __ LDA #$4f
08de : 85 26 __ STA P11 
08e0 : a9 3a __ LDA #$3a
08e2 : 8d cd 9f STA $9fcd ; (sstack + 1)
08e5 : 20 bb 17 JSR $17bb ; (textPrintNewLine.s4 + 0)
08e8 : a9 00 __ LDA #$00
08ea : 85 1b __ STA P0 
08ec : a9 0f __ LDA #$0f
08ee : 85 1c __ STA P1 
08f0 : 20 ff 14 JSR $14ff ; (textSetColor.s4 + 0)
08f3 : a9 3b __ LDA #$3b
08f5 : 85 1c __ STA P1 
08f7 : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
08fa : a9 00 __ LDA #$00
08fc : 85 23 __ STA P8 
08fe : a9 2a __ LDA #$2a
0900 : 85 24 __ STA P9 
0902 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
0905 : a9 dc __ LDA #$dc
0907 : 85 23 __ STA P8 
0909 : a9 29 __ LDA #$29
090b : 85 24 __ STA P9 
090d : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
0910 : a9 de __ LDA #$de
0912 : 85 23 __ STA P8 
0914 : a9 29 __ LDA #$29
0916 : 85 24 __ STA P9 
0918 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
091b : a9 e0 __ LDA #$e0
091d : 85 23 __ STA P8 
091f : a9 29 __ LDA #$29
0921 : 85 24 __ STA P9 
0923 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
0926 : a9 74 __ LDA #$74
0928 : 85 23 __ STA P8 
092a : a9 17 __ LDA #$17
092c : 85 24 __ STA P9 
092e : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
0931 : a9 e2 __ LDA #$e2
0933 : 85 23 __ STA P8 
0935 : a9 29 __ LDA #$29
0937 : 85 24 __ STA P9 
0939 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
093c : a9 74 __ LDA #$74
093e : 85 23 __ STA P8 
0940 : a9 17 __ LDA #$17
0942 : 85 24 __ STA P9 
0944 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
0947 : a9 e6 __ LDA #$e6
0949 : 85 23 __ STA P8 
094b : a9 29 __ LDA #$29
094d : 85 24 __ STA P9 
094f : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
0952 : a9 06 __ LDA #$06
0954 : 85 1b __ STA P0 
0956 : a9 3b __ LDA #$3b
0958 : 85 1c __ STA P1 
095a : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
095d : a9 57 __ LDA #$57
095f : 85 55 __ STA T0 + 0 
0961 : 8d e1 9f STA $9fe1 ; (sstack + 21)
0964 : a9 21 __ LDA #$21
0966 : 8d e3 9f STA $9fe3 ; (sstack + 23)
0969 : a9 9d __ LDA #$9d
096b : 85 56 __ STA T0 + 1 
096d : 8d e2 9f STA $9fe2 ; (sstack + 22)
0970 : 20 43 2a JSR $2a43 ; (wiz_get_ssid.s1 + 0)
0973 : a5 29 __ LDA ACCU + 0 
0975 : d0 08 __ BNE $097f ; (f256main.s8 + 0)
.s7:
0977 : a9 e2 __ LDA #$e2
0979 : 85 55 __ STA T0 + 0 
097b : a9 2a __ LDA #$2a
097d : 85 56 __ STA T0 + 1 
.s8:
097f : a5 55 __ LDA T0 + 0 
0981 : 85 23 __ STA P8 
0983 : a5 56 __ LDA T0 + 1 
0985 : 85 24 __ STA P9 
0987 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
098a : a9 19 __ LDA #$19
098c : 85 1b __ STA P0 
098e : a9 3b __ LDA #$3b
0990 : 85 1c __ STA P1 
0992 : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
0995 : a9 e2 __ LDA #$e2
0997 : 85 23 __ STA P8 
0999 : a9 2a __ LDA #$2a
099b : 85 24 __ STA P9 
099d : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
09a0 : a9 0f __ LDA #$0f
09a2 : 85 1b __ STA P0 
09a4 : a9 00 __ LDA #$00
09a6 : 85 1c __ STA P1 
09a8 : 20 ff 14 JSR $14ff ; (textSetColor.s4 + 0)
09ab : a9 0d __ LDA #$0d
09ad : 85 1b __ STA P0 
09af : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
09b2 : a9 c1 __ LDA #$c1
09b4 : 85 23 __ STA P8 
09b6 : a9 79 __ LDA #$79
09b8 : 85 24 __ STA P9 
09ba : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
09bd : a9 00 __ LDA #$00
09bf : 85 55 __ STA T0 + 0 
09c1 : 85 1c __ STA P1 
09c3 : a9 33 __ LDA #$33
09c5 : 85 1b __ STA P0 
09c7 : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
09ca : a9 00 __ LDA #$00
09cc : 85 23 __ STA P8 
09ce : a9 7a __ LDA #$7a
09d0 : 85 24 __ STA P9 
09d2 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
09d5 : a9 7d __ LDA #$7d
09d7 : 85 56 __ STA T0 + 1 
09d9 : a0 50 __ LDY #$50
.l77:
09db : a9 00 __ LDA #$00
09dd : 91 55 __ STA (T0 + 0),y 
09df : 98 __ __ TYA
09e0 : 18 __ __ CLC
09e1 : 69 1d __ ADC #$1d
09e3 : a8 __ __ TAY
09e4 : 90 02 __ BCC $09e8 ; (f256main.s80 + 0)
.s79:
09e6 : e6 56 __ INC T0 + 1 
.s80:
09e8 : c0 d8 __ CPY #$d8
09ea : d0 ef __ BNE $09db ; (f256main.l77 + 0)
.s78:
09ec : a5 56 __ LDA T0 + 1 
09ee : c9 81 __ CMP #$81
09f0 : d0 e9 __ BNE $09db ; (f256main.l77 + 0)
.l9:
09f2 : a9 28 __ LDA #$28
09f4 : 8d de 9f STA $9fde ; (sstack + 18)
09f7 : a9 02 __ LDA #$02
09f9 : 8d df 9f STA $9fdf ; (sstack + 19)
09fc : 20 f0 2a JSR $2af0 ; (showFilesInDirectory.s4 + 0)
.l10:
09ff : a9 4f __ LDA #$4f
0a01 : 85 1d __ STA P2 
0a03 : 20 76 17 JSR $1776 ; (initTextXY.s4 + 0)
0a06 : a9 34 __ LDA #$34
0a08 : 85 23 __ STA P8 
0a0a : a9 47 __ LDA #$47
0a0c : 85 24 __ STA P9 
0a0e : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
0a11 : a9 50 __ LDA #$50
0a13 : 8d fb 9f STA $9ffb ; (sstack + 47)
0a16 : a9 7f __ LDA #$7f
0a18 : 8d f9 9f STA $9ff9 ; (sstack + 45)
0a1b : a9 9d __ LDA #$9d
0a1d : 8d fa 9f STA $9ffa ; (sstack + 46)
0a20 : 20 3a 47 JSR $473a ; (read_line.s1 + 0)
0a23 : a9 7f __ LDA #$7f
0a25 : 85 1b __ STA P0 
0a27 : a9 9d __ LDA #$9d
0a29 : 85 22 __ STA P7 
0a2b : a9 9d __ LDA #$9d
0a2d : 85 1c __ STA P1 
0a2f : a9 7c __ LDA #$7c
0a31 : 85 1d __ STA P2 
0a33 : a9 9d __ LDA #$9d
0a35 : 85 1e __ STA P3 
0a37 : a9 7a __ LDA #$7a
0a39 : 85 1f __ STA P4 
0a3b : a9 9d __ LDA #$9d
0a3d : 85 20 __ STA P5 
0a3f : a9 78 __ LDA #$78
0a41 : 85 21 __ STA P6 
0a43 : 20 68 5b JSR $5b68 ; (split_args.s4 + 0)
0a46 : ad 7d 9d LDA $9d7d ; (cmd + 1)
0a49 : 85 56 __ STA T0 + 1 
0a4b : ad 7c 9d LDA $9d7c ; (cmd + 0)
0a4e : 85 55 __ STA T0 + 0 
0a50 : 05 56 __ ORA T0 + 1 
0a52 : f0 ab __ BEQ $09ff ; (f256main.l10 + 0)
.s11:
0a54 : a0 00 __ LDY #$00
0a56 : b1 55 __ LDA (T0 + 0),y 
0a58 : f0 a5 __ BEQ $09ff ; (f256main.l10 + 0)
.s12:
0a5a : a5 55 __ LDA T0 + 0 
0a5c : 85 1b __ STA P0 
0a5e : a5 56 __ LDA T0 + 1 
0a60 : 85 1c __ STA P1 
0a62 : a9 60 __ LDA #$60
0a64 : 85 1d __ STA P2 
0a66 : a9 5c __ LDA #$5c
0a68 : 85 1e __ STA P3 
0a6a : 20 c3 1d JSR $1dc3 ; (strcmp.s4 + 0)
0a6d : aa __ __ TAX
0a6e : d0 06 __ BNE $0a76 ; (f256main.s14 + 0)
.s13:
0a70 : 20 65 5c JSR $5c65 ; (print_help.s1 + 0)
0a73 : 4c ff 09 JMP $09ff ; (f256main.l10 + 0)
.s14:
0a76 : ad 7c 9d LDA $9d7c ; (cmd + 0)
0a79 : 85 1b __ STA P0 
0a7b : ad 7d 9d LDA $9d7d ; (cmd + 1)
0a7e : 85 1c __ STA P1 
0a80 : a9 f8 __ LDA #$f8
0a82 : 85 1d __ STA P2 
0a84 : a9 63 __ LDA #$63
0a86 : 85 1e __ STA P3 
0a88 : 20 c3 1d JSR $1dc3 ; (strcmp.s4 + 0)
0a8b : aa __ __ TAX
0a8c : d0 1b __ BNE $0aa9 ; (f256main.s16 + 0)
.s15:
0a8e : 20 b6 16 JSR $16b6 ; (textFullClear.s4 + 0)
0a91 : a9 00 __ LDA #$00
0a93 : 85 1b __ STA P0 
0a95 : a9 2c __ LDA #$2c
0a97 : 85 1c __ STA P1 
0a99 : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
0a9c : a9 00 __ LDA #$00
0a9e : 8d 59 7a STA $7a59 ; (isRemoteListed + 0)
0aa1 : a9 2c __ LDA #$2c
0aa3 : 8d a5 79 STA $79a5 ; (cur_cli_y + 0)
0aa6 : 4c f2 09 JMP $09f2 ; (f256main.l9 + 0)
.s16:
0aa9 : ad 7c 9d LDA $9d7c ; (cmd + 0)
0aac : 85 1b __ STA P0 
0aae : ad 7d 9d LDA $9d7d ; (cmd + 1)
0ab1 : 85 1c __ STA P1 
0ab3 : a9 f7 __ LDA #$f7
0ab5 : 85 1d __ STA P2 
0ab7 : a9 64 __ LDA #$64
0ab9 : 85 1e __ STA P3 
0abb : 20 c3 1d JSR $1dc3 ; (strcmp.s4 + 0)
0abe : aa __ __ TAX
0abf : d0 76 __ BNE $0b37 ; (f256main.s24 + 0)
.s17:
0ac1 : ad 7b 9d LDA $9d7b ; (a1 + 1)
0ac4 : 85 56 __ STA T0 + 1 
0ac6 : ad 7a 9d LDA $9d7a ; (a1 + 0)
0ac9 : 85 55 __ STA T0 + 0 
0acb : 05 56 __ ORA T0 + 1 
0acd : f0 0e __ BEQ $0add ; (f256main.s18 + 0)
.s20:
0acf : ad 79 9d LDA $9d79 ; (a2 + 1)
0ad2 : 85 58 __ STA T1 + 1 
0ad4 : ad 78 9d LDA $9d78 ; (a2 + 0)
0ad7 : 85 57 __ STA T1 + 0 
0ad9 : 05 58 __ ORA T1 + 1 
0adb : d0 0e __ BNE $0aeb ; (f256main.s21 + 0)
.s18:
0add : a9 4f __ LDA #$4f
0adf : 85 1d __ STA P2 
0ae1 : 20 76 17 JSR $1776 ; (initTextXY.s4 + 0)
0ae4 : a9 66 __ LDA #$66
0ae6 : a2 7c __ LDX #$7c
0ae8 : 4c 18 0b JMP $0b18 ; (f256main.s19 + 0)
.s21:
0aeb : a9 4f __ LDA #$4f
0aed : 85 1d __ STA P2 
0aef : 20 76 17 JSR $1776 ; (initTextXY.s4 + 0)
0af2 : a5 55 __ LDA T0 + 0 
0af4 : 8d e1 9f STA $9fe1 ; (sstack + 21)
0af7 : a5 56 __ LDA T0 + 1 
0af9 : 8d e2 9f STA $9fe2 ; (sstack + 22)
0afc : a5 57 __ LDA T1 + 0 
0afe : 8d e3 9f STA $9fe3 ; (sstack + 23)
0b01 : a5 58 __ LDA T1 + 1 
0b03 : 8d e4 9f STA $9fe4 ; (sstack + 24)
0b06 : 20 29 66 JSR $6629 ; (wiz_join.s4 + 0)
0b09 : a5 29 __ LDA ACCU + 0 
0b0b : d0 07 __ BNE $0b14 ; (f256main.s23 + 0)
.s22:
0b0d : a9 66 __ LDA #$66
0b0f : a2 6f __ LDX #$6f
0b11 : 4c 18 0b JMP $0b18 ; (f256main.s19 + 0)
.s23:
0b14 : a9 65 __ LDA #$65
0b16 : a2 f5 __ LDX #$f5
.s19:
0b18 : 86 23 __ STX P8 
0b1a : 85 24 __ STA P9 
0b1c : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
0b1f : a9 00 __ LDA #$00
0b21 : 85 25 __ STA P10 
0b23 : a9 2c __ LDA #$2c
0b25 : 8d cc 9f STA $9fcc ; (sstack + 0)
0b28 : a9 4f __ LDA #$4f
0b2a : 85 26 __ STA P11 
0b2c : a9 3a __ LDA #$3a
0b2e : 8d cd 9f STA $9fcd ; (sstack + 1)
0b31 : 20 bb 17 JSR $17bb ; (textPrintNewLine.s4 + 0)
0b34 : 4c ff 09 JMP $09ff ; (f256main.l10 + 0)
.s24:
0b37 : ad 7c 9d LDA $9d7c ; (cmd + 0)
0b3a : 85 1b __ STA P0 
0b3c : ad 7d 9d LDA $9d7d ; (cmd + 1)
0b3f : 85 1c __ STA P1 
0b41 : a9 96 __ LDA #$96
0b43 : 85 1d __ STA P2 
0b45 : a9 66 __ LDA #$66
0b47 : 85 1e __ STA P3 
0b49 : 20 c3 1d JSR $1dc3 ; (strcmp.s4 + 0)
0b4c : aa __ __ TAX
0b4d : d0 52 __ BNE $0ba1 ; (f256main.s31 + 0)
.s25:
0b4f : ad 7b 9d LDA $9d7b ; (a1 + 1)
0b52 : 85 58 __ STA T1 + 1 
0b54 : ad 7a 9d LDA $9d7a ; (a1 + 0)
0b57 : 85 57 __ STA T1 + 0 
0b59 : 05 58 __ ORA T1 + 1 
0b5b : d0 0e __ BNE $0b6b ; (f256main.s27 + 0)
.s26:
0b5d : a9 4f __ LDA #$4f
0b5f : 85 1d __ STA P2 
0b61 : 20 76 17 JSR $1776 ; (initTextXY.s4 + 0)
0b64 : a9 69 __ LDA #$69
0b66 : a2 05 __ LDX #$05
0b68 : 4c 18 0b JMP $0b18 ; (f256main.s19 + 0)
.s27:
0b6b : ad 78 9d LDA $9d78 ; (a2 + 0)
0b6e : 0d 79 9d ORA $9d79 ; (a2 + 1)
0b71 : d0 07 __ BNE $0b7a ; (f256main.s30 + 0)
.s28:
0b73 : a2 15 __ LDX #$15
0b75 : 8e e8 9f STX $9fe8 ; (sstack + 28)
0b78 : d0 14 __ BNE $0b8e ; (f256main.s29 + 0)
.s30:
0b7a : ad 78 9d LDA $9d78 ; (a2 + 0)
0b7d : 85 1b __ STA P0 
0b7f : ad 79 9d LDA $9d79 ; (a2 + 1)
0b82 : 85 1c __ STA P1 
0b84 : 20 5b 68 JSR $685b ; (atoi.l4 + 0)
0b87 : a5 29 __ LDA ACCU + 0 
0b89 : 8d e8 9f STA $9fe8 ; (sstack + 28)
0b8c : a5 2a __ LDA ACCU + 1 
.s29:
0b8e : 8d e9 9f STA $9fe9 ; (sstack + 29)
0b91 : a5 57 __ LDA T1 + 0 
0b93 : 8d e6 9f STA $9fe6 ; (sstack + 26)
0b96 : a5 58 __ LDA T1 + 1 
0b98 : 8d e7 9f STA $9fe7 ; (sstack + 27)
0b9b : 20 9b 66 JSR $669b ; (ftp_open.s1 + 0)
0b9e : 4c ff 09 JMP $09ff ; (f256main.l10 + 0)
.s31:
0ba1 : ad 7c 9d LDA $9d7c ; (cmd + 0)
0ba4 : 85 1b __ STA P0 
0ba6 : ad 7d 9d LDA $9d7d ; (cmd + 1)
0ba9 : 85 1c __ STA P1 
0bab : a9 f0 __ LDA #$f0
0bad : 85 1d __ STA P2 
0baf : a9 67 __ LDA #$67
0bb1 : 85 1e __ STA P3 
0bb3 : 20 c3 1d JSR $1dc3 ; (strcmp.s4 + 0)
0bb6 : aa __ __ TAX
0bb7 : d0 3c __ BNE $0bf5 ; (f256main.s36 + 0)
.s32:
0bb9 : ad 7a 9d LDA $9d7a ; (a1 + 0)
0bbc : 0d 7b 9d ORA $9d7b ; (a1 + 1)
0bbf : f0 26 __ BEQ $0be7 ; (f256main.s33 + 0)
.s34:
0bc1 : ad 78 9d LDA $9d78 ; (a2 + 0)
0bc4 : 0d 79 9d ORA $9d79 ; (a2 + 1)
0bc7 : f0 1e __ BEQ $0be7 ; (f256main.s33 + 0)
.s35:
0bc9 : ad 7a 9d LDA $9d7a ; (a1 + 0)
0bcc : 8d e9 9f STA $9fe9 ; (sstack + 29)
0bcf : ad 7b 9d LDA $9d7b ; (a1 + 1)
0bd2 : 8d ea 9f STA $9fea ; (sstack + 30)
0bd5 : ad 78 9d LDA $9d78 ; (a2 + 0)
0bd8 : 8d eb 9f STA $9feb ; (sstack + 31)
0bdb : ad 79 9d LDA $9d79 ; (a2 + 1)
0bde : 8d ec 9f STA $9fec ; (sstack + 32)
0be1 : 20 1f 69 JSR $691f ; (ftp_login.s1 + 0)
0be4 : 4c ff 09 JMP $09ff ; (f256main.l10 + 0)
.s33:
0be7 : a9 4f __ LDA #$4f
0be9 : 85 1d __ STA P2 
0beb : 20 76 17 JSR $1776 ; (initTextXY.s4 + 0)
0bee : a9 6a __ LDA #$6a
0bf0 : a2 20 __ LDX #$20
0bf2 : 4c 18 0b JMP $0b18 ; (f256main.s19 + 0)
.s36:
0bf5 : ad 7c 9d LDA $9d7c ; (cmd + 0)
0bf8 : 85 1b __ STA P0 
0bfa : ad 7d 9d LDA $9d7d ; (cmd + 1)
0bfd : 85 1c __ STA P1 
0bff : a9 fc __ LDA #$fc
0c01 : 85 1d __ STA P2 
0c03 : a9 64 __ LDA #$64
0c05 : 85 1e __ STA P3 
0c07 : 20 c3 1d JSR $1dc3 ; (strcmp.s4 + 0)
0c0a : aa __ __ TAX
0c0b : f0 18 __ BEQ $0c25 ; (f256main.s37 + 0)
.s38:
0c0d : ad 7c 9d LDA $9d7c ; (cmd + 0)
0c10 : 85 1b __ STA P0 
0c12 : ad 7d 9d LDA $9d7d ; (cmd + 1)
0c15 : 85 1c __ STA P1 
0c17 : a9 3b __ LDA #$3b
0c19 : 85 1d __ STA P2 
0c1b : a9 6a __ LDA #$6a
0c1d : 85 1e __ STA P3 
0c1f : 20 c3 1d JSR $1dc3 ; (strcmp.s4 + 0)
0c22 : aa __ __ TAX
0c23 : d0 12 __ BNE $0c37 ; (f256main.s39 + 0)
.s37:
0c25 : ad 7a 9d LDA $9d7a ; (a1 + 0)
0c28 : 8d ed 9f STA $9fed ; (sstack + 33)
0c2b : ad 7b 9d LDA $9d7b ; (a1 + 1)
0c2e : 8d ee 9f STA $9fee ; (sstack + 34)
0c31 : 20 3f 6a JSR $6a3f ; (ftp_list.s1 + 0)
0c34 : 4c ff 09 JMP $09ff ; (f256main.l10 + 0)
.s39:
0c37 : ad 7c 9d LDA $9d7c ; (cmd + 0)
0c3a : 85 1b __ STA P0 
0c3c : ad 7d 9d LDA $9d7d ; (cmd + 1)
0c3f : 85 1c __ STA P1 
0c41 : a9 fd __ LDA #$fd
0c43 : 85 1d __ STA P2 
0c45 : a9 65 __ LDA #$65
0c47 : 85 1e __ STA P3 
0c49 : 20 c3 1d JSR $1dc3 ; (strcmp.s4 + 0)
0c4c : aa __ __ TAX
0c4d : d0 28 __ BNE $0c77 ; (f256main.s43 + 0)
.s40:
0c4f : ad 7a 9d LDA $9d7a ; (a1 + 0)
0c52 : 0d 7b 9d ORA $9d7b ; (a1 + 1)
0c55 : f0 12 __ BEQ $0c69 ; (f256main.s41 + 0)
.s42:
0c57 : ad 7a 9d LDA $9d7a ; (a1 + 0)
0c5a : 8d e9 9f STA $9fe9 ; (sstack + 29)
0c5d : ad 7b 9d LDA $9d7b ; (a1 + 1)
0c60 : 8d ea 9f STA $9fea ; (sstack + 30)
0c63 : 20 ca 6b JSR $6bca ; (ftp_cwd.s1 + 0)
0c66 : 4c ff 09 JMP $09ff ; (f256main.l10 + 0)
.s41:
0c69 : a9 4f __ LDA #$4f
0c6b : 85 1d __ STA P2 
0c6d : 20 76 17 JSR $1776 ; (initTextXY.s4 + 0)
0c70 : a9 6c __ LDA #$6c
0c72 : a2 9e __ LDX #$9e
0c74 : 4c 18 0b JMP $0b18 ; (f256main.s19 + 0)
.s43:
0c77 : ad 7c 9d LDA $9d7c ; (cmd + 0)
0c7a : 85 1b __ STA P0 
0c7c : ad 7d 9d LDA $9d7d ; (cmd + 1)
0c7f : 85 1c __ STA P1 
0c81 : a9 af __ LDA #$af
0c83 : 85 1d __ STA P2 
0c85 : a9 6c __ LDA #$6c
0c87 : 85 1e __ STA P3 
0c89 : 20 c3 1d JSR $1dc3 ; (strcmp.s4 + 0)
0c8c : aa __ __ TAX
0c8d : d0 16 __ BNE $0ca5 ; (f256main.s46 + 0)
.s44:
0c8f : ad 7a 9d LDA $9d7a ; (a1 + 0)
0c92 : 0d 7b 9d ORA $9d7b ; (a1 + 1)
0c95 : d0 cf __ BNE $0c66 ; (f256main.s42 + 15)
.s45:
0c97 : a9 4f __ LDA #$4f
0c99 : 85 1d __ STA P2 
0c9b : 20 76 17 JSR $1776 ; (initTextXY.s4 + 0)
0c9e : a9 6c __ LDA #$6c
0ca0 : a2 b3 __ LDX #$b3
0ca2 : 4c 18 0b JMP $0b18 ; (f256main.s19 + 0)
.s46:
0ca5 : ad 7c 9d LDA $9d7c ; (cmd + 0)
0ca8 : 85 1b __ STA P0 
0caa : ad 7d 9d LDA $9d7d ; (cmd + 1)
0cad : 85 1c __ STA P1 
0caf : a9 c5 __ LDA #$c5
0cb1 : 85 1d __ STA P2 
0cb3 : a9 6c __ LDA #$6c
0cb5 : 85 1e __ STA P3 
0cb7 : 20 c3 1d JSR $1dc3 ; (strcmp.s4 + 0)
0cba : aa __ __ TAX
0cbb : d0 06 __ BNE $0cc3 ; (f256main.s48 + 0)
.s47:
0cbd : 20 c9 6c JSR $6cc9 ; (ftp_pwd.s1 + 0)
0cc0 : 4c ff 09 JMP $09ff ; (f256main.l10 + 0)
.s48:
0cc3 : ad 7c 9d LDA $9d7c ; (cmd + 0)
0cc6 : 85 1b __ STA P0 
0cc8 : ad 7d 9d LDA $9d7d ; (cmd + 1)
0ccb : 85 1c __ STA P1 
0ccd : a9 09 __ LDA #$09
0ccf : 85 1d __ STA P2 
0cd1 : a9 6d __ LDA #$6d
0cd3 : 85 1e __ STA P3 
0cd5 : 20 c3 1d JSR $1dc3 ; (strcmp.s4 + 0)
0cd8 : aa __ __ TAX
0cd9 : d0 43 __ BNE $0d1e ; (f256main.s55 + 0)
.s49:
0cdb : ad 7b 9d LDA $9d7b ; (a1 + 1)
0cde : 85 56 __ STA T0 + 1 
0ce0 : ad 7a 9d LDA $9d7a ; (a1 + 0)
0ce3 : aa __ __ TAX
0ce4 : 05 56 __ ORA T0 + 1 
0ce6 : d0 0e __ BNE $0cf6 ; (f256main.s51 + 0)
.s50:
0ce8 : a9 4f __ LDA #$4f
0cea : 85 1d __ STA P2 
0cec : 20 76 17 JSR $1776 ; (initTextXY.s4 + 0)
0cef : a9 6d __ LDA #$6d
0cf1 : a2 0d __ LDX #$0d
0cf3 : 4c 18 0b JMP $0b18 ; (f256main.s19 + 0)
.s51:
0cf6 : 8e f5 9f STX $9ff5 ; (sstack + 41)
0cf9 : a5 56 __ LDA T0 + 1 
0cfb : 8d f6 9f STA $9ff6 ; (sstack + 42)
0cfe : ad 78 9d LDA $9d78 ; (a2 + 0)
0d01 : d0 05 __ BNE $0d08 ; (f256main.s53 + 0)
.s54:
0d03 : ad 79 9d LDA $9d79 ; (a2 + 1)
0d06 : f0 08 __ BEQ $0d10 ; (f256main.s52 + 0)
.s53:
0d08 : ad 79 9d LDA $9d79 ; (a2 + 1)
0d0b : 85 56 __ STA T0 + 1 
0d0d : ae 78 9d LDX $9d78 ; (a2 + 0)
.s52:
0d10 : 8e f7 9f STX $9ff7 ; (sstack + 43)
0d13 : a5 56 __ LDA T0 + 1 
0d15 : 8d f8 9f STA $9ff8 ; (sstack + 44)
0d18 : 20 52 4c JSR $4c52 ; (ftp_retr.s1 + 0)
0d1b : 4c ff 09 JMP $09ff ; (f256main.l10 + 0)
.s55:
0d1e : ad 7c 9d LDA $9d7c ; (cmd + 0)
0d21 : 85 1b __ STA P0 
0d23 : ad 7d 9d LDA $9d7d ; (cmd + 1)
0d26 : 85 1c __ STA P1 
0d28 : a9 29 __ LDA #$29
0d2a : 85 1d __ STA P2 
0d2c : a9 6d __ LDA #$6d
0d2e : 85 1e __ STA P3 
0d30 : 20 c3 1d JSR $1dc3 ; (strcmp.s4 + 0)
0d33 : aa __ __ TAX
0d34 : d0 43 __ BNE $0d79 ; (f256main.s62 + 0)
.s56:
0d36 : ad 7b 9d LDA $9d7b ; (a1 + 1)
0d39 : 85 56 __ STA T0 + 1 
0d3b : ad 7a 9d LDA $9d7a ; (a1 + 0)
0d3e : aa __ __ TAX
0d3f : 05 56 __ ORA T0 + 1 
0d41 : d0 0e __ BNE $0d51 ; (f256main.s58 + 0)
.s57:
0d43 : a9 4f __ LDA #$4f
0d45 : 85 1d __ STA P2 
0d47 : 20 76 17 JSR $1776 ; (initTextXY.s4 + 0)
0d4a : a9 71 __ LDA #$71
0d4c : a2 23 __ LDX #$23
0d4e : 4c 18 0b JMP $0b18 ; (f256main.s19 + 0)
.s58:
0d51 : 8e ed 9f STX $9fed ; (sstack + 33)
0d54 : a5 56 __ LDA T0 + 1 
0d56 : 8d ee 9f STA $9fee ; (sstack + 34)
0d59 : ad 78 9d LDA $9d78 ; (a2 + 0)
0d5c : d0 05 __ BNE $0d63 ; (f256main.s60 + 0)
.s61:
0d5e : ad 79 9d LDA $9d79 ; (a2 + 1)
0d61 : f0 08 __ BEQ $0d6b ; (f256main.s59 + 0)
.s60:
0d63 : ad 79 9d LDA $9d79 ; (a2 + 1)
0d66 : 85 56 __ STA T0 + 1 
0d68 : ae 78 9d LDX $9d78 ; (a2 + 0)
.s59:
0d6b : 8e ef 9f STX $9fef ; (sstack + 35)
0d6e : a5 56 __ LDA T0 + 1 
0d70 : 8d f0 9f STA $9ff0 ; (sstack + 36)
0d73 : 20 2d 6d JSR $6d2d ; (ftp_stor.s1 + 0)
0d76 : 4c ff 09 JMP $09ff ; (f256main.l10 + 0)
.s62:
0d79 : ad 7c 9d LDA $9d7c ; (cmd + 0)
0d7c : 85 1b __ STA P0 
0d7e : ad 7d 9d LDA $9d7d ; (cmd + 1)
0d81 : 85 1c __ STA P1 
0d83 : a9 3f __ LDA #$3f
0d85 : 85 1d __ STA P2 
0d87 : a9 71 __ LDA #$71
0d89 : 85 1e __ STA P3 
0d8b : 20 c3 1d JSR $1dc3 ; (strcmp.s4 + 0)
0d8e : aa __ __ TAX
0d8f : d0 06 __ BNE $0d97 ; (f256main.s64 + 0)
.s63:
0d91 : 20 d2 69 JSR $69d2 ; (ftp_type_binary.s1 + 0)
0d94 : 4c ff 09 JMP $09ff ; (f256main.l10 + 0)
.s64:
0d97 : ad 7c 9d LDA $9d7c ; (cmd + 0)
0d9a : 85 1b __ STA P0 
0d9c : ad 7d 9d LDA $9d7d ; (cmd + 1)
0d9f : 85 1c __ STA P1 
0da1 : a9 43 __ LDA #$43
0da3 : 85 1d __ STA P2 
0da5 : a9 71 __ LDA #$71
0da7 : 85 1e __ STA P3 
0da9 : 20 c3 1d JSR $1dc3 ; (strcmp.s4 + 0)
0dac : aa __ __ TAX
0dad : f0 18 __ BEQ $0dc7 ; (f256main.s65 + 0)
.s66:
0daf : ad 7c 9d LDA $9d7c ; (cmd + 0)
0db2 : 85 1b __ STA P0 
0db4 : ad 7d 9d LDA $9d7d ; (cmd + 1)
0db7 : 85 1c __ STA P1 
0db9 : a9 48 __ LDA #$48
0dbb : 85 1d __ STA P2 
0dbd : a9 71 __ LDA #$71
0dbf : 85 1e __ STA P3 
0dc1 : 20 c3 1d JSR $1dc3 ; (strcmp.s4 + 0)
0dc4 : aa __ __ TAX
0dc5 : d0 06 __ BNE $0dcd ; (f256main.s67 + 0)
.s65:
0dc7 : 20 4c 71 JSR $714c ; (ftp_quit.s1 + 0)
0dca : 4c ff 09 JMP $09ff ; (f256main.l10 + 0)
.s67:
0dcd : ad 7c 9d LDA $9d7c ; (cmd + 0)
0dd0 : 85 1b __ STA P0 
0dd2 : ad 7d 9d LDA $9d7d ; (cmd + 1)
0dd5 : 85 1c __ STA P1 
0dd7 : a9 e8 __ LDA #$e8
0dd9 : 85 1d __ STA P2 
0ddb : a9 71 __ LDA #$71
0ddd : 85 1e __ STA P3 
0ddf : 20 c3 1d JSR $1dc3 ; (strcmp.s4 + 0)
0de2 : aa __ __ TAX
0de3 : d0 4e __ BNE $0e33 ; (f256main.s73 + 0)
.s68:
0de5 : ad 7a 9d LDA $9d7a ; (a1 + 0)
0de8 : 0d 7b 9d ORA $9d7b ; (a1 + 1)
0deb : f0 1d __ BEQ $0e0a ; (f256main.s69 + 0)
.s72:
0ded : ad 7a 9d LDA $9d7a ; (a1 + 0)
0df0 : 85 1b __ STA P0 
0df2 : ad 7b 9d LDA $9d7b ; (a1 + 1)
0df5 : 85 1c __ STA P1 
0df7 : a9 ee __ LDA #$ee
0df9 : 85 1d __ STA P2 
0dfb : a9 71 __ LDA #$71
0dfd : 85 1e __ STA P3 
0dff : 20 c3 1d JSR $1dc3 ; (strcmp.s4 + 0)
0e02 : c9 01 __ CMP #$01
0e04 : a9 00 __ LDA #$00
0e06 : 69 ff __ ADC #$ff
0e08 : 29 01 __ AND #$01
.s69:
0e0a : 8d ad 79 STA $79ad ; (debug_mode + 0)
0e0d : 85 57 __ STA T1 + 0 
0e0f : a9 4f __ LDA #$4f
0e11 : 85 1d __ STA P2 
0e13 : 20 76 17 JSR $1776 ; (initTextXY.s4 + 0)
0e16 : a9 f1 __ LDA #$f1
0e18 : 85 23 __ STA P8 
0e1a : a9 71 __ LDA #$71
0e1c : 85 24 __ STA P9 
0e1e : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
0e21 : a5 57 __ LDA T1 + 0 
0e23 : d0 07 __ BNE $0e2c ; (f256main.s71 + 0)
.s70:
0e25 : a9 71 __ LDA #$71
0e27 : a2 f8 __ LDX #$f8
0e29 : 4c 18 0b JMP $0b18 ; (f256main.s19 + 0)
.s71:
0e2c : a9 71 __ LDA #$71
0e2e : a2 ee __ LDX #$ee
0e30 : 4c 18 0b JMP $0b18 ; (f256main.s19 + 0)
.s73:
0e33 : ad 7c 9d LDA $9d7c ; (cmd + 0)
0e36 : 85 1b __ STA P0 
0e38 : ad 7d 9d LDA $9d7d ; (cmd + 1)
0e3b : 85 1c __ STA P1 
0e3d : a9 00 __ LDA #$00
0e3f : 85 1d __ STA P2 
0e41 : a9 72 __ LDA #$72
0e43 : 85 1e __ STA P3 
0e45 : 20 c3 1d JSR $1dc3 ; (strcmp.s4 + 0)
0e48 : 85 55 __ STA T0 + 0 
0e4a : a9 4f __ LDA #$4f
0e4c : 85 1d __ STA P2 
0e4e : 20 76 17 JSR $1776 ; (initTextXY.s4 + 0)
0e51 : a5 55 __ LDA T0 + 0 
0e53 : f0 07 __ BEQ $0e5c ; (f256main.s74 + 0)
.s75:
0e55 : a9 72 __ LDA #$72
0e57 : a2 25 __ LDX #$25
0e59 : 4c 18 0b JMP $0b18 ; (f256main.s19 + 0)
.s74:
0e5c : a9 05 __ LDA #$05
0e5e : 85 23 __ STA P8 
0e60 : a9 72 __ LDA #$72
0e62 : 85 24 __ STA P9 
0e64 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
0e67 : a9 78 __ LDA #$78
0e69 : 85 1d __ STA P2 
0e6b : 20 2c 19 JSR $192c ; (lilpause.s4 + 0)
0e6e : a9 00 __ LDA #$00
0e70 : 85 29 __ STA ACCU + 0 
0e72 : 85 2a __ STA ACCU + 1 
.s3:
0e74 : a2 03 __ LDX #$03
0e76 : bd 53 9d LDA $9d53,x ; (f256main@stack + 0)
0e79 : 95 55 __ STA T0 + 0,x 
0e7b : ca __ __ DEX
0e7c : 10 f8 __ BPL $0e76 ; (f256main.s3 + 2)
0e7e : 60 __ __ RTS
--------------------------------------------------------------------
initMyBitmap: ; initMyBitmap()->void
;   6, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/myBitmap.h"
.s4:
0e7f : a9 01 __ LDA #$01
0e81 : 85 01 __ STA $01 
0e83 : a9 d0 __ LDA #$d0
0e85 : 85 4f __ STA T2 + 1 
0e87 : a9 00 __ LDA #$00
0e89 : 85 4e __ STA T2 + 0 
0e8b : 85 1b __ STA P0 
0e8d : 85 1e __ STA P3 
.l6:
0e8f : 85 1c __ STA P1 
0e91 : 85 36 __ STA T0 + 1 
0e93 : a9 01 __ LDA #$01
0e95 : 85 37 __ STA T0 + 2 
0e97 : 85 1d __ STA P2 
0e99 : a9 00 __ LDA #$00
0e9b : 85 38 __ STA T0 + 3 
0e9d : 20 b6 0f JSR $0fb6 ; (FAR_PEEK.s4 + 0)
0ea0 : 85 35 __ STA T0 + 0 
0ea2 : a0 00 __ LDY #$00
0ea4 : 91 4e __ STA (T2 + 0),y 
0ea6 : e6 4e __ INC T2 + 0 
0ea8 : d0 02 __ BNE $0eac ; (initMyBitmap.s9 + 0)
.s8:
0eaa : e6 4f __ INC T2 + 1 
.s9:
0eac : 18 __ __ CLC
0ead : a5 1b __ LDA P0 
0eaf : 69 01 __ ADC #$01
0eb1 : 85 1b __ STA P0 
0eb3 : a5 1c __ LDA P1 
0eb5 : 69 00 __ ADC #$00
0eb7 : c9 04 __ CMP #$04
0eb9 : d0 d4 __ BNE $0e8f ; (initMyBitmap.l6 + 0)
.s7:
0ebb : a6 1b __ LDX P0 
0ebd : d0 d0 __ BNE $0e8f ; (initMyBitmap.l6 + 0)
.s5:
0ebf : 84 24 __ STY P9 
0ec1 : 84 26 __ STY P11 
0ec3 : 85 23 __ STA P8 
0ec5 : a9 9c __ LDA #$9c
0ec7 : 8d cc 9f STA $9fcc ; (sstack + 0)
0eca : 84 01 __ STY $01 
0ecc : 8c cd 9f STY $9fcd ; (sstack + 1)
0ecf : 8c cf 9f STY $9fcf ; (sstack + 3)
0ed2 : 8c 70 7a STY $7a70 ; (_color + 0)
0ed5 : a9 07 __ LDA #$07
0ed7 : 85 25 __ STA P10 
0ed9 : 8d ce 9f STA $9fce ; (sstack + 2)
0edc : 20 e9 0f JSR $0fe9 ; (bitmapClear.s4 + 0)
0edf : a9 02 __ LDA #$02
0ee1 : 8d 70 7a STA $7a70 ; (_color + 0)
0ee4 : 20 6d 10 JSR $106d ; (bitmapLine.s4 + 0)
0ee7 : a9 00 __ LDA #$00
0ee9 : 8d cd 9f STA $9fcd ; (sstack + 1)
0eec : 8d cf 9f STA $9fcf ; (sstack + 3)
0eef : a9 04 __ LDA #$04
0ef1 : 8d cc 9f STA $9fcc ; (sstack + 0)
0ef4 : a9 ac __ LDA #$ac
0ef6 : 8d ce 9f STA $9fce ; (sstack + 2)
0ef9 : 20 6d 10 JSR $106d ; (bitmapLine.s4 + 0)
0efc : a9 9c __ LDA #$9c
0efe : 85 23 __ STA P8 
0f00 : 8d cc 9f STA $9fcc ; (sstack + 0)
0f03 : a9 00 __ LDA #$00
0f05 : 8d cd 9f STA $9fcd ; (sstack + 1)
0f08 : 8d cf 9f STA $9fcf ; (sstack + 3)
0f0b : a9 ac __ LDA #$ac
0f0d : 8d ce 9f STA $9fce ; (sstack + 2)
0f10 : 20 6d 10 JSR $106d ; (bitmapLine.s4 + 0)
0f13 : a9 00 __ LDA #$00
0f15 : 8d cd 9f STA $9fcd ; (sstack + 1)
0f18 : 8d cf 9f STA $9fcf ; (sstack + 3)
0f1b : a9 04 __ LDA #$04
0f1d : 85 23 __ STA P8 
0f1f : a9 9c __ LDA #$9c
0f21 : 8d cc 9f STA $9fcc ; (sstack + 0)
0f24 : a9 ac __ LDA #$ac
0f26 : 85 25 __ STA P10 
0f28 : 8d ce 9f STA $9fce ; (sstack + 2)
0f2b : 20 6d 10 JSR $106d ; (bitmapLine.s4 + 0)
0f2e : a9 07 __ LDA #$07
0f30 : 85 25 __ STA P10 
0f32 : 8d ce 9f STA $9fce ; (sstack + 2)
0f35 : a9 a0 __ LDA #$a0
0f37 : 85 23 __ STA P8 
0f39 : a9 38 __ LDA #$38
0f3b : 8d cc 9f STA $9fcc ; (sstack + 0)
0f3e : a9 01 __ LDA #$01
0f40 : 8d cd 9f STA $9fcd ; (sstack + 1)
0f43 : a9 00 __ LDA #$00
0f45 : 8d cf 9f STA $9fcf ; (sstack + 3)
0f48 : a9 04 __ LDA #$04
0f4a : 8d 70 7a STA $7a70 ; (_color + 0)
0f4d : 20 6d 10 JSR $106d ; (bitmapLine.s4 + 0)
0f50 : a9 00 __ LDA #$00
0f52 : 8d cd 9f STA $9fcd ; (sstack + 1)
0f55 : 8d cf 9f STA $9fcf ; (sstack + 3)
0f58 : a9 a0 __ LDA #$a0
0f5a : 8d cc 9f STA $9fcc ; (sstack + 0)
0f5d : a9 ac __ LDA #$ac
0f5f : 8d ce 9f STA $9fce ; (sstack + 2)
0f62 : 20 6d 10 JSR $106d ; (bitmapLine.s4 + 0)
0f65 : a9 01 __ LDA #$01
0f67 : 8d cd 9f STA $9fcd ; (sstack + 1)
0f6a : 85 24 __ STA P9 
0f6c : a9 38 __ LDA #$38
0f6e : 85 23 __ STA P8 
0f70 : 8d cc 9f STA $9fcc ; (sstack + 0)
0f73 : a9 ac __ LDA #$ac
0f75 : 8d ce 9f STA $9fce ; (sstack + 2)
0f78 : a9 00 __ LDA #$00
0f7a : 8d cf 9f STA $9fcf ; (sstack + 3)
0f7d : 20 6d 10 JSR $106d ; (bitmapLine.s4 + 0)
0f80 : a9 ac __ LDA #$ac
0f82 : 8d ce 9f STA $9fce ; (sstack + 2)
0f85 : 85 25 __ STA P10 
0f87 : a9 a0 __ LDA #$a0
0f89 : 85 23 __ STA P8 
0f8b : a9 00 __ LDA #$00
0f8d : 85 24 __ STA P9 
0f8f : 8d cf 9f STA $9fcf ; (sstack + 3)
0f92 : a9 38 __ LDA #$38
0f94 : 8d cc 9f STA $9fcc ; (sstack + 0)
0f97 : a9 01 __ LDA #$01
0f99 : 8d cd 9f STA $9fcd ; (sstack + 1)
0f9c : 20 6d 10 JSR $106d ; (bitmapLine.s4 + 0)
0f9f : a9 00 __ LDA #$00
0fa1 : 85 1b __ STA P0 
0fa3 : a9 01 __ LDA #$01
0fa5 : 85 1c __ STA P1 
0fa7 : 20 9a 06 JSR $069a ; (bitmapSetVisible.s4 + 0)
0faa : e6 1b __ INC P0 
0fac : c6 1c __ DEC P1 
0fae : 20 9a 06 JSR $069a ; (bitmapSetVisible.s4 + 0)
0fb1 : e6 1b __ INC P0 
0fb3 : 4c 9a 06 JMP $069a ; (bitmapSetVisible.s4 + 0)
--------------------------------------------------------------------
FAR_PEEK: ; FAR_PEEK(u32)->u8
; 213, "/mnt/d/F256/f256lib-oscar64/f256lib/f256lib.h"
.s4:
0fb6 : a5 0f __ LDA $0f 
0fb8 : 85 38 __ STA T2 + 0 
0fba : 78 __ __ SEI
0fbb : a5 1b __ LDA P0 ; (address + 0)
0fbd : 85 35 __ STA T0 + 0 
0fbf : a5 1c __ LDA P1 ; (address + 1)
0fc1 : 85 37 __ STA T1 + 0 
0fc3 : a5 1e __ LDA P3 ; (address + 3)
0fc5 : a2 05 __ LDX #$05
.l5:
0fc7 : 4a __ __ LSR
0fc8 : 66 1d __ ROR P2 ; (address + 2)
0fca : 66 37 __ ROR T1 + 0 
0fcc : ca __ __ DEX
0fcd : d0 f8 __ BNE $0fc7 ; (FAR_PEEK.l5 + 0)
.s6:
0fcf : a5 37 __ LDA T1 + 0 
0fd1 : 85 0f __ STA $0f 
0fd3 : a5 1c __ LDA P1 ; (address + 1)
0fd5 : 29 1f __ AND #$1f
0fd7 : 09 e0 __ ORA #$e0
0fd9 : 85 36 __ STA T0 + 1 
0fdb : a0 00 __ LDY #$00
0fdd : b1 35 __ LDA (T0 + 0),y 
0fdf : 85 35 __ STA T0 + 0 
0fe1 : a5 38 __ LDA T2 + 0 
0fe3 : 85 0f __ STA $0f 
0fe5 : 58 __ __ CLI
0fe6 : a5 35 __ LDA T0 + 0 
.s3:
0fe8 : 60 __ __ RTS
--------------------------------------------------------------------
bitmapClear: ; bitmapClear()->void
;  15, "/mnt/d/F256/f256lib-oscar64/f256lib/f_bitmap.h"
.s4:
0fe9 : ad 6f 7a LDA $7a6f ; (_active + 0)
0fec : 0a __ __ ASL
0fed : 0a __ __ ASL
0fee : aa __ __ TAX
0fef : bd 72 7a LDA $7a72,x ; (_BITMAP_BASE[0] + 1)
0ff2 : 85 36 __ STA T0 + 1 
0ff4 : bd 73 7a LDA $7a73,x ; (_BITMAP_BASE[0] + 2)
0ff7 : 85 37 __ STA T0 + 2 
0ff9 : bd 74 7a LDA $7a74,x ; (_BITMAP_BASE[0] + 3)
0ffc : 85 38 __ STA T0 + 3 
0ffe : a5 0f __ LDA $0f 
1000 : 85 3b __ STA T2 + 0 
1002 : 78 __ __ SEI
1003 : a5 36 __ LDA T0 + 1 
1005 : 85 35 __ STA T0 + 0 
1007 : a5 37 __ LDA T0 + 2 
1009 : 85 36 __ STA T0 + 1 
100b : a5 38 __ LDA T0 + 3 
100d : a2 05 __ LDX #$05
.l5:
100f : 4a __ __ LSR
1010 : 66 36 __ ROR T0 + 1 
1012 : 66 35 __ ROR T0 + 0 
1014 : ca __ __ DEX
1015 : d0 f8 __ BNE $100f ; (bitmapClear.l5 + 0)
.s6:
1017 : a9 09 __ LDA #$09
1019 : 85 3c __ STA T3 + 0 
.l7:
101b : 86 39 __ STX T1 + 0 
101d : a5 35 __ LDA T0 + 0 
101f : 85 0f __ STA $0f 
1021 : e6 35 __ INC T0 + 0 
1023 : ad 70 7a LDA $7a70 ; (_color + 0)
1026 : 85 3d __ STA T4 + 0 
1028 : a9 e0 __ LDA #$e0
102a : 85 3a __ STA T1 + 1 
.l8:
102c : a5 39 __ LDA T1 + 0 
102e : a2 00 __ LDX #$00
1030 : 86 39 __ STX T1 + 0 
1032 : a8 __ __ TAY
.l13:
1033 : a5 3d __ LDA T4 + 0 
1035 : 91 39 __ STA (T1 + 0),y 
1037 : c8 __ __ INY
1038 : d0 02 __ BNE $103c ; (bitmapClear.s18 + 0)
.s17:
103a : e6 3a __ INC T1 + 1 
.s18:
103c : 98 __ __ TYA
103d : d0 f4 __ BNE $1033 ; (bitmapClear.l13 + 0)
.s14:
103f : 85 39 __ STA T1 + 0 
1041 : a5 3a __ LDA T1 + 1 
1043 : d0 e7 __ BNE $102c ; (bitmapClear.l8 + 0)
.s9:
1045 : c6 3c __ DEC T3 + 0 
1047 : d0 d2 __ BNE $101b ; (bitmapClear.l7 + 0)
.s10:
1049 : a5 35 __ LDA T0 + 0 
104b : 85 0f __ STA $0f 
104d : a9 e0 __ LDA #$e0
104f : 85 36 __ STA T0 + 1 
1051 : a0 00 __ LDY #$00
.l11:
1053 : 86 35 __ STX T0 + 0 
.l15:
1055 : a5 3d __ LDA T4 + 0 
1057 : 91 35 __ STA (T0 + 0),y 
1059 : c8 __ __ INY
105a : d0 02 __ BNE $105e ; (bitmapClear.s20 + 0)
.s19:
105c : e6 36 __ INC T0 + 1 
.s20:
105e : 98 __ __ TYA
105f : d0 f4 __ BNE $1055 ; (bitmapClear.l15 + 0)
.s16:
1061 : a5 36 __ LDA T0 + 1 
1063 : c9 f4 __ CMP #$f4
1065 : d0 ec __ BNE $1053 ; (bitmapClear.l11 + 0)
.s12:
1067 : a5 3b __ LDA T2 + 0 
1069 : 85 0f __ STA $0f 
106b : 58 __ __ CLI
.s3:
106c : 60 __ __ RTS
--------------------------------------------------------------------
bitmapLine: ; bitmapLine(u16,u16,u16,u16)->void
;  17, "/mnt/d/F256/f256lib-oscar64/f256lib/f_bitmap.h"
.s4:
106d : a5 0f __ LDA $0f 
106f : 85 4d __ STA T13 + 0 
1071 : 78 __ __ SEI
1072 : ad ce 9f LDA $9fce ; (sstack + 2)
1075 : 85 3d __ STA T4 + 0 
1077 : ad cf 9f LDA $9fcf ; (sstack + 3)
107a : 85 3e __ STA T4 + 1 
107c : ad cc 9f LDA $9fcc ; (sstack + 0)
107f : 85 3f __ STA T5 + 0 
1081 : ad cd 9f LDA $9fcd ; (sstack + 1)
1084 : 85 40 __ STA T5 + 1 
1086 : c5 24 __ CMP P9 ; (x1 + 1)
1088 : d0 04 __ BNE $108e ; (bitmapLine.s39 + 0)
.s38:
108a : a5 3f __ LDA T5 + 0 
108c : c5 23 __ CMP P8 ; (x1 + 0)
.s39:
108e : b0 13 __ BCS $10a3 ; (bitmapLine.s37 + 0)
.s5:
1090 : 38 __ __ SEC
1091 : a5 23 __ LDA P8 ; (x1 + 0)
1093 : e5 3f __ SBC T5 + 0 
1095 : 85 39 __ STA T2 + 0 
1097 : a5 24 __ LDA P9 ; (x1 + 1)
1099 : e5 40 __ SBC T5 + 1 
109b : 85 3a __ STA T2 + 1 
109d : a9 ff __ LDA #$ff
109f : 85 41 __ STA T6 + 0 
10a1 : d0 12 __ BNE $10b5 ; (bitmapLine.s6 + 0)
.s37:
10a3 : a5 3f __ LDA T5 + 0 
10a5 : e5 23 __ SBC P8 ; (x1 + 0)
10a7 : 85 39 __ STA T2 + 0 
10a9 : a5 40 __ LDA T5 + 1 
10ab : e5 24 __ SBC P9 ; (x1 + 1)
10ad : 85 3a __ STA T2 + 1 
10af : a9 01 __ LDA #$01
10b1 : 85 41 __ STA T6 + 0 
10b3 : a9 00 __ LDA #$00
.s6:
10b5 : 85 42 __ STA T6 + 1 
10b7 : a5 3e __ LDA T4 + 1 
10b9 : c5 26 __ CMP P11 ; (y1 + 1)
10bb : d0 04 __ BNE $10c1 ; (bitmapLine.s36 + 0)
.s35:
10bd : a5 3d __ LDA T4 + 0 
10bf : c5 25 __ CMP P10 ; (y1 + 0)
.s36:
10c1 : b0 13 __ BCS $10d6 ; (bitmapLine.s34 + 0)
.s7:
10c3 : 38 __ __ SEC
10c4 : a5 25 __ LDA P10 ; (y1 + 0)
10c6 : e5 3d __ SBC T4 + 0 
10c8 : 85 3b __ STA T3 + 0 
10ca : a5 26 __ LDA P11 ; (y1 + 1)
10cc : e5 3e __ SBC T4 + 1 
10ce : 85 3c __ STA T3 + 1 
10d0 : a9 ff __ LDA #$ff
10d2 : 85 43 __ STA T7 + 0 
10d4 : d0 12 __ BNE $10e8 ; (bitmapLine.s8 + 0)
.s34:
10d6 : a5 3d __ LDA T4 + 0 
10d8 : e5 25 __ SBC P10 ; (y1 + 0)
10da : 85 3b __ STA T3 + 0 
10dc : a5 3e __ LDA T4 + 1 
10de : e5 26 __ SBC P11 ; (y1 + 1)
10e0 : 85 3c __ STA T3 + 1 
10e2 : a9 01 __ LDA #$01
10e4 : 85 43 __ STA T7 + 0 
10e6 : a9 00 __ LDA #$00
.s8:
10e8 : 85 44 __ STA T7 + 1 
10ea : a5 39 __ LDA T2 + 0 
10ec : 0a __ __ ASL
10ed : 85 45 __ STA T8 + 0 
10ef : a5 3a __ LDA T2 + 1 
10f1 : 2a __ __ ROL
10f2 : 85 46 __ STA T8 + 1 
10f4 : a5 3b __ LDA T3 + 0 
10f6 : 0a __ __ ASL
10f7 : 85 47 __ STA T9 + 0 
10f9 : a5 3c __ LDA T3 + 1 
10fb : 2a __ __ ROL
10fc : 85 48 __ STA T9 + 1 
10fe : a5 25 __ LDA P10 ; (y1 + 0)
1100 : 85 49 __ STA T10 + 0 
1102 : 85 1b __ STA P0 
1104 : a5 26 __ LDA P11 ; (y1 + 1)
1106 : 85 4a __ STA T10 + 1 
1108 : 85 1c __ STA P1 
110a : a5 23 __ LDA P8 ; (x1 + 0)
110c : 85 4b __ STA T11 + 0 
110e : a5 3a __ LDA T2 + 1 
1110 : a6 24 __ LDX P9 ; (x1 + 1)
1112 : 86 4c __ STX T11 + 1 
1114 : c5 3c __ CMP T3 + 1 
1116 : d0 09 __ BNE $1121 ; (bitmapLine.s33 + 0)
.s30:
1118 : a5 39 __ LDA T2 + 0 
111a : c5 3b __ CMP T3 + 0 
.s31:
111c : b0 09 __ BCS $1127 ; (bitmapLine.s21 + 0)
111e : 4c 83 12 JMP $1283 ; (bitmapLine.s9 + 0)
.s33:
1121 : 45 3c __ EOR T3 + 1 
1123 : 10 f7 __ BPL $111c ; (bitmapLine.s31 + 0)
.s32:
1125 : b0 f7 __ BCS $111e ; (bitmapLine.s31 + 2)
.s21:
1127 : e4 40 __ CPX T5 + 1 
1129 : d0 09 __ BNE $1134 ; (bitmapLine.s22 + 0)
.s29:
112b : a5 23 __ LDA P8 ; (x1 + 0)
112d : c5 3f __ CMP T5 + 0 
112f : d0 03 __ BNE $1134 ; (bitmapLine.s22 + 0)
1131 : 4c 0d 12 JMP $120d ; (bitmapLine.s10 + 0)
.s22:
1134 : ad 6f 7a LDA $7a6f ; (_active + 0)
1137 : 0a __ __ ASL
1138 : 0a __ __ ASL
1139 : 85 3b __ STA T3 + 0 
113b : 38 __ __ SEC
113c : a5 47 __ LDA T9 + 0 
113e : e5 39 __ SBC T2 + 0 
1140 : 85 39 __ STA T2 + 0 
1142 : a5 48 __ LDA T9 + 1 
1144 : e5 3a __ SBC T2 + 1 
1146 : 85 3a __ STA T2 + 1 
1148 : ad 6d 7a LDA $7a6d ; (_MAX_X + 0)
114b : 85 3d __ STA T4 + 0 
114d : ad 6e 7a LDA $7a6e ; (_MAX_X + 1)
1150 : 85 3e __ STA T4 + 1 
.l23:
1152 : a5 49 __ LDA T10 + 0 
1154 : 85 1b __ STA P0 
1156 : a5 4a __ LDA T10 + 1 
1158 : 85 1c __ STA P1 
115a : a5 3d __ LDA T4 + 0 
115c : 85 1d __ STA P2 
115e : a5 3e __ LDA T4 + 1 
1160 : 85 1e __ STA P3 
1162 : 20 78 04 JSR $0478 ; (mathUnsignedMultiply.s4 + 0)
1165 : a5 29 __ LDA ACCU + 0 ; (y2 + 0)
1167 : 85 1b __ STA P0 
1169 : a5 2a __ LDA ACCU + 1 ; (y2 + 1)
116b : 85 1c __ STA P1 
116d : a5 2b __ LDA ACCU + 2 
116f : 85 1d __ STA P2 
1171 : a5 2c __ LDA ACCU + 3 
1173 : 85 1e __ STA P3 
1175 : a5 4b __ LDA T11 + 0 
1177 : 85 1f __ STA P4 
1179 : a5 4c __ LDA T11 + 1 
117b : 85 20 __ STA P5 
117d : a9 00 __ LDA #$00
117f : 85 21 __ STA P6 
1181 : 85 22 __ STA P7 
1183 : 20 6a 13 JSR $136a ; (mathUnsignedAddition.s4 + 0)
1186 : a6 3b __ LDX T3 + 0 
1188 : bd 71 7a LDA $7a71,x ; (_BITMAP_BASE[0] + 0)
118b : 18 __ __ CLC
118c : 65 29 __ ADC ACCU + 0 ; (y2 + 0)
118e : 85 35 __ STA T0 + 0 
1190 : bd 72 7a LDA $7a72,x ; (_BITMAP_BASE[0] + 1)
1193 : 65 2a __ ADC ACCU + 1 ; (y2 + 1)
1195 : 85 37 __ STA T1 + 0 
1197 : a8 __ __ TAY
1198 : bd 73 7a LDA $7a73,x ; (_BITMAP_BASE[0] + 2)
119b : 65 2b __ ADC ACCU + 2 
119d : 85 38 __ STA T1 + 1 
119f : bd 74 7a LDA $7a74,x ; (_BITMAP_BASE[0] + 3)
11a2 : 65 2c __ ADC ACCU + 3 
11a4 : a2 05 __ LDX #$05
.l24:
11a6 : 4a __ __ LSR
11a7 : 66 38 __ ROR T1 + 1 
11a9 : 66 37 __ ROR T1 + 0 
11ab : ca __ __ DEX
11ac : d0 f8 __ BNE $11a6 ; (bitmapLine.l24 + 0)
.s25:
11ae : a5 37 __ LDA T1 + 0 
11b0 : 85 0f __ STA $0f 
11b2 : 98 __ __ TYA
11b3 : 29 1f __ AND #$1f
11b5 : 09 e0 __ ORA #$e0
11b7 : 85 36 __ STA T0 + 1 
11b9 : ad 70 7a LDA $7a70 ; (_color + 0)
11bc : a0 00 __ LDY #$00
11be : 91 35 __ STA (T0 + 0),y 
11c0 : 24 3a __ BIT T2 + 1 
11c2 : 30 1a __ BMI $11de ; (bitmapLine.s26 + 0)
.s28:
11c4 : 38 __ __ SEC
11c5 : a5 39 __ LDA T2 + 0 
11c7 : e5 45 __ SBC T8 + 0 
11c9 : 85 39 __ STA T2 + 0 
11cb : a5 3a __ LDA T2 + 1 
11cd : e5 46 __ SBC T8 + 1 
11cf : 85 3a __ STA T2 + 1 
11d1 : 18 __ __ CLC
11d2 : a5 49 __ LDA T10 + 0 
11d4 : 65 43 __ ADC T7 + 0 
11d6 : 85 49 __ STA T10 + 0 
11d8 : a5 4a __ LDA T10 + 1 
11da : 65 44 __ ADC T7 + 1 
11dc : 85 4a __ STA T10 + 1 
.s26:
11de : 18 __ __ CLC
11df : a5 39 __ LDA T2 + 0 
11e1 : 65 47 __ ADC T9 + 0 
11e3 : 85 39 __ STA T2 + 0 
11e5 : a5 3a __ LDA T2 + 1 
11e7 : 65 48 __ ADC T9 + 1 
11e9 : 85 3a __ STA T2 + 1 
11eb : 18 __ __ CLC
11ec : a5 1f __ LDA P4 
11ee : 65 41 __ ADC T6 + 0 
11f0 : 85 4b __ STA T11 + 0 
11f2 : a5 20 __ LDA P5 
11f4 : 65 42 __ ADC T6 + 1 
11f6 : 85 4c __ STA T11 + 1 
11f8 : c5 40 __ CMP T5 + 1 
11fa : f0 03 __ BEQ $11ff ; (bitmapLine.s27 + 0)
11fc : 4c 52 11 JMP $1152 ; (bitmapLine.l23 + 0)
.s27:
11ff : a5 4b __ LDA T11 + 0 
1201 : c5 3f __ CMP T5 + 0 
1203 : d0 f7 __ BNE $11fc ; (bitmapLine.s26 + 30)
.s40:
1205 : a5 49 __ LDA T10 + 0 
1207 : 85 1b __ STA P0 
1209 : a5 4a __ LDA T10 + 1 
120b : 85 1c __ STA P1 
.s10:
120d : ad 6d 7a LDA $7a6d ; (_MAX_X + 0)
1210 : 85 1d __ STA P2 
1212 : ad 6e 7a LDA $7a6e ; (_MAX_X + 1)
1215 : 85 1e __ STA P3 
1217 : ad 6f 7a LDA $7a6f ; (_active + 0)
121a : 85 37 __ STA T1 + 0 
121c : 20 78 04 JSR $0478 ; (mathUnsignedMultiply.s4 + 0)
121f : a5 29 __ LDA ACCU + 0 ; (y2 + 0)
1221 : 85 1b __ STA P0 
1223 : a5 2a __ LDA ACCU + 1 ; (y2 + 1)
1225 : 85 1c __ STA P1 
1227 : a5 2b __ LDA ACCU + 2 
1229 : 85 1d __ STA P2 
122b : a5 2c __ LDA ACCU + 3 
122d : 85 1e __ STA P3 
122f : a5 4b __ LDA T11 + 0 
1231 : 85 1f __ STA P4 
1233 : a5 4c __ LDA T11 + 1 
1235 : 85 20 __ STA P5 
1237 : a9 00 __ LDA #$00
1239 : 85 21 __ STA P6 
123b : 85 22 __ STA P7 
123d : 20 6a 13 JSR $136a ; (mathUnsignedAddition.s4 + 0)
1240 : a5 37 __ LDA T1 + 0 
1242 : 0a __ __ ASL
1243 : 0a __ __ ASL
1244 : aa __ __ TAX
1245 : bd 71 7a LDA $7a71,x ; (_BITMAP_BASE[0] + 0)
1248 : 18 __ __ CLC
1249 : 65 29 __ ADC ACCU + 0 ; (y2 + 0)
124b : 85 35 __ STA T0 + 0 
124d : bd 72 7a LDA $7a72,x ; (_BITMAP_BASE[0] + 1)
1250 : 65 2a __ ADC ACCU + 1 ; (y2 + 1)
1252 : 85 37 __ STA T1 + 0 
1254 : a8 __ __ TAY
1255 : bd 73 7a LDA $7a73,x ; (_BITMAP_BASE[0] + 2)
1258 : 65 2b __ ADC ACCU + 2 
125a : 85 38 __ STA T1 + 1 
125c : bd 74 7a LDA $7a74,x ; (_BITMAP_BASE[0] + 3)
125f : 65 2c __ ADC ACCU + 3 
1261 : a2 05 __ LDX #$05
.l11:
1263 : 4a __ __ LSR
1264 : 66 38 __ ROR T1 + 1 
1266 : 66 37 __ ROR T1 + 0 
1268 : ca __ __ DEX
1269 : d0 f8 __ BNE $1263 ; (bitmapLine.l11 + 0)
.s12:
126b : a5 37 __ LDA T1 + 0 
126d : 85 0f __ STA $0f 
126f : 98 __ __ TYA
1270 : 29 1f __ AND #$1f
1272 : 09 e0 __ ORA #$e0
1274 : 85 36 __ STA T0 + 1 
1276 : ad 70 7a LDA $7a70 ; (_color + 0)
1279 : a0 00 __ LDY #$00
127b : 91 35 __ STA (T0 + 0),y 
127d : a5 4d __ LDA T13 + 0 
127f : 85 0f __ STA $0f 
1281 : 58 __ __ CLI
.s3:
1282 : 60 __ __ RTS
.s9:
1283 : a5 26 __ LDA P11 ; (y1 + 1)
1285 : c5 3e __ CMP T4 + 1 
1287 : d0 09 __ BNE $1292 ; (bitmapLine.s13 + 0)
.s20:
1289 : a5 25 __ LDA P10 ; (y1 + 0)
128b : c5 3d __ CMP T4 + 0 
128d : d0 03 __ BNE $1292 ; (bitmapLine.s13 + 0)
128f : 4c 0d 12 JMP $120d ; (bitmapLine.s10 + 0)
.s13:
1292 : ad 6f 7a LDA $7a6f ; (_active + 0)
1295 : 0a __ __ ASL
1296 : 0a __ __ ASL
1297 : 85 39 __ STA T2 + 0 
1299 : 38 __ __ SEC
129a : a5 45 __ LDA T8 + 0 
129c : e5 3b __ SBC T3 + 0 
129e : 85 3b __ STA T3 + 0 
12a0 : a5 46 __ LDA T8 + 1 
12a2 : e5 3c __ SBC T3 + 1 
12a4 : 85 3c __ STA T3 + 1 
12a6 : ad 6d 7a LDA $7a6d ; (_MAX_X + 0)
12a9 : 85 3f __ STA T5 + 0 
12ab : ad 6e 7a LDA $7a6e ; (_MAX_X + 1)
12ae : 85 40 __ STA T5 + 1 
.l14:
12b0 : a5 49 __ LDA T10 + 0 
12b2 : 85 1b __ STA P0 
12b4 : a5 4a __ LDA T10 + 1 
12b6 : 85 1c __ STA P1 
12b8 : a5 3f __ LDA T5 + 0 
12ba : 85 1d __ STA P2 
12bc : a5 40 __ LDA T5 + 1 
12be : 85 1e __ STA P3 
12c0 : 20 78 04 JSR $0478 ; (mathUnsignedMultiply.s4 + 0)
12c3 : a5 29 __ LDA ACCU + 0 ; (y2 + 0)
12c5 : 85 1b __ STA P0 
12c7 : a5 2a __ LDA ACCU + 1 ; (y2 + 1)
12c9 : 85 1c __ STA P1 
12cb : a5 2b __ LDA ACCU + 2 
12cd : 85 1d __ STA P2 
12cf : a5 2c __ LDA ACCU + 3 
12d1 : 85 1e __ STA P3 
12d3 : a5 4b __ LDA T11 + 0 
12d5 : 85 1f __ STA P4 
12d7 : a5 4c __ LDA T11 + 1 
12d9 : 85 20 __ STA P5 
12db : a9 00 __ LDA #$00
12dd : 85 21 __ STA P6 
12df : 85 22 __ STA P7 
12e1 : 20 6a 13 JSR $136a ; (mathUnsignedAddition.s4 + 0)
12e4 : a6 39 __ LDX T2 + 0 
12e6 : bd 71 7a LDA $7a71,x ; (_BITMAP_BASE[0] + 0)
12e9 : 18 __ __ CLC
12ea : 65 29 __ ADC ACCU + 0 ; (y2 + 0)
12ec : 85 35 __ STA T0 + 0 
12ee : bd 72 7a LDA $7a72,x ; (_BITMAP_BASE[0] + 1)
12f1 : 65 2a __ ADC ACCU + 1 ; (y2 + 1)
12f3 : 85 37 __ STA T1 + 0 
12f5 : a8 __ __ TAY
12f6 : bd 73 7a LDA $7a73,x ; (_BITMAP_BASE[0] + 2)
12f9 : 65 2b __ ADC ACCU + 2 
12fb : 85 38 __ STA T1 + 1 
12fd : bd 74 7a LDA $7a74,x ; (_BITMAP_BASE[0] + 3)
1300 : 65 2c __ ADC ACCU + 3 
1302 : a2 05 __ LDX #$05
.l15:
1304 : 4a __ __ LSR
1305 : 66 38 __ ROR T1 + 1 
1307 : 66 37 __ ROR T1 + 0 
1309 : ca __ __ DEX
130a : d0 f8 __ BNE $1304 ; (bitmapLine.l15 + 0)
.s16:
130c : a5 37 __ LDA T1 + 0 
130e : 85 0f __ STA $0f 
1310 : 98 __ __ TYA
1311 : 29 1f __ AND #$1f
1313 : 09 e0 __ ORA #$e0
1315 : 85 36 __ STA T0 + 1 
1317 : ad 70 7a LDA $7a70 ; (_color + 0)
131a : a0 00 __ LDY #$00
131c : 91 35 __ STA (T0 + 0),y 
131e : 24 3c __ BIT T3 + 1 
1320 : 30 1a __ BMI $133c ; (bitmapLine.s17 + 0)
.s19:
1322 : 38 __ __ SEC
1323 : a5 3b __ LDA T3 + 0 
1325 : e5 47 __ SBC T9 + 0 
1327 : 85 3b __ STA T3 + 0 
1329 : a5 3c __ LDA T3 + 1 
132b : e5 48 __ SBC T9 + 1 
132d : 85 3c __ STA T3 + 1 
132f : 18 __ __ CLC
1330 : a5 1f __ LDA P4 
1332 : 65 41 __ ADC T6 + 0 
1334 : 85 4b __ STA T11 + 0 
1336 : a5 20 __ LDA P5 
1338 : 65 42 __ ADC T6 + 1 
133a : 85 4c __ STA T11 + 1 
.s17:
133c : 18 __ __ CLC
133d : a5 3b __ LDA T3 + 0 
133f : 65 45 __ ADC T8 + 0 
1341 : 85 3b __ STA T3 + 0 
1343 : a5 3c __ LDA T3 + 1 
1345 : 65 46 __ ADC T8 + 1 
1347 : 85 3c __ STA T3 + 1 
1349 : 18 __ __ CLC
134a : a5 49 __ LDA T10 + 0 
134c : 65 43 __ ADC T7 + 0 
134e : 85 49 __ STA T10 + 0 
1350 : 85 1b __ STA P0 
1352 : a5 4a __ LDA T10 + 1 
1354 : 65 44 __ ADC T7 + 1 
1356 : 85 4a __ STA T10 + 1 
1358 : c5 3e __ CMP T4 + 1 
135a : f0 03 __ BEQ $135f ; (bitmapLine.s18 + 0)
135c : 4c b0 12 JMP $12b0 ; (bitmapLine.l14 + 0)
.s18:
135f : 85 1c __ STA P1 
1361 : a5 1b __ LDA P0 
1363 : c5 3d __ CMP T4 + 0 
1365 : d0 f5 __ BNE $135c ; (bitmapLine.s17 + 32)
1367 : 4c 0d 12 JMP $120d ; (bitmapLine.s10 + 0)
--------------------------------------------------------------------
mathUnsignedAddition: ; mathUnsignedAddition(u32,u32)->u32
;  18, "/mnt/d/F256/f256lib-oscar64/f256lib/f_math.h"
.s4:
136a : a5 1b __ LDA P0 ; (a + 0)
136c : 8d 08 de STA $de08 
136f : a5 1c __ LDA P1 ; (a + 1)
1371 : 8d 09 de STA $de09 
1374 : a5 1d __ LDA P2 ; (a + 2)
1376 : 8d 0a de STA $de0a 
1379 : a5 1e __ LDA P3 ; (a + 3)
137b : 8d 0b de STA $de0b 
137e : a5 1f __ LDA P4 ; (b + 0)
1380 : 8d 0c de STA $de0c 
1383 : a5 20 __ LDA P5 ; (b + 1)
1385 : 8d 0d de STA $de0d 
1388 : a5 21 __ LDA P6 ; (b + 2)
138a : 8d 0e de STA $de0e 
138d : a5 22 __ LDA P7 ; (b + 3)
138f : 8d 0f de STA $de0f 
1392 : ad 18 de LDA $de18 
1395 : 85 29 __ STA ACCU + 0 
1397 : ad 19 de LDA $de19 
139a : 85 2a __ STA ACCU + 1 
139c : ad 1a de LDA $de1a 
139f : 85 2b __ STA ACCU + 2 
13a1 : ad 1b de LDA $de1b 
13a4 : 85 2c __ STA ACCU + 3 
.s3:
13a6 : 60 __ __ RTS
--------------------------------------------------------------------
initMySprites: ; initMySprites()->void
;  13, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/mySprites.h"
.s4:
13a7 : a9 00 __ LDA #$00
13a9 : 85 23 __ STA P8 
13ab : 85 26 __ STA P11 
13ad : a9 20 __ LDA #$20
13af : 8d d0 9f STA $9fd0 ; (sstack + 4)
13b2 : 85 24 __ STA P9 
13b4 : 85 25 __ STA P10 
13b6 : a9 00 __ LDA #$00
13b8 : 8d cc 9f STA $9fcc ; (sstack + 0)
13bb : 8d cf 9f STA $9fcf ; (sstack + 3)
13be : 8d d1 9f STA $9fd1 ; (sstack + 5)
13c1 : 8d d2 9f STA $9fd2 ; (sstack + 6)
13c4 : 8d d3 9f STA $9fd3 ; (sstack + 7)
13c7 : 8d d4 9f STA $9fd4 ; (sstack + 8)
13ca : 8d d5 9f STA $9fd5 ; (sstack + 9)
13cd : 8d d6 9f STA $9fd6 ; (sstack + 10)
13d0 : a9 04 __ LDA #$04
13d2 : 8d cd 9f STA $9fcd ; (sstack + 1)
13d5 : a9 01 __ LDA #$01
13d7 : 8d ce 9f STA $9fce ; (sstack + 2)
13da : 4c dd 13 JMP $13dd ; (initSpriteRecord.s4 + 0)
--------------------------------------------------------------------
initSpriteRecord: ; initSpriteRecord(u8,u32,u8,u16,u16,u16,u16,u8)->void
;  16, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/mySprites.h"
.s4:
13dd : ad cc 9f LDA $9fcc ; (sstack + 0)
13e0 : 85 1c __ STA P1 
13e2 : ad cd 9f LDA $9fcd ; (sstack + 1)
13e5 : 85 1d __ STA P2 
13e7 : ad ce 9f LDA $9fce ; (sstack + 2)
13ea : 85 1e __ STA P3 
13ec : ad cf 9f LDA $9fcf ; (sstack + 3)
13ef : 85 1f __ STA P4 
13f1 : a5 24 __ LDA P9 ; (size + 0)
13f3 : 85 20 __ STA P5 
13f5 : a9 00 __ LDA #$00
13f7 : 85 1b __ STA P0 
13f9 : 85 21 __ STA P6 
13fb : 85 22 __ STA P7 
13fd : 20 1c 14 JSR $141c ; (spriteDefine.s4 + 0)
1400 : a5 25 __ LDA P10 ; (x + 0)
1402 : 85 1c __ STA P1 
1404 : a5 26 __ LDA P11 ; (x + 1)
1406 : 85 1d __ STA P2 
1408 : ad d0 9f LDA $9fd0 ; (sstack + 4)
140b : 85 1e __ STA P3 
140d : ad d1 9f LDA $9fd1 ; (sstack + 5)
1410 : 85 1f __ STA P4 
1412 : 20 7c 14 JSR $147c ; (spriteSetPosition.s4 + 0)
1415 : a9 00 __ LDA #$00
1417 : 85 1c __ STA P1 
1419 : 4c 45 07 JMP $0745 ; (spriteSetVisible.s4 + 0)
--------------------------------------------------------------------
spriteDefine: ; spriteDefine(u8,u32,u8,u8,u8)->void
;  15, "/mnt/d/F256/f256lib-oscar64/f256lib/f_sprite.h"
.s4:
141c : a6 1b __ LDX P0 ; (s + 0)
141e : 8a __ __ TXA
141f : 0a __ __ ASL
1420 : 85 35 __ STA T2 + 0 
1422 : a9 00 __ LDA #$00
1424 : 2a __ __ ROL
1425 : 06 35 __ ASL T2 + 0 
1427 : 2a __ __ ROL
1428 : 06 35 __ ASL T2 + 0 
142a : 2a __ __ ROL
142b : 69 d9 __ ADC #$d9
142d : 85 2a __ STA ACCU + 1 
142f : a5 35 __ LDA T2 + 0 
1431 : 85 29 __ STA ACCU + 0 
1433 : a5 20 __ LDA P5 ; (size + 0)
1435 : c9 10 __ CMP #$10
1437 : d0 04 __ BNE $143d ; (spriteDefine.s5 + 0)
.s12:
1439 : a9 40 __ LDA #$40
143b : d0 0c __ BNE $1449 ; (spriteDefine.s8 + 0)
.s5:
143d : 90 35 __ BCC $1474 ; (spriteDefine.s10 + 0)
.s6:
143f : c9 18 __ CMP #$18
1441 : d0 04 __ BNE $1447 ; (spriteDefine.s7 + 0)
.s9:
1443 : a9 20 __ LDA #$20
1445 : d0 02 __ BNE $1449 ; (spriteDefine.s8 + 0)
.s7:
1447 : a9 00 __ LDA #$00
.s8:
1449 : 85 2b __ STA ACCU + 2 
144b : a5 22 __ LDA P7 ; (layer + 0)
144d : 0a __ __ ASL
144e : 0a __ __ ASL
144f : 0a __ __ ASL
1450 : 05 2b __ ORA ACCU + 2 
1452 : 85 2b __ STA ACCU + 2 
1454 : a5 21 __ LDA P6 ; (CLUT + 0)
1456 : 0a __ __ ASL
1457 : 05 2b __ ORA ACCU + 2 
1459 : 9d 83 7a STA $7a83,x ; (_spriteCtl[0] + 0)
145c : a0 00 __ LDY #$00
145e : 91 29 __ STA (ACCU + 0),y 
1460 : a5 2a __ LDA ACCU + 1 
1462 : 85 36 __ STA T2 + 1 
1464 : a5 1c __ LDA P1 ; (address + 0)
1466 : c8 __ __ INY
1467 : 91 35 __ STA (T2 + 0),y 
1469 : a5 1d __ LDA P2 ; (address + 1)
146b : c8 __ __ INY
146c : 91 35 __ STA (T2 + 0),y 
146e : a5 1e __ LDA P3 ; (address + 2)
1470 : c8 __ __ INY
1471 : 91 35 __ STA (T2 + 0),y 
.s3:
1473 : 60 __ __ RTS
.s10:
1474 : c9 08 __ CMP #$08
1476 : d0 cf __ BNE $1447 ; (spriteDefine.s7 + 0)
.s11:
1478 : a9 60 __ LDA #$60
147a : d0 cd __ BNE $1449 ; (spriteDefine.s8 + 0)
--------------------------------------------------------------------
spriteSetPosition: ; spriteSetPosition(u8,u16,u16)->void
;  16, "/mnt/d/F256/f256lib-oscar64/f256lib/f_sprite.h"
.s4:
147c : a5 1b __ LDA P0 ; (s + 0)
147e : 0a __ __ ASL
147f : 85 29 __ STA ACCU + 0 
1481 : a9 00 __ LDA #$00
1483 : 2a __ __ ROL
1484 : 06 29 __ ASL ACCU + 0 
1486 : 2a __ __ ROL
1487 : 06 29 __ ASL ACCU + 0 
1489 : 2a __ __ ROL
148a : 69 d9 __ ADC #$d9
148c : 85 2a __ STA ACCU + 1 
148e : a5 1c __ LDA P1 ; (x + 0)
1490 : a0 04 __ LDY #$04
1492 : 91 29 __ STA (ACCU + 0),y 
1494 : a5 1d __ LDA P2 ; (x + 1)
1496 : c8 __ __ INY
1497 : 91 29 __ STA (ACCU + 0),y 
1499 : a5 1e __ LDA P3 ; (y + 0)
149b : c8 __ __ INY
149c : 91 29 __ STA (ACCU + 0),y 
149e : a5 1f __ LDA P4 ; (y + 1)
14a0 : c8 __ __ INY
14a1 : 91 29 __ STA (ACCU + 0),y 
.s3:
14a3 : 60 __ __ RTS
--------------------------------------------------------------------
fpr_set_currentPath: ; fpr_set_currentPath(const u8*)->void
;  51, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/muFilePicker.h"
.s4:
14a4 : a0 00 __ LDY #$00
.l5:
14a6 : b1 20 __ LDA (P5),y ; (s + 0)
14a8 : 85 1f __ STA P4 
14aa : c8 __ __ INY
14ab : c8 __ __ INY
14ac : 84 39 __ STY T1 + 0 
14ae : 84 1b __ STY P0 
14b0 : a9 00 __ LDA #$00
14b2 : 85 1c __ STA P1 
14b4 : 85 1e __ STA P3 
14b6 : a9 03 __ LDA #$03
14b8 : 85 1d __ STA P2 
14ba : 20 cc 14 JSR $14cc ; (FAR_POKE.s4 + 0)
14bd : a5 1f __ LDA P4 
14bf : f0 0a __ BEQ $14cb ; (fpr_set_currentPath.s3 + 0)
.s6:
14c1 : 18 __ __ CLC
14c2 : a5 39 __ LDA T1 + 0 
14c4 : 69 ff __ ADC #$ff
14c6 : c9 3c __ CMP #$3c
14c8 : a8 __ __ TAY
14c9 : 90 db __ BCC $14a6 ; (fpr_set_currentPath.l5 + 0)
.s3:
14cb : 60 __ __ RTS
--------------------------------------------------------------------
FAR_POKE: ; FAR_POKE(u32,u8)->void
; 216, "/mnt/d/F256/f256lib-oscar64/f256lib/f256lib.h"
.s4:
14cc : a5 0f __ LDA $0f 
14ce : 85 38 __ STA T2 + 0 
14d0 : 78 __ __ SEI
14d1 : a5 1b __ LDA P0 ; (address + 0)
14d3 : 85 35 __ STA T0 + 0 
14d5 : a5 1c __ LDA P1 ; (address + 1)
14d7 : 85 37 __ STA T1 + 0 
14d9 : a5 1e __ LDA P3 ; (address + 3)
14db : a2 05 __ LDX #$05
.l5:
14dd : 4a __ __ LSR
14de : 66 1d __ ROR P2 ; (address + 2)
14e0 : 66 37 __ ROR T1 + 0 
14e2 : ca __ __ DEX
14e3 : d0 f8 __ BNE $14dd ; (FAR_POKE.l5 + 0)
.s6:
14e5 : a5 37 __ LDA T1 + 0 
14e7 : 85 0f __ STA $0f 
14e9 : a5 1c __ LDA P1 ; (address + 1)
14eb : 29 1f __ AND #$1f
14ed : 09 e0 __ ORA #$e0
14ef : 85 36 __ STA T0 + 1 
14f1 : a5 1f __ LDA P4 ; (value + 0)
14f3 : a0 00 __ LDY #$00
14f5 : 91 35 __ STA (T0 + 0),y 
14f7 : a5 38 __ LDA T2 + 0 
14f9 : 85 0f __ STA $0f 
14fb : 58 __ __ CLI
.s3:
14fc : 60 __ __ RTS
--------------------------------------------------------------------
14fd : __ __ __ BYT 2f 00                                           : /.
--------------------------------------------------------------------
textSetColor: ; textSetColor(u8,u8)->void
;  58, "/mnt/d/F256/f256lib-oscar64/f256lib/f_text.h"
.s4:
14ff : a5 1b __ LDA P0 ; (f + 0)
1501 : 0a __ __ ASL
1502 : 0a __ __ ASL
1503 : 0a __ __ ASL
1504 : 0a __ __ ASL
1505 : 18 __ __ CLC
1506 : 65 1c __ ADC P1 ; (b + 0)
1508 : 8d fe 63 STA $63fe ; (_ccolor + 0)
.s3:
150b : 60 __ __ RTS
--------------------------------------------------------------------
textPrint: ; textPrint(const u8*)->void
;  46, "/mnt/d/F256/f256lib-oscar64/f256lib/f_text.h"
.s4:
150c : ad ff 63 LDA $63ff ; (_MAX_COL + 0)
150f : 85 41 __ STA T10 + 0 
1511 : 85 3d __ STA T6 + 0 
1513 : 85 1b __ STA P0 
1515 : ad ff 67 LDA $67ff ; (_row + 0)
1518 : 85 1d __ STA P2 
151a : a9 00 __ LDA #$00
151c : 85 1c __ STA P1 
151e : 85 1e __ STA P3 
1520 : a5 01 __ LDA $01 
1522 : 85 42 __ STA T11 + 0 
1524 : 20 78 04 JSR $0478 ; (mathUnsignedMultiply.s4 + 0)
1527 : a9 00 __ LDA #$00
1529 : 85 1b __ STA P0 
152b : 85 1d __ STA P2 
152d : a5 29 __ LDA ACCU + 0 
152f : 85 1f __ STA P4 
1531 : a9 c0 __ LDA #$c0
1533 : 85 1c __ STA P1 
1535 : a5 2a __ LDA ACCU + 1 
1537 : 85 20 __ STA P5 
1539 : a5 2b __ LDA ACCU + 2 
153b : 85 21 __ STA P6 
153d : a5 2c __ LDA ACCU + 3 
153f : 85 22 __ STA P7 
1541 : 20 6a 13 JSR $136a ; (mathUnsignedAddition.s4 + 0)
1544 : a5 29 __ LDA ACCU + 0 
1546 : 85 35 __ STA T0 + 0 
1548 : a5 2a __ LDA ACCU + 1 
154a : 85 36 __ STA T0 + 1 
154c : a9 00 __ LDA #$00
154e : 85 3e __ STA T7 + 0 
1550 : 85 3f __ STA T7 + 1 
.l38:
1552 : a5 3e __ LDA T7 + 0 
1554 : 85 29 __ STA ACCU + 0 
1556 : 18 __ __ CLC
1557 : a5 24 __ LDA P9 ; (message + 1)
1559 : 65 3f __ ADC T7 + 1 
155b : 85 2a __ STA ACCU + 1 
155d : a4 23 __ LDY P8 ; (message + 0)
155f : b1 29 __ LDA (ACCU + 0),y 
1561 : d0 11 __ BNE $1574 ; (textPrint.s6 + 0)
.s5:
1563 : a5 42 __ LDA T11 + 0 
1565 : 85 01 __ STA $01 
1567 : ad fe 67 LDA $67fe ; (_col + 0)
156a : 85 1b __ STA P0 
156c : ad ff 67 LDA $67ff ; (_row + 0)
156f : 85 1c __ STA P1 
1571 : 4c 52 05 JMP $0552 ; (textGotoXY.s4 + 0)
.s6:
1574 : c9 0a __ CMP #$0a
1576 : f0 28 __ BEQ $15a0 ; (textPrint.s9 + 0)
.s7:
1578 : c9 0d __ CMP #$0d
157a : f0 24 __ BEQ $15a0 ; (textPrint.s9 + 0)
.s8:
157c : a9 03 __ LDA #$03
157e : 85 01 __ STA $01 
1580 : ad fe 67 LDA $67fe ; (_col + 0)
1583 : aa __ __ TAX
1584 : e8 __ __ INX
1585 : 8e fe 67 STX $67fe ; (_col + 0)
1588 : 85 37 __ STA T2 + 0 
158a : a8 __ __ TAY
158b : ad fe 63 LDA $63fe ; (_ccolor + 0)
158e : 91 35 __ STA (T0 + 0),y 
1590 : a9 02 __ LDA #$02
1592 : 85 01 __ STA $01 
1594 : a4 23 __ LDY P8 ; (message + 0)
1596 : b1 29 __ LDA (ACCU + 0),y 
1598 : a4 37 __ LDY T2 + 0 
159a : 91 35 __ STA (T0 + 0),y 
159c : e4 41 __ CPX T10 + 0 
159e : d0 1b __ BNE $15bb ; (textPrint.s11 + 0)
.s9:
15a0 : ee ff 67 INC $67ff ; (_row + 0)
15a3 : a9 00 __ LDA #$00
15a5 : 8d fe 67 STA $67fe ; (_col + 0)
15a8 : ad ff 67 LDA $67ff ; (_row + 0)
15ab : cd ff 64 CMP $64ff ; (_MAX_ROW + 0)
15ae : f0 14 __ BEQ $15c4 ; (textPrint.s12 + 0)
.s10:
15b0 : 18 __ __ CLC
15b1 : a5 35 __ LDA T0 + 0 
15b3 : 65 3d __ ADC T6 + 0 
15b5 : 85 35 __ STA T0 + 0 
15b7 : 90 02 __ BCC $15bb ; (textPrint.s11 + 0)
.s40:
15b9 : e6 36 __ INC T0 + 1 
.s11:
15bb : e6 3e __ INC T7 + 0 
15bd : d0 93 __ BNE $1552 ; (textPrint.l38 + 0)
.s39:
15bf : e6 3f __ INC T7 + 1 
15c1 : 4c 52 15 JMP $1552 ; (textPrint.l38 + 0)
.s12:
15c4 : 85 40 __ STA T8 + 0 
15c6 : ad ff 64 LDA $64ff ; (_MAX_ROW + 0)
15c9 : e9 01 __ SBC #$01
15cb : 85 35 __ STA T0 + 0 
15cd : 85 29 __ STA ACCU + 0 
15cf : a9 03 __ LDA #$03
15d1 : 85 01 __ STA $01 
15d3 : a9 00 __ LDA #$00
15d5 : e9 00 __ SBC #$00
15d7 : 85 36 __ STA T0 + 1 
15d9 : 85 2a __ STA ACCU + 1 
15db : a5 3d __ LDA T6 + 0 
15dd : 20 60 72 JSR $7260 ; (mul16by8 + 0)
15e0 : a5 2a __ LDA ACCU + 1 
15e2 : 10 0a __ BPL $15ee ; (textPrint.s15 + 0)
.s13:
15e4 : a9 00 __ LDA #$00
.s14:
15e6 : 85 2b __ STA ACCU + 2 
15e8 : a9 02 __ LDA #$02
15ea : 85 37 __ STA T2 + 0 
15ec : d0 08 __ BNE $15f6 ; (textPrint.l16 + 0)
.s15:
15ee : 05 29 __ ORA ACCU + 0 
15f0 : f0 f4 __ BEQ $15e6 ; (textPrint.s14 + 0)
.s29:
15f2 : a9 01 __ LDA #$01
15f4 : d0 f0 __ BNE $15e6 ; (textPrint.s14 + 0)
.l16:
15f6 : a9 00 __ LDA #$00
15f8 : 85 39 __ STA T3 + 0 
15fa : 85 3a __ STA T3 + 1 
15fc : a5 2b __ LDA ACCU + 2 
15fe : f0 29 __ BEQ $1629 ; (textPrint.s17 + 0)
.s22:
1600 : a2 00 __ LDX #$00
1602 : 86 3b __ STX T4 + 0 
1604 : a9 c0 __ LDA #$c0
1606 : 85 3c __ STA T4 + 1 
.l23:
1608 : a4 3d __ LDY T6 + 0 
160a : b1 3b __ LDA (T4 + 0),y 
160c : a0 00 __ LDY #$00
160e : 91 3b __ STA (T4 + 0),y 
1610 : e6 3b __ INC T4 + 0 
1612 : d0 02 __ BNE $1616 ; (textPrint.s31 + 0)
.s30:
1614 : e6 3c __ INC T4 + 1 
.s31:
1616 : e8 __ __ INX
1617 : d0 02 __ BNE $161b ; (textPrint.s33 + 0)
.s32:
1619 : e6 3a __ INC T3 + 1 
.s33:
161b : a5 3a __ LDA T3 + 1 
161d : c5 2a __ CMP ACCU + 1 
161f : 90 e7 __ BCC $1608 ; (textPrint.l23 + 0)
.s41:
1621 : d0 04 __ BNE $1627 ; (textPrint.s28 + 0)
.s24:
1623 : e4 29 __ CPX ACCU + 0 
1625 : 90 e1 __ BCC $1608 ; (textPrint.l23 + 0)
.s28:
1627 : 86 39 __ STX T3 + 0 
.s17:
1629 : a9 02 __ LDA #$02
162b : 85 01 __ STA $01 
162d : c6 37 __ DEC T2 + 0 
162f : d0 c5 __ BNE $15f6 ; (textPrint.l16 + 0)
.s18:
1631 : a9 03 __ LDA #$03
1633 : 85 01 __ STA $01 
1635 : a5 41 __ LDA T10 + 0 
1637 : d0 06 __ BNE $163f ; (textPrint.s21 + 0)
.s19:
1639 : a9 02 __ LDA #$02
163b : 85 01 __ STA $01 
163d : d0 3a __ BNE $1679 ; (textPrint.s20 + 0)
.s21:
163f : 18 __ __ CLC
1640 : a5 3a __ LDA T3 + 1 
1642 : 69 c0 __ ADC #$c0
1644 : 85 38 __ STA T2 + 1 
1646 : 85 3a __ STA T3 + 1 
1648 : ad fe 63 LDA $63fe ; (_ccolor + 0)
164b : 85 3b __ STA T4 + 0 
164d : a9 00 __ LDA #$00
164f : a4 39 __ LDY T3 + 0 
1651 : 84 37 __ STY T2 + 0 
1653 : 85 39 __ STA T3 + 0 
1655 : a6 3d __ LDX T6 + 0 
.l25:
1657 : a5 3b __ LDA T4 + 0 
1659 : 91 39 __ STA (T3 + 0),y 
165b : c8 __ __ INY
165c : d0 02 __ BNE $1660 ; (textPrint.s35 + 0)
.s34:
165e : e6 3a __ INC T3 + 1 
.s35:
1660 : ca __ __ DEX
1661 : d0 f4 __ BNE $1657 ; (textPrint.l25 + 0)
.s26:
1663 : a9 02 __ LDA #$02
1665 : 85 01 __ STA $01 
1667 : a4 37 __ LDY T2 + 0 
1669 : 86 37 __ STX T2 + 0 
166b : a6 3d __ LDX T6 + 0 
.l27:
166d : a9 20 __ LDA #$20
166f : 91 37 __ STA (T2 + 0),y 
1671 : c8 __ __ INY
1672 : d0 02 __ BNE $1676 ; (textPrint.s37 + 0)
.s36:
1674 : e6 38 __ INC T2 + 1 
.s37:
1676 : ca __ __ DEX
1677 : d0 f4 __ BNE $166d ; (textPrint.l27 + 0)
.s20:
1679 : a6 40 __ LDX T8 + 0 
167b : ca __ __ DEX
167c : 8e ff 67 STX $67ff ; (_row + 0)
167f : a5 36 __ LDA T0 + 1 
1681 : 85 20 __ STA P5 
1683 : 29 80 __ AND #$80
1685 : 10 02 __ BPL $1689 ; (textPrint.s20 + 16)
1687 : a9 ff __ LDA #$ff
1689 : 85 21 __ STA P6 
168b : 85 22 __ STA P7 
168d : a5 35 __ LDA T0 + 0 
168f : 85 1f __ STA P4 
1691 : 20 6a 13 JSR $136a ; (mathUnsignedAddition.s4 + 0)
1694 : a5 29 __ LDA ACCU + 0 
1696 : 85 35 __ STA T0 + 0 
1698 : a5 2a __ LDA ACCU + 1 
169a : 85 36 __ STA T0 + 1 
169c : 4c bb 15 JMP $15bb ; (textPrint.s11 + 0)
--------------------------------------------------------------------
169f : __ __ __ BYT 52 65 6d 6f 74 65 20 44 69 72 3a 00             : Remote Dir:.
--------------------------------------------------------------------
16ab : __ __ __ BYT 4c 6f 63 61 6c 20 44 69 72 3a 00                : Local Dir:.
--------------------------------------------------------------------
textFullClear: ; textFullClear()->void
; 180, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s4:
16b6 : a9 4f __ LDA #$4f
16b8 : 85 25 __ STA P10 
16ba : 20 cb 16 JSR $16cb ; (textSectionClear.s4 + 0)
16bd : a9 27 __ LDA #$27
16bf : 85 25 __ STA P10 
16c1 : 20 cb 16 JSR $16cb ; (textSectionClear.s4 + 0)
16c4 : a9 4e __ LDA #$4e
16c6 : 85 25 __ STA P10 
16c8 : 4c cb 16 JMP $16cb ; (textSectionClear.s4 + 0)
--------------------------------------------------------------------
textSectionClear: ; textSectionClear(u8)->void
;  27, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/textareas.h"
.s4:
16cb : a5 25 __ LDA P10 ; (endX + 0)
16cd : c9 4e __ CMP #$4e
16cf : d0 16 __ BNE $16e7 ; (textSectionClear.s5 + 0)
.s18:
16d1 : a2 02 __ LDX #$02
16d3 : 8e a7 79 STX $79a7 ; (cur_loc_y + 0)
16d6 : a0 28 __ LDY #$28
.s17:
16d8 : 84 43 __ STY T2 + 0 
16da : 85 44 __ STA T3 + 0 
16dc : a9 2c __ LDA #$2c
16de : a0 02 __ LDY #$02
.s20:
16e0 : 84 45 __ STY T4 + 0 
16e2 : 85 46 __ STA T5 + 0 
16e4 : 4c 06 17 JMP $1706 ; (textSectionClear.s7 + 0)
.s5:
16e7 : a9 00 __ LDA #$00
16e9 : 85 43 __ STA T2 + 0 
16eb : 85 45 __ STA T4 + 0 
16ed : 85 44 __ STA T3 + 0 
16ef : 85 46 __ STA T5 + 0 
16f1 : a5 25 __ LDA P10 ; (endX + 0)
16f3 : c9 4e __ CMP #$4e
16f5 : 90 5c __ BCC $1753 ; (textSectionClear.s13 + 0)
.s6:
16f7 : c9 4f __ CMP #$4f
16f9 : d0 0b __ BNE $1706 ; (textSectionClear.s7 + 0)
.s12:
16fb : 85 44 __ STA T3 + 0 
16fd : a9 3a __ LDA #$3a
16ff : a0 2c __ LDY #$2c
1701 : 8c a5 79 STY $79a5 ; (cur_cli_y + 0)
1704 : d0 da __ BNE $16e0 ; (textSectionClear.s20 + 0)
.s7:
1706 : a5 43 __ LDA T2 + 0 
1708 : 85 1b __ STA P0 
170a : a5 45 __ LDA T4 + 0 
170c : 85 1c __ STA P1 
170e : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
1711 : a5 1c __ LDA P1 
1713 : c5 46 __ CMP T5 + 0 
1715 : b0 3b __ BCS $1752 ; (textSectionClear.s3 + 0)
.s8:
1717 : a5 1b __ LDA P0 
1719 : c5 44 __ CMP T3 + 0 
171b : a9 00 __ LDA #$00
171d : 6a __ __ ROR
171e : 85 47 __ STA T6 + 0 
1720 : f0 17 __ BEQ $1739 ; (textSectionClear.l11 + 0)
.l9:
1722 : a5 43 __ LDA T2 + 0 
1724 : 85 1b __ STA P0 
1726 : a5 45 __ LDA T4 + 0 
1728 : 85 1c __ STA P1 
172a : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
172d : e6 45 __ INC T4 + 0 
172f : a5 45 __ LDA T4 + 0 
1731 : c5 46 __ CMP T5 + 0 
1733 : b0 1d __ BCS $1752 ; (textSectionClear.s3 + 0)
.s10:
1735 : 24 47 __ BIT T6 + 0 
1737 : 30 e9 __ BMI $1722 ; (textSectionClear.l9 + 0)
.l11:
1739 : a5 1b __ LDA P0 
173b : 85 48 __ STA T7 + 0 
173d : a9 74 __ LDA #$74
173f : 85 23 __ STA P8 
1741 : a9 17 __ LDA #$17
1743 : 85 24 __ STA P9 
.l19:
1745 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
1748 : e6 48 __ INC T7 + 0 
174a : a5 48 __ LDA T7 + 0 
174c : c5 44 __ CMP T3 + 0 
174e : 90 f5 __ BCC $1745 ; (textSectionClear.l19 + 0)
1750 : b0 d0 __ BCS $1722 ; (textSectionClear.l9 + 0)
.s3:
1752 : 60 __ __ RTS
.s13:
1753 : c9 27 __ CMP #$27
1755 : d0 0a __ BNE $1761 ; (textSectionClear.s14 + 0)
.s16:
1757 : a2 02 __ LDX #$02
1759 : 8e a6 79 STX $79a6 ; (cur_rem_y + 0)
175c : a0 01 __ LDY #$01
175e : 4c d8 16 JMP $16d8 ; (textSectionClear.s17 + 0)
.s14:
1761 : c9 43 __ CMP #$43
1763 : d0 a1 __ BNE $1706 ; (textSectionClear.s7 + 0)
.s15:
1765 : a9 02 __ LDA #$02
1767 : 85 43 __ STA T2 + 0 
1769 : a9 43 __ LDA #$43
176b : 85 44 __ STA T3 + 0 
176d : a9 17 __ LDA #$17
176f : a0 03 __ LDY #$03
1771 : 4c e0 16 JMP $16e0 ; (textSectionClear.s20 + 0)
--------------------------------------------------------------------
1774 : __ __ __ BYT 20 00                                           :  .
--------------------------------------------------------------------
initTextXY: ; initTextXY(u8)->void
; 187, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s4:
1776 : a5 1d __ LDA P2 ; (endX + 0)
1778 : c9 4e __ CMP #$4e
177a : d0 0c __ BNE $1788 ; (initTextXY.s5 + 0)
.s10:
177c : a9 28 __ LDA #$28
177e : 85 1b __ STA P0 
1780 : ad a7 79 LDA $79a7 ; (cur_loc_y + 0)
.s11:
1783 : 85 1c __ STA P1 
1785 : 4c 52 05 JMP $0552 ; (textGotoXY.s4 + 0)
.s5:
1788 : 90 0f __ BCC $1799 ; (initTextXY.s8 + 0)
.s6:
178a : c9 4f __ CMP #$4f
178c : d0 0a __ BNE $1798 ; (initTextXY.s3 + 0)
.s7:
178e : a9 00 __ LDA #$00
1790 : 85 1b __ STA P0 
1792 : ad a5 79 LDA $79a5 ; (cur_cli_y + 0)
1795 : 4c 83 17 JMP $1783 ; (initTextXY.s11 + 0)
.s3:
1798 : 60 __ __ RTS
.s8:
1799 : c9 27 __ CMP #$27
179b : d0 fb __ BNE $1798 ; (initTextXY.s3 + 0)
.s9:
179d : a9 01 __ LDA #$01
179f : 85 1b __ STA P0 
17a1 : ad a6 79 LDA $79a6 ; (cur_rem_y + 0)
17a4 : 4c 83 17 JMP $1783 ; (initTextXY.s11 + 0)
--------------------------------------------------------------------
17a7 : __ __ __ BYT 57 69 7a 46 69 33 36 30 20 46 54 50 20 63 6c 69 : WizFi360 FTP cli
17b7 : __ __ __ BYT 65 6e 74 00                                     : ent.
--------------------------------------------------------------------
textPrintNewLine: ; textPrintNewLine(u8,u8,u8,u8)->void
; 203, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s4:
17bb : a9 cb __ LDA #$cb
17bd : 85 1b __ STA P0 
17bf : a9 9f __ LDA #$9f
17c1 : 85 1e __ STA P3 
17c3 : a9 9f __ LDA #$9f
17c5 : 85 1c __ STA P1 
17c7 : a9 ca __ LDA #$ca
17c9 : 85 1d __ STA P2 
17cb : 20 39 18 JSR $1839 ; (textGetXY.s4 + 0)
17ce : ad ca 9f LDA $9fca ; (y + 0)
17d1 : cd cd 9f CMP $9fcd ; (sstack + 1)
17d4 : f0 06 __ BEQ $17dc ; (textPrintNewLine.s14 + 0)
.s5:
17d6 : 18 __ __ CLC
17d7 : 69 01 __ ADC #$01
17d9 : 4c df 17 JMP $17df ; (textPrintNewLine.s16 + 0)
.s14:
17dc : ad cc 9f LDA $9fcc ; (sstack + 0)
.s16:
17df : 85 1c __ STA P1 
17e1 : 8d ca 9f STA $9fca ; (y + 0)
17e4 : a5 25 __ LDA P10 ; (startX + 0)
17e6 : 85 1b __ STA P0 
17e8 : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
17eb : a5 26 __ LDA P11 ; (endX + 0)
17ed : 38 __ __ SEC
17ee : e5 25 __ SBC P10 ; (startX + 0)
17f0 : 85 43 __ STA T0 + 0 
17f2 : a9 00 __ LDA #$00
17f4 : e9 00 __ SBC #$00
17f6 : 05 43 __ ORA T0 + 0 
17f8 : f0 0f __ BEQ $1809 ; (textPrintNewLine.s6 + 0)
.s13:
17fa : a9 74 __ LDA #$74
17fc : 85 23 __ STA P8 
17fe : a9 17 __ LDA #$17
1800 : 85 24 __ STA P9 
.l15:
1802 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
1805 : c6 43 __ DEC T0 + 0 
1807 : d0 f9 __ BNE $1802 ; (textPrintNewLine.l15 + 0)
.s6:
1809 : a5 25 __ LDA P10 ; (startX + 0)
180b : 85 1b __ STA P0 
180d : ad ca 9f LDA $9fca ; (y + 0)
1810 : 85 44 __ STA T1 + 0 
1812 : 85 1c __ STA P1 
1814 : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
1817 : a5 26 __ LDA P11 ; (endX + 0)
1819 : c9 4e __ CMP #$4e
181b : d0 06 __ BNE $1823 ; (textPrintNewLine.s7 + 0)
.s12:
181d : a5 44 __ LDA T1 + 0 
181f : 8d a7 79 STA $79a7 ; (cur_loc_y + 0)
.s3:
1822 : 60 __ __ RTS
.s7:
1823 : b0 0a __ BCS $182f ; (textPrintNewLine.s8 + 0)
.s10:
1825 : c9 27 __ CMP #$27
1827 : d0 f9 __ BNE $1822 ; (textPrintNewLine.s3 + 0)
.s11:
1829 : a5 44 __ LDA T1 + 0 
182b : 8d a6 79 STA $79a6 ; (cur_rem_y + 0)
182e : 60 __ __ RTS
.s8:
182f : c9 4f __ CMP #$4f
1831 : d0 ef __ BNE $1822 ; (textPrintNewLine.s3 + 0)
.s9:
1833 : a5 44 __ LDA T1 + 0 
1835 : 8d a5 79 STA $79a5 ; (cur_cli_y + 0)
1838 : 60 __ __ RTS
--------------------------------------------------------------------
textGetXY: ; textGetXY(u8*,u8*)->void
;  44, "/mnt/d/F256/f256lib-oscar64/f256lib/f_text.h"
.s4:
1839 : ad fe 67 LDA $67fe ; (_col + 0)
183c : a0 00 __ LDY #$00
183e : 91 1b __ STA (P0),y ; (x + 0)
1840 : ad ff 67 LDA $67ff ; (_row + 0)
1843 : 91 1d __ STA (P2),y ; (y + 0)
.s3:
1845 : 60 __ __ RTS
--------------------------------------------------------------------
1846 : __ __ __ BYT 49 6e 69 74 69 61 6c 69 7a 69 6e 67 20 6d 6f 64 : Initializing mod
1856 : __ __ __ BYT 65 6d 2e 2e 2e 00                               : em....
--------------------------------------------------------------------
wiz_init: ; wiz_init()->bool
; 801, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s1:
185c : a5 55 __ LDA T1 + 0 
185e : 8d a2 9f STA $9fa2 ; (wiz_init@stack + 0)
.s4:
1861 : a9 14 __ LDA #$14
1863 : 85 1d __ STA P2 
1865 : a9 08 __ LDA #$08
1867 : 8d 80 dd STA $dd80 
186a : 20 2c 19 JSR $192c ; (lilpause.s4 + 0)
186d : a9 64 __ LDA #$64
186f : 85 1d __ STA P2 
1871 : a9 00 __ LDA #$00
1873 : 8d 80 dd STA $dd80 
1876 : 20 2c 19 JSR $192c ; (lilpause.s4 + 0)
1879 : ad 82 dd LDA $dd82 
187c : 0d 83 dd ORA $dd83 
187f : f0 0b __ BEQ $188c ; (wiz_init.s5 + 0)
.l12:
1881 : ad 81 dd LDA $dd81 
1884 : ad 82 dd LDA $dd82 
1887 : 0d 83 dd ORA $dd83 
188a : d0 f5 __ BNE $1881 ; (wiz_init.l12 + 0)
.s5:
188c : a9 05 __ LDA #$05
188e : 85 55 __ STA T1 + 0 
.l6:
1890 : a9 90 __ LDA #$90
1892 : 8d df 9f STA $9fdf ; (sstack + 19)
1895 : a9 01 __ LDA #$01
1897 : 8d e0 9f STA $9fe0 ; (sstack + 20)
189a : a9 5f __ LDA #$5f
189c : 8d dd 9f STA $9fdd ; (sstack + 17)
189f : a9 29 __ LDA #$29
18a1 : 8d de 9f STA $9fde ; (sstack + 18)
18a4 : 20 c5 19 JSR $19c5 ; (wiz_atcmd.s4 + 0)
18a7 : a5 29 __ LDA ACCU + 0 
18a9 : d0 15 __ BNE $18c0 ; (wiz_init.s9 + 0)
.s7:
18ab : a9 32 __ LDA #$32
18ad : 85 1d __ STA P2 
18af : 20 2c 19 JSR $192c ; (lilpause.s4 + 0)
18b2 : c6 55 __ DEC T1 + 0 
18b4 : d0 da __ BNE $1890 ; (wiz_init.l6 + 0)
.s8:
18b6 : a9 00 __ LDA #$00
.s3:
18b8 : 85 29 __ STA ACCU + 0 
18ba : ad a2 9f LDA $9fa2 ; (wiz_init@stack + 0)
18bd : 85 55 __ STA T1 + 0 
18bf : 60 __ __ RTS
.s9:
18c0 : a9 c8 __ LDA #$c8
18c2 : 8d df 9f STA $9fdf ; (sstack + 19)
18c5 : a9 00 __ LDA #$00
18c7 : 8d e0 9f STA $9fe0 ; (sstack + 20)
18ca : a9 62 __ LDA #$62
18cc : 8d dd 9f STA $9fdd ; (sstack + 17)
18cf : a9 29 __ LDA #$29
18d1 : 8d de 9f STA $9fde ; (sstack + 18)
18d4 : 20 c5 19 JSR $19c5 ; (wiz_atcmd.s4 + 0)
18d7 : a9 c8 __ LDA #$c8
18d9 : 8d df 9f STA $9fdf ; (sstack + 19)
18dc : a9 00 __ LDA #$00
18de : 8d e0 9f STA $9fe0 ; (sstack + 20)
18e1 : a9 67 __ LDA #$67
18e3 : 8d dd 9f STA $9fdd ; (sstack + 17)
18e6 : a9 29 __ LDA #$29
18e8 : 8d de 9f STA $9fde ; (sstack + 18)
18eb : 20 c5 19 JSR $19c5 ; (wiz_atcmd.s4 + 0)
18ee : a5 29 __ LDA ACCU + 0 
18f0 : f0 c4 __ BEQ $18b6 ; (wiz_init.s8 + 0)
.s10:
18f2 : a9 c8 __ LDA #$c8
18f4 : 8d df 9f STA $9fdf ; (sstack + 19)
18f7 : a9 00 __ LDA #$00
18f9 : 8d e0 9f STA $9fe0 ; (sstack + 20)
18fc : a9 73 __ LDA #$73
18fe : 8d dd 9f STA $9fdd ; (sstack + 17)
1901 : a9 29 __ LDA #$29
1903 : 8d de 9f STA $9fde ; (sstack + 18)
1906 : 20 c5 19 JSR $19c5 ; (wiz_atcmd.s4 + 0)
1909 : a5 29 __ LDA ACCU + 0 
190b : f0 a9 __ BEQ $18b6 ; (wiz_init.s8 + 0)
.s11:
190d : a9 c8 __ LDA #$c8
190f : 8d df 9f STA $9fdf ; (sstack + 19)
1912 : a9 00 __ LDA #$00
1914 : 8d e0 9f STA $9fe0 ; (sstack + 20)
1917 : a9 81 __ LDA #$81
1919 : 8d dd 9f STA $9fdd ; (sstack + 17)
191c : a9 29 __ LDA #$29
191e : 8d de 9f STA $9fde ; (sstack + 18)
1921 : 20 c5 19 JSR $19c5 ; (wiz_atcmd.s4 + 0)
1924 : a5 29 __ LDA ACCU + 0 
1926 : f0 90 __ BEQ $18b8 ; (wiz_init.s3 + 0)
.s13:
1928 : a9 01 __ LDA #$01
192a : d0 8c __ BNE $18b8 ; (wiz_init.s3 + 0)
--------------------------------------------------------------------
lilpause: ; lilpause(u8)->void
; 253, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s4:
192c : a9 00 __ LDA #$00
192e : 85 1b __ STA P0 
1930 : 8d c9 9f STA $9fc9 ; (pauseTimer.units + 0)
1933 : a9 d5 __ LDA #$d5
1935 : 8d cb 9f STA $9fcb ; (pauseTimer.cookie + 0)
1938 : 20 5e 19 JSR $195e ; (getTimerAbsolute.s4 + 0)
193b : 18 __ __ CLC
193c : 65 1d __ ADC P2 ; (timedelay + 0)
193e : 8d ca 9f STA $9fca ; (pauseTimer.absolute + 0)
1941 : a9 c9 __ LDA #$c9
1943 : 85 1b __ STA P0 
1945 : a9 9f __ LDA #$9f
1947 : 85 1c __ STA P1 
1949 : 20 91 19 JSR $1991 ; (setTimer.s4 + 0)
.l5:
194c : 20 b5 19 JSR $19b5 ; (kernelNextEvent.s4 + 0)
194f : ad 66 7a LDA $7a66 ; (kernelEventData.type + 0)
1952 : c9 52 __ CMP #$52
1954 : d0 f6 __ BNE $194c ; (lilpause.l5 + 0)
.s6:
1956 : ad 6a 7a LDA $7a6a ; (kernelEventData.u + 1)
1959 : c9 d5 __ CMP #$d5
195b : d0 ef __ BNE $194c ; (lilpause.l5 + 0)
.s3:
195d : 60 __ __ RTS
--------------------------------------------------------------------
getTimerAbsolute: ; getTimerAbsolute(u8)->u8
; 243, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s4:
195e : a5 1b __ LDA P0 ; (units + 0)
1960 : 09 80 __ ORA #$80
1962 : 85 f3 __ STA $f3 
1964 : a9 f0 __ LDA #$f0
1966 : 8d cb 7a STA $7acb ; (_kern_target + 0)
1969 : a9 ff __ LDA #$ff
196b : 8d cc 7a STA $7acc ; (_kern_target + 1)
196e : 4c 71 19 JMP $1971 ; (_kernelCallWrapper.s4 + 0)
--------------------------------------------------------------------
_kernelCallWrapper: ; _kernelCallWrapper()->u8
;  56, "/mnt/d/F256/f256lib-oscar64/f256lib/f_kernel.h"
.s4:
1971 : 20 79 19 JSR $1979 ; (_kernelCallRaw + 0)
1974 : 85 29 __ STA ACCU + 0 
.s3:
1976 : a5 29 __ LDA ACCU + 0 
1978 : 60 __ __ RTS
--------------------------------------------------------------------
_kernelCallRaw: ; _kernelCallRaw
1979 : ad cb 7a LDA $7acb ; (_kern_target + 0)
197c : 8d 86 19 STA $1986 ; (_kernelCallRaw + 13)
197f : ad cc 7a LDA $7acc ; (_kern_target + 1)
1982 : 8d 87 19 STA $1987 ; (_kernelCallRaw + 14)
1985 : 20 00 00 JSR $0000 
1988 : aa __ __ TAX
1989 : a9 00 __ LDA #$00
198b : 6a __ __ ROR
198c : 8d cd 7a STA $7acd ; (_kernelError + 0)
198f : 8a __ __ TXA
1990 : 60 __ __ RTS
--------------------------------------------------------------------
setTimer: ; setTimer(const struct timer_t*)->bool
; 229, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s4:
1991 : a9 f0 __ LDA #$f0
1993 : 8d cb 7a STA $7acb ; (_kern_target + 0)
1996 : a9 ff __ LDA #$ff
1998 : 8d cc 7a STA $7acc ; (_kern_target + 1)
199b : a0 00 __ LDY #$00
199d : b1 1b __ LDA (P0),y ; (timer + 0)
199f : 85 f3 __ STA $f3 
19a1 : c8 __ __ INY
19a2 : b1 1b __ LDA (P0),y ; (timer + 0)
19a4 : 85 f4 __ STA $f4 
19a6 : c8 __ __ INY
19a7 : b1 1b __ LDA (P0),y ; (timer + 0)
19a9 : 85 f5 __ STA $f5 
19ab : 20 71 19 JSR $1971 ; (_kernelCallWrapper.s4 + 0)
19ae : a9 00 __ LDA #$00
19b0 : cd cd 7a CMP $7acd ; (_kernelError + 0)
19b3 : 2a __ __ ROL
.s3:
19b4 : 60 __ __ RTS
--------------------------------------------------------------------
kernelNextEvent: ; kernelNextEvent()->u8
;  66, "/mnt/d/F256/f256lib-oscar64/f256lib/f_kernel.h"
.s4:
19b5 : a9 00 __ LDA #$00
19b7 : 8d cb 7a STA $7acb ; (_kern_target + 0)
19ba : 8d 66 7a STA $7a66 ; (kernelEventData.type + 0)
19bd : a9 ff __ LDA #$ff
19bf : 8d cc 7a STA $7acc ; (_kern_target + 1)
19c2 : 4c 71 19 JMP $1971 ; (_kernelCallWrapper.s4 + 0)
--------------------------------------------------------------------
wiz_atcmd: ; wiz_atcmd(const u8*,u16)->bool
; 792, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s4:
19c5 : a9 00 __ LDA #$00
19c7 : 8d 00 7b STA $7b00 ; (at_resp_line[0] + 0)
19ca : 8d a9 79 STA $79a9 ; (at_error + 0)
19cd : 8d a8 79 STA $79a8 ; (at_ok + 0)
19d0 : ad dd 9f LDA $9fdd ; (sstack + 17)
19d3 : 85 1c __ STA P1 
19d5 : ad de 9f LDA $9fde ; (sstack + 18)
19d8 : 85 1d __ STA P2 
19da : 20 f7 19 JSR $19f7 ; (uart_puts.s4 + 0)
19dd : a9 37 __ LDA #$37
19df : 85 1c __ STA P1 
19e1 : a9 1a __ LDA #$1a
19e3 : 85 1d __ STA P2 
19e5 : 20 f7 19 JSR $19f7 ; (uart_puts.s4 + 0)
19e8 : ad df 9f LDA $9fdf ; (sstack + 19)
19eb : 8d db 9f STA $9fdb ; (sstack + 15)
19ee : ad e0 9f LDA $9fe0 ; (sstack + 20)
19f1 : 8d dc 9f STA $9fdc ; (sstack + 16)
19f4 : 4c 3a 1a JMP $1a3a ; (wiz_wait_atok.s1 + 0)
--------------------------------------------------------------------
uart_puts: ; uart_puts(const u8*)->void
; 290, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s4:
19f7 : a0 00 __ LDY #$00
19f9 : b1 1c __ LDA (P1),y ; (s + 0)
19fb : f0 20 __ BEQ $1a1d ; (uart_puts.s3 + 0)
.l5:
19fd : a0 00 __ LDY #$00
19ff : b1 1c __ LDA (P1),y ; (s + 0)
1a01 : aa __ __ TAX
1a02 : a5 1c __ LDA P1 ; (s + 0)
1a04 : 85 35 __ STA T1 + 0 
1a06 : 18 __ __ CLC
1a07 : 69 01 __ ADC #$01
1a09 : 85 1c __ STA P1 ; (s + 0)
1a0b : a5 1d __ LDA P2 ; (s + 1)
1a0d : 85 36 __ STA T1 + 1 
1a0f : 69 00 __ ADC #$00
1a11 : 85 1d __ STA P2 ; (s + 1)
1a13 : 8a __ __ TXA
1a14 : 20 1e 1a JSR $1a1e ; (uart_putc.s4 + 0)
1a17 : a0 01 __ LDY #$01
1a19 : b1 35 __ LDA (T1 + 0),y 
1a1b : d0 e0 __ BNE $19fd ; (uart_puts.l5 + 0)
.s3:
1a1d : 60 __ __ RTS
--------------------------------------------------------------------
uart_putc: ; uart_putc(u8)->void
; 280, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s4:
1a1e : a8 __ __ TAY
.l5:
1a1f : ad 84 dd LDA $dd84 
1a22 : 85 29 __ STA ACCU + 0 
1a24 : a9 07 __ LDA #$07
1a26 : cd 85 dd CMP $dd85 
1a29 : 90 f4 __ BCC $1a1f ; (uart_putc.l5 + 0)
.s8:
1a2b : d0 06 __ BNE $1a33 ; (uart_putc.s6 + 0)
.s7:
1a2d : a9 6c __ LDA #$6c
1a2f : c5 29 __ CMP ACCU + 0 
1a31 : 90 ec __ BCC $1a1f ; (uart_putc.l5 + 0)
.s6:
1a33 : 8c 81 dd STY $dd81 
.s3:
1a36 : 60 __ __ RTS
--------------------------------------------------------------------
1a37 : __ __ __ BYT 0d 0a 00                                        : ...
--------------------------------------------------------------------
wiz_wait_atok: ; wiz_wait_atok(u16)->bool
; 762, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s1:
1a3a : a2 03 __ LDX #$03
1a3c : b5 55 __ LDA T0 + 0,x 
1a3e : 9d a3 9f STA $9fa3,x ; (wiz_wait_atok@stack + 0)
1a41 : ca __ __ DEX
1a42 : 10 f8 __ BPL $1a3c ; (wiz_wait_atok.s1 + 2)
.s4:
1a44 : ad dc 9f LDA $9fdc ; (sstack + 16)
1a47 : 85 56 __ STA T0 + 1 
1a49 : ad db 9f LDA $9fdb ; (sstack + 15)
1a4c : 85 55 __ STA T0 + 0 
1a4e : 05 56 __ ORA T0 + 1 
1a50 : f0 3c __ BEQ $1a8e ; (wiz_wait_atok.s5 + 0)
.s6:
1a52 : 20 9d 1a JSR $1a9d ; (wiz_poll_any.s4 + 0)
1a55 : a8 __ __ TAY
1a56 : ad a8 79 LDA $79a8 ; (at_ok + 0)
1a59 : d0 35 __ BNE $1a90 ; (wiz_wait_atok.s3 + 0)
.s7:
1a5b : 85 57 __ STA T1 + 0 
1a5d : 85 58 __ STA T1 + 1 
1a5f : ad a9 79 LDA $79a9 ; (at_error + 0)
1a62 : d0 2a __ BNE $1a8e ; (wiz_wait_atok.s5 + 0)
.l9:
1a64 : 98 __ __ TYA
1a65 : d0 0d __ BNE $1a74 ; (wiz_wait_atok.s11 + 0)
.s10:
1a67 : a9 01 __ LDA #$01
1a69 : 85 1d __ STA P2 
1a6b : 20 2c 19 JSR $192c ; (lilpause.s4 + 0)
1a6e : e6 57 __ INC T1 + 0 
1a70 : d0 02 __ BNE $1a74 ; (wiz_wait_atok.s11 + 0)
.s15:
1a72 : e6 58 __ INC T1 + 1 
.s11:
1a74 : a5 58 __ LDA T1 + 1 
1a76 : c5 56 __ CMP T0 + 1 
1a78 : d0 04 __ BNE $1a7e ; (wiz_wait_atok.s14 + 0)
.s13:
1a7a : a5 57 __ LDA T1 + 0 
1a7c : c5 55 __ CMP T0 + 0 
.s14:
1a7e : b0 0e __ BCS $1a8e ; (wiz_wait_atok.s5 + 0)
.s12:
1a80 : 20 9d 1a JSR $1a9d ; (wiz_poll_any.s4 + 0)
1a83 : a8 __ __ TAY
1a84 : ad a8 79 LDA $79a8 ; (at_ok + 0)
1a87 : d0 07 __ BNE $1a90 ; (wiz_wait_atok.s3 + 0)
.s8:
1a89 : ad a9 79 LDA $79a9 ; (at_error + 0)
1a8c : f0 d6 __ BEQ $1a64 ; (wiz_wait_atok.l9 + 0)
.s5:
1a8e : a9 00 __ LDA #$00
.s3:
1a90 : 85 29 __ STA ACCU + 0 
1a92 : a2 03 __ LDX #$03
1a94 : bd a3 9f LDA $9fa3,x ; (wiz_wait_atok@stack + 0)
1a97 : 95 55 __ STA T0 + 0,x 
1a99 : ca __ __ DEX
1a9a : 10 f8 __ BPL $1a94 ; (wiz_wait_atok.s3 + 4)
1a9c : 60 __ __ RTS
--------------------------------------------------------------------
wiz_poll_any: ; wiz_poll_any()->bool
; 469, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s4:
1a9d : ad 82 dd LDA $dd82 
1aa0 : 0d 83 dd ORA $dd83 
1aa3 : f0 13 __ BEQ $1ab8 ; (wiz_poll_any.s3 + 0)
.l6:
1aa5 : ad 81 dd LDA $dd81 
1aa8 : 8d da 9f STA $9fda ; (sstack + 14)
1aab : 20 b9 1a JSR $1ab9 ; (wiz_rx_byte.s1 + 0)
1aae : ad 82 dd LDA $dd82 
1ab1 : 0d 83 dd ORA $dd83 
1ab4 : d0 ef __ BNE $1aa5 ; (wiz_poll_any.l6 + 0)
.s5:
1ab6 : a9 01 __ LDA #$01
.s3:
1ab8 : 60 __ __ RTS
--------------------------------------------------------------------
wiz_rx_byte: ; wiz_rx_byte(u8)->void
; 407, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s1:
1ab9 : a5 55 __ LDA T4 + 0 
1abb : 8d a7 9f STA $9fa7 ; (wiz_rx_byte@stack + 0)
.s4:
1abe : ad aa 79 LDA $79aa ; (rxstate + 0)
1ac1 : c9 01 __ CMP #$01
1ac3 : d0 03 __ BNE $1ac8 ; (wiz_rx_byte.s5 + 0)
1ac5 : 4c 4f 1b JMP $1b4f ; (wiz_rx_byte.s19 + 0)
.s5:
1ac8 : aa __ __ TAX
1ac9 : f0 30 __ BEQ $1afb ; (wiz_rx_byte.s9 + 0)
.s6:
1acb : c9 02 __ CMP #$02
1acd : d0 26 __ BNE $1af5 ; (wiz_rx_byte.s3 + 0)
.s7:
1acf : ad af 79 LDA $79af ; (ipd_link + 0)
1ad2 : 8d d8 9f STA $9fd8 ; (sstack + 12)
1ad5 : ad da 9f LDA $9fda ; (sstack + 14)
1ad8 : 8d d9 9f STA $9fd9 ; (sstack + 13)
1adb : 20 22 22 JSR $2222 ; (handle_data_byte.s4 + 0)
1ade : ad b0 79 LDA $79b0 ; (ipd_remaining + 0)
1ae1 : d0 03 __ BNE $1ae6 ; (wiz_rx_byte.s37 + 0)
.s36:
1ae3 : ce b1 79 DEC $79b1 ; (ipd_remaining + 1)
.s37:
1ae6 : ce b0 79 DEC $79b0 ; (ipd_remaining + 0)
1ae9 : d0 0a __ BNE $1af5 ; (wiz_rx_byte.s3 + 0)
.s38:
1aeb : ad b1 79 LDA $79b1 ; (ipd_remaining + 1)
1aee : d0 05 __ BNE $1af5 ; (wiz_rx_byte.s3 + 0)
.s8:
1af0 : a9 00 __ LDA #$00
.s34:
1af2 : 8d aa 79 STA $79aa ; (rxstate + 0)
.s3:
1af5 : ad a7 9f LDA $9fa7 ; (wiz_rx_byte@stack + 0)
1af8 : 85 55 __ STA T4 + 0 
1afa : 60 __ __ RTS
.s9:
1afb : ad ab 79 LDA $79ab ; (linelen + 0)
1afe : d0 16 __ BNE $1b16 ; (wiz_rx_byte.s11 + 0)
.s10:
1b00 : ad da 9f LDA $9fda ; (sstack + 14)
1b03 : c9 2b __ CMP #$2b
1b05 : d0 0f __ BNE $1b16 ; (wiz_rx_byte.s11 + 0)
.s18:
1b07 : a9 01 __ LDA #$01
1b09 : 8d aa 79 STA $79aa ; (rxstate + 0)
1b0c : 8d ac 79 STA $79ac ; (ipd_hdr_len + 0)
1b0f : a9 2b __ LDA #$2b
1b11 : 8d ce 7a STA $7ace ; (ipd_hdr[0] + 0)
1b14 : d0 df __ BNE $1af5 ; (wiz_rx_byte.s3 + 0)
.s11:
1b16 : ad da 9f LDA $9fda ; (sstack + 14)
1b19 : c9 0a __ CMP #$0a
1b1b : f0 13 __ BEQ $1b30 ; (wiz_rx_byte.s15 + 0)
.s12:
1b1d : c9 0d __ CMP #$0d
1b1f : f0 d4 __ BEQ $1af5 ; (wiz_rx_byte.s3 + 0)
.s13:
1b21 : ae ab 79 LDX $79ab ; (linelen + 0)
1b24 : e0 7f __ CPX #$7f
1b26 : b0 cd __ BCS $1af5 ; (wiz_rx_byte.s3 + 0)
.s14:
1b28 : ee ab 79 INC $79ab ; (linelen + 0)
1b2b : 9d 80 7b STA $7b80,x ; (linebuf[0] + 0)
1b2e : 90 c5 __ BCC $1af5 ; (wiz_rx_byte.s3 + 0)
.s15:
1b30 : a9 00 __ LDA #$00
1b32 : ae ab 79 LDX $79ab ; (linelen + 0)
1b35 : 9d 80 7b STA $7b80,x ; (linebuf[0] + 0)
1b38 : 8a __ __ TXA
1b39 : f0 0d __ BEQ $1b48 ; (wiz_rx_byte.s16 + 0)
.s17:
1b3b : a9 80 __ LDA #$80
1b3d : 8d ce 9f STA $9fce ; (sstack + 2)
1b40 : a9 7b __ LDA #$7b
1b42 : 8d cf 9f STA $9fcf ; (sstack + 3)
1b45 : 20 7c 1c JSR $1c7c ; (handle_line.s4 + 0)
.s16:
1b48 : a9 00 __ LDA #$00
1b4a : 8d ab 79 STA $79ab ; (linelen + 0)
1b4d : f0 a6 __ BEQ $1af5 ; (wiz_rx_byte.s3 + 0)
.s19:
1b4f : ad da 9f LDA $9fda ; (sstack + 14)
1b52 : 85 39 __ STA T1 + 0 
1b54 : ad ac 79 LDA $79ac ; (ipd_hdr_len + 0)
1b57 : c9 13 __ CMP #$13
1b59 : b0 0d __ BCS $1b68 ; (wiz_rx_byte.s20 + 0)
.s33:
1b5b : aa __ __ TAX
1b5c : 69 01 __ ADC #$01
1b5e : 85 3a __ STA T2 + 0 
1b60 : 8d ac 79 STA $79ac ; (ipd_hdr_len + 0)
1b63 : a5 39 __ LDA T1 + 0 
1b65 : 9d ce 7a STA $7ace,x ; (ipd_hdr[0] + 0)
.s20:
1b68 : ad ac 79 LDA $79ac ; (ipd_hdr_len + 0)
1b6b : 85 55 __ STA T4 + 0 
1b6d : a5 39 __ LDA T1 + 0 
1b6f : c9 3a __ CMP #$3a
1b71 : f0 33 __ BEQ $1ba6 ; (wiz_rx_byte.s25 + 0)
.s21:
1b73 : a5 55 __ LDA T4 + 0 
1b75 : c9 13 __ CMP #$13
1b77 : b0 03 __ BCS $1b7c ; (wiz_rx_byte.s22 + 0)
1b79 : 4c f5 1a JMP $1af5 ; (wiz_rx_byte.s3 + 0)
.s22:
1b7c : a9 00 __ LDA #$00
1b7e : 8d ab 79 STA $79ab ; (linelen + 0)
1b81 : 85 39 __ STA T1 + 0 
.l23:
1b83 : ad ab 79 LDA $79ab ; (linelen + 0)
1b86 : c9 7f __ CMP #$7f
1b88 : 90 03 __ BCC $1b8d ; (wiz_rx_byte.s24 + 0)
1b8a : 4c f0 1a JMP $1af0 ; (wiz_rx_byte.s8 + 0)
.s24:
1b8d : a8 __ __ TAY
1b8e : 69 01 __ ADC #$01
1b90 : 8d ab 79 STA $79ab ; (linelen + 0)
1b93 : a6 39 __ LDX T1 + 0 
1b95 : bd ce 7a LDA $7ace,x ; (ipd_hdr[0] + 0)
1b98 : 99 80 7b STA $7b80,y ; (linebuf[0] + 0)
1b9b : e6 39 __ INC T1 + 0 
1b9d : a5 39 __ LDA T1 + 0 
1b9f : c5 55 __ CMP T4 + 0 
1ba1 : 90 e0 __ BCC $1b83 ; (wiz_rx_byte.l23 + 0)
1ba3 : 4c f0 1a JMP $1af0 ; (wiz_rx_byte.s8 + 0)
.s25:
1ba6 : a9 00 __ LDA #$00
1ba8 : a6 55 __ LDX T4 + 0 
1baa : 9d ce 7a STA $7ace,x ; (ipd_hdr[0] + 0)
1bad : a9 b0 __ LDA #$b0
1baf : 85 35 __ STA T0 + 0 ; (c + 0)
1bb1 : 85 25 __ STA P10 
1bb3 : a9 ce __ LDA #$ce
1bb5 : 85 21 __ STA P6 
1bb7 : a9 7a __ LDA #$7a
1bb9 : 85 22 __ STA P7 
1bbb : a9 af __ LDA #$af
1bbd : 85 23 __ STA P8 
1bbf : a9 79 __ LDA #$79
1bc1 : 85 24 __ STA P9 
1bc3 : a9 79 __ LDA #$79
1bc5 : 85 36 __ STA T0 + 1 
1bc7 : 85 26 __ STA P11 
1bc9 : 20 65 1f JSR $1f65 ; (parse_ipd_header.s4 + 0)
1bcc : a5 29 __ LDA ACCU + 0 
1bce : d0 2b __ BNE $1bfb ; (wiz_rx_byte.s30 + 0)
.s26:
1bd0 : 8d ab 79 STA $79ab ; (linelen + 0)
1bd3 : a5 55 __ LDA T4 + 0 
1bd5 : f0 cc __ BEQ $1ba3 ; (wiz_rx_byte.s24 + 22)
.s27:
1bd7 : a9 00 __ LDA #$00
1bd9 : 85 39 __ STA T1 + 0 
.l28:
1bdb : ad ab 79 LDA $79ab ; (linelen + 0)
1bde : c9 7f __ CMP #$7f
1be0 : b0 c1 __ BCS $1ba3 ; (wiz_rx_byte.s24 + 22)
.s29:
1be2 : a8 __ __ TAY
1be3 : 69 01 __ ADC #$01
1be5 : 8d ab 79 STA $79ab ; (linelen + 0)
1be8 : a6 39 __ LDX T1 + 0 
1bea : bd ce 7a LDA $7ace,x ; (ipd_hdr[0] + 0)
1bed : 99 80 7b STA $7b80,y ; (linebuf[0] + 0)
1bf0 : e6 39 __ INC T1 + 0 
1bf2 : a5 39 __ LDA T1 + 0 
1bf4 : c5 55 __ CMP T4 + 0 
1bf6 : 90 e3 __ BCC $1bdb ; (wiz_rx_byte.l28 + 0)
1bf8 : 4c f0 1a JMP $1af0 ; (wiz_rx_byte.s8 + 0)
.s30:
1bfb : ad ad 79 LDA $79ad ; (debug_mode + 0)
1bfe : d0 10 __ BNE $1c10 ; (wiz_rx_byte.s32 + 0)
.s31:
1c00 : ad b0 79 LDA $79b0 ; (ipd_remaining + 0)
1c03 : 0d b1 79 ORA $79b1 ; (ipd_remaining + 1)
1c06 : d0 03 __ BNE $1c0b ; (wiz_rx_byte.s35 + 0)
1c08 : 4c f2 1a JMP $1af2 ; (wiz_rx_byte.s34 + 0)
.s35:
1c0b : a9 02 __ LDA #$02
1c0d : 4c f2 1a JMP $1af2 ; (wiz_rx_byte.s34 + 0)
.s32:
1c10 : a9 74 __ LDA #$74
1c12 : 85 23 __ STA P8 
1c14 : a9 20 __ LDA #$20
1c16 : 85 24 __ STA P9 
1c18 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
1c1b : ad af 79 LDA $79af ; (ipd_link + 0)
1c1e : 8d cc 9f STA $9fcc ; (sstack + 0)
1c21 : a9 00 __ LDA #$00
1c23 : 8d cd 9f STA $9fcd ; (sstack + 1)
1c26 : 8d ce 9f STA $9fce ; (sstack + 2)
1c29 : 8d cf 9f STA $9fcf ; (sstack + 3)
1c2c : 20 7f 20 JSR $207f ; (textPrintInt.s1 + 0)
1c2f : a9 1a __ LDA #$1a
1c31 : 85 23 __ STA P8 
1c33 : a9 22 __ LDA #$22
1c35 : 85 24 __ STA P9 
1c37 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
1c3a : ad b0 79 LDA $79b0 ; (ipd_remaining + 0)
1c3d : 8d cc 9f STA $9fcc ; (sstack + 0)
1c40 : ad b1 79 LDA $79b1 ; (ipd_remaining + 1)
1c43 : 8d cd 9f STA $9fcd ; (sstack + 1)
1c46 : a9 00 __ LDA #$00
1c48 : 85 37 __ STA T0 + 2 
1c4a : 85 38 __ STA T0 + 3 
1c4c : 8d ce 9f STA $9fce ; (sstack + 2)
1c4f : 8d cf 9f STA $9fcf ; (sstack + 3)
1c52 : 20 7f 20 JSR $207f ; (textPrintInt.s1 + 0)
1c55 : a9 20 __ LDA #$20
1c57 : 85 35 __ STA T0 + 0 ; (c + 0)
1c59 : 85 23 __ STA P8 
1c5b : a9 22 __ LDA #$22
1c5d : 85 36 __ STA T0 + 1 
1c5f : 85 24 __ STA P9 
1c61 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
1c64 : a9 00 __ LDA #$00
1c66 : 85 25 __ STA P10 
1c68 : a9 2c __ LDA #$2c
1c6a : 8d cc 9f STA $9fcc ; (sstack + 0)
1c6d : a9 4f __ LDA #$4f
1c6f : 85 26 __ STA P11 
1c71 : a9 3a __ LDA #$3a
1c73 : 8d cd 9f STA $9fcd ; (sstack + 1)
1c76 : 20 bb 17 JSR $17bb ; (textPrintNewLine.s4 + 0)
1c79 : 4c 00 1c JMP $1c00 ; (wiz_rx_byte.s31 + 0)
--------------------------------------------------------------------
handle_line: ; handle_line(u8*)->void
; 360, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s4:
1c7c : ad ad 79 LDA $79ad ; (debug_mode + 0)
1c7f : f0 31 __ BEQ $1cb2 ; (handle_line.s5 + 0)
.s18:
1c81 : a9 bf __ LDA #$bf
1c83 : 85 35 __ STA T0 + 0 
1c85 : 85 23 __ STA P8 
1c87 : a9 1d __ LDA #$1d
1c89 : 85 36 __ STA T0 + 1 
1c8b : 85 24 __ STA P9 
1c8d : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
1c90 : ad ce 9f LDA $9fce ; (sstack + 2)
1c93 : 85 23 __ STA P8 
1c95 : ad cf 9f LDA $9fcf ; (sstack + 3)
1c98 : 85 24 __ STA P9 
1c9a : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
1c9d : a9 00 __ LDA #$00
1c9f : 85 25 __ STA P10 
1ca1 : a9 2c __ LDA #$2c
1ca3 : 8d cc 9f STA $9fcc ; (sstack + 0)
1ca6 : a9 4f __ LDA #$4f
1ca8 : 85 26 __ STA P11 
1caa : a9 3a __ LDA #$3a
1cac : 8d cd 9f STA $9fcd ; (sstack + 1)
1caf : 20 bb 17 JSR $17bb ; (textPrintNewLine.s4 + 0)
.s5:
1cb2 : ad ce 9f LDA $9fce ; (sstack + 2)
1cb5 : 85 45 __ STA T1 + 0 
1cb7 : 85 1b __ STA P0 
1cb9 : ad cf 9f LDA $9fcf ; (sstack + 3)
1cbc : 85 46 __ STA T1 + 1 
1cbe : 85 1c __ STA P1 
1cc0 : a9 f0 __ LDA #$f0
1cc2 : 85 1d __ STA P2 
1cc4 : a9 1d __ LDA #$1d
1cc6 : 85 1e __ STA P3 
1cc8 : 20 c3 1d JSR $1dc3 ; (strcmp.s4 + 0)
1ccb : aa __ __ TAX
1ccc : f0 16 __ BEQ $1ce4 ; (handle_line.s6 + 0)
.s7:
1cce : a5 45 __ LDA T1 + 0 
1cd0 : 85 1b __ STA P0 
1cd2 : a5 46 __ LDA T1 + 1 
1cd4 : 85 1c __ STA P1 
1cd6 : a9 f3 __ LDA #$f3
1cd8 : 85 1d __ STA P2 
1cda : a9 1d __ LDA #$1d
1cdc : 85 1e __ STA P3 
1cde : 20 c3 1d JSR $1dc3 ; (strcmp.s4 + 0)
1ce1 : aa __ __ TAX
1ce2 : d0 06 __ BNE $1cea ; (handle_line.s8 + 0)
.s6:
1ce4 : a9 01 __ LDA #$01
1ce6 : 8d a8 79 STA $79a8 ; (at_ok + 0)
.s3:
1ce9 : 60 __ __ RTS
.s8:
1cea : a5 45 __ LDA T1 + 0 
1cec : 85 1b __ STA P0 
1cee : a5 46 __ LDA T1 + 1 
1cf0 : 85 1c __ STA P1 
1cf2 : a9 00 __ LDA #$00
1cf4 : 85 1d __ STA P2 
1cf6 : a9 1e __ LDA #$1e
1cf8 : 85 1e __ STA P3 
1cfa : 20 c3 1d JSR $1dc3 ; (strcmp.s4 + 0)
1cfd : aa __ __ TAX
1cfe : f0 16 __ BEQ $1d16 ; (handle_line.s9 + 0)
.s10:
1d00 : a5 45 __ LDA T1 + 0 
1d02 : 85 1b __ STA P0 
1d04 : a5 46 __ LDA T1 + 1 
1d06 : 85 1c __ STA P1 
1d08 : a9 fb __ LDA #$fb
1d0a : 85 1d __ STA P2 
1d0c : a9 1d __ LDA #$1d
1d0e : 85 1e __ STA P3 
1d10 : 20 c3 1d JSR $1dc3 ; (strcmp.s4 + 0)
1d13 : aa __ __ TAX
1d14 : d0 06 __ BNE $1d1c ; (handle_line.s11 + 0)
.s9:
1d16 : a9 01 __ LDA #$01
1d18 : 8d a9 79 STA $79a9 ; (at_error + 0)
1d1b : 60 __ __ RTS
.s11:
1d1c : a5 45 __ LDA T1 + 0 
1d1e : 85 1b __ STA P0 
1d20 : a5 46 __ LDA T1 + 1 
1d22 : 85 1c __ STA P1 
1d24 : a9 79 __ LDA #$79
1d26 : 85 1d __ STA P2 
1d28 : a9 1e __ LDA #$1e
1d2a : 85 1e __ STA P3 
1d2c : 20 06 1e JSR $1e06 ; (strstr.s4 + 0)
1d2f : a5 29 __ LDA ACCU + 0 ; (line + 0)
1d31 : 05 2a __ ORA ACCU + 1 ; (line + 1)
1d33 : f0 0e __ BEQ $1d43 ; (handle_line.s12 + 0)
.s16:
1d35 : a0 00 __ LDY #$00
1d37 : b1 45 __ LDA (T1 + 0),y 
1d39 : c9 31 __ CMP #$31
1d3b : d0 ac __ BNE $1ce9 ; (handle_line.s3 + 0)
.s17:
1d3d : a9 01 __ LDA #$01
1d3f : 8d ae 79 STA $79ae ; (data_closed + 0)
1d42 : 60 __ __ RTS
.s12:
1d43 : a5 45 __ LDA T1 + 0 
1d45 : 85 1b __ STA P0 
1d47 : a5 46 __ LDA T1 + 1 
1d49 : 85 1c __ STA P1 
1d4b : a9 81 __ LDA #$81
1d4d : 85 1d __ STA P2 
1d4f : a9 1e __ LDA #$1e
1d51 : 85 1e __ STA P3 
1d53 : 20 06 1e JSR $1e06 ; (strstr.s4 + 0)
1d56 : a5 29 __ LDA ACCU + 0 ; (line + 0)
1d58 : 05 2a __ ORA ACCU + 1 ; (line + 1)
1d5a : d0 8d __ BNE $1ce9 ; (handle_line.s3 + 0)
.s13:
1d5c : a5 45 __ LDA T1 + 0 
1d5e : 85 1b __ STA P0 
1d60 : a5 46 __ LDA T1 + 1 
1d62 : 85 1c __ STA P1 
1d64 : a9 1e __ LDA #$1e
1d66 : 85 36 __ STA T0 + 1 
1d68 : 85 1e __ STA P3 
1d6a : a9 04 __ LDA #$04
1d6c : 85 1f __ STA P4 
1d6e : a9 00 __ LDA #$00
1d70 : 85 20 __ STA P5 
1d72 : a9 ed __ LDA #$ed
1d74 : 85 1d __ STA P2 
1d76 : 20 8a 1e JSR $1e8a ; (strncmp.s4 + 0)
1d79 : 85 35 __ STA T0 + 0 
1d7b : aa __ __ TAX
1d7c : f0 21 __ BEQ $1d9f ; (handle_line.s14 + 0)
.s15:
1d7e : a5 45 __ LDA T1 + 0 
1d80 : 85 1d __ STA P2 
1d82 : a5 46 __ LDA T1 + 1 
1d84 : 85 1e __ STA P3 
1d86 : a9 7f __ LDA #$7f
1d88 : 85 1f __ STA P4 
1d8a : a9 7b __ LDA #$7b
1d8c : 85 1c __ STA P1 
1d8e : a9 00 __ LDA #$00
1d90 : 85 20 __ STA P5 
1d92 : a9 00 __ LDA #$00
1d94 : 85 1b __ STA P0 
1d96 : 20 f2 1e JSR $1ef2 ; (strncpy.s4 + 0)
1d99 : a9 00 __ LDA #$00
1d9b : 8d 7f 7b STA $7b7f ; (at_resp_line[0] + 127)
1d9e : 60 __ __ RTS
.s14:
1d9f : a5 45 __ LDA T1 + 0 
1da1 : 85 23 __ STA P8 
1da3 : a5 46 __ LDA T1 + 1 
1da5 : 85 24 __ STA P9 
1da7 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
1daa : a9 00 __ LDA #$00
1dac : 85 25 __ STA P10 
1dae : a9 2c __ LDA #$2c
1db0 : 8d cc 9f STA $9fcc ; (sstack + 0)
1db3 : a9 4f __ LDA #$4f
1db5 : 85 26 __ STA P11 
1db7 : a9 3a __ LDA #$3a
1db9 : 8d cd 9f STA $9fcd ; (sstack + 1)
1dbc : 4c bb 17 JMP $17bb ; (textPrintNewLine.s4 + 0)
--------------------------------------------------------------------
1dbf : __ __ __ BYT 3c 3c 20 00                                     : << .
--------------------------------------------------------------------
strcmp: ; strcmp(const u8*,const u8*)->i8
;   8, "/mnt/d/F256/oscar64/include/string.h"
.s4:
1dc3 : a0 00 __ LDY #$00
1dc5 : b1 1b __ LDA (P0),y 
1dc7 : f0 16 __ BEQ $1ddf ; (strcmp.s4 + 28)
1dc9 : d1 1d __ CMP (P2),y 
1dcb : d0 16 __ BNE $1de3 ; (strcmp.s4 + 32)
1dcd : c8 __ __ INY
1dce : b1 1b __ LDA (P0),y 
1dd0 : f0 0d __ BEQ $1ddf ; (strcmp.s4 + 28)
1dd2 : d1 1d __ CMP (P2),y 
1dd4 : d0 0d __ BNE $1de3 ; (strcmp.s4 + 32)
1dd6 : c8 __ __ INY
1dd7 : d0 ec __ BNE $1dc5 ; (strcmp.s4 + 2)
1dd9 : e6 1c __ INC P1 
1ddb : e6 1e __ INC P3 
1ddd : d0 e6 __ BNE $1dc5 ; (strcmp.s4 + 2)
1ddf : d1 1d __ CMP (P2),y 
1de1 : f0 08 __ BEQ $1deb ; (strcmp.s4 + 40)
1de3 : b0 04 __ BCS $1de9 ; (strcmp.s4 + 38)
1de5 : a9 ff __ LDA #$ff
1de7 : 30 02 __ BMI $1deb ; (strcmp.s4 + 40)
1de9 : a9 01 __ LDA #$01
1deb : 85 29 __ STA ACCU + 0 
.s3:
1ded : a5 29 __ LDA ACCU + 0 
1def : 60 __ __ RTS
--------------------------------------------------------------------
1df0 : __ __ __ BYT 4f 4b 00                                        : OK.
--------------------------------------------------------------------
1df3 : __ __ __ BYT 53 45 4e 44 20 4f 4b 00                         : SEND OK.
--------------------------------------------------------------------
1dfb : __ __ __ BYT 46 41 49 4c 00                                  : FAIL.
--------------------------------------------------------------------
1e00 : __ __ __ BYT 45 52 52 4f 52 00                               : ERROR.
--------------------------------------------------------------------
strstr: ; strstr(const u8*,const u8*)->u8*
;  22, "/mnt/d/F256/oscar64/include/string.h"
.s4:
1e06 : a0 00 __ LDY #$00
1e08 : b1 1d __ LDA (P2),y ; (substr + 0)
1e0a : f0 56 __ BEQ $1e62 ; (strstr.s5 + 0)
.s6:
1e0c : 85 2b __ STA ACCU + 2 
1e0e : b1 1b __ LDA (P0),y ; (str + 0)
1e10 : f0 4b __ BEQ $1e5d ; (strstr.s7 + 0)
.s15:
1e12 : a5 1b __ LDA P0 ; (str + 0)
1e14 : 85 29 __ STA ACCU + 0 
1e16 : a5 1c __ LDA P1 ; (str + 1)
1e18 : 85 2a __ STA ACCU + 1 
1e1a : a6 1d __ LDX P2 ; (substr + 0)
.l8:
1e1c : 86 35 __ STX T3 + 0 
1e1e : a5 29 __ LDA ACCU + 0 
1e20 : 85 1b __ STA P0 ; (str + 0)
1e22 : a5 2a __ LDA ACCU + 1 
1e24 : 85 1c __ STA P1 ; (str + 1)
1e26 : a5 1e __ LDA P3 ; (substr + 1)
1e28 : 85 36 __ STA T3 + 1 
1e2a : a0 00 __ LDY #$00
1e2c : b1 1b __ LDA (P0),y ; (str + 0)
1e2e : f0 16 __ BEQ $1e46 ; (strstr.s9 + 0)
.s11:
1e30 : a5 2b __ LDA ACCU + 2 
1e32 : f0 12 __ BEQ $1e46 ; (strstr.s9 + 0)
.l12:
1e34 : d1 29 __ CMP (ACCU + 0),y 
1e36 : d0 0c __ BNE $1e44 ; (strstr.s20 + 0)
.s13:
1e38 : e6 35 __ INC T3 + 0 
1e3a : d0 02 __ BNE $1e3e ; (strstr.s17 + 0)
.s16:
1e3c : e6 36 __ INC T3 + 1 
.s17:
1e3e : a0 01 __ LDY #$01
1e40 : b1 29 __ LDA (ACCU + 0),y 
1e42 : d0 27 __ BNE $1e6b ; (strstr.s14 + 0)
.s20:
1e44 : a0 00 __ LDY #$00
.s9:
1e46 : b1 35 __ LDA (T3 + 0),y 
1e48 : f0 18 __ BEQ $1e62 ; (strstr.s5 + 0)
.s10:
1e4a : 18 __ __ CLC
1e4b : a5 1b __ LDA P0 ; (str + 0)
1e4d : 69 01 __ ADC #$01
1e4f : 85 29 __ STA ACCU + 0 
1e51 : a5 1c __ LDA P1 ; (str + 1)
1e53 : 69 00 __ ADC #$00
1e55 : 85 2a __ STA ACCU + 1 
1e57 : a0 01 __ LDY #$01
1e59 : b1 1b __ LDA (P0),y ; (str + 0)
1e5b : d0 bf __ BNE $1e1c ; (strstr.l8 + 0)
.s7:
1e5d : 85 29 __ STA ACCU + 0 
.s3:
1e5f : 85 2a __ STA ACCU + 1 
1e61 : 60 __ __ RTS
.s5:
1e62 : a5 1b __ LDA P0 ; (str + 0)
1e64 : 85 29 __ STA ACCU + 0 
1e66 : a5 1c __ LDA P1 ; (str + 1)
1e68 : 4c 5f 1e JMP $1e5f ; (strstr.s3 + 0)
.s14:
1e6b : e6 29 __ INC ACCU + 0 
1e6d : d0 02 __ BNE $1e71 ; (strstr.s19 + 0)
.s18:
1e6f : e6 2a __ INC ACCU + 1 
.s19:
1e71 : a0 00 __ LDY #$00
1e73 : b1 35 __ LDA (T3 + 0),y 
1e75 : f0 eb __ BEQ $1e62 ; (strstr.s5 + 0)
1e77 : d0 bb __ BNE $1e34 ; (strstr.l12 + 0)
--------------------------------------------------------------------
1e79 : __ __ __ BYT 2c 43 4c 4f 53 45 44 00                         : ,CLOSED.
--------------------------------------------------------------------
1e81 : __ __ __ BYT 2c 43 4f 4e 4e 45 43 54 00                      : ,CONNECT.
--------------------------------------------------------------------
strncmp: ; strncmp(const u8*,const u8*,i16)->i8
;  10, "/mnt/d/F256/oscar64/include/string.h"
.s4:
1e8a : a5 20 __ LDA P5 ; (size + 1)
1e8c : 05 1f __ ORA P4 ; (size + 0)
1e8e : aa __ __ TAX
1e8f : a5 1f __ LDA P4 ; (size + 0)
1e91 : d0 02 __ BNE $1e95 ; (strncmp.s17 + 0)
.s16:
1e93 : c6 20 __ DEC P5 ; (size + 1)
.s17:
1e95 : 8a __ __ TXA
1e96 : d0 07 __ BNE $1e9f ; (strncmp.s14 + 0)
.s5:
1e98 : 85 2a __ STA ACCU + 1 
1e9a : 85 29 __ STA ACCU + 0 
1e9c : 4c d3 1e JMP $1ed3 ; (strncmp.s6 + 0)
.s14:
1e9f : c6 1f __ DEC P4 ; (size + 0)
1ea1 : a6 20 __ LDX P5 ; (size + 1)
.l11:
1ea3 : a0 00 __ LDY #$00
1ea5 : b1 1d __ LDA (P2),y ; (ptr2 + 0)
1ea7 : 85 2a __ STA ACCU + 1 
1ea9 : b1 1b __ LDA (P0),y ; (ptr1 + 0)
1eab : 85 29 __ STA ACCU + 0 
1ead : c5 2a __ CMP ACCU + 1 
1eaf : d0 20 __ BNE $1ed1 ; (strncmp.s15 + 0)
.s12:
1eb1 : a8 __ __ TAY
1eb2 : f0 23 __ BEQ $1ed7 ; (strncmp.s9 + 0)
.s13:
1eb4 : 8a __ __ TXA
1eb5 : 05 1f __ ORA P4 ; (size + 0)
1eb7 : a8 __ __ TAY
1eb8 : a5 1f __ LDA P4 ; (size + 0)
1eba : 69 fe __ ADC #$fe
1ebc : 85 1f __ STA P4 ; (size + 0)
1ebe : 8a __ __ TXA
1ebf : 69 ff __ ADC #$ff
1ec1 : aa __ __ TAX
1ec2 : e6 1b __ INC P0 ; (ptr1 + 0)
1ec4 : d0 02 __ BNE $1ec8 ; (strncmp.s19 + 0)
.s18:
1ec6 : e6 1c __ INC P1 ; (ptr1 + 1)
.s19:
1ec8 : e6 1d __ INC P2 ; (ptr2 + 0)
1eca : d0 02 __ BNE $1ece ; (strncmp.s21 + 0)
.s20:
1ecc : e6 1e __ INC P3 ; (ptr2 + 1)
.s21:
1ece : 98 __ __ TYA
1ecf : d0 d2 __ BNE $1ea3 ; (strncmp.l11 + 0)
.s15:
1ed1 : 86 20 __ STX P5 ; (size + 1)
.s6:
1ed3 : 24 20 __ BIT P5 ; (size + 1)
1ed5 : 10 03 __ BPL $1eda ; (strncmp.s7 + 0)
.s9:
1ed7 : a9 00 __ LDA #$00
.s3:
1ed9 : 60 __ __ RTS
.s7:
1eda : a5 29 __ LDA ACCU + 0 
1edc : c5 2a __ CMP ACCU + 1 
1ede : b0 03 __ BCS $1ee3 ; (strncmp.s8 + 0)
.s10:
1ee0 : a9 ff __ LDA #$ff
1ee2 : 60 __ __ RTS
.s8:
1ee3 : a5 2a __ LDA ACCU + 1 
1ee5 : c5 29 __ CMP ACCU + 0 
1ee7 : a9 00 __ LDA #$00
1ee9 : 2a __ __ ROL
1eea : 49 01 __ EOR #$01
1eec : 60 __ __ RTS
--------------------------------------------------------------------
1eed : __ __ __ BYT 57 49 46 49 00                                  : WIFI.
--------------------------------------------------------------------
strncpy: ; strncpy(u8*,const u8*,i16)->u8*
;   6, "/mnt/d/F256/oscar64/include/string.h"
.s4:
1ef2 : a5 1f __ LDA P4 ; (n + 0)
1ef4 : aa __ __ TAX
1ef5 : 18 __ __ CLC
1ef6 : 69 ff __ ADC #$ff
1ef8 : 85 1f __ STA P4 ; (n + 0)
1efa : a5 20 __ LDA P5 ; (n + 1)
1efc : 85 2a __ STA ACCU + 1 
1efe : 69 ff __ ADC #$ff
1f00 : 85 20 __ STA P5 ; (n + 1)
1f02 : a5 1b __ LDA P0 ; (dst + 0)
1f04 : 85 35 __ STA T1 + 0 
1f06 : a5 1c __ LDA P1 ; (dst + 1)
1f08 : 85 36 __ STA T1 + 1 
.l5:
1f0a : 8a __ __ TXA
1f0b : 05 2a __ ORA ACCU + 1 
1f0d : f0 29 __ BEQ $1f38 ; (strncpy.s6 + 0)
.s10:
1f0f : a0 00 __ LDY #$00
1f11 : b1 1d __ LDA (P2),y ; (src + 0)
1f13 : 91 35 __ STA (T1 + 0),y 
1f15 : aa __ __ TAX
1f16 : e6 35 __ INC T1 + 0 
1f18 : d0 02 __ BNE $1f1c ; (strncpy.s17 + 0)
.s16:
1f1a : e6 36 __ INC T1 + 1 
.s17:
1f1c : 8a __ __ TXA
1f1d : f0 19 __ BEQ $1f38 ; (strncpy.s6 + 0)
.s11:
1f1f : a5 1f __ LDA P4 ; (n + 0)
1f21 : aa __ __ TAX
1f22 : 18 __ __ CLC
1f23 : 69 ff __ ADC #$ff
1f25 : 85 1f __ STA P4 ; (n + 0)
1f27 : a5 20 __ LDA P5 ; (n + 1)
1f29 : 85 2a __ STA ACCU + 1 
1f2b : 69 ff __ ADC #$ff
1f2d : 85 20 __ STA P5 ; (n + 1)
1f2f : e6 1d __ INC P2 ; (src + 0)
1f31 : d0 d7 __ BNE $1f0a ; (strncpy.l5 + 0)
.s18:
1f33 : e6 1e __ INC P3 ; (src + 1)
1f35 : 4c 0a 1f JMP $1f0a ; (strncpy.l5 + 0)
.s6:
1f38 : a5 20 __ LDA P5 ; (n + 1)
1f3a : 30 20 __ BMI $1f5c ; (strncpy.s7 + 0)
.s9:
1f3c : 05 1f __ ORA P4 ; (n + 0)
1f3e : f0 1c __ BEQ $1f5c ; (strncpy.s7 + 0)
.s8:
1f40 : a0 00 __ LDY #$00
1f42 : a5 1f __ LDA P4 ; (n + 0)
1f44 : f0 02 __ BEQ $1f48 ; (strncpy.l12 + 0)
.s13:
1f46 : e6 20 __ INC P5 ; (n + 1)
.l12:
1f48 : a6 1f __ LDX P4 ; (n + 0)
.l14:
1f4a : a9 00 __ LDA #$00
1f4c : 91 35 __ STA (T1 + 0),y 
1f4e : c8 __ __ INY
1f4f : d0 02 __ BNE $1f53 ; (strncpy.s20 + 0)
.s19:
1f51 : e6 36 __ INC T1 + 1 
.s20:
1f53 : ca __ __ DEX
1f54 : d0 f4 __ BNE $1f4a ; (strncpy.l14 + 0)
.s15:
1f56 : 85 1f __ STA P4 ; (n + 0)
1f58 : c6 20 __ DEC P5 ; (n + 1)
1f5a : d0 ec __ BNE $1f48 ; (strncpy.l12 + 0)
.s7:
1f5c : a5 1b __ LDA P0 ; (dst + 0)
1f5e : 85 29 __ STA ACCU + 0 
1f60 : a5 1c __ LDA P1 ; (dst + 1)
1f62 : 85 2a __ STA ACCU + 1 
.s3:
1f64 : 60 __ __ RTS
--------------------------------------------------------------------
parse_ipd_header: ; parse_ipd_header(const u8*,u8*,u16*)->bool
; 371, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s4:
1f65 : a5 21 __ LDA P6 ; (hdr + 0)
1f67 : 85 1b __ STA P0 
1f69 : a9 05 __ LDA #$05
1f6b : 85 1f __ STA P4 
1f6d : a9 00 __ LDA #$00
1f6f : 85 20 __ STA P5 
1f71 : a5 22 __ LDA P7 ; (hdr + 1)
1f73 : 85 1c __ STA P1 
1f75 : a9 6e __ LDA #$6e
1f77 : 85 1d __ STA P2 
1f79 : a9 20 __ LDA #$20
1f7b : 85 1e __ STA P3 
1f7d : 20 8a 1e JSR $1e8a ; (strncmp.s4 + 0)
1f80 : aa __ __ TAX
1f81 : f0 03 __ BEQ $1f86 ; (parse_ipd_header.s5 + 0)
1f83 : 4c 69 20 JMP $2069 ; (parse_ipd_header.s10 + 0)
.s5:
1f86 : 18 __ __ CLC
1f87 : a5 21 __ LDA P6 ; (hdr + 0)
1f89 : 69 05 __ ADC #$05
1f8b : 85 35 __ STA T0 + 0 
1f8d : a5 22 __ LDA P7 ; (hdr + 1)
1f8f : 69 00 __ ADC #$00
1f91 : 85 36 __ STA T0 + 1 
1f93 : a9 00 __ LDA #$00
1f95 : 85 37 __ STA T1 + 0 
1f97 : 85 38 __ STA T1 + 1 
1f99 : a0 05 __ LDY #$05
1f9b : b1 21 __ LDA (P6),y ; (hdr + 0)
1f9d : c9 30 __ CMP #$30
1f9f : b0 04 __ BCS $1fa5 ; (parse_ipd_header.l13 + 0)
.s19:
1fa1 : a0 00 __ LDY #$00
1fa3 : 90 46 __ BCC $1feb ; (parse_ipd_header.s6 + 0)
.l13:
1fa5 : a0 00 __ LDY #$00
1fa7 : b1 35 __ LDA (T0 + 0),y 
1fa9 : c9 3a __ CMP #$3a
1fab : b0 3e __ BCS $1feb ; (parse_ipd_header.s6 + 0)
.s14:
1fad : a5 37 __ LDA T1 + 0 
1faf : 0a __ __ ASL
1fb0 : 85 29 __ STA ACCU + 0 
1fb2 : a5 38 __ LDA T1 + 1 
1fb4 : 2a __ __ ROL
1fb5 : 06 29 __ ASL ACCU + 0 
1fb7 : 2a __ __ ROL
1fb8 : aa __ __ TAX
1fb9 : 18 __ __ CLC
1fba : a5 29 __ LDA ACCU + 0 
1fbc : 65 37 __ ADC T1 + 0 
1fbe : 85 37 __ STA T1 + 0 
1fc0 : 8a __ __ TXA
1fc1 : 65 38 __ ADC T1 + 1 
1fc3 : 06 37 __ ASL T1 + 0 
1fc5 : 2a __ __ ROL
1fc6 : 85 38 __ STA T1 + 1 
1fc8 : b1 35 __ LDA (T0 + 0),y 
1fca : 38 __ __ SEC
1fcb : e9 30 __ SBC #$30
1fcd : aa __ __ TAX
1fce : 98 __ __ TYA
1fcf : e9 00 __ SBC #$00
1fd1 : 85 3a __ STA T2 + 1 
1fd3 : 8a __ __ TXA
1fd4 : 18 __ __ CLC
1fd5 : 65 37 __ ADC T1 + 0 
1fd7 : 85 37 __ STA T1 + 0 
1fd9 : a5 3a __ LDA T2 + 1 
1fdb : 65 38 __ ADC T1 + 1 
1fdd : 85 38 __ STA T1 + 1 
1fdf : e6 35 __ INC T0 + 0 
1fe1 : d0 02 __ BNE $1fe5 ; (parse_ipd_header.s18 + 0)
.s17:
1fe3 : e6 36 __ INC T0 + 1 
.s18:
1fe5 : b1 35 __ LDA (T0 + 0),y 
1fe7 : c9 30 __ CMP #$30
1fe9 : b0 ba __ BCS $1fa5 ; (parse_ipd_header.l13 + 0)
.s6:
1feb : b1 35 __ LDA (T0 + 0),y 
1fed : c9 2c __ CMP #$2c
1fef : d0 78 __ BNE $2069 ; (parse_ipd_header.s10 + 0)
.s7:
1ff1 : 84 3b __ STY T3 + 0 
1ff3 : 84 3c __ STY T3 + 1 
1ff5 : a5 35 __ LDA T0 + 0 
1ff7 : 69 00 __ ADC #$00
1ff9 : 85 39 __ STA T2 + 0 
1ffb : a5 36 __ LDA T0 + 1 
1ffd : 69 00 __ ADC #$00
1fff : 85 3a __ STA T2 + 1 
2001 : a0 01 __ LDY #$01
2003 : b1 35 __ LDA (T0 + 0),y 
2005 : c9 30 __ CMP #$30
2007 : b0 03 __ BCS $200c ; (parse_ipd_header.l11 + 0)
.s20:
2009 : 88 __ __ DEY
200a : 90 46 __ BCC $2052 ; (parse_ipd_header.s8 + 0)
.l11:
200c : a0 00 __ LDY #$00
200e : b1 39 __ LDA (T2 + 0),y 
2010 : c9 3a __ CMP #$3a
2012 : b0 3e __ BCS $2052 ; (parse_ipd_header.s8 + 0)
.s12:
2014 : a5 3b __ LDA T3 + 0 
2016 : 0a __ __ ASL
2017 : 85 29 __ STA ACCU + 0 
2019 : a5 3c __ LDA T3 + 1 
201b : 2a __ __ ROL
201c : 06 29 __ ASL ACCU + 0 
201e : 2a __ __ ROL
201f : aa __ __ TAX
2020 : 18 __ __ CLC
2021 : a5 29 __ LDA ACCU + 0 
2023 : 65 3b __ ADC T3 + 0 
2025 : 85 3b __ STA T3 + 0 
2027 : 8a __ __ TXA
2028 : 65 3c __ ADC T3 + 1 
202a : 06 3b __ ASL T3 + 0 
202c : 2a __ __ ROL
202d : 85 3c __ STA T3 + 1 
202f : b1 39 __ LDA (T2 + 0),y 
2031 : 38 __ __ SEC
2032 : e9 30 __ SBC #$30
2034 : aa __ __ TAX
2035 : 98 __ __ TYA
2036 : e9 00 __ SBC #$00
2038 : 85 36 __ STA T0 + 1 
203a : 8a __ __ TXA
203b : 18 __ __ CLC
203c : 65 3b __ ADC T3 + 0 
203e : 85 3b __ STA T3 + 0 
2040 : a5 36 __ LDA T0 + 1 
2042 : 65 3c __ ADC T3 + 1 
2044 : 85 3c __ STA T3 + 1 
2046 : e6 39 __ INC T2 + 0 
2048 : d0 02 __ BNE $204c ; (parse_ipd_header.s16 + 0)
.s15:
204a : e6 3a __ INC T2 + 1 
.s16:
204c : b1 39 __ LDA (T2 + 0),y 
204e : c9 30 __ CMP #$30
2050 : b0 ba __ BCS $200c ; (parse_ipd_header.l11 + 0)
.s8:
2052 : b1 39 __ LDA (T2 + 0),y 
2054 : c9 3a __ CMP #$3a
2056 : d0 11 __ BNE $2069 ; (parse_ipd_header.s10 + 0)
.s9:
2058 : a5 37 __ LDA T1 + 0 
205a : 91 23 __ STA (P8),y ; (link + 0)
205c : a5 3b __ LDA T3 + 0 
205e : 91 25 __ STA (P10),y ; (len + 0)
2060 : a5 3c __ LDA T3 + 1 
2062 : a0 01 __ LDY #$01
2064 : 91 25 __ STA (P10),y ; (len + 0)
2066 : 98 __ __ TYA
2067 : d0 02 __ BNE $206b ; (parse_ipd_header.s3 + 0)
.s10:
2069 : a9 00 __ LDA #$00
.s3:
206b : 85 29 __ STA ACCU + 0 
206d : 60 __ __ RTS
--------------------------------------------------------------------
206e : __ __ __ BYT 2b 49 50 44 2c 00                               : +IPD,.
--------------------------------------------------------------------
2074 : __ __ __ BYT 5b 69 70 64 20 6c 69 6e 6b 3d 00                : [ipd link=.
--------------------------------------------------------------------
textPrintInt: ; textPrintInt(i32)->void
;  47, "/mnt/d/F256/f256lib-oscar64/f256lib/f_text.h"
.s1:
207f : a2 03 __ LDX #$03
2081 : b5 55 __ LDA T0 + 0,x 
2083 : 9d c8 9f STA $9fc8,x ; (textPrintInt@stack + 0)
2086 : ca __ __ DEX
2087 : 10 f8 __ BPL $2081 ; (textPrintInt.s1 + 2)
2089 : 38 __ __ SEC
208a : a5 31 __ LDA SP + 0 
208c : e9 06 __ SBC #$06
208e : 85 31 __ STA SP + 0 
2090 : b0 02 __ BCS $2094 ; (textPrintInt.s4 + 0)
2092 : c6 32 __ DEC SP + 1 
.s4:
2094 : ad cc 9f LDA $9fcc ; (sstack + 0)
2097 : 85 55 __ STA T0 + 0 
2099 : ad cd 9f LDA $9fcd ; (sstack + 1)
209c : 85 56 __ STA T0 + 1 
209e : ad ce 9f LDA $9fce ; (sstack + 2)
20a1 : 85 57 __ STA T0 + 2 
20a3 : ad cf 9f LDA $9fcf ; (sstack + 3)
20a6 : 85 58 __ STA T0 + 3 
20a8 : 30 15 __ BMI $20bf ; (textPrintInt.s6 + 0)
.s5:
20aa : a5 55 __ LDA T0 + 0 
20ac : a0 02 __ LDY #$02
20ae : 91 31 __ STA (SP + 0),y 
20b0 : a5 56 __ LDA T0 + 1 
20b2 : c8 __ __ INY
20b3 : 91 31 __ STA (SP + 0),y 
20b5 : a5 57 __ LDA T0 + 2 
20b7 : c8 __ __ INY
20b8 : 91 31 __ STA (SP + 0),y 
20ba : a5 58 __ LDA T0 + 3 
20bc : 4c e5 20 JMP $20e5 ; (textPrintInt.s3 + 0)
.s6:
20bf : a9 02 __ LDA #$02
20c1 : 85 23 __ STA P8 
20c3 : a9 21 __ LDA #$21
20c5 : 85 24 __ STA P9 
20c7 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
20ca : 38 __ __ SEC
20cb : a9 00 __ LDA #$00
20cd : e5 55 __ SBC T0 + 0 
20cf : a0 02 __ LDY #$02
20d1 : 91 31 __ STA (SP + 0),y 
20d3 : a9 00 __ LDA #$00
20d5 : e5 56 __ SBC T0 + 1 
20d7 : c8 __ __ INY
20d8 : 91 31 __ STA (SP + 0),y 
20da : a9 00 __ LDA #$00
20dc : e5 57 __ SBC T0 + 2 
20de : c8 __ __ INY
20df : 91 31 __ STA (SP + 0),y 
20e1 : a9 00 __ LDA #$00
20e3 : e5 58 __ SBC T0 + 3 
.s3:
20e5 : a0 05 __ LDY #$05
20e7 : 91 31 __ STA (SP + 0),y 
20e9 : 20 04 21 JSR $2104 ; (textPrintUInt.s1 + 0)
20ec : 18 __ __ CLC
20ed : a5 31 __ LDA SP + 0 
20ef : 69 06 __ ADC #$06
20f1 : 85 31 __ STA SP + 0 
20f3 : 90 02 __ BCC $20f7 ; (textPrintInt.s3 + 18)
20f5 : e6 32 __ INC SP + 1 
20f7 : a2 03 __ LDX #$03
20f9 : bd c8 9f LDA $9fc8,x ; (textPrintInt@stack + 0)
20fc : 95 55 __ STA T0 + 0,x 
20fe : ca __ __ DEX
20ff : 10 f8 __ BPL $20f9 ; (textPrintInt.s3 + 20)
2101 : 60 __ __ RTS
--------------------------------------------------------------------
2102 : __ __ __ BYT 2d 00                                           : -.
--------------------------------------------------------------------
textPrintUInt: ; textPrintUInt(u32)->void
;  48, "/mnt/d/F256/f256lib-oscar64/f256lib/f_text.h"
.s1:
2104 : 38 __ __ SEC
2105 : a5 31 __ LDA SP + 0 
2107 : e9 0a __ SBC #$0a
2109 : 85 31 __ STA SP + 0 
210b : b0 02 __ BCS $210f ; (textPrintUInt.s1 + 11)
210d : c6 32 __ DEC SP + 1 
210f : a0 07 __ LDY #$07
2111 : a5 56 __ LDA T2 + 1 
2113 : 91 31 __ STA (SP + 0),y 
2115 : 88 __ __ DEY
2116 : a5 55 __ LDA T2 + 0 
2118 : 91 31 __ STA (SP + 0),y 
.s4:
211a : 18 __ __ CLC
211b : a5 31 __ LDA SP + 0 
211d : 69 08 __ ADC #$08
211f : 85 55 __ STA T2 + 0 
2121 : a5 32 __ LDA SP + 1 
2123 : 69 00 __ ADC #$00
2125 : 85 56 __ STA T2 + 1 
2127 : a0 0c __ LDY #$0c
2129 : b1 31 __ LDA (SP + 0),y 
212b : 85 1b __ STA P0 ; (value + 0)
212d : aa __ __ TAX
212e : c8 __ __ INY
212f : b1 31 __ LDA (SP + 0),y 
2131 : 85 3a __ STA T1 + 1 
2133 : 85 1c __ STA P1 ; (value + 1)
2135 : c8 __ __ INY
2136 : b1 31 __ LDA (SP + 0),y 
2138 : 85 3b __ STA T1 + 2 
213a : c8 __ __ INY
213b : b1 31 __ LDA (SP + 0),y 
213d : 85 3c __ STA T1 + 3 
213f : d0 0f __ BNE $2150 ; (textPrintUInt.s6 + 0)
.s14:
2141 : a5 3b __ LDA T1 + 2 
2143 : d0 0b __ BNE $2150 ; (textPrintUInt.s6 + 0)
.s15:
2145 : a5 1c __ LDA P1 ; (value + 1)
2147 : d0 07 __ BNE $2150 ; (textPrintUInt.s6 + 0)
.s16:
2149 : e0 0a __ CPX #$0a
214b : b0 03 __ BCS $2150 ; (textPrintUInt.s6 + 0)
214d : 4c ce 21 JMP $21ce ; (textPrintUInt.s5 + 0)
.s6:
2150 : a5 3c __ LDA T1 + 3 
2152 : d0 2f __ BNE $2183 ; (textPrintUInt.s9 + 0)
.s10:
2154 : a5 3b __ LDA T1 + 2 
2156 : d0 2b __ BNE $2183 ; (textPrintUInt.s9 + 0)
.s11:
2158 : a9 ff __ LDA #$ff
215a : c5 1c __ CMP P1 ; (value + 1)
215c : d0 02 __ BNE $2160 ; (textPrintUInt.s13 + 0)
.s12:
215e : c5 1b __ CMP P0 ; (value + 0)
.s13:
2160 : 90 21 __ BCC $2183 ; (textPrintUInt.s9 + 0)
.s7:
2162 : 8e 06 de STX $de06 
2165 : a5 1c __ LDA P1 ; (value + 1)
2167 : 8d 07 de STA $de07 
216a : a9 0a __ LDA #$0a
216c : 8d 04 de STA $de04 
216f : a9 00 __ LDA #$00
2171 : 8d 05 de STA $de05 
2174 : ad 14 de LDA $de14 
2177 : 85 29 __ STA ACCU + 0 
2179 : ad 15 de LDA $de15 
217c : 85 2a __ STA ACCU + 1 
217e : a9 00 __ LDA #$00
2180 : aa __ __ TAX
2181 : b0 21 __ BCS $21a4 ; (textPrintUInt.s8 + 0)
.s9:
2183 : 86 29 __ STX ACCU + 0 
2185 : a5 1c __ LDA P1 ; (value + 1)
2187 : 85 2a __ STA ACCU + 1 
2189 : a5 3b __ LDA T1 + 2 
218b : 85 2b __ STA ACCU + 2 
218d : a5 3c __ LDA T1 + 3 
218f : 85 2c __ STA ACCU + 3 
2191 : a9 00 __ LDA #$00
2193 : 85 12 __ STA WORK + 1 
2195 : 85 13 __ STA WORK + 2 
2197 : 85 14 __ STA WORK + 3 
2199 : a9 0a __ LDA #$0a
219b : 85 11 __ STA WORK + 0 
219d : 20 37 77 JSR $7737 ; (divmod32 + 0)
21a0 : a5 2c __ LDA ACCU + 3 
21a2 : a6 2b __ LDX ACCU + 2 
.s8:
21a4 : a0 05 __ LDY #$05
21a6 : 91 31 __ STA (SP + 0),y 
21a8 : 8a __ __ TXA
21a9 : 88 __ __ DEY
21aa : 91 31 __ STA (SP + 0),y 
21ac : a5 29 __ LDA ACCU + 0 
21ae : a0 02 __ LDY #$02
21b0 : 91 31 __ STA (SP + 0),y 
21b2 : a5 2a __ LDA ACCU + 1 
21b4 : c8 __ __ INY
21b5 : 91 31 __ STA (SP + 0),y 
21b7 : 20 04 21 JSR $2104 ; (textPrintUInt.s1 + 0)
21ba : a0 0c __ LDY #$0c
21bc : b1 31 __ LDA (SP + 0),y 
21be : aa __ __ TAX
21bf : c8 __ __ INY
21c0 : b1 31 __ LDA (SP + 0),y 
21c2 : 85 3a __ STA T1 + 1 
21c4 : c8 __ __ INY
21c5 : b1 31 __ LDA (SP + 0),y 
21c7 : 85 3b __ STA T1 + 2 
21c9 : c8 __ __ INY
21ca : b1 31 __ LDA (SP + 0),y 
21cc : 85 3c __ STA T1 + 3 
.s5:
21ce : 86 29 __ STX ACCU + 0 
21d0 : a5 55 __ LDA T2 + 0 
21d2 : 85 23 __ STA P8 
21d4 : a5 56 __ LDA T2 + 1 
21d6 : 85 24 __ STA P9 
21d8 : a9 00 __ LDA #$00
21da : a0 09 __ LDY #$09
21dc : 91 31 __ STA (SP + 0),y 
21de : 85 12 __ STA WORK + 1 
21e0 : 85 13 __ STA WORK + 2 
21e2 : 85 14 __ STA WORK + 3 
21e4 : a5 3a __ LDA T1 + 1 
21e6 : 85 2a __ STA ACCU + 1 
21e8 : a5 3b __ LDA T1 + 2 
21ea : 85 2b __ STA ACCU + 2 
21ec : a5 3c __ LDA T1 + 3 
21ee : 85 2c __ STA ACCU + 3 
21f0 : a9 0a __ LDA #$0a
21f2 : 85 11 __ STA WORK + 0 
21f4 : 20 37 77 JSR $7737 ; (divmod32 + 0)
21f7 : 18 __ __ CLC
21f8 : a5 15 __ LDA WORK + 4 
21fa : 69 30 __ ADC #$30
21fc : a0 08 __ LDY #$08
21fe : 91 31 __ STA (SP + 0),y 
2200 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
.s3:
2203 : a0 07 __ LDY #$07
2205 : b1 31 __ LDA (SP + 0),y 
2207 : 85 56 __ STA T2 + 1 
2209 : 88 __ __ DEY
220a : b1 31 __ LDA (SP + 0),y 
220c : 85 55 __ STA T2 + 0 
220e : 18 __ __ CLC
220f : a5 31 __ LDA SP + 0 
2211 : 69 0a __ ADC #$0a
2213 : 85 31 __ STA SP + 0 
2215 : 90 02 __ BCC $2219 ; (textPrintUInt.s3 + 22)
2217 : e6 32 __ INC SP + 1 
2219 : 60 __ __ RTS
--------------------------------------------------------------------
221a : __ __ __ BYT 20 6c 65 6e 3d 00                               :  len=.
--------------------------------------------------------------------
2220 : __ __ __ BYT 5d 00                                           : ].
--------------------------------------------------------------------
handle_data_byte: ; handle_data_byte(u8,u8)->void
; 362, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s4:
2222 : ad d8 9f LDA $9fd8 ; (sstack + 12)
2225 : d0 09 __ BNE $2230 ; (handle_data_byte.s6 + 0)
.s5:
2227 : ad d9 9f LDA $9fd9 ; (sstack + 13)
222a : 8d ce 9f STA $9fce ; (sstack + 2)
222d : 4c 83 22 JMP $2283 ; (handle_ctrl_byte.s4 + 0)
.s6:
2230 : c9 01 __ CMP #$01
2232 : d0 31 __ BNE $2265 ; (handle_data_byte.s3 + 0)
.s7:
2234 : ad b6 79 LDA $79b6 ; (data_sink + 0)
2237 : c9 01 __ CMP #$01
2239 : f0 2b __ BEQ $2266 ; (handle_data_byte.s11 + 0)
.s8:
223b : c9 02 __ CMP #$02
223d : d0 26 __ BNE $2265 ; (handle_data_byte.s3 + 0)
.s9:
223f : ae b8 79 LDX $79b8 ; (filebuf_len + 0)
2242 : ee b8 79 INC $79b8 ; (filebuf_len + 0)
2245 : ad d9 9f LDA $9fd9 ; (sstack + 13)
2248 : 9d 08 80 STA $8008,x ; (filebuf[0] + 0)
224b : ee b9 79 INC $79b9 ; (downloadBytes + 0)
224e : d0 0d __ BNE $225d ; (handle_data_byte.s17 + 0)
.s19:
2250 : ee ba 79 INC $79ba ; (downloadBytes + 1)
2253 : d0 08 __ BNE $225d ; (handle_data_byte.s17 + 0)
.s18:
2255 : ee bb 79 INC $79bb ; (downloadBytes + 2)
2258 : d0 03 __ BNE $225d ; (handle_data_byte.s17 + 0)
.s16:
225a : ee bc 79 INC $79bc ; (downloadBytes + 3)
.s17:
225d : 2c b8 79 BIT $79b8 ; (filebuf_len + 0)
2260 : 10 03 __ BPL $2265 ; (handle_data_byte.s3 + 0)
.s10:
2262 : 4c 8b 27 JMP $278b ; (flush_filebuf.s4 + 0)
.s3:
2265 : 60 __ __ RTS
.s11:
2266 : ad d9 9f LDA $9fd9 ; (sstack + 13)
2269 : c9 0d __ CMP #$0d
226b : f0 f8 __ BEQ $2265 ; (handle_data_byte.s3 + 0)
.s12:
226d : c9 0a __ CMP #$0a
226f : f0 0f __ BEQ $2280 ; (handle_data_byte.s15 + 0)
.s13:
2271 : ac b7 79 LDY $79b7 ; (listlinelen + 0)
2274 : c0 4f __ CPY #$4f
2276 : b0 ed __ BCS $2265 ; (handle_data_byte.s3 + 0)
.s14:
2278 : c8 __ __ INY
2279 : 8c b7 79 STY $79b7 ; (listlinelen + 0)
227c : 99 ff 7c STA $7cff,y ; (ctrl_reply_text[0] + 127)
227f : 60 __ __ RTS
.s15:
2280 : 4c a1 23 JMP $23a1 ; (flush_listline.s4 + 0)
--------------------------------------------------------------------
handle_ctrl_byte: ; handle_ctrl_byte(u8)->void
; 361, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s4:
2283 : ad ce 9f LDA $9fce ; (sstack + 2)
2286 : c9 0a __ CMP #$0a
2288 : f0 13 __ BEQ $229d ; (handle_ctrl_byte.s8 + 0)
.s5:
228a : c9 0d __ CMP #$0d
228c : f0 0e __ BEQ $229c ; (handle_ctrl_byte.s3 + 0)
.s6:
228e : ac b2 79 LDY $79b2 ; (ctrllen + 0)
2291 : c0 7f __ CPY #$7f
2293 : b0 07 __ BCS $229c ; (handle_ctrl_byte.s3 + 0)
.s7:
2295 : c8 __ __ INY
2296 : 8c b2 79 STY $79b2 ; (ctrllen + 0)
2299 : 99 ff 7b STA $7bff,y ; (linebuf[0] + 127)
.s3:
229c : 60 __ __ RTS
.s8:
229d : 85 37 __ STA T1 + 0 
229f : a9 00 __ LDA #$00
22a1 : ae b2 79 LDX $79b2 ; (ctrllen + 0)
22a4 : 86 39 __ STX T3 + 0 
22a6 : 9d 00 7c STA $7c00,x ; (ctrlline[0] + 0)
22a9 : e0 04 __ CPX #$04
22ab : 90 31 __ BCC $22de ; (handle_ctrl_byte.s9 + 0)
.s13:
22ad : ad 00 7c LDA $7c00 ; (ctrlline[0] + 0)
22b0 : c9 30 __ CMP #$30
22b2 : 90 2a __ BCC $22de ; (handle_ctrl_byte.s9 + 0)
.s14:
22b4 : a9 39 __ LDA #$39
22b6 : cd 00 7c CMP $7c00 ; (ctrlline[0] + 0)
22b9 : 90 23 __ BCC $22de ; (handle_ctrl_byte.s9 + 0)
.s15:
22bb : ad 01 7c LDA $7c01 ; (ctrlline[0] + 1)
22be : 85 37 __ STA T1 + 0 
22c0 : c9 30 __ CMP #$30
22c2 : 90 1a __ BCC $22de ; (handle_ctrl_byte.s9 + 0)
.s16:
22c4 : c9 3a __ CMP #$3a
22c6 : b0 16 __ BCS $22de ; (handle_ctrl_byte.s9 + 0)
.s17:
22c8 : ad 02 7c LDA $7c02 ; (ctrlline[0] + 2)
22cb : 85 3a __ STA T4 + 0 
22cd : c9 30 __ CMP #$30
22cf : 90 0d __ BCC $22de ; (handle_ctrl_byte.s9 + 0)
.s18:
22d1 : c9 3a __ CMP #$3a
22d3 : b0 09 __ BCS $22de ; (handle_ctrl_byte.s9 + 0)
.s19:
22d5 : ad 03 7c LDA $7c03 ; (ctrlline[0] + 3)
22d8 : 85 3b __ STA T5 + 0 
22da : c9 20 __ CMP #$20
22dc : f0 3e __ BEQ $231c ; (handle_ctrl_byte.s20 + 0)
.s9:
22de : ad ad 79 LDA $79ad ; (debug_mode + 0)
22e1 : f0 33 __ BEQ $2316 ; (handle_ctrl_byte.s10 + 0)
.s11:
22e3 : a5 39 __ LDA T3 + 0 
22e5 : f0 2f __ BEQ $2316 ; (handle_ctrl_byte.s10 + 0)
.s12:
22e7 : a9 99 __ LDA #$99
22e9 : 85 35 __ STA T0 + 0 
22eb : 85 23 __ STA P8 
22ed : a9 23 __ LDA #$23
22ef : 85 36 __ STA T0 + 1 
22f1 : 85 24 __ STA P9 
22f3 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
22f6 : a9 00 __ LDA #$00
22f8 : 85 23 __ STA P8 
22fa : a9 7c __ LDA #$7c
22fc : 85 24 __ STA P9 
22fe : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
2301 : a9 00 __ LDA #$00
2303 : 85 25 __ STA P10 
2305 : a9 2c __ LDA #$2c
2307 : 8d cc 9f STA $9fcc ; (sstack + 0)
230a : a9 4f __ LDA #$4f
230c : 85 26 __ STA P11 
230e : a9 3a __ LDA #$3a
2310 : 8d cd 9f STA $9fcd ; (sstack + 1)
2313 : 20 bb 17 JSR $17bb ; (textPrintNewLine.s4 + 0)
.s10:
2316 : a9 00 __ LDA #$00
2318 : 8d b2 79 STA $79b2 ; (ctrllen + 0)
231b : 60 __ __ RTS
.s20:
231c : a9 01 __ LDA #$01
231e : 8d b5 79 STA $79b5 ; (ctrl_reply_ready + 0)
2321 : ad 00 7c LDA $7c00 ; (ctrlline[0] + 0)
2324 : 0a __ __ ASL
2325 : a0 00 __ LDY #$00
2327 : 90 02 __ BCC $232b ; (handle_ctrl_byte.s23 + 0)
.s22:
2329 : c8 __ __ INY
232a : 18 __ __ CLC
.s23:
232b : 6d 00 7c ADC $7c00 ; (ctrlline[0] + 0)
232e : 90 01 __ BCC $2331 ; (handle_ctrl_byte.s25 + 0)
.s24:
2330 : c8 __ __ INY
.s25:
2331 : 84 29 __ STY ACCU + 0 ; (c + 0)
2333 : 0a __ __ ASL
2334 : 26 29 __ ROL ACCU + 0 ; (c + 0)
2336 : 0a __ __ ASL
2337 : 26 29 __ ROL ACCU + 0 ; (c + 0)
2339 : 0a __ __ ASL
233a : 26 29 __ ROL ACCU + 0 ; (c + 0)
233c : 18 __ __ CLC
233d : 6d 00 7c ADC $7c00 ; (ctrlline[0] + 0)
2340 : 85 35 __ STA T0 + 0 
2342 : a5 29 __ LDA ACCU + 0 ; (c + 0)
2344 : 69 00 __ ADC #$00
2346 : 06 35 __ ASL T0 + 0 
2348 : 2a __ __ ROL
2349 : 06 35 __ ASL T0 + 0 
234b : 2a __ __ ROL
234c : 85 36 __ STA T0 + 1 
234e : a5 37 __ LDA T1 + 0 
2350 : 0a __ __ ASL
2351 : 85 29 __ STA ACCU + 0 ; (c + 0)
2353 : a9 00 __ LDA #$00
2355 : 2a __ __ ROL
2356 : 06 29 __ ASL ACCU + 0 ; (c + 0)
2358 : 2a __ __ ROL
2359 : aa __ __ TAX
235a : a5 29 __ LDA ACCU + 0 ; (c + 0)
235c : 65 37 __ ADC T1 + 0 
235e : 85 37 __ STA T1 + 0 
2360 : 8a __ __ TXA
2361 : 69 00 __ ADC #$00
2363 : 06 37 __ ASL T1 + 0 
2365 : 2a __ __ ROL
2366 : a8 __ __ TAY
2367 : a5 37 __ LDA T1 + 0 
2369 : 65 35 __ ADC T0 + 0 
236b : aa __ __ TAX
236c : 98 __ __ TYA
236d : 65 36 __ ADC T0 + 1 
236f : a8 __ __ TAY
2370 : 8a __ __ TXA
2371 : 18 __ __ CLC
2372 : 65 3a __ ADC T4 + 0 
2374 : 90 01 __ BCC $2377 ; (handle_ctrl_byte.s27 + 0)
.s26:
2376 : c8 __ __ INY
.s27:
2377 : 38 __ __ SEC
2378 : e9 d0 __ SBC #$d0
237a : 8d b3 79 STA $79b3 ; (ctrl_reply_code + 0)
237d : 98 __ __ TYA
237e : e9 14 __ SBC #$14
2380 : 8d b4 79 STA $79b4 ; (ctrl_reply_code + 1)
2383 : a9 80 __ LDA #$80
2385 : 85 37 __ STA T1 + 0 
2387 : a9 7c __ LDA #$7c
2389 : 85 38 __ STA T1 + 1 
238b : a2 ff __ LDX #$ff
.l21:
238d : e8 __ __ INX
238e : bd 04 7c LDA $7c04,x ; (ctrlline[0] + 4)
2391 : 9d 80 7c STA $7c80,x ; (ctrl_reply_text[0] + 0)
2394 : d0 f7 __ BNE $238d ; (handle_ctrl_byte.l21 + 0)
2396 : 4c de 22 JMP $22de ; (handle_ctrl_byte.s9 + 0)
--------------------------------------------------------------------
2399 : __ __ __ BYT 5b 63 74 72 6c 5d 20 00                         : [ctrl] .
--------------------------------------------------------------------
flush_listline: ; flush_listline()->void
; 364, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s4:
23a1 : a9 00 __ LDA #$00
23a3 : 85 2a __ STA ACCU + 1 
23a5 : ae b7 79 LDX $79b7 ; (listlinelen + 0)
23a8 : 9d 00 7d STA $7d00,x ; (listline[0] + 0)
23ab : ae a6 79 LDX $79a6 ; (cur_rem_y + 0)
23ae : ca __ __ DEX
23af : ca __ __ DEX
23b0 : 86 29 __ STX ACCU + 0 
23b2 : a9 00 __ LDA #$00
23b4 : 8d ce 9f STA $9fce ; (sstack + 2)
23b7 : a9 7d __ LDA #$7d
23b9 : 8d cf 9f STA $9fcf ; (sstack + 3)
23bc : a9 1d __ LDA #$1d
23be : 20 60 72 JSR $7260 ; (mul16by8 + 0)
23c1 : 18 __ __ CLC
23c2 : a9 50 __ LDA #$50
23c4 : 65 29 __ ADC ACCU + 0 
23c6 : 8d d0 9f STA $9fd0 ; (sstack + 4)
23c9 : a9 7d __ LDA #$7d
23cb : 65 2a __ ADC ACCU + 1 
23cd : 8d d1 9f STA $9fd1 ; (sstack + 5)
23d0 : 20 d9 23 JSR $23d9 ; (format_and_print_listline.s4 + 0)
23d3 : a9 00 __ LDA #$00
23d5 : 8d b7 79 STA $79b7 ; (listlinelen + 0)
.s3:
23d8 : 60 __ __ RTS
--------------------------------------------------------------------
format_and_print_listline: ; format_and_print_listline(u8*,struct S#8557*)->bool
; 365, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s4:
23d9 : ad ce 9f LDA $9fce ; (sstack + 2)
23dc : 85 48 __ STA T1 + 0 
23de : ad cf 9f LDA $9fcf ; (sstack + 3)
23e1 : 85 49 __ STA T1 + 1 
23e3 : a0 00 __ LDY #$00
23e5 : b1 48 __ LDA (T1 + 0),y 
23e7 : f0 71 __ BEQ $245a ; (format_and_print_listline.s3 + 0)
.s5:
23e9 : 84 20 __ STY P5 
23eb : a5 48 __ LDA T1 + 0 
23ed : 85 1b __ STA P0 
23ef : a5 49 __ LDA T1 + 1 
23f1 : 85 1c __ STA P1 
23f3 : a9 06 __ LDA #$06
23f5 : 85 1f __ STA P4 
23f7 : a9 26 __ LDA #$26
23f9 : 85 1e __ STA P3 
23fb : a9 5c __ LDA #$5c
23fd : 85 1d __ STA P2 
23ff : 20 8a 1e JSR $1e8a ; (strncmp.s4 + 0)
2402 : aa __ __ TAX
2403 : f0 55 __ BEQ $245a ; (format_and_print_listline.s3 + 0)
.s6:
2405 : a9 27 __ LDA #$27
2407 : 85 1d __ STA P2 
2409 : 20 76 17 JSR $1776 ; (initTextXY.s4 + 0)
240c : a5 48 __ LDA T1 + 0 
240e : 85 4e __ STA T3 + 0 
2410 : a5 49 __ LDA T1 + 1 
2412 : 85 4f __ STA T3 + 1 
2414 : a9 00 __ LDA #$00
2416 : 85 4c __ STA T2 + 0 
.l7:
2418 : a0 00 __ LDY #$00
241a : b1 4e __ LDA (T3 + 0),y 
241c : c9 20 __ CMP #$20
241e : d0 14 __ BNE $2434 ; (format_and_print_listline.s8 + 0)
.s36:
2420 : a5 4e __ LDA T3 + 0 
2422 : 84 4e __ STY T3 + 0 
2424 : a8 __ __ TAY
.l37:
2425 : c8 __ __ INY
2426 : d0 02 __ BNE $242a ; (format_and_print_listline.s43 + 0)
.s42:
2428 : e6 4f __ INC T3 + 1 
.s43:
242a : b1 4e __ LDA (T3 + 0),y 
242c : c9 20 __ CMP #$20
242e : f0 f5 __ BEQ $2425 ; (format_and_print_listline.l37 + 0)
.s38:
2430 : 84 4e __ STY T3 + 0 
2432 : a0 00 __ LDY #$00
.s8:
2434 : b1 4e __ LDA (T3 + 0),y 
2436 : d0 25 __ BNE $245d ; (format_and_print_listline.s10 + 0)
.s9:
2438 : a5 48 __ LDA T1 + 0 
243a : 85 23 __ STA P8 
243c : a5 49 __ LDA T1 + 1 
243e : 85 24 __ STA P9 
2440 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
2443 : a9 01 __ LDA #$01
2445 : 85 25 __ STA P10 
2447 : a9 02 __ LDA #$02
2449 : 8d cc 9f STA $9fcc ; (sstack + 0)
244c : a9 27 __ LDA #$27
244e : 85 26 __ STA P11 
2450 : a9 2a __ LDA #$2a
2452 : 8d cd 9f STA $9fcd ; (sstack + 1)
2455 : 20 bb 17 JSR $17bb ; (textPrintNewLine.s4 + 0)
2458 : a9 00 __ LDA #$00
.s3:
245a : 85 29 __ STA ACCU + 0 ; (raw + 0)
245c : 60 __ __ RTS
.s10:
245d : 85 50 __ STA T4 + 0 
245f : a5 4c __ LDA T2 + 0 
2461 : 0a __ __ ASL
2462 : aa __ __ TAX
2463 : a5 4e __ LDA T3 + 0 
2465 : 9d b0 9f STA $9fb0,x ; (field[0] + 0)
2468 : a5 4f __ LDA T3 + 1 
246a : 9d b1 9f STA $9fb1,x ; (field[0] + 1)
246d : a5 50 __ LDA T4 + 0 
246f : f0 10 __ BEQ $2481 ; (format_and_print_listline.s11 + 0)
.l34:
2471 : b1 4e __ LDA (T3 + 0),y 
2473 : c9 20 __ CMP #$20
2475 : f0 0a __ BEQ $2481 ; (format_and_print_listline.s11 + 0)
.s35:
2477 : e6 4e __ INC T3 + 0 
2479 : d0 02 __ BNE $247d ; (format_and_print_listline.s50 + 0)
.s49:
247b : e6 4f __ INC T3 + 1 
.s50:
247d : b1 4e __ LDA (T3 + 0),y 
247f : d0 f0 __ BNE $2471 ; (format_and_print_listline.l34 + 0)
.s11:
2481 : b1 4e __ LDA (T3 + 0),y 
2483 : c9 20 __ CMP #$20
2485 : d0 09 __ BNE $2490 ; (format_and_print_listline.s12 + 0)
.s33:
2487 : 98 __ __ TYA
2488 : 91 4e __ STA (T3 + 0),y 
248a : e6 4e __ INC T3 + 0 
248c : d0 02 __ BNE $2490 ; (format_and_print_listline.s12 + 0)
.s44:
248e : e6 4f __ INC T3 + 1 
.s12:
2490 : e6 4c __ INC T2 + 0 
2492 : a5 4c __ LDA T2 + 0 
2494 : c9 08 __ CMP #$08
2496 : 90 80 __ BCC $2418 ; (format_and_print_listline.l7 + 0)
.s13:
2498 : b1 4e __ LDA (T3 + 0),y 
249a : c9 20 __ CMP #$20
249c : d0 14 __ BNE $24b2 ; (format_and_print_listline.s14 + 0)
.s32:
249e : a5 4e __ LDA T3 + 0 
24a0 : 84 4e __ STY T3 + 0 
24a2 : a8 __ __ TAY
.l39:
24a3 : c8 __ __ INY
24a4 : d0 02 __ BNE $24a8 ; (format_and_print_listline.s46 + 0)
.s45:
24a6 : e6 4f __ INC T3 + 1 
.s46:
24a8 : b1 4e __ LDA (T3 + 0),y 
24aa : c9 20 __ CMP #$20
24ac : f0 f5 __ BEQ $24a3 ; (format_and_print_listline.l39 + 0)
.s40:
24ae : 84 4e __ STY T3 + 0 
24b0 : a0 00 __ LDY #$00
.s14:
24b2 : b1 4e __ LDA (T3 + 0),y 
24b4 : d0 24 __ BNE $24da ; (format_and_print_listline.s16 + 0)
.s15:
24b6 : a5 48 __ LDA T1 + 0 
24b8 : 85 23 __ STA P8 
24ba : a5 49 __ LDA T1 + 1 
24bc : 85 24 __ STA P9 
24be : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
.s41:
24c1 : a9 27 __ LDA #$27
24c3 : 85 26 __ STA P11 
24c5 : a9 02 __ LDA #$02
24c7 : 8d cc 9f STA $9fcc ; (sstack + 0)
24ca : a9 01 __ LDA #$01
24cc : 85 25 __ STA P10 
24ce : a9 2a __ LDA #$2a
24d0 : 8d cd 9f STA $9fcd ; (sstack + 1)
24d3 : 20 bb 17 JSR $17bb ; (textPrintNewLine.s4 + 0)
24d6 : a9 01 __ LDA #$01
24d8 : d0 80 __ BNE $245a ; (format_and_print_listline.s3 + 0)
.s16:
24da : ad b0 9f LDA $9fb0 ; (field[0] + 0)
24dd : 85 45 __ STA T0 + 0 
24df : ad b1 9f LDA $9fb1 ; (field[0] + 1)
24e2 : 85 46 __ STA T0 + 1 
24e4 : b1 45 __ LDA (T0 + 0),y 
24e6 : c9 64 __ CMP #$64
24e8 : d0 04 __ BNE $24ee ; (format_and_print_listline.s18 + 0)
.s17:
24ea : a9 01 __ LDA #$01
24ec : d0 01 __ BNE $24ef ; (format_and_print_listline.s19 + 0)
.s18:
24ee : 98 __ __ TYA
.s19:
24ef : 84 48 __ STY T1 + 0 
24f1 : 84 49 __ STY T1 + 1 
24f3 : 84 4a __ STY T1 + 2 
24f5 : 84 4b __ STY T1 + 3 
24f7 : 85 51 __ STA T5 + 0 
24f9 : ad b8 9f LDA $9fb8 ; (field[0] + 8)
24fc : 85 4c __ STA T2 + 0 
24fe : ad b9 9f LDA $9fb9 ; (field[0] + 9)
2501 : 85 4d __ STA T2 + 1 
.l47:
2503 : a0 00 __ LDY #$00
2505 : b1 4c __ LDA (T2 + 0),y 
2507 : c9 30 __ CMP #$30
2509 : 90 40 __ BCC $254b ; (format_and_print_listline.s20 + 0)
.s30:
250b : c9 3a __ CMP #$3a
250d : b0 3c __ BCS $254b ; (format_and_print_listline.s20 + 0)
.s31:
250f : 85 50 __ STA T4 + 0 
2511 : a5 48 __ LDA T1 + 0 
2513 : 85 29 __ STA ACCU + 0 ; (raw + 0)
2515 : a5 49 __ LDA T1 + 1 
2517 : 85 2a __ STA ACCU + 1 ; (raw + 1)
2519 : a5 4a __ LDA T1 + 2 
251b : 85 2b __ STA ACCU + 2 ; (rFile + 0)
251d : a5 4b __ LDA T1 + 3 
251f : 85 2c __ STA ACCU + 3 ; (rFile + 1)
2521 : a9 0a __ LDA #$0a
2523 : 20 98 72 JSR $7298 ; (mul32by8 + 0)
2526 : 38 __ __ SEC
2527 : a5 50 __ LDA T4 + 0 
2529 : e9 30 __ SBC #$30
252b : 18 __ __ CLC
252c : 65 15 __ ADC WORK + 4 
252e : 85 48 __ STA T1 + 0 
2530 : a5 16 __ LDA WORK + 5 
2532 : 69 00 __ ADC #$00
2534 : 85 49 __ STA T1 + 1 
2536 : a5 17 __ LDA WORK + 6 
2538 : 69 00 __ ADC #$00
253a : 85 4a __ STA T1 + 2 
253c : a5 18 __ LDA WORK + 7 
253e : 69 00 __ ADC #$00
2540 : 85 4b __ STA T1 + 3 
2542 : e6 4c __ INC T2 + 0 
2544 : d0 bd __ BNE $2503 ; (format_and_print_listline.l47 + 0)
.s48:
2546 : e6 4d __ INC T2 + 1 
2548 : 4c 03 25 JMP $2503 ; (format_and_print_listline.l47 + 0)
.s20:
254b : 84 1e __ STY P3 
254d : 18 __ __ CLC
254e : a5 48 __ LDA T1 + 0 
2550 : 69 ff __ ADC #$ff
2552 : a5 49 __ LDA T1 + 1 
2554 : 69 03 __ ADC #$03
2556 : 85 45 __ STA T0 + 0 
2558 : a5 4a __ LDA T1 + 2 
255a : 69 00 __ ADC #$00
255c : 85 46 __ STA T0 + 1 
255e : a5 4b __ LDA T1 + 3 
2560 : 69 00 __ ADC #$00
2562 : 4a __ __ LSR
2563 : 66 46 __ ROR T0 + 1 
2565 : 66 45 __ ROR T0 + 0 
2567 : 4a __ __ LSR
2568 : 85 47 __ STA T0 + 2 
256a : 85 1d __ STA P2 
256c : 66 46 __ ROR T0 + 1 
256e : 66 45 __ ROR T0 + 0 
2570 : a5 45 __ LDA T0 + 0 
2572 : 85 1b __ STA P0 
2574 : a5 46 __ LDA T0 + 1 
2576 : 85 1c __ STA P1 
2578 : a9 a8 __ LDA #$a8
257a : 85 1f __ STA P4 
257c : a9 9f __ LDA #$9f
257e : 85 20 __ STA P5 
2580 : 20 63 26 JSR $2663 ; (format_u32.s4 + 0)
2583 : a9 a8 __ LDA #$a8
2585 : 85 1b __ STA P0 
2587 : a9 9f __ LDA #$9f
2589 : 85 1c __ STA P1 
258b : 20 f7 26 JSR $26f7 ; (strlen.s4 + 0)
258e : a5 2a __ LDA ACCU + 1 ; (raw + 1)
2590 : 30 08 __ BMI $259a ; (format_and_print_listline.s21 + 0)
.s29:
2592 : d0 0d __ BNE $25a1 ; (format_and_print_listline.s27 + 0)
.s28:
2594 : a9 04 __ LDA #$04
2596 : c5 29 __ CMP ACCU + 0 ; (raw + 0)
2598 : 90 07 __ BCC $25a1 ; (format_and_print_listline.s27 + 0)
.s21:
259a : a9 27 __ LDA #$27
259c : a2 50 __ LDX #$50
259e : 4c ce 25 JMP $25ce ; (format_and_print_listline.s22 + 0)
.s27:
25a1 : a9 a8 __ LDA #$a8
25a3 : 85 1f __ STA P4 
25a5 : a9 9f __ LDA #$9f
25a7 : 85 20 __ STA P5 
25a9 : 18 __ __ CLC
25aa : a5 45 __ LDA T0 + 0 
25ac : 69 ff __ ADC #$ff
25ae : a5 46 __ LDA T0 + 1 
25b0 : 69 03 __ ADC #$03
25b2 : 85 1b __ STA P0 
25b4 : a5 47 __ LDA T0 + 2 
25b6 : 69 00 __ ADC #$00
25b8 : 4a __ __ LSR
25b9 : 85 1c __ STA P1 
25bb : a9 00 __ LDA #$00
25bd : 85 1d __ STA P2 
25bf : 66 1b __ ROR P0 
25c1 : 85 1e __ STA P3 
25c3 : 46 1c __ LSR P1 
25c5 : 66 1b __ ROR P0 
25c7 : 20 63 26 JSR $2663 ; (format_u32.s4 + 0)
25ca : a9 27 __ LDA #$27
25cc : a2 4e __ LDX #$4e
.s22:
25ce : 86 1d __ STX P2 
25d0 : 85 1e __ STA P3 
25d2 : a9 a8 __ LDA #$a8
25d4 : 85 1b __ STA P0 
25d6 : a9 9f __ LDA #$9f
25d8 : 85 1c __ STA P1 
25da : 20 13 27 JSR $2713 ; (strcat.s4 + 0)
25dd : ad d0 9f LDA $9fd0 ; (sstack + 4)
25e0 : 85 4c __ STA T2 + 0 
25e2 : a9 0a __ LDA #$0a
25e4 : 85 1b __ STA P0 
25e6 : a9 00 __ LDA #$00
25e8 : 85 1c __ STA P1 
25ea : ad d1 9f LDA $9fd1 ; (sstack + 5)
25ed : 85 4d __ STA T2 + 1 
25ef : a5 48 __ LDA T1 + 0 
25f1 : a0 18 __ LDY #$18
25f3 : 91 4c __ STA (T2 + 0),y 
25f5 : a5 49 __ LDA T1 + 1 
25f7 : c8 __ __ INY
25f8 : 91 4c __ STA (T2 + 0),y 
25fa : a5 4a __ LDA T1 + 2 
25fc : c8 __ __ INY
25fd : 91 4c __ STA (T2 + 0),y 
25ff : a5 4b __ LDA T1 + 3 
2601 : c8 __ __ INY
2602 : 91 4c __ STA (T2 + 0),y 
2604 : 20 ff 14 JSR $14ff ; (textSetColor.s4 + 0)
2607 : 20 ff 14 JSR $14ff ; (textSetColor.s4 + 0)
260a : a9 a8 __ LDA #$a8
260c : 85 25 __ STA P10 
260e : a9 06 __ LDA #$06
2610 : 8d cc 9f STA $9fcc ; (sstack + 0)
2613 : a9 9f __ LDA #$9f
2615 : 85 26 __ STA P11 
2617 : 20 52 27 JSR $2752 ; (print_right.s4 + 0)
261a : a9 88 __ LDA #$88
261c : 85 23 __ STA P8 
261e : a9 27 __ LDA #$27
2620 : 85 24 __ STA P9 
2622 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
2625 : a9 0f __ LDA #$0f
2627 : 85 1b __ STA P0 
2629 : a9 00 __ LDA #$00
262b : 85 1c __ STA P1 
262d : 20 ff 14 JSR $14ff ; (textSetColor.s4 + 0)
2630 : a5 4e __ LDA T3 + 0 
2632 : 85 23 __ STA P8 
2634 : a5 4f __ LDA T3 + 1 
2636 : 85 24 __ STA P9 
2638 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
263b : a0 ff __ LDY #$ff
.l23:
263d : c8 __ __ INY
263e : b1 23 __ LDA (P8),y 
2640 : 91 4c __ STA (T2 + 0),y 
2642 : d0 f9 __ BNE $263d ; (format_and_print_listline.l23 + 0)
.s24:
2644 : a5 51 __ LDA T5 + 0 
2646 : f0 0d __ BEQ $2655 ; (format_and_print_listline.s25 + 0)
.s26:
2648 : a9 fd __ LDA #$fd
264a : 85 23 __ STA P8 
264c : a9 14 __ LDA #$14
264e : 85 24 __ STA P9 
2650 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
2653 : a9 01 __ LDA #$01
.s25:
2655 : a0 1c __ LDY #$1c
2657 : 91 4c __ STA (T2 + 0),y 
2659 : 4c c1 24 JMP $24c1 ; (format_and_print_listline.s41 + 0)
--------------------------------------------------------------------
265c : __ __ __ BYT 74 6f 74 61 6c 20 00                            : total .
--------------------------------------------------------------------
format_u32: ; format_u32(u32,u8*)->void
; 566, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s4:
2663 : a5 1e __ LDA P3 ; (v + 3)
2665 : d0 17 __ BNE $267e ; (format_u32.s5 + 0)
.s14:
2667 : a5 1d __ LDA P2 ; (v + 2)
2669 : d0 13 __ BNE $267e ; (format_u32.s5 + 0)
.s15:
266b : a5 1c __ LDA P1 ; (v + 1)
266d : d0 0f __ BNE $267e ; (format_u32.s5 + 0)
.s16:
266f : a5 1b __ LDA P0 ; (v + 0)
2671 : d0 0b __ BNE $267e ; (format_u32.s5 + 0)
.s13:
2673 : a9 30 __ LDA #$30
2675 : a0 00 __ LDY #$00
2677 : 91 1f __ STA (P4),y ; (out + 0)
2679 : 98 __ __ TYA
267a : c8 __ __ INY
.s3:
267b : 91 1f __ STA (P4),y ; (out + 0)
267d : 60 __ __ RTS
.s5:
267e : a9 00 __ LDA #$00
2680 : 85 35 __ STA T3 + 0 
2682 : a5 1e __ LDA P3 ; (v + 3)
2684 : d0 31 __ BNE $26b7 ; (format_u32.l9 + 0)
.s10:
2686 : a5 1d __ LDA P2 ; (v + 2)
2688 : d0 2d __ BNE $26b7 ; (format_u32.l9 + 0)
.s11:
268a : a5 1c __ LDA P1 ; (v + 1)
268c : d0 29 __ BNE $26b7 ; (format_u32.l9 + 0)
.s12:
268e : c5 1b __ CMP P0 ; (v + 0)
2690 : 90 25 __ BCC $26b7 ; (format_u32.l9 + 0)
.s6:
2692 : a6 35 __ LDX T3 + 0 
2694 : f0 1d __ BEQ $26b3 ; (format_u32.s7 + 0)
.s8:
2696 : a5 20 __ LDA P5 ; (out + 1)
2698 : 85 1c __ STA P1 ; (v + 1)
269a : a9 00 __ LDA #$00
269c : 85 1b __ STA P0 ; (v + 0)
269e : a4 1f __ LDY P4 ; (out + 0)
.l17:
26a0 : bd c0 9f LDA $9fc0,x ; (keyName[0] + 108)
26a3 : 91 1b __ STA (P0),y ; (v + 0)
26a5 : c8 __ __ INY
26a6 : d0 02 __ BNE $26aa ; (format_u32.s22 + 0)
.s21:
26a8 : e6 1c __ INC P1 ; (v + 1)
.s22:
26aa : ca __ __ DEX
26ab : d0 f3 __ BNE $26a0 ; (format_u32.l17 + 0)
.s18:
26ad : 84 1f __ STY P4 ; (out + 0)
26af : a5 1c __ LDA P1 ; (v + 1)
26b1 : 85 20 __ STA P5 ; (out + 1)
.s7:
26b3 : 8a __ __ TXA
26b4 : a8 __ __ TAY
26b5 : b0 c4 __ BCS $267b ; (format_u32.s3 + 0)
.l9:
26b7 : a5 1b __ LDA P0 ; (v + 0)
26b9 : 85 29 __ STA ACCU + 0 
26bb : a5 1c __ LDA P1 ; (v + 1)
26bd : 85 2a __ STA ACCU + 1 
26bf : a5 1d __ LDA P2 ; (v + 2)
26c1 : 85 2b __ STA ACCU + 2 
26c3 : a5 1e __ LDA P3 ; (v + 3)
.l20:
26c5 : 85 2c __ STA ACCU + 3 
26c7 : a9 00 __ LDA #$00
26c9 : 85 12 __ STA WORK + 1 
26cb : 85 13 __ STA WORK + 2 
26cd : 85 14 __ STA WORK + 3 
26cf : a9 0a __ LDA #$0a
26d1 : 85 11 __ STA WORK + 0 
26d3 : 20 37 77 JSR $7737 ; (divmod32 + 0)
26d6 : 18 __ __ CLC
26d7 : a5 15 __ LDA WORK + 4 
26d9 : 69 30 __ ADC #$30
26db : a6 35 __ LDX T3 + 0 
26dd : 9d c1 9f STA $9fc1,x ; (tmp[0] + 0)
26e0 : e6 35 __ INC T3 + 0 
26e2 : a5 2c __ LDA ACCU + 3 
26e4 : d0 df __ BNE $26c5 ; (format_u32.l20 + 0)
.s19:
26e6 : 85 1e __ STA P3 ; (v + 3)
26e8 : a5 2b __ LDA ACCU + 2 
26ea : 85 1d __ STA P2 ; (v + 2)
26ec : a5 2a __ LDA ACCU + 1 
26ee : 85 1c __ STA P1 ; (v + 1)
26f0 : a5 29 __ LDA ACCU + 0 
26f2 : 85 1b __ STA P0 ; (v + 0)
26f4 : 4c 86 26 JMP $2686 ; (format_u32.s10 + 0)
--------------------------------------------------------------------
strlen: ; strlen(const u8*)->i16
;  12, "/mnt/d/F256/oscar64/include/string.h"
.s4:
26f7 : a9 00 __ LDA #$00
26f9 : 85 29 __ STA ACCU + 0 
26fb : 85 2a __ STA ACCU + 1 
26fd : a8 __ __ TAY
26fe : b1 1b __ LDA (P0),y ; (str + 0)
2700 : f0 10 __ BEQ $2712 ; (strlen.s3 + 0)
.s6:
2702 : a2 00 __ LDX #$00
.l7:
2704 : c8 __ __ INY
2705 : d0 03 __ BNE $270a ; (strlen.s9 + 0)
.s8:
2707 : e6 1c __ INC P1 ; (str + 1)
2709 : e8 __ __ INX
.s9:
270a : b1 1b __ LDA (P0),y ; (str + 0)
270c : d0 f6 __ BNE $2704 ; (strlen.l7 + 0)
.s5:
270e : 86 2a __ STX ACCU + 1 
2710 : 84 29 __ STY ACCU + 0 
.s3:
2712 : 60 __ __ RTS
--------------------------------------------------------------------
strcat: ; strcat(u8*,const u8*)->u8*
;  14, "/mnt/d/F256/oscar64/include/string.h"
.s4:
2713 : a5 1b __ LDA P0 ; (dst + 0)
2715 : 85 29 __ STA ACCU + 0 
2717 : a5 1c __ LDA P1 ; (dst + 1)
2719 : 85 2a __ STA ACCU + 1 
271b : a0 00 __ LDY #$00
271d : b1 1b __ LDA (P0),y ; (dst + 0)
271f : f0 0f __ BEQ $2730 ; (strcat.s5 + 0)
.s7:
2721 : 84 29 __ STY ACCU + 0 
2723 : a4 1b __ LDY P0 ; (dst + 0)
.l8:
2725 : c8 __ __ INY
2726 : d0 02 __ BNE $272a ; (strcat.s12 + 0)
.s11:
2728 : e6 2a __ INC ACCU + 1 
.s12:
272a : b1 29 __ LDA (ACCU + 0),y 
272c : d0 f7 __ BNE $2725 ; (strcat.l8 + 0)
.s9:
272e : 84 29 __ STY ACCU + 0 
.s5:
2730 : a8 __ __ TAY
.l10:
2731 : b1 1d __ LDA (P2),y ; (src + 0)
2733 : 91 29 __ STA (ACCU + 0),y 
2735 : aa __ __ TAX
2736 : e6 1d __ INC P2 ; (src + 0)
2738 : d0 02 __ BNE $273c ; (strcat.s14 + 0)
.s13:
273a : e6 1e __ INC P3 ; (src + 1)
.s14:
273c : e6 29 __ INC ACCU + 0 
273e : d0 02 __ BNE $2742 ; (strcat.s16 + 0)
.s15:
2740 : e6 2a __ INC ACCU + 1 
.s16:
2742 : 8a __ __ TXA
2743 : d0 ec __ BNE $2731 ; (strcat.l10 + 0)
.s6:
2745 : a5 1b __ LDA P0 ; (dst + 0)
2747 : 85 29 __ STA ACCU + 0 
2749 : a5 1c __ LDA P1 ; (dst + 1)
274b : 85 2a __ STA ACCU + 1 
.s3:
274d : 60 __ __ RTS
--------------------------------------------------------------------
274e : __ __ __ BYT 4d 00                                           : M.
--------------------------------------------------------------------
2750 : __ __ __ BYT 4b 00                                           : K.
--------------------------------------------------------------------
print_right: ; print_right(const u8*,u8)->void
; 559, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s4:
2752 : a5 25 __ LDA P10 ; (s + 0)
2754 : 85 1b __ STA P0 
2756 : a5 26 __ LDA P11 ; (s + 1)
2758 : 85 1c __ STA P1 
275a : 20 f7 26 JSR $26f7 ; (strlen.s4 + 0)
275d : ad cc 9f LDA $9fcc ; (sstack + 0)
2760 : 85 44 __ STA T4 + 0 
2762 : a5 29 __ LDA ACCU + 0 
2764 : c5 44 __ CMP T4 + 0 
2766 : b0 15 __ BCS $277d ; (print_right.s5 + 0)
.s6:
2768 : 85 43 __ STA T1 + 0 
276a : a9 74 __ LDA #$74
276c : 85 23 __ STA P8 
276e : a9 17 __ LDA #$17
2770 : 85 24 __ STA P9 
.l7:
2772 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
2775 : e6 43 __ INC T1 + 0 
2777 : a5 43 __ LDA T1 + 0 
2779 : c5 44 __ CMP T4 + 0 
277b : 90 f5 __ BCC $2772 ; (print_right.l7 + 0)
.s5:
277d : a5 25 __ LDA P10 ; (s + 0)
277f : 85 23 __ STA P8 
2781 : a5 26 __ LDA P11 ; (s + 1)
2783 : 85 24 __ STA P9 
2785 : 4c 0c 15 JMP $150c ; (textPrint.s4 + 0)
--------------------------------------------------------------------
2788 : __ __ __ BYT 20 20 00                                        :   .
--------------------------------------------------------------------
flush_filebuf: ; flush_filebuf()->void
; 363, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s4:
278b : ad b8 79 LDA $79b8 ; (filebuf_len + 0)
278e : f0 36 __ BEQ $27c6 ; (flush_filebuf.s5 + 0)
.s6:
2790 : ad bd 79 LDA $79bd ; (out_fp + 0)
2793 : 0d be 79 ORA $79be ; (out_fp + 1)
2796 : f0 2e __ BEQ $27c6 ; (flush_filebuf.s5 + 0)
.s7:
2798 : a9 01 __ LDA #$01
279a : 8d d2 9f STA $9fd2 ; (sstack + 6)
279d : ad bd 79 LDA $79bd ; (out_fp + 0)
27a0 : 8d d6 9f STA $9fd6 ; (sstack + 10)
27a3 : ad be 79 LDA $79be ; (out_fp + 1)
27a6 : 8d d7 9f STA $9fd7 ; (sstack + 11)
27a9 : ad b8 79 LDA $79b8 ; (filebuf_len + 0)
27ac : 8d d4 9f STA $9fd4 ; (sstack + 8)
27af : a9 00 __ LDA #$00
27b1 : 8d d3 9f STA $9fd3 ; (sstack + 7)
27b4 : 8d d5 9f STA $9fd5 ; (sstack + 9)
27b7 : a9 08 __ LDA #$08
27b9 : 8d d0 9f STA $9fd0 ; (sstack + 4)
27bc : a9 80 __ LDA #$80
27be : 8d d1 9f STA $9fd1 ; (sstack + 5)
27c1 : 20 ca 27 JSR $27ca ; (fileWrite.s4 + 0)
27c4 : a9 00 __ LDA #$00
.s5:
27c6 : 8d b8 79 STA $79b8 ; (filebuf_len + 0)
.s3:
27c9 : 60 __ __ RTS
--------------------------------------------------------------------
fileWrite: ; fileWrite(void*,u16,u16,u8*)->i16
;  34, "/mnt/d/F256/f256lib-oscar64/f256lib/f_file.h"
.s4:
27ca : a9 00 __ LDA #$00
27cc : 85 49 __ STA T1 + 0 
27ce : 85 4a __ STA T1 + 1 
27d0 : ad d2 9f LDA $9fd2 ; (sstack + 6)
27d3 : 85 4b __ STA T2 + 0 
27d5 : 85 11 __ STA WORK + 0 
27d7 : ad d3 9f LDA $9fd3 ; (sstack + 7)
27da : 85 4c __ STA T2 + 1 
27dc : 85 12 __ STA WORK + 1 
27de : ad d4 9f LDA $9fd4 ; (sstack + 8)
27e1 : 85 29 __ STA ACCU + 0 
27e3 : ad d5 9f LDA $9fd5 ; (sstack + 9)
27e6 : 85 2a __ STA ACCU + 1 
27e8 : 20 76 75 JSR $7576 ; (mul16 + 0)
27eb : a5 14 __ LDA WORK + 3 
27ed : 05 13 __ ORA WORK + 2 
27ef : f0 77 __ BEQ $2868 ; (fileWrite.s5 + 0)
.s6:
27f1 : a5 14 __ LDA WORK + 3 
27f3 : 85 4e __ STA T3 + 1 
27f5 : a5 13 __ LDA WORK + 2 
27f7 : 85 4d __ STA T3 + 0 
27f9 : ad d0 9f LDA $9fd0 ; (sstack + 4)
27fc : 85 4f __ STA T4 + 0 
27fe : ad d1 9f LDA $9fd1 ; (sstack + 5)
2801 : 85 50 __ STA T4 + 1 
2803 : ad d6 9f LDA $9fd6 ; (sstack + 10)
2806 : 85 51 __ STA T5 + 0 
2808 : ad d7 9f LDA $9fd7 ; (sstack + 11)
280b : 85 52 __ STA T5 + 1 
.l7:
280d : a0 00 __ LDY #$00
280f : b1 51 __ LDA (T5 + 0),y 
2811 : 85 26 __ STA P11 
2813 : 18 __ __ CLC
2814 : a5 4f __ LDA T4 + 0 
2816 : 65 49 __ ADC T1 + 0 
2818 : 8d cc 9f STA $9fcc ; (sstack + 0)
281b : a5 50 __ LDA T4 + 1 
281d : 65 4a __ ADC T1 + 1 
281f : 8d cd 9f STA $9fcd ; (sstack + 1)
2822 : a5 4e __ LDA T3 + 1 
2824 : 10 05 __ BPL $282b ; (fileWrite.s14 + 0)
.s15:
2826 : a5 4d __ LDA T3 + 0 
2828 : 4c 35 28 JMP $2835 ; (fileWrite.s8 + 0)
.s14:
282b : d0 06 __ BNE $2833 ; (fileWrite.s12 + 0)
.s13:
282d : a5 4d __ LDA T3 + 0 
282f : c9 ff __ CMP #$ff
2831 : 90 02 __ BCC $2835 ; (fileWrite.s8 + 0)
.s12:
2833 : a9 fe __ LDA #$fe
.s8:
2835 : 84 36 __ STY T0 + 1 
2837 : 8c cf 9f STY $9fcf ; (sstack + 3)
283a : 85 35 __ STA T0 + 0 
283c : 8d ce 9f STA $9fce ; (sstack + 2)
283f : 20 82 28 JSR $2882 ; (kernelWrite.s4 + 0)
2842 : a5 2a __ LDA ACCU + 1 
2844 : 30 35 __ BMI $287b ; (fileWrite.s10 + 0)
.s11:
2846 : 05 29 __ ORA ACCU + 0 
2848 : f0 31 __ BEQ $287b ; (fileWrite.s10 + 0)
.s9:
284a : 18 __ __ CLC
284b : a5 49 __ LDA T1 + 0 
284d : 65 29 __ ADC ACCU + 0 
284f : 85 49 __ STA T1 + 0 
2851 : a5 4a __ LDA T1 + 1 
2853 : 65 2a __ ADC ACCU + 1 
2855 : 85 4a __ STA T1 + 1 
2857 : 38 __ __ SEC
2858 : a5 4d __ LDA T3 + 0 
285a : e5 29 __ SBC ACCU + 0 
285c : 85 4d __ STA T3 + 0 
285e : a5 4e __ LDA T3 + 1 
2860 : e5 2a __ SBC ACCU + 1 
2862 : 85 4e __ STA T3 + 1 
2864 : 05 4d __ ORA T3 + 0 
2866 : d0 a5 __ BNE $280d ; (fileWrite.l7 + 0)
.s5:
2868 : a5 49 __ LDA T1 + 0 
286a : 85 29 __ STA ACCU + 0 
286c : a5 4a __ LDA T1 + 1 
286e : 85 2a __ STA ACCU + 1 
2870 : a5 4b __ LDA T2 + 0 
2872 : 85 11 __ STA WORK + 0 
2874 : a5 4c __ LDA T2 + 1 
2876 : 85 12 __ STA WORK + 1 
2878 : 4c f2 75 JMP $75f2 ; (divmod + 0)
.s10:
287b : a9 ff __ LDA #$ff
287d : 85 29 __ STA ACCU + 0 
287f : 85 2a __ STA ACCU + 1 
.s3:
2881 : 60 __ __ RTS
--------------------------------------------------------------------
kernelWrite: ; kernelWrite(u8,void*,u16)->i16
;  32, "/mnt/d/F256/f256lib-oscar64/f256lib/f_file.c"
.s4:
2882 : ad ce 9f LDA $9fce ; (sstack + 2)
2885 : 85 45 __ STA T2 + 0 
2887 : ad cf 9f LDA $9fcf ; (sstack + 3)
288a : a6 26 __ LDX P11 ; (fd + 0)
288c : ca __ __ DEX
288d : f0 52 __ BEQ $28e1 ; (kernelWrite.s10 + 0)
.s5:
288f : a9 64 __ LDA #$64
2891 : 8d cb 7a STA $7acb ; (_kern_target + 0)
2894 : a9 ff __ LDA #$ff
2896 : 8d cc 7a STA $7acc ; (_kern_target + 1)
2899 : ad 64 7a LDA $7a64 ; (kernelArgs + 0)
289c : 85 43 __ STA T0 + 0 
289e : ad 65 7a LDA $7a65 ; (kernelArgs + 1)
28a1 : 85 44 __ STA T0 + 1 
28a3 : a5 26 __ LDA P11 ; (fd + 0)
28a5 : a0 03 __ LDY #$03
28a7 : 91 43 __ STA (T0 + 0),y 
28a9 : ad cc 9f LDA $9fcc ; (sstack + 0)
28ac : a0 0b __ LDY #$0b
28ae : 91 43 __ STA (T0 + 0),y 
28b0 : ad cd 9f LDA $9fcd ; (sstack + 1)
28b3 : c8 __ __ INY
28b4 : 91 43 __ STA (T0 + 0),y 
28b6 : a5 45 __ LDA T2 + 0 
28b8 : c8 __ __ INY
28b9 : 91 43 __ STA (T0 + 0),y 
28bb : 20 2f 29 JSR $292f ; (_kernelCallWrapper.s4 + 0)
28be : ad cd 7a LDA $7acd ; (_kernelError + 0)
28c1 : d0 0e __ BNE $28d1 ; (kernelWrite.s8 + 0)
.l6:
28c3 : 20 4f 29 JSR $294f ; (kernelNextEvent.s4 + 0)
28c6 : ad 66 7a LDA $7a66 ; (kernelEventData.type + 0)
28c9 : c9 2e __ CMP #$2e
28cb : f0 0b __ BEQ $28d8 ; (kernelWrite.s9 + 0)
.s7:
28cd : c9 38 __ CMP #$38
28cf : d0 f2 __ BNE $28c3 ; (kernelWrite.l6 + 0)
.s8:
28d1 : a9 ff __ LDA #$ff
28d3 : 85 29 __ STA ACCU + 0 ; (nbytes + 0)
.s3:
28d5 : 85 2a __ STA ACCU + 1 ; (nbytes + 1)
28d7 : 60 __ __ RTS
.s9:
28d8 : ad 6c 7a LDA $7a6c ; (kernelEventData.u + 3)
28db : 85 29 __ STA ACCU + 0 ; (nbytes + 0)
28dd : a9 00 __ LDA #$00
28df : f0 f4 __ BEQ $28d5 ; (kernelWrite.s3 + 0)
.s10:
28e1 : 86 43 __ STX T0 + 0 
28e3 : 86 44 __ STX T0 + 1 
28e5 : 85 46 __ STA T2 + 1 
28e7 : a5 45 __ LDA T2 + 0 
28e9 : 05 46 __ ORA T2 + 1 
28eb : f0 3d __ BEQ $292a ; (kernelWrite.s20 + 0)
.s12:
28ed : ad cc 9f LDA $9fcc ; (sstack + 0)
28f0 : 85 47 __ STA T3 + 0 
28f2 : ad cd 9f LDA $9fcd ; (sstack + 1)
28f5 : 85 48 __ STA T3 + 1 
28f7 : a9 bf __ LDA #$bf
28f9 : 85 23 __ STA P8 
28fb : a9 79 __ LDA #$79
28fd : 85 24 __ STA P9 
.l13:
28ff : a0 00 __ LDY #$00
2901 : b1 47 __ LDA (T3 + 0),y 
2903 : 8d bf 79 STA $79bf ; (s[0] + 0)
2906 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
2909 : e6 47 __ INC T3 + 0 
290b : d0 02 __ BNE $290f ; (kernelWrite.s16 + 0)
.s15:
290d : e6 48 __ INC T3 + 1 
.s16:
290f : e6 43 __ INC T0 + 0 
2911 : d0 02 __ BNE $2915 ; (kernelWrite.s18 + 0)
.s17:
2913 : e6 44 __ INC T0 + 1 
.s18:
2915 : a5 44 __ LDA T0 + 1 
2917 : c5 46 __ CMP T2 + 1 
2919 : 90 e4 __ BCC $28ff ; (kernelWrite.l13 + 0)
.s19:
291b : d0 0d __ BNE $292a ; (kernelWrite.s20 + 0)
.s14:
291d : a5 43 __ LDA T0 + 0 
291f : c5 45 __ CMP T2 + 0 
2921 : 90 dc __ BCC $28ff ; (kernelWrite.l13 + 0)
.s11:
2923 : 85 29 __ STA ACCU + 0 ; (nbytes + 0)
2925 : a5 44 __ LDA T0 + 1 
2927 : 4c d5 28 JMP $28d5 ; (kernelWrite.s3 + 0)
.s20:
292a : a5 43 __ LDA T0 + 0 
292c : 4c 23 29 JMP $2923 ; (kernelWrite.s11 + 0)
--------------------------------------------------------------------
_kernelCallWrapper: ; _kernelCallWrapper()->u8
;  56, "/mnt/d/F256/f256lib-oscar64/f256lib/f_kernel.h"
.s4:
292f : 20 37 29 JSR $2937 ; (_kernelCallRaw + 0)
2932 : 85 29 __ STA ACCU + 0 
.s3:
2934 : a5 29 __ LDA ACCU + 0 
2936 : 60 __ __ RTS
--------------------------------------------------------------------
_kernelCallRaw: ; _kernelCallRaw
2937 : ad cb 7a LDA $7acb ; (_kern_target + 0)
293a : 8d 44 29 STA $2944 ; (_kernelCallRaw + 13)
293d : ad cc 7a LDA $7acc ; (_kern_target + 1)
2940 : 8d 45 29 STA $2945 ; (_kernelCallRaw + 14)
2943 : 20 00 00 JSR $0000 
2946 : aa __ __ TAX
2947 : a9 00 __ LDA #$00
2949 : 6a __ __ ROR
294a : 8d cd 7a STA $7acd ; (_kernelError + 0)
294d : 8a __ __ TXA
294e : 60 __ __ RTS
--------------------------------------------------------------------
kernelNextEvent: ; kernelNextEvent()->u8
;  66, "/mnt/d/F256/f256lib-oscar64/f256lib/f_kernel.h"
.s4:
294f : a9 00 __ LDA #$00
2951 : 8d cb 7a STA $7acb ; (_kern_target + 0)
2954 : 8d 66 7a STA $7a66 ; (kernelEventData.type + 0)
2957 : a9 ff __ LDA #$ff
2959 : 8d cc 7a STA $7acc ; (_kern_target + 1)
295c : 4c 2f 29 JMP $292f ; (_kernelCallWrapper.s4 + 0)
--------------------------------------------------------------------
295f : __ __ __ BYT 41 54 00                                        : AT.
--------------------------------------------------------------------
2962 : __ __ __ BYT 41 54 45 30 00                                  : ATE0.
--------------------------------------------------------------------
2967 : __ __ __ BYT 41 54 2b 43 57 4d 4f 44 45 3d 31 00             : AT+CWMODE=1.
--------------------------------------------------------------------
2973 : __ __ __ BYT 41 54 2b 43 57 44 48 43 50 3d 31 2c 31 00       : AT+CWDHCP=1,1.
--------------------------------------------------------------------
2981 : __ __ __ BYT 41 54 2b 43 49 50 4d 55 58 3d 31 00             : AT+CIPMUX=1.
--------------------------------------------------------------------
298d : __ __ __ BYT 57 69 7a 46 69 20 69 6e 69 74 20 66 61 69 6c 65 : WizFi init faile
299d : __ __ __ BYT 64 20 2d 20 63 68 65 63 6b 20 77 69 72 69 6e 67 : d - check wiring
29ad : __ __ __ BYT 2f 70 6f 77 65 72 2e 00                         : /power..
--------------------------------------------------------------------
29b5 : __ __ __ BYT 4d 6f 64 65 6d 20 72 65 61 64 79 2e 20 54 79 70 : Modem ready. Typ
29c5 : __ __ __ BYT 65 20 27 68 65 6c 70 27 20 66 6f 72 20 63 6f 6d : e 'help' for com
29d5 : __ __ __ BYT 6d 61 6e 64 73 2e 00                            : mands..
--------------------------------------------------------------------
29dc : __ __ __ BYT 30 00                                           : 0.
--------------------------------------------------------------------
29de : __ __ __ BYT 2e 00                                           : ..
--------------------------------------------------------------------
29e0 : __ __ __ BYT 37 00                                           : 7.
--------------------------------------------------------------------
29e2 : __ __ __ BYT 41 75 67 00                                     : Aug.
--------------------------------------------------------------------
29e6 : __ __ __ BYT 32 30 32 36 00                                  : 2026.
--------------------------------------------------------------------
29eb : __ __ __ BYT 41 54 2b 43 57 4a 41 50 3f 00                   : AT+CWJAP?.
--------------------------------------------------------------------
29f5 : __ __ __ BYT 2b 43 57 4a 41 50 3a 00                         : +CWJAP:.
--------------------------------------------------------------------
29fd : __ __ __ BYT 2e 2e 00                                        : ...
--------------------------------------------------------------------
2a00 : __ __ __ BYT 57 69 66 69 3a 20 20 20 20 20 20 20 20 20 20 20 : Wifi:           
2a10 : __ __ __ BYT 20 20 20 20 20 46 54 50 3a 20 20 20 20 20 20 20 :      FTP:       
2a20 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
2a30 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 6d 75 46 54 50 :            muFTP
2a40 : __ __ __ BYT 20 76 00                                        :  v.
--------------------------------------------------------------------
wiz_get_ssid: ; wiz_get_ssid(u8*,u8)->bool
; 837, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s1:
2a43 : a5 55 __ LDA T2 + 0 
2a45 : 8d a1 9f STA $9fa1 ; (wiz_get_ssid@stack + 0)
2a48 : a5 56 __ LDA T2 + 1 
2a4a : 8d a2 9f STA $9fa2 ; (wiz_get_ssid@stack + 1)
.s4:
2a4d : a9 e8 __ LDA #$e8
2a4f : 8d df 9f STA $9fdf ; (sstack + 19)
2a52 : a9 03 __ LDA #$03
2a54 : 8d e0 9f STA $9fe0 ; (sstack + 20)
2a57 : ad e1 9f LDA $9fe1 ; (sstack + 21)
2a5a : 85 55 __ STA T2 + 0 
2a5c : ad e2 9f LDA $9fe2 ; (sstack + 22)
2a5f : 85 56 __ STA T2 + 1 
2a61 : a9 00 __ LDA #$00
2a63 : a8 __ __ TAY
2a64 : 91 55 __ STA (T2 + 0),y 
2a66 : a9 eb __ LDA #$eb
2a68 : 8d dd 9f STA $9fdd ; (sstack + 17)
2a6b : a9 29 __ LDA #$29
2a6d : 8d de 9f STA $9fde ; (sstack + 18)
2a70 : 20 c5 19 JSR $19c5 ; (wiz_atcmd.s4 + 0)
2a73 : a5 29 __ LDA ACCU + 0 
2a75 : f0 25 __ BEQ $2a9c ; (wiz_get_ssid.s5 + 0)
.s6:
2a77 : a9 07 __ LDA #$07
2a79 : 85 1f __ STA P4 
2a7b : a9 29 __ LDA #$29
2a7d : 85 1e __ STA P3 
2a7f : a9 00 __ LDA #$00
2a81 : 85 20 __ STA P5 
2a83 : a9 00 __ LDA #$00
2a85 : 85 1b __ STA P0 
2a87 : a9 7b __ LDA #$7b
2a89 : 85 1c __ STA P1 
2a8b : a9 f5 __ LDA #$f5
2a8d : 85 1d __ STA P2 
2a8f : 20 8a 1e JSR $1e8a ; (strncmp.s4 + 0)
2a92 : aa __ __ TAX
2a93 : d0 07 __ BNE $2a9c ; (wiz_get_ssid.s5 + 0)
.s7:
2a95 : ad 07 7b LDA $7b07 ; (at_resp_line[0] + 7)
2a98 : c9 22 __ CMP #$22
2a9a : f0 0f __ BEQ $2aab ; (wiz_get_ssid.s8 + 0)
.s5:
2a9c : a9 00 __ LDA #$00
.s3:
2a9e : 85 29 __ STA ACCU + 0 
2aa0 : ad a1 9f LDA $9fa1 ; (wiz_get_ssid@stack + 0)
2aa3 : 85 55 __ STA T2 + 0 
2aa5 : ad a2 9f LDA $9fa2 ; (wiz_get_ssid@stack + 1)
2aa8 : 85 56 __ STA T2 + 1 
2aaa : 60 __ __ RTS
.s8:
2aab : a0 00 __ LDY #$00
2aad : ad 08 7b LDA $7b08 ; (at_resp_line[0] + 8)
2ab0 : f0 28 __ BEQ $2ada ; (wiz_get_ssid.s9 + 0)
.s10:
2ab2 : a2 08 __ LDX #$08
2ab4 : 86 3a __ STX T4 + 0 
.l11:
2ab6 : bd 00 7b LDA $7b00,x ; (at_resp_line[0] + 0)
2ab9 : c9 22 __ CMP #$22
2abb : f0 1d __ BEQ $2ada ; (wiz_get_ssid.s9 + 0)
.s12:
2abd : ad e3 9f LDA $9fe3 ; (sstack + 23)
2ac0 : 38 __ __ SEC
2ac1 : e9 01 __ SBC #$01
2ac3 : 90 15 __ BCC $2ada ; (wiz_get_ssid.s9 + 0)
.s14:
2ac5 : 85 37 __ STA T1 + 0 
2ac7 : c4 37 __ CPY T1 + 0 
2ac9 : b0 0f __ BCS $2ada ; (wiz_get_ssid.s9 + 0)
.s13:
2acb : bd 00 7b LDA $7b00,x ; (at_resp_line[0] + 0)
2ace : 91 55 __ STA (T2 + 0),y 
2ad0 : e6 3a __ INC T4 + 0 
2ad2 : a6 3a __ LDX T4 + 0 
2ad4 : c8 __ __ INY
2ad5 : bd 00 7b LDA $7b00,x ; (at_resp_line[0] + 0)
2ad8 : d0 dc __ BNE $2ab6 ; (wiz_get_ssid.l11 + 0)
.s9:
2ada : a9 00 __ LDA #$00
2adc : 91 55 __ STA (T2 + 0),y 
2ade : a9 01 __ LDA #$01
2ae0 : d0 bc __ BNE $2a9e ; (wiz_get_ssid.s3 + 0)
--------------------------------------------------------------------
2ae2 : __ __ __ BYT 6e 6f 74 20 63 6f 6e 6e 65 63 74 65 64 00       : not connected.
--------------------------------------------------------------------
showFilesInDirectory: ; showFilesInDirectory(u8,u8)->void
;  58, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/muFilePicker.h"
.s4:
2af0 : ad de 9f LDA $9fde ; (sstack + 18)
2af3 : 85 22 __ STA P7 
2af5 : ad df 9f LDA $9fdf ; (sstack + 19)
2af8 : 85 23 __ STA P8 
2afa : a9 01 __ LDA #$01
2afc : 85 24 __ STA P9 
2afe : 20 2b 2b JSR $2b2b ; (initFilePickRecord_far.s4 + 0)
2b01 : a9 00 __ LDA #$00
2b03 : 85 25 __ STA P10 
2b05 : 20 a1 2c JSR $2ca1 ; (readDirectory_far.s4 + 0)
2b08 : 20 56 31 JSR $3156 ; (sortFileList_far.s4 + 0)
2b0b : a9 4a __ LDA #$4a
2b0d : 85 1b __ STA P0 
2b0f : a9 00 __ LDA #$00
2b11 : 85 1e __ STA P3 
2b13 : a9 5f __ LDA #$5f
2b15 : 85 1c __ STA P1 
2b17 : a9 03 __ LDA #$03
2b19 : 85 1d __ STA P2 
2b1b : 20 c0 34 JSR $34c0 ; (FAR_PEEKW.s4 + 0)
2b1e : a5 29 __ LDA ACCU + 0 
2b20 : 8d dc 9f STA $9fdc ; (sstack + 16)
2b23 : a5 2a __ LDA ACCU + 1 
2b25 : 8d dd 9f STA $9fdd ; (sstack + 17)
2b28 : 4c 74 35 JMP $3574 ; (displayFileList_far.s1 + 0)
--------------------------------------------------------------------
initFilePickRecord_far: ; initFilePickRecord_far(u8,u8,bool)->void
;  68, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/muFilePicker.h"
.s4:
2b2b : a9 00 __ LDA #$00
2b2d : 85 1e __ STA P3 
2b2f : 85 41 __ STA T1 + 0 
2b31 : 85 1f __ STA P4 
2b33 : 18 __ __ CLC
.l9:
2b34 : 69 3e __ ADC #$3e
2b36 : 85 1b __ STA P0 
2b38 : a9 00 __ LDA #$00
2b3a : 2a __ __ ROL
2b3b : 85 1c __ STA P1 
2b3d : a9 03 __ LDA #$03
2b3f : 85 1d __ STA P2 
2b41 : 20 cc 14 JSR $14cc ; (FAR_POKE.s4 + 0)
2b44 : e6 41 __ INC T1 + 0 
2b46 : a5 41 __ LDA T1 + 0 
2b48 : c9 78 __ CMP #$78
2b4a : 90 e8 __ BCC $2b34 ; (initFilePickRecord_far.l9 + 0)
.s5:
2b4c : a5 24 __ LDA P9 ; (firstTime + 0)
2b4e : 85 21 __ STA P6 
2b50 : 20 ba 2b JSR $2bba ; (reprepFPR_far.s4 + 0)
2b53 : a9 00 __ LDA #$00
2b55 : 85 1f __ STA P4 
.l6:
2b57 : 85 45 __ STA T2 + 0 
2b59 : 18 __ __ CLC
2b5a : 69 4e __ ADC #$4e
2b5c : 85 41 __ STA T1 + 0 
2b5e : a9 00 __ LDA #$00
2b60 : 69 5f __ ADC #$5f
2b62 : 85 42 __ STA T1 + 1 
2b64 : a9 03 __ LDA #$03
2b66 : 85 43 __ STA T1 + 2 
2b68 : a9 00 __ LDA #$00
2b6a : 2a __ __ ROL
2b6b : 85 44 __ STA T1 + 3 
2b6d : a9 00 __ LDA #$00
2b6f : 85 46 __ STA T3 + 0 
.l10:
2b71 : 65 41 __ ADC T1 + 0 
2b73 : 85 1b __ STA P0 
2b75 : a5 42 __ LDA T1 + 1 
2b77 : 69 00 __ ADC #$00
2b79 : 85 1c __ STA P1 
2b7b : a5 43 __ LDA T1 + 2 
2b7d : 69 00 __ ADC #$00
2b7f : 85 1d __ STA P2 
2b81 : a5 44 __ LDA T1 + 3 
2b83 : 69 00 __ ADC #$00
2b85 : 85 1e __ STA P3 
2b87 : 20 cc 14 JSR $14cc ; (FAR_POKE.s4 + 0)
2b8a : e6 46 __ INC T3 + 0 
2b8c : a5 46 __ LDA T3 + 0 
2b8e : c9 03 __ CMP #$03
2b90 : 90 df __ BCC $2b71 ; (initFilePickRecord_far.l10 + 0)
.s7:
2b92 : a5 45 __ LDA T2 + 0 
2b94 : 69 02 __ ADC #$02
2b96 : c9 0c __ CMP #$0c
2b98 : d0 bd __ BNE $2b57 ; (initFilePickRecord_far.l6 + 0)
.s8:
2b9a : a9 00 __ LDA #$00
2b9c : 85 1b __ STA P0 
2b9e : 85 1c __ STA P1 
2ba0 : 85 1e __ STA P3 
2ba2 : a5 22 __ LDA P7 ; (x + 0)
2ba4 : 85 1f __ STA P4 
2ba6 : a9 03 __ LDA #$03
2ba8 : 85 1d __ STA P2 
2baa : 20 cc 14 JSR $14cc ; (FAR_POKE.s4 + 0)
2bad : e6 1b __ INC P0 
2baf : a5 23 __ LDA P8 ; (y + 0)
2bb1 : 85 1f __ STA P4 
2bb3 : a9 03 __ LDA #$03
2bb5 : 85 1d __ STA P2 
2bb7 : 4c cc 14 JMP $14cc ; (FAR_POKE.s4 + 0)
--------------------------------------------------------------------
reprepFPR_far: ; reprepFPR_far(bool)->void
;  66, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/muFilePicker.h"
.s4:
2bba : a9 00 __ LDA #$00
2bbc : 85 3f __ STA T3 + 1 
2bbe : 85 1f __ STA P4 
2bc0 : a9 01 __ LDA #$01
2bc2 : 85 3d __ STA T2 + 0 
2bc4 : a9 78 __ LDA #$78
2bc6 : 85 3e __ STA T3 + 0 
2bc8 : 18 __ __ CLC
.l5:
2bc9 : a5 3e __ LDA T3 + 0 
2bcb : 69 b6 __ ADC #$b6
2bcd : 85 39 __ STA T1 + 0 
2bcf : a5 3f __ LDA T3 + 1 
2bd1 : 69 00 __ ADC #$00
2bd3 : 85 3a __ STA T1 + 1 
2bd5 : a9 00 __ LDA #$00
2bd7 : 69 03 __ ADC #$03
2bd9 : 85 3b __ STA T1 + 2 
2bdb : a9 00 __ LDA #$00
2bdd : 2a __ __ ROL
2bde : 85 3c __ STA T1 + 3 
2be0 : a9 00 __ LDA #$00
2be2 : 85 40 __ STA T4 + 0 
.l9:
2be4 : 65 39 __ ADC T1 + 0 
2be6 : 85 1b __ STA P0 
2be8 : a5 3a __ LDA T1 + 1 
2bea : 69 00 __ ADC #$00
2bec : 85 1c __ STA P1 
2bee : a5 3b __ LDA T1 + 2 
2bf0 : 69 00 __ ADC #$00
2bf2 : 85 1d __ STA P2 
2bf4 : a5 3c __ LDA T1 + 3 
2bf6 : 69 00 __ ADC #$00
2bf8 : 85 1e __ STA P3 
2bfa : 20 cc 14 JSR $14cc ; (FAR_POKE.s4 + 0)
2bfd : e6 40 __ INC T4 + 0 
2bff : a5 40 __ LDA T4 + 0 
2c01 : c9 78 __ CMP #$78
2c03 : 90 df __ BCC $2be4 ; (reprepFPR_far.l9 + 0)
.s6:
2c05 : a5 3d __ LDA T2 + 0 
2c07 : 69 75 __ ADC #$75
2c09 : 85 1b __ STA P0 
2c0b : a9 00 __ LDA #$00
2c0d : 69 5e __ ADC #$5e
2c0f : 85 1c __ STA P1 
2c11 : a9 03 __ LDA #$03
2c13 : 85 1d __ STA P2 
2c15 : a9 00 __ LDA #$00
2c17 : 2a __ __ ROL
2c18 : 85 1e __ STA P3 
2c1a : 20 cc 14 JSR $14cc ; (FAR_POKE.s4 + 0)
2c1d : 18 __ __ CLC
2c1e : a5 3e __ LDA T3 + 0 
2c20 : 69 78 __ ADC #$78
2c22 : 85 3e __ STA T3 + 0 
2c24 : 90 02 __ BCC $2c28 ; (reprepFPR_far.s11 + 0)
.s10:
2c26 : e6 3f __ INC T3 + 1 
.s11:
2c28 : e6 3d __ INC T2 + 0 
2c2a : a5 3d __ LDA T2 + 0 
2c2c : c9 c8 __ CMP #$c8
2c2e : 90 99 __ BCC $2bc9 ; (reprepFPR_far.l5 + 0)
.s7:
2c30 : a5 21 __ LDA P6 ; (newFolder + 0)
2c32 : d0 01 __ BNE $2c35 ; (reprepFPR_far.s8 + 0)
.s3:
2c34 : 60 __ __ RTS
.s8:
2c35 : a9 00 __ LDA #$00
2c37 : 85 1e __ STA P3 
2c39 : 85 20 __ STA P5 
2c3b : a9 3e __ LDA #$3e
2c3d : 85 1b __ STA P0 
2c3f : a9 5f __ LDA #$5f
2c41 : 85 1c __ STA P1 
2c43 : a9 03 __ LDA #$03
2c45 : 85 1d __ STA P2 
2c47 : 20 6b 2c JSR $2c6b ; (FAR_POKEW.s4 + 0)
2c4a : a9 42 __ LDA #$42
2c4c : 85 1b __ STA P0 
2c4e : a9 03 __ LDA #$03
2c50 : 85 1d __ STA P2 
2c52 : 20 6b 2c JSR $2c6b ; (FAR_POKEW.s4 + 0)
2c55 : a9 4a __ LDA #$4a
2c57 : 85 1b __ STA P0 
2c59 : a9 03 __ LDA #$03
2c5b : 85 1d __ STA P2 
2c5d : 20 6b 2c JSR $2c6b ; (FAR_POKEW.s4 + 0)
2c60 : a9 46 __ LDA #$46
2c62 : 85 1b __ STA P0 
2c64 : a9 03 __ LDA #$03
2c66 : 85 1d __ STA P2 
2c68 : 4c 6b 2c JMP $2c6b ; (FAR_POKEW.s4 + 0)
--------------------------------------------------------------------
FAR_POKEW: ; FAR_POKEW(u32,u16)->void
; 217, "/mnt/d/F256/f256lib-oscar64/f256lib/f256lib.h"
.s4:
2c6b : a5 0f __ LDA $0f 
2c6d : 85 38 __ STA T2 + 0 
2c6f : 78 __ __ SEI
2c70 : a5 1b __ LDA P0 ; (address + 0)
2c72 : 85 35 __ STA T0 + 0 
2c74 : a5 1c __ LDA P1 ; (address + 1)
2c76 : 85 37 __ STA T1 + 0 
2c78 : a5 1e __ LDA P3 ; (address + 3)
2c7a : a2 05 __ LDX #$05
.l5:
2c7c : 4a __ __ LSR
2c7d : 66 1d __ ROR P2 ; (address + 2)
2c7f : 66 37 __ ROR T1 + 0 
2c81 : ca __ __ DEX
2c82 : d0 f8 __ BNE $2c7c ; (FAR_POKEW.l5 + 0)
.s6:
2c84 : a5 37 __ LDA T1 + 0 
2c86 : 85 0f __ STA $0f 
2c88 : a5 1c __ LDA P1 ; (address + 1)
2c8a : 29 1f __ AND #$1f
2c8c : 09 e0 __ ORA #$e0
2c8e : 85 36 __ STA T0 + 1 
2c90 : a5 1f __ LDA P4 ; (value + 0)
2c92 : a0 00 __ LDY #$00
2c94 : 91 35 __ STA (T0 + 0),y 
2c96 : a5 20 __ LDA P5 ; (value + 1)
2c98 : c8 __ __ INY
2c99 : 91 35 __ STA (T0 + 0),y 
2c9b : a5 38 __ LDA T2 + 0 
2c9d : 85 0f __ STA $0f 
2c9f : 58 __ __ CLI
.s3:
2ca0 : 60 __ __ RTS
--------------------------------------------------------------------
readDirectory_far: ; readDirectory_far(bool)->void
;  76, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/muFilePicker.h"
.s4:
2ca1 : a9 00 __ LDA #$00
2ca3 : 85 3c __ STA T1 + 0 
2ca5 : 18 __ __ CLC
.l5:
2ca6 : 69 02 __ ADC #$02
2ca8 : 85 1b __ STA P0 
2caa : a9 00 __ LDA #$00
2cac : 85 1e __ STA P3 
2cae : 2a __ __ ROL
2caf : 85 1c __ STA P1 
2cb1 : a9 03 __ LDA #$03
2cb3 : 85 1d __ STA P2 
2cb5 : 20 b6 0f JSR $0fb6 ; (FAR_PEEK.s4 + 0)
2cb8 : a6 3c __ LDX T1 + 0 
2cba : 9d 8c 9f STA $9f8c,x ; (localPath[0] + 0)
2cbd : aa __ __ TAX
2cbe : f0 08 __ BEQ $2cc8 ; (readDirectory_far.s6 + 0)
.s24:
2cc0 : e6 3c __ INC T1 + 0 
2cc2 : a5 3c __ LDA T1 + 0 
2cc4 : c9 3c __ CMP #$3c
2cc6 : 90 de __ BCC $2ca6 ; (readDirectory_far.l5 + 0)
.s6:
2cc8 : a9 8c __ LDA #$8c
2cca : 85 21 __ STA P6 
2ccc : a9 9f __ LDA #$9f
2cce : 85 22 __ STA P7 
2cd0 : 20 5f 2e JSR $2e5f ; (fileOpenDir.s4 + 0)
2cd3 : a5 2a __ LDA ACCU + 1 
2cd5 : 05 29 __ ORA ACCU + 0 
2cd7 : d0 01 __ BNE $2cda ; (readDirectory_far.s7 + 0)
.s3:
2cd9 : 60 __ __ RTS
.s7:
2cda : a5 2a __ LDA ACCU + 1 
2cdc : 85 1c __ STA P1 
2cde : 85 41 __ STA T2 + 1 
2ce0 : a5 29 __ LDA ACCU + 0 
2ce2 : 85 40 __ STA T2 + 0 
2ce4 : 85 1b __ STA P0 
2ce6 : 20 2f 2f JSR $2f2f ; (fileReadDir.s4 + 0)
2ce9 : a9 01 __ LDA #$01
2ceb : 85 42 __ STA T3 + 0 
.l8:
2ced : a5 40 __ LDA T2 + 0 
2cef : 85 1b __ STA P0 
2cf1 : a5 41 __ LDA T2 + 1 
2cf3 : 85 1c __ STA P1 
2cf5 : 20 2f 2f JSR $2f2f ; (fileReadDir.s4 + 0)
2cf8 : a5 2a __ LDA ACCU + 1 
2cfa : 85 44 __ STA T4 + 1 
2cfc : a6 29 __ LDX ACCU + 0 
2cfe : 86 43 __ STX T4 + 0 
2d00 : d0 06 __ BNE $2d08 ; (readDirectory_far.s11 + 0)
.s23:
2d02 : a8 __ __ TAY
2d03 : d0 03 __ BNE $2d08 ; (readDirectory_far.s11 + 0)
2d05 : 4c f5 2d JMP $2df5 ; (readDirectory_far.s9 + 0)
.s11:
2d08 : a5 42 __ LDA T3 + 0 
2d0a : c9 c8 __ CMP #$c8
2d0c : b0 f7 __ BCS $2d05 ; (readDirectory_far.s23 + 3)
.s12:
2d0e : 8a __ __ TXA
2d0f : 69 02 __ ADC #$02
2d11 : 85 45 __ STA T5 + 0 
2d13 : 85 1b __ STA P0 
2d15 : a5 2a __ LDA ACCU + 1 
2d17 : 69 00 __ ADC #$00
2d19 : 85 46 __ STA T5 + 1 
2d1b : 85 1c __ STA P1 
2d1d : a9 de __ LDA #$de
2d1f : 85 1d __ STA P2 
2d21 : a9 29 __ LDA #$29
2d23 : 85 1e __ STA P3 
2d25 : 20 c3 1d JSR $1dc3 ; (strcmp.s4 + 0)
2d28 : aa __ __ TAX
2d29 : f0 c2 __ BEQ $2ced ; (readDirectory_far.l8 + 0)
.s13:
2d2b : a5 45 __ LDA T5 + 0 
2d2d : 85 1b __ STA P0 
2d2f : a5 46 __ LDA T5 + 1 
2d31 : 85 1c __ STA P1 
2d33 : a9 fd __ LDA #$fd
2d35 : 85 1d __ STA P2 
2d37 : a9 29 __ LDA #$29
2d39 : 85 1e __ STA P3 
2d3b : 20 c3 1d JSR $1dc3 ; (strcmp.s4 + 0)
2d3e : aa __ __ TAX
2d3f : f0 ac __ BEQ $2ced ; (readDirectory_far.l8 + 0)
.s14:
2d41 : a5 25 __ LDA P10 ; (wantFilter + 0)
2d43 : f0 15 __ BEQ $2d5a ; (readDirectory_far.s15 + 0)
.s21:
2d45 : a5 45 __ LDA T5 + 0 
2d47 : 85 23 __ STA P8 
2d49 : a5 46 __ LDA T5 + 1 
2d4b : 85 24 __ STA P9 
2d4d : 20 f9 2f JSR $2ff9 ; (isExtensionAllowed_far.s4 + 0)
2d50 : a5 29 __ LDA ACCU + 0 
2d52 : d0 06 __ BNE $2d5a ; (readDirectory_far.s15 + 0)
.s22:
2d54 : a0 01 __ LDY #$01
2d56 : b1 43 __ LDA (T4 + 0),y 
2d58 : f0 93 __ BEQ $2ced ; (readDirectory_far.l8 + 0)
.s15:
2d5a : a5 42 __ LDA T3 + 0 
2d5c : 85 29 __ STA ACCU + 0 
2d5e : a9 00 __ LDA #$00
2d60 : 85 2a __ STA ACCU + 1 
2d62 : a9 78 __ LDA #$78
2d64 : 20 60 72 JSR $7260 ; (mul16by8 + 0)
2d67 : 18 __ __ CLC
2d68 : a5 29 __ LDA ACCU + 0 
2d6a : 69 b6 __ ADC #$b6
2d6c : 85 3c __ STA T1 + 0 
2d6e : a5 2a __ LDA ACCU + 1 
2d70 : 69 00 __ ADC #$00
2d72 : 85 3d __ STA T1 + 1 
2d74 : a9 00 __ LDA #$00
2d76 : 69 03 __ ADC #$03
2d78 : 85 3e __ STA T1 + 2 
2d7a : a9 00 __ LDA #$00
2d7c : 2a __ __ ROL
2d7d : 85 3f __ STA T1 + 3 
2d7f : a0 00 __ LDY #$00
.l16:
2d81 : 84 47 __ STY T6 + 0 
2d83 : b1 45 __ LDA (T5 + 0),y 
2d85 : 85 1f __ STA P4 
2d87 : 98 __ __ TYA
2d88 : 18 __ __ CLC
2d89 : 65 3c __ ADC T1 + 0 
2d8b : 85 1b __ STA P0 
2d8d : a5 3d __ LDA T1 + 1 
2d8f : 69 00 __ ADC #$00
2d91 : 85 1c __ STA P1 
2d93 : a5 3e __ LDA T1 + 2 
2d95 : 69 00 __ ADC #$00
2d97 : 85 1d __ STA P2 
2d99 : a5 3f __ LDA T1 + 3 
2d9b : 69 00 __ ADC #$00
2d9d : 85 1e __ STA P3 
2d9f : 20 cc 14 JSR $14cc ; (FAR_POKE.s4 + 0)
2da2 : a5 1f __ LDA P4 
2da4 : f0 07 __ BEQ $2dad ; (readDirectory_far.s17 + 0)
.s20:
2da6 : a4 47 __ LDY T6 + 0 
2da8 : c8 __ __ INY
2da9 : c0 77 __ CPY #$77
2dab : 90 d4 __ BCC $2d81 ; (readDirectory_far.l16 + 0)
.s17:
2dad : a9 00 __ LDA #$00
2daf : 85 1f __ STA P4 
2db1 : 18 __ __ CLC
2db2 : a5 3c __ LDA T1 + 0 
2db4 : 69 77 __ ADC #$77
2db6 : 85 1b __ STA P0 
2db8 : a5 3d __ LDA T1 + 1 
2dba : 69 00 __ ADC #$00
2dbc : 85 1c __ STA P1 
2dbe : a5 3e __ LDA T1 + 2 
2dc0 : 69 00 __ ADC #$00
2dc2 : 85 1d __ STA P2 
2dc4 : a5 3f __ LDA T1 + 3 
2dc6 : 69 00 __ ADC #$00
2dc8 : 85 1e __ STA P3 
2dca : 20 cc 14 JSR $14cc ; (FAR_POKE.s4 + 0)
2dcd : a0 01 __ LDY #$01
2dcf : b1 43 __ LDA (T4 + 0),y 
2dd1 : c9 01 __ CMP #$01
2dd3 : d0 02 __ BNE $2dd7 ; (readDirectory_far.s18 + 0)
.s19:
2dd5 : e6 1f __ INC P4 
.s18:
2dd7 : 18 __ __ CLC
2dd8 : a5 42 __ LDA T3 + 0 
2dda : 69 76 __ ADC #$76
2ddc : 85 1b __ STA P0 
2dde : a9 00 __ LDA #$00
2de0 : 69 5e __ ADC #$5e
2de2 : 85 1c __ STA P1 
2de4 : a9 03 __ LDA #$03
2de6 : 85 1d __ STA P2 
2de8 : a9 00 __ LDA #$00
2dea : 2a __ __ ROL
2deb : 85 1e __ STA P3 
2ded : 20 cc 14 JSR $14cc ; (FAR_POKE.s4 + 0)
2df0 : e6 42 __ INC T3 + 0 
2df2 : 4c ed 2c JMP $2ced ; (readDirectory_far.l8 + 0)
.s9:
2df5 : a9 00 __ LDA #$00
2df7 : 85 1e __ STA P3 
2df9 : 85 20 __ STA P5 
2dfb : a9 3e __ LDA #$3e
2dfd : 85 1b __ STA P0 
2dff : a9 5f __ LDA #$5f
2e01 : 85 1c __ STA P1 
2e03 : a9 03 __ LDA #$03
2e05 : 85 1d __ STA P2 
2e07 : a5 42 __ LDA T3 + 0 
2e09 : 85 1f __ STA P4 
2e0b : 20 6b 2c JSR $2c6b ; (FAR_POKEW.s4 + 0)
2e0e : a9 b6 __ LDA #$b6
2e10 : 85 1b __ STA P0 
2e12 : a9 2e __ LDA #$2e
2e14 : 85 1f __ STA P4 
2e16 : a9 00 __ LDA #$00
2e18 : 85 1c __ STA P1 
2e1a : a9 03 __ LDA #$03
2e1c : 85 1d __ STA P2 
2e1e : 20 cc 14 JSR $14cc ; (FAR_POKE.s4 + 0)
2e21 : e6 1b __ INC P0 
2e23 : a9 03 __ LDA #$03
2e25 : 85 1d __ STA P2 
2e27 : 20 cc 14 JSR $14cc ; (FAR_POKE.s4 + 0)
2e2a : e6 1b __ INC P0 
2e2c : a9 03 __ LDA #$03
2e2e : 85 1d __ STA P2 
2e30 : a9 00 __ LDA #$00
2e32 : 85 1f __ STA P4 
2e34 : 20 cc 14 JSR $14cc ; (FAR_POKE.s4 + 0)
2e37 : a9 03 __ LDA #$03
2e39 : 85 3c __ STA T1 + 0 
2e3b : 18 __ __ CLC
.l25:
2e3c : 69 b6 __ ADC #$b6
2e3e : 85 1b __ STA P0 
2e40 : a9 00 __ LDA #$00
2e42 : 2a __ __ ROL
2e43 : 85 1c __ STA P1 
2e45 : a9 03 __ LDA #$03
2e47 : 85 1d __ STA P2 
2e49 : 20 cc 14 JSR $14cc ; (FAR_POKE.s4 + 0)
2e4c : e6 3c __ INC T1 + 0 
2e4e : a5 3c __ LDA T1 + 0 
2e50 : c9 78 __ CMP #$78
2e52 : 90 e8 __ BCC $2e3c ; (readDirectory_far.l25 + 0)
.s10:
2e54 : a5 40 __ LDA T2 + 0 
2e56 : 85 1b __ STA P0 
2e58 : a5 41 __ LDA T2 + 1 
2e5a : 85 1c __ STA P1 
2e5c : 4c 14 31 JMP $3114 ; (fileCloseDir.s4 + 0)
--------------------------------------------------------------------
fileOpenDir: ; fileOpenDir(const u8*)->u8*
;  26, "/mnt/d/F256/f256lib-oscar64/f256lib/f_file.h"
.s4:
2e5f : a5 21 __ LDA P6 ; (name + 0)
2e61 : 85 1d __ STA P2 
2e63 : a5 22 __ LDA P7 ; (name + 1)
2e65 : 85 1e __ STA P3 
2e67 : a9 cb __ LDA #$cb
2e69 : 85 1f __ STA P4 
2e6b : a9 9f __ LDA #$9f
2e6d : 85 20 __ STA P5 
2e6f : 20 e1 2e JSR $2ee1 ; (pathWithoutDrive.s4 + 0)
2e72 : ae cb 9f LDX $9fcb ; (drive + 0)
2e75 : bd c3 7a LDA $7ac3,x ; (_dirStream[0] + 0)
2e78 : d0 4b __ BNE $2ec5 ; (fileOpenDir.s8 + 0)
.s5:
2e7a : ad 64 7a LDA $7a64 ; (kernelArgs + 0)
2e7d : 85 35 __ STA T1 + 0 
2e7f : ad 65 7a LDA $7a65 ; (kernelArgs + 1)
2e82 : 85 36 __ STA T1 + 1 
2e84 : ad cb 9f LDA $9fcb ; (drive + 0)
2e87 : a0 03 __ LDY #$03
2e89 : 91 35 __ STA (T1 + 0),y 
2e8b : a5 29 __ LDA ACCU + 0 
2e8d : 85 1b __ STA P0 
2e8f : a0 0b __ LDY #$0b
2e91 : 91 35 __ STA (T1 + 0),y 
2e93 : a5 2a __ LDA ACCU + 1 
2e95 : 85 1c __ STA P1 
2e97 : c8 __ __ INY
2e98 : 91 35 __ STA (T1 + 0),y 
2e9a : 20 f7 26 JSR $26f7 ; (strlen.s4 + 0)
2e9d : a5 29 __ LDA ACCU + 0 
2e9f : a0 0d __ LDY #$0d
2ea1 : 91 35 __ STA (T1 + 0),y 
2ea3 : a9 78 __ LDA #$78
2ea5 : 8d cb 7a STA $7acb ; (_kern_target + 0)
2ea8 : a9 ff __ LDA #$ff
2eaa : 8d cc 7a STA $7acc ; (_kern_target + 1)
2ead : 20 2f 29 JSR $292f ; (_kernelCallWrapper.s4 + 0)
2eb0 : 85 37 __ STA T2 + 0 
2eb2 : ad cd 7a LDA $7acd ; (_kernelError + 0)
2eb5 : d0 0e __ BNE $2ec5 ; (fileOpenDir.s8 + 0)
.l6:
2eb7 : 20 4f 29 JSR $294f ; (kernelNextEvent.s4 + 0)
2eba : ad 66 7a LDA $7a66 ; (kernelEventData.type + 0)
2ebd : c9 3c __ CMP #$3c
2ebf : f0 0b __ BEQ $2ecc ; (fileOpenDir.s9 + 0)
.s7:
2ec1 : c9 48 __ CMP #$48
2ec3 : d0 f2 __ BNE $2eb7 ; (fileOpenDir.l6 + 0)
.s8:
2ec5 : a9 00 __ LDA #$00
2ec7 : 85 29 __ STA ACCU + 0 
2ec9 : 85 2a __ STA ACCU + 1 
.s3:
2ecb : 60 __ __ RTS
.s9:
2ecc : ad cb 9f LDA $9fcb ; (drive + 0)
2ecf : aa __ __ TAX
2ed0 : 18 __ __ CLC
2ed1 : 69 c3 __ ADC #$c3
2ed3 : 85 29 __ STA ACCU + 0 
2ed5 : a9 7a __ LDA #$7a
2ed7 : 69 00 __ ADC #$00
2ed9 : 85 2a __ STA ACCU + 1 
2edb : a5 37 __ LDA T2 + 0 
2edd : 9d c3 7a STA $7ac3,x ; (_dirStream[0] + 0)
2ee0 : 60 __ __ RTS
--------------------------------------------------------------------
pathWithoutDrive: ; pathWithoutDrive(const u8*,u8*)->const u8*
;  33, "/mnt/d/F256/f256lib-oscar64/f256lib/f_file.c"
.s4:
2ee1 : a9 00 __ LDA #$00
2ee3 : a8 __ __ TAY
2ee4 : 91 1f __ STA (P4),y ; (drive + 0)
2ee6 : a5 1d __ LDA P2 ; (path + 0)
2ee8 : 85 1b __ STA P0 
2eea : a5 1e __ LDA P3 ; (path + 1)
2eec : 85 1c __ STA P1 
2eee : 20 f7 26 JSR $26f7 ; (strlen.s4 + 0)
2ef1 : a5 2a __ LDA ACCU + 1 
2ef3 : 30 10 __ BMI $2f05 ; (pathWithoutDrive.s9 + 0)
.s11:
2ef5 : d0 06 __ BNE $2efd ; (pathWithoutDrive.s5 + 0)
.s10:
2ef7 : a5 29 __ LDA ACCU + 0 
2ef9 : c9 02 __ CMP #$02
2efb : 90 08 __ BCC $2f05 ; (pathWithoutDrive.s9 + 0)
.s5:
2efd : a0 01 __ LDY #$01
2eff : b1 1d __ LDA (P2),y ; (path + 0)
2f01 : c9 3a __ CMP #$3a
2f03 : f0 09 __ BEQ $2f0e ; (pathWithoutDrive.s6 + 0)
.s9:
2f05 : a5 1d __ LDA P2 ; (path + 0)
2f07 : 85 29 __ STA ACCU + 0 
2f09 : a5 1e __ LDA P3 ; (path + 1)
.s3:
2f0b : 85 2a __ STA ACCU + 1 
2f0d : 60 __ __ RTS
.s6:
2f0e : 88 __ __ DEY
2f0f : b1 1d __ LDA (P2),y ; (path + 0)
2f11 : c9 30 __ CMP #$30
2f13 : 90 0c __ BCC $2f21 ; (pathWithoutDrive.s12 + 0)
.s7:
2f15 : a9 37 __ LDA #$37
2f17 : d1 1d __ CMP (P2),y ; (path + 0)
2f19 : 90 06 __ BCC $2f21 ; (pathWithoutDrive.s12 + 0)
.s8:
2f1b : b1 1d __ LDA (P2),y ; (path + 0)
2f1d : e9 30 __ SBC #$30
2f1f : 91 1f __ STA (P4),y ; (drive + 0)
.s12:
2f21 : 18 __ __ CLC
2f22 : a5 1d __ LDA P2 ; (path + 0)
2f24 : 69 02 __ ADC #$02
2f26 : 85 29 __ STA ACCU + 0 
2f28 : a5 1e __ LDA P3 ; (path + 1)
2f2a : 69 00 __ ADC #$00
2f2c : 4c 0b 2f JMP $2f0b ; (pathWithoutDrive.s3 + 0)
--------------------------------------------------------------------
fileReadDir: ; fileReadDir(u8*)->struct fileDirEntS*
;  28, "/mnt/d/F256/f256lib-oscar64/f256lib/f_file.h"
.s4:
2f2f : a5 1c __ LDA P1 ; (dir + 1)
2f31 : 05 1b __ ORA P0 ; (dir + 0)
2f33 : d0 03 __ BNE $2f38 ; (fileReadDir.s5 + 0)
2f35 : 4c bc 2f JMP $2fbc ; (fileReadDir.s17 + 0)
.s5:
2f38 : a9 7c __ LDA #$7c
2f3a : 8d cb 7a STA $7acb ; (_kern_target + 0)
2f3d : a9 ff __ LDA #$ff
2f3f : 8d cc 7a STA $7acc ; (_kern_target + 1)
2f42 : ad 64 7a LDA $7a64 ; (kernelArgs + 0)
2f45 : 85 36 __ STA T3 + 0 
2f47 : ad 65 7a LDA $7a65 ; (kernelArgs + 1)
2f4a : 85 37 __ STA T3 + 1 
2f4c : a0 00 __ LDY #$00
2f4e : b1 1b __ LDA (P0),y ; (dir + 0)
2f50 : a0 03 __ LDY #$03
2f52 : 91 36 __ STA (T3 + 0),y 
2f54 : 20 2f 29 JSR $292f ; (_kernelCallWrapper.s4 + 0)
2f57 : ad cd 7a LDA $7acd ; (_kernelError + 0)
2f5a : d0 60 __ BNE $2fbc ; (fileReadDir.s17 + 0)
.l6:
2f5c : 20 4f 29 JSR $294f ; (kernelNextEvent.s4 + 0)
2f5f : ad 66 7a LDA $7a66 ; (kernelEventData.type + 0)
2f62 : c9 3e __ CMP #$3e
2f64 : d0 09 __ BNE $2f6f ; (fileReadDir.s7 + 0)
.s16:
2f66 : a9 00 __ LDA #$00
2f68 : 8d 88 80 STA $8088 ; (fileDirEntS.d_blocks + 0)
2f6b : a9 02 __ LDA #$02
2f6d : d0 54 __ BNE $2fc3 ; (fileReadDir.s13 + 0)
.s7:
2f6f : c9 40 __ CMP #$40
2f71 : d0 25 __ BNE $2f98 ; (fileReadDir.s8 + 0)
.s12:
2f73 : a9 08 __ LDA #$08
2f75 : 8d cb 7a STA $7acb ; (_kern_target + 0)
2f78 : a9 ff __ LDA #$ff
2f7a : 8d cc 7a STA $7acc ; (_kern_target + 1)
2f7d : a9 88 __ LDA #$88
2f7f : a0 0b __ LDY #$0b
2f81 : 91 36 __ STA (T3 + 0),y 
2f83 : a9 80 __ LDA #$80
2f85 : c8 __ __ INY
2f86 : 91 36 __ STA (T3 + 0),y 
2f88 : a9 01 __ LDA #$01
2f8a : c8 __ __ INY
2f8b : 91 36 __ STA (T3 + 0),y 
2f8d : 20 2f 29 JSR $292f ; (_kernelCallWrapper.s4 + 0)
2f90 : a9 00 __ LDA #$00
2f92 : cd 88 80 CMP $8088 ; (fileDirEntS.d_blocks + 0)
2f95 : 2a __ __ ROL
2f96 : 90 2b __ BCC $2fc3 ; (fileReadDir.s13 + 0)
.s8:
2f98 : c9 42 __ CMP #$42
2f9a : d0 18 __ BNE $2fb4 ; (fileReadDir.s9 + 0)
.s11:
2f9c : a9 7c __ LDA #$7c
2f9e : 8d cb 7a STA $7acb ; (_kern_target + 0)
2fa1 : a9 ff __ LDA #$ff
2fa3 : 8d cc 7a STA $7acc ; (_kern_target + 1)
2fa6 : a0 00 __ LDY #$00
2fa8 : b1 1b __ LDA (P0),y ; (dir + 0)
2faa : a0 03 __ LDY #$03
2fac : 91 36 __ STA (T3 + 0),y 
2fae : 20 2f 29 JSR $292f ; (_kernelCallWrapper.s4 + 0)
2fb1 : 4c 5c 2f JMP $2f5c ; (fileReadDir.l6 + 0)
.s9:
2fb4 : c9 44 __ CMP #$44
2fb6 : f0 04 __ BEQ $2fbc ; (fileReadDir.s17 + 0)
.s10:
2fb8 : c9 48 __ CMP #$48
2fba : d0 a0 __ BNE $2f5c ; (fileReadDir.l6 + 0)
.s17:
2fbc : a9 00 __ LDA #$00
2fbe : 85 29 __ STA ACCU + 0 
.s3:
2fc0 : 85 2a __ STA ACCU + 1 
2fc2 : 60 __ __ RTS
.s13:
2fc3 : 8d 89 80 STA $8089 ; (fileDirEntS.d_type + 0)
2fc6 : ad 6b 7a LDA $7a6b ; (kernelEventData.u + 2)
2fc9 : 85 35 __ STA T1 + 0 
2fcb : f0 1c __ BEQ $2fe9 ; (fileReadDir.s14 + 0)
.s15:
2fcd : a0 0d __ LDY #$0d
2fcf : 91 36 __ STA (T3 + 0),y 
2fd1 : a9 04 __ LDA #$04
2fd3 : 8d cb 7a STA $7acb ; (_kern_target + 0)
2fd6 : a9 ff __ LDA #$ff
2fd8 : 8d cc 7a STA $7acc ; (_kern_target + 1)
2fdb : a9 8a __ LDA #$8a
2fdd : a0 0b __ LDY #$0b
2fdf : 91 36 __ STA (T3 + 0),y 
2fe1 : a9 80 __ LDA #$80
2fe3 : c8 __ __ INY
2fe4 : 91 36 __ STA (T3 + 0),y 
2fe6 : 20 2f 29 JSR $292f ; (_kernelCallWrapper.s4 + 0)
.s14:
2fe9 : a9 00 __ LDA #$00
2feb : a6 35 __ LDX T1 + 0 
2fed : 9d 8a 80 STA $808a,x ; (fileDirEntS.d_name[0] + 0)
2ff0 : a9 88 __ LDA #$88
2ff2 : 85 29 __ STA ACCU + 0 
2ff4 : a9 80 __ LDA #$80
2ff6 : 4c c0 2f JMP $2fc0 ; (fileReadDir.s3 + 0)
--------------------------------------------------------------------
isExtensionAllowed_far: ; isExtensionAllowed_far(const u8*)->bool
;  78, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/muFilePicker.h"
.s4:
2ff9 : a0 00 __ LDY #$00
.l5:
2ffb : 84 3a __ STY T2 + 0 
2ffd : b9 fc 71 LDA $71fc,y ; (__multab3L + 0)
3000 : 18 __ __ CLC
3001 : 69 4e __ ADC #$4e
3003 : 85 39 __ STA T1 + 0 
3005 : 85 1b __ STA P0 
3007 : a9 5f __ LDA #$5f
3009 : 85 1c __ STA P1 
300b : a9 00 __ LDA #$00
300d : 85 1e __ STA P3 
300f : a9 03 __ LDA #$03
3011 : 85 1d __ STA P2 
3013 : 20 b6 0f JSR $0fb6 ; (FAR_PEEK.s4 + 0)
3016 : aa __ __ TAX
3017 : f0 40 __ BEQ $3059 ; (isExtensionAllowed_far.s6 + 0)
.s7:
3019 : a9 00 __ LDA #$00
301b : 85 3b __ STA T3 + 0 
301d : 18 __ __ CLC
.l10:
301e : a5 3b __ LDA T3 + 0 
3020 : 65 39 __ ADC T1 + 0 
3022 : 85 1b __ STA P0 
3024 : a9 5f __ LDA #$5f
3026 : 69 00 __ ADC #$00
3028 : 85 1c __ STA P1 
302a : a9 03 __ LDA #$03
302c : 85 1d __ STA P2 
302e : 20 b6 0f JSR $0fb6 ; (FAR_PEEK.s4 + 0)
3031 : a6 3b __ LDX T3 + 0 
3033 : e8 __ __ INX
3034 : 86 3b __ STX T3 + 0 
3036 : 9d c7 9f STA $9fc7,x ; (keyName[0] + 115)
3039 : e0 03 __ CPX #$03
303b : 90 e1 __ BCC $301e ; (isExtensionAllowed_far.l10 + 0)
.s8:
303d : a9 00 __ LDA #$00
303f : 8d cb 9f STA $9fcb ; (extBuf[0] + 3)
3042 : a5 23 __ LDA P8 ; (filename + 0)
3044 : 85 1f __ STA P4 
3046 : a5 24 __ LDA P9 ; (filename + 1)
3048 : 85 20 __ STA P5 
304a : a9 c8 __ LDA #$c8
304c : 85 21 __ STA P6 
304e : a9 9f __ LDA #$9f
3050 : 85 22 __ STA P7 
3052 : 20 67 30 JSR $3067 ; (endsWithExt.s4 + 0)
3055 : a5 29 __ LDA ACCU + 0 
3057 : d0 0a __ BNE $3063 ; (isExtensionAllowed_far.s9 + 0)
.s6:
3059 : a4 3a __ LDY T2 + 0 
305b : c8 __ __ INY
305c : c0 04 __ CPY #$04
305e : 90 9b __ BCC $2ffb ; (isExtensionAllowed_far.l5 + 0)
.s3:
3060 : 85 29 __ STA ACCU + 0 
3062 : 60 __ __ RTS
.s9:
3063 : a9 01 __ LDA #$01
3065 : d0 f9 __ BNE $3060 ; (isExtensionAllowed_far.s3 + 0)
--------------------------------------------------------------------
endsWithExt: ; endsWithExt(const u8*,const u8*)->bool
; 132, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/muFilePicker.c"
.s4:
3067 : a5 1f __ LDA P4 ; (filename + 0)
3069 : 85 1b __ STA P0 
306b : a5 20 __ LDA P5 ; (filename + 1)
306d : 85 1c __ STA P1 
306f : 20 f7 26 JSR $26f7 ; (strlen.s4 + 0)
3072 : a5 2a __ LDA ACCU + 1 
3074 : d0 06 __ BNE $307c ; (endsWithExt.s5 + 0)
.s13:
3076 : a5 29 __ LDA ACCU + 0 
3078 : c9 04 __ CMP #$04
307a : 90 56 __ BCC $30d2 ; (endsWithExt.s6 + 0)
.s5:
307c : a5 20 __ LDA P5 ; (filename + 1)
307e : 85 1c __ STA P1 
3080 : a9 2e __ LDA #$2e
3082 : 85 1d __ STA P2 
3084 : a9 00 __ LDA #$00
3086 : 85 1e __ STA P3 
3088 : 20 d6 30 JSR $30d6 ; (strrchr.s4 + 0)
308b : a5 2a __ LDA ACCU + 1 
308d : 05 29 __ ORA ACCU + 0 
308f : f0 41 __ BEQ $30d2 ; (endsWithExt.s6 + 0)
.s7:
3091 : a5 29 __ LDA ACCU + 0 
3093 : 85 35 __ STA T1 + 0 
3095 : 18 __ __ CLC
3096 : 69 01 __ ADC #$01
3098 : 85 1b __ STA P0 
309a : a5 2a __ LDA ACCU + 1 
309c : 85 36 __ STA T1 + 1 
309e : 69 00 __ ADC #$00
30a0 : 85 1c __ STA P1 
30a2 : 20 f7 26 JSR $26f7 ; (strlen.s4 + 0)
30a5 : a5 2a __ LDA ACCU + 1 
30a7 : d0 29 __ BNE $30d2 ; (endsWithExt.s6 + 0)
.s12:
30a9 : a5 29 __ LDA ACCU + 0 
30ab : c9 03 __ CMP #$03
30ad : d0 23 __ BNE $30d2 ; (endsWithExt.s6 + 0)
.s8:
30af : a0 00 __ LDY #$00
.l9:
30b1 : 84 37 __ STY T2 + 0 
30b3 : c8 __ __ INY
30b4 : b1 35 __ LDA (T1 + 0),y 
30b6 : 20 09 31 JSR $3109 ; (tolower.s4 + 0)
30b9 : 85 38 __ STA T4 + 0 
30bb : a4 37 __ LDY T2 + 0 
30bd : b1 21 __ LDA (P6),y ; (ext + 0)
30bf : 20 09 31 JSR $3109 ; (tolower.s4 + 0)
30c2 : c5 38 __ CMP T4 + 0 
30c4 : d0 0c __ BNE $30d2 ; (endsWithExt.s6 + 0)
.s10:
30c6 : a4 37 __ LDY T2 + 0 
30c8 : c8 __ __ INY
30c9 : c0 03 __ CPY #$03
30cb : 90 e4 __ BCC $30b1 ; (endsWithExt.l9 + 0)
.s11:
30cd : a9 01 __ LDA #$01
.s3:
30cf : 85 29 __ STA ACCU + 0 
30d1 : 60 __ __ RTS
.s6:
30d2 : a9 00 __ LDA #$00
30d4 : f0 f9 __ BEQ $30cf ; (endsWithExt.s3 + 0)
--------------------------------------------------------------------
strrchr: ; strrchr(const u8*,i16)->u8*
;  20, "/mnt/d/F256/oscar64/include/string.h"
.s4:
30d6 : a9 00 __ LDA #$00
30d8 : 85 29 __ STA ACCU + 0 
30da : 85 2a __ STA ACCU + 1 
30dc : a8 __ __ TAY
30dd : b1 1b __ LDA (P0),y ; (str + 0)
30df : f0 19 __ BEQ $30fa ; (strrchr.s5 + 0)
.s10:
30e1 : a6 1d __ LDX P2 ; (ch + 0)
.l7:
30e3 : 8a __ __ TXA
30e4 : d1 1b __ CMP (P0),y ; (str + 0)
30e6 : d0 08 __ BNE $30f0 ; (strrchr.s8 + 0)
.s9:
30e8 : a5 1b __ LDA P0 ; (str + 0)
30ea : 85 29 __ STA ACCU + 0 
30ec : a5 1c __ LDA P1 ; (str + 1)
30ee : 85 2a __ STA ACCU + 1 
.s8:
30f0 : e6 1b __ INC P0 ; (str + 0)
30f2 : d0 02 __ BNE $30f6 ; (strrchr.s12 + 0)
.s11:
30f4 : e6 1c __ INC P1 ; (str + 1)
.s12:
30f6 : b1 1b __ LDA (P0),y ; (str + 0)
30f8 : d0 e9 __ BNE $30e3 ; (strrchr.l7 + 0)
.s5:
30fa : a5 1d __ LDA P2 ; (ch + 0)
30fc : 05 1e __ ORA P3 ; (ch + 1)
30fe : d0 08 __ BNE $3108 ; (strrchr.s3 + 0)
.s6:
3100 : a5 1b __ LDA P0 ; (str + 0)
3102 : 85 29 __ STA ACCU + 0 
3104 : a5 1c __ LDA P1 ; (str + 1)
3106 : 85 2a __ STA ACCU + 1 
.s3:
3108 : 60 __ __ RTS
--------------------------------------------------------------------
tolower: ; tolower(u8)->u8
;  28, "/mnt/d/F256/oscar64/include/ctype.h"
.s4:
3109 : c9 41 __ CMP #$41
310b : 90 06 __ BCC $3113 ; (tolower.s3 + 0)
.s5:
310d : c9 5b __ CMP #$5b
310f : b0 02 __ BCS $3113 ; (tolower.s3 + 0)
.s6:
3111 : 69 20 __ ADC #$20
.s3:
3113 : 60 __ __ RTS
--------------------------------------------------------------------
fileCloseDir: ; fileCloseDir(u8*)->i8
;  23, "/mnt/d/F256/f256lib-oscar64/f256lib/f_file.h"
.s4:
3114 : a5 1c __ LDA P1 ; (dir + 1)
3116 : 05 1b __ ORA P0 ; (dir + 0)
3118 : d0 05 __ BNE $311f ; (fileCloseDir.l6 + 0)
.s5:
311a : a9 ff __ LDA #$ff
.s3:
311c : 85 29 __ STA ACCU + 0 
311e : 60 __ __ RTS
.l6:
311f : a0 00 __ LDY #$00
3121 : b1 1b __ LDA (P0),y ; (dir + 0)
3123 : f0 23 __ BEQ $3148 ; (fileCloseDir.s7 + 0)
.s9:
3125 : a2 80 __ LDX #$80
3127 : 8e cb 7a STX $7acb ; (_kern_target + 0)
312a : a2 ff __ LDX #$ff
312c : 8e cc 7a STX $7acc ; (_kern_target + 1)
312f : ae 64 7a LDX $7a64 ; (kernelArgs + 0)
3132 : 86 35 __ STX T0 + 0 
3134 : ae 65 7a LDX $7a65 ; (kernelArgs + 1)
3137 : 86 36 __ STX T0 + 1 
3139 : a0 03 __ LDY #$03
313b : 91 35 __ STA (T0 + 0),y 
313d : 20 2f 29 JSR $292f ; (_kernelCallWrapper.s4 + 0)
3140 : ad cd 7a LDA $7acd ; (_kernelError + 0)
3143 : d0 03 __ BNE $3148 ; (fileCloseDir.s7 + 0)
.s10:
3145 : a8 __ __ TAY
3146 : 91 1b __ STA (P0),y ; (dir + 0)
.s7:
3148 : 20 4f 29 JSR $294f ; (kernelNextEvent.s4 + 0)
314b : ad 66 7a LDA $7a66 ; (kernelEventData.type + 0)
314e : c9 46 __ CMP #$46
3150 : d0 cd __ BNE $311f ; (fileCloseDir.l6 + 0)
.s8:
3152 : a9 00 __ LDA #$00
3154 : f0 c6 __ BEQ $311c ; (fileCloseDir.s3 + 0)
--------------------------------------------------------------------
sortFileList_far: ; sortFileList_far()->void
;  81, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/muFilePicker.h"
.s4:
3156 : a9 00 __ LDA #$00
3158 : 85 1c __ STA P1 
315a : 85 1e __ STA P3 
315c : a9 b6 __ LDA #$b6
315e : 85 1b __ STA P0 
3160 : a9 03 __ LDA #$03
3162 : 85 1d __ STA P2 
3164 : a9 2e __ LDA #$2e
3166 : 85 1f __ STA P4 
3168 : 20 cc 14 JSR $14cc ; (FAR_POKE.s4 + 0)
316b : e6 1b __ INC P0 
316d : a9 03 __ LDA #$03
316f : 85 1d __ STA P2 
3171 : 20 cc 14 JSR $14cc ; (FAR_POKE.s4 + 0)
3174 : e6 1b __ INC P0 
3176 : a9 03 __ LDA #$03
3178 : 85 1d __ STA P2 
317a : a9 00 __ LDA #$00
317c : 85 1f __ STA P4 
317e : 20 cc 14 JSR $14cc ; (FAR_POKE.s4 + 0)
3181 : a9 03 __ LDA #$03
3183 : 85 3b __ STA T1 + 0 
3185 : 18 __ __ CLC
.l31:
3186 : 69 b6 __ ADC #$b6
3188 : 85 1b __ STA P0 
318a : a9 00 __ LDA #$00
318c : 2a __ __ ROL
318d : 85 1c __ STA P1 
318f : a9 03 __ LDA #$03
3191 : 85 1d __ STA P2 
3193 : 20 cc 14 JSR $14cc ; (FAR_POKE.s4 + 0)
3196 : e6 3b __ INC T1 + 0 
3198 : a5 3b __ LDA T1 + 0 
319a : c9 78 __ CMP #$78
319c : 90 e8 __ BCC $3186 ; (sortFileList_far.l31 + 0)
.s5:
319e : a9 76 __ LDA #$76
31a0 : 85 1b __ STA P0 
31a2 : a9 01 __ LDA #$01
31a4 : 85 1f __ STA P4 
31a6 : a9 5e __ LDA #$5e
31a8 : 85 1c __ STA P1 
31aa : a9 03 __ LDA #$03
31ac : 85 1d __ STA P2 
31ae : 20 cc 14 JSR $14cc ; (FAR_POKE.s4 + 0)
31b1 : e6 1c __ INC P1 
31b3 : a9 3e __ LDA #$3e
31b5 : 85 1b __ STA P0 
31b7 : a9 03 __ LDA #$03
31b9 : 85 1d __ STA P2 
31bb : 20 c0 34 JSR $34c0 ; (FAR_PEEKW.s4 + 0)
31be : a5 29 __ LDA ACCU + 0 
31c0 : 85 47 __ STA T4 + 0 
31c2 : a5 2a __ LDA ACCU + 1 
31c4 : 85 48 __ STA T4 + 1 
31c6 : d0 07 __ BNE $31cf ; (sortFileList_far.s6 + 0)
.s30:
31c8 : a9 02 __ LDA #$02
31ca : c5 29 __ CMP ACCU + 0 
31cc : 90 01 __ BCC $31cf ; (sortFileList_far.s6 + 0)
.s3:
31ce : 60 __ __ RTS
.s6:
31cf : a9 00 __ LDA #$00
31d1 : 85 4a __ STA T5 + 1 
31d3 : 85 4c __ STA T6 + 1 
31d5 : a9 02 __ LDA #$02
31d7 : 85 49 __ STA T5 + 0 
31d9 : a9 f0 __ LDA #$f0
31db : 85 4b __ STA T6 + 0 
.l7:
31dd : a0 00 __ LDY #$00
31df : 24 4a __ BIT T5 + 1 
31e1 : 10 01 __ BPL $31e4 ; (sortFileList_far.s33 + 0)
.s32:
31e3 : 88 __ __ DEY
.s33:
31e4 : 18 __ __ CLC
31e5 : a5 49 __ LDA T5 + 0 
31e7 : 69 76 __ ADC #$76
31e9 : 85 1b __ STA P0 
31eb : a5 4a __ LDA T5 + 1 
31ed : 69 5e __ ADC #$5e
31ef : 85 1c __ STA P1 
31f1 : 98 __ __ TYA
31f2 : 69 03 __ ADC #$03
31f4 : 85 1d __ STA P2 
31f6 : 90 01 __ BCC $31f9 ; (sortFileList_far.s35 + 0)
.s34:
31f8 : c8 __ __ INY
.s35:
31f9 : 84 1e __ STY P3 
31fb : 20 b6 0f JSR $0fb6 ; (FAR_PEEK.s4 + 0)
31fe : c9 01 __ CMP #$01
3200 : a9 00 __ LDA #$00
3202 : 2a __ __ ROL
3203 : 85 50 __ STA T10 + 0 
3205 : a0 00 __ LDY #$00
3207 : 24 4c __ BIT T6 + 1 
3209 : 10 01 __ BPL $320c ; (sortFileList_far.s37 + 0)
.s36:
320b : 88 __ __ DEY
.s37:
320c : 18 __ __ CLC
320d : a5 4b __ LDA T6 + 0 
320f : 69 b6 __ ADC #$b6
3211 : 85 3b __ STA T1 + 0 
3213 : a5 4c __ LDA T6 + 1 
3215 : 69 00 __ ADC #$00
3217 : 85 3c __ STA T1 + 1 
3219 : 98 __ __ TYA
321a : 69 03 __ ADC #$03
321c : 85 3d __ STA T1 + 2 
321e : 90 02 __ BCC $3222 ; (sortFileList_far.s39 + 0)
.s38:
3220 : c8 __ __ INY
3221 : 18 __ __ CLC
.s39:
3222 : 84 3e __ STY T1 + 3 
3224 : a9 00 __ LDA #$00
3226 : 85 3f __ STA T2 + 0 
.l8:
3228 : 65 3b __ ADC T1 + 0 
322a : 85 1b __ STA P0 
322c : a5 3c __ LDA T1 + 1 
322e : 69 00 __ ADC #$00
3230 : 85 1c __ STA P1 
3232 : a5 3d __ LDA T1 + 2 
3234 : 69 00 __ ADC #$00
3236 : 85 1d __ STA P2 
3238 : a5 3e __ LDA T1 + 3 
323a : 69 00 __ ADC #$00
323c : 85 1e __ STA P3 
323e : 20 b6 0f JSR $0fb6 ; (FAR_PEEK.s4 + 0)
3241 : a6 3f __ LDX T2 + 0 
3243 : 9d 54 9f STA $9f54,x ; (keyName[0] + 0)
3246 : aa __ __ TAX
3247 : f0 08 __ BEQ $3251 ; (sortFileList_far.s9 + 0)
.s29:
3249 : e6 3f __ INC T2 + 0 
324b : a5 3f __ LDA T2 + 0 
324d : c9 78 __ CMP #$78
324f : 90 d7 __ BCC $3228 ; (sortFileList_far.l8 + 0)
.s9:
3251 : 38 __ __ SEC
3252 : a5 49 __ LDA T5 + 0 
3254 : e9 01 __ SBC #$01
3256 : 85 4d __ STA T7 + 0 
3258 : a5 4a __ LDA T5 + 1 
325a : e9 00 __ SBC #$00
325c : 85 4e __ STA T7 + 1 
325e : 10 03 __ BPL $3263 ; (sortFileList_far.l28 + 0)
3260 : 4c 10 33 JMP $3310 ; (sortFileList_far.s71 + 0)
.l28:
3263 : d0 07 __ BNE $326c ; (sortFileList_far.s15 + 0)
.s27:
3265 : a5 4d __ LDA T7 + 0 
3267 : d0 03 __ BNE $326c ; (sortFileList_far.s15 + 0)
3269 : 4c 12 33 JMP $3312 ; (sortFileList_far.s10 + 0)
.s15:
326c : 18 __ __ CLC
326d : a5 4d __ LDA T7 + 0 
326f : 69 76 __ ADC #$76
3271 : 85 1b __ STA P0 
3273 : a5 4e __ LDA T7 + 1 
3275 : 69 5e __ ADC #$5e
3277 : 85 1c __ STA P1 
3279 : a9 00 __ LDA #$00
327b : 69 03 __ ADC #$03
327d : 85 1d __ STA P2 
327f : a9 00 __ LDA #$00
3281 : 2a __ __ ROL
3282 : 85 1e __ STA P3 
3284 : 20 b6 0f JSR $0fb6 ; (FAR_PEEK.s4 + 0)
3287 : c9 01 __ CMP #$01
3289 : a9 00 __ LDA #$00
328b : 2a __ __ ROL
328c : 85 51 __ STA T11 + 0 
328e : a5 50 __ LDA T10 + 0 
3290 : f0 03 __ BEQ $3295 ; (sortFileList_far.s16 + 0)
3292 : 4c b6 34 JMP $34b6 ; (sortFileList_far.s26 + 0)
.s16:
3295 : a5 51 __ LDA T11 + 0 
3297 : d0 77 __ BNE $3310 ; (sortFileList_far.s71 + 0)
.s17:
3299 : a5 4d __ LDA T7 + 0 
329b : 85 29 __ STA ACCU + 0 
329d : a5 4e __ LDA T7 + 1 
329f : 85 2a __ STA ACCU + 1 
32a1 : a9 78 __ LDA #$78
32a3 : 20 60 72 JSR $7260 ; (mul16by8 + 0)
32a6 : a0 00 __ LDY #$00
32a8 : 24 2a __ BIT ACCU + 1 
32aa : 10 01 __ BPL $32ad ; (sortFileList_far.s53 + 0)
.s52:
32ac : 88 __ __ DEY
.s53:
32ad : 18 __ __ CLC
32ae : a5 29 __ LDA ACCU + 0 
32b0 : 69 b6 __ ADC #$b6
32b2 : 85 3b __ STA T1 + 0 
32b4 : a5 2a __ LDA ACCU + 1 
32b6 : 69 00 __ ADC #$00
32b8 : 85 3c __ STA T1 + 1 
32ba : 98 __ __ TYA
32bb : 69 03 __ ADC #$03
32bd : 85 3d __ STA T1 + 2 
32bf : 90 02 __ BCC $32c3 ; (sortFileList_far.s55 + 0)
.s54:
32c1 : c8 __ __ INY
32c2 : 18 __ __ CLC
.s55:
32c3 : 84 3e __ STY T1 + 3 
32c5 : a9 00 __ LDA #$00
32c7 : 85 3f __ STA T2 + 0 
.l18:
32c9 : 65 3b __ ADC T1 + 0 
32cb : 85 1b __ STA P0 
32cd : a5 3c __ LDA T1 + 1 
32cf : 69 00 __ ADC #$00
32d1 : 85 1c __ STA P1 
32d3 : a5 3d __ LDA T1 + 2 
32d5 : 69 00 __ ADC #$00
32d7 : 85 1d __ STA P2 
32d9 : a5 3e __ LDA T1 + 3 
32db : 69 00 __ ADC #$00
32dd : 85 1e __ STA P3 
32df : 20 b6 0f JSR $0fb6 ; (FAR_PEEK.s4 + 0)
32e2 : a6 3f __ LDX T2 + 0 
32e4 : 9d dc 9e STA $9edc,x ; (jName[0] + 0)
32e7 : aa __ __ TAX
32e8 : f0 08 __ BEQ $32f2 ; (sortFileList_far.s19 + 0)
.s25:
32ea : e6 3f __ INC T2 + 0 
32ec : a5 3f __ LDA T2 + 0 
32ee : c9 78 __ CMP #$78
32f0 : 90 d7 __ BCC $32c9 ; (sortFileList_far.l18 + 0)
.s19:
32f2 : a9 dc __ LDA #$dc
32f4 : 85 1c __ STA P1 
32f6 : a9 9f __ LDA #$9f
32f8 : 85 1f __ STA P4 
32fa : a9 9e __ LDA #$9e
32fc : 85 1d __ STA P2 
32fe : a9 54 __ LDA #$54
3300 : 85 1e __ STA P3 
3302 : 20 ff 34 JSR $34ff ; (strcasecmp_local.s4 + 0)
3305 : a5 2a __ LDA ACCU + 1 
3307 : 30 07 __ BMI $3310 ; (sortFileList_far.s71 + 0)
.s24:
3309 : 05 29 __ ORA ACCU + 0 
330b : f0 03 __ BEQ $3310 ; (sortFileList_far.s71 + 0)
330d : 4c c8 33 JMP $33c8 ; (sortFileList_far.s20 + 0)
.s71:
3310 : a5 4d __ LDA T7 + 0 
.s10:
3312 : 85 29 __ STA ACCU + 0 
3314 : a5 4e __ LDA T7 + 1 
3316 : 85 2a __ STA ACCU + 1 
3318 : a9 78 __ LDA #$78
331a : 20 60 72 JSR $7260 ; (mul16by8 + 0)
331d : 18 __ __ CLC
331e : a5 29 __ LDA ACCU + 0 
3320 : 69 78 __ ADC #$78
3322 : a5 2a __ LDA ACCU + 1 
3324 : 69 00 __ ADC #$00
3326 : 0a __ __ ASL
3327 : a0 00 __ LDY #$00
3329 : 90 01 __ BCC $332c ; (sortFileList_far.s41 + 0)
.s40:
332b : 88 __ __ DEY
.s41:
332c : 18 __ __ CLC
332d : a5 29 __ LDA ACCU + 0 
332f : 69 2e __ ADC #$2e
3331 : 85 3b __ STA T1 + 0 
3333 : a5 2a __ LDA ACCU + 1 
3335 : 69 01 __ ADC #$01
3337 : 85 3c __ STA T1 + 1 
3339 : 98 __ __ TYA
333a : 69 03 __ ADC #$03
333c : 85 3d __ STA T1 + 2 
333e : 90 02 __ BCC $3342 ; (sortFileList_far.s43 + 0)
.s42:
3340 : c8 __ __ INY
3341 : 18 __ __ CLC
.s43:
3342 : 84 3e __ STY T1 + 3 
3344 : a9 00 __ LDA #$00
3346 : 85 3f __ STA T2 + 0 
.l11:
3348 : 65 3b __ ADC T1 + 0 
334a : 85 1b __ STA P0 
334c : a5 3c __ LDA T1 + 1 
334e : 69 00 __ ADC #$00
3350 : 85 1c __ STA P1 
3352 : a5 3d __ LDA T1 + 2 
3354 : 69 00 __ ADC #$00
3356 : 85 1d __ STA P2 
3358 : a5 3e __ LDA T1 + 3 
335a : 69 00 __ ADC #$00
335c : 85 1e __ STA P3 
335e : a6 3f __ LDX T2 + 0 
3360 : bd 54 9f LDA $9f54,x ; (keyName[0] + 0)
3363 : 85 1f __ STA P4 
3365 : 20 cc 14 JSR $14cc ; (FAR_POKE.s4 + 0)
3368 : a6 3f __ LDX T2 + 0 
336a : bd 54 9f LDA $9f54,x ; (keyName[0] + 0)
336d : f0 08 __ BEQ $3377 ; (sortFileList_far.s12 + 0)
.s14:
336f : e6 3f __ INC T2 + 0 
3371 : a5 3f __ LDA T2 + 0 
3373 : c9 78 __ CMP #$78
3375 : 90 d1 __ BCC $3348 ; (sortFileList_far.l11 + 0)
.s12:
3377 : a5 50 __ LDA T10 + 0 
3379 : 85 1f __ STA P4 
337b : 18 __ __ CLC
337c : a5 4d __ LDA T7 + 0 
337e : 69 01 __ ADC #$01
3380 : a5 4e __ LDA T7 + 1 
3382 : 69 00 __ ADC #$00
3384 : 0a __ __ ASL
3385 : a0 00 __ LDY #$00
3387 : 90 01 __ BCC $338a ; (sortFileList_far.s45 + 0)
.s44:
3389 : 88 __ __ DEY
.s45:
338a : 18 __ __ CLC
338b : a5 4d __ LDA T7 + 0 
338d : 69 77 __ ADC #$77
338f : 85 1b __ STA P0 
3391 : a5 4e __ LDA T7 + 1 
3393 : 69 5e __ ADC #$5e
3395 : 85 1c __ STA P1 
3397 : 98 __ __ TYA
3398 : 69 03 __ ADC #$03
339a : 85 1d __ STA P2 
339c : 90 01 __ BCC $339f ; (sortFileList_far.s47 + 0)
.s46:
339e : c8 __ __ INY
.s47:
339f : 84 1e __ STY P3 
33a1 : 20 cc 14 JSR $14cc ; (FAR_POKE.s4 + 0)
33a4 : 18 __ __ CLC
33a5 : a5 4b __ LDA T6 + 0 
33a7 : 69 78 __ ADC #$78
33a9 : 85 4b __ STA T6 + 0 
33ab : 90 02 __ BCC $33af ; (sortFileList_far.s49 + 0)
.s48:
33ad : e6 4c __ INC T6 + 1 
.s49:
33af : e6 49 __ INC T5 + 0 
33b1 : d0 02 __ BNE $33b5 ; (sortFileList_far.s51 + 0)
.s50:
33b3 : e6 4a __ INC T5 + 1 
.s51:
33b5 : a5 4a __ LDA T5 + 1 
33b7 : c5 48 __ CMP T4 + 1 
33b9 : b0 03 __ BCS $33be ; (sortFileList_far.s70 + 0)
33bb : 4c dd 31 JMP $31dd ; (sortFileList_far.l7 + 0)
.s70:
33be : f0 01 __ BEQ $33c1 ; (sortFileList_far.s13 + 0)
33c0 : 60 __ __ RTS
.s13:
33c1 : a5 49 __ LDA T5 + 0 
33c3 : c5 47 __ CMP T4 + 0 
33c5 : 90 f4 __ BCC $33bb ; (sortFileList_far.s51 + 6)
33c7 : 60 __ __ RTS
.s20:
33c8 : a5 4d __ LDA T7 + 0 
33ca : 85 29 __ STA ACCU + 0 
33cc : a5 4e __ LDA T7 + 1 
33ce : 85 2a __ STA ACCU + 1 
33d0 : a9 78 __ LDA #$78
33d2 : 20 60 72 JSR $7260 ; (mul16by8 + 0)
33d5 : 18 __ __ CLC
33d6 : a5 29 __ LDA ACCU + 0 
33d8 : 69 78 __ ADC #$78
33da : a5 2a __ LDA ACCU + 1 
33dc : 69 00 __ ADC #$00
33de : 0a __ __ ASL
33df : a0 00 __ LDY #$00
33e1 : 90 01 __ BCC $33e4 ; (sortFileList_far.s57 + 0)
.s56:
33e3 : 88 __ __ DEY
.s57:
33e4 : 18 __ __ CLC
33e5 : a5 29 __ LDA ACCU + 0 
33e7 : 69 2e __ ADC #$2e
33e9 : 85 3b __ STA T1 + 0 
33eb : a5 2a __ LDA ACCU + 1 
33ed : 69 01 __ ADC #$01
33ef : 85 3c __ STA T1 + 1 
33f1 : 98 __ __ TYA
33f2 : 69 03 __ ADC #$03
33f4 : 85 3d __ STA T1 + 2 
33f6 : 90 01 __ BCC $33f9 ; (sortFileList_far.s59 + 0)
.s58:
33f8 : c8 __ __ INY
.s59:
33f9 : 84 3e __ STY T1 + 3 
33fb : a0 00 __ LDY #$00
33fd : 24 2a __ BIT ACCU + 1 
33ff : 10 01 __ BPL $3402 ; (sortFileList_far.s61 + 0)
.s60:
3401 : 88 __ __ DEY
.s61:
3402 : 18 __ __ CLC
3403 : a5 29 __ LDA ACCU + 0 
3405 : 69 b6 __ ADC #$b6
3407 : 85 3f __ STA T2 + 0 
3409 : a5 2a __ LDA ACCU + 1 
340b : 69 00 __ ADC #$00
340d : 85 40 __ STA T2 + 1 
340f : 98 __ __ TYA
3410 : 69 03 __ ADC #$03
3412 : 85 41 __ STA T2 + 2 
3414 : 90 02 __ BCC $3418 ; (sortFileList_far.s63 + 0)
.s62:
3416 : c8 __ __ INY
3417 : 18 __ __ CLC
.s63:
3418 : 84 42 __ STY T2 + 3 
341a : a9 00 __ LDA #$00
341c : 85 4f __ STA T8 + 0 
.l21:
341e : 65 3f __ ADC T2 + 0 
3420 : 85 43 __ STA T3 + 0 
3422 : 85 1b __ STA P0 
3424 : a5 40 __ LDA T2 + 1 
3426 : 69 00 __ ADC #$00
3428 : 85 44 __ STA T3 + 1 
342a : 85 1c __ STA P1 
342c : a5 41 __ LDA T2 + 2 
342e : 69 00 __ ADC #$00
3430 : 85 45 __ STA T3 + 2 
3432 : 85 1d __ STA P2 
3434 : a5 42 __ LDA T2 + 3 
3436 : 69 00 __ ADC #$00
3438 : 85 46 __ STA T3 + 3 
343a : 85 1e __ STA P3 
343c : 20 b6 0f JSR $0fb6 ; (FAR_PEEK.s4 + 0)
343f : 85 1f __ STA P4 
3441 : 18 __ __ CLC
3442 : a5 3b __ LDA T1 + 0 
3444 : 65 4f __ ADC T8 + 0 
3446 : 85 1b __ STA P0 
3448 : a5 3c __ LDA T1 + 1 
344a : 69 00 __ ADC #$00
344c : 85 1c __ STA P1 
344e : a5 3d __ LDA T1 + 2 
3450 : 69 00 __ ADC #$00
3452 : 85 1d __ STA P2 
3454 : a5 3e __ LDA T1 + 3 
3456 : 69 00 __ ADC #$00
3458 : 85 1e __ STA P3 
345a : 20 cc 14 JSR $14cc ; (FAR_POKE.s4 + 0)
345d : a5 43 __ LDA T3 + 0 
345f : 85 1b __ STA P0 
3461 : a5 44 __ LDA T3 + 1 
3463 : 85 1c __ STA P1 
3465 : a5 45 __ LDA T3 + 2 
3467 : 85 1d __ STA P2 
3469 : a5 46 __ LDA T3 + 3 
346b : 85 1e __ STA P3 
346d : 20 b6 0f JSR $0fb6 ; (FAR_PEEK.s4 + 0)
3470 : aa __ __ TAX
3471 : f0 08 __ BEQ $347b ; (sortFileList_far.s22 + 0)
.s23:
3473 : e6 4f __ INC T8 + 0 
3475 : a5 4f __ LDA T8 + 0 
3477 : c9 78 __ CMP #$78
3479 : 90 a3 __ BCC $341e ; (sortFileList_far.l21 + 0)
.s22:
347b : a5 51 __ LDA T11 + 0 
347d : 85 1f __ STA P4 
347f : e6 4d __ INC T7 + 0 
3481 : d0 02 __ BNE $3485 ; (sortFileList_far.s65 + 0)
.s64:
3483 : e6 4e __ INC T7 + 1 
.s65:
3485 : a0 00 __ LDY #$00
3487 : 24 4e __ BIT T7 + 1 
3489 : 10 01 __ BPL $348c ; (sortFileList_far.s67 + 0)
.s66:
348b : 88 __ __ DEY
.s67:
348c : 18 __ __ CLC
348d : a5 4d __ LDA T7 + 0 
348f : 69 76 __ ADC #$76
3491 : 85 1b __ STA P0 
3493 : a5 4e __ LDA T7 + 1 
3495 : 69 5e __ ADC #$5e
3497 : 85 1c __ STA P1 
3499 : 98 __ __ TYA
349a : 69 03 __ ADC #$03
349c : 85 1d __ STA P2 
349e : 90 01 __ BCC $34a1 ; (sortFileList_far.s69 + 0)
.s68:
34a0 : c8 __ __ INY
.s69:
34a1 : 84 1e __ STY P3 
34a3 : 20 cc 14 JSR $14cc ; (FAR_POKE.s4 + 0)
34a6 : 18 __ __ CLC
34a7 : a5 4d __ LDA T7 + 0 
34a9 : 69 fe __ ADC #$fe
34ab : 85 4d __ STA T7 + 0 
34ad : a5 4e __ LDA T7 + 1 
34af : 69 ff __ ADC #$ff
34b1 : 85 4e __ STA T7 + 1 
34b3 : 4c 63 32 JMP $3263 ; (sortFileList_far.l28 + 0)
.s26:
34b6 : a5 51 __ LDA T11 + 0 
34b8 : d0 03 __ BNE $34bd ; (sortFileList_far.s26 + 7)
34ba : 4c c8 33 JMP $33c8 ; (sortFileList_far.s20 + 0)
34bd : 4c 99 32 JMP $3299 ; (sortFileList_far.s17 + 0)
--------------------------------------------------------------------
FAR_PEEKW: ; FAR_PEEKW(u32)->u16
; 214, "/mnt/d/F256/f256lib-oscar64/f256lib/f256lib.h"
.s4:
34c0 : a5 0f __ LDA $0f 
34c2 : 85 38 __ STA T2 + 0 
34c4 : 78 __ __ SEI
34c5 : a5 1b __ LDA P0 ; (address + 0)
34c7 : 85 35 __ STA T0 + 0 
34c9 : a5 1c __ LDA P1 ; (address + 1)
34cb : 85 37 __ STA T1 + 0 
34cd : a5 1e __ LDA P3 ; (address + 3)
34cf : a2 05 __ LDX #$05
.l5:
34d1 : 4a __ __ LSR
34d2 : 66 1d __ ROR P2 ; (address + 2)
34d4 : 66 37 __ ROR T1 + 0 
34d6 : ca __ __ DEX
34d7 : d0 f8 __ BNE $34d1 ; (FAR_PEEKW.l5 + 0)
.s6:
34d9 : a5 37 __ LDA T1 + 0 
34db : 85 0f __ STA $0f 
34dd : a5 1c __ LDA P1 ; (address + 1)
34df : 29 1f __ AND #$1f
34e1 : 09 e0 __ ORA #$e0
34e3 : 85 36 __ STA T0 + 1 
34e5 : a0 00 __ LDY #$00
34e7 : b1 35 __ LDA (T0 + 0),y 
34e9 : aa __ __ TAX
34ea : c8 __ __ INY
34eb : b1 35 __ LDA (T0 + 0),y 
34ed : 86 35 __ STX T0 + 0 
34ef : 85 36 __ STA T0 + 1 
34f1 : a5 38 __ LDA T2 + 0 
34f3 : 85 0f __ STA $0f 
34f5 : 58 __ __ CLI
34f6 : a5 35 __ LDA T0 + 0 
34f8 : 85 29 __ STA ACCU + 0 
34fa : a5 36 __ LDA T0 + 1 
34fc : 85 2a __ STA ACCU + 1 
.s3:
34fe : 60 __ __ RTS
--------------------------------------------------------------------
strcasecmp_local: ; strcasecmp_local(const u8*,const u8*)->i16
; 176, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/muFilePicker.c"
.s4:
34ff : a0 00 __ LDY #$00
3501 : b1 1c __ LDA (P1),y ; (a + 0)
3503 : f0 58 __ BEQ $355d ; (strcasecmp_local.s5 + 0)
.s6:
3505 : a5 1e __ LDA P3 ; (b + 0)
3507 : 85 35 __ STA T1 + 0 
3509 : a5 1f __ LDA P4 ; (b + 1)
350b : 85 36 __ STA T1 + 1 
350d : b1 1e __ LDA (P3),y ; (b + 0)
350f : f0 4c __ BEQ $355d ; (strcasecmp_local.s5 + 0)
.l7:
3511 : 85 39 __ STA T3 + 0 
3513 : a5 1c __ LDA P1 ; (a + 0)
3515 : 85 37 __ STA T2 + 0 
3517 : a5 1d __ LDA P2 ; (a + 1)
3519 : 85 38 __ STA T2 + 1 
351b : b1 1c __ LDA (P1),y ; (a + 0)
351d : 20 09 31 JSR $3109 ; (tolower.s4 + 0)
3520 : 85 3a __ STA T4 + 0 
3522 : a5 39 __ LDA T3 + 0 
3524 : 20 09 31 JSR $3109 ; (tolower.s4 + 0)
3527 : c5 3a __ CMP T4 + 0 
3529 : f0 0e __ BEQ $3539 ; (strcasecmp_local.s8 + 0)
.s10:
352b : 49 ff __ EOR #$ff
352d : 38 __ __ SEC
352e : 65 3a __ ADC T4 + 0 
.s3:
3530 : 85 29 __ STA ACCU + 0 
3532 : a9 00 __ LDA #$00
3534 : e9 00 __ SBC #$00
3536 : 85 2a __ STA ACCU + 1 
3538 : 60 __ __ RTS
.s8:
3539 : e6 1c __ INC P1 ; (a + 0)
353b : d0 02 __ BNE $353f ; (strcasecmp_local.s12 + 0)
.s11:
353d : e6 1d __ INC P2 ; (a + 1)
.s12:
353f : 18 __ __ CLC
3540 : a5 35 __ LDA T1 + 0 
3542 : 69 01 __ ADC #$01
3544 : 85 1e __ STA P3 ; (b + 0)
3546 : a5 36 __ LDA T1 + 1 
3548 : 69 00 __ ADC #$00
354a : 85 1f __ STA P4 ; (b + 1)
354c : a0 01 __ LDY #$01
354e : b1 37 __ LDA (T2 + 0),y 
3550 : f0 0b __ BEQ $355d ; (strcasecmp_local.s5 + 0)
.s9:
3552 : e6 35 __ INC T1 + 0 
3554 : a5 1f __ LDA P4 ; (b + 1)
3556 : 85 36 __ STA T1 + 1 
3558 : 88 __ __ DEY
3559 : b1 1e __ LDA (P3),y ; (b + 0)
355b : d0 b4 __ BNE $3511 ; (strcasecmp_local.l7 + 0)
.s5:
355d : a8 __ __ TAY
355e : b1 1c __ LDA (P1),y ; (a + 0)
3560 : 20 09 31 JSR $3109 ; (tolower.s4 + 0)
3563 : 85 35 __ STA T1 + 0 
3565 : a0 00 __ LDY #$00
3567 : b1 1e __ LDA (P3),y ; (b + 0)
3569 : 20 09 31 JSR $3109 ; (tolower.s4 + 0)
356c : 49 ff __ EOR #$ff
356e : 38 __ __ SEC
356f : 65 35 __ ADC T1 + 0 
3571 : 4c 30 35 JMP $3530 ; (strcasecmp_local.s3 + 0)
--------------------------------------------------------------------
displayFileList_far: ; displayFileList_far(i16)->void
;  83, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/muFilePicker.h"
.s1:
3574 : a2 17 __ LDX #$17
3576 : b5 55 __ LDA T0 + 0,x 
3578 : 9d 6e 9e STA $9e6e,x ; (displayFileList_far@stack + 0)
357b : ca __ __ DEX
357c : 10 f8 __ BPL $3576 ; (displayFileList_far.s1 + 2)
.s4:
357e : a9 00 __ LDA #$00
3580 : 85 1b __ STA P0 
3582 : 85 1c __ STA P1 
3584 : 85 1e __ STA P3 
3586 : a9 03 __ LDA #$03
3588 : 85 1d __ STA P2 
358a : 20 b6 0f JSR $0fb6 ; (FAR_PEEK.s4 + 0)
358d : 85 6b __ STA T14 + 0 
358f : e6 1b __ INC P0 
3591 : a9 03 __ LDA #$03
3593 : 85 1d __ STA P2 
3595 : 20 b6 0f JSR $0fb6 ; (FAR_PEEK.s4 + 0)
3598 : 85 6c __ STA T15 + 0 
359a : a9 3e __ LDA #$3e
359c : 85 1b __ STA P0 
359e : a9 03 __ LDA #$03
35a0 : 85 1d __ STA P2 
35a2 : a9 5f __ LDA #$5f
35a4 : 85 1c __ STA P1 
35a6 : 20 c0 34 JSR $34c0 ; (FAR_PEEKW.s4 + 0)
35a9 : a5 29 __ LDA ACCU + 0 
35ab : 85 5b __ STA T2 + 0 
35ad : a5 2a __ LDA ACCU + 1 
35af : 85 5c __ STA T2 + 1 
35b1 : a9 42 __ LDA #$42
35b3 : 85 1b __ STA P0 
35b5 : a9 03 __ LDA #$03
35b7 : 85 1d __ STA P2 
35b9 : 20 c0 34 JSR $34c0 ; (FAR_PEEKW.s4 + 0)
35bc : a5 29 __ LDA ACCU + 0 
35be : 85 5d __ STA T3 + 0 
35c0 : a5 2a __ LDA ACCU + 1 
35c2 : 85 5e __ STA T3 + 1 
35c4 : a9 46 __ LDA #$46
35c6 : 85 1b __ STA P0 
35c8 : a9 03 __ LDA #$03
35ca : 85 1d __ STA P2 
35cc : 20 c0 34 JSR $34c0 ; (FAR_PEEKW.s4 + 0)
35cf : a5 29 __ LDA ACCU + 0 
35d1 : 85 5f __ STA T4 + 0 
35d3 : a5 2a __ LDA ACCU + 1 
35d5 : 85 60 __ STA T4 + 1 
35d7 : ad dc 9f LDA $9fdc ; (sstack + 16)
35da : 85 55 __ STA T0 + 0 
35dc : 18 __ __ CLC
35dd : 69 28 __ ADC #$28
35df : 85 61 __ STA T5 + 0 
35e1 : ad dd 9f LDA $9fdd ; (sstack + 17)
35e4 : 85 56 __ STA T0 + 1 
35e6 : 69 00 __ ADC #$00
35e8 : 85 62 __ STA T5 + 1 
35ea : c5 5c __ CMP T2 + 1 
35ec : d0 04 __ BNE $35f2 ; (displayFileList_far.s46 + 0)
.s45:
35ee : a5 61 __ LDA T5 + 0 
35f0 : c5 5b __ CMP T2 + 0 
.s46:
35f2 : 90 08 __ BCC $35fc ; (displayFileList_far.s5 + 0)
.s44:
35f4 : a5 5b __ LDA T2 + 0 
35f6 : 85 61 __ STA T5 + 0 
35f8 : a5 5c __ LDA T2 + 1 
35fa : 85 62 __ STA T5 + 1 
.s5:
35fc : a5 6b __ LDA T14 + 0 
35fe : 85 1b __ STA P0 
3600 : a5 6c __ LDA T15 + 0 
3602 : 85 1c __ STA P1 
3604 : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
3607 : 20 4f 38 JSR $384f ; (wipeArea_far.s1 + 0)
360a : a5 6b __ LDA T14 + 0 
360c : 85 1b __ STA P0 
360e : a5 6c __ LDA T15 + 0 
3610 : 85 1c __ STA P1 
3612 : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
3615 : 18 __ __ CLC
3616 : a5 55 __ LDA T0 + 0 
3618 : 69 01 __ ADC #$01
361a : 85 63 __ STA T6 + 0 
361c : a5 56 __ LDA T0 + 1 
361e : 69 00 __ ADC #$00
3620 : 85 64 __ STA T6 + 1 
3622 : a9 00 __ LDA #$00
3624 : 85 57 __ STA T1 + 0 
3626 : 18 __ __ CLC
.l6:
3627 : 69 b6 __ ADC #$b6
3629 : 85 1b __ STA P0 
362b : a9 00 __ LDA #$00
362d : 85 1e __ STA P3 
362f : 2a __ __ ROL
3630 : 85 1c __ STA P1 
3632 : a9 03 __ LDA #$03
3634 : 85 1d __ STA P2 
3636 : 20 b6 0f JSR $0fb6 ; (FAR_PEEK.s4 + 0)
3639 : a6 57 __ LDX T1 + 0 
363b : 9d 06 9f STA $9f06,x ; (nameBuf[0] + 0)
363e : aa __ __ TAX
363f : f0 08 __ BEQ $3649 ; (displayFileList_far.s7 + 0)
.s43:
3641 : e6 57 __ INC T1 + 0 
3643 : a5 57 __ LDA T1 + 0 
3645 : c9 78 __ CMP #$78
3647 : 90 de __ BCC $3627 ; (displayFileList_far.l6 + 0)
.s7:
3649 : a9 76 __ LDA #$76
364b : 85 1b __ STA P0 
364d : a9 03 __ LDA #$03
364f : 85 1d __ STA P2 
3651 : a9 5e __ LDA #$5e
3653 : 85 1c __ STA P1 
3655 : 20 b6 0f JSR $0fb6 ; (FAR_PEEK.s4 + 0)
3658 : a8 __ __ TAY
3659 : a9 06 __ LDA #$06
365b : 8d d8 9f STA $9fd8 ; (sstack + 12)
365e : a9 9f __ LDA #$9f
3660 : 8d d9 9f STA $9fd9 ; (sstack + 13)
3663 : a5 5f __ LDA T4 + 0 
3665 : 05 60 __ ORA T4 + 1 
3667 : d0 03 __ BNE $366c ; (displayFileList_far.s8 + 0)
3669 : 4c 3a 38 JMP $383a ; (displayFileList_far.s42 + 0)
.s8:
366c : a9 20 __ LDA #$20
366e : 8d d6 9f STA $9fd6 ; (sstack + 10)
3671 : a9 00 __ LDA #$00
3673 : 8d d7 9f STA $9fd7 ; (sstack + 11)
3676 : 98 __ __ TYA
3677 : d0 07 __ BNE $3680 ; (displayFileList_far.s41 + 0)
.s9:
3679 : a9 17 __ LDA #$17
367b : a0 74 __ LDY #$74
367d : 4c 84 36 JMP $3684 ; (displayFileList_far.s10 + 0)
.s41:
3680 : a9 14 __ LDA #$14
3682 : a0 fd __ LDY #$fd
.s10:
3684 : 8c da 9f STY $9fda ; (sstack + 14)
3687 : 8d db 9f STA $9fdb ; (sstack + 15)
368a : a9 1c __ LDA #$1c
368c : 8d d4 9f STA $9fd4 ; (sstack + 8)
368f : a9 47 __ LDA #$47
3691 : 8d d5 9f STA $9fd5 ; (sstack + 9)
3694 : 20 b4 38 JSR $38b4 ; (printf.s4 + 0)
3697 : a5 64 __ LDA T6 + 1 
3699 : c5 62 __ CMP T5 + 1 
369b : d0 08 __ BNE $36a5 ; (displayFileList_far.s40 + 0)
.s37:
369d : a5 63 __ LDA T6 + 0 
369f : c5 61 __ CMP T5 + 0 
.s38:
36a1 : 90 08 __ BCC $36ab ; (displayFileList_far.s21 + 0)
36a3 : b0 27 __ BCS $36cc ; (displayFileList_far.s11 + 0)
.s40:
36a5 : 45 62 __ EOR T5 + 1 
36a7 : 10 f8 __ BPL $36a1 ; (displayFileList_far.s38 + 0)
.s39:
36a9 : 90 21 __ BCC $36cc ; (displayFileList_far.s11 + 0)
.s21:
36ab : a5 63 __ LDA T6 + 0 
36ad : 85 29 __ STA ACCU + 0 
36af : 85 68 __ STA T9 + 0 
36b1 : a5 64 __ LDA T6 + 1 
36b3 : 85 2a __ STA ACCU + 1 
36b5 : 85 69 __ STA T9 + 1 
36b7 : a9 78 __ LDA #$78
36b9 : 20 60 72 JSR $7260 ; (mul16by8 + 0)
36bc : a5 29 __ LDA ACCU + 0 
36be : 85 65 __ STA T7 + 0 
36c0 : a5 2a __ LDA ACCU + 1 
36c2 : 85 66 __ STA T7 + 1 
36c4 : a6 6c __ LDX T15 + 0 
36c6 : e8 __ __ INX
36c7 : 86 67 __ STX T8 + 0 
36c9 : 4c 39 37 JMP $3739 ; (displayFileList_far.l22 + 0)
.s11:
36cc : 18 __ __ CLC
36cd : a5 6b __ LDA T14 + 0 
36cf : 69 02 __ ADC #$02
36d1 : 85 1b __ STA P0 
36d3 : 38 __ __ SEC
36d4 : a5 61 __ LDA T5 + 0 
36d6 : e5 63 __ SBC T6 + 0 
36d8 : 38 __ __ SEC
36d9 : 65 6c __ ADC T15 + 0 
36db : 85 1c __ STA P1 
36dd : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
36e0 : a9 2e __ LDA #$2e
36e2 : 8d d4 9f STA $9fd4 ; (sstack + 8)
36e5 : a9 47 __ LDA #$47
36e7 : 8d d5 9f STA $9fd5 ; (sstack + 9)
36ea : a5 5e __ LDA T3 + 1 
36ec : d0 0a __ BNE $36f8 ; (displayFileList_far.s19 + 0)
.s20:
36ee : a5 5d __ LDA T3 + 0 
36f0 : c9 27 __ CMP #$27
36f2 : b0 04 __ BCS $36f8 ; (displayFileList_far.s19 + 0)
.s12:
36f4 : a9 20 __ LDA #$20
36f6 : 90 02 __ BCC $36fa ; (displayFileList_far.s13 + 0)
.s19:
36f8 : a9 fb __ LDA #$fb
.s13:
36fa : 8d d6 9f STA $9fd6 ; (sstack + 10)
36fd : a9 00 __ LDA #$00
36ff : 8d d7 9f STA $9fd7 ; (sstack + 11)
3702 : 38 __ __ SEC
3703 : a5 5d __ LDA T3 + 0 
3705 : e5 5f __ SBC T4 + 0 
3707 : a8 __ __ TAY
3708 : a5 5e __ LDA T3 + 1 
370a : e5 60 __ SBC T4 + 1 
370c : aa __ __ TAX
370d : 98 __ __ TYA
370e : 18 __ __ CLC
370f : 69 28 __ ADC #$28
3711 : a8 __ __ TAY
3712 : 8a __ __ TXA
3713 : 69 00 __ ADC #$00
3715 : c5 5c __ CMP T2 + 1 
3717 : d0 02 __ BNE $371b ; (displayFileList_far.s18 + 0)
.s17:
3719 : c4 5b __ CPY T2 + 0 
.s18:
371b : b0 04 __ BCS $3721 ; (displayFileList_far.s14 + 0)
.s16:
371d : a9 f8 __ LDA #$f8
371f : 90 02 __ BCC $3723 ; (displayFileList_far.s15 + 0)
.s14:
3721 : a9 20 __ LDA #$20
.s15:
3723 : 8d d8 9f STA $9fd8 ; (sstack + 12)
3726 : a9 00 __ LDA #$00
3728 : 8d d9 9f STA $9fd9 ; (sstack + 13)
372b : 20 b4 38 JSR $38b4 ; (printf.s4 + 0)
.s3:
372e : a2 17 __ LDX #$17
3730 : bd 6e 9e LDA $9e6e,x ; (displayFileList_far@stack + 0)
3733 : 95 55 __ STA T0 + 0,x 
3735 : ca __ __ DEX
3736 : 10 f8 __ BPL $3730 ; (displayFileList_far.s3 + 2)
3738 : 60 __ __ RTS
.l22:
3739 : a5 6b __ LDA T14 + 0 
373b : 85 1b __ STA P0 
373d : a5 67 __ LDA T8 + 0 
373f : 85 1c __ STA P1 
3741 : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
3744 : a5 5e __ LDA T3 + 1 
3746 : c5 69 __ CMP T9 + 1 
3748 : d0 0a __ BNE $3754 ; (displayFileList_far.s23 + 0)
.s36:
374a : a5 5d __ LDA T3 + 0 
374c : c5 68 __ CMP T9 + 0 
374e : d0 04 __ BNE $3754 ; (displayFileList_far.s23 + 0)
.s35:
3750 : a9 fa __ LDA #$fa
3752 : d0 02 __ BNE $3756 ; (displayFileList_far.s24 + 0)
.s23:
3754 : a9 20 __ LDA #$20
.s24:
3756 : 8d d6 9f STA $9fd6 ; (sstack + 10)
3759 : a9 00 __ LDA #$00
375b : 8d d7 9f STA $9fd7 ; (sstack + 11)
375e : a9 23 __ LDA #$23
3760 : 8d d4 9f STA $9fd4 ; (sstack + 8)
3763 : a9 47 __ LDA #$47
3765 : 8d d5 9f STA $9fd5 ; (sstack + 9)
3768 : 20 b4 38 JSR $38b4 ; (printf.s4 + 0)
376b : a0 00 __ LDY #$00
376d : 24 66 __ BIT T7 + 1 
376f : 10 01 __ BPL $3772 ; (displayFileList_far.s48 + 0)
.s47:
3771 : 88 __ __ DEY
.s48:
3772 : 18 __ __ CLC
3773 : a5 65 __ LDA T7 + 0 
3775 : 69 b6 __ ADC #$b6
3777 : 85 57 __ STA T1 + 0 
3779 : a5 66 __ LDA T7 + 1 
377b : 69 00 __ ADC #$00
377d : 85 58 __ STA T1 + 1 
377f : 98 __ __ TYA
3780 : 69 03 __ ADC #$03
3782 : 85 59 __ STA T1 + 2 
3784 : 90 02 __ BCC $3788 ; (displayFileList_far.s50 + 0)
.s49:
3786 : c8 __ __ INY
3787 : 18 __ __ CLC
.s50:
3788 : 84 5a __ STY T1 + 3 
378a : a9 00 __ LDA #$00
378c : 85 6a __ STA T11 + 0 
.l25:
378e : 65 57 __ ADC T1 + 0 
3790 : 85 1b __ STA P0 
3792 : a5 58 __ LDA T1 + 1 
3794 : 69 00 __ ADC #$00
3796 : 85 1c __ STA P1 
3798 : a5 59 __ LDA T1 + 2 
379a : 69 00 __ ADC #$00
379c : 85 1d __ STA P2 
379e : a5 5a __ LDA T1 + 3 
37a0 : 69 00 __ ADC #$00
37a2 : 85 1e __ STA P3 
37a4 : 20 b6 0f JSR $0fb6 ; (FAR_PEEK.s4 + 0)
37a7 : a6 6a __ LDX T11 + 0 
37a9 : 9d 8e 9e STA $9e8e,x ; (nameBuf[0] + 0)
37ac : aa __ __ TAX
37ad : f0 08 __ BEQ $37b7 ; (displayFileList_far.s26 + 0)
.s34:
37af : e6 6a __ INC T11 + 0 
37b1 : a5 6a __ LDA T11 + 0 
37b3 : c9 77 __ CMP #$77
37b5 : 90 d7 __ BCC $378e ; (displayFileList_far.l25 + 0)
.s26:
37b7 : a5 69 __ LDA T9 + 1 
37b9 : 0a __ __ ASL
37ba : a9 00 __ LDA #$00
37bc : 8d 05 9f STA $9f05 ; (nameBuf[0] + 119)
37bf : 69 ff __ ADC #$ff
37c1 : 49 ff __ EOR #$ff
37c3 : a8 __ __ TAY
37c4 : 18 __ __ CLC
37c5 : a5 68 __ LDA T9 + 0 
37c7 : 69 76 __ ADC #$76
37c9 : 85 1b __ STA P0 
37cb : a5 69 __ LDA T9 + 1 
37cd : 69 5e __ ADC #$5e
37cf : 85 1c __ STA P1 
37d1 : 98 __ __ TYA
37d2 : 69 03 __ ADC #$03
37d4 : 85 1d __ STA P2 
37d6 : 90 01 __ BCC $37d9 ; (displayFileList_far.s52 + 0)
.s51:
37d8 : c8 __ __ INY
.s52:
37d9 : 84 1e __ STY P3 
37db : 20 b6 0f JSR $0fb6 ; (FAR_PEEK.s4 + 0)
37de : a2 8e __ LDX #$8e
37e0 : 8e d6 9f STX $9fd6 ; (sstack + 10)
37e3 : a2 9e __ LDX #$9e
37e5 : 8e d7 9f STX $9fd7 ; (sstack + 11)
37e8 : aa __ __ TAX
37e9 : d0 07 __ BNE $37f2 ; (displayFileList_far.s33 + 0)
.s27:
37eb : a9 17 __ LDA #$17
37ed : a0 74 __ LDY #$74
37ef : 4c f6 37 JMP $37f6 ; (displayFileList_far.s28 + 0)
.s33:
37f2 : a9 14 __ LDA #$14
37f4 : a0 fd __ LDY #$fd
.s28:
37f6 : 8c d8 9f STY $9fd8 ; (sstack + 12)
37f9 : 8d d9 9f STA $9fd9 ; (sstack + 13)
37fc : a9 26 __ LDA #$26
37fe : 8d d4 9f STA $9fd4 ; (sstack + 8)
3801 : a9 47 __ LDA #$47
3803 : 8d d5 9f STA $9fd5 ; (sstack + 9)
3806 : 20 b4 38 JSR $38b4 ; (printf.s4 + 0)
3809 : 18 __ __ CLC
380a : a5 65 __ LDA T7 + 0 
380c : 69 78 __ ADC #$78
380e : 85 65 __ STA T7 + 0 
3810 : 90 02 __ BCC $3814 ; (displayFileList_far.s54 + 0)
.s53:
3812 : e6 66 __ INC T7 + 1 
.s54:
3814 : e6 67 __ INC T8 + 0 
3816 : e6 68 __ INC T9 + 0 
3818 : d0 02 __ BNE $381c ; (displayFileList_far.s56 + 0)
.s55:
381a : e6 69 __ INC T9 + 1 
.s56:
381c : a5 69 __ LDA T9 + 1 
381e : c5 62 __ CMP T5 + 1 
3820 : d0 07 __ BNE $3829 ; (displayFileList_far.s32 + 0)
.s29:
3822 : a5 68 __ LDA T9 + 0 
3824 : c5 61 __ CMP T5 + 0 
3826 : 4c 2d 38 JMP $382d ; (displayFileList_far.s30 + 0)
.s32:
3829 : 45 62 __ EOR T5 + 1 
382b : 30 08 __ BMI $3835 ; (displayFileList_far.s31 + 0)
.s30:
382d : b0 03 __ BCS $3832 ; (displayFileList_far.s30 + 5)
382f : 4c 39 37 JMP $3739 ; (displayFileList_far.l22 + 0)
3832 : 4c cc 36 JMP $36cc ; (displayFileList_far.s11 + 0)
.s31:
3835 : b0 f8 __ BCS $382f ; (displayFileList_far.s30 + 2)
3837 : 4c cc 36 JMP $36cc ; (displayFileList_far.s11 + 0)
.s42:
383a : 8d d7 9f STA $9fd7 ; (sstack + 11)
383d : 85 5f __ STA T4 + 0 
383f : 85 60 __ STA T4 + 1 
3841 : a9 fa __ LDA #$fa
3843 : 8d d6 9f STA $9fd6 ; (sstack + 10)
3846 : 98 __ __ TYA
3847 : f0 03 __ BEQ $384c ; (displayFileList_far.s42 + 18)
3849 : 4c 80 36 JMP $3680 ; (displayFileList_far.s41 + 0)
384c : 4c 79 36 JMP $3679 ; (displayFileList_far.s9 + 0)
--------------------------------------------------------------------
wipeArea_far: ; wipeArea_far()->void
;  85, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/muFilePicker.h"
.s1:
384f : a5 55 __ LDA T4 + 0 
3851 : 8d 7e 9f STA $9f7e ; (wipeArea_far@stack + 0)
3854 : a5 56 __ LDA T5 + 0 
3856 : 8d 7f 9f STA $9f7f ; (wipeArea_far@stack + 1)
.s4:
3859 : a9 00 __ LDA #$00
385b : 85 1c __ STA P1 
385d : 85 1e __ STA P3 
385f : a9 01 __ LDA #$01
3861 : 85 1b __ STA P0 
3863 : a9 03 __ LDA #$03
3865 : 85 1d __ STA P2 
3867 : 20 b6 0f JSR $0fb6 ; (FAR_PEEK.s4 + 0)
386a : 85 53 __ STA T2 + 0 
386c : c9 50 __ CMP #$50
386e : a9 29 __ LDA #$29
3870 : 85 55 __ STA T4 + 0 
3872 : a9 00 __ LDA #$00
3874 : 6a __ __ ROR
3875 : 85 54 __ STA T3 + 0 
3877 : 10 15 __ BPL $388e ; (wipeArea_far.l7 + 0)
.l5:
3879 : a9 1a __ LDA #$1a
387b : 8d d4 9f STA $9fd4 ; (sstack + 8)
387e : a9 47 __ LDA #$47
3880 : 8d d5 9f STA $9fd5 ; (sstack + 9)
3883 : 20 b4 38 JSR $38b4 ; (printf.s4 + 0)
3886 : c6 55 __ DEC T4 + 0 
3888 : f0 1f __ BEQ $38a9 ; (wipeArea_far.s3 + 0)
.s6:
388a : 24 54 __ BIT T3 + 0 
388c : 30 eb __ BMI $3879 ; (wipeArea_far.l5 + 0)
.l7:
388e : a5 53 __ LDA T2 + 0 
3890 : 85 56 __ STA T5 + 0 
.l8:
3892 : a9 74 __ LDA #$74
3894 : 8d d4 9f STA $9fd4 ; (sstack + 8)
3897 : a9 17 __ LDA #$17
3899 : 8d d5 9f STA $9fd5 ; (sstack + 9)
389c : 20 b4 38 JSR $38b4 ; (printf.s4 + 0)
389f : e6 56 __ INC T5 + 0 
38a1 : a5 56 __ LDA T5 + 0 
38a3 : c9 50 __ CMP #$50
38a5 : 90 eb __ BCC $3892 ; (wipeArea_far.l8 + 0)
38a7 : b0 d0 __ BCS $3879 ; (wipeArea_far.l5 + 0)
.s3:
38a9 : ad 7e 9f LDA $9f7e ; (wipeArea_far@stack + 0)
38ac : 85 55 __ STA T4 + 0 
38ae : ad 7f 9f LDA $9f7f ; (wipeArea_far@stack + 1)
38b1 : 85 56 __ STA T5 + 0 
38b3 : 60 __ __ RTS
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
;  18, "/mnt/d/F256/oscar64/include/stdio.h"
.s4:
38b4 : a9 01 __ LDA #$01
38b6 : 8d d3 9f STA $9fd3 ; (sstack + 7)
38b9 : a9 82 __ LDA #$82
38bb : 8d cd 9f STA $9fcd ; (sstack + 1)
38be : a9 9f __ LDA #$9f
38c0 : 8d ce 9f STA $9fce ; (sstack + 2)
38c3 : ad d4 9f LDA $9fd4 ; (sstack + 8)
38c6 : 8d cf 9f STA $9fcf ; (sstack + 3)
38c9 : ad d5 9f LDA $9fd5 ; (sstack + 9)
38cc : 8d d0 9f STA $9fd0 ; (sstack + 4)
38cf : a9 d6 __ LDA #$d6
38d1 : 8d d1 9f STA $9fd1 ; (sstack + 5)
38d4 : a9 9f __ LDA #$9f
38d6 : 8d d2 9f STA $9fd2 ; (sstack + 6)
38d9 : 4c dc 38 JMP $38dc ; (sformat.s4 + 0)
--------------------------------------------------------------------
sformat: ; sformat(u8*,const u8*,i16*,bool)->u8*
; 351, "/mnt/d/F256/oscar64/include/stdio.c"
.s4:
38dc : ad cf 9f LDA $9fcf ; (sstack + 3)
38df : 85 4b __ STA T3 + 0 
38e1 : a9 00 __ LDA #$00
38e3 : 85 51 __ STA T6 + 0 
38e5 : ad d0 9f LDA $9fd0 ; (sstack + 4)
38e8 : 85 4c __ STA T3 + 1 
38ea : ad cd 9f LDA $9fcd ; (sstack + 1)
38ed : 85 4d __ STA T4 + 0 
38ef : ad ce 9f LDA $9fce ; (sstack + 2)
38f2 : 85 4e __ STA T4 + 1 
.l5:
38f4 : a0 00 __ LDY #$00
38f6 : b1 4b __ LDA (T3 + 0),y 
38f8 : d0 2c __ BNE $3926 ; (sformat.s10 + 0)
.s6:
38fa : a4 51 __ LDY T6 + 0 
38fc : 91 4d __ STA (T4 + 0),y 
38fe : 98 __ __ TYA
38ff : f0 1e __ BEQ $391f ; (sformat.s95 + 0)
.s7:
3901 : ad d3 9f LDA $9fd3 ; (sstack + 7)
3904 : d0 0e __ BNE $3914 ; (sformat.s9 + 0)
.s8:
3906 : 98 __ __ TYA
3907 : 18 __ __ CLC
3908 : 65 4d __ ADC T4 + 0 
390a : aa __ __ TAX
390b : a5 4e __ LDA T4 + 1 
390d : 69 00 __ ADC #$00
.s3:
390f : 86 29 __ STX ACCU + 0 ; (buff + 1)
3911 : 85 2a __ STA ACCU + 1 ; (fmt + 0)
3913 : 60 __ __ RTS
.s9:
3914 : a5 4d __ LDA T4 + 0 
3916 : 85 1c __ STA P1 
3918 : a5 4e __ LDA T4 + 1 
391a : 85 1d __ STA P2 
391c : 20 21 3d JSR $3d21 ; (puts.l4 + 0)
.s95:
391f : a5 4e __ LDA T4 + 1 
3921 : a6 4d __ LDX T4 + 0 
3923 : 4c 0f 39 JMP $390f ; (sformat.s3 + 0)
.s10:
3926 : c9 25 __ CMP #$25
3928 : f0 3e __ BEQ $3968 ; (sformat.s15 + 0)
.s11:
392a : a4 51 __ LDY T6 + 0 
392c : 91 4d __ STA (T4 + 0),y 
392e : e6 4b __ INC T3 + 0 
3930 : d0 02 __ BNE $3934 ; (sformat.s119 + 0)
.s118:
3932 : e6 4c __ INC T3 + 1 
.s119:
3934 : c8 __ __ INY
3935 : 84 51 __ STY T6 + 0 
3937 : 98 __ __ TYA
3938 : c0 28 __ CPY #$28
393a : 90 b8 __ BCC $38f4 ; (sformat.l5 + 0)
.s12:
393c : 85 35 __ STA T0 + 0 
393e : a9 00 __ LDA #$00
3940 : 85 51 __ STA T6 + 0 
3942 : ad d3 9f LDA $9fd3 ; (sstack + 7)
3945 : f0 14 __ BEQ $395b ; (sformat.s13 + 0)
.s14:
3947 : a5 4d __ LDA T4 + 0 
3949 : 85 1c __ STA P1 
394b : a5 4e __ LDA T4 + 1 
394d : 85 1d __ STA P2 
394f : a9 00 __ LDA #$00
3951 : a4 35 __ LDY T0 + 0 
3953 : 91 1c __ STA (P1),y 
3955 : 20 21 3d JSR $3d21 ; (puts.l4 + 0)
3958 : 4c f4 38 JMP $38f4 ; (sformat.l5 + 0)
.s13:
395b : 18 __ __ CLC
395c : a5 4d __ LDA T4 + 0 
395e : 65 35 __ ADC T0 + 0 
3960 : 85 4d __ STA T4 + 0 
3962 : 90 90 __ BCC $38f4 ; (sformat.l5 + 0)
.s120:
3964 : e6 4e __ INC T4 + 1 
3966 : b0 8c __ BCS $38f4 ; (sformat.l5 + 0)
.s15:
3968 : a5 51 __ LDA T6 + 0 
396a : f0 27 __ BEQ $3993 ; (sformat.s16 + 0)
.s89:
396c : 84 51 __ STY T6 + 0 
396e : 85 35 __ STA T0 + 0 
3970 : ad d3 9f LDA $9fd3 ; (sstack + 7)
3973 : f0 13 __ BEQ $3988 ; (sformat.s90 + 0)
.s91:
3975 : a5 4d __ LDA T4 + 0 
3977 : 85 1c __ STA P1 
3979 : a5 4e __ LDA T4 + 1 
397b : 85 1d __ STA P2 
397d : 98 __ __ TYA
397e : a4 35 __ LDY T0 + 0 
3980 : 91 1c __ STA (P1),y 
3982 : 20 21 3d JSR $3d21 ; (puts.l4 + 0)
3985 : 4c 93 39 JMP $3993 ; (sformat.s16 + 0)
.s90:
3988 : 18 __ __ CLC
3989 : a5 4d __ LDA T4 + 0 
398b : 65 35 __ ADC T0 + 0 
398d : 85 4d __ STA T4 + 0 
398f : 90 02 __ BCC $3993 ; (sformat.s16 + 0)
.s117:
3991 : e6 4e __ INC T4 + 1 
.s16:
3993 : a9 00 __ LDA #$00
3995 : 8d b9 9f STA $9fb9 ; (si.sign + 0)
3998 : 8d ba 9f STA $9fba ; (si.left + 0)
399b : 8d bb 9f STA $9fbb ; (si.prefix + 0)
399e : a0 01 __ LDY #$01
39a0 : b1 4b __ LDA (T3 + 0),y 
39a2 : a2 20 __ LDX #$20
39a4 : 8e b4 9f STX $9fb4 ; (si.fill + 0)
39a7 : a2 00 __ LDX #$00
39a9 : 8e b5 9f STX $9fb5 ; (si.width + 0)
39ac : ca __ __ DEX
39ad : 8e b6 9f STX $9fb6 ; (si.precision + 0)
39b0 : a2 0a __ LDX #$0a
39b2 : 8e b8 9f STX $9fb8 ; (si.base + 0)
39b5 : aa __ __ TAX
39b6 : a9 02 __ LDA #$02
39b8 : d0 07 __ BNE $39c1 ; (sformat.l17 + 0)
.s85:
39ba : a0 00 __ LDY #$00
39bc : b1 4b __ LDA (T3 + 0),y 
39be : aa __ __ TAX
39bf : a9 01 __ LDA #$01
.l17:
39c1 : 18 __ __ CLC
39c2 : 65 4b __ ADC T3 + 0 
39c4 : 85 4b __ STA T3 + 0 
39c6 : 90 02 __ BCC $39ca ; (sformat.s106 + 0)
.s105:
39c8 : e6 4c __ INC T3 + 1 
.s106:
39ca : 8a __ __ TXA
39cb : e0 2b __ CPX #$2b
39cd : d0 07 __ BNE $39d6 ; (sformat.s18 + 0)
.s88:
39cf : a9 01 __ LDA #$01
39d1 : 8d b9 9f STA $9fb9 ; (si.sign + 0)
39d4 : d0 e4 __ BNE $39ba ; (sformat.s85 + 0)
.s18:
39d6 : c9 30 __ CMP #$30
39d8 : d0 06 __ BNE $39e0 ; (sformat.s19 + 0)
.s87:
39da : 8d b4 9f STA $9fb4 ; (si.fill + 0)
39dd : 4c ba 39 JMP $39ba ; (sformat.s85 + 0)
.s19:
39e0 : c9 23 __ CMP #$23
39e2 : d0 07 __ BNE $39eb ; (sformat.s20 + 0)
.s86:
39e4 : a9 01 __ LDA #$01
39e6 : 8d bb 9f STA $9fbb ; (si.prefix + 0)
39e9 : d0 cf __ BNE $39ba ; (sformat.s85 + 0)
.s20:
39eb : c9 2d __ CMP #$2d
39ed : d0 07 __ BNE $39f6 ; (sformat.s21 + 0)
.s84:
39ef : a9 01 __ LDA #$01
39f1 : 8d ba 9f STA $9fba ; (si.left + 0)
39f4 : d0 c4 __ BNE $39ba ; (sformat.s85 + 0)
.s21:
39f6 : 85 39 __ STA T2 + 0 
39f8 : c9 30 __ CMP #$30
39fa : 90 3c __ BCC $3a38 ; (sformat.s22 + 0)
.s80:
39fc : c9 3a __ CMP #$3a
39fe : b0 77 __ BCS $3a77 ; (sformat.s23 + 0)
.s81:
3a00 : a9 00 __ LDA #$00
3a02 : 85 49 __ STA T1 + 0 
.l82:
3a04 : a5 49 __ LDA T1 + 0 
3a06 : 0a __ __ ASL
3a07 : 85 29 __ STA ACCU + 0 ; (buff + 1)
3a09 : a9 00 __ LDA #$00
3a0b : 2a __ __ ROL
3a0c : 06 29 __ ASL ACCU + 0 ; (buff + 1)
3a0e : 2a __ __ ROL
3a0f : aa __ __ TAX
3a10 : a5 29 __ LDA ACCU + 0 ; (buff + 1)
3a12 : 65 49 __ ADC T1 + 0 
3a14 : 0a __ __ ASL
3a15 : 18 __ __ CLC
3a16 : 65 39 __ ADC T2 + 0 
3a18 : 38 __ __ SEC
3a19 : e9 30 __ SBC #$30
3a1b : 85 49 __ STA T1 + 0 
3a1d : a0 00 __ LDY #$00
3a1f : b1 4b __ LDA (T3 + 0),y 
3a21 : 85 39 __ STA T2 + 0 
3a23 : e6 4b __ INC T3 + 0 
3a25 : d0 02 __ BNE $3a29 ; (sformat.s116 + 0)
.s115:
3a27 : e6 4c __ INC T3 + 1 
.s116:
3a29 : c9 30 __ CMP #$30
3a2b : 90 04 __ BCC $3a31 ; (sformat.s104 + 0)
.s83:
3a2d : c9 3a __ CMP #$3a
3a2f : 90 d3 __ BCC $3a04 ; (sformat.l82 + 0)
.s104:
3a31 : 86 2a __ STX ACCU + 1 ; (fmt + 0)
3a33 : a6 49 __ LDX T1 + 0 
3a35 : 8e b5 9f STX $9fb5 ; (si.width + 0)
.s22:
3a38 : c9 2e __ CMP #$2e
3a3a : d0 3b __ BNE $3a77 ; (sformat.s23 + 0)
.s76:
3a3c : a9 00 __ LDA #$00
3a3e : a6 2a __ LDX ACCU + 1 ; (fmt + 0)
3a40 : 4c 5a 3a JMP $3a5a ; (sformat.l77 + 0)
.s79:
3a43 : a5 35 __ LDA T0 + 0 
3a45 : 0a __ __ ASL
3a46 : 85 29 __ STA ACCU + 0 ; (buff + 1)
3a48 : 98 __ __ TYA
3a49 : 2a __ __ ROL
3a4a : 06 29 __ ASL ACCU + 0 ; (buff + 1)
3a4c : 2a __ __ ROL
3a4d : aa __ __ TAX
3a4e : 18 __ __ CLC
3a4f : a5 29 __ LDA ACCU + 0 ; (buff + 1)
3a51 : 65 35 __ ADC T0 + 0 
3a53 : 0a __ __ ASL
3a54 : 18 __ __ CLC
3a55 : 65 39 __ ADC T2 + 0 
3a57 : 38 __ __ SEC
3a58 : e9 30 __ SBC #$30
.l77:
3a5a : 85 35 __ STA T0 + 0 
3a5c : a0 00 __ LDY #$00
3a5e : b1 4b __ LDA (T3 + 0),y 
3a60 : 85 39 __ STA T2 + 0 
3a62 : e6 4b __ INC T3 + 0 
3a64 : d0 02 __ BNE $3a68 ; (sformat.s108 + 0)
.s107:
3a66 : e6 4c __ INC T3 + 1 
.s108:
3a68 : c9 30 __ CMP #$30
3a6a : 90 04 __ BCC $3a70 ; (sformat.s103 + 0)
.s78:
3a6c : c9 3a __ CMP #$3a
3a6e : 90 d3 __ BCC $3a43 ; (sformat.s79 + 0)
.s103:
3a70 : 86 2a __ STX ACCU + 1 ; (fmt + 0)
3a72 : a6 35 __ LDX T0 + 0 
3a74 : 8e b6 9f STX $9fb6 ; (si.precision + 0)
.s23:
3a77 : c9 64 __ CMP #$64
3a79 : f0 0c __ BEQ $3a87 ; (sformat.s75 + 0)
.s24:
3a7b : c9 44 __ CMP #$44
3a7d : f0 08 __ BEQ $3a87 ; (sformat.s75 + 0)
.s25:
3a7f : c9 69 __ CMP #$69
3a81 : f0 04 __ BEQ $3a87 ; (sformat.s75 + 0)
.s26:
3a83 : c9 49 __ CMP #$49
3a85 : d0 07 __ BNE $3a8e ; (sformat.s27 + 0)
.s75:
3a87 : a9 01 __ LDA #$01
.s93:
3a89 : 85 21 __ STA P6 
3a8b : 4c e7 3c JMP $3ce7 ; (sformat.s73 + 0)
.s27:
3a8e : c9 75 __ CMP #$75
3a90 : f0 04 __ BEQ $3a96 ; (sformat.s74 + 0)
.s28:
3a92 : c9 55 __ CMP #$55
3a94 : d0 04 __ BNE $3a9a ; (sformat.s29 + 0)
.s74:
3a96 : a9 00 __ LDA #$00
3a98 : f0 ef __ BEQ $3a89 ; (sformat.s93 + 0)
.s29:
3a9a : c9 78 __ CMP #$78
3a9c : f0 04 __ BEQ $3aa2 ; (sformat.s72 + 0)
.s30:
3a9e : c9 58 __ CMP #$58
3aa0 : d0 15 __ BNE $3ab7 ; (sformat.s31 + 0)
.s72:
3aa2 : a5 39 __ LDA T2 + 0 
3aa4 : 29 e0 __ AND #$e0
3aa6 : 09 01 __ ORA #$01
3aa8 : 8d b7 9f STA $9fb7 ; (si.cha + 0)
3aab : a9 00 __ LDA #$00
3aad : 85 21 __ STA P6 
3aaf : a9 10 __ LDA #$10
3ab1 : 8d b8 9f STA $9fb8 ; (si.base + 0)
3ab4 : 4c e7 3c JMP $3ce7 ; (sformat.s73 + 0)
.s31:
3ab7 : c9 6c __ CMP #$6c
3ab9 : d0 03 __ BNE $3abe ; (sformat.s32 + 0)
3abb : 4c 56 3c JMP $3c56 ; (sformat.s60 + 0)
.s32:
3abe : c9 4c __ CMP #$4c
3ac0 : f0 f9 __ BEQ $3abb ; (sformat.s31 + 4)
.s33:
3ac2 : aa __ __ TAX
3ac3 : c9 66 __ CMP #$66
3ac5 : d0 03 __ BNE $3aca ; (sformat.s34 + 0)
3ac7 : 4c eb 3b JMP $3beb ; (sformat.s59 + 0)
.s34:
3aca : c9 67 __ CMP #$67
3acc : f0 f9 __ BEQ $3ac7 ; (sformat.s33 + 5)
.s35:
3ace : c9 65 __ CMP #$65
3ad0 : f0 f5 __ BEQ $3ac7 ; (sformat.s33 + 5)
.s36:
3ad2 : c9 46 __ CMP #$46
3ad4 : f0 f1 __ BEQ $3ac7 ; (sformat.s33 + 5)
.s37:
3ad6 : c9 47 __ CMP #$47
3ad8 : f0 ed __ BEQ $3ac7 ; (sformat.s33 + 5)
.s38:
3ada : c9 45 __ CMP #$45
3adc : f0 e9 __ BEQ $3ac7 ; (sformat.s33 + 5)
.s39:
3ade : c9 73 __ CMP #$73
3ae0 : f0 3e __ BEQ $3b20 ; (sformat.s47 + 0)
.s40:
3ae2 : c9 53 __ CMP #$53
3ae4 : f0 3a __ BEQ $3b20 ; (sformat.s47 + 0)
.s41:
3ae6 : c9 63 __ CMP #$63
3ae8 : f0 15 __ BEQ $3aff ; (sformat.s46 + 0)
.s42:
3aea : c9 43 __ CMP #$43
3aec : f0 11 __ BEQ $3aff ; (sformat.s46 + 0)
.s43:
3aee : aa __ __ TAX
3aef : d0 03 __ BNE $3af4 ; (sformat.s44 + 0)
3af1 : 4c f4 38 JMP $38f4 ; (sformat.l5 + 0)
.s44:
3af4 : a0 00 __ LDY #$00
3af6 : 91 4d __ STA (T4 + 0),y 
.s45:
3af8 : a9 01 __ LDA #$01
.s96:
3afa : 85 51 __ STA T6 + 0 
3afc : 4c f4 38 JMP $38f4 ; (sformat.l5 + 0)
.s46:
3aff : ad d1 9f LDA $9fd1 ; (sstack + 5)
3b02 : 85 35 __ STA T0 + 0 
3b04 : ad d2 9f LDA $9fd2 ; (sstack + 6)
3b07 : 85 36 __ STA T0 + 1 
3b09 : a0 00 __ LDY #$00
3b0b : b1 35 __ LDA (T0 + 0),y 
3b0d : 91 4d __ STA (T4 + 0),y 
3b0f : a5 35 __ LDA T0 + 0 
3b11 : 69 01 __ ADC #$01
3b13 : 8d d1 9f STA $9fd1 ; (sstack + 5)
3b16 : a5 36 __ LDA T0 + 1 
3b18 : 69 00 __ ADC #$00
3b1a : 8d d2 9f STA $9fd2 ; (sstack + 6)
3b1d : 4c f8 3a JMP $3af8 ; (sformat.s45 + 0)
.s47:
3b20 : ad d1 9f LDA $9fd1 ; (sstack + 5)
3b23 : 85 35 __ STA T0 + 0 
3b25 : 69 01 __ ADC #$01
3b27 : 8d d1 9f STA $9fd1 ; (sstack + 5)
3b2a : ad d2 9f LDA $9fd2 ; (sstack + 6)
3b2d : 85 36 __ STA T0 + 1 
3b2f : 69 00 __ ADC #$00
3b31 : 8d d2 9f STA $9fd2 ; (sstack + 6)
3b34 : a0 00 __ LDY #$00
3b36 : 84 52 __ STY T7 + 0 
3b38 : b1 35 __ LDA (T0 + 0),y 
3b3a : 85 29 __ STA ACCU + 0 ; (buff + 1)
3b3c : 85 49 __ STA T1 + 0 
3b3e : c8 __ __ INY
3b3f : b1 35 __ LDA (T0 + 0),y 
3b41 : 85 2a __ STA ACCU + 1 ; (fmt + 0)
3b43 : 85 4a __ STA T1 + 1 
3b45 : ad b5 9f LDA $9fb5 ; (si.width + 0)
3b48 : f0 0c __ BEQ $3b56 ; (sformat.s48 + 0)
.s100:
3b4a : 88 __ __ DEY
3b4b : b1 29 __ LDA (ACCU + 0),y ; (buff + 1)
3b4d : f0 05 __ BEQ $3b54 ; (sformat.s101 + 0)
.l58:
3b4f : c8 __ __ INY
3b50 : b1 29 __ LDA (ACCU + 0),y ; (buff + 1)
3b52 : d0 fb __ BNE $3b4f ; (sformat.l58 + 0)
.s101:
3b54 : 84 52 __ STY T7 + 0 
.s48:
3b56 : ad ba 9f LDA $9fba ; (si.left + 0)
3b59 : 85 4f __ STA T5 + 0 
3b5b : d0 19 __ BNE $3b76 ; (sformat.s49 + 0)
.s98:
3b5d : a6 52 __ LDX T7 + 0 
3b5f : ec b5 9f CPX $9fb5 ; (si.width + 0)
3b62 : a0 00 __ LDY #$00
3b64 : b0 0c __ BCS $3b72 ; (sformat.s99 + 0)
.l57:
3b66 : ad b4 9f LDA $9fb4 ; (si.fill + 0)
3b69 : 91 4d __ STA (T4 + 0),y 
3b6b : c8 __ __ INY
3b6c : e8 __ __ INX
3b6d : ec b5 9f CPX $9fb5 ; (si.width + 0)
3b70 : 90 f4 __ BCC $3b66 ; (sformat.l57 + 0)
.s99:
3b72 : 86 52 __ STX T7 + 0 
3b74 : 84 51 __ STY T6 + 0 
.s49:
3b76 : ac d3 9f LDY $9fd3 ; (sstack + 7)
3b79 : d0 48 __ BNE $3bc3 ; (sformat.s54 + 0)
.s50:
3b7b : b1 29 __ LDA (ACCU + 0),y ; (buff + 1)
3b7d : f0 23 __ BEQ $3ba2 ; (sformat.s51 + 0)
.s53:
3b7f : 18 __ __ CLC
3b80 : a5 29 __ LDA ACCU + 0 ; (buff + 1)
3b82 : 69 01 __ ADC #$01
3b84 : 85 35 __ STA T0 + 0 
3b86 : a5 2a __ LDA ACCU + 1 ; (fmt + 0)
3b88 : 69 00 __ ADC #$00
3b8a : 85 36 __ STA T0 + 1 
3b8c : b1 29 __ LDA (ACCU + 0),y ; (buff + 1)
.l92:
3b8e : a4 51 __ LDY T6 + 0 
3b90 : 91 4d __ STA (T4 + 0),y 
3b92 : e6 51 __ INC T6 + 0 
3b94 : a0 00 __ LDY #$00
3b96 : b1 35 __ LDA (T0 + 0),y 
3b98 : a8 __ __ TAY
3b99 : e6 35 __ INC T0 + 0 
3b9b : d0 02 __ BNE $3b9f ; (sformat.s114 + 0)
.s113:
3b9d : e6 36 __ INC T0 + 1 
.s114:
3b9f : 98 __ __ TYA
3ba0 : d0 ec __ BNE $3b8e ; (sformat.l92 + 0)
.s51:
3ba2 : a5 4f __ LDA T5 + 0 
3ba4 : d0 03 __ BNE $3ba9 ; (sformat.s97 + 0)
3ba6 : 4c f4 38 JMP $38f4 ; (sformat.l5 + 0)
.s97:
3ba9 : a6 52 __ LDX T7 + 0 
3bab : ec b5 9f CPX $9fb5 ; (si.width + 0)
3bae : a4 51 __ LDY T6 + 0 
3bb0 : b0 0c __ BCS $3bbe ; (sformat.s102 + 0)
.l52:
3bb2 : ad b4 9f LDA $9fb4 ; (si.fill + 0)
3bb5 : 91 4d __ STA (T4 + 0),y 
3bb7 : c8 __ __ INY
3bb8 : e8 __ __ INX
3bb9 : ec b5 9f CPX $9fb5 ; (si.width + 0)
3bbc : 90 f4 __ BCC $3bb2 ; (sformat.l52 + 0)
.s102:
3bbe : 84 51 __ STY T6 + 0 
3bc0 : 4c f4 38 JMP $38f4 ; (sformat.l5 + 0)
.s54:
3bc3 : a4 51 __ LDY T6 + 0 
3bc5 : f0 11 __ BEQ $3bd8 ; (sformat.s55 + 0)
.s56:
3bc7 : a5 4d __ LDA T4 + 0 
3bc9 : 85 1c __ STA P1 
3bcb : a5 4e __ LDA T4 + 1 
3bcd : 85 1d __ STA P2 
3bcf : a9 00 __ LDA #$00
3bd1 : 85 51 __ STA T6 + 0 
3bd3 : 91 1c __ STA (P1),y 
3bd5 : 20 21 3d JSR $3d21 ; (puts.l4 + 0)
.s55:
3bd8 : a5 49 __ LDA T1 + 0 
3bda : 85 1c __ STA P1 
3bdc : a5 4a __ LDA T1 + 1 
3bde : 85 1d __ STA P2 
3be0 : 20 21 3d JSR $3d21 ; (puts.l4 + 0)
3be3 : ad ba 9f LDA $9fba ; (si.left + 0)
3be6 : d0 c1 __ BNE $3ba9 ; (sformat.s97 + 0)
3be8 : 4c f4 38 JMP $38f4 ; (sformat.l5 + 0)
.s59:
3beb : a5 4d __ LDA T4 + 0 
3bed : 85 21 __ STA P6 
3bef : a5 4e __ LDA T4 + 1 
3bf1 : 85 22 __ STA P7 
3bf3 : 8a __ __ TXA
3bf4 : 29 e0 __ AND #$e0
3bf6 : 09 01 __ ORA #$01
3bf8 : 85 39 __ STA T2 + 0 
3bfa : 8d b7 9f STA $9fb7 ; (si.cha + 0)
3bfd : a9 b4 __ LDA #$b4
3bff : 85 1f __ STA P4 
3c01 : a9 9f __ LDA #$9f
3c03 : 85 20 __ STA P5 
3c05 : ad d1 9f LDA $9fd1 ; (sstack + 5)
3c08 : 85 4f __ STA T5 + 0 
3c0a : ad d2 9f LDA $9fd2 ; (sstack + 6)
3c0d : 85 50 __ STA T5 + 1 
3c0f : a0 00 __ LDY #$00
3c11 : 84 3a __ STY T2 + 1 
3c13 : b1 4f __ LDA (T5 + 0),y 
3c15 : 85 23 __ STA P8 
3c17 : c8 __ __ INY
3c18 : b1 4f __ LDA (T5 + 0),y 
3c1a : 85 24 __ STA P9 
3c1c : c8 __ __ INY
3c1d : b1 4f __ LDA (T5 + 0),y 
3c1f : 85 25 __ STA P10 
3c21 : c8 __ __ INY
3c22 : b1 4f __ LDA (T5 + 0),y 
3c24 : 85 26 __ STA P11 
3c26 : 8a __ __ TXA
3c27 : e5 39 __ SBC T2 + 0 
3c29 : aa __ __ TAX
3c2a : a9 00 __ LDA #$00
3c2c : e9 00 __ SBC #$00
3c2e : a8 __ __ TAY
3c2f : 8a __ __ TXA
3c30 : 18 __ __ CLC
3c31 : 69 61 __ ADC #$61
3c33 : 85 35 __ STA T0 + 0 
3c35 : 8d cc 9f STA $9fcc ; (sstack + 0)
3c38 : 90 01 __ BCC $3c3b ; (sformat.s112 + 0)
.s111:
3c3a : c8 __ __ INY
.s112:
3c3b : 84 36 __ STY T0 + 1 
3c3d : 20 bb 41 JSR $41bb ; (nformf.s4 + 0)
3c40 : a5 29 __ LDA ACCU + 0 ; (buff + 1)
3c42 : 85 51 __ STA T6 + 0 
3c44 : 18 __ __ CLC
3c45 : a5 4f __ LDA T5 + 0 
3c47 : 69 04 __ ADC #$04
3c49 : 8d d1 9f STA $9fd1 ; (sstack + 5)
3c4c : a5 50 __ LDA T5 + 1 
3c4e : 69 00 __ ADC #$00
3c50 : 8d d2 9f STA $9fd2 ; (sstack + 6)
3c53 : 4c f4 38 JMP $38f4 ; (sformat.l5 + 0)
.s60:
3c56 : ad d1 9f LDA $9fd1 ; (sstack + 5)
3c59 : 85 35 __ STA T0 + 0 
3c5b : 69 03 __ ADC #$03
3c5d : 8d d1 9f STA $9fd1 ; (sstack + 5)
3c60 : ad d2 9f LDA $9fd2 ; (sstack + 6)
3c63 : 85 36 __ STA T0 + 1 
3c65 : 69 00 __ ADC #$00
3c67 : 8d d2 9f STA $9fd2 ; (sstack + 6)
3c6a : a0 00 __ LDY #$00
3c6c : b1 4b __ LDA (T3 + 0),y 
3c6e : aa __ __ TAX
3c6f : e6 4b __ INC T3 + 0 
3c71 : d0 02 __ BNE $3c75 ; (sformat.s110 + 0)
.s109:
3c73 : e6 4c __ INC T3 + 1 
.s110:
3c75 : b1 35 __ LDA (T0 + 0),y 
3c77 : 85 29 __ STA ACCU + 0 ; (buff + 1)
3c79 : 85 1f __ STA P4 
3c7b : a0 01 __ LDY #$01
3c7d : b1 35 __ LDA (T0 + 0),y 
3c7f : 85 2a __ STA ACCU + 1 ; (fmt + 0)
3c81 : 85 20 __ STA P5 
3c83 : c8 __ __ INY
3c84 : b1 35 __ LDA (T0 + 0),y 
3c86 : 85 2b __ STA ACCU + 2 ; (fmt + 1)
3c88 : 85 21 __ STA P6 
3c8a : 85 37 __ STA T0 + 2 
3c8c : c8 __ __ INY
3c8d : b1 35 __ LDA (T0 + 0),y 
3c8f : 85 22 __ STA P7 
3c91 : 85 38 __ STA T0 + 3 
3c93 : e0 64 __ CPX #$64
3c95 : f0 0c __ BEQ $3ca3 ; (sformat.s71 + 0)
.s61:
3c97 : e0 44 __ CPX #$44
3c99 : f0 08 __ BEQ $3ca3 ; (sformat.s71 + 0)
.s62:
3c9b : e0 69 __ CPX #$69
3c9d : f0 04 __ BEQ $3ca3 ; (sformat.s71 + 0)
.s63:
3c9f : e0 49 __ CPX #$49
3ca1 : d0 1a __ BNE $3cbd ; (sformat.s64 + 0)
.s71:
3ca3 : a9 01 __ LDA #$01
.s94:
3ca5 : 85 23 __ STA P8 
.s69:
3ca7 : a5 4d __ LDA T4 + 0 
3ca9 : 85 1d __ STA P2 
3cab : a5 4e __ LDA T4 + 1 
3cad : 85 1e __ STA P3 
3caf : a9 b4 __ LDA #$b4
3cb1 : 85 1b __ STA P0 
3cb3 : a9 9f __ LDA #$9f
3cb5 : 85 1c __ STA P1 
3cb7 : 20 6f 40 JSR $406f ; (nforml.s4 + 0)
3cba : 4c fa 3a JMP $3afa ; (sformat.s96 + 0)
.s64:
3cbd : e0 75 __ CPX #$75
3cbf : f0 04 __ BEQ $3cc5 ; (sformat.s70 + 0)
.s65:
3cc1 : e0 55 __ CPX #$55
3cc3 : d0 04 __ BNE $3cc9 ; (sformat.s66 + 0)
.s70:
3cc5 : a9 00 __ LDA #$00
3cc7 : f0 dc __ BEQ $3ca5 ; (sformat.s94 + 0)
.s66:
3cc9 : e0 78 __ CPX #$78
3ccb : f0 06 __ BEQ $3cd3 ; (sformat.s68 + 0)
.s67:
3ccd : 85 2c __ STA ACCU + 3 ; (fps + 0)
3ccf : e0 58 __ CPX #$58
3cd1 : d0 80 __ BNE $3c53 ; (sformat.s112 + 24)
.s68:
3cd3 : a9 00 __ LDA #$00
3cd5 : 85 23 __ STA P8 
3cd7 : a9 10 __ LDA #$10
3cd9 : 8d b8 9f STA $9fb8 ; (si.base + 0)
3cdc : 8a __ __ TXA
3cdd : 29 e0 __ AND #$e0
3cdf : 09 01 __ ORA #$01
3ce1 : 8d b7 9f STA $9fb7 ; (si.cha + 0)
3ce4 : 4c a7 3c JMP $3ca7 ; (sformat.s69 + 0)
.s73:
3ce7 : a5 4d __ LDA T4 + 0 
3ce9 : 85 1d __ STA P2 
3ceb : a5 4e __ LDA T4 + 1 
3ced : 85 1e __ STA P3 
3cef : ad d1 9f LDA $9fd1 ; (sstack + 5)
3cf2 : 85 35 __ STA T0 + 0 
3cf4 : ad d2 9f LDA $9fd2 ; (sstack + 6)
3cf7 : 85 36 __ STA T0 + 1 
3cf9 : a0 00 __ LDY #$00
3cfb : b1 35 __ LDA (T0 + 0),y 
3cfd : 85 1f __ STA P4 
3cff : c8 __ __ INY
3d00 : b1 35 __ LDA (T0 + 0),y 
3d02 : 85 20 __ STA P5 
3d04 : 18 __ __ CLC
3d05 : a5 35 __ LDA T0 + 0 
3d07 : 69 02 __ ADC #$02
3d09 : 8d d1 9f STA $9fd1 ; (sstack + 5)
3d0c : a5 36 __ LDA T0 + 1 
3d0e : 69 00 __ ADC #$00
3d10 : 8d d2 9f STA $9fd2 ; (sstack + 6)
3d13 : a9 b4 __ LDA #$b4
3d15 : 85 1b __ STA P0 
3d17 : a9 9f __ LDA #$9f
3d19 : 85 1c __ STA P1 
3d1b : 20 54 3f JSR $3f54 ; (nformi.s4 + 0)
3d1e : 4c fa 3a JMP $3afa ; (sformat.s96 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
;  12, "/mnt/d/F256/oscar64/include/stdio.h"
.l4:
3d21 : a0 00 __ LDY #$00
3d23 : b1 1c __ LDA (P1),y ; (str + 0)
3d25 : d0 01 __ BNE $3d28 ; (puts.s5 + 0)
.s3:
3d27 : 60 __ __ RTS
.s5:
3d28 : 85 1b __ STA P0 
3d2a : e6 1c __ INC P1 ; (str + 0)
3d2c : d0 02 __ BNE $3d30 ; (puts.s7 + 0)
.s6:
3d2e : e6 1d __ INC P2 ; (str + 1)
.s7:
3d30 : 20 36 3d JSR $3d36 ; (putpch.s4 + 0)
3d33 : 4c 21 3d JMP $3d21 ; (puts.l4 + 0)
--------------------------------------------------------------------
putpch: ; putpch(u8)->void
;  69, "/mnt/d/F256/oscar64/include/conio.h"
.s4:
3d36 : a5 1b __ LDA P0 ; (c + 0)
3d38 : c9 0a __ CMP #$0a
3d3a : d0 03 __ BNE $3d3f ; (putpch.s5 + 0)
3d3c : 4c bf 3e JMP $3ebf ; (putpch.s20 + 0)
.s5:
3d3f : c9 0d __ CMP #$0d
3d41 : f0 f9 __ BEQ $3d3c ; (putpch.s4 + 6)
.s6:
3d43 : c9 09 __ CMP #$09
3d45 : d0 0d __ BNE $3d54 ; (putpch.s7 + 0)
.s13:
3d47 : ad 14 d0 LDA $d014 
3d4a : 29 03 __ AND #$03
3d4c : 85 3b __ STA T3 + 0 
3d4e : ad 15 d0 LDA $d015 
3d51 : 4c 04 3e JMP $3e04 ; (putpch.l14 + 0)
.s7:
3d54 : a5 01 __ LDA $01 
3d56 : 85 3c __ STA T5 + 0 
3d58 : a9 00 __ LDA #$00
3d5a : 85 01 __ STA $01 
3d5c : ad 14 d0 LDA $d014 
3d5f : 85 35 __ STA T0 + 0 
3d61 : ad 15 d0 LDA $d015 
3d64 : 85 36 __ STA T0 + 1 
3d66 : ad 16 d0 LDA $d016 
3d69 : 85 37 __ STA T1 + 0 
3d6b : 0a __ __ ASL
3d6c : 85 29 __ STA ACCU + 0 
3d6e : ad 17 d0 LDA $d017 
3d71 : 85 38 __ STA T1 + 1 
3d73 : 2a __ __ ROL
3d74 : 06 29 __ ASL ACCU + 0 
3d76 : 2a __ __ ROL
3d77 : aa __ __ TAX
3d78 : a9 03 __ LDA #$03
3d7a : 85 01 __ STA $01 
3d7c : 18 __ __ CLC
3d7d : a5 29 __ LDA ACCU + 0 
3d7f : 65 37 __ ADC T1 + 0 
3d81 : 85 39 __ STA T2 + 0 
3d83 : 8a __ __ TXA
3d84 : 65 38 __ ADC T1 + 1 
3d86 : 06 39 __ ASL T2 + 0 
3d88 : 2a __ __ ROL
3d89 : 06 39 __ ASL T2 + 0 
3d8b : 2a __ __ ROL
3d8c : 06 39 __ ASL T2 + 0 
3d8e : 2a __ __ ROL
3d8f : 06 39 __ ASL T2 + 0 
3d91 : 2a __ __ ROL
3d92 : aa __ __ TAX
3d93 : 18 __ __ CLC
3d94 : a5 39 __ LDA T2 + 0 
3d96 : 65 35 __ ADC T0 + 0 
3d98 : 85 39 __ STA T2 + 0 
3d9a : 8a __ __ TXA
3d9b : 65 36 __ ADC T0 + 1 
3d9d : 18 __ __ CLC
3d9e : 69 c0 __ ADC #$c0
3da0 : 85 3a __ STA T2 + 1 
3da2 : ad fd 79 LDA $79fd ; (f256k_color + 0)
3da5 : a0 00 __ LDY #$00
3da7 : 91 39 __ STA (T2 + 0),y 
3da9 : a9 02 __ LDA #$02
3dab : 85 01 __ STA $01 
3dad : a5 1b __ LDA P0 ; (c + 0)
3daf : 91 39 __ STA (T2 + 0),y 
3db1 : 18 __ __ CLC
3db2 : a5 35 __ LDA T0 + 0 
3db4 : 69 01 __ ADC #$01
3db6 : 85 35 __ STA T0 + 0 
3db8 : a5 36 __ LDA T0 + 1 
3dba : 69 00 __ ADC #$00
3dbc : d0 0c __ BNE $3dca ; (putpch.s9 + 0)
.s12:
3dbe : a5 37 __ LDA T1 + 0 
3dc0 : 85 39 __ STA T2 + 0 
3dc2 : a5 35 __ LDA T0 + 0 
3dc4 : c9 50 __ CMP #$50
3dc6 : a6 38 __ LDX T1 + 1 
3dc8 : 90 1f __ BCC $3de9 ; (putpch.s8 + 0)
.s9:
3dca : 84 35 __ STY T0 + 0 
3dcc : 18 __ __ CLC
3dcd : a5 37 __ LDA T1 + 0 
3dcf : 69 01 __ ADC #$01
3dd1 : 85 39 __ STA T2 + 0 
3dd3 : a5 38 __ LDA T1 + 1 
3dd5 : 69 00 __ ADC #$00
3dd7 : d0 07 __ BNE $3de0 ; (putpch.s10 + 0)
.s11:
3dd9 : aa __ __ TAX
3dda : a5 39 __ LDA T2 + 0 
3ddc : c9 1e __ CMP #$1e
3dde : 90 09 __ BCC $3de9 ; (putpch.s8 + 0)
.s10:
3de0 : 20 f0 3e JSR $3ef0 ; (f256k_scroll.s4 + 0)
3de3 : a9 1d __ LDA #$1d
3de5 : 85 39 __ STA T2 + 0 
3de7 : a2 00 __ LDX #$00
.s8:
3de9 : a9 00 __ LDA #$00
3deb : 85 01 __ STA $01 
3ded : a5 35 __ LDA T0 + 0 
3def : 8d 14 d0 STA $d014 
3df2 : a9 00 __ LDA #$00
3df4 : 8d 15 d0 STA $d015 
3df7 : a5 39 __ LDA T2 + 0 
3df9 : 8d 16 d0 STA $d016 
3dfc : 8e 17 d0 STX $d017 
3dff : a5 3c __ LDA T5 + 0 
.s24:
3e01 : 85 01 __ STA $01 
.s3:
3e03 : 60 __ __ RTS
.l14:
3e04 : a5 01 __ LDA $01 
3e06 : 85 3c __ STA T5 + 0 
3e08 : a9 00 __ LDA #$00
3e0a : 85 01 __ STA $01 
3e0c : ad 14 d0 LDA $d014 
3e0f : 85 35 __ STA T0 + 0 
3e11 : ad 15 d0 LDA $d015 
3e14 : 85 36 __ STA T0 + 1 
3e16 : ad 16 d0 LDA $d016 
3e19 : 85 37 __ STA T1 + 0 
3e1b : 0a __ __ ASL
3e1c : 85 29 __ STA ACCU + 0 
3e1e : ad 17 d0 LDA $d017 
3e21 : 85 38 __ STA T1 + 1 
3e23 : 2a __ __ ROL
3e24 : 06 29 __ ASL ACCU + 0 
3e26 : 2a __ __ ROL
3e27 : aa __ __ TAX
3e28 : a9 03 __ LDA #$03
3e2a : 85 01 __ STA $01 
3e2c : 18 __ __ CLC
3e2d : a5 29 __ LDA ACCU + 0 
3e2f : 65 37 __ ADC T1 + 0 
3e31 : 85 39 __ STA T2 + 0 
3e33 : 8a __ __ TXA
3e34 : 65 38 __ ADC T1 + 1 
3e36 : 06 39 __ ASL T2 + 0 
3e38 : 2a __ __ ROL
3e39 : 06 39 __ ASL T2 + 0 
3e3b : 2a __ __ ROL
3e3c : 06 39 __ ASL T2 + 0 
3e3e : 2a __ __ ROL
3e3f : 06 39 __ ASL T2 + 0 
3e41 : 2a __ __ ROL
3e42 : aa __ __ TAX
3e43 : 18 __ __ CLC
3e44 : a5 39 __ LDA T2 + 0 
3e46 : 65 35 __ ADC T0 + 0 
3e48 : 85 39 __ STA T2 + 0 
3e4a : 8a __ __ TXA
3e4b : 65 36 __ ADC T0 + 1 
3e4d : 18 __ __ CLC
3e4e : 69 c0 __ ADC #$c0
3e50 : 85 3a __ STA T2 + 1 
3e52 : ad fd 79 LDA $79fd ; (f256k_color + 0)
3e55 : a0 00 __ LDY #$00
3e57 : 91 39 __ STA (T2 + 0),y 
3e59 : a9 02 __ LDA #$02
3e5b : 85 01 __ STA $01 
3e5d : a9 20 __ LDA #$20
3e5f : 91 39 __ STA (T2 + 0),y 
3e61 : 18 __ __ CLC
3e62 : a5 35 __ LDA T0 + 0 
3e64 : 69 01 __ ADC #$01
3e66 : 85 35 __ STA T0 + 0 
3e68 : a5 36 __ LDA T0 + 1 
3e6a : 69 00 __ ADC #$00
3e6c : d0 0c __ BNE $3e7a ; (putpch.s16 + 0)
.s19:
3e6e : a5 37 __ LDA T1 + 0 
3e70 : 85 39 __ STA T2 + 0 
3e72 : a5 35 __ LDA T0 + 0 
3e74 : c9 50 __ CMP #$50
3e76 : a6 38 __ LDX T1 + 1 
3e78 : 90 1f __ BCC $3e99 ; (putpch.s15 + 0)
.s16:
3e7a : 84 35 __ STY T0 + 0 
3e7c : 18 __ __ CLC
3e7d : a5 37 __ LDA T1 + 0 
3e7f : 69 01 __ ADC #$01
3e81 : 85 39 __ STA T2 + 0 
3e83 : a5 38 __ LDA T1 + 1 
3e85 : 69 00 __ ADC #$00
3e87 : d0 07 __ BNE $3e90 ; (putpch.s17 + 0)
.s18:
3e89 : aa __ __ TAX
3e8a : a5 39 __ LDA T2 + 0 
3e8c : c9 1e __ CMP #$1e
3e8e : 90 09 __ BCC $3e99 ; (putpch.s15 + 0)
.s17:
3e90 : 20 f0 3e JSR $3ef0 ; (f256k_scroll.s4 + 0)
3e93 : a9 1d __ LDA #$1d
3e95 : 85 39 __ STA T2 + 0 
3e97 : a2 00 __ LDX #$00
.s15:
3e99 : a9 00 __ LDA #$00
3e9b : 85 01 __ STA $01 
3e9d : a5 35 __ LDA T0 + 0 
3e9f : 8d 14 d0 STA $d014 
3ea2 : a9 00 __ LDA #$00
3ea4 : 8d 15 d0 STA $d015 
3ea7 : a5 39 __ LDA T2 + 0 
3ea9 : 8d 16 d0 STA $d016 
3eac : 8e 17 d0 STX $d017 
3eaf : a5 3c __ LDA T5 + 0 
3eb1 : 85 01 __ STA $01 
3eb3 : e6 3b __ INC T3 + 0 
3eb5 : a5 3b __ LDA T3 + 0 
3eb7 : c9 04 __ CMP #$04
3eb9 : b0 03 __ BCS $3ebe ; (putpch.s15 + 37)
3ebb : 4c 04 3e JMP $3e04 ; (putpch.l14 + 0)
3ebe : 60 __ __ RTS
.s20:
3ebf : a5 01 __ LDA $01 
3ec1 : 85 39 __ STA T2 + 0 
3ec3 : a9 00 __ LDA #$00
3ec5 : 85 01 __ STA $01 
3ec7 : ad 16 d0 LDA $d016 
3eca : 69 00 __ ADC #$00
3ecc : aa __ __ TAX
3ecd : ad 17 d0 LDA $d017 
3ed0 : 69 00 __ ADC #$00
3ed2 : d0 04 __ BNE $3ed8 ; (putpch.s22 + 0)
.s23:
3ed4 : e0 1e __ CPX #$1e
3ed6 : 90 05 __ BCC $3edd ; (putpch.s21 + 0)
.s22:
3ed8 : 20 f0 3e JSR $3ef0 ; (f256k_scroll.s4 + 0)
3edb : a2 1d __ LDX #$1d
.s21:
3edd : a9 00 __ LDA #$00
3edf : 8d 14 d0 STA $d014 
3ee2 : 8d 15 d0 STA $d015 
3ee5 : 8e 16 d0 STX $d016 
3ee8 : 8d 17 d0 STA $d017 
3eeb : a5 39 __ LDA T2 + 0 
3eed : 85 01 __ STA $01 
3eef : 60 __ __ RTS
--------------------------------------------------------------------
f256k_scroll: ; f256k_scroll()->void
; 219, "/mnt/d/F256/oscar64/include/conio.c"
.s4:
3ef0 : a9 02 __ LDA #$02
3ef2 : 85 01 __ STA $01 
3ef4 : a9 00 __ LDA #$00
3ef6 : 85 29 __ STA ACCU + 0 
3ef8 : a9 c0 __ LDA #$c0
3efa : 85 2a __ STA ACCU + 1 
.l5:
3efc : a0 50 __ LDY #$50
3efe : b1 29 __ LDA (ACCU + 0),y 
3f00 : a0 00 __ LDY #$00
3f02 : 91 29 __ STA (ACCU + 0),y 
3f04 : e6 29 __ INC ACCU + 0 
3f06 : d0 02 __ BNE $3f0a ; (f256k_scroll.s16 + 0)
.s15:
3f08 : e6 2a __ INC ACCU + 1 
.s16:
3f0a : a5 29 __ LDA ACCU + 0 
3f0c : c9 10 __ CMP #$10
3f0e : d0 ec __ BNE $3efc ; (f256k_scroll.l5 + 0)
.s12:
3f10 : a5 2a __ LDA ACCU + 1 
3f12 : c9 c9 __ CMP #$c9
3f14 : d0 e6 __ BNE $3efc ; (f256k_scroll.l5 + 0)
.s6:
3f16 : a9 20 __ LDA #$20
3f18 : a2 50 __ LDX #$50
.l7:
3f1a : ca __ __ DEX
3f1b : 9d 10 c9 STA $c910,x 
3f1e : d0 fa __ BNE $3f1a ; (f256k_scroll.l7 + 0)
.s8:
3f20 : 84 29 __ STY ACCU + 0 
3f22 : a9 03 __ LDA #$03
3f24 : 85 01 __ STA $01 
3f26 : a9 c0 __ LDA #$c0
3f28 : 85 2a __ STA ACCU + 1 
.l9:
3f2a : a0 50 __ LDY #$50
3f2c : b1 29 __ LDA (ACCU + 0),y 
3f2e : a0 00 __ LDY #$00
3f30 : 91 29 __ STA (ACCU + 0),y 
3f32 : e6 29 __ INC ACCU + 0 
3f34 : d0 02 __ BNE $3f38 ; (f256k_scroll.s18 + 0)
.s17:
3f36 : e6 2a __ INC ACCU + 1 
.s18:
3f38 : a5 29 __ LDA ACCU + 0 
3f3a : c9 10 __ CMP #$10
3f3c : d0 ec __ BNE $3f2a ; (f256k_scroll.l9 + 0)
.s11:
3f3e : a5 2a __ LDA ACCU + 1 
3f40 : c9 c9 __ CMP #$c9
3f42 : d0 e6 __ BNE $3f2a ; (f256k_scroll.l9 + 0)
.s10:
3f44 : ad fd 79 LDA $79fd ; (f256k_color + 0)
3f47 : a2 10 __ LDX #$10
.l13:
3f49 : 8d 10 c9 STA $c910 
3f4c : e8 __ __ INX
3f4d : e0 60 __ CPX #$60
3f4f : d0 f8 __ BNE $3f49 ; (f256k_scroll.l13 + 0)
.s14:
3f51 : 84 01 __ STY $01 
.s3:
3f53 : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->u8
;  79, "/mnt/d/F256/oscar64/include/stdio.c"
.s4:
3f54 : a9 00 __ LDA #$00
3f56 : 85 35 __ STA T5 + 0 
3f58 : a0 04 __ LDY #$04
3f5a : b1 1b __ LDA (P0),y ; (si + 0)
3f5c : 85 36 __ STA T6 + 0 
3f5e : a5 21 __ LDA P6 ; (s + 0)
3f60 : f0 13 __ BEQ $3f75 ; (nformi.s5 + 0)
.s33:
3f62 : 24 20 __ BIT P5 ; (v + 1)
3f64 : 10 0f __ BPL $3f75 ; (nformi.s5 + 0)
.s34:
3f66 : 38 __ __ SEC
3f67 : a9 00 __ LDA #$00
3f69 : e5 1f __ SBC P4 ; (v + 0)
3f6b : 85 1f __ STA P4 ; (v + 0)
3f6d : a9 00 __ LDA #$00
3f6f : e5 20 __ SBC P5 ; (v + 1)
3f71 : 85 20 __ STA P5 ; (v + 1)
3f73 : e6 35 __ INC T5 + 0 
.s5:
3f75 : a9 10 __ LDA #$10
3f77 : 85 37 __ STA T7 + 0 
3f79 : a5 1f __ LDA P4 ; (v + 0)
3f7b : 05 20 __ ORA P5 ; (v + 1)
3f7d : f0 33 __ BEQ $3fb2 ; (nformi.s6 + 0)
.s28:
3f7f : a5 1f __ LDA P4 ; (v + 0)
3f81 : 85 29 __ STA ACCU + 0 
3f83 : a5 20 __ LDA P5 ; (v + 1)
3f85 : 85 2a __ STA ACCU + 1 
.l29:
3f87 : a5 36 __ LDA T6 + 0 
3f89 : 85 11 __ STA WORK + 0 
3f8b : a9 00 __ LDA #$00
3f8d : 85 12 __ STA WORK + 1 
3f8f : 20 f2 75 JSR $75f2 ; (divmod + 0)
3f92 : a5 13 __ LDA WORK + 2 
3f94 : c9 0a __ CMP #$0a
3f96 : b0 04 __ BCS $3f9c ; (nformi.s32 + 0)
.s30:
3f98 : a9 30 __ LDA #$30
3f9a : 90 06 __ BCC $3fa2 ; (nformi.s31 + 0)
.s32:
3f9c : a0 03 __ LDY #$03
3f9e : b1 1b __ LDA (P0),y ; (si + 0)
3fa0 : e9 0a __ SBC #$0a
.s31:
3fa2 : 18 __ __ CLC
3fa3 : 65 13 __ ADC WORK + 2 
3fa5 : a6 37 __ LDX T7 + 0 
3fa7 : 9d bb 9f STA $9fbb,x ; (keyName[0] + 103)
3faa : c6 37 __ DEC T7 + 0 
3fac : a5 29 __ LDA ACCU + 0 
3fae : 05 2a __ ORA ACCU + 1 
3fb0 : d0 d5 __ BNE $3f87 ; (nformi.l29 + 0)
.s6:
3fb2 : a0 02 __ LDY #$02
3fb4 : b1 1b __ LDA (P0),y ; (si + 0)
3fb6 : c9 ff __ CMP #$ff
3fb8 : d0 04 __ BNE $3fbe ; (nformi.s27 + 0)
.s7:
3fba : a9 0f __ LDA #$0f
3fbc : d0 05 __ BNE $3fc3 ; (nformi.s39 + 0)
.s27:
3fbe : 38 __ __ SEC
3fbf : a9 10 __ LDA #$10
3fc1 : f1 1b __ SBC (P0),y ; (si + 0)
.s39:
3fc3 : a8 __ __ TAY
3fc4 : c4 37 __ CPY T7 + 0 
3fc6 : b0 0d __ BCS $3fd5 ; (nformi.s8 + 0)
.s26:
3fc8 : a9 30 __ LDA #$30
.l40:
3fca : a6 37 __ LDX T7 + 0 
3fcc : 9d bb 9f STA $9fbb,x ; (keyName[0] + 103)
3fcf : c6 37 __ DEC T7 + 0 
3fd1 : c4 37 __ CPY T7 + 0 
3fd3 : 90 f5 __ BCC $3fca ; (nformi.l40 + 0)
.s8:
3fd5 : a0 07 __ LDY #$07
3fd7 : b1 1b __ LDA (P0),y ; (si + 0)
3fd9 : f0 1c __ BEQ $3ff7 ; (nformi.s9 + 0)
.s24:
3fdb : a5 36 __ LDA T6 + 0 
3fdd : c9 10 __ CMP #$10
3fdf : d0 16 __ BNE $3ff7 ; (nformi.s9 + 0)
.s25:
3fe1 : a0 03 __ LDY #$03
3fe3 : b1 1b __ LDA (P0),y ; (si + 0)
3fe5 : a8 __ __ TAY
3fe6 : a9 30 __ LDA #$30
3fe8 : a6 37 __ LDX T7 + 0 
3fea : ca __ __ DEX
3feb : ca __ __ DEX
3fec : 86 37 __ STX T7 + 0 
3fee : 9d bc 9f STA $9fbc,x ; (buffer[0] + 0)
3ff1 : 98 __ __ TYA
3ff2 : 69 16 __ ADC #$16
3ff4 : 9d bd 9f STA $9fbd,x ; (buffer[0] + 1)
.s9:
3ff7 : a9 00 __ LDA #$00
3ff9 : 85 29 __ STA ACCU + 0 
3ffb : a5 35 __ LDA T5 + 0 
3ffd : f0 0c __ BEQ $400b ; (nformi.s10 + 0)
.s23:
3fff : a9 2d __ LDA #$2d
.s22:
4001 : a6 37 __ LDX T7 + 0 
4003 : 9d bb 9f STA $9fbb,x ; (keyName[0] + 103)
4006 : c6 37 __ DEC T7 + 0 
4008 : 4c 15 40 JMP $4015 ; (nformi.s11 + 0)
.s10:
400b : a0 05 __ LDY #$05
400d : b1 1b __ LDA (P0),y ; (si + 0)
400f : f0 04 __ BEQ $4015 ; (nformi.s11 + 0)
.s21:
4011 : a9 2b __ LDA #$2b
4013 : d0 ec __ BNE $4001 ; (nformi.s22 + 0)
.s11:
4015 : a6 37 __ LDX T7 + 0 
4017 : a0 06 __ LDY #$06
4019 : b1 1b __ LDA (P0),y ; (si + 0)
401b : d0 2b __ BNE $4048 ; (nformi.s17 + 0)
.l12:
401d : 8a __ __ TXA
401e : 18 __ __ CLC
401f : a0 01 __ LDY #$01
4021 : 71 1b __ ADC (P0),y ; (si + 0)
4023 : b0 04 __ BCS $4029 ; (nformi.s15 + 0)
.s16:
4025 : c9 11 __ CMP #$11
4027 : 90 0a __ BCC $4033 ; (nformi.s13 + 0)
.s15:
4029 : a0 00 __ LDY #$00
402b : b1 1b __ LDA (P0),y ; (si + 0)
402d : 9d bb 9f STA $9fbb,x ; (keyName[0] + 103)
4030 : ca __ __ DEX
4031 : b0 ea __ BCS $401d ; (nformi.l12 + 0)
.s13:
4033 : e0 10 __ CPX #$10
4035 : b0 0e __ BCS $4045 ; (nformi.s41 + 0)
.s14:
4037 : 88 __ __ DEY
.l37:
4038 : bd bc 9f LDA $9fbc,x ; (buffer[0] + 0)
403b : 91 1d __ STA (P2),y ; (str + 0)
403d : c8 __ __ INY
403e : e8 __ __ INX
403f : e0 10 __ CPX #$10
4041 : 90 f5 __ BCC $4038 ; (nformi.l37 + 0)
.s38:
4043 : 84 29 __ STY ACCU + 0 
.s41:
4045 : a5 29 __ LDA ACCU + 0 
.s3:
4047 : 60 __ __ RTS
.s17:
4048 : e0 10 __ CPX #$10
404a : b0 1a __ BCS $4066 ; (nformi.l18 + 0)
.s20:
404c : a0 00 __ LDY #$00
.l35:
404e : bd bc 9f LDA $9fbc,x ; (buffer[0] + 0)
4051 : 91 1d __ STA (P2),y ; (str + 0)
4053 : c8 __ __ INY
4054 : e8 __ __ INX
4055 : e0 10 __ CPX #$10
4057 : 90 f5 __ BCC $404e ; (nformi.l35 + 0)
.s36:
4059 : 84 29 __ STY ACCU + 0 
405b : b0 09 __ BCS $4066 ; (nformi.l18 + 0)
.s19:
405d : 88 __ __ DEY
405e : b1 1b __ LDA (P0),y ; (si + 0)
4060 : a4 29 __ LDY ACCU + 0 
4062 : 91 1d __ STA (P2),y ; (str + 0)
4064 : e6 29 __ INC ACCU + 0 
.l18:
4066 : a5 29 __ LDA ACCU + 0 
4068 : a0 01 __ LDY #$01
406a : d1 1b __ CMP (P0),y ; (si + 0)
406c : 90 ef __ BCC $405d ; (nformi.s19 + 0)
406e : 60 __ __ RTS
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->u8
; 137, "/mnt/d/F256/oscar64/include/stdio.c"
.s4:
406f : a9 00 __ LDA #$00
4071 : 85 35 __ STA T4 + 0 
4073 : a5 23 __ LDA P8 ; (s + 0)
4075 : f0 1f __ BEQ $4096 ; (nforml.s5 + 0)
.s35:
4077 : 24 22 __ BIT P7 ; (v + 3)
4079 : 10 1b __ BPL $4096 ; (nforml.s5 + 0)
.s36:
407b : 38 __ __ SEC
407c : a9 00 __ LDA #$00
407e : e5 1f __ SBC P4 ; (v + 0)
4080 : 85 1f __ STA P4 ; (v + 0)
4082 : a9 00 __ LDA #$00
4084 : e5 20 __ SBC P5 ; (v + 1)
4086 : 85 20 __ STA P5 ; (v + 1)
4088 : a9 00 __ LDA #$00
408a : e5 21 __ SBC P6 ; (v + 2)
408c : 85 21 __ STA P6 ; (v + 2)
408e : a9 00 __ LDA #$00
4090 : e5 22 __ SBC P7 ; (v + 3)
4092 : 85 22 __ STA P7 ; (v + 3)
4094 : e6 35 __ INC T4 + 0 
.s5:
4096 : a9 10 __ LDA #$10
4098 : 85 36 __ STA T5 + 0 
409a : a5 22 __ LDA P7 ; (v + 3)
409c : f0 03 __ BEQ $40a1 ; (nforml.s31 + 0)
409e : 4c 6b 41 JMP $416b ; (nforml.l28 + 0)
.s31:
40a1 : a5 21 __ LDA P6 ; (v + 2)
40a3 : d0 f9 __ BNE $409e ; (nforml.s5 + 8)
.s32:
40a5 : a5 20 __ LDA P5 ; (v + 1)
40a7 : d0 f5 __ BNE $409e ; (nforml.s5 + 8)
.s33:
40a9 : c5 1f __ CMP P4 ; (v + 0)
40ab : 90 f1 __ BCC $409e ; (nforml.s5 + 8)
.s6:
40ad : a0 02 __ LDY #$02
40af : b1 1b __ LDA (P0),y ; (si + 0)
40b1 : c9 ff __ CMP #$ff
40b3 : d0 04 __ BNE $40b9 ; (nforml.s27 + 0)
.s7:
40b5 : a9 0f __ LDA #$0f
40b7 : d0 05 __ BNE $40be ; (nforml.s41 + 0)
.s27:
40b9 : 38 __ __ SEC
40ba : a9 10 __ LDA #$10
40bc : f1 1b __ SBC (P0),y ; (si + 0)
.s41:
40be : a8 __ __ TAY
40bf : c4 36 __ CPY T5 + 0 
40c1 : b0 0d __ BCS $40d0 ; (nforml.s8 + 0)
.s26:
40c3 : a9 30 __ LDA #$30
.l42:
40c5 : a6 36 __ LDX T5 + 0 
40c7 : 9d bb 9f STA $9fbb,x ; (keyName[0] + 103)
40ca : c6 36 __ DEC T5 + 0 
40cc : c4 36 __ CPY T5 + 0 
40ce : 90 f5 __ BCC $40c5 ; (nforml.l42 + 0)
.s8:
40d0 : a0 07 __ LDY #$07
40d2 : b1 1b __ LDA (P0),y ; (si + 0)
40d4 : f0 1d __ BEQ $40f3 ; (nforml.s9 + 0)
.s24:
40d6 : a0 04 __ LDY #$04
40d8 : b1 1b __ LDA (P0),y ; (si + 0)
40da : c9 10 __ CMP #$10
40dc : d0 15 __ BNE $40f3 ; (nforml.s9 + 0)
.s25:
40de : 88 __ __ DEY
40df : b1 1b __ LDA (P0),y ; (si + 0)
40e1 : a8 __ __ TAY
40e2 : a9 30 __ LDA #$30
40e4 : a6 36 __ LDX T5 + 0 
40e6 : ca __ __ DEX
40e7 : ca __ __ DEX
40e8 : 86 36 __ STX T5 + 0 
40ea : 9d bc 9f STA $9fbc,x ; (buffer[0] + 0)
40ed : 98 __ __ TYA
40ee : 69 16 __ ADC #$16
40f0 : 9d bd 9f STA $9fbd,x ; (buffer[0] + 1)
.s9:
40f3 : a9 00 __ LDA #$00
40f5 : 85 29 __ STA ACCU + 0 
40f7 : a5 35 __ LDA T4 + 0 
40f9 : f0 0c __ BEQ $4107 ; (nforml.s10 + 0)
.s23:
40fb : a9 2d __ LDA #$2d
.s22:
40fd : a6 36 __ LDX T5 + 0 
40ff : 9d bb 9f STA $9fbb,x ; (keyName[0] + 103)
4102 : c6 36 __ DEC T5 + 0 
4104 : 4c 11 41 JMP $4111 ; (nforml.s11 + 0)
.s10:
4107 : a0 05 __ LDY #$05
4109 : b1 1b __ LDA (P0),y ; (si + 0)
410b : f0 04 __ BEQ $4111 ; (nforml.s11 + 0)
.s21:
410d : a9 2b __ LDA #$2b
410f : d0 ec __ BNE $40fd ; (nforml.s22 + 0)
.s11:
4111 : a6 36 __ LDX T5 + 0 
4113 : a0 06 __ LDY #$06
4115 : b1 1b __ LDA (P0),y ; (si + 0)
4117 : d0 2b __ BNE $4144 ; (nforml.s17 + 0)
.l12:
4119 : 8a __ __ TXA
411a : 18 __ __ CLC
411b : a0 01 __ LDY #$01
411d : 71 1b __ ADC (P0),y ; (si + 0)
411f : b0 04 __ BCS $4125 ; (nforml.s15 + 0)
.s16:
4121 : c9 11 __ CMP #$11
4123 : 90 0a __ BCC $412f ; (nforml.s13 + 0)
.s15:
4125 : a0 00 __ LDY #$00
4127 : b1 1b __ LDA (P0),y ; (si + 0)
4129 : 9d bb 9f STA $9fbb,x ; (keyName[0] + 103)
412c : ca __ __ DEX
412d : b0 ea __ BCS $4119 ; (nforml.l12 + 0)
.s13:
412f : e0 10 __ CPX #$10
4131 : b0 0e __ BCS $4141 ; (nforml.s43 + 0)
.s14:
4133 : 88 __ __ DEY
.l39:
4134 : bd bc 9f LDA $9fbc,x ; (buffer[0] + 0)
4137 : 91 1d __ STA (P2),y ; (str + 0)
4139 : c8 __ __ INY
413a : e8 __ __ INX
413b : e0 10 __ CPX #$10
413d : 90 f5 __ BCC $4134 ; (nforml.l39 + 0)
.s40:
413f : 84 29 __ STY ACCU + 0 
.s43:
4141 : a5 29 __ LDA ACCU + 0 
.s3:
4143 : 60 __ __ RTS
.s17:
4144 : e0 10 __ CPX #$10
4146 : b0 1a __ BCS $4162 ; (nforml.l18 + 0)
.s20:
4148 : a0 00 __ LDY #$00
.l37:
414a : bd bc 9f LDA $9fbc,x ; (buffer[0] + 0)
414d : 91 1d __ STA (P2),y ; (str + 0)
414f : c8 __ __ INY
4150 : e8 __ __ INX
4151 : e0 10 __ CPX #$10
4153 : 90 f5 __ BCC $414a ; (nforml.l37 + 0)
.s38:
4155 : 84 29 __ STY ACCU + 0 
4157 : b0 09 __ BCS $4162 ; (nforml.l18 + 0)
.s19:
4159 : 88 __ __ DEY
415a : b1 1b __ LDA (P0),y ; (si + 0)
415c : a4 29 __ LDY ACCU + 0 
415e : 91 1d __ STA (P2),y ; (str + 0)
4160 : e6 29 __ INC ACCU + 0 
.l18:
4162 : a5 29 __ LDA ACCU + 0 
4164 : a0 01 __ LDY #$01
4166 : d1 1b __ CMP (P0),y ; (si + 0)
4168 : 90 ef __ BCC $4159 ; (nforml.s19 + 0)
416a : 60 __ __ RTS
.l28:
416b : a0 04 __ LDY #$04
416d : b1 1b __ LDA (P0),y ; (si + 0)
416f : 85 11 __ STA WORK + 0 
4171 : a5 1f __ LDA P4 ; (v + 0)
4173 : 85 29 __ STA ACCU + 0 
4175 : a5 20 __ LDA P5 ; (v + 1)
4177 : 85 2a __ STA ACCU + 1 
4179 : a5 21 __ LDA P6 ; (v + 2)
417b : 85 2b __ STA ACCU + 2 
417d : a5 22 __ LDA P7 ; (v + 3)
417f : 85 2c __ STA ACCU + 3 
4181 : a9 00 __ LDA #$00
4183 : 85 12 __ STA WORK + 1 
4185 : 85 13 __ STA WORK + 2 
4187 : 85 14 __ STA WORK + 3 
4189 : 20 37 77 JSR $7737 ; (divmod32 + 0)
418c : a5 15 __ LDA WORK + 4 
418e : c9 0a __ CMP #$0a
4190 : b0 04 __ BCS $4196 ; (nforml.s34 + 0)
.s29:
4192 : a9 30 __ LDA #$30
4194 : 90 06 __ BCC $419c ; (nforml.s30 + 0)
.s34:
4196 : a0 03 __ LDY #$03
4198 : b1 1b __ LDA (P0),y ; (si + 0)
419a : e9 0a __ SBC #$0a
.s30:
419c : 18 __ __ CLC
419d : 65 15 __ ADC WORK + 4 
419f : a6 36 __ LDX T5 + 0 
41a1 : 9d bb 9f STA $9fbb,x ; (keyName[0] + 103)
41a4 : c6 36 __ DEC T5 + 0 
41a6 : a5 29 __ LDA ACCU + 0 
41a8 : 85 1f __ STA P4 ; (v + 0)
41aa : a5 2a __ LDA ACCU + 1 
41ac : 85 20 __ STA P5 ; (v + 1)
41ae : a5 2b __ LDA ACCU + 2 
41b0 : 85 21 __ STA P6 ; (v + 2)
41b2 : a5 2c __ LDA ACCU + 3 
41b4 : 85 22 __ STA P7 ; (v + 3)
41b6 : d0 b3 __ BNE $416b ; (nforml.l28 + 0)
41b8 : 4c a1 40 JMP $40a1 ; (nforml.s31 + 0)
--------------------------------------------------------------------
nformf: ; nformf(const struct sinfo*,u8*,float,u8)->u8
; 199, "/mnt/d/F256/oscar64/include/stdio.c"
.s4:
41bb : a5 24 __ LDA P9 ; (f + 1)
41bd : 85 36 __ STA T0 + 1 
41bf : a5 25 __ LDA P10 ; (f + 2)
41c1 : 85 37 __ STA T0 + 2 
41c3 : a5 26 __ LDA P11 ; (f + 3)
41c5 : 29 7f __ AND #$7f
41c7 : 05 25 __ ORA P10 ; (f + 2)
41c9 : 05 24 __ ORA P9 ; (f + 1)
41cb : 05 23 __ ORA P8 ; (f + 0)
41cd : f0 21 __ BEQ $41f0 ; (nformf.s5 + 0)
.s107:
41cf : 24 26 __ BIT P11 ; (f + 3)
41d1 : 10 1d __ BPL $41f0 ; (nformf.s5 + 0)
.s106:
41d3 : a9 2d __ LDA #$2d
41d5 : a0 00 __ LDY #$00
41d7 : 91 21 __ STA (P6),y ; (str + 0)
41d9 : a5 26 __ LDA P11 ; (f + 3)
41db : 49 80 __ EOR #$80
41dd : 85 1e __ STA P3 
41df : 85 26 __ STA P11 ; (f + 3)
41e1 : a5 23 __ LDA P8 ; (f + 0)
41e3 : 85 1b __ STA P0 
41e5 : a5 24 __ LDA P9 ; (f + 1)
41e7 : 85 1c __ STA P1 
41e9 : a5 25 __ LDA P10 ; (f + 2)
41eb : 85 1d __ STA P2 
41ed : 4c fa 46 JMP $46fa ; (nformf.s104 + 0)
.s5:
41f0 : a5 23 __ LDA P8 ; (f + 0)
41f2 : 85 1b __ STA P0 
41f4 : a5 24 __ LDA P9 ; (f + 1)
41f6 : 85 1c __ STA P1 
41f8 : a5 25 __ LDA P10 ; (f + 2)
41fa : 85 1d __ STA P2 
41fc : a5 26 __ LDA P11 ; (f + 3)
41fe : 85 1e __ STA P3 
4200 : a0 05 __ LDY #$05
4202 : b1 1f __ LDA (P4),y ; (si + 0)
4204 : f0 09 __ BEQ $420f ; (nformf.s6 + 0)
.s103:
4206 : a9 2b __ LDA #$2b
4208 : a0 00 __ LDY #$00
420a : 91 21 __ STA (P6),y ; (str + 0)
420c : 4c fa 46 JMP $46fa ; (nformf.s104 + 0)
.s6:
420f : 20 0b 47 JSR $470b ; (isinf.s4 + 0)
4212 : a2 00 __ LDX #$00
4214 : 86 46 __ STX T9 + 0 
4216 : a8 __ __ TAY
4217 : f0 05 __ BEQ $421e ; (nformf.s7 + 0)
.s101:
4219 : a9 02 __ LDA #$02
421b : 4c ca 46 JMP $46ca ; (nformf.s102 + 0)
.s7:
421e : a5 1f __ LDA P4 ; (si + 0)
4220 : 85 3d __ STA T2 + 0 
4222 : a5 20 __ LDA P5 ; (si + 1)
4224 : 85 3e __ STA T2 + 1 
4226 : a0 02 __ LDY #$02
4228 : b1 1f __ LDA (P4),y ; (si + 0)
422a : c9 ff __ CMP #$ff
422c : d0 02 __ BNE $4230 ; (nformf.s100 + 0)
.s8:
422e : a9 06 __ LDA #$06
.s100:
4230 : 85 3f __ STA T3 + 0 
4232 : 85 44 __ STA T6 + 0 
4234 : a9 00 __ LDA #$00
4236 : 85 41 __ STA T4 + 0 
4238 : 85 42 __ STA T4 + 1 
423a : a5 26 __ LDA P11 ; (f + 3)
423c : 85 38 __ STA T0 + 3 
423e : 29 7f __ AND #$7f
4240 : 05 25 __ ORA P10 ; (f + 2)
4242 : 05 24 __ ORA P9 ; (f + 1)
4244 : a6 23 __ LDX P8 ; (f + 0)
4246 : 86 35 __ STX T0 + 0 
4248 : 05 23 __ ORA P8 ; (f + 0)
424a : d0 03 __ BNE $424f ; (nformf.s67 + 0)
424c : 4c 83 43 JMP $4383 ; (nformf.s9 + 0)
.s67:
424f : a5 26 __ LDA P11 ; (f + 3)
4251 : 10 03 __ BPL $4256 ; (nformf.s95 + 0)
4253 : 4c d5 42 JMP $42d5 ; (nformf.l80 + 0)
.s95:
4256 : c9 44 __ CMP #$44
4258 : d0 0d __ BNE $4267 ; (nformf.l99 + 0)
.s96:
425a : a5 25 __ LDA P10 ; (f + 2)
425c : c9 7a __ CMP #$7a
425e : d0 07 __ BNE $4267 ; (nformf.l99 + 0)
.s97:
4260 : a5 24 __ LDA P9 ; (f + 1)
4262 : d0 03 __ BNE $4267 ; (nformf.l99 + 0)
.s98:
4264 : 8a __ __ TXA
4265 : f0 02 __ BEQ $4269 ; (nformf.l90 + 0)
.l99:
4267 : 90 54 __ BCC $42bd ; (nformf.s68 + 0)
.l90:
4269 : 18 __ __ CLC
426a : a5 41 __ LDA T4 + 0 
426c : 69 03 __ ADC #$03
426e : 85 41 __ STA T4 + 0 
4270 : 90 02 __ BCC $4274 ; (nformf.s121 + 0)
.s120:
4272 : e6 42 __ INC T4 + 1 
.s121:
4274 : a5 35 __ LDA T0 + 0 
4276 : 85 29 __ STA ACCU + 0 
4278 : a5 36 __ LDA T0 + 1 
427a : 85 2a __ STA ACCU + 1 
427c : a5 37 __ LDA T0 + 2 
427e : 85 2b __ STA ACCU + 2 
4280 : a5 38 __ LDA T0 + 3 
4282 : 85 2c __ STA ACCU + 3 
4284 : a9 00 __ LDA #$00
4286 : 85 11 __ STA WORK + 0 
4288 : 85 12 __ STA WORK + 1 
428a : a9 7a __ LDA #$7a
428c : 85 13 __ STA WORK + 2 
428e : a9 44 __ LDA #$44
4290 : 85 14 __ STA WORK + 3 
4292 : 20 e2 72 JSR $72e2 ; (freg + 20)
4295 : 20 c8 74 JSR $74c8 ; (crt_fdiv + 0)
4298 : a5 29 __ LDA ACCU + 0 
429a : 85 35 __ STA T0 + 0 
429c : a5 2a __ LDA ACCU + 1 
429e : 85 36 __ STA T0 + 1 
42a0 : a6 2b __ LDX ACCU + 2 
42a2 : 86 37 __ STX T0 + 2 
42a4 : a5 2c __ LDA ACCU + 3 
42a6 : 85 38 __ STA T0 + 3 
42a8 : 30 13 __ BMI $42bd ; (nformf.s68 + 0)
.s91:
42aa : c9 44 __ CMP #$44
42ac : d0 b9 __ BNE $4267 ; (nformf.l99 + 0)
.s92:
42ae : e0 7a __ CPX #$7a
42b0 : d0 b5 __ BNE $4267 ; (nformf.l99 + 0)
.s93:
42b2 : a5 2a __ LDA ACCU + 1 
42b4 : 38 __ __ SEC
42b5 : d0 b0 __ BNE $4267 ; (nformf.l99 + 0)
.s94:
42b7 : a5 29 __ LDA ACCU + 0 
42b9 : f0 ae __ BEQ $4269 ; (nformf.l90 + 0)
42bb : d0 aa __ BNE $4267 ; (nformf.l99 + 0)
.s68:
42bd : a5 38 __ LDA T0 + 3 
42bf : 30 14 __ BMI $42d5 ; (nformf.l80 + 0)
.s86:
42c1 : c9 3f __ CMP #$3f
42c3 : d0 0e __ BNE $42d3 ; (nformf.s85 + 0)
.s87:
42c5 : a5 37 __ LDA T0 + 2 
42c7 : c9 80 __ CMP #$80
42c9 : d0 08 __ BNE $42d3 ; (nformf.s85 + 0)
.s88:
42cb : a5 36 __ LDA T0 + 1 
42cd : d0 04 __ BNE $42d3 ; (nformf.s85 + 0)
.s89:
42cf : a5 35 __ LDA T0 + 0 
42d1 : f0 49 __ BEQ $431c ; (nformf.s69 + 0)
.s85:
42d3 : b0 47 __ BCS $431c ; (nformf.s69 + 0)
.l80:
42d5 : 38 __ __ SEC
42d6 : a5 41 __ LDA T4 + 0 
42d8 : e9 03 __ SBC #$03
42da : 85 41 __ STA T4 + 0 
42dc : b0 02 __ BCS $42e0 ; (nformf.s116 + 0)
.s115:
42de : c6 42 __ DEC T4 + 1 
.s116:
42e0 : a9 00 __ LDA #$00
42e2 : 85 29 __ STA ACCU + 0 
42e4 : 85 2a __ STA ACCU + 1 
42e6 : a9 7a __ LDA #$7a
42e8 : 85 2b __ STA ACCU + 2 
42ea : a9 44 __ LDA #$44
42ec : 85 2c __ STA ACCU + 3 
42ee : a2 35 __ LDX #$35
42f0 : 20 d2 72 JSR $72d2 ; (freg + 4)
42f3 : 20 00 74 JSR $7400 ; (crt_fmul + 0)
42f6 : a5 29 __ LDA ACCU + 0 
42f8 : 85 35 __ STA T0 + 0 
42fa : a5 2a __ LDA ACCU + 1 
42fc : 85 36 __ STA T0 + 1 
42fe : a6 2b __ LDX ACCU + 2 
4300 : 86 37 __ STX T0 + 2 
4302 : a5 2c __ LDA ACCU + 3 
4304 : 85 38 __ STA T0 + 3 
4306 : 30 cd __ BMI $42d5 ; (nformf.l80 + 0)
.s81:
4308 : c9 3f __ CMP #$3f
430a : 90 c9 __ BCC $42d5 ; (nformf.l80 + 0)
.s122:
430c : d0 0e __ BNE $431c ; (nformf.s69 + 0)
.s82:
430e : e0 80 __ CPX #$80
4310 : 90 c3 __ BCC $42d5 ; (nformf.l80 + 0)
.s123:
4312 : d0 08 __ BNE $431c ; (nformf.s69 + 0)
.s83:
4314 : a5 2a __ LDA ACCU + 1 
4316 : d0 bb __ BNE $42d3 ; (nformf.s85 + 0)
.s84:
4318 : a5 29 __ LDA ACCU + 0 
431a : d0 b7 __ BNE $42d3 ; (nformf.s85 + 0)
.s69:
431c : a5 38 __ LDA T0 + 3 
431e : 30 63 __ BMI $4383 ; (nformf.s9 + 0)
.s75:
4320 : c9 41 __ CMP #$41
4322 : d0 0e __ BNE $4332 ; (nformf.l79 + 0)
.s76:
4324 : a5 37 __ LDA T0 + 2 
4326 : c9 20 __ CMP #$20
4328 : d0 08 __ BNE $4332 ; (nformf.l79 + 0)
.s77:
432a : a5 36 __ LDA T0 + 1 
432c : d0 04 __ BNE $4332 ; (nformf.l79 + 0)
.s78:
432e : a5 35 __ LDA T0 + 0 
4330 : f0 02 __ BEQ $4334 ; (nformf.l70 + 0)
.l79:
4332 : 90 4f __ BCC $4383 ; (nformf.s9 + 0)
.l70:
4334 : e6 41 __ INC T4 + 0 
4336 : d0 02 __ BNE $433a ; (nformf.s119 + 0)
.s118:
4338 : e6 42 __ INC T4 + 1 
.s119:
433a : a5 35 __ LDA T0 + 0 
433c : 85 29 __ STA ACCU + 0 
433e : a5 36 __ LDA T0 + 1 
4340 : 85 2a __ STA ACCU + 1 
4342 : a5 37 __ LDA T0 + 2 
4344 : 85 2b __ STA ACCU + 2 
4346 : a5 38 __ LDA T0 + 3 
4348 : 85 2c __ STA ACCU + 3 
434a : a9 00 __ LDA #$00
434c : 85 11 __ STA WORK + 0 
434e : 85 12 __ STA WORK + 1 
4350 : a9 20 __ LDA #$20
4352 : 85 13 __ STA WORK + 2 
4354 : a9 41 __ LDA #$41
4356 : 85 14 __ STA WORK + 3 
4358 : 20 e2 72 JSR $72e2 ; (freg + 20)
435b : 20 c8 74 JSR $74c8 ; (crt_fdiv + 0)
435e : a5 29 __ LDA ACCU + 0 
4360 : 85 35 __ STA T0 + 0 
4362 : a5 2a __ LDA ACCU + 1 
4364 : 85 36 __ STA T0 + 1 
4366 : a6 2b __ LDX ACCU + 2 
4368 : 86 37 __ STX T0 + 2 
436a : a5 2c __ LDA ACCU + 3 
436c : 85 38 __ STA T0 + 3 
436e : 30 13 __ BMI $4383 ; (nformf.s9 + 0)
.s71:
4370 : c9 41 __ CMP #$41
4372 : d0 be __ BNE $4332 ; (nformf.l79 + 0)
.s72:
4374 : e0 20 __ CPX #$20
4376 : d0 ba __ BNE $4332 ; (nformf.l79 + 0)
.s73:
4378 : a5 2a __ LDA ACCU + 1 
437a : 38 __ __ SEC
437b : d0 b5 __ BNE $4332 ; (nformf.l79 + 0)
.s74:
437d : a5 29 __ LDA ACCU + 0 
437f : f0 b3 __ BEQ $4334 ; (nformf.l70 + 0)
4381 : d0 af __ BNE $4332 ; (nformf.l79 + 0)
.s9:
4383 : ad cc 9f LDA $9fcc ; (sstack + 0)
4386 : c9 65 __ CMP #$65
4388 : d0 04 __ BNE $438e ; (nformf.s11 + 0)
.s10:
438a : a9 01 __ LDA #$01
438c : d0 02 __ BNE $4390 ; (nformf.s12 + 0)
.s11:
438e : a9 00 __ LDA #$00
.s12:
4390 : 85 47 __ STA T10 + 0 
4392 : a6 3f __ LDX T3 + 0 
4394 : e8 __ __ INX
4395 : 86 43 __ STX T5 + 0 
4397 : ad cc 9f LDA $9fcc ; (sstack + 0)
439a : c9 67 __ CMP #$67
439c : d0 13 __ BNE $43b1 ; (nformf.s13 + 0)
.s63:
439e : a5 42 __ LDA T4 + 1 
43a0 : 30 08 __ BMI $43aa ; (nformf.s64 + 0)
.s66:
43a2 : d0 06 __ BNE $43aa ; (nformf.s64 + 0)
.s65:
43a4 : a5 41 __ LDA T4 + 0 
43a6 : c9 04 __ CMP #$04
43a8 : 90 07 __ BCC $43b1 ; (nformf.s13 + 0)
.s64:
43aa : a9 01 __ LDA #$01
43ac : 85 47 __ STA T10 + 0 
43ae : 4c 30 46 JMP $4630 ; (nformf.s53 + 0)
.s13:
43b1 : a5 47 __ LDA T10 + 0 
43b3 : d0 f9 __ BNE $43ae ; (nformf.s64 + 4)
.s14:
43b5 : 24 42 __ BIT T4 + 1 
43b7 : 10 43 __ BPL $43fc ; (nformf.s15 + 0)
.s52:
43b9 : a5 35 __ LDA T0 + 0 
43bb : 85 29 __ STA ACCU + 0 
43bd : a5 36 __ LDA T0 + 1 
43bf : 85 2a __ STA ACCU + 1 
43c1 : a5 37 __ LDA T0 + 2 
43c3 : 85 2b __ STA ACCU + 2 
43c5 : a5 38 __ LDA T0 + 3 
43c7 : 85 2c __ STA ACCU + 3 
.l108:
43c9 : a9 00 __ LDA #$00
43cb : 85 11 __ STA WORK + 0 
43cd : 85 12 __ STA WORK + 1 
43cf : a9 20 __ LDA #$20
43d1 : 85 13 __ STA WORK + 2 
43d3 : a9 41 __ LDA #$41
43d5 : 85 14 __ STA WORK + 3 
43d7 : 20 e2 72 JSR $72e2 ; (freg + 20)
43da : 20 c8 74 JSR $74c8 ; (crt_fdiv + 0)
43dd : 18 __ __ CLC
43de : a5 41 __ LDA T4 + 0 
43e0 : 69 01 __ ADC #$01
43e2 : 85 41 __ STA T4 + 0 
43e4 : a5 42 __ LDA T4 + 1 
43e6 : 69 00 __ ADC #$00
43e8 : 85 42 __ STA T4 + 1 
43ea : 30 dd __ BMI $43c9 ; (nformf.l108 + 0)
.s109:
43ec : a5 2c __ LDA ACCU + 3 
43ee : 85 38 __ STA T0 + 3 
43f0 : a5 2b __ LDA ACCU + 2 
43f2 : 85 37 __ STA T0 + 2 
43f4 : a5 2a __ LDA ACCU + 1 
43f6 : 85 36 __ STA T0 + 1 
43f8 : a5 29 __ LDA ACCU + 0 
43fa : 85 35 __ STA T0 + 0 
.s15:
43fc : 18 __ __ CLC
43fd : a5 3f __ LDA T3 + 0 
43ff : 65 41 __ ADC T4 + 0 
4401 : 18 __ __ CLC
4402 : 69 01 __ ADC #$01
4404 : 85 43 __ STA T5 + 0 
4406 : c9 07 __ CMP #$07
4408 : 90 14 __ BCC $441e ; (nformf.s51 + 0)
.s16:
440a : ad 54 7a LDA $7a54 ; (fround5[0] + 24)
440d : 85 39 __ STA T1 + 0 
440f : ad 55 7a LDA $7a55 ; (fround5[0] + 25)
4412 : 85 3a __ STA T1 + 1 
4414 : ad 56 7a LDA $7a56 ; (fround5[0] + 26)
4417 : 85 3b __ STA T1 + 2 
4419 : ad 57 7a LDA $7a57 ; (fround5[0] + 27)
441c : b0 15 __ BCS $4433 ; (nformf.s17 + 0)
.s51:
441e : 0a __ __ ASL
441f : 0a __ __ ASL
4420 : aa __ __ TAX
4421 : bd 38 7a LDA $7a38,x ; (localDirectory[0] + 56)
4424 : 85 39 __ STA T1 + 0 
4426 : bd 39 7a LDA $7a39,x ; (localDirectory[0] + 57)
4429 : 85 3a __ STA T1 + 1 
442b : bd 3a 7a LDA $7a3a,x ; (localDirectory[0] + 58)
442e : 85 3b __ STA T1 + 2 
4430 : bd 3b 7a LDA $7a3b,x ; (localDirectory[0] + 59)
.s17:
4433 : 85 3c __ STA T1 + 3 
4435 : a5 35 __ LDA T0 + 0 
4437 : 85 29 __ STA ACCU + 0 
4439 : a5 36 __ LDA T0 + 1 
443b : 85 2a __ STA ACCU + 1 
443d : a5 37 __ LDA T0 + 2 
443f : 85 2b __ STA ACCU + 2 
4441 : a5 38 __ LDA T0 + 3 
4443 : 85 2c __ STA ACCU + 3 
4445 : a2 39 __ LDX #$39
4447 : 20 d2 72 JSR $72d2 ; (freg + 4)
444a : 20 19 73 JSR $7319 ; (faddsub + 6)
444d : a5 2a __ LDA ACCU + 1 
444f : 85 24 __ STA P9 ; (f + 1)
4451 : a5 2b __ LDA ACCU + 2 
4453 : 85 25 __ STA P10 ; (f + 2)
4455 : a6 29 __ LDX ACCU + 0 
4457 : a5 2c __ LDA ACCU + 3 
4459 : 85 26 __ STA P11 ; (f + 3)
445b : 30 3a __ BMI $4497 ; (nformf.s18 + 0)
.s46:
445d : c9 41 __ CMP #$41
445f : d0 0d __ BNE $446e ; (nformf.s50 + 0)
.s47:
4461 : a5 25 __ LDA P10 ; (f + 2)
4463 : c9 20 __ CMP #$20
4465 : d0 07 __ BNE $446e ; (nformf.s50 + 0)
.s48:
4467 : a5 24 __ LDA P9 ; (f + 1)
4469 : d0 03 __ BNE $446e ; (nformf.s50 + 0)
.s49:
446b : 8a __ __ TXA
446c : f0 02 __ BEQ $4470 ; (nformf.s45 + 0)
.s50:
446e : 90 27 __ BCC $4497 ; (nformf.s18 + 0)
.s45:
4470 : a9 00 __ LDA #$00
4472 : 85 11 __ STA WORK + 0 
4474 : 85 12 __ STA WORK + 1 
4476 : a9 20 __ LDA #$20
4478 : 85 13 __ STA WORK + 2 
447a : a9 41 __ LDA #$41
447c : 85 14 __ STA WORK + 3 
447e : 20 e2 72 JSR $72e2 ; (freg + 20)
4481 : 20 c8 74 JSR $74c8 ; (crt_fdiv + 0)
4484 : a5 2a __ LDA ACCU + 1 
4486 : 85 24 __ STA P9 ; (f + 1)
4488 : a5 2b __ LDA ACCU + 2 
448a : 85 25 __ STA P10 ; (f + 2)
448c : a5 2c __ LDA ACCU + 3 
448e : 85 26 __ STA P11 ; (f + 3)
4490 : a6 3f __ LDX T3 + 0 
4492 : ca __ __ DEX
4493 : 86 44 __ STX T6 + 0 
4495 : a6 29 __ LDX ACCU + 0 
.s18:
4497 : 38 __ __ SEC
4498 : a5 43 __ LDA T5 + 0 
449a : e5 44 __ SBC T6 + 0 
449c : 85 3f __ STA T3 + 0 
449e : a9 00 __ LDA #$00
44a0 : e9 00 __ SBC #$00
44a2 : 85 40 __ STA T3 + 1 
44a4 : a9 14 __ LDA #$14
44a6 : c5 43 __ CMP T5 + 0 
44a8 : b0 02 __ BCS $44ac ; (nformf.s19 + 0)
.s44:
44aa : 85 43 __ STA T5 + 0 
.s19:
44ac : a5 3f __ LDA T3 + 0 
44ae : d0 08 __ BNE $44b8 ; (nformf.s21 + 0)
.s20:
44b0 : a9 30 __ LDA #$30
44b2 : a4 46 __ LDY T9 + 0 
44b4 : 91 21 __ STA (P6),y ; (str + 0)
44b6 : e6 46 __ INC T9 + 0 
.s21:
44b8 : a9 00 __ LDA #$00
44ba : 85 48 __ STA T11 + 0 
44bc : c5 3f __ CMP T3 + 0 
44be : f0 6f __ BEQ $452f ; (nformf.l43 + 0)
.s23:
44c0 : c9 07 __ CMP #$07
44c2 : 90 04 __ BCC $44c8 ; (nformf.s24 + 0)
.l42:
44c4 : a9 30 __ LDA #$30
44c6 : b0 55 __ BCS $451d ; (nformf.l25 + 0)
.s24:
44c8 : 86 29 __ STX ACCU + 0 
44ca : 86 35 __ STX T0 + 0 
44cc : a5 24 __ LDA P9 ; (f + 1)
44ce : 85 2a __ STA ACCU + 1 
44d0 : 85 36 __ STA T0 + 1 
44d2 : a5 25 __ LDA P10 ; (f + 2)
44d4 : 85 2b __ STA ACCU + 2 
44d6 : 85 37 __ STA T0 + 2 
44d8 : a5 26 __ LDA P11 ; (f + 3)
44da : 85 2c __ STA ACCU + 3 
44dc : 85 38 __ STA T0 + 3 
44de : 20 a4 76 JSR $76a4 ; (f32_to_i16 + 0)
44e1 : a5 29 __ LDA ACCU + 0 
44e3 : 85 45 __ STA T7 + 0 
44e5 : 20 f0 76 JSR $76f0 ; (sint16_to_float + 0)
44e8 : a2 35 __ LDX #$35
44ea : 20 d2 72 JSR $72d2 ; (freg + 4)
44ed : a5 2c __ LDA ACCU + 3 
44ef : 49 80 __ EOR #$80
44f1 : 85 2c __ STA ACCU + 3 
44f3 : 20 19 73 JSR $7319 ; (faddsub + 6)
44f6 : a9 00 __ LDA #$00
44f8 : 85 11 __ STA WORK + 0 
44fa : 85 12 __ STA WORK + 1 
44fc : a9 20 __ LDA #$20
44fe : 85 13 __ STA WORK + 2 
4500 : a9 41 __ LDA #$41
4502 : 85 14 __ STA WORK + 3 
4504 : 20 e2 72 JSR $72e2 ; (freg + 20)
4507 : 20 00 74 JSR $7400 ; (crt_fmul + 0)
450a : a5 2a __ LDA ACCU + 1 
450c : 85 24 __ STA P9 ; (f + 1)
450e : a5 2b __ LDA ACCU + 2 
4510 : 85 25 __ STA P10 ; (f + 2)
4512 : a5 2c __ LDA ACCU + 3 
4514 : 85 26 __ STA P11 ; (f + 3)
4516 : 18 __ __ CLC
4517 : a5 45 __ LDA T7 + 0 
4519 : 69 30 __ ADC #$30
451b : a6 29 __ LDX ACCU + 0 
.l25:
451d : a4 46 __ LDY T9 + 0 
451f : 91 21 __ STA (P6),y ; (str + 0)
4521 : e6 46 __ INC T9 + 0 
4523 : e6 48 __ INC T11 + 0 
4525 : a5 48 __ LDA T11 + 0 
4527 : c5 43 __ CMP T5 + 0 
4529 : b0 14 __ BCS $453f ; (nformf.s26 + 0)
.s22:
452b : c5 3f __ CMP T3 + 0 
452d : d0 91 __ BNE $44c0 ; (nformf.s23 + 0)
.l43:
452f : a9 2e __ LDA #$2e
4531 : a4 46 __ LDY T9 + 0 
4533 : 91 21 __ STA (P6),y ; (str + 0)
4535 : e6 46 __ INC T9 + 0 
4537 : a5 48 __ LDA T11 + 0 
4539 : c9 07 __ CMP #$07
453b : 90 8b __ BCC $44c8 ; (nformf.s24 + 0)
453d : b0 85 __ BCS $44c4 ; (nformf.l42 + 0)
.s26:
453f : a5 47 __ LDA T10 + 0 
4541 : f0 66 __ BEQ $45a9 ; (nformf.s27 + 0)
.s38:
4543 : a0 03 __ LDY #$03
4545 : b1 3d __ LDA (T2 + 0),y 
4547 : 69 03 __ ADC #$03
4549 : a4 46 __ LDY T9 + 0 
454b : 91 21 __ STA (P6),y ; (str + 0)
454d : c8 __ __ INY
454e : 84 46 __ STY T9 + 0 
4550 : 24 42 __ BIT T4 + 1 
4552 : 30 06 __ BMI $455a ; (nformf.s41 + 0)
.s39:
4554 : a9 2b __ LDA #$2b
4556 : 91 21 __ STA (P6),y ; (str + 0)
4558 : d0 11 __ BNE $456b ; (nformf.s40 + 0)
.s41:
455a : a9 2d __ LDA #$2d
455c : 91 21 __ STA (P6),y ; (str + 0)
455e : 38 __ __ SEC
455f : a9 00 __ LDA #$00
4561 : e5 41 __ SBC T4 + 0 
4563 : 85 41 __ STA T4 + 0 
4565 : a9 00 __ LDA #$00
4567 : e5 42 __ SBC T4 + 1 
4569 : 85 42 __ STA T4 + 1 
.s40:
456b : e6 46 __ INC T9 + 0 
456d : a5 41 __ LDA T4 + 0 
456f : 85 29 __ STA ACCU + 0 
4571 : a5 42 __ LDA T4 + 1 
4573 : 85 2a __ STA ACCU + 1 
4575 : a9 0a __ LDA #$0a
4577 : 85 11 __ STA WORK + 0 
4579 : a9 00 __ LDA #$00
457b : 85 12 __ STA WORK + 1 
457d : 20 b8 75 JSR $75b8 ; (divs16 + 0)
4580 : 18 __ __ CLC
4581 : a5 29 __ LDA ACCU + 0 
4583 : 69 30 __ ADC #$30
4585 : a4 46 __ LDY T9 + 0 
4587 : 91 21 __ STA (P6),y ; (str + 0)
4589 : e6 46 __ INC T9 + 0 
458b : a5 41 __ LDA T4 + 0 
458d : 85 29 __ STA ACCU + 0 
458f : a5 42 __ LDA T4 + 1 
4591 : 85 2a __ STA ACCU + 1 
4593 : a9 0a __ LDA #$0a
4595 : 85 11 __ STA WORK + 0 
4597 : a9 00 __ LDA #$00
4599 : 85 12 __ STA WORK + 1 
459b : 20 77 76 JSR $7677 ; (mods16 + 0)
459e : 18 __ __ CLC
459f : a5 13 __ LDA WORK + 2 
45a1 : 69 30 __ ADC #$30
45a3 : a4 46 __ LDY T9 + 0 
45a5 : 91 21 __ STA (P6),y ; (str + 0)
45a7 : e6 46 __ INC T9 + 0 
.s27:
45a9 : a5 46 __ LDA T9 + 0 
45ab : a0 01 __ LDY #$01
45ad : d1 1f __ CMP (P4),y ; (si + 0)
45af : b0 6d __ BCS $461e ; (nformf.s3 + 0)
.s28:
45b1 : a0 06 __ LDY #$06
45b3 : b1 1f __ LDA (P4),y ; (si + 0)
45b5 : f0 04 __ BEQ $45bb ; (nformf.s29 + 0)
.s110:
45b7 : a6 46 __ LDX T9 + 0 
45b9 : 90 66 __ BCC $4621 ; (nformf.l36 + 0)
.s29:
45bb : a5 46 __ LDA T9 + 0 
45bd : f0 40 __ BEQ $45ff ; (nformf.s30 + 0)
.s35:
45bf : e9 00 __ SBC #$00
45c1 : a8 __ __ TAY
45c2 : a9 00 __ LDA #$00
45c4 : e9 00 __ SBC #$00
45c6 : aa __ __ TAX
45c7 : 98 __ __ TYA
45c8 : 18 __ __ CLC
45c9 : 65 21 __ ADC P6 ; (str + 0)
45cb : 85 39 __ STA T1 + 0 
45cd : 8a __ __ TXA
45ce : 65 22 __ ADC P7 ; (str + 1)
45d0 : 85 3a __ STA T1 + 1 
45d2 : a9 01 __ LDA #$01
45d4 : 85 3f __ STA T3 + 0 
45d6 : a6 46 __ LDX T9 + 0 
45d8 : 38 __ __ SEC
.l111:
45d9 : a0 01 __ LDY #$01
45db : b1 1f __ LDA (P4),y ; (si + 0)
45dd : e5 3f __ SBC T3 + 0 
45df : 85 3d __ STA T2 + 0 
45e1 : a9 00 __ LDA #$00
45e3 : e5 40 __ SBC T3 + 1 
45e5 : 18 __ __ CLC
45e6 : 65 22 __ ADC P7 ; (str + 1)
45e8 : 85 3e __ STA T2 + 1 
45ea : 88 __ __ DEY
45eb : b1 39 __ LDA (T1 + 0),y 
45ed : a4 21 __ LDY P6 ; (str + 0)
45ef : 91 3d __ STA (T2 + 0),y 
45f1 : a5 39 __ LDA T1 + 0 
45f3 : d0 02 __ BNE $45f7 ; (nformf.s114 + 0)
.s113:
45f5 : c6 3a __ DEC T1 + 1 
.s114:
45f7 : c6 39 __ DEC T1 + 0 
45f9 : e6 3f __ INC T3 + 0 
45fb : e4 3f __ CPX T3 + 0 
45fd : b0 da __ BCS $45d9 ; (nformf.l111 + 0)
.s30:
45ff : a9 00 __ LDA #$00
4601 : 85 3f __ STA T3 + 0 
4603 : 90 08 __ BCC $460d ; (nformf.l31 + 0)
.s33:
4605 : a9 20 __ LDA #$20
4607 : a4 3f __ LDY T3 + 0 
4609 : 91 21 __ STA (P6),y ; (str + 0)
460b : e6 3f __ INC T3 + 0 
.l31:
460d : a0 01 __ LDY #$01
460f : b1 1f __ LDA (P4),y ; (si + 0)
4611 : 38 __ __ SEC
4612 : e5 46 __ SBC T9 + 0 
4614 : 90 ef __ BCC $4605 ; (nformf.s33 + 0)
.s34:
4616 : c5 3f __ CMP T3 + 0 
4618 : 90 02 __ BCC $461c ; (nformf.s32 + 0)
.s112:
461a : d0 e9 __ BNE $4605 ; (nformf.s33 + 0)
.s32:
461c : b1 1f __ LDA (P4),y ; (si + 0)
.s3:
461e : 85 29 __ STA ACCU + 0 
4620 : 60 __ __ RTS
.l36:
4621 : 8a __ __ TXA
4622 : a0 01 __ LDY #$01
4624 : d1 1f __ CMP (P4),y ; (si + 0)
4626 : b0 f4 __ BCS $461c ; (nformf.s32 + 0)
.s37:
4628 : a8 __ __ TAY
4629 : a9 20 __ LDA #$20
462b : 91 21 __ STA (P6),y ; (str + 0)
462d : e8 __ __ INX
462e : 90 f1 __ BCC $4621 ; (nformf.l36 + 0)
.s53:
4630 : a5 43 __ LDA T5 + 0 
4632 : c9 07 __ CMP #$07
4634 : 90 14 __ BCC $464a ; (nformf.s62 + 0)
.s54:
4636 : ad 54 7a LDA $7a54 ; (fround5[0] + 24)
4639 : 85 39 __ STA T1 + 0 
463b : ad 55 7a LDA $7a55 ; (fround5[0] + 25)
463e : 85 3a __ STA T1 + 1 
4640 : ad 56 7a LDA $7a56 ; (fround5[0] + 26)
4643 : 85 3b __ STA T1 + 2 
4645 : ad 57 7a LDA $7a57 ; (fround5[0] + 27)
4648 : b0 15 __ BCS $465f ; (nformf.s55 + 0)
.s62:
464a : 0a __ __ ASL
464b : 0a __ __ ASL
464c : aa __ __ TAX
464d : bd 38 7a LDA $7a38,x ; (localDirectory[0] + 56)
4650 : 85 39 __ STA T1 + 0 
4652 : bd 39 7a LDA $7a39,x ; (localDirectory[0] + 57)
4655 : 85 3a __ STA T1 + 1 
4657 : bd 3a 7a LDA $7a3a,x ; (localDirectory[0] + 58)
465a : 85 3b __ STA T1 + 2 
465c : bd 3b 7a LDA $7a3b,x ; (localDirectory[0] + 59)
.s55:
465f : 85 3c __ STA T1 + 3 
4661 : a5 35 __ LDA T0 + 0 
4663 : 85 29 __ STA ACCU + 0 
4665 : a5 36 __ LDA T0 + 1 
4667 : 85 2a __ STA ACCU + 1 
4669 : a5 37 __ LDA T0 + 2 
466b : 85 2b __ STA ACCU + 2 
466d : a5 38 __ LDA T0 + 3 
466f : 85 2c __ STA ACCU + 3 
4671 : a2 39 __ LDX #$39
4673 : 20 d2 72 JSR $72d2 ; (freg + 4)
4676 : 20 19 73 JSR $7319 ; (faddsub + 6)
4679 : a5 2a __ LDA ACCU + 1 
467b : 85 24 __ STA P9 ; (f + 1)
467d : a5 2b __ LDA ACCU + 2 
467f : 85 25 __ STA P10 ; (f + 2)
4681 : a6 29 __ LDX ACCU + 0 
4683 : a5 2c __ LDA ACCU + 3 
4685 : 85 26 __ STA P11 ; (f + 3)
4687 : 10 03 __ BPL $468c ; (nformf.s57 + 0)
4689 : 4c 97 44 JMP $4497 ; (nformf.s18 + 0)
.s57:
468c : c9 41 __ CMP #$41
468e : d0 0d __ BNE $469d ; (nformf.s61 + 0)
.s58:
4690 : a5 25 __ LDA P10 ; (f + 2)
4692 : c9 20 __ CMP #$20
4694 : d0 07 __ BNE $469d ; (nformf.s61 + 0)
.s59:
4696 : a5 24 __ LDA P9 ; (f + 1)
4698 : d0 03 __ BNE $469d ; (nformf.s61 + 0)
.s60:
469a : 8a __ __ TXA
469b : f0 02 __ BEQ $469f ; (nformf.s56 + 0)
.s61:
469d : 90 ea __ BCC $4689 ; (nformf.s55 + 42)
.s56:
469f : a9 00 __ LDA #$00
46a1 : 85 11 __ STA WORK + 0 
46a3 : 85 12 __ STA WORK + 1 
46a5 : a9 20 __ LDA #$20
46a7 : 85 13 __ STA WORK + 2 
46a9 : a9 41 __ LDA #$41
46ab : 85 14 __ STA WORK + 3 
46ad : 20 e2 72 JSR $72e2 ; (freg + 20)
46b0 : 20 c8 74 JSR $74c8 ; (crt_fdiv + 0)
46b3 : a5 2a __ LDA ACCU + 1 
46b5 : 85 24 __ STA P9 ; (f + 1)
46b7 : a5 2b __ LDA ACCU + 2 
46b9 : 85 25 __ STA P10 ; (f + 2)
46bb : a5 2c __ LDA ACCU + 3 
46bd : 85 26 __ STA P11 ; (f + 3)
46bf : a6 29 __ LDX ACCU + 0 
46c1 : e6 41 __ INC T4 + 0 
46c3 : d0 c4 __ BNE $4689 ; (nformf.s55 + 42)
.s117:
46c5 : e6 42 __ INC T4 + 1 
46c7 : 4c 97 44 JMP $4497 ; (nformf.s18 + 0)
.s102:
46ca : 86 35 __ STX T0 + 0 
46cc : 85 39 __ STA T1 + 0 
46ce : a0 03 __ LDY #$03
46d0 : b1 1f __ LDA (P4),y ; (si + 0)
46d2 : 18 __ __ CLC
46d3 : 69 08 __ ADC #$08
46d5 : a4 35 __ LDY T0 + 0 
46d7 : 91 21 __ STA (P6),y ; (str + 0)
46d9 : 18 __ __ CLC
46da : a0 03 __ LDY #$03
46dc : b1 1f __ LDA (P4),y ; (si + 0)
46de : 69 0d __ ADC #$0d
46e0 : a4 35 __ LDY T0 + 0 
46e2 : c8 __ __ INY
46e3 : 91 21 __ STA (P6),y ; (str + 0)
46e5 : a0 03 __ LDY #$03
46e7 : b1 1f __ LDA (P4),y ; (si + 0)
46e9 : 18 __ __ CLC
46ea : 69 05 __ ADC #$05
46ec : a4 39 __ LDY T1 + 0 
46ee : 91 21 __ STA (P6),y ; (str + 0)
46f0 : 18 __ __ CLC
46f1 : a5 46 __ LDA T9 + 0 
46f3 : 69 03 __ ADC #$03
46f5 : 85 46 __ STA T9 + 0 
46f7 : 4c a9 45 JMP $45a9 ; (nformf.s27 + 0)
.s104:
46fa : 20 0b 47 JSR $470b ; (isinf.s4 + 0)
46fd : a2 01 __ LDX #$01
46ff : 86 46 __ STX T9 + 0 
4701 : a8 __ __ TAY
4702 : d0 03 __ BNE $4707 ; (nformf.s105 + 0)
4704 : 4c 1e 42 JMP $421e ; (nformf.s7 + 0)
.s105:
4707 : a9 03 __ LDA #$03
4709 : d0 bf __ BNE $46ca ; (nformf.s102 + 0)
--------------------------------------------------------------------
isinf: ; isinf(float)->bool
;  26, "/mnt/d/F256/oscar64/include/math.h"
.s4:
470b : 06 1d __ ASL P2 ; (f + 2)
470d : a5 1e __ LDA P3 ; (f + 3)
470f : 2a __ __ ROL
4710 : c9 ff __ CMP #$ff
4712 : d0 03 __ BNE $4717 ; (isinf.s6 + 0)
.s5:
4714 : a9 01 __ LDA #$01
4716 : 60 __ __ RTS
.s6:
4717 : a9 00 __ LDA #$00
.s3:
4719 : 60 __ __ RTS
--------------------------------------------------------------------
471a : __ __ __ BYT 0a 00                                           : ..
--------------------------------------------------------------------
471c : __ __ __ BYT 25 63 25 73 25 73 00                            : %c%s%s.
--------------------------------------------------------------------
4723 : __ __ __ BYT 25 63 00                                        : %c.
--------------------------------------------------------------------
4726 : __ __ __ BYT 25 2e 37 35 73 25 73 00                         : %.75s%s.
--------------------------------------------------------------------
472e : __ __ __ BYT 25 63 20 25 63 00                               : %c %c.
--------------------------------------------------------------------
4734 : __ __ __ BYT 66 74 70 3e 20 00                               : ftp> .
--------------------------------------------------------------------
read_line: ; read_line(u8*,u8)->void
;1349, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s1:
473a : a2 09 __ LDX #$09
473c : b5 55 __ LDA T1 + 0,x ; (buf + 1)
473e : 9d cf 9d STA $9dcf,x ; (read_line@stack + 0)
4741 : ca __ __ DEX
4742 : 10 f8 __ BPL $473c ; (read_line.s1 + 2)
.s4:
4744 : a9 00 __ LDA #$00
4746 : 85 5c __ STA T5 + 0 
4748 : 85 5d __ STA T6 + 0 
474a : 85 5e __ STA T7 + 0 
474c : ad e2 d6 LDA $d6e2 
474f : 85 58 __ STA T3 + 0 
4751 : ad e3 d6 LDA $d6e3 
4754 : 85 59 __ STA T3 + 1 
4756 : ad e4 d6 LDA $d6e4 
4759 : 85 5a __ STA T4 + 0 
475b : ad e5 d6 LDA $d6e5 
475e : 85 5b __ STA T4 + 1 
.l5:
4760 : 20 b5 19 JSR $19b5 ; (kernelNextEvent.s4 + 0)
4763 : ad 66 7a LDA $7a66 ; (kernelEventData.type + 0)
4766 : c9 0c __ CMP #$0c
4768 : d0 03 __ BNE $476d ; (read_line.s6 + 0)
476a : 4c 64 48 JMP $4864 ; (read_line.s24 + 0)
.s6:
476d : c9 0e __ CMP #$0e
476f : f0 ef __ BEQ $4760 ; (read_line.l5 + 0)
.s7:
4771 : c9 08 __ CMP #$08
4773 : d0 eb __ BNE $4760 ; (read_line.l5 + 0)
.s8:
4775 : ad 6a 7a LDA $7a6a ; (kernelEventData.u + 1)
4778 : f0 04 __ BEQ $477e ; (read_line.s9 + 0)
.s10:
477a : c9 01 __ CMP #$01
477c : d0 05 __ BNE $4783 ; (read_line.s11 + 0)
.s9:
477e : a9 01 __ LDA #$01
4780 : 4c 31 48 JMP $4831 ; (read_line.s85 + 0)
.s11:
4783 : c9 ff __ CMP #$ff
4785 : d0 0a __ BNE $4791 ; (read_line.s12 + 0)
.s23:
4787 : a9 01 __ LDA #$01
4789 : 85 1d __ STA P2 
478b : 20 2c 19 JSR $192c ; (lilpause.s4 + 0)
478e : 4c 60 47 JMP $4760 ; (read_line.l5 + 0)
.s12:
4791 : c9 94 __ CMP #$94
4793 : d0 03 __ BNE $4798 ; (read_line.s13 + 0)
4795 : 4c 36 48 JMP $4836 ; (read_line.s22 + 0)
.s13:
4798 : c9 92 __ CMP #$92
479a : d0 49 __ BNE $47e5 ; (read_line.s14 + 0)
.s20:
479c : a9 00 __ LDA #$00
479e : 85 5e __ STA T7 + 0 
47a0 : a5 5c __ LDA T5 + 0 
47a2 : f0 bc __ BEQ $4760 ; (read_line.l5 + 0)
.s21:
47a4 : a9 45 __ LDA #$45
47a6 : 85 1b __ STA P0 
47a8 : a9 9e __ LDA #$9e
47aa : 85 1e __ STA P3 
47ac : a9 9e __ LDA #$9e
47ae : 85 1c __ STA P1 
47b0 : a9 44 __ LDA #$44
47b2 : 85 1d __ STA P2 
47b4 : 20 39 18 JSR $1839 ; (textGetXY.s4 + 0)
47b7 : ad 45 9e LDA $9e45 ; (lx + 0)
47ba : 85 1b __ STA P0 
47bc : c6 1b __ DEC P0 
47be : ad 44 9e LDA $9e44 ; (ly + 0)
47c1 : 85 1c __ STA P1 
47c3 : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
47c6 : a9 74 __ LDA #$74
47c8 : 85 23 __ STA P8 
47ca : a9 17 __ LDA #$17
47cc : 85 24 __ STA P9 
47ce : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
47d1 : ad 45 9e LDA $9e45 ; (lx + 0)
47d4 : 85 1b __ STA P0 
47d6 : c6 1b __ DEC P0 
47d8 : ad 44 9e LDA $9e44 ; (ly + 0)
47db : 85 1c __ STA P1 
47dd : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
47e0 : c6 5c __ DEC T5 + 0 
47e2 : 4c 60 47 JMP $4760 ; (read_line.l5 + 0)
.s14:
47e5 : 85 57 __ STA T2 + 0 
47e7 : ad fb 9f LDA $9ffb ; (sstack + 47)
47ea : 38 __ __ SEC
47eb : e9 01 __ SBC #$01
47ed : 90 f3 __ BCC $47e2 ; (read_line.s21 + 62)
.s19:
47ef : c5 5c __ CMP T5 + 0 
47f1 : 90 ef __ BCC $47e2 ; (read_line.s21 + 62)
.s101:
47f3 : f0 ed __ BEQ $47e2 ; (read_line.s21 + 62)
.s15:
47f5 : ad f9 9f LDA $9ff9 ; (sstack + 45)
47f8 : 85 55 __ STA T1 + 0 ; (buf + 1)
47fa : ad fa 9f LDA $9ffa ; (sstack + 46)
47fd : 85 56 __ STA T1 + 1 ; (maxlen + 0)
47ff : a4 5c __ LDY T5 + 0 
4801 : a5 5e __ LDA T7 + 0 
4803 : f0 0a __ BEQ $480f ; (read_line.s16 + 0)
.s18:
4805 : a5 57 __ LDA T2 + 0 
4807 : e9 20 __ SBC #$20
4809 : 91 55 __ STA (T1 + 0),y ; (buf + 1)
480b : a9 20 __ LDA #$20
480d : d0 06 __ BNE $4815 ; (read_line.s17 + 0)
.s16:
480f : a5 57 __ LDA T2 + 0 
4811 : 91 55 __ STA (T1 + 0),y ; (buf + 1)
4813 : a9 00 __ LDA #$00
.s17:
4815 : 49 ff __ EOR #$ff
4817 : 38 __ __ SEC
4818 : 65 57 __ ADC T2 + 0 
481a : 8d dc 9d STA $9ddc ; (s[0] + 0)
481d : a9 00 __ LDA #$00
481f : 8d dd 9d STA $9ddd ; (s[0] + 1)
4822 : a9 dc __ LDA #$dc
4824 : 85 23 __ STA P8 
4826 : a9 9d __ LDA #$9d
4828 : 85 24 __ STA P9 
482a : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
482d : e6 5c __ INC T5 + 0 
482f : a9 00 __ LDA #$00
.s85:
4831 : 85 5e __ STA T7 + 0 
4833 : 4c 60 47 JMP $4760 ; (read_line.l5 + 0)
.s22:
4836 : a9 4f __ LDA #$4f
4838 : 85 26 __ STA P11 
483a : a9 2c __ LDA #$2c
483c : 8d cc 9f STA $9fcc ; (sstack + 0)
483f : a9 3a __ LDA #$3a
4841 : 8d cd 9f STA $9fcd ; (sstack + 1)
4844 : ad f9 9f LDA $9ff9 ; (sstack + 45)
4847 : 85 55 __ STA T1 + 0 ; (buf + 1)
4849 : ad fa 9f LDA $9ffa ; (sstack + 46)
484c : 85 56 __ STA T1 + 1 ; (maxlen + 0)
484e : a9 00 __ LDA #$00
4850 : 85 25 __ STA P10 
4852 : a4 5c __ LDY T5 + 0 
4854 : 91 55 __ STA (T1 + 0),y ; (buf + 1)
4856 : 20 bb 17 JSR $17bb ; (textPrintNewLine.s4 + 0)
.s3:
4859 : a2 09 __ LDX #$09
485b : bd cf 9d LDA $9dcf,x ; (read_line@stack + 0)
485e : 95 55 __ STA T1 + 0,x ; (buf + 1)
4860 : ca __ __ DEX
4861 : 10 f8 __ BPL $485b ; (read_line.s3 + 2)
4863 : 60 __ __ RTS
.s24:
4864 : ad 6a 7a LDA $7a6a ; (kernelEventData.u + 1)
4867 : 85 29 __ STA ACCU + 0 
4869 : 29 80 __ AND #$80
486b : 10 02 __ BPL $486f ; (read_line.s24 + 11)
486d : a9 ff __ LDA #$ff
486f : 85 2a __ STA ACCU + 1 
4871 : a5 29 __ LDA ACCU + 0 
4873 : 10 04 __ BPL $4879 ; (read_line.s25 + 0)
.s84:
4875 : a9 00 __ LDA #$00
4877 : e5 29 __ SBC ACCU + 0 
.s25:
4879 : c9 15 __ CMP #$15
487b : 90 1f __ BCC $489c ; (read_line.s26 + 0)
.s83:
487d : a5 2a __ LDA ACCU + 1 
487f : 0a __ __ ASL
4880 : a5 29 __ LDA ACCU + 0 
4882 : 69 00 __ ADC #$00
4884 : 85 55 __ STA T1 + 0 ; (buf + 1)
4886 : a5 2a __ LDA ACCU + 1 
4888 : 69 00 __ ADC #$00
488a : c9 80 __ CMP #$80
488c : 6a __ __ ROR
488d : 66 55 __ ROR T1 + 0 ; (buf + 1)
488f : aa __ __ TAX
4890 : 18 __ __ CLC
4891 : a5 55 __ LDA T1 + 0 ; (buf + 1)
4893 : 65 29 __ ADC ACCU + 0 
4895 : 85 29 __ STA ACCU + 0 
4897 : 8a __ __ TXA
4898 : 65 2a __ ADC ACCU + 1 
489a : 85 2a __ STA ACCU + 1 
.s26:
489c : ad 69 7a LDA $7a69 ; (kernelEventData.u + 0)
489f : 85 55 __ STA T1 + 0 ; (buf + 1)
48a1 : 29 80 __ AND #$80
48a3 : 10 02 __ BPL $48a7 ; (read_line.s26 + 11)
48a5 : a9 ff __ LDA #$ff
48a7 : 85 56 __ STA T1 + 1 ; (maxlen + 0)
48a9 : a5 55 __ LDA T1 + 0 ; (buf + 1)
48ab : 10 05 __ BPL $48b2 ; (read_line.s27 + 0)
.s82:
48ad : 38 __ __ SEC
48ae : a9 00 __ LDA #$00
48b0 : e5 55 __ SBC T1 + 0 ; (buf + 1)
.s27:
48b2 : c9 15 __ CMP #$15
48b4 : 90 1f __ BCC $48d5 ; (read_line.s28 + 0)
.s81:
48b6 : a5 56 __ LDA T1 + 1 ; (maxlen + 0)
48b8 : 0a __ __ ASL
48b9 : a5 55 __ LDA T1 + 0 ; (buf + 1)
48bb : 69 00 __ ADC #$00
48bd : 85 57 __ STA T2 + 0 
48bf : a5 56 __ LDA T1 + 1 ; (maxlen + 0)
48c1 : 69 00 __ ADC #$00
48c3 : c9 80 __ CMP #$80
48c5 : 6a __ __ ROR
48c6 : 66 57 __ ROR T2 + 0 
48c8 : aa __ __ TAX
48c9 : 18 __ __ CLC
48ca : a5 57 __ LDA T2 + 0 
48cc : 65 55 __ ADC T1 + 0 ; (buf + 1)
48ce : 85 55 __ STA T1 + 0 ; (buf + 1)
48d0 : 8a __ __ TXA
48d1 : 65 56 __ ADC T1 + 1 ; (maxlen + 0)
48d3 : 85 56 __ STA T1 + 1 ; (maxlen + 0)
.s28:
48d5 : 18 __ __ CLC
48d6 : a5 29 __ LDA ACCU + 0 
48d8 : 65 5a __ ADC T4 + 0 
48da : 85 5a __ STA T4 + 0 
48dc : a5 2a __ LDA ACCU + 1 
48de : 65 5b __ ADC T4 + 1 
48e0 : 85 5b __ STA T4 + 1 
48e2 : 18 __ __ CLC
48e3 : a5 55 __ LDA T1 + 0 ; (buf + 1)
48e5 : 65 58 __ ADC T3 + 0 
48e7 : 85 58 __ STA T3 + 0 
48e9 : a5 56 __ LDA T1 + 1 ; (maxlen + 0)
48eb : 65 59 __ ADC T3 + 1 
48ed : 10 09 __ BPL $48f8 ; (read_line.s29 + 0)
.s80:
48ef : a9 00 __ LDA #$00
48f1 : 85 58 __ STA T3 + 0 
.s86:
48f3 : 85 59 __ STA T3 + 1 
48f5 : 4c 12 49 JMP $4912 ; (read_line.s30 + 0)
.s29:
48f8 : 85 59 __ STA T3 + 1 
48fa : a9 02 __ LDA #$02
48fc : c5 59 __ CMP T3 + 1 
48fe : f0 04 __ BEQ $4904 ; (read_line.s78 + 0)
.s79:
4900 : 90 08 __ BCC $490a ; (read_line.s77 + 0)
4902 : b0 0e __ BCS $4912 ; (read_line.s30 + 0)
.s78:
4904 : a5 58 __ LDA T3 + 0 
4906 : c9 71 __ CMP #$71
4908 : 90 08 __ BCC $4912 ; (read_line.s30 + 0)
.s77:
490a : a9 70 __ LDA #$70
490c : 85 58 __ STA T3 + 0 
490e : a9 02 __ LDA #$02
4910 : 85 59 __ STA T3 + 1 
.s30:
4912 : 24 5b __ BIT T4 + 1 
4914 : 10 09 __ BPL $491f ; (read_line.s31 + 0)
.s76:
4916 : a9 00 __ LDA #$00
4918 : 85 5a __ STA T4 + 0 
.s87:
491a : 85 5b __ STA T4 + 1 
491c : 4c 37 49 JMP $4937 ; (read_line.s32 + 0)
.s31:
491f : a9 01 __ LDA #$01
4921 : c5 5b __ CMP T4 + 1 
4923 : f0 04 __ BEQ $4929 ; (read_line.s74 + 0)
.s75:
4925 : 90 08 __ BCC $492f ; (read_line.s73 + 0)
4927 : b0 0e __ BCS $4937 ; (read_line.s32 + 0)
.s74:
4929 : a5 5a __ LDA T4 + 0 
492b : c9 d1 __ CMP #$d1
492d : 90 08 __ BCC $4937 ; (read_line.s32 + 0)
.s73:
492f : a9 d0 __ LDA #$d0
4931 : 85 5a __ STA T4 + 0 
4933 : a9 01 __ LDA #$01
4935 : 85 5b __ STA T4 + 1 
.s32:
4937 : a5 58 __ LDA T3 + 0 
4939 : 8d e2 d6 STA $d6e2 
493c : a5 59 __ LDA T3 + 1 
493e : 8d e3 d6 STA $d6e3 
4941 : a5 5a __ LDA T4 + 0 
4943 : 8d e4 d6 STA $d6e4 
4946 : a5 5b __ LDA T4 + 1 
4948 : 8d e5 d6 STA $d6e5 
494b : 20 cd 4b JSR $4bcd ; (mouseInWhere.s4 + 0)
494e : 85 57 __ STA T2 + 0 
4950 : ad 6c 7a LDA $7a6c ; (kernelEventData.u + 3)
4953 : 4a __ __ LSR
4954 : b0 0a __ BCS $4960 ; (read_line.s67 + 0)
.s33:
4956 : ad 6c 7a LDA $7a6c ; (kernelEventData.u + 3)
4959 : 29 02 __ AND #$02
495b : d0 03 __ BNE $4960 ; (read_line.s67 + 0)
.s34:
495d : aa __ __ TAX
495e : 90 17 __ BCC $4977 ; (read_line.s35 + 0)
.s67:
4960 : a2 01 __ LDX #$01
4962 : ad 58 7a LDA $7a58 ; (isFileTrailing + 0)
4965 : d0 15 __ BNE $497c ; (read_line.s58 + 0)
.s68:
4967 : a5 57 __ LDA T2 + 0 
4969 : c9 01 __ CMP #$01
496b : d0 03 __ BNE $4970 ; (read_line.s69 + 0)
496d : 4c 8e 4b JMP $4b8e ; (read_line.s71 + 0)
.s69:
4970 : c9 02 __ CMP #$02
4972 : d0 03 __ BNE $4977 ; (read_line.s35 + 0)
4974 : 4c 52 4b JMP $4b52 ; (read_line.s70 + 0)
.s35:
4977 : ad 58 7a LDA $7a58 ; (isFileTrailing + 0)
497a : f0 19 __ BEQ $4995 ; (read_line.s36 + 0)
.s58:
497c : 8a __ __ TXA
497d : f0 03 __ BEQ $4982 ; (read_line.s59 + 0)
497f : 4c 18 4b JMP $4b18 ; (read_line.s65 + 0)
.s59:
4982 : 85 1b __ STA P0 
4984 : 85 1c __ STA P1 
4986 : 8d 58 7a STA $7a58 ; (isFileTrailing + 0)
4989 : 20 45 07 JSR $0745 ; (spriteSetVisible.s4 + 0)
498c : a5 57 __ LDA T2 + 0 
498e : c9 02 __ CMP #$02
4990 : d0 03 __ BNE $4995 ; (read_line.s36 + 0)
4992 : 4c bc 4a JMP $4abc ; (read_line.s60 + 0)
.s36:
4995 : a6 57 __ LDX T2 + 0 
4997 : ca __ __ DEX
4998 : d0 03 __ BNE $499d ; (read_line.s37 + 0)
499a : 4c 4c 4a JMP $4a4c ; (read_line.s51 + 0)
.s37:
499d : a5 57 __ LDA T2 + 0 
499f : c9 02 __ CMP #$02
49a1 : d0 67 __ BNE $4a0a ; (read_line.s38 + 0)
.s45:
49a3 : ad 58 7a LDA $7a58 ; (isFileTrailing + 0)
49a6 : d0 62 __ BNE $4a0a ; (read_line.s38 + 0)
.s46:
49a8 : ae fe 79 LDX $79fe ; (oldHighlight + 0)
49ab : e8 __ __ INX
49ac : f0 19 __ BEQ $49c7 ; (read_line.s47 + 0)
.s50:
49ae : ad fe 79 LDA $79fe ; (oldHighlight + 0)
49b1 : 85 1f __ STA P4 
49b3 : a9 0f __ LDA #$0f
49b5 : 85 1d __ STA P2 
49b7 : a9 00 __ LDA #$00
49b9 : 85 1e __ STA P3 
49bb : a9 02 __ LDA #$02
49bd : 85 20 __ STA P5 
49bf : 20 cb 5a JSR $5acb ; (forceFileHighlight.s4 + 0)
49c2 : a9 ff __ LDA #$ff
49c4 : 8d fe 79 STA $79fe ; (oldHighlight + 0)
.s47:
49c7 : a9 de __ LDA #$de
49c9 : 85 1b __ STA P0 
49cb : a9 02 __ LDA #$02
49cd : 85 1d __ STA P2 
49cf : a9 9d __ LDA #$9d
49d1 : 85 1c __ STA P1 
49d3 : 20 35 5b JSR $5b35 ; (rowFromMouse.s4 + 0)
49d6 : aa __ __ TAX
49d7 : f0 31 __ BEQ $4a0a ; (read_line.s38 + 0)
.s48:
49d9 : ad ff 79 LDA $79ff ; (oldHighlightLocal + 0)
49dc : cd de 9d CMP $9dde ; (newHighlight + 0)
49df : f0 29 __ BEQ $4a0a ; (read_line.s38 + 0)
.s49:
49e1 : 85 57 __ STA T2 + 0 
49e3 : ad de 9d LDA $9dde ; (newHighlight + 0)
49e6 : 85 1f __ STA P4 
49e8 : a9 0d __ LDA #$0d
49ea : 85 1d __ STA P2 
49ec : a9 01 __ LDA #$01
49ee : 85 1e __ STA P3 
49f0 : a9 02 __ LDA #$02
49f2 : 85 20 __ STA P5 
49f4 : 20 cb 5a JSR $5acb ; (forceFileHighlight.s4 + 0)
49f7 : c6 1e __ DEC P3 
49f9 : a9 0f __ LDA #$0f
49fb : 85 1d __ STA P2 
49fd : a5 57 __ LDA T2 + 0 
49ff : 85 1f __ STA P4 
4a01 : 20 cb 5a JSR $5acb ; (forceFileHighlight.s4 + 0)
4a04 : ad de 9d LDA $9dde ; (newHighlight + 0)
4a07 : 8d ff 79 STA $79ff ; (oldHighlightLocal + 0)
.s38:
4a0a : ad fe 79 LDA $79fe ; (oldHighlight + 0)
.s39:
4a0d : c9 ff __ CMP #$ff
4a0f : f0 16 __ BEQ $4a27 ; (read_line.s40 + 0)
.s43:
4a11 : 85 1f __ STA P4 
4a13 : ad 59 7a LDA $7a59 ; (isRemoteListed + 0)
4a16 : f0 0f __ BEQ $4a27 ; (read_line.s40 + 0)
.s44:
4a18 : a9 0f __ LDA #$0f
4a1a : 85 1d __ STA P2 
4a1c : a9 01 __ LDA #$01
4a1e : 85 20 __ STA P5 
4a20 : a9 00 __ LDA #$00
4a22 : 85 1e __ STA P3 
4a24 : 20 cb 5a JSR $5acb ; (forceFileHighlight.s4 + 0)
.s40:
4a27 : ae ff 79 LDX $79ff ; (oldHighlightLocal + 0)
4a2a : e8 __ __ INX
4a2b : f0 14 __ BEQ $4a41 ; (read_line.s41 + 0)
.s42:
4a2d : ad ff 79 LDA $79ff ; (oldHighlightLocal + 0)
4a30 : 85 1f __ STA P4 
4a32 : a9 0f __ LDA #$0f
4a34 : 85 1d __ STA P2 
4a36 : a9 00 __ LDA #$00
4a38 : 85 1e __ STA P3 
4a3a : a9 01 __ LDA #$01
4a3c : 85 20 __ STA P5 
4a3e : 20 cb 5a JSR $5acb ; (forceFileHighlight.s4 + 0)
.s41:
4a41 : a9 ff __ LDA #$ff
4a43 : 8d ff 79 STA $79ff ; (oldHighlightLocal + 0)
4a46 : 8d fe 79 STA $79fe ; (oldHighlight + 0)
4a49 : 4c 60 47 JMP $4760 ; (read_line.l5 + 0)
.s51:
4a4c : ad 59 7a LDA $7a59 ; (isRemoteListed + 0)
4a4f : f0 b9 __ BEQ $4a0a ; (read_line.s38 + 0)
.s52:
4a51 : ad 58 7a LDA $7a58 ; (isFileTrailing + 0)
4a54 : d0 b4 __ BNE $4a0a ; (read_line.s38 + 0)
.s53:
4a56 : ae ff 79 LDX $79ff ; (oldHighlightLocal + 0)
4a59 : e8 __ __ INX
4a5a : f0 19 __ BEQ $4a75 ; (read_line.s54 + 0)
.s57:
4a5c : ad ff 79 LDA $79ff ; (oldHighlightLocal + 0)
4a5f : 85 1f __ STA P4 
4a61 : a9 0f __ LDA #$0f
4a63 : 85 1d __ STA P2 
4a65 : a9 00 __ LDA #$00
4a67 : 85 1e __ STA P3 
4a69 : a9 02 __ LDA #$02
4a6b : 85 20 __ STA P5 
4a6d : 20 cb 5a JSR $5acb ; (forceFileHighlight.s4 + 0)
4a70 : a9 ff __ LDA #$ff
4a72 : 8d ff 79 STA $79ff ; (oldHighlightLocal + 0)
.s54:
4a75 : a9 df __ LDA #$df
4a77 : 85 1b __ STA P0 
4a79 : a9 01 __ LDA #$01
4a7b : 85 1d __ STA P2 
4a7d : a9 9d __ LDA #$9d
4a7f : 85 1c __ STA P1 
4a81 : 20 35 5b JSR $5b35 ; (rowFromMouse.s4 + 0)
4a84 : aa __ __ TAX
4a85 : f0 83 __ BEQ $4a0a ; (read_line.s38 + 0)
.s55:
4a87 : ad fe 79 LDA $79fe ; (oldHighlight + 0)
4a8a : cd df 9d CMP $9ddf ; (newHighlight + 0)
4a8d : d0 03 __ BNE $4a92 ; (read_line.s56 + 0)
4a8f : 4c 0a 4a JMP $4a0a ; (read_line.s38 + 0)
.s56:
4a92 : 85 57 __ STA T2 + 0 
4a94 : ad df 9d LDA $9ddf ; (newHighlight + 0)
4a97 : 85 1f __ STA P4 
4a99 : a9 0d __ LDA #$0d
4a9b : 85 1d __ STA P2 
4a9d : a9 01 __ LDA #$01
4a9f : 85 1e __ STA P3 
4aa1 : 85 20 __ STA P5 
4aa3 : 20 cb 5a JSR $5acb ; (forceFileHighlight.s4 + 0)
4aa6 : c6 1e __ DEC P3 
4aa8 : a9 0f __ LDA #$0f
4aaa : 85 1d __ STA P2 
4aac : a5 57 __ LDA T2 + 0 
4aae : 85 1f __ STA P4 
4ab0 : 20 cb 5a JSR $5acb ; (forceFileHighlight.s4 + 0)
4ab3 : ad df 9d LDA $9ddf ; (newHighlight + 0)
4ab6 : 8d fe 79 STA $79fe ; (oldHighlight + 0)
4ab9 : 4c 0d 4a JMP $4a0d ; (read_line.s39 + 0)
.s60:
4abc : ad fe 79 LDA $79fe ; (oldHighlight + 0)
4abf : c9 ff __ CMP #$ff
4ac1 : d0 03 __ BNE $4ac6 ; (read_line.s61 + 0)
4ac3 : 4c 9d 49 JMP $499d ; (read_line.s37 + 0)
.s61:
4ac6 : 85 29 __ STA ACCU + 0 
4ac8 : a9 00 __ LDA #$00
4aca : 85 2a __ STA ACCU + 1 
4acc : a9 1d __ LDA #$1d
4ace : 20 60 72 JSR $7260 ; (mul16by8 + 0)
4ad1 : 18 __ __ CLC
4ad2 : a9 16 __ LDA #$16
4ad4 : 65 29 __ ADC ACCU + 0 
4ad6 : 85 55 __ STA T1 + 0 ; (buf + 1)
4ad8 : 85 1b __ STA P0 
4ada : a9 7d __ LDA #$7d
4adc : 65 2a __ ADC ACCU + 1 
4ade : 85 56 __ STA T1 + 1 ; (maxlen + 0)
4ae0 : 85 1c __ STA P1 
4ae2 : a9 50 __ LDA #$50
4ae4 : 85 1d __ STA P2 
4ae6 : a9 4c __ LDA #$4c
4ae8 : 85 1e __ STA P3 
4aea : 20 c3 1d JSR $1dc3 ; (strcmp.s4 + 0)
4aed : aa __ __ TAX
4aee : f0 d3 __ BEQ $4ac3 ; (read_line.s60 + 7)
.s62:
4af0 : a5 55 __ LDA T1 + 0 ; (buf + 1)
4af2 : 8d f5 9f STA $9ff5 ; (sstack + 41)
4af5 : a5 56 __ LDA T1 + 1 ; (maxlen + 0)
4af7 : 8d f6 9f STA $9ff6 ; (sstack + 42)
4afa : a9 e0 __ LDA #$e0
4afc : 8d f7 9f STA $9ff7 ; (sstack + 43)
4aff : a9 9d __ LDA #$9d
4b01 : 8d f8 9f STA $9ff8 ; (sstack + 44)
4b04 : a0 ff __ LDY #$ff
.l63:
4b06 : c8 __ __ INY
4b07 : b1 55 __ LDA (T1 + 0),y ; (buf + 1)
4b09 : 99 e0 9d STA $9de0,y ; (finalName[0] + 0)
4b0c : d0 f8 __ BNE $4b06 ; (read_line.l63 + 0)
.s64:
4b0e : 20 52 4c JSR $4c52 ; (ftp_retr.s1 + 0)
4b11 : a9 00 __ LDA #$00
4b13 : 85 5d __ STA T6 + 0 
4b15 : 4c 9d 49 JMP $499d ; (read_line.s37 + 0)
.s65:
4b18 : a5 5d __ LDA T6 + 0 
4b1a : d0 03 __ BNE $4b1f ; (read_line.s66 + 0)
4b1c : 4c 95 49 JMP $4995 ; (read_line.s36 + 0)
.s66:
4b1f : a5 59 __ LDA T3 + 1 
4b21 : 4a __ __ LSR
4b22 : aa __ __ TAX
4b23 : a9 00 __ LDA #$00
4b25 : 85 1b __ STA P0 
4b27 : a5 58 __ LDA T3 + 0 
4b29 : 6a __ __ ROR
4b2a : 18 __ __ CLC
4b2b : 69 18 __ ADC #$18
4b2d : 85 1c __ STA P1 
4b2f : 90 01 __ BCC $4b32 ; (read_line.s90 + 0)
.s89:
4b31 : e8 __ __ INX
.s90:
4b32 : 86 1d __ STX P2 
4b34 : a5 5b __ LDA T4 + 1 
4b36 : 4a __ __ LSR
4b37 : aa __ __ TAX
4b38 : a5 5a __ LDA T4 + 0 
4b3a : 6a __ __ ROR
4b3b : 18 __ __ CLC
4b3c : 69 1c __ ADC #$1c
4b3e : 85 1e __ STA P3 
4b40 : 90 01 __ BCC $4b43 ; (read_line.s92 + 0)
.s91:
4b42 : e8 __ __ INX
.s92:
4b43 : 86 1f __ STX P4 
4b45 : 20 7c 14 JSR $147c ; (spriteSetPosition.s4 + 0)
4b48 : a9 01 __ LDA #$01
4b4a : 85 1c __ STA P1 
4b4c : 20 45 07 JSR $0745 ; (spriteSetVisible.s4 + 0)
4b4f : 4c 95 49 JMP $4995 ; (read_line.s36 + 0)
.s70:
4b52 : 8e 58 7a STX $7a58 ; (isFileTrailing + 0)
4b55 : a5 59 __ LDA T3 + 1 
4b57 : 4a __ __ LSR
4b58 : aa __ __ TAX
4b59 : a9 00 __ LDA #$00
4b5b : 85 1b __ STA P0 
4b5d : a5 58 __ LDA T3 + 0 
4b5f : 6a __ __ ROR
4b60 : 18 __ __ CLC
4b61 : 69 18 __ ADC #$18
4b63 : 85 1c __ STA P1 
4b65 : 90 01 __ BCC $4b68 ; (read_line.s98 + 0)
.s97:
4b67 : e8 __ __ INX
.s98:
4b68 : 86 1d __ STX P2 
4b6a : a5 5b __ LDA T4 + 1 
4b6c : 4a __ __ LSR
4b6d : aa __ __ TAX
4b6e : a5 5a __ LDA T4 + 0 
4b70 : 6a __ __ ROR
4b71 : 18 __ __ CLC
4b72 : 69 1c __ ADC #$1c
4b74 : 85 1e __ STA P3 
4b76 : 90 01 __ BCC $4b79 ; (read_line.s100 + 0)
.s99:
4b78 : e8 __ __ INX
.s100:
4b79 : 86 1f __ STX P4 
4b7b : 20 7c 14 JSR $147c ; (spriteSetPosition.s4 + 0)
4b7e : a9 01 __ LDA #$01
4b80 : 85 1c __ STA P1 
4b82 : 20 45 07 JSR $0745 ; (spriteSetVisible.s4 + 0)
4b85 : a9 02 __ LDA #$02
4b87 : 85 57 __ STA T2 + 0 
.s88:
4b89 : 85 5d __ STA T6 + 0 
4b8b : 4c 1f 4b JMP $4b1f ; (read_line.s66 + 0)
.s71:
4b8e : ad 59 7a LDA $7a59 ; (isRemoteListed + 0)
4b91 : d0 03 __ BNE $4b96 ; (read_line.s72 + 0)
4b93 : 4c 77 49 JMP $4977 ; (read_line.s35 + 0)
.s72:
4b96 : 8e 58 7a STX $7a58 ; (isFileTrailing + 0)
4b99 : a5 59 __ LDA T3 + 1 
4b9b : 4a __ __ LSR
4b9c : aa __ __ TAX
4b9d : a9 00 __ LDA #$00
4b9f : 85 1b __ STA P0 
4ba1 : a5 58 __ LDA T3 + 0 
4ba3 : 6a __ __ ROR
4ba4 : 18 __ __ CLC
4ba5 : 69 18 __ ADC #$18
4ba7 : 85 1c __ STA P1 
4ba9 : 90 01 __ BCC $4bac ; (read_line.s94 + 0)
.s93:
4bab : e8 __ __ INX
.s94:
4bac : 86 1d __ STX P2 
4bae : a5 5b __ LDA T4 + 1 
4bb0 : 4a __ __ LSR
4bb1 : aa __ __ TAX
4bb2 : a5 5a __ LDA T4 + 0 
4bb4 : 6a __ __ ROR
4bb5 : 18 __ __ CLC
4bb6 : 69 1c __ ADC #$1c
4bb8 : 85 1e __ STA P3 
4bba : 90 01 __ BCC $4bbd ; (read_line.s96 + 0)
.s95:
4bbc : e8 __ __ INX
.s96:
4bbd : 86 1f __ STX P4 
4bbf : 20 7c 14 JSR $147c ; (spriteSetPosition.s4 + 0)
4bc2 : a9 01 __ LDA #$01
4bc4 : 85 1c __ STA P1 
4bc6 : 20 45 07 JSR $0745 ; (spriteSetVisible.s4 + 0)
4bc9 : a9 01 __ LDA #$01
4bcb : d0 bc __ BNE $4b89 ; (read_line.s88 + 0)
--------------------------------------------------------------------
mouseInWhere: ; mouseInWhere()->u8
;1289, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s4:
4bcd : ad e2 d6 LDA $d6e2 
4bd0 : 85 29 __ STA ACCU + 0 
4bd2 : ad e3 d6 LDA $d6e3 
4bd5 : 85 2a __ STA ACCU + 1 
4bd7 : ad e4 d6 LDA $d6e4 
4bda : 85 35 __ STA T1 + 0 
4bdc : ae e5 d6 LDX $d6e5 
4bdf : 86 36 __ STX T1 + 1 
4be1 : a5 2a __ LDA ACCU + 1 
4be3 : 30 38 __ BMI $4c1d ; (mouseInWhere.s5 + 0)
.s30:
4be5 : d0 06 __ BNE $4bed ; (mouseInWhere.s19 + 0)
.s29:
4be7 : a5 29 __ LDA ACCU + 0 
4be9 : c9 08 __ CMP #$08
4beb : 90 2e __ BCC $4c1b ; (mouseInWhere.s31 + 0)
.s19:
4bed : a9 01 __ LDA #$01
4bef : c5 2a __ CMP ACCU + 1 
4bf1 : f0 04 __ BEQ $4bf7 ; (mouseInWhere.s27 + 0)
.s28:
4bf3 : b0 08 __ BCS $4bfd ; (mouseInWhere.s20 + 0)
4bf5 : 90 24 __ BCC $4c1b ; (mouseInWhere.s31 + 0)
.s27:
4bf7 : a5 29 __ LDA ACCU + 0 
4bf9 : c9 39 __ CMP #$39
4bfb : b0 1e __ BCS $4c1b ; (mouseInWhere.s31 + 0)
.s20:
4bfd : 8a __ __ TXA
4bfe : 30 1b __ BMI $4c1b ; (mouseInWhere.s31 + 0)
.s26:
4c00 : d0 06 __ BNE $4c08 ; (mouseInWhere.s21 + 0)
.s25:
4c02 : a5 35 __ LDA T1 + 0 
4c04 : c9 10 __ CMP #$10
4c06 : 90 13 __ BCC $4c1b ; (mouseInWhere.s31 + 0)
.s21:
4c08 : a9 01 __ LDA #$01
4c0a : c5 36 __ CMP T1 + 1 
4c0c : f0 04 __ BEQ $4c12 ; (mouseInWhere.s23 + 0)
.s24:
4c0e : b0 08 __ BCS $4c18 ; (mouseInWhere.s22 + 0)
4c10 : 90 09 __ BCC $4c1b ; (mouseInWhere.s31 + 0)
.s23:
4c12 : a5 35 __ LDA T1 + 0 
4c14 : c9 59 __ CMP #$59
4c16 : b0 03 __ BCS $4c1b ; (mouseInWhere.s31 + 0)
.s22:
4c18 : a9 01 __ LDA #$01
.s3:
4c1a : 60 __ __ RTS
.s31:
4c1b : a5 2a __ LDA ACCU + 1 
.s5:
4c1d : c9 01 __ CMP #$01
4c1f : d0 04 __ BNE $4c25 ; (mouseInWhere.s18 + 0)
.s17:
4c21 : a5 29 __ LDA ACCU + 0 
4c23 : c9 40 __ CMP #$40
.s18:
4c25 : 90 23 __ BCC $4c4a ; (mouseInWhere.s6 + 0)
.s7:
4c27 : a9 02 __ LDA #$02
4c29 : c5 2a __ CMP ACCU + 1 
4c2b : d0 04 __ BNE $4c31 ; (mouseInWhere.s16 + 0)
.s15:
4c2d : a9 70 __ LDA #$70
4c2f : c5 29 __ CMP ACCU + 0 
.s16:
4c31 : 90 17 __ BCC $4c4a ; (mouseInWhere.s6 + 0)
.s8:
4c33 : 8a __ __ TXA
4c34 : 30 14 __ BMI $4c4a ; (mouseInWhere.s6 + 0)
.s14:
4c36 : d0 06 __ BNE $4c3e ; (mouseInWhere.s9 + 0)
.s13:
4c38 : a5 35 __ LDA T1 + 0 
4c3a : c9 10 __ CMP #$10
4c3c : 90 0c __ BCC $4c4a ; (mouseInWhere.s6 + 0)
.s9:
4c3e : a9 01 __ LDA #$01
4c40 : c5 36 __ CMP T1 + 1 
4c42 : d0 04 __ BNE $4c48 ; (mouseInWhere.s12 + 0)
.s11:
4c44 : a9 58 __ LDA #$58
4c46 : c5 35 __ CMP T1 + 0 
.s12:
4c48 : b0 03 __ BCS $4c4d ; (mouseInWhere.s10 + 0)
.s6:
4c4a : a9 00 __ LDA #$00
4c4c : 60 __ __ RTS
.s10:
4c4d : a9 02 __ LDA #$02
4c4f : 60 __ __ RTS
--------------------------------------------------------------------
4c50 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
ftp_retr: ; ftp_retr(const u8*,const u8*)->bool
;1158, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s1:
4c52 : a2 0c __ LDX #$0c
4c54 : b5 55 __ LDA T0 + 0,x 
4c56 : 9d 46 9e STA $9e46,x ; (ftp_retr@stack + 0)
4c59 : ca __ __ DEX
4c5a : 10 f8 __ BPL $4c54 ; (ftp_retr.s1 + 2)
.s4:
4c5c : a9 00 __ LDA #$00
4c5e : 8d 5e 7a STA $7a5e ; (downloadComplete + 0)
4c61 : 8d 5a 7a STA $7a5a ; (downloadTotal + 0)
4c64 : 8d 5b 7a STA $7a5b ; (downloadTotal + 1)
4c67 : 8d 5c 7a STA $7a5c ; (downloadTotal + 2)
4c6a : 8d 5d 7a STA $7a5d ; (downloadTotal + 3)
4c6d : 8d b9 79 STA $79b9 ; (downloadBytes + 0)
4c70 : 8d ba 79 STA $79ba ; (downloadBytes + 1)
4c73 : 8d bb 79 STA $79bb ; (downloadBytes + 2)
4c76 : 8d bc 79 STA $79bc ; (downloadBytes + 3)
4c79 : ad f5 9f LDA $9ff5 ; (sstack + 41)
4c7c : 85 59 __ STA T2 + 0 
4c7e : 8d e9 9f STA $9fe9 ; (sstack + 29)
4c81 : ad f6 9f LDA $9ff6 ; (sstack + 42)
4c84 : 85 5a __ STA T2 + 1 
4c86 : 8d ea 9f STA $9fea ; (sstack + 30)
4c89 : a9 5a __ LDA #$5a
4c8b : 8d eb 9f STA $9feb ; (sstack + 31)
4c8e : a9 7a __ LDA #$7a
4c90 : 8d ec 9f STA $9fec ; (sstack + 32)
4c93 : 20 32 4f JSR $4f32 ; (ftp_size.s1 + 0)
4c96 : ad a5 79 LDA $79a5 ; (cur_cli_y + 0)
4c99 : 85 5f __ STA T5 + 0 
4c9b : 8d 5f 7a STA $7a5f ; (downloadProgressY + 0)
4c9e : a9 01 __ LDA #$01
4ca0 : 85 25 __ STA P10 
4ca2 : 20 a9 52 JSR $52a9 ; (reset_download_progress.s4 + 0)
4ca5 : 20 bd 52 JSR $52bd ; (draw_download_progress.s4 + 0)
4ca8 : ad f7 9f LDA $9ff7 ; (sstack + 43)
4cab : 85 5b __ STA T3 + 0 
4cad : 85 21 __ STA P6 
4caf : ad f8 9f LDA $9ff8 ; (sstack + 44)
4cb2 : 85 5c __ STA T3 + 1 
4cb4 : 85 22 __ STA P7 
4cb6 : a9 8d __ LDA #$8d
4cb8 : 85 23 __ STA P8 
4cba : a9 55 __ LDA #$55
4cbc : 85 24 __ STA P9 
4cbe : 20 e8 54 JSR $54e8 ; (fileOpen.s4 + 0)
4cc1 : a5 2a __ LDA ACCU + 1 
4cc3 : 05 29 __ ORA ACCU + 0 
4cc5 : d0 41 __ BNE $4d08 ; (ftp_retr.s6 + 0)
.s5:
4cc7 : a9 4f __ LDA #$4f
4cc9 : 85 1d __ STA P2 
4ccb : 20 76 17 JSR $1776 ; (initTextXY.s4 + 0)
4cce : a9 90 __ LDA #$90
4cd0 : 85 23 __ STA P8 
4cd2 : a9 55 __ LDA #$55
4cd4 : 85 24 __ STA P9 
4cd6 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
4cd9 : a5 5b __ LDA T3 + 0 
4cdb : 85 23 __ STA P8 
4cdd : a5 5c __ LDA T3 + 1 
.s21:
4cdf : 85 24 __ STA P9 
4ce1 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
4ce4 : a9 4f __ LDA #$4f
4ce6 : 85 26 __ STA P11 
4ce8 : a9 2c __ LDA #$2c
4cea : 8d cc 9f STA $9fcc ; (sstack + 0)
4ced : a9 00 __ LDA #$00
4cef : 85 25 __ STA P10 
4cf1 : a9 3a __ LDA #$3a
4cf3 : 8d cd 9f STA $9fcd ; (sstack + 1)
4cf6 : 20 bb 17 JSR $17bb ; (textPrintNewLine.s4 + 0)
4cf9 : a9 00 __ LDA #$00
.s3:
4cfb : 85 29 __ STA ACCU + 0 
4cfd : a2 0c __ LDX #$0c
4cff : bd 46 9e LDA $9e46,x ; (ftp_retr@stack + 0)
4d02 : 95 55 __ STA T0 + 0,x 
4d04 : ca __ __ DEX
4d05 : 10 f8 __ BPL $4cff ; (ftp_retr.s3 + 4)
4d07 : 60 __ __ RTS
.s6:
4d08 : a5 2a __ LDA ACCU + 1 
4d0a : 85 5e __ STA T4 + 1 
4d0c : a5 29 __ LDA ACCU + 0 
4d0e : 85 5d __ STA T4 + 0 
4d10 : a9 00 __ LDA #$00
4d12 : 85 55 __ STA T0 + 0 
4d14 : 85 56 __ STA T0 + 1 
4d16 : 85 57 __ STA T0 + 2 
4d18 : 85 58 __ STA T0 + 3 
4d1a : 85 60 __ STA T6 + 0 
.l8:
4d1c : a5 59 __ LDA T2 + 0 
4d1e : 8d ed 9f STA $9fed ; (sstack + 33)
4d21 : a5 5a __ LDA T2 + 1 
4d23 : 8d ee 9f STA $9fee ; (sstack + 34)
4d26 : a5 5d __ LDA T4 + 0 
4d28 : 8d ef 9f STA $9fef ; (sstack + 35)
4d2b : a5 5e __ LDA T4 + 1 
4d2d : 8d f0 9f STA $9ff0 ; (sstack + 36)
4d30 : a5 55 __ LDA T0 + 0 
4d32 : 8d f1 9f STA $9ff1 ; (sstack + 37)
4d35 : a5 56 __ LDA T0 + 1 
4d37 : 8d f2 9f STA $9ff2 ; (sstack + 38)
4d3a : a5 57 __ LDA T0 + 2 
4d3c : 8d f3 9f STA $9ff3 ; (sstack + 39)
4d3f : a5 58 __ LDA T0 + 3 
4d41 : 8d f4 9f STA $9ff4 ; (sstack + 40)
4d44 : 20 c4 55 JSR $55c4 ; (ftp_retr_attempt.s1 + 0)
4d47 : a5 29 __ LDA ACCU + 0 
4d49 : 85 61 __ STA T7 + 0 
4d4b : d0 03 __ BNE $4d50 ; (ftp_retr.s14 + 0)
4d4d : 4c 1b 4e JMP $4e1b ; (ftp_retr.s9 + 0)
.s14:
4d50 : c9 02 __ CMP #$02
4d52 : f0 15 __ BEQ $4d69 ; (ftp_retr.s17 + 0)
.s15:
4d54 : ad b9 79 LDA $79b9 ; (downloadBytes + 0)
4d57 : 85 55 __ STA T0 + 0 
4d59 : ad ba 79 LDA $79ba ; (downloadBytes + 1)
4d5c : 85 56 __ STA T0 + 1 
4d5e : ad bb 79 LDA $79bb ; (downloadBytes + 2)
4d61 : 85 57 __ STA T0 + 2 
4d63 : ad bc 79 LDA $79bc ; (downloadBytes + 3)
4d66 : 4c b0 4d JMP $4db0 ; (ftp_retr.s16 + 0)
.s17:
4d69 : a5 5d __ LDA T4 + 0 
4d6b : 85 1b __ STA P0 
4d6d : a5 5e __ LDA T4 + 1 
4d6f : 85 1c __ STA P1 
4d71 : 20 50 5a JSR $5a50 ; (fileClose.s4 + 0)
4d74 : a5 5b __ LDA T3 + 0 
4d76 : 85 21 __ STA P6 
4d78 : a5 5c __ LDA T3 + 1 
4d7a : 85 22 __ STA P7 
4d7c : a9 8d __ LDA #$8d
4d7e : 85 23 __ STA P8 
4d80 : a9 55 __ LDA #$55
4d82 : 85 24 __ STA P9 
4d84 : 20 e8 54 JSR $54e8 ; (fileOpen.s4 + 0)
4d87 : a5 2a __ LDA ACCU + 1 
4d89 : 85 5e __ STA T4 + 1 
4d8b : a9 02 __ LDA #$02
4d8d : 85 61 __ STA T7 + 0 
4d8f : a5 29 __ LDA ACCU + 0 
4d91 : 85 5d __ STA T4 + 0 
4d93 : 05 2a __ ORA ACCU + 1 
4d95 : d0 05 __ BNE $4d9c ; (ftp_retr.s19 + 0)
.s18:
4d97 : e6 61 __ INC T7 + 0 
4d99 : 4c 1b 4e JMP $4e1b ; (ftp_retr.s9 + 0)
.s19:
4d9c : a9 00 __ LDA #$00
4d9e : 8d b9 79 STA $79b9 ; (downloadBytes + 0)
4da1 : 8d ba 79 STA $79ba ; (downloadBytes + 1)
4da4 : 8d bb 79 STA $79bb ; (downloadBytes + 2)
4da7 : 8d bc 79 STA $79bc ; (downloadBytes + 3)
4daa : 85 55 __ STA T0 + 0 
4dac : 85 56 __ STA T0 + 1 
4dae : 85 57 __ STA T0 + 2 
.s16:
4db0 : 85 58 __ STA T0 + 3 
4db2 : e6 60 __ INC T6 + 0 
4db4 : a5 60 __ LDA T6 + 0 
4db6 : c9 03 __ CMP #$03
4db8 : b0 61 __ BCS $4e1b ; (ftp_retr.s9 + 0)
.s7:
4dba : aa __ __ TAX
4dbb : d0 03 __ BNE $4dc0 ; (ftp_retr.s20 + 0)
4dbd : 4c 1c 4d JMP $4d1c ; (ftp_retr.l8 + 0)
.s20:
4dc0 : a9 4f __ LDA #$4f
4dc2 : 85 1d __ STA P2 
4dc4 : 20 76 17 JSR $1776 ; (initTextXY.s4 + 0)
4dc7 : a9 aa __ LDA #$aa
4dc9 : 85 23 __ STA P8 
4dcb : a9 55 __ LDA #$55
4dcd : 85 24 __ STA P9 
4dcf : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
4dd2 : a5 55 __ LDA T0 + 0 
4dd4 : 85 1b __ STA P0 
4dd6 : a5 56 __ LDA T0 + 1 
4dd8 : 85 1c __ STA P1 
4dda : a5 57 __ LDA T0 + 2 
4ddc : 85 1d __ STA P2 
4dde : a5 58 __ LDA T0 + 3 
4de0 : 85 1e __ STA P3 
4de2 : a9 61 __ LDA #$61
4de4 : 85 1f __ STA P4 
4de6 : a9 9e __ LDA #$9e
4de8 : 85 20 __ STA P5 
4dea : 20 63 26 JSR $2663 ; (format_u32.s4 + 0)
4ded : a9 61 __ LDA #$61
4def : 85 23 __ STA P8 
4df1 : a9 9e __ LDA #$9e
4df3 : 85 24 __ STA P9 
4df5 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
4df8 : a9 c0 __ LDA #$c0
4dfa : 85 23 __ STA P8 
4dfc : a9 55 __ LDA #$55
4dfe : 85 24 __ STA P9 
4e00 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
4e03 : a9 00 __ LDA #$00
4e05 : 85 25 __ STA P10 
4e07 : a9 2c __ LDA #$2c
4e09 : 8d cc 9f STA $9fcc ; (sstack + 0)
4e0c : a9 4f __ LDA #$4f
4e0e : 85 26 __ STA P11 
4e10 : a9 3a __ LDA #$3a
4e12 : 8d cd 9f STA $9fcd ; (sstack + 1)
4e15 : 20 bb 17 JSR $17bb ; (textPrintNewLine.s4 + 0)
4e18 : 4c 1c 4d JMP $4d1c ; (ftp_retr.l8 + 0)
.s9:
4e1b : a5 5d __ LDA T4 + 0 
4e1d : 85 1b __ STA P0 
4e1f : a5 5e __ LDA T4 + 1 
4e21 : 85 1c __ STA P1 
4e23 : 20 50 5a JSR $5a50 ; (fileClose.s4 + 0)
4e26 : a9 00 __ LDA #$00
4e28 : 8d bd 79 STA $79bd ; (out_fp + 0)
4e2b : 8d be 79 STA $79be ; (out_fp + 1)
4e2e : a5 61 __ LDA T7 + 0 
4e30 : d0 68 __ BNE $4e9a ; (ftp_retr.s13 + 0)
.s10:
4e32 : a9 01 __ LDA #$01
4e34 : 85 25 __ STA P10 
4e36 : 8d 5e 7a STA $7a5e ; (downloadComplete + 0)
4e39 : 20 a9 52 JSR $52a9 ; (reset_download_progress.s4 + 0)
4e3c : 20 bd 52 JSR $52bd ; (draw_download_progress.s4 + 0)
4e3f : 18 __ __ CLC
4e40 : a5 5f __ LDA T5 + 0 
4e42 : 69 01 __ ADC #$01
4e44 : c9 3b __ CMP #$3b
4e46 : 90 02 __ BCC $4e4a ; (ftp_retr.s11 + 0)
.s12:
4e48 : a9 3a __ LDA #$3a
.s11:
4e4a : 8d a5 79 STA $79a5 ; (cur_cli_y + 0)
4e4d : 85 1c __ STA P1 
4e4f : a9 00 __ LDA #$00
4e51 : 85 1b __ STA P0 
4e53 : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
4e56 : a9 ba __ LDA #$ba
4e58 : 85 23 __ STA P8 
4e5a : a9 5a __ LDA #$5a
4e5c : 85 24 __ STA P9 
4e5e : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
4e61 : a5 59 __ LDA T2 + 0 
4e63 : 85 23 __ STA P8 
4e65 : a5 5a __ LDA T2 + 1 
4e67 : 85 24 __ STA P9 
4e69 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
4e6c : a9 c6 __ LDA #$c6
4e6e : 85 23 __ STA P8 
4e70 : a9 5a __ LDA #$5a
4e72 : 85 24 __ STA P9 
4e74 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
4e77 : a5 5b __ LDA T3 + 0 
4e79 : 85 23 __ STA P8 
4e7b : a5 5c __ LDA T3 + 1 
4e7d : 85 24 __ STA P9 
4e7f : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
4e82 : c6 25 __ DEC P10 
4e84 : a9 4f __ LDA #$4f
4e86 : 85 26 __ STA P11 
4e88 : a9 2c __ LDA #$2c
4e8a : 8d cc 9f STA $9fcc ; (sstack + 0)
4e8d : a9 3a __ LDA #$3a
4e8f : 8d cd 9f STA $9fcd ; (sstack + 1)
4e92 : 20 bb 17 JSR $17bb ; (textPrintNewLine.s4 + 0)
4e95 : a9 01 __ LDA #$01
4e97 : 4c fb 4c JMP $4cfb ; (ftp_retr.s3 + 0)
.s13:
4e9a : a9 4f __ LDA #$4f
4e9c : 85 1d __ STA P2 
4e9e : 20 76 17 JSR $1776 ; (initTextXY.s4 + 0)
4ea1 : a9 8b __ LDA #$8b
4ea3 : 85 23 __ STA P8 
4ea5 : a9 5a __ LDA #$5a
4ea7 : 85 24 __ STA P9 
4ea9 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
4eac : a9 00 __ LDA #$00
4eae : 8d cd 9f STA $9fcd ; (sstack + 1)
4eb1 : 8d ce 9f STA $9fce ; (sstack + 2)
4eb4 : 8d cf 9f STA $9fcf ; (sstack + 3)
4eb7 : a9 03 __ LDA #$03
4eb9 : 8d cc 9f STA $9fcc ; (sstack + 0)
4ebc : 20 7f 20 JSR $207f ; (textPrintInt.s1 + 0)
4ebf : a9 a2 __ LDA #$a2
4ec1 : 85 23 __ STA P8 
4ec3 : a9 5a __ LDA #$5a
4ec5 : 85 24 __ STA P9 
4ec7 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
4eca : ad b9 79 LDA $79b9 ; (downloadBytes + 0)
4ecd : 85 1b __ STA P0 
4ecf : ad ba 79 LDA $79ba ; (downloadBytes + 1)
4ed2 : 85 1c __ STA P1 
4ed4 : ad bb 79 LDA $79bb ; (downloadBytes + 2)
4ed7 : 85 1d __ STA P2 
4ed9 : ad bc 79 LDA $79bc ; (downloadBytes + 3)
4edc : 85 1e __ STA P3 
4ede : a9 55 __ LDA #$55
4ee0 : 85 1f __ STA P4 
4ee2 : a9 9e __ LDA #$9e
4ee4 : 85 20 __ STA P5 
4ee6 : 20 63 26 JSR $2663 ; (format_u32.s4 + 0)
4ee9 : a9 55 __ LDA #$55
4eeb : 85 23 __ STA P8 
4eed : a9 9e __ LDA #$9e
4eef : 85 24 __ STA P9 
4ef1 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
4ef4 : a9 ae __ LDA #$ae
4ef6 : 85 23 __ STA P8 
4ef8 : a9 5a __ LDA #$5a
4efa : 85 24 __ STA P9 
4efc : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
4eff : ad 5a 7a LDA $7a5a ; (downloadTotal + 0)
4f02 : 85 1b __ STA P0 
4f04 : ad 5b 7a LDA $7a5b ; (downloadTotal + 1)
4f07 : 85 1c __ STA P1 
4f09 : ad 5c 7a LDA $7a5c ; (downloadTotal + 2)
4f0c : 85 1d __ STA P2 
4f0e : ad 5d 7a LDA $7a5d ; (downloadTotal + 3)
4f11 : 85 1e __ STA P3 
4f13 : a9 55 __ LDA #$55
4f15 : 85 1f __ STA P4 
4f17 : a9 9e __ LDA #$9e
4f19 : 85 20 __ STA P5 
4f1b : 20 63 26 JSR $2663 ; (format_u32.s4 + 0)
4f1e : a9 55 __ LDA #$55
4f20 : 85 23 __ STA P8 
4f22 : a9 9e __ LDA #$9e
4f24 : 85 24 __ STA P9 
4f26 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
4f29 : a9 b2 __ LDA #$b2
4f2b : 85 23 __ STA P8 
4f2d : a9 5a __ LDA #$5a
4f2f : 4c df 4c JMP $4cdf ; (ftp_retr.s21 + 0)
--------------------------------------------------------------------
ftp_size: ; ftp_size(const u8*,u32*)->bool
;1068, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s1:
4f32 : a2 05 __ LDX #$05
4f34 : b5 55 __ LDA T0 + 0,x 
4f36 : 9d a5 9e STA $9ea5,x ; (ftp_size@stack + 0)
4f39 : ca __ __ DEX
4f3a : 10 f8 __ BPL $4f34 ; (ftp_size.s1 + 2)
.s4:
4f3c : a9 ad __ LDA #$ad
4f3e : 8d d4 9f STA $9fd4 ; (sstack + 8)
4f41 : a9 9e __ LDA #$9e
4f43 : 8d d5 9f STA $9fd5 ; (sstack + 9)
4f46 : a9 76 __ LDA #$76
4f48 : 8d d6 9f STA $9fd6 ; (sstack + 10)
4f4b : a9 50 __ LDA #$50
4f4d : 8d d7 9f STA $9fd7 ; (sstack + 11)
4f50 : ad e9 9f LDA $9fe9 ; (sstack + 29)
4f53 : 8d d8 9f STA $9fd8 ; (sstack + 12)
4f56 : ad ea 9f LDA $9fea ; (sstack + 30)
4f59 : 8d d9 9f STA $9fd9 ; (sstack + 13)
4f5c : 20 3a 50 JSR $503a ; (sprintf.s4 + 0)
4f5f : a9 ad __ LDA #$ad
4f61 : 8d e7 9f STA $9fe7 ; (sstack + 27)
4f64 : a9 9e __ LDA #$9e
4f66 : 8d e8 9f STA $9fe8 ; (sstack + 28)
4f69 : 20 7e 50 JSR $507e ; (ftp_command.s4 + 0)
4f6c : a5 29 __ LDA ACCU + 0 
4f6e : 85 55 __ STA T0 + 0 
4f70 : a5 2a __ LDA ACCU + 1 
4f72 : 85 56 __ STA T0 + 1 
4f74 : 20 54 52 JSR $5254 ; (print_reply.s4 + 0)
4f77 : a5 56 __ LDA T0 + 1 
4f79 : d0 28 __ BNE $4fa3 ; (ftp_size.s7 + 0)
.s15:
4f7b : a5 55 __ LDA T0 + 0 
4f7d : c9 d5 __ CMP #$d5
4f7f : d0 22 __ BNE $4fa3 ; (ftp_size.s7 + 0)
.s5:
4f81 : a9 80 __ LDA #$80
4f83 : 85 35 __ STA T2 + 0 
4f85 : a9 7c __ LDA #$7c
4f87 : 85 36 __ STA T2 + 1 
4f89 : ac 80 7c LDY $7c80 ; (ctrl_reply_text[0] + 0)
4f8c : f0 11 __ BEQ $4f9f ; (ftp_size.s6 + 0)
.l12:
4f8e : a0 00 __ LDY #$00
4f90 : b1 35 __ LDA (T2 + 0),y 
4f92 : c9 30 __ CMP #$30
4f94 : b0 03 __ BCS $4f99 ; (ftp_size.s13 + 0)
4f96 : 4c 2a 50 JMP $502a ; (ftp_size.s14 + 0)
.s13:
4f99 : a9 39 __ LDA #$39
4f9b : d1 35 __ CMP (T2 + 0),y 
4f9d : 90 f7 __ BCC $4f96 ; (ftp_size.l12 + 8)
.s6:
4f9f : b1 35 __ LDA (T2 + 0),y 
4fa1 : d0 0f __ BNE $4fb2 ; (ftp_size.s8 + 0)
.s7:
4fa3 : a9 00 __ LDA #$00
.s3:
4fa5 : 85 29 __ STA ACCU + 0 
4fa7 : a2 05 __ LDX #$05
4fa9 : bd a5 9e LDA $9ea5,x ; (ftp_size@stack + 0)
4fac : 95 55 __ STA T0 + 0,x 
4fae : ca __ __ DEX
4faf : 10 f8 __ BPL $4fa9 ; (ftp_size.s3 + 4)
4fb1 : 60 __ __ RTS
.s8:
4fb2 : 84 55 __ STY T0 + 0 
4fb4 : 84 57 __ STY T0 + 2 
4fb6 : 84 58 __ STY T0 + 3 
4fb8 : 4c bd 4f JMP $4fbd ; (ftp_size.l16 + 0)
.s20:
4fbb : a0 00 __ LDY #$00
.l16:
4fbd : b1 35 __ LDA (T2 + 0),y 
4fbf : c9 30 __ CMP #$30
4fc1 : 90 04 __ BCC $4fc7 ; (ftp_size.s9 + 0)
.s10:
4fc3 : c9 3a __ CMP #$3a
4fc5 : 90 22 __ BCC $4fe9 ; (ftp_size.s11 + 0)
.s9:
4fc7 : ad eb 9f LDA $9feb ; (sstack + 31)
4fca : 85 59 __ STA T1 + 0 
4fcc : ad ec 9f LDA $9fec ; (sstack + 32)
4fcf : 85 5a __ STA T1 + 1 
4fd1 : a5 55 __ LDA T0 + 0 
4fd3 : 91 59 __ STA (T1 + 0),y 
4fd5 : a5 56 __ LDA T0 + 1 
4fd7 : a0 01 __ LDY #$01
4fd9 : 91 59 __ STA (T1 + 0),y 
4fdb : a5 57 __ LDA T0 + 2 
4fdd : c8 __ __ INY
4fde : 91 59 __ STA (T1 + 0),y 
4fe0 : a5 58 __ LDA T0 + 3 
4fe2 : c8 __ __ INY
4fe3 : 91 59 __ STA (T1 + 0),y 
4fe5 : a9 01 __ LDA #$01
4fe7 : d0 bc __ BNE $4fa5 ; (ftp_size.s3 + 0)
.s11:
4fe9 : e9 2f __ SBC #$2f
4feb : 85 59 __ STA T1 + 0 
4fed : a9 00 __ LDA #$00
4fef : e9 00 __ SBC #$00
4ff1 : 85 5a __ STA T1 + 1 
4ff3 : a5 55 __ LDA T0 + 0 
4ff5 : 85 29 __ STA ACCU + 0 
4ff7 : a5 56 __ LDA T0 + 1 
4ff9 : 85 2a __ STA ACCU + 1 
4ffb : a5 57 __ LDA T0 + 2 
4ffd : 85 2b __ STA ACCU + 2 
4fff : a5 58 __ LDA T0 + 3 
5001 : 85 2c __ STA ACCU + 3 
5003 : a9 0a __ LDA #$0a
5005 : 20 98 72 JSR $7298 ; (mul32by8 + 0)
5008 : 18 __ __ CLC
5009 : a5 59 __ LDA T1 + 0 
500b : 65 15 __ ADC WORK + 4 
500d : 85 55 __ STA T0 + 0 
500f : a5 5a __ LDA T1 + 1 
5011 : 65 16 __ ADC WORK + 5 
5013 : 85 56 __ STA T0 + 1 
5015 : a5 17 __ LDA WORK + 6 
5017 : 69 00 __ ADC #$00
5019 : 85 57 __ STA T0 + 2 
501b : a5 18 __ LDA WORK + 7 
501d : 69 00 __ ADC #$00
501f : 85 58 __ STA T0 + 3 
5021 : e6 35 __ INC T2 + 0 
5023 : d0 96 __ BNE $4fbb ; (ftp_size.s20 + 0)
.s19:
5025 : e6 36 __ INC T2 + 1 
5027 : 4c bb 4f JMP $4fbb ; (ftp_size.s20 + 0)
.s14:
502a : e6 35 __ INC T2 + 0 
502c : d0 02 __ BNE $5030 ; (ftp_size.s18 + 0)
.s17:
502e : e6 36 __ INC T2 + 1 
.s18:
5030 : b1 35 __ LDA (T2 + 0),y 
5032 : d0 03 __ BNE $5037 ; (ftp_size.s18 + 7)
5034 : 4c a3 4f JMP $4fa3 ; (ftp_size.s7 + 0)
5037 : 4c 8e 4f JMP $4f8e ; (ftp_size.l12 + 0)
--------------------------------------------------------------------
sprintf: ; sprintf(u8*,const u8*)->i16
;  20, "/mnt/d/F256/oscar64/include/stdio.h"
.s4:
503a : ad d4 9f LDA $9fd4 ; (sstack + 8)
503d : 85 53 __ STA T1 + 0 
503f : 8d cd 9f STA $9fcd ; (sstack + 1)
5042 : a9 00 __ LDA #$00
5044 : 8d d3 9f STA $9fd3 ; (sstack + 7)
5047 : ad d5 9f LDA $9fd5 ; (sstack + 9)
504a : 85 54 __ STA T1 + 1 
504c : 8d ce 9f STA $9fce ; (sstack + 2)
504f : ad d6 9f LDA $9fd6 ; (sstack + 10)
5052 : 8d cf 9f STA $9fcf ; (sstack + 3)
5055 : ad d7 9f LDA $9fd7 ; (sstack + 11)
5058 : 8d d0 9f STA $9fd0 ; (sstack + 4)
505b : a9 d8 __ LDA #$d8
505d : 8d d1 9f STA $9fd1 ; (sstack + 5)
5060 : a9 9f __ LDA #$9f
5062 : 8d d2 9f STA $9fd2 ; (sstack + 6)
5065 : 20 dc 38 JSR $38dc ; (sformat.s4 + 0)
5068 : 38 __ __ SEC
5069 : a5 29 __ LDA ACCU + 0 
506b : e5 53 __ SBC T1 + 0 
506d : 85 29 __ STA ACCU + 0 
506f : a5 2a __ LDA ACCU + 1 
5071 : e5 54 __ SBC T1 + 1 
5073 : 85 2a __ STA ACCU + 1 
.s3:
5075 : 60 __ __ RTS
--------------------------------------------------------------------
5076 : __ __ __ BYT 53 49 5a 45 20 25 73 00                         : SIZE %s.
--------------------------------------------------------------------
ftp_command: ; ftp_command(const u8*)->i16
; 366, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s4:
507e : ad e7 9f LDA $9fe7 ; (sstack + 27)
5081 : 8d e5 9f STA $9fe5 ; (sstack + 25)
5084 : ad e8 9f LDA $9fe8 ; (sstack + 28)
5087 : 8d e6 9f STA $9fe6 ; (sstack + 26)
508a : 20 b4 50 JSR $50b4 ; (ftp_send_cmd.s4 + 0)
508d : a5 29 __ LDA ACCU + 0 
508f : f0 11 __ BEQ $50a2 ; (ftp_command.s5 + 0)
.s6:
5091 : a9 dc __ LDA #$dc
5093 : 8d db 9f STA $9fdb ; (sstack + 15)
5096 : a9 05 __ LDA #$05
5098 : 8d dc 9f STA $9fdc ; (sstack + 16)
509b : 20 f6 51 JSR $51f6 ; (ftp_wait_reply.s1 + 0)
509e : a5 29 __ LDA ACCU + 0 
50a0 : d0 07 __ BNE $50a9 ; (ftp_command.s7 + 0)
.s5:
50a2 : a9 ff __ LDA #$ff
50a4 : c6 29 __ DEC ACCU + 0 
50a6 : 4c b1 50 JMP $50b1 ; (ftp_command.s3 + 0)
.s7:
50a9 : ad b3 79 LDA $79b3 ; (ctrl_reply_code + 0)
50ac : 85 29 __ STA ACCU + 0 
50ae : ad b4 79 LDA $79b4 ; (ctrl_reply_code + 1)
.s3:
50b1 : 85 2a __ STA ACCU + 1 
50b3 : 60 __ __ RTS
--------------------------------------------------------------------
ftp_send_cmd: ; ftp_send_cmd(const u8*)->bool
; 887, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s4:
50b4 : ad e5 9f LDA $9fe5 ; (sstack + 25)
50b7 : 85 35 __ STA T0 + 0 
50b9 : a9 fd __ LDA #$fd
50bb : 85 1b __ STA P0 
50bd : a9 9e __ LDA #$9e
50bf : 85 1c __ STA P1 
50c1 : ad e6 9f LDA $9fe6 ; (sstack + 26)
50c4 : 85 36 __ STA T0 + 1 
50c6 : a0 ff __ LDY #$ff
.l5:
50c8 : c8 __ __ INY
50c9 : b1 35 __ LDA (T0 + 0),y 
50cb : 99 fd 9e STA $9efd,y ; (buf[0] + 0)
50ce : d0 f8 __ BNE $50c8 ; (ftp_send_cmd.l5 + 0)
.s6:
50d0 : a9 37 __ LDA #$37
50d2 : 85 1d __ STA P2 
50d4 : a9 1a __ LDA #$1a
50d6 : 85 1e __ STA P3 
50d8 : 20 13 27 JSR $2713 ; (strcat.s4 + 0)
50db : a9 00 __ LDA #$00
50dd : 8d b5 79 STA $79b5 ; (ctrl_reply_ready + 0)
50e0 : 20 f7 26 JSR $26f7 ; (strlen.s4 + 0)
50e3 : a9 00 __ LDA #$00
50e5 : 8d e0 9f STA $9fe0 ; (sstack + 20)
50e8 : a9 fd __ LDA #$fd
50ea : 8d e1 9f STA $9fe1 ; (sstack + 21)
50ed : a9 9e __ LDA #$9e
50ef : 8d e2 9f STA $9fe2 ; (sstack + 22)
50f2 : a5 29 __ LDA ACCU + 0 
50f4 : 8d e3 9f STA $9fe3 ; (sstack + 23)
50f7 : a5 2a __ LDA ACCU + 1 
50f9 : 8d e4 9f STA $9fe4 ; (sstack + 24)
50fc : 4c ff 50 JMP $50ff ; (wiz_cipsend.s1 + 0)
--------------------------------------------------------------------
wiz_cipsend: ; wiz_cipsend(u8,const u8*,u16)->bool
; 872, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s1:
50ff : a2 03 __ LDX #$03
5101 : b5 55 __ LDA T0 + 0,x 
5103 : 9d 7f 9f STA $9f7f,x ; (wiz_cipsend@stack + 0)
5106 : ca __ __ DEX
5107 : 10 f8 __ BPL $5101 ; (wiz_cipsend.s1 + 2)
.s4:
5109 : a9 83 __ LDA #$83
510b : 8d d4 9f STA $9fd4 ; (sstack + 8)
510e : a9 9f __ LDA #$9f
5110 : 8d d5 9f STA $9fd5 ; (sstack + 9)
5113 : a9 a4 __ LDA #$a4
5115 : 8d d6 9f STA $9fd6 ; (sstack + 10)
5118 : a9 51 __ LDA #$51
511a : 8d d7 9f STA $9fd7 ; (sstack + 11)
511d : ad e0 9f LDA $9fe0 ; (sstack + 20)
5120 : 8d d8 9f STA $9fd8 ; (sstack + 12)
5123 : ad e3 9f LDA $9fe3 ; (sstack + 23)
5126 : 85 55 __ STA T0 + 0 
5128 : 8d da 9f STA $9fda ; (sstack + 14)
512b : a9 00 __ LDA #$00
512d : 8d d9 9f STA $9fd9 ; (sstack + 13)
5130 : ad e4 9f LDA $9fe4 ; (sstack + 24)
5133 : 85 56 __ STA T0 + 1 
5135 : 8d db 9f STA $9fdb ; (sstack + 15)
5138 : 20 3a 50 JSR $503a ; (sprintf.s4 + 0)
513b : a9 00 __ LDA #$00
513d : 8d a9 79 STA $79a9 ; (at_error + 0)
5140 : 8d a8 79 STA $79a8 ; (at_ok + 0)
5143 : a9 83 __ LDA #$83
5145 : 85 1c __ STA P1 
5147 : a9 9f __ LDA #$9f
5149 : 85 1d __ STA P2 
514b : 20 f7 19 JSR $19f7 ; (uart_puts.s4 + 0)
514e : a9 3e __ LDA #$3e
5150 : 85 1e __ STA P3 
5152 : a9 01 __ LDA #$01
5154 : 85 20 __ STA P5 
5156 : a9 2c __ LDA #$2c
5158 : 85 1f __ STA P4 
515a : 20 b7 51 JSR $51b7 ; (wiz_wait_char.s4 + 0)
515d : a5 29 __ LDA ACCU + 0 
515f : f0 38 __ BEQ $5199 ; (wiz_cipsend.s3 + 0)
.s5:
5161 : a5 55 __ LDA T0 + 0 
5163 : 05 56 __ ORA T0 + 1 
5165 : f0 25 __ BEQ $518c ; (wiz_cipsend.s6 + 0)
.s7:
5167 : ad e1 9f LDA $9fe1 ; (sstack + 21)
516a : 85 57 __ STA T1 + 0 
516c : ad e2 9f LDA $9fe2 ; (sstack + 22)
516f : 85 58 __ STA T1 + 1 
.l8:
5171 : a0 00 __ LDY #$00
5173 : b1 57 __ LDA (T1 + 0),y 
5175 : 20 1e 1a JSR $1a1e ; (uart_putc.s4 + 0)
5178 : e6 57 __ INC T1 + 0 
517a : d0 02 __ BNE $517e ; (wiz_cipsend.s13 + 0)
.s12:
517c : e6 58 __ INC T1 + 1 
.s13:
517e : a5 55 __ LDA T0 + 0 
5180 : d0 02 __ BNE $5184 ; (wiz_cipsend.s10 + 0)
.s9:
5182 : c6 56 __ DEC T0 + 1 
.s10:
5184 : c6 55 __ DEC T0 + 0 
5186 : d0 e9 __ BNE $5171 ; (wiz_cipsend.l8 + 0)
.s11:
5188 : a5 56 __ LDA T0 + 1 
518a : d0 e5 __ BNE $5171 ; (wiz_cipsend.l8 + 0)
.s6:
518c : a9 f4 __ LDA #$f4
518e : 8d db 9f STA $9fdb ; (sstack + 15)
5191 : a9 01 __ LDA #$01
5193 : 8d dc 9f STA $9fdc ; (sstack + 16)
5196 : 20 3a 1a JSR $1a3a ; (wiz_wait_atok.s1 + 0)
.s3:
5199 : a2 03 __ LDX #$03
519b : bd 7f 9f LDA $9f7f,x ; (wiz_cipsend@stack + 0)
519e : 95 55 __ STA T0 + 0,x 
51a0 : ca __ __ DEX
51a1 : 10 f8 __ BPL $519b ; (wiz_cipsend.s3 + 2)
51a3 : 60 __ __ RTS
--------------------------------------------------------------------
51a4 : __ __ __ BYT 41 54 2b 43 49 50 53 45 4e 44 3d 25 75 2c 25 75 : AT+CIPSEND=%u,%u
51b4 : __ __ __ BYT 0d 0a 00                                        : ...
--------------------------------------------------------------------
wiz_wait_char: ; wiz_wait_char(u8,u16)->bool
; 296, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s4:
51b7 : a5 20 __ LDA P5 ; (timeout_frames + 1)
51b9 : 05 1f __ ORA P4 ; (timeout_frames + 0)
51bb : f0 29 __ BEQ $51e6 ; (wiz_wait_char.s5 + 0)
.s6:
51bd : a9 00 __ LDA #$00
51bf : 85 35 __ STA T2 + 0 
51c1 : 85 36 __ STA T2 + 1 
.l7:
51c3 : ad 82 dd LDA $dd82 
51c6 : 0d 83 dd ORA $dd83 
51c9 : d0 20 __ BNE $51eb ; (wiz_wait_char.s11 + 0)
.s8:
51cb : a9 01 __ LDA #$01
51cd : 85 1d __ STA P2 
51cf : 20 2c 19 JSR $192c ; (lilpause.s4 + 0)
51d2 : e6 35 __ INC T2 + 0 
51d4 : d0 02 __ BNE $51d8 ; (wiz_wait_char.s9 + 0)
.s13:
51d6 : e6 36 __ INC T2 + 1 
.s9:
51d8 : a5 36 __ LDA T2 + 1 
51da : c5 20 __ CMP P5 ; (timeout_frames + 1)
51dc : 90 e5 __ BCC $51c3 ; (wiz_wait_char.l7 + 0)
.s14:
51de : d0 06 __ BNE $51e6 ; (wiz_wait_char.s5 + 0)
.s10:
51e0 : a5 35 __ LDA T2 + 0 
51e2 : c5 1f __ CMP P4 ; (timeout_frames + 0)
51e4 : 90 dd __ BCC $51c3 ; (wiz_wait_char.l7 + 0)
.s5:
51e6 : a9 00 __ LDA #$00
.s3:
51e8 : 85 29 __ STA ACCU + 0 
51ea : 60 __ __ RTS
.s11:
51eb : a5 1e __ LDA P3 ; (ch + 0)
51ed : cd 81 dd CMP $dd81 
51f0 : d0 e6 __ BNE $51d8 ; (wiz_wait_char.s9 + 0)
.s12:
51f2 : a9 01 __ LDA #$01
51f4 : d0 f2 __ BNE $51e8 ; (wiz_wait_char.s3 + 0)
--------------------------------------------------------------------
ftp_wait_reply: ; ftp_wait_reply(u16)->bool
; 773, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s1:
51f6 : a2 03 __ LDX #$03
51f8 : b5 55 __ LDA T0 + 0,x 
51fa : 9d a3 9f STA $9fa3,x ; (ftp_wait_reply@stack + 0)
51fd : ca __ __ DEX
51fe : 10 f8 __ BPL $51f8 ; (ftp_wait_reply.s1 + 2)
.s4:
5200 : ad dc 9f LDA $9fdc ; (sstack + 16)
5203 : 85 56 __ STA T0 + 1 
5205 : ad db 9f LDA $9fdb ; (sstack + 15)
5208 : 85 55 __ STA T0 + 0 
520a : 05 56 __ ORA T0 + 1 
520c : f0 29 __ BEQ $5237 ; (ftp_wait_reply.s5 + 0)
.s6:
520e : 20 9d 1a JSR $1a9d ; (wiz_poll_any.s4 + 0)
5211 : a8 __ __ TAY
5212 : ad b5 79 LDA $79b5 ; (ctrl_reply_ready + 0)
5215 : d0 22 __ BNE $5239 ; (ftp_wait_reply.s3 + 0)
.s7:
5217 : 85 57 __ STA T1 + 0 
5219 : 85 58 __ STA T1 + 1 
521b : 98 __ __ TYA
521c : d0 0d __ BNE $522b ; (ftp_wait_reply.l9 + 0)
.s8:
521e : a9 01 __ LDA #$01
5220 : 85 1d __ STA P2 
5222 : 20 2c 19 JSR $192c ; (lilpause.s4 + 0)
5225 : e6 57 __ INC T1 + 0 
5227 : d0 02 __ BNE $522b ; (ftp_wait_reply.l9 + 0)
.s14:
5229 : e6 58 __ INC T1 + 1 
.l9:
522b : a5 58 __ LDA T1 + 1 
522d : c5 56 __ CMP T0 + 1 
522f : d0 04 __ BNE $5235 ; (ftp_wait_reply.s13 + 0)
.s12:
5231 : a5 57 __ LDA T1 + 0 
5233 : c5 55 __ CMP T0 + 0 
.s13:
5235 : 90 0f __ BCC $5246 ; (ftp_wait_reply.s10 + 0)
.s5:
5237 : a9 00 __ LDA #$00
.s3:
5239 : 85 29 __ STA ACCU + 0 
523b : a2 03 __ LDX #$03
523d : bd a3 9f LDA $9fa3,x ; (ftp_wait_reply@stack + 0)
5240 : 95 55 __ STA T0 + 0,x 
5242 : ca __ __ DEX
5243 : 10 f8 __ BPL $523d ; (ftp_wait_reply.s3 + 4)
5245 : 60 __ __ RTS
.s10:
5246 : 20 9d 1a JSR $1a9d ; (wiz_poll_any.s4 + 0)
5249 : a8 __ __ TAY
524a : ad b5 79 LDA $79b5 ; (ctrl_reply_ready + 0)
524d : d0 ea __ BNE $5239 ; (ftp_wait_reply.s3 + 0)
.s11:
524f : 98 __ __ TYA
5250 : d0 d9 __ BNE $522b ; (ftp_wait_reply.l9 + 0)
5252 : f0 ca __ BEQ $521e ; (ftp_wait_reply.s8 + 0)
--------------------------------------------------------------------
print_reply: ; print_reply()->void
; 783, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s4:
5254 : a9 4f __ LDA #$4f
5256 : 85 1d __ STA P2 
5258 : 20 76 17 JSR $1776 ; (initTextXY.s4 + 0)
525b : ad b3 79 LDA $79b3 ; (ctrl_reply_code + 0)
525e : 8d cc 9f STA $9fcc ; (sstack + 0)
5261 : ad b4 79 LDA $79b4 ; (ctrl_reply_code + 1)
5264 : 8d cd 9f STA $9fcd ; (sstack + 1)
5267 : 29 80 __ AND #$80
5269 : 10 02 __ BPL $526d ; (print_reply.s4 + 25)
526b : a9 ff __ LDA #$ff
526d : 85 37 __ STA T0 + 2 
526f : 8d ce 9f STA $9fce ; (sstack + 2)
5272 : 85 38 __ STA T0 + 3 
5274 : 8d cf 9f STA $9fcf ; (sstack + 3)
5277 : 20 7f 20 JSR $207f ; (textPrintInt.s1 + 0)
527a : a9 74 __ LDA #$74
527c : 85 23 __ STA P8 
527e : a9 17 __ LDA #$17
5280 : 85 24 __ STA P9 
5282 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
5285 : a9 80 __ LDA #$80
5287 : 85 35 __ STA T0 + 0 
5289 : 85 23 __ STA P8 
528b : a9 7c __ LDA #$7c
528d : 85 36 __ STA T0 + 1 
528f : 85 24 __ STA P9 
5291 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
5294 : a9 00 __ LDA #$00
5296 : 85 25 __ STA P10 
5298 : a9 2c __ LDA #$2c
529a : 8d cc 9f STA $9fcc ; (sstack + 0)
529d : a9 4f __ LDA #$4f
529f : 85 26 __ STA P11 
52a1 : a9 3a __ LDA #$3a
52a3 : 8d cd 9f STA $9fcd ; (sstack + 1)
52a6 : 4c bb 17 JMP $17bb ; (textPrintNewLine.s4 + 0)
--------------------------------------------------------------------
reset_download_progress: ; reset_download_progress()->void
; 398, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s4:
52a9 : a9 00 __ LDA #$00
52ab : 8d 60 7a STA $7a60 ; (progressTickCounter + 0)
52ae : 8d 61 7a STA $7a61 ; (progressTickCounter + 1)
52b1 : a9 ff __ LDA #$ff
52b3 : 8d 62 7a STA $7a62 ; (progressLastFilled + 0)
52b6 : ad 5f 7a LDA $7a5f ; (downloadProgressY + 0)
52b9 : 8d 63 7a STA $7a63 ; (progressLastY + 0)
.s3:
52bc : 60 __ __ RTS
--------------------------------------------------------------------
draw_download_progress: ; draw_download_progress(bool)->void
; 675, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s4:
52bd : a9 00 __ LDA #$00
52bf : 85 43 __ STA T1 + 0 
52c1 : 85 44 __ STA T2 + 0 
52c3 : ad 5f 7a LDA $7a5f ; (downloadProgressY + 0)
52c6 : 85 46 __ STA T5 + 0 
52c8 : cd 63 7a CMP $7a63 ; (progressLastY + 0)
52cb : f0 03 __ BEQ $52d0 ; (draw_download_progress.s5 + 0)
.s37:
52cd : 20 a9 52 JSR $52a9 ; (reset_download_progress.s4 + 0)
.s5:
52d0 : a5 25 __ LDA P10 ; (force + 0)
52d2 : d0 23 __ BNE $52f7 ; (draw_download_progress.s8 + 0)
.s6:
52d4 : ad 60 7a LDA $7a60 ; (progressTickCounter + 0)
52d7 : 18 __ __ CLC
52d8 : 69 01 __ ADC #$01
52da : 8d 60 7a STA $7a60 ; (progressTickCounter + 0)
52dd : ad 61 7a LDA $7a61 ; (progressTickCounter + 1)
52e0 : 69 00 __ ADC #$00
52e2 : 8d 61 7a STA $7a61 ; (progressTickCounter + 1)
52e5 : d0 08 __ BNE $52ef ; (draw_download_progress.s7 + 0)
.s36:
52e7 : ad 60 7a LDA $7a60 ; (progressTickCounter + 0)
52ea : c9 08 __ CMP #$08
52ec : b0 01 __ BCS $52ef ; (draw_download_progress.s7 + 0)
52ee : 60 __ __ RTS
.s7:
52ef : a9 00 __ LDA #$00
52f1 : 8d 60 7a STA $7a60 ; (progressTickCounter + 0)
52f4 : 8d 61 7a STA $7a61 ; (progressTickCounter + 1)
.s8:
52f7 : ad 5e 7a LDA $7a5e ; (downloadComplete + 0)
52fa : 85 47 __ STA T6 + 0 
52fc : f0 0b __ BEQ $5309 ; (draw_download_progress.s9 + 0)
.s35:
52fe : a9 64 __ LDA #$64
5300 : 85 43 __ STA T1 + 0 
5302 : a9 1e __ LDA #$1e
.s38:
5304 : 85 44 __ STA T2 + 0 
5306 : 4c 20 53 JMP $5320 ; (draw_download_progress.s10 + 0)
.s9:
5309 : ad 5d 7a LDA $7a5d ; (downloadTotal + 3)
530c : f0 03 __ BEQ $5311 ; (draw_download_progress.s32 + 0)
530e : 4c 0a 54 JMP $540a ; (draw_download_progress.s24 + 0)
.s32:
5311 : ad 5c 7a LDA $7a5c ; (downloadTotal + 2)
5314 : d0 f8 __ BNE $530e ; (draw_download_progress.s9 + 5)
.s33:
5316 : ad 5b 7a LDA $7a5b ; (downloadTotal + 1)
5319 : d0 f3 __ BNE $530e ; (draw_download_progress.s9 + 5)
.s34:
531b : cd 5a 7a CMP $7a5a ; (downloadTotal + 0)
531e : 90 ee __ BCC $530e ; (draw_download_progress.s9 + 5)
.s10:
5320 : a5 25 __ LDA P10 ; (force + 0)
5322 : d0 08 __ BNE $532c ; (draw_download_progress.s12 + 0)
.s11:
5324 : a5 44 __ LDA T2 + 0 
5326 : cd 62 7a CMP $7a62 ; (progressLastFilled + 0)
5329 : d0 01 __ BNE $532c ; (draw_download_progress.s12 + 0)
532b : 60 __ __ RTS
.s12:
532c : a5 46 __ LDA T5 + 0 
532e : 85 1c __ STA P1 
5330 : a9 00 __ LDA #$00
5332 : 85 1b __ STA P0 
5334 : a5 44 __ LDA T2 + 0 
5336 : 8d 62 7a STA $7a62 ; (progressLastFilled + 0)
5339 : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
533c : a9 8d __ LDA #$8d
533e : 85 23 __ STA P8 
5340 : a9 54 __ LDA #$54
5342 : 85 24 __ STA P9 
5344 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
5347 : a5 46 __ LDA T5 + 0 
5349 : 85 1c __ STA P1 
534b : a9 00 __ LDA #$00
534d : 85 1b __ STA P0 
534f : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
5352 : a9 ce __ LDA #$ce
5354 : 85 23 __ STA P8 
5356 : a9 54 __ LDA #$54
5358 : 85 24 __ STA P9 
535a : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
535d : a9 00 __ LDA #$00
535f : 85 45 __ STA T3 + 0 
5361 : c5 44 __ CMP T2 + 0 
5363 : b0 06 __ BCS $536b ; (draw_download_progress.s14 + 0)
.l23:
5365 : a9 54 __ LDA #$54
5367 : a0 d9 __ LDY #$d9
5369 : 90 04 __ BCC $536f ; (draw_download_progress.l15 + 0)
.s14:
536b : a9 29 __ LDA #$29
536d : a0 de __ LDY #$de
.l15:
536f : 84 23 __ STY P8 
5371 : 85 24 __ STA P9 
5373 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
5376 : e6 45 __ INC T3 + 0 
5378 : a5 45 __ LDA T3 + 0 
537a : c9 1e __ CMP #$1e
537c : b0 06 __ BCS $5384 ; (draw_download_progress.s16 + 0)
.s13:
537e : c5 44 __ CMP T2 + 0 
5380 : b0 e9 __ BCS $536b ; (draw_download_progress.s14 + 0)
5382 : 90 e1 __ BCC $5365 ; (draw_download_progress.l23 + 0)
.s16:
5384 : a9 db __ LDA #$db
5386 : 85 23 __ STA P8 
5388 : a9 54 __ LDA #$54
538a : 85 24 __ STA P9 
538c : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
538f : a5 47 __ LDA T6 + 0 
5391 : d0 14 __ BNE $53a7 ; (draw_download_progress.s19 + 0)
.s17:
5393 : ad 5d 7a LDA $7a5d ; (downloadTotal + 3)
5396 : d0 0f __ BNE $53a7 ; (draw_download_progress.s19 + 0)
.s20:
5398 : ad 5c 7a LDA $7a5c ; (downloadTotal + 2)
539b : d0 0a __ BNE $53a7 ; (draw_download_progress.s19 + 0)
.s21:
539d : ad 5b 7a LDA $7a5b ; (downloadTotal + 1)
53a0 : d0 05 __ BNE $53a7 ; (draw_download_progress.s19 + 0)
.s22:
53a2 : cd 5a 7a CMP $7a5a ; (downloadTotal + 0)
53a5 : b0 2d __ BCS $53d4 ; (draw_download_progress.s18 + 0)
.s19:
53a7 : a5 43 __ LDA T1 + 0 
53a9 : 85 1b __ STA P0 
53ab : a9 00 __ LDA #$00
53ad : 85 1c __ STA P1 
53af : 85 1d __ STA P2 
53b1 : 85 1e __ STA P3 
53b3 : a9 b5 __ LDA #$b5
53b5 : 85 1f __ STA P4 
53b7 : a9 9f __ LDA #$9f
53b9 : 85 20 __ STA P5 
53bb : 20 63 26 JSR $2663 ; (format_u32.s4 + 0)
53be : a9 b5 __ LDA #$b5
53c0 : 85 23 __ STA P8 
53c2 : a9 9f __ LDA #$9f
53c4 : 85 24 __ STA P9 
53c6 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
53c9 : a9 de __ LDA #$de
53cb : 85 23 __ STA P8 
53cd : a9 54 __ LDA #$54
53cf : 85 24 __ STA P9 
53d1 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
.s18:
53d4 : ad b9 79 LDA $79b9 ; (downloadBytes + 0)
53d7 : 85 1b __ STA P0 
53d9 : ad ba 79 LDA $79ba ; (downloadBytes + 1)
53dc : 85 1c __ STA P1 
53de : ad bb 79 LDA $79bb ; (downloadBytes + 2)
53e1 : 85 1d __ STA P2 
53e3 : ad bc 79 LDA $79bc ; (downloadBytes + 3)
53e6 : 85 1e __ STA P3 
53e8 : a9 b5 __ LDA #$b5
53ea : 85 1f __ STA P4 
53ec : a9 9f __ LDA #$9f
53ee : 85 20 __ STA P5 
53f0 : 20 63 26 JSR $2663 ; (format_u32.s4 + 0)
53f3 : a9 b5 __ LDA #$b5
53f5 : 85 23 __ STA P8 
53f7 : a9 9f __ LDA #$9f
53f9 : 85 24 __ STA P9 
53fb : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
53fe : a9 e1 __ LDA #$e1
5400 : 85 23 __ STA P8 
5402 : a9 54 __ LDA #$54
5404 : 85 24 __ STA P9 
5406 : 4c 0c 15 JMP $150c ; (textPrint.s4 + 0)
.s3:
5409 : 60 __ __ RTS
.s24:
540a : ad bc 79 LDA $79bc ; (downloadBytes + 3)
540d : cd 5d 7a CMP $7a5d ; (downloadTotal + 3)
5410 : d0 16 __ BNE $5428 ; (draw_download_progress.s31 + 0)
.s28:
5412 : ad bb 79 LDA $79bb ; (downloadBytes + 2)
5415 : cd 5c 7a CMP $7a5c ; (downloadTotal + 2)
5418 : d0 0e __ BNE $5428 ; (draw_download_progress.s31 + 0)
.s29:
541a : ad ba 79 LDA $79ba ; (downloadBytes + 1)
541d : cd 5b 7a CMP $7a5b ; (downloadTotal + 1)
5420 : d0 06 __ BNE $5428 ; (draw_download_progress.s31 + 0)
.s30:
5422 : ad b9 79 LDA $79b9 ; (downloadBytes + 0)
5425 : cd 5a 7a CMP $7a5a ; (downloadTotal + 0)
.s31:
5428 : 90 04 __ BCC $542e ; (draw_download_progress.s25 + 0)
.s27:
542a : a9 64 __ LDA #$64
542c : b0 42 __ BCS $5470 ; (draw_download_progress.s26 + 0)
.s25:
542e : ad b9 79 LDA $79b9 ; (downloadBytes + 0)
5431 : 85 29 __ STA ACCU + 0 
5433 : ad ba 79 LDA $79ba ; (downloadBytes + 1)
5436 : 85 2a __ STA ACCU + 1 
5438 : ad bb 79 LDA $79bb ; (downloadBytes + 2)
543b : 85 2b __ STA ACCU + 2 
543d : ad bc 79 LDA $79bc ; (downloadBytes + 3)
5440 : 85 2c __ STA ACCU + 3 
5442 : a9 64 __ LDA #$64
5444 : 20 98 72 JSR $7298 ; (mul32by8 + 0)
5447 : a5 15 __ LDA WORK + 4 
5449 : 85 29 __ STA ACCU + 0 
544b : a5 16 __ LDA WORK + 5 
544d : 85 2a __ STA ACCU + 1 
544f : a5 17 __ LDA WORK + 6 
5451 : 85 2b __ STA ACCU + 2 
5453 : a5 18 __ LDA WORK + 7 
5455 : 85 2c __ STA ACCU + 3 
5457 : ad 5a 7a LDA $7a5a ; (downloadTotal + 0)
545a : 85 11 __ STA WORK + 0 
545c : ad 5b 7a LDA $7a5b ; (downloadTotal + 1)
545f : 85 12 __ STA WORK + 1 
5461 : ad 5c 7a LDA $7a5c ; (downloadTotal + 2)
5464 : 85 13 __ STA WORK + 2 
5466 : ad 5d 7a LDA $7a5d ; (downloadTotal + 3)
5469 : 85 14 __ STA WORK + 3 
546b : 20 37 77 JSR $7737 ; (divmod32 + 0)
546e : a5 29 __ LDA ACCU + 0 
.s26:
5470 : 85 43 __ STA T1 + 0 
5472 : 85 29 __ STA ACCU + 0 
5474 : a9 00 __ LDA #$00
5476 : 85 2a __ STA ACCU + 1 
5478 : a9 1e __ LDA #$1e
547a : 20 60 72 JSR $7260 ; (mul16by8 + 0)
547d : a9 64 __ LDA #$64
547f : 85 11 __ STA WORK + 0 
5481 : a9 00 __ LDA #$00
5483 : 85 12 __ STA WORK + 1 
5485 : 20 f2 75 JSR $75f2 ; (divmod + 0)
5488 : a5 29 __ LDA ACCU + 0 
548a : 4c 04 53 JMP $5304 ; (draw_download_progress.s38 + 0)
--------------------------------------------------------------------
548d : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
549d : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
54ad : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
54bd : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
54cd : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
54ce : __ __ __ BYT 44 6f 77 6e 6c 6f 61 64 20 5b 00                : Download [.
--------------------------------------------------------------------
54d9 : __ __ __ BYT 23 00                                           : #.
--------------------------------------------------------------------
54db : __ __ __ BYT 5d 20 00                                        : ] .
--------------------------------------------------------------------
54de : __ __ __ BYT 25 20 00                                        : % .
--------------------------------------------------------------------
54e1 : __ __ __ BYT 20 62 79 74 65 73 00                            :  bytes.
--------------------------------------------------------------------
fileOpen: ; fileOpen(const u8*,const u8*)->u8*
;  25, "/mnt/d/F256/f256lib-oscar64/f256lib/f_file.h"
.s4:
54e8 : a5 21 __ LDA P6 ; (fname + 0)
54ea : 85 1d __ STA P2 
54ec : a5 22 __ LDA P7 ; (fname + 1)
54ee : 85 1e __ STA P3 
54f0 : a9 cb __ LDA #$cb
54f2 : 85 1f __ STA P4 
54f4 : a9 9f __ LDA #$9f
54f6 : 85 20 __ STA P5 
54f8 : 20 e1 2e JSR $2ee1 ; (pathWithoutDrive.s4 + 0)
54fb : a2 00 __ LDX #$00
.l5:
54fd : a0 00 __ LDY #$00
54ff : b1 23 __ LDA (P8),y ; (mode + 0)
5501 : d0 70 __ BNE $5573 ; (fileOpen.s11 + 0)
.s6:
5503 : 86 38 __ STX T4 + 0 
5505 : ad 64 7a LDA $7a64 ; (kernelArgs + 0)
5508 : 85 35 __ STA T1 + 0 
550a : ad 65 7a LDA $7a65 ; (kernelArgs + 1)
550d : 85 36 __ STA T1 + 1 
550f : a5 29 __ LDA ACCU + 0 
5511 : 85 1b __ STA P0 
5513 : a0 0b __ LDY #$0b
5515 : 91 35 __ STA (T1 + 0),y 
5517 : a5 2a __ LDA ACCU + 1 
5519 : 85 1c __ STA P1 
551b : c8 __ __ INY
551c : 91 35 __ STA (T1 + 0),y 
551e : 20 f7 26 JSR $26f7 ; (strlen.s4 + 0)
5521 : a5 29 __ LDA ACCU + 0 
5523 : a0 0d __ LDY #$0d
5525 : 91 35 __ STA (T1 + 0),y 
5527 : a9 5c __ LDA #$5c
5529 : 8d cb 7a STA $7acb ; (_kern_target + 0)
552c : a9 ff __ LDA #$ff
552e : 8d cc 7a STA $7acc ; (_kern_target + 1)
5531 : ad cb 9f LDA $9fcb ; (drive + 0)
5534 : a0 03 __ LDY #$03
5536 : 91 35 __ STA (T1 + 0),y 
5538 : a5 38 __ LDA T4 + 0 
553a : a0 05 __ LDY #$05
553c : 91 35 __ STA (T1 + 0),y 
553e : 20 2f 29 JSR $292f ; (_kernelCallWrapper.s4 + 0)
5541 : 85 37 __ STA T3 + 0 
5543 : ad cd 7a LDA $7acd ; (_kernelError + 0)
5546 : d0 24 __ BNE $556c ; (fileOpen.s16 + 0)
.l7:
5548 : 20 4f 29 JSR $294f ; (kernelNextEvent.s4 + 0)
554b : ad 66 7a LDA $7a66 ; (kernelEventData.type + 0)
554e : c9 2a __ CMP #$2a
5550 : d0 12 __ BNE $5564 ; (fileOpen.s8 + 0)
.s10:
5552 : a9 01 __ LDA #$01
5554 : 85 29 __ STA ACCU + 0 
5556 : a9 00 __ LDA #$00
5558 : 85 2a __ STA ACCU + 1 
555a : 20 0e 78 JSR $780e ; (crt_malloc + 0)
555d : a5 37 __ LDA T3 + 0 
555f : a0 00 __ LDY #$00
5561 : 91 29 __ STA (ACCU + 0),y 
.s3:
5563 : 60 __ __ RTS
.s8:
5564 : c9 28 __ CMP #$28
5566 : f0 04 __ BEQ $556c ; (fileOpen.s16 + 0)
.s9:
5568 : c9 38 __ CMP #$38
556a : d0 dc __ BNE $5548 ; (fileOpen.l7 + 0)
.s16:
556c : a9 00 __ LDA #$00
556e : 85 29 __ STA ACCU + 0 
5570 : 85 2a __ STA ACCU + 1 
5572 : 60 __ __ RTS
.s11:
5573 : c9 77 __ CMP #$77
5575 : d0 04 __ BNE $557b ; (fileOpen.s12 + 0)
.s15:
5577 : a2 01 __ LDX #$01
5579 : d0 06 __ BNE $5581 ; (fileOpen.s13 + 0)
.s12:
557b : c9 61 __ CMP #$61
557d : d0 02 __ BNE $5581 ; (fileOpen.s13 + 0)
.s14:
557f : a2 02 __ LDX #$02
.s13:
5581 : e6 23 __ INC P8 ; (mode + 0)
5583 : f0 03 __ BEQ $5588 ; (fileOpen.s17 + 0)
5585 : 4c fd 54 JMP $54fd ; (fileOpen.l5 + 0)
.s17:
5588 : e6 24 __ INC P9 ; (mode + 1)
558a : 4c fd 54 JMP $54fd ; (fileOpen.l5 + 0)
--------------------------------------------------------------------
558d : __ __ __ BYT 77 62 00                                        : wb.
--------------------------------------------------------------------
5590 : __ __ __ BYT 43 61 6e 6e 6f 74 20 63 72 65 61 74 65 20 6c 6f : Cannot create lo
55a0 : __ __ __ BYT 63 61 6c 20 66 69 6c 65 20 00                   : cal file .
--------------------------------------------------------------------
55aa : __ __ __ BYT 52 65 74 72 79 69 6e 67 20 66 72 6f 6d 20 6f 66 : Retrying from of
55ba : __ __ __ BYT 66 73 65 74 20 00                               : fset .
--------------------------------------------------------------------
55c0 : __ __ __ BYT 2e 2e 2e 00                                     : ....
--------------------------------------------------------------------
ftp_retr_attempt: ; ftp_retr_attempt(const u8*,u8*,u32)->enum E#8551
;1108, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s1:
55c4 : a5 55 __ LDA T0 + 0 
55c6 : 8d 6d 9e STA $9e6d ; (ftp_retr_attempt@stack + 0)
55c9 : a5 56 __ LDA T0 + 1 
55cb : 8d 6e 9e STA $9e6e ; (ftp_retr_attempt@stack + 1)
55ce : a5 57 __ LDA T3 + 0 
55d0 : 8d 6f 9e STA $9e6f ; (ftp_retr_attempt@stack + 2)
.s4:
55d3 : a9 c9 __ LDA #$c9
55d5 : 8d e9 9f STA $9fe9 ; (sstack + 29)
55d8 : a9 9e __ LDA #$9e
55da : 8d ea 9f STA $9fea ; (sstack + 30)
55dd : a9 c6 __ LDA #$c6
55df : 8d eb 9f STA $9feb ; (sstack + 31)
55e2 : a9 9e __ LDA #$9e
55e4 : 8d ec 9f STA $9fec ; (sstack + 32)
55e7 : 20 8a 57 JSR $578a ; (ftp_pasv.s1 + 0)
55ea : a5 29 __ LDA ACCU + 0 
55ec : f0 49 __ BEQ $5637 ; (ftp_retr_attempt.s37 + 0)
.s5:
55ee : a9 01 __ LDA #$01
55f0 : 8d e1 9f STA $9fe1 ; (sstack + 21)
55f3 : a9 c9 __ LDA #$c9
55f5 : 8d e2 9f STA $9fe2 ; (sstack + 22)
55f8 : a9 9e __ LDA #$9e
55fa : 8d e3 9f STA $9fe3 ; (sstack + 23)
55fd : ad c6 9e LDA $9ec6 ; (port + 0)
5600 : 8d e4 9f STA $9fe4 ; (sstack + 24)
5603 : ad c7 9e LDA $9ec7 ; (port + 1)
5606 : 8d e5 9f STA $9fe5 ; (sstack + 25)
5609 : 20 25 59 JSR $5925 ; (wiz_open_link.s4 + 0)
560c : a5 29 __ LDA ACCU + 0 
560e : d0 3b __ BNE $564b ; (ftp_retr_attempt.s7 + 0)
.s6:
5610 : a9 4f __ LDA #$4f
5612 : 85 1d __ STA P2 
5614 : 20 76 17 JSR $1776 ; (initTextXY.s4 + 0)
5617 : a9 93 __ LDA #$93
5619 : 85 23 __ STA P8 
561b : a9 59 __ LDA #$59
561d : 85 24 __ STA P9 
561f : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
5622 : a9 00 __ LDA #$00
5624 : 85 25 __ STA P10 
5626 : a9 2c __ LDA #$2c
5628 : 8d cc 9f STA $9fcc ; (sstack + 0)
562b : a9 4f __ LDA #$4f
562d : 85 26 __ STA P11 
562f : a9 3a __ LDA #$3a
5631 : 8d cd 9f STA $9fcd ; (sstack + 1)
5634 : 20 bb 17 JSR $17bb ; (textPrintNewLine.s4 + 0)
.s37:
5637 : a9 03 __ LDA #$03
.s3:
5639 : 85 29 __ STA ACCU + 0 
563b : ad 6d 9e LDA $9e6d ; (ftp_retr_attempt@stack + 0)
563e : 85 55 __ STA T0 + 0 
5640 : ad 6e 9e LDA $9e6e ; (ftp_retr_attempt@stack + 1)
5643 : 85 56 __ STA T0 + 1 
5645 : ad 6f 9e LDA $9e6f ; (ftp_retr_attempt@stack + 2)
5648 : 85 57 __ STA T3 + 0 
564a : 60 __ __ RTS
.s7:
564b : a9 00 __ LDA #$00
564d : 85 57 __ STA T3 + 0 
564f : cd f4 9f CMP $9ff4 ; (sstack + 40)
5652 : d0 0f __ BNE $5663 ; (ftp_retr_attempt.s32 + 0)
.s34:
5654 : ad f3 9f LDA $9ff3 ; (sstack + 39)
5657 : d0 0a __ BNE $5663 ; (ftp_retr_attempt.s32 + 0)
.s35:
5659 : ad f2 9f LDA $9ff2 ; (sstack + 38)
565c : d0 05 __ BNE $5663 ; (ftp_retr_attempt.s32 + 0)
.s36:
565e : cd f1 9f CMP $9ff1 ; (sstack + 37)
5661 : b0 2a __ BCS $568d ; (ftp_retr_attempt.s8 + 0)
.s32:
5663 : ad f1 9f LDA $9ff1 ; (sstack + 37)
5666 : 8d e9 9f STA $9fe9 ; (sstack + 29)
5669 : ad f2 9f LDA $9ff2 ; (sstack + 38)
566c : 8d ea 9f STA $9fea ; (sstack + 30)
566f : ad f3 9f LDA $9ff3 ; (sstack + 39)
5672 : 8d eb 9f STA $9feb ; (sstack + 31)
5675 : ad f4 9f LDA $9ff4 ; (sstack + 40)
5678 : 8d ec 9f STA $9fec ; (sstack + 32)
567b : 20 aa 59 JSR $59aa ; (ftp_rest.s4 + 0)
567e : aa __ __ TAX
567f : d0 0c __ BNE $568d ; (ftp_retr_attempt.s8 + 0)
.s33:
5681 : a9 01 __ LDA #$01
5683 : 8d e1 9f STA $9fe1 ; (sstack + 21)
5686 : 20 00 5a JSR $5a00 ; (wiz_close_link.s4 + 0)
5689 : a9 02 __ LDA #$02
568b : d0 ac __ BNE $5639 ; (ftp_retr_attempt.s3 + 0)
.s8:
568d : a9 00 __ LDA #$00
568f : 8d ae 79 STA $79ae ; (data_closed + 0)
5692 : 8d b8 79 STA $79b8 ; (filebuf_len + 0)
5695 : a9 76 __ LDA #$76
5697 : 8d d4 9f STA $9fd4 ; (sstack + 8)
569a : a9 9e __ LDA #$9e
569c : 8d d5 9f STA $9fd5 ; (sstack + 9)
569f : a9 02 __ LDA #$02
56a1 : 8d b6 79 STA $79b6 ; (data_sink + 0)
56a4 : ad ef 9f LDA $9fef ; (sstack + 35)
56a7 : 8d bd 79 STA $79bd ; (out_fp + 0)
56aa : ad f0 9f LDA $9ff0 ; (sstack + 36)
56ad : 8d be 79 STA $79be ; (out_fp + 1)
56b0 : a9 48 __ LDA #$48
56b2 : 8d d6 9f STA $9fd6 ; (sstack + 10)
56b5 : a9 5a __ LDA #$5a
56b7 : 8d d7 9f STA $9fd7 ; (sstack + 11)
56ba : ad ed 9f LDA $9fed ; (sstack + 33)
56bd : 8d d8 9f STA $9fd8 ; (sstack + 12)
56c0 : ad ee 9f LDA $9fee ; (sstack + 34)
56c3 : 8d d9 9f STA $9fd9 ; (sstack + 13)
56c6 : 20 3a 50 JSR $503a ; (sprintf.s4 + 0)
56c9 : a9 76 __ LDA #$76
56cb : 8d e7 9f STA $9fe7 ; (sstack + 27)
56ce : a9 9e __ LDA #$9e
56d0 : 8d e8 9f STA $9fe8 ; (sstack + 28)
56d3 : 20 7e 50 JSR $507e ; (ftp_command.s4 + 0)
56d6 : a5 29 __ LDA ACCU + 0 
56d8 : 85 55 __ STA T0 + 0 
56da : a5 2a __ LDA ACCU + 1 
56dc : 85 56 __ STA T0 + 1 
56de : 20 54 52 JSR $5254 ; (print_reply.s4 + 0)
56e1 : a5 56 __ LDA T0 + 1 
56e3 : d0 0a __ BNE $56ef ; (ftp_retr_attempt.s29 + 0)
.s31:
56e5 : a5 55 __ LDA T0 + 0 
56e7 : c9 96 __ CMP #$96
56e9 : f0 14 __ BEQ $56ff ; (ftp_retr_attempt.s9 + 0)
.s30:
56eb : c9 7d __ CMP #$7d
56ed : f0 10 __ BEQ $56ff ; (ftp_retr_attempt.s9 + 0)
.s29:
56ef : a9 01 __ LDA #$01
56f1 : 8d e1 9f STA $9fe1 ; (sstack + 21)
56f4 : a9 00 __ LDA #$00
56f6 : 8d b6 79 STA $79b6 ; (data_sink + 0)
56f9 : 20 00 5a JSR $5a00 ; (wiz_close_link.s4 + 0)
56fc : 4c 37 56 JMP $5637 ; (ftp_retr_attempt.s37 + 0)
.s9:
56ff : ad ae 79 LDA $79ae ; (data_closed + 0)
5702 : d0 2d __ BNE $5731 ; (ftp_retr_attempt.s15 + 0)
.s10:
5704 : 85 55 __ STA T0 + 0 
.l11:
5706 : 20 9d 1a JSR $1a9d ; (wiz_poll_any.s4 + 0)
5709 : aa __ __ TAX
570a : d0 0d __ BNE $5719 ; (ftp_retr_attempt.s13 + 0)
.s12:
570c : a9 01 __ LDA #$01
570e : 85 1d __ STA P2 
5710 : 20 2c 19 JSR $192c ; (lilpause.s4 + 0)
5713 : e6 55 __ INC T0 + 0 
5715 : d0 02 __ BNE $5719 ; (ftp_retr_attempt.s13 + 0)
.s38:
5717 : e6 56 __ INC T0 + 1 
.s13:
5719 : a9 00 __ LDA #$00
571b : 85 25 __ STA P10 
571d : 20 bd 52 JSR $52bd ; (draw_download_progress.s4 + 0)
5720 : ad ae 79 LDA $79ae ; (data_closed + 0)
5723 : d0 0c __ BNE $5731 ; (ftp_retr_attempt.s15 + 0)
.s14:
5725 : a5 56 __ LDA T0 + 1 
5727 : c9 17 __ CMP #$17
5729 : d0 db __ BNE $5706 ; (ftp_retr_attempt.l11 + 0)
.s28:
572b : a5 55 __ LDA T0 + 0 
572d : c9 70 __ CMP #$70
572f : d0 d5 __ BNE $5706 ; (ftp_retr_attempt.l11 + 0)
.s15:
5731 : a9 00 __ LDA #$00
5733 : 8d b6 79 STA $79b6 ; (data_sink + 0)
5736 : ad ae 79 LDA $79ae ; (data_closed + 0)
5739 : d0 02 __ BNE $573d ; (ftp_retr_attempt.s17 + 0)
.s16:
573b : e6 57 __ INC T3 + 0 
.s17:
573d : 20 8b 27 JSR $278b ; (flush_filebuf.s4 + 0)
5740 : a9 01 __ LDA #$01
5742 : 8d e1 9f STA $9fe1 ; (sstack + 21)
5745 : 20 00 5a JSR $5a00 ; (wiz_close_link.s4 + 0)
5748 : a5 57 __ LDA T3 + 0 
574a : d0 39 __ BNE $5785 ; (ftp_retr_attempt.s21 + 0)
.s18:
574c : ad 5d 7a LDA $7a5d ; (downloadTotal + 3)
574f : d0 0f __ BNE $5760 ; (ftp_retr_attempt.s20 + 0)
.s25:
5751 : ad 5c 7a LDA $7a5c ; (downloadTotal + 2)
5754 : d0 0a __ BNE $5760 ; (ftp_retr_attempt.s20 + 0)
.s26:
5756 : ad 5b 7a LDA $7a5b ; (downloadTotal + 1)
5759 : d0 05 __ BNE $5760 ; (ftp_retr_attempt.s20 + 0)
.s27:
575b : cd 5a 7a CMP $7a5a ; (downloadTotal + 0)
575e : b0 20 __ BCS $5780 ; (ftp_retr_attempt.s19 + 0)
.s20:
5760 : ad bc 79 LDA $79bc ; (downloadBytes + 3)
5763 : cd 5d 7a CMP $7a5d ; (downloadTotal + 3)
5766 : d0 1d __ BNE $5785 ; (ftp_retr_attempt.s21 + 0)
.s22:
5768 : ad bb 79 LDA $79bb ; (downloadBytes + 2)
576b : cd 5c 7a CMP $7a5c ; (downloadTotal + 2)
576e : d0 15 __ BNE $5785 ; (ftp_retr_attempt.s21 + 0)
.s23:
5770 : ad ba 79 LDA $79ba ; (downloadBytes + 1)
5773 : cd 5b 7a CMP $7a5b ; (downloadTotal + 1)
5776 : d0 0d __ BNE $5785 ; (ftp_retr_attempt.s21 + 0)
.s24:
5778 : ad b9 79 LDA $79b9 ; (downloadBytes + 0)
577b : cd 5a 7a CMP $7a5a ; (downloadTotal + 0)
577e : d0 05 __ BNE $5785 ; (ftp_retr_attempt.s21 + 0)
.s19:
5780 : a9 00 __ LDA #$00
5782 : 4c 39 56 JMP $5639 ; (ftp_retr_attempt.s3 + 0)
.s21:
5785 : a9 01 __ LDA #$01
5787 : 4c 39 56 JMP $5639 ; (ftp_retr_attempt.s3 + 0)
--------------------------------------------------------------------
ftp_pasv: ; ftp_pasv(u8*,u16*)->bool
;1009, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s1:
578a : a5 55 __ LDA T0 + 0 
578c : 8d fb 9e STA $9efb ; (ftp_pasv@stack + 0)
578f : a5 56 __ LDA T0 + 1 
5791 : 8d fc 9e STA $9efc ; (ftp_pasv@stack + 1)
.s4:
5794 : a9 ec __ LDA #$ec
5796 : 8d e7 9f STA $9fe7 ; (sstack + 27)
5799 : a9 57 __ LDA #$57
579b : 8d e8 9f STA $9fe8 ; (sstack + 28)
579e : 20 7e 50 JSR $507e ; (ftp_command.s4 + 0)
57a1 : a5 29 __ LDA ACCU + 0 
57a3 : 85 55 __ STA T0 + 0 
57a5 : a5 2a __ LDA ACCU + 1 
57a7 : 85 56 __ STA T0 + 1 
57a9 : 20 54 52 JSR $5254 ; (print_reply.s4 + 0)
57ac : a5 56 __ LDA T0 + 1 
57ae : d0 06 __ BNE $57b6 ; (ftp_pasv.s6 + 0)
.s7:
57b0 : a5 55 __ LDA T0 + 0 
57b2 : c9 e3 __ CMP #$e3
57b4 : f0 06 __ BEQ $57bc ; (ftp_pasv.s5 + 0)
.s6:
57b6 : a9 00 __ LDA #$00
57b8 : 85 29 __ STA ACCU + 0 
57ba : f0 25 __ BEQ $57e1 ; (ftp_pasv.s3 + 0)
.s5:
57bc : a9 80 __ LDA #$80
57be : 8d e0 9f STA $9fe0 ; (sstack + 20)
57c1 : a9 7c __ LDA #$7c
57c3 : 8d e1 9f STA $9fe1 ; (sstack + 21)
57c6 : ad e9 9f LDA $9fe9 ; (sstack + 29)
57c9 : 8d e2 9f STA $9fe2 ; (sstack + 22)
57cc : ad ea 9f LDA $9fea ; (sstack + 30)
57cf : 8d e3 9f STA $9fe3 ; (sstack + 23)
57d2 : ad eb 9f LDA $9feb ; (sstack + 31)
57d5 : 8d e4 9f STA $9fe4 ; (sstack + 24)
57d8 : ad ec 9f LDA $9fec ; (sstack + 32)
57db : 8d e5 9f STA $9fe5 ; (sstack + 25)
57de : 20 f1 57 JSR $57f1 ; (parse_pasv.s4 + 0)
.s3:
57e1 : ad fb 9e LDA $9efb ; (ftp_pasv@stack + 0)
57e4 : 85 55 __ STA T0 + 0 
57e6 : ad fc 9e LDA $9efc ; (ftp_pasv@stack + 1)
57e9 : 85 56 __ STA T0 + 1 
57eb : 60 __ __ RTS
--------------------------------------------------------------------
57ec : __ __ __ BYT 50 41 53 56 00                                  : PASV.
--------------------------------------------------------------------
parse_pasv: ; parse_pasv(const u8*,u8*,u16*)->bool
; 990, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s4:
57f1 : ad e0 9f LDA $9fe0 ; (sstack + 20)
57f4 : 85 1b __ STA P0 
57f6 : ad e1 9f LDA $9fe1 ; (sstack + 21)
57f9 : 85 1c __ STA P1 
57fb : a9 28 __ LDA #$28
57fd : 85 1d __ STA P2 
57ff : a9 00 __ LDA #$00
5801 : 85 1e __ STA P3 
5803 : 20 f7 58 JSR $58f7 ; (strchr.l4 + 0)
5806 : a5 2a __ LDA ACCU + 1 
5808 : 05 29 __ ORA ACCU + 0 
580a : f0 6f __ BEQ $587b ; (parse_pasv.s5 + 0)
.s6:
580c : 18 __ __ CLC
580d : a5 29 __ LDA ACCU + 0 
580f : 69 01 __ ADC #$01
5811 : 85 35 __ STA T0 + 0 
5813 : a5 2a __ LDA ACCU + 1 
5815 : 69 00 __ ADC #$00
5817 : 85 36 __ STA T0 + 1 
5819 : a9 00 __ LDA #$00
581b : 85 3d __ STA T4 + 0 ; (ip + 0)
.l7:
581d : 0a __ __ ASL
581e : aa __ __ TAX
581f : a9 00 __ LDA #$00
5821 : 9d a8 9f STA $9fa8,x ; (v[0] + 0)
5824 : 9d a9 9f STA $9fa9,x ; (v[0] + 1)
.l8:
5827 : a0 00 __ LDY #$00
5829 : b1 35 __ LDA (T0 + 0),y 
582b : c9 30 __ CMP #$30
582d : 90 40 __ BCC $586f ; (parse_pasv.s9 + 0)
.s14:
582f : c9 3a __ CMP #$3a
5831 : b0 3c __ BCS $586f ; (parse_pasv.s9 + 0)
.s15:
5833 : bd a8 9f LDA $9fa8,x ; (v[0] + 0)
5836 : 0a __ __ ASL
5837 : 85 15 __ STA WORK + 4 
5839 : bd a9 9f LDA $9fa9,x ; (v[0] + 1)
583c : 2a __ __ ROL
583d : 06 15 __ ASL WORK + 4 
583f : 2a __ __ ROL
5840 : 85 16 __ STA WORK + 5 
5842 : 18 __ __ CLC
5843 : a5 15 __ LDA WORK + 4 
5845 : 7d a8 9f ADC $9fa8,x ; (v[0] + 0)
5848 : 85 29 __ STA ACCU + 0 
584a : a5 16 __ LDA WORK + 5 
584c : 7d a9 9f ADC $9fa9,x ; (v[0] + 1)
584f : 06 29 __ ASL ACCU + 0 
5851 : 2a __ __ ROL
5852 : 85 2a __ STA ACCU + 1 
5854 : b1 35 __ LDA (T0 + 0),y 
5856 : 38 __ __ SEC
5857 : e9 30 __ SBC #$30
5859 : 18 __ __ CLC
585a : 65 29 __ ADC ACCU + 0 
585c : 9d a8 9f STA $9fa8,x ; (v[0] + 0)
585f : a5 2a __ LDA ACCU + 1 
5861 : 69 00 __ ADC #$00
5863 : 9d a9 9f STA $9fa9,x ; (v[0] + 1)
5866 : e6 35 __ INC T0 + 0 
5868 : d0 bd __ BNE $5827 ; (parse_pasv.l8 + 0)
.s17:
586a : e6 36 __ INC T0 + 1 
586c : 4c 27 58 JMP $5827 ; (parse_pasv.l8 + 0)
.s9:
586f : a5 3d __ LDA T4 + 0 ; (ip + 0)
5871 : c9 05 __ CMP #$05
5873 : b0 11 __ BCS $5886 ; (parse_pasv.s10 + 0)
.s12:
5875 : b1 35 __ LDA (T0 + 0),y 
5877 : c9 2c __ CMP #$2c
5879 : f0 05 __ BEQ $5880 ; (parse_pasv.s13 + 0)
.s5:
587b : a9 00 __ LDA #$00
.s3:
587d : 85 29 __ STA ACCU + 0 
587f : 60 __ __ RTS
.s13:
5880 : e6 35 __ INC T0 + 0 
5882 : d0 02 __ BNE $5886 ; (parse_pasv.s10 + 0)
.s16:
5884 : e6 36 __ INC T0 + 1 
.s10:
5886 : e6 3d __ INC T4 + 0 ; (ip + 0)
5888 : a5 3d __ LDA T4 + 0 ; (ip + 0)
588a : c9 06 __ CMP #$06
588c : 90 8f __ BCC $581d ; (parse_pasv.l7 + 0)
.s11:
588e : ad e2 9f LDA $9fe2 ; (sstack + 22)
5891 : 8d d4 9f STA $9fd4 ; (sstack + 8)
5894 : ad e3 9f LDA $9fe3 ; (sstack + 23)
5897 : 8d d5 9f STA $9fd5 ; (sstack + 9)
589a : a9 19 __ LDA #$19
589c : 8d d6 9f STA $9fd6 ; (sstack + 10)
589f : a9 59 __ LDA #$59
58a1 : 8d d7 9f STA $9fd7 ; (sstack + 11)
58a4 : ad a8 9f LDA $9fa8 ; (v[0] + 0)
58a7 : 8d d8 9f STA $9fd8 ; (sstack + 12)
58aa : ad a9 9f LDA $9fa9 ; (v[0] + 1)
58ad : 8d d9 9f STA $9fd9 ; (sstack + 13)
58b0 : ad aa 9f LDA $9faa ; (v[0] + 2)
58b3 : 8d da 9f STA $9fda ; (sstack + 14)
58b6 : ad ab 9f LDA $9fab ; (v[0] + 3)
58b9 : 8d db 9f STA $9fdb ; (sstack + 15)
58bc : ad ac 9f LDA $9fac ; (v[0] + 4)
58bf : 8d dc 9f STA $9fdc ; (sstack + 16)
58c2 : ad ad 9f LDA $9fad ; (v[0] + 5)
58c5 : 8d dd 9f STA $9fdd ; (sstack + 17)
58c8 : ad ae 9f LDA $9fae ; (v[0] + 6)
58cb : 8d de 9f STA $9fde ; (sstack + 18)
58ce : ad af 9f LDA $9faf ; (v[0] + 7)
58d1 : 8d df 9f STA $9fdf ; (sstack + 19)
58d4 : 20 3a 50 JSR $503a ; (sprintf.s4 + 0)
58d7 : ad e4 9f LDA $9fe4 ; (sstack + 24)
58da : 85 37 __ STA T1 + 0 
58dc : ad e5 9f LDA $9fe5 ; (sstack + 25)
58df : 85 38 __ STA T1 + 1 
58e1 : ad b3 9f LDA $9fb3 ; (v[0] + 11)
58e4 : 18 __ __ CLC
58e5 : 6d b0 9f ADC $9fb0 ; (v[0] + 8)
58e8 : aa __ __ TAX
58e9 : ad b2 9f LDA $9fb2 ; (v[0] + 10)
58ec : a0 00 __ LDY #$00
58ee : 91 37 __ STA (T1 + 0),y 
58f0 : 8a __ __ TXA
58f1 : c8 __ __ INY
58f2 : 91 37 __ STA (T1 + 0),y 
58f4 : 98 __ __ TYA
58f5 : d0 86 __ BNE $587d ; (parse_pasv.s3 + 0)
--------------------------------------------------------------------
strchr: ; strchr(const u8*,i16)->u8*
;  18, "/mnt/d/F256/oscar64/include/string.h"
.l4:
58f7 : a0 00 __ LDY #$00
58f9 : b1 1b __ LDA (P0),y ; (str + 0)
58fb : c5 1d __ CMP P2 ; (ch + 0)
58fd : d0 09 __ BNE $5908 ; (strchr.s6 + 0)
.s5:
58ff : a5 1b __ LDA P0 ; (str + 0)
5901 : 85 29 __ STA ACCU + 0 
5903 : a5 1c __ LDA P1 ; (str + 1)
.s3:
5905 : 85 2a __ STA ACCU + 1 
5907 : 60 __ __ RTS
.s6:
5908 : aa __ __ TAX
5909 : f0 09 __ BEQ $5914 ; (strchr.s7 + 0)
.s8:
590b : e6 1b __ INC P0 ; (str + 0)
590d : d0 e8 __ BNE $58f7 ; (strchr.l4 + 0)
.s9:
590f : e6 1c __ INC P1 ; (str + 1)
5911 : 4c f7 58 JMP $58f7 ; (strchr.l4 + 0)
.s7:
5914 : 85 29 __ STA ACCU + 0 
5916 : 4c 05 59 JMP $5905 ; (strchr.s3 + 0)
--------------------------------------------------------------------
5919 : __ __ __ BYT 25 75 2e 25 75 2e 25 75 2e 25 75 00             : %u.%u.%u.%u.
--------------------------------------------------------------------
wiz_open_link: ; wiz_open_link(u8,const u8*,u16)->bool
; 859, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s4:
5925 : a9 43 __ LDA #$43
5927 : 8d d4 9f STA $9fd4 ; (sstack + 8)
592a : a9 9f __ LDA #$9f
592c : 8d d5 9f STA $9fd5 ; (sstack + 9)
592f : a9 76 __ LDA #$76
5931 : 8d d6 9f STA $9fd6 ; (sstack + 10)
5934 : a9 59 __ LDA #$59
5936 : 8d d7 9f STA $9fd7 ; (sstack + 11)
5939 : ad e1 9f LDA $9fe1 ; (sstack + 21)
593c : 8d d8 9f STA $9fd8 ; (sstack + 12)
593f : a9 00 __ LDA #$00
5941 : 8d d9 9f STA $9fd9 ; (sstack + 13)
5944 : ad e2 9f LDA $9fe2 ; (sstack + 22)
5947 : 8d da 9f STA $9fda ; (sstack + 14)
594a : ad e3 9f LDA $9fe3 ; (sstack + 23)
594d : 8d db 9f STA $9fdb ; (sstack + 15)
5950 : ad e4 9f LDA $9fe4 ; (sstack + 24)
5953 : 8d dc 9f STA $9fdc ; (sstack + 16)
5956 : ad e5 9f LDA $9fe5 ; (sstack + 25)
5959 : 8d dd 9f STA $9fdd ; (sstack + 17)
595c : 20 3a 50 JSR $503a ; (sprintf.s4 + 0)
595f : a9 43 __ LDA #$43
5961 : 8d dd 9f STA $9fdd ; (sstack + 17)
5964 : a9 9f __ LDA #$9f
5966 : 8d de 9f STA $9fde ; (sstack + 18)
5969 : a9 b8 __ LDA #$b8
596b : 8d df 9f STA $9fdf ; (sstack + 19)
596e : a9 0b __ LDA #$0b
5970 : 8d e0 9f STA $9fe0 ; (sstack + 20)
5973 : 4c c5 19 JMP $19c5 ; (wiz_atcmd.s4 + 0)
--------------------------------------------------------------------
5976 : __ __ __ BYT 41 54 2b 43 49 50 53 54 41 52 54 3d 25 75 2c 22 : AT+CIPSTART=%u,"
5986 : __ __ __ BYT 54 43 50 22 2c 22 25 73 22 2c 25 75 00          : TCP","%s",%u.
--------------------------------------------------------------------
5993 : __ __ __ BYT 44 61 74 61 20 63 6f 6e 6e 65 63 74 69 6f 6e 20 : Data connection 
59a3 : __ __ __ BYT 66 61 69 6c 65 64 00                            : failed.
--------------------------------------------------------------------
ftp_rest: ; ftp_rest(u32)->bool
; 391, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s4:
59aa : a9 dd __ LDA #$dd
59ac : 8d d4 9f STA $9fd4 ; (sstack + 8)
59af : a9 9e __ LDA #$9e
59b1 : 8d d5 9f STA $9fd5 ; (sstack + 9)
59b4 : a9 f7 __ LDA #$f7
59b6 : 8d d6 9f STA $9fd6 ; (sstack + 10)
59b9 : a9 59 __ LDA #$59
59bb : 8d d7 9f STA $9fd7 ; (sstack + 11)
59be : ad e9 9f LDA $9fe9 ; (sstack + 29)
59c1 : 8d d8 9f STA $9fd8 ; (sstack + 12)
59c4 : ad ea 9f LDA $9fea ; (sstack + 30)
59c7 : 8d d9 9f STA $9fd9 ; (sstack + 13)
59ca : ad eb 9f LDA $9feb ; (sstack + 31)
59cd : 8d da 9f STA $9fda ; (sstack + 14)
59d0 : ad ec 9f LDA $9fec ; (sstack + 32)
59d3 : 8d db 9f STA $9fdb ; (sstack + 15)
59d6 : 20 3a 50 JSR $503a ; (sprintf.s4 + 0)
59d9 : a9 dd __ LDA #$dd
59db : 8d e7 9f STA $9fe7 ; (sstack + 27)
59de : a9 9e __ LDA #$9e
59e0 : 8d e8 9f STA $9fe8 ; (sstack + 28)
59e3 : 20 7e 50 JSR $507e ; (ftp_command.s4 + 0)
59e6 : a6 2a __ LDX ACCU + 1 
59e8 : ca __ __ DEX
59e9 : d0 09 __ BNE $59f4 ; (ftp_rest.s6 + 0)
.s8:
59eb : a5 29 __ LDA ACCU + 0 
59ed : c9 5e __ CMP #$5e
59ef : d0 03 __ BNE $59f4 ; (ftp_rest.s6 + 0)
.s5:
59f1 : a9 01 __ LDA #$01
59f3 : 60 __ __ RTS
.s6:
59f4 : a9 00 __ LDA #$00
.s3:
59f6 : 60 __ __ RTS
--------------------------------------------------------------------
59f7 : __ __ __ BYT 52 45 53 54 20 25 6c 75 00                      : REST %lu.
--------------------------------------------------------------------
wiz_close_link: ; wiz_close_link(u8)->bool
; 865, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s4:
5a00 : a9 8b __ LDA #$8b
5a02 : 8d d4 9f STA $9fd4 ; (sstack + 8)
5a05 : a9 9f __ LDA #$9f
5a07 : 8d d5 9f STA $9fd5 ; (sstack + 9)
5a0a : a9 39 __ LDA #$39
5a0c : 8d d6 9f STA $9fd6 ; (sstack + 10)
5a0f : a9 5a __ LDA #$5a
5a11 : 8d d7 9f STA $9fd7 ; (sstack + 11)
5a14 : ad e1 9f LDA $9fe1 ; (sstack + 21)
5a17 : 8d d8 9f STA $9fd8 ; (sstack + 12)
5a1a : a9 00 __ LDA #$00
5a1c : 8d d9 9f STA $9fd9 ; (sstack + 13)
5a1f : 20 3a 50 JSR $503a ; (sprintf.s4 + 0)
5a22 : a9 8b __ LDA #$8b
5a24 : 8d dd 9f STA $9fdd ; (sstack + 17)
5a27 : a9 9f __ LDA #$9f
5a29 : 8d de 9f STA $9fde ; (sstack + 18)
5a2c : a9 f4 __ LDA #$f4
5a2e : 8d df 9f STA $9fdf ; (sstack + 19)
5a31 : a9 01 __ LDA #$01
5a33 : 8d e0 9f STA $9fe0 ; (sstack + 20)
5a36 : 4c c5 19 JMP $19c5 ; (wiz_atcmd.s4 + 0)
--------------------------------------------------------------------
5a39 : __ __ __ BYT 41 54 2b 43 49 50 43 4c 4f 53 45 3d 25 75 00    : AT+CIPCLOSE=%u.
--------------------------------------------------------------------
5a48 : __ __ __ BYT 52 45 54 52 20 25 73 00                         : RETR %s.
--------------------------------------------------------------------
fileClose: ; fileClose(u8*)->i8
;  22, "/mnt/d/F256/f256lib-oscar64/f256lib/f_file.h"
.s4:
5a50 : a9 68 __ LDA #$68
5a52 : 8d cb 7a STA $7acb ; (_kern_target + 0)
5a55 : a9 ff __ LDA #$ff
5a57 : 8d cc 7a STA $7acc ; (_kern_target + 1)
5a5a : ad 64 7a LDA $7a64 ; (kernelArgs + 0)
5a5d : 85 35 __ STA T0 + 0 
5a5f : ad 65 7a LDA $7a65 ; (kernelArgs + 1)
5a62 : 85 36 __ STA T0 + 1 
5a64 : a0 00 __ LDY #$00
5a66 : b1 1b __ LDA (P0),y ; (fd + 0)
5a68 : a0 03 __ LDY #$03
5a6a : 91 35 __ STA (T0 + 0),y 
5a6c : 20 2f 29 JSR $292f ; (_kernelCallWrapper.s4 + 0)
5a6f : a5 1b __ LDA P0 ; (fd + 0)
5a71 : 85 29 __ STA ACCU + 0 
5a73 : a5 1c __ LDA P1 ; (fd + 1)
5a75 : 85 2a __ STA ACCU + 1 
5a77 : 20 dc 78 JSR $78dc ; (crt_free + 0)
.l5:
5a7a : 20 4f 29 JSR $294f ; (kernelNextEvent.s4 + 0)
5a7d : ad 66 7a LDA $7a66 ; (kernelEventData.type + 0)
5a80 : c9 32 __ CMP #$32
5a82 : f0 04 __ BEQ $5a88 ; (fileClose.s7 + 0)
.s6:
5a84 : c9 38 __ CMP #$38
5a86 : d0 f2 __ BNE $5a7a ; (fileClose.l5 + 0)
.s7:
5a88 : a9 ff __ LDA #$ff
.s3:
5a8a : 60 __ __ RTS
--------------------------------------------------------------------
5a8b : __ __ __ BYT 44 6f 77 6e 6c 6f 61 64 20 66 61 69 6c 65 64 20 : Download failed 
5a9b : __ __ __ BYT 61 66 74 65 72 20 00                            : after .
--------------------------------------------------------------------
5aa2 : __ __ __ BYT 20 61 74 74 65 6d 70 74 73 20 28 00             :  attempts (.
--------------------------------------------------------------------
5aae : __ __ __ BYT 20 2f 20 00                                     :  / .
--------------------------------------------------------------------
5ab2 : __ __ __ BYT 20 62 79 74 65 73 29 00                         :  bytes).
--------------------------------------------------------------------
5aba : __ __ __ BYT 44 6f 77 6e 6c 6f 61 64 65 64 20 00             : Downloaded .
--------------------------------------------------------------------
5ac6 : __ __ __ BYT 20 2d 3e 20 00                                  :  -> .
--------------------------------------------------------------------
forceFileHighlight: ; forceFileHighlight(u8,u8,u8,u8)->void
;1305, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s4:
5acb : a5 20 __ LDA P5 ; (whichArea + 0)
5acd : c9 01 __ CMP #$01
5acf : d0 06 __ BNE $5ad7 ; (forceFileHighlight.s5 + 0)
.s8:
5ad1 : a9 27 __ LDA #$27
5ad3 : a2 08 __ LDX #$08
5ad5 : d0 09 __ BNE $5ae0 ; (forceFileHighlight.s7 + 0)
.s5:
5ad7 : c9 02 __ CMP #$02
5ad9 : f0 01 __ BEQ $5adc ; (forceFileHighlight.s6 + 0)
.s3:
5adb : 60 __ __ RTS
.s6:
5adc : a9 4e __ LDA #$4e
5ade : a2 28 __ LDX #$28
.s7:
5ae0 : 86 38 __ STX T3 + 0 
5ae2 : 85 39 __ STA T4 + 0 
5ae4 : a5 1d __ LDA P2 ; (foreColor + 0)
5ae6 : 85 1b __ STA P0 
5ae8 : 0a __ __ ASL
5ae9 : 0a __ __ ASL
5aea : 0a __ __ ASL
5aeb : 0a __ __ ASL
5aec : 45 1e __ EOR P3 ; (backColor + 0)
5aee : 29 f0 __ AND #$f0
5af0 : 45 1e __ EOR P3 ; (backColor + 0)
5af2 : 85 37 __ STA T2 + 0 
5af4 : a5 1e __ LDA P3 ; (backColor + 0)
5af6 : 85 1c __ STA P1 
5af8 : 20 ff 14 JSR $14ff ; (textSetColor.s4 + 0)
5afb : a9 03 __ LDA #$03
5afd : 85 01 __ STA $01 
5aff : a5 1f __ LDA P4 ; (line + 0)
5b01 : 85 29 __ STA ACCU + 0 
5b03 : a9 00 __ LDA #$00
5b05 : 85 35 __ STA T1 + 0 
5b07 : 85 2a __ STA ACCU + 1 
5b09 : 85 2b __ STA ACCU + 2 
5b0b : 85 2c __ STA ACCU + 3 
5b0d : a9 50 __ LDA #$50
5b0f : 20 98 72 JSR $7298 ; (mul32by8 + 0)
5b12 : a6 38 __ LDX T3 + 0 
5b14 : 18 __ __ CLC
.l10:
5b15 : 8a __ __ TXA
5b16 : 65 15 __ ADC WORK + 4 
5b18 : a8 __ __ TAY
5b19 : a5 16 __ LDA WORK + 5 
5b1b : 69 c0 __ ADC #$c0
5b1d : 85 36 __ STA T1 + 1 
5b1f : a5 37 __ LDA T2 + 0 
5b21 : 91 35 __ STA (T1 + 0),y 
5b23 : e8 __ __ INX
5b24 : e4 39 __ CPX T4 + 0 
5b26 : 90 ed __ BCC $5b15 ; (forceFileHighlight.l10 + 0)
.s9:
5b28 : a9 00 __ LDA #$00
5b2a : 85 1c __ STA P1 
5b2c : 85 01 __ STA $01 
5b2e : a9 0f __ LDA #$0f
5b30 : 85 1b __ STA P0 
5b32 : 4c ff 14 JMP $14ff ; (textSetColor.s4 + 0)
--------------------------------------------------------------------
rowFromMouse: ; rowFromMouse(u8*,u8)->bool
;1323, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s4:
5b35 : a5 1d __ LDA P2 ; (whichArea + 0)
5b37 : ae e4 d6 LDX $d6e4 
5b3a : ac e5 d6 LDY $d6e5 
5b3d : 84 2a __ STY ACCU + 1 
5b3f : c9 01 __ CMP #$01
5b41 : f0 04 __ BEQ $5b47 ; (rowFromMouse.s7 + 0)
.s5:
5b43 : c9 02 __ CMP #$02
5b45 : d0 1e __ BNE $5b65 ; (rowFromMouse.s6 + 0)
.s7:
5b47 : 98 __ __ TYA
5b48 : 30 1b __ BMI $5b65 ; (rowFromMouse.s6 + 0)
.s11:
5b4a : d0 04 __ BNE $5b50 ; (rowFromMouse.s8 + 0)
.s10:
5b4c : e0 10 __ CPX #$10
5b4e : 90 15 __ BCC $5b65 ; (rowFromMouse.s6 + 0)
.s8:
5b50 : 8a __ __ TXA
5b51 : 46 2a __ LSR ACCU + 1 
5b53 : 6a __ __ ROR
5b54 : 46 2a __ LSR ACCU + 1 
5b56 : 6a __ __ ROR
5b57 : 46 2a __ LSR ACCU + 1 
5b59 : 6a __ __ ROR
5b5a : c9 2a __ CMP #$2a
5b5c : b0 07 __ BCS $5b65 ; (rowFromMouse.s6 + 0)
.s9:
5b5e : a0 00 __ LDY #$00
5b60 : 91 1b __ STA (P0),y ; (row + 0)
5b62 : a9 01 __ LDA #$01
5b64 : 60 __ __ RTS
.s6:
5b65 : a9 00 __ LDA #$00
.s3:
5b67 : 60 __ __ RTS
--------------------------------------------------------------------
split_args: ; split_args(u8*,u8**,u8**,u8**)->void
;1516, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s4:
5b68 : a9 00 __ LDA #$00
5b6a : a8 __ __ TAY
5b6b : 91 1d __ STA (P2),y ; (cmd + 0)
5b6d : c8 __ __ INY
5b6e : 91 1d __ STA (P2),y ; (cmd + 0)
5b70 : a8 __ __ TAY
5b71 : 91 1f __ STA (P4),y ; (a1 + 0)
5b73 : c8 __ __ INY
5b74 : 91 1f __ STA (P4),y ; (a1 + 0)
5b76 : a8 __ __ TAY
5b77 : 91 21 __ STA (P6),y ; (a2 + 0)
5b79 : c8 __ __ INY
5b7a : 91 21 __ STA (P6),y ; (a2 + 0)
5b7c : a5 1b __ LDA P0 ; (line + 0)
5b7e : 85 35 __ STA T1 + 0 
5b80 : a5 1c __ LDA P1 ; (line + 1)
5b82 : 85 36 __ STA T1 + 1 
5b84 : 88 __ __ DEY
5b85 : b1 1b __ LDA (P0),y ; (line + 0)
5b87 : c9 20 __ CMP #$20
5b89 : d0 13 __ BNE $5b9e ; (split_args.s5 + 0)
.s21:
5b8b : 84 35 __ STY T1 + 0 
5b8d : a4 1b __ LDY P0 ; (line + 0)
.l22:
5b8f : c8 __ __ INY
5b90 : d0 02 __ BNE $5b94 ; (split_args.s29 + 0)
.s28:
5b92 : e6 36 __ INC T1 + 1 
.s29:
5b94 : b1 35 __ LDA (T1 + 0),y 
5b96 : c9 20 __ CMP #$20
5b98 : f0 f5 __ BEQ $5b8f ; (split_args.l22 + 0)
.s23:
5b9a : 84 35 __ STY T1 + 0 
5b9c : a0 00 __ LDY #$00
.s5:
5b9e : b1 35 __ LDA (T1 + 0),y 
5ba0 : f0 24 __ BEQ $5bc6 ; (split_args.s3 + 0)
.s6:
5ba2 : aa __ __ TAX
5ba3 : a5 35 __ LDA T1 + 0 
5ba5 : 91 1d __ STA (P2),y ; (cmd + 0)
5ba7 : a5 36 __ LDA T1 + 1 
5ba9 : a0 01 __ LDY #$01
5bab : 91 1d __ STA (P2),y ; (cmd + 0)
5bad : 8a __ __ TXA
5bae : d0 04 __ BNE $5bb4 ; (split_args.l19 + 0)
.s38:
5bb0 : a8 __ __ TAY
5bb1 : 4c c7 5b JMP $5bc7 ; (split_args.s7 + 0)
.l19:
5bb4 : a0 00 __ LDY #$00
5bb6 : b1 35 __ LDA (T1 + 0),y 
5bb8 : c9 20 __ CMP #$20
5bba : f0 0b __ BEQ $5bc7 ; (split_args.s7 + 0)
.s20:
5bbc : e6 35 __ INC T1 + 0 
5bbe : d0 02 __ BNE $5bc2 ; (split_args.s37 + 0)
.s36:
5bc0 : e6 36 __ INC T1 + 1 
.s37:
5bc2 : b1 35 __ LDA (T1 + 0),y 
5bc4 : d0 ee __ BNE $5bb4 ; (split_args.l19 + 0)
.s3:
5bc6 : 60 __ __ RTS
.s7:
5bc7 : b1 35 __ LDA (T1 + 0),y 
5bc9 : f0 fb __ BEQ $5bc6 ; (split_args.s3 + 0)
.s8:
5bcb : 98 __ __ TYA
5bcc : 91 35 __ STA (T1 + 0),y 
5bce : 18 __ __ CLC
5bcf : a5 35 __ LDA T1 + 0 
5bd1 : 69 01 __ ADC #$01
5bd3 : 85 29 __ STA ACCU + 0 
5bd5 : a5 36 __ LDA T1 + 1 
5bd7 : 69 00 __ ADC #$00
5bd9 : 85 2a __ STA ACCU + 1 
5bdb : a0 01 __ LDY #$01
5bdd : b1 35 __ LDA (T1 + 0),y 
5bdf : c9 20 __ CMP #$20
5be1 : d0 13 __ BNE $5bf6 ; (split_args.s9 + 0)
.s18:
5be3 : a9 00 __ LDA #$00
5be5 : a4 29 __ LDY ACCU + 0 
5be7 : 85 29 __ STA ACCU + 0 
.l24:
5be9 : c8 __ __ INY
5bea : d0 02 __ BNE $5bee ; (split_args.s31 + 0)
.s30:
5bec : e6 2a __ INC ACCU + 1 
.s31:
5bee : b1 29 __ LDA (ACCU + 0),y 
5bf0 : c9 20 __ CMP #$20
5bf2 : f0 f5 __ BEQ $5be9 ; (split_args.l24 + 0)
.s25:
5bf4 : 84 29 __ STY ACCU + 0 
.s9:
5bf6 : a0 00 __ LDY #$00
5bf8 : b1 29 __ LDA (ACCU + 0),y 
5bfa : f0 ca __ BEQ $5bc6 ; (split_args.s3 + 0)
.s10:
5bfc : aa __ __ TAX
5bfd : a5 29 __ LDA ACCU + 0 
5bff : 91 1f __ STA (P4),y ; (a1 + 0)
5c01 : a5 2a __ LDA ACCU + 1 
5c03 : c8 __ __ INY
5c04 : 91 1f __ STA (P4),y ; (a1 + 0)
5c06 : 8a __ __ TXA
5c07 : d0 04 __ BNE $5c0d ; (split_args.l16 + 0)
.s39:
5c09 : a8 __ __ TAY
5c0a : 4c 15 5c JMP $5c15 ; (split_args.s11 + 0)
.l16:
5c0d : a0 00 __ LDY #$00
5c0f : b1 29 __ LDA (ACCU + 0),y 
5c11 : c9 20 __ CMP #$20
5c13 : d0 40 __ BNE $5c55 ; (split_args.s17 + 0)
.s11:
5c15 : b1 29 __ LDA (ACCU + 0),y 
5c17 : f0 ad __ BEQ $5bc6 ; (split_args.s3 + 0)
.s12:
5c19 : 98 __ __ TYA
5c1a : 91 29 __ STA (ACCU + 0),y 
5c1c : 18 __ __ CLC
5c1d : a5 29 __ LDA ACCU + 0 
5c1f : 69 01 __ ADC #$01
5c21 : 85 35 __ STA T1 + 0 
5c23 : a5 2a __ LDA ACCU + 1 
5c25 : 69 00 __ ADC #$00
5c27 : 85 36 __ STA T1 + 1 
5c29 : a0 01 __ LDY #$01
5c2b : b1 29 __ LDA (ACCU + 0),y 
5c2d : c9 20 __ CMP #$20
5c2f : d0 13 __ BNE $5c44 ; (split_args.s13 + 0)
.s15:
5c31 : a9 00 __ LDA #$00
5c33 : a4 35 __ LDY T1 + 0 
5c35 : 85 35 __ STA T1 + 0 
.l26:
5c37 : c8 __ __ INY
5c38 : d0 02 __ BNE $5c3c ; (split_args.s33 + 0)
.s32:
5c3a : e6 36 __ INC T1 + 1 
.s33:
5c3c : b1 35 __ LDA (T1 + 0),y 
5c3e : c9 20 __ CMP #$20
5c40 : f0 f5 __ BEQ $5c37 ; (split_args.l26 + 0)
.s27:
5c42 : 84 35 __ STY T1 + 0 
.s13:
5c44 : a0 00 __ LDY #$00
5c46 : b1 35 __ LDA (T1 + 0),y 
5c48 : d0 01 __ BNE $5c4b ; (split_args.s14 + 0)
5c4a : 60 __ __ RTS
.s14:
5c4b : a5 35 __ LDA T1 + 0 
5c4d : 91 21 __ STA (P6),y ; (a2 + 0)
5c4f : a5 36 __ LDA T1 + 1 
5c51 : c8 __ __ INY
5c52 : 91 21 __ STA (P6),y ; (a2 + 0)
5c54 : 60 __ __ RTS
.s17:
5c55 : e6 29 __ INC ACCU + 0 
5c57 : d0 02 __ BNE $5c5b ; (split_args.s35 + 0)
.s34:
5c59 : e6 2a __ INC ACCU + 1 
.s35:
5c5b : b1 29 __ LDA (ACCU + 0),y 
5c5d : d0 ae __ BNE $5c0d ; (split_args.l16 + 0)
5c5f : 60 __ __ RTS
--------------------------------------------------------------------
5c60 : __ __ __ BYT 68 65 6c 70 00                                  : help.
--------------------------------------------------------------------
print_help: ; print_help()->void
;1548, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s1:
5c65 : a5 55 __ LDA T6 + 0 
5c67 : 8d 83 9f STA $9f83 ; (print_help@stack + 0)
.s4:
5c6a : a9 a0 __ LDA #$a0
5c6c : 8d 88 9f STA $9f88 ; (topLine[0] + 0)
5c6f : a9 00 __ LDA #$00
5c71 : 8d e0 d6 STA $d6e0 
5c74 : 8d 87 9f STA $9f87 ; (aCol[0] + 1)
5c77 : 85 49 __ STA T1 + 0 
5c79 : 85 4a __ STA T1 + 1 
5c7b : 85 4c __ STA T1 + 3 
5c7d : 85 4d __ STA T2 + 0 
5c7f : 85 50 __ STA T2 + 3 
5c81 : a9 82 __ LDA #$82
5c83 : 8d 86 9f STA $9f86 ; (aCol[0] + 0)
5c86 : a9 02 __ LDA #$02
5c88 : 85 4b __ STA T1 + 2 
5c8a : 85 4f __ STA T2 + 2 
5c8c : a9 08 __ LDA #$08
5c8e : 85 4e __ STA T2 + 1 
5c90 : a9 96 __ LDA #$96
5c92 : a2 3e __ LDX #$3e
.l15:
5c94 : 9d 89 9f STA $9f89,x ; (topLine[0] + 1)
5c97 : ca __ __ DEX
5c98 : 10 fa __ BPL $5c94 ; (print_help.l15 + 0)
.s16:
5c9a : a9 02 __ LDA #$02
5c9c : 85 01 __ STA $01 
5c9e : a9 a1 __ LDA #$a1
5ca0 : 8d c8 9f STA $9fc8 ; (topLine[0] + 64)
5ca3 : a9 00 __ LDA #$00
5ca5 : 8d c9 9f STA $9fc9 ; (topLine[0] + 65)
5ca8 : a9 03 __ LDA #$03
5caa : 85 53 __ STA T4 + 0 
.l5:
5cac : 85 29 __ STA ACCU + 0 
5cae : a9 00 __ LDA #$00
5cb0 : 85 2a __ STA ACCU + 1 
5cb2 : 85 2b __ STA ACCU + 2 
5cb4 : 85 2c __ STA ACCU + 3 
5cb6 : a9 50 __ LDA #$50
5cb8 : 20 98 72 JSR $7298 ; (mul32by8 + 0)
5cbb : a5 15 __ LDA WORK + 4 
5cbd : 85 51 __ STA T3 + 0 
5cbf : a5 16 __ LDA WORK + 5 
5cc1 : 85 52 __ STA T3 + 1 
5cc3 : a5 49 __ LDA T1 + 0 
5cc5 : 85 1b __ STA P0 
5cc7 : a9 02 __ LDA #$02
5cc9 : 85 54 __ STA T5 + 0 
5ccb : a5 4a __ LDA T1 + 1 
5ccd : 85 1c __ STA P1 
5ccf : a5 4c __ LDA T1 + 3 
5cd1 : 85 1e __ STA P3 
5cd3 : 18 __ __ CLC
.l23:
5cd4 : a5 4b __ LDA T1 + 2 
5cd6 : 85 1d __ STA P2 
5cd8 : a5 54 __ LDA T5 + 0 
5cda : 65 51 __ ADC T3 + 0 
5cdc : 85 35 __ STA T0 + 0 
5cde : a5 52 __ LDA T3 + 1 
5ce0 : 69 c0 __ ADC #$c0
5ce2 : 85 36 __ STA T0 + 1 
5ce4 : a0 00 __ LDY #$00
5ce6 : b1 35 __ LDA (T0 + 0),y 
5ce8 : 85 1f __ STA P4 
5cea : 20 cc 14 JSR $14cc ; (FAR_POKE.s4 + 0)
5ced : e6 1b __ INC P0 
5cef : d0 0a __ BNE $5cfb ; (print_help.s26 + 0)
.s39:
5cf1 : e6 1c __ INC P1 
5cf3 : d0 06 __ BNE $5cfb ; (print_help.s26 + 0)
.s35:
5cf5 : e6 4b __ INC T1 + 2 
5cf7 : d0 02 __ BNE $5cfb ; (print_help.s26 + 0)
.s25:
5cf9 : e6 1e __ INC P3 
.s26:
5cfb : e6 54 __ INC T5 + 0 
5cfd : a5 54 __ LDA T5 + 0 
5cff : c9 43 __ CMP #$43
5d01 : 90 d1 __ BCC $5cd4 ; (print_help.l23 + 0)
.s17:
5d03 : a5 1e __ LDA P3 
5d05 : 85 4c __ STA T1 + 3 
5d07 : a5 1c __ LDA P1 
5d09 : 85 4a __ STA T1 + 1 
5d0b : a5 1b __ LDA P0 
5d0d : 85 49 __ STA T1 + 0 
5d0f : e6 53 __ INC T4 + 0 
5d11 : a5 53 __ LDA T4 + 0 
5d13 : c9 17 __ CMP #$17
5d15 : 90 95 __ BCC $5cac ; (print_help.l5 + 0)
.s6:
5d17 : a9 03 __ LDA #$03
5d19 : 85 01 __ STA $01 
5d1b : 85 51 __ STA T3 + 0 
.l7:
5d1d : 85 29 __ STA ACCU + 0 
5d1f : a9 00 __ LDA #$00
5d21 : 85 2a __ STA ACCU + 1 
5d23 : 85 2b __ STA ACCU + 2 
5d25 : 85 2c __ STA ACCU + 3 
5d27 : a9 50 __ LDA #$50
5d29 : 20 98 72 JSR $7298 ; (mul32by8 + 0)
5d2c : a5 15 __ LDA WORK + 4 
5d2e : 85 49 __ STA T1 + 0 
5d30 : a5 16 __ LDA WORK + 5 
5d32 : 85 4a __ STA T1 + 1 
5d34 : a5 17 __ LDA WORK + 6 
5d36 : 85 4b __ STA T1 + 2 
5d38 : a5 18 __ LDA WORK + 7 
5d3a : 85 4c __ STA T1 + 3 
5d3c : a5 4d __ LDA T2 + 0 
5d3e : 85 1b __ STA P0 
5d40 : a9 02 __ LDA #$02
5d42 : 85 53 __ STA T4 + 0 
5d44 : a5 4e __ LDA T2 + 1 
5d46 : 85 1c __ STA P1 
5d48 : a5 50 __ LDA T2 + 3 
5d4a : 85 1e __ STA P3 
5d4c : 18 __ __ CLC
.l24:
5d4d : a5 4f __ LDA T2 + 2 
5d4f : 85 1d __ STA P2 
5d51 : a5 53 __ LDA T4 + 0 
5d53 : 65 49 __ ADC T1 + 0 
5d55 : 85 35 __ STA T0 + 0 
5d57 : a5 4a __ LDA T1 + 1 
5d59 : 69 c0 __ ADC #$c0
5d5b : 85 36 __ STA T0 + 1 
5d5d : a5 4b __ LDA T1 + 2 
5d5f : 69 00 __ ADC #$00
5d61 : 85 37 __ STA T0 + 2 
5d63 : a5 4c __ LDA T1 + 3 
5d65 : 69 00 __ ADC #$00
5d67 : 85 38 __ STA T0 + 3 
5d69 : a0 00 __ LDY #$00
5d6b : b1 35 __ LDA (T0 + 0),y 
5d6d : 85 1f __ STA P4 
5d6f : 20 cc 14 JSR $14cc ; (FAR_POKE.s4 + 0)
5d72 : e6 1b __ INC P0 
5d74 : d0 0a __ BNE $5d80 ; (print_help.s28 + 0)
.s40:
5d76 : e6 1c __ INC P1 
5d78 : d0 06 __ BNE $5d80 ; (print_help.s28 + 0)
.s36:
5d7a : e6 4f __ INC T2 + 2 
5d7c : d0 02 __ BNE $5d80 ; (print_help.s28 + 0)
.s27:
5d7e : e6 1e __ INC P3 
.s28:
5d80 : e6 53 __ INC T4 + 0 
5d82 : a5 53 __ LDA T4 + 0 
5d84 : c9 43 __ CMP #$43
5d86 : 90 c5 __ BCC $5d4d ; (print_help.l24 + 0)
.s18:
5d88 : a5 1e __ LDA P3 
5d8a : 85 50 __ STA T2 + 3 
5d8c : a5 1c __ LDA P1 
5d8e : 85 4e __ STA T2 + 1 
5d90 : a5 1b __ LDA P0 
5d92 : 85 4d __ STA T2 + 0 
5d94 : e6 51 __ INC T3 + 0 
5d96 : a5 51 __ LDA T3 + 0 
5d98 : c9 17 __ CMP #$17
5d9a : 90 81 __ BCC $5d1d ; (print_help.l7 + 0)
.s8:
5d9c : a9 0e __ LDA #$0e
5d9e : 85 1b __ STA P0 
5da0 : a9 06 __ LDA #$06
5da2 : 85 1c __ STA P1 
5da4 : a9 00 __ LDA #$00
5da6 : 85 01 __ STA $01 
5da8 : 20 ff 14 JSR $14ff ; (textSetColor.s4 + 0)
5dab : a9 02 __ LDA #$02
5dad : 85 1b __ STA P0 
5daf : a9 03 __ LDA #$03
5db1 : 85 1c __ STA P1 
5db3 : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
5db6 : a9 88 __ LDA #$88
5db8 : 85 23 __ STA P8 
5dba : a9 9f __ LDA #$9f
5dbc : 85 24 __ STA P9 
5dbe : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
5dc1 : a9 43 __ LDA #$43
5dc3 : 85 25 __ STA P10 
5dc5 : 20 04 63 JSR $6304 ; (fillSpaceToEnd.s4 + 0)
5dc8 : a9 02 __ LDA #$02
5dca : 85 25 __ STA P10 
5dcc : a9 03 __ LDA #$03
5dce : 8d cc 9f STA $9fcc ; (sstack + 0)
5dd1 : a9 43 __ LDA #$43
5dd3 : 85 26 __ STA P11 
5dd5 : a9 17 __ LDA #$17
5dd7 : 8d cd 9f STA $9fcd ; (sstack + 1)
5dda : 20 bb 17 JSR $17bb ; (textPrintNewLine.s4 + 0)
5ddd : a9 86 __ LDA #$86
5ddf : 85 23 __ STA P8 
5de1 : a9 9f __ LDA #$9f
5de3 : 85 24 __ STA P9 
5de5 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
5de8 : a9 0d __ LDA #$0d
5dea : 85 1b __ STA P0 
5dec : a9 06 __ LDA #$06
5dee : 85 1c __ STA P1 
5df0 : 20 ff 14 JSR $14ff ; (textSetColor.s4 + 0)
5df3 : a9 34 __ LDA #$34
5df5 : 85 35 __ STA T0 + 0 
5df7 : 85 23 __ STA P8 
5df9 : a9 63 __ LDA #$63
5dfb : 85 36 __ STA T0 + 1 
5dfd : 85 24 __ STA P9 
5dff : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
5e02 : a9 42 __ LDA #$42
5e04 : 85 25 __ STA P10 
5e06 : 20 04 63 JSR $6304 ; (fillSpaceToEnd.s4 + 0)
5e09 : a9 0e __ LDA #$0e
5e0b : 85 1b __ STA P0 
5e0d : a9 06 __ LDA #$06
5e0f : 85 1c __ STA P1 
5e11 : 20 ff 14 JSR $14ff ; (textSetColor.s4 + 0)
5e14 : a9 86 __ LDA #$86
5e16 : 85 23 __ STA P8 
5e18 : a9 9f __ LDA #$9f
5e1a : 85 24 __ STA P9 
5e1c : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
5e1f : a9 02 __ LDA #$02
5e21 : 85 25 __ STA P10 
5e23 : a9 03 __ LDA #$03
5e25 : 8d cc 9f STA $9fcc ; (sstack + 0)
5e28 : a9 17 __ LDA #$17
5e2a : 8d cd 9f STA $9fcd ; (sstack + 1)
5e2d : 20 bb 17 JSR $17bb ; (textPrintNewLine.s4 + 0)
5e30 : a9 0e __ LDA #$0e
5e32 : 85 1b __ STA P0 
5e34 : a9 06 __ LDA #$06
5e36 : 85 1c __ STA P1 
5e38 : 20 ff 14 JSR $14ff ; (textSetColor.s4 + 0)
5e3b : a9 86 __ LDA #$86
5e3d : 85 23 __ STA P8 
5e3f : a9 9f __ LDA #$9f
5e41 : 85 24 __ STA P9 
5e43 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
5e46 : a9 68 __ LDA #$68
5e48 : 85 35 __ STA T0 + 0 
5e4a : 85 23 __ STA P8 
5e4c : a9 63 __ LDA #$63
5e4e : 85 36 __ STA T0 + 1 
5e50 : 85 24 __ STA P9 
5e52 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
5e55 : a9 42 __ LDA #$42
5e57 : 85 25 __ STA P10 
5e59 : 20 04 63 JSR $6304 ; (fillSpaceToEnd.s4 + 0)
5e5c : a9 86 __ LDA #$86
5e5e : 85 23 __ STA P8 
5e60 : a9 9f __ LDA #$9f
5e62 : 85 24 __ STA P9 
5e64 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
5e67 : a9 02 __ LDA #$02
5e69 : 85 25 __ STA P10 
5e6b : a9 03 __ LDA #$03
5e6d : 8d cc 9f STA $9fcc ; (sstack + 0)
5e70 : a9 17 __ LDA #$17
5e72 : 8d cd 9f STA $9fcd ; (sstack + 1)
5e75 : 20 bb 17 JSR $17bb ; (textPrintNewLine.s4 + 0)
5e78 : a9 86 __ LDA #$86
5e7a : 85 23 __ STA P8 
5e7c : a9 9f __ LDA #$9f
5e7e : 85 24 __ STA P9 
5e80 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
5e83 : a9 90 __ LDA #$90
5e85 : 85 35 __ STA T0 + 0 
5e87 : 85 23 __ STA P8 
5e89 : a9 63 __ LDA #$63
5e8b : 85 36 __ STA T0 + 1 
5e8d : 85 24 __ STA P9 
5e8f : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
5e92 : a9 42 __ LDA #$42
5e94 : 85 25 __ STA P10 
5e96 : 20 04 63 JSR $6304 ; (fillSpaceToEnd.s4 + 0)
5e99 : a9 86 __ LDA #$86
5e9b : 85 23 __ STA P8 
5e9d : a9 9f __ LDA #$9f
5e9f : 85 24 __ STA P9 
5ea1 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
5ea4 : a9 02 __ LDA #$02
5ea6 : 85 25 __ STA P10 
5ea8 : a9 03 __ LDA #$03
5eaa : 8d cc 9f STA $9fcc ; (sstack + 0)
5ead : a9 17 __ LDA #$17
5eaf : 8d cd 9f STA $9fcd ; (sstack + 1)
5eb2 : 20 bb 17 JSR $17bb ; (textPrintNewLine.s4 + 0)
5eb5 : a9 86 __ LDA #$86
5eb7 : 85 23 __ STA P8 
5eb9 : a9 9f __ LDA #$9f
5ebb : 85 24 __ STA P9 
5ebd : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
5ec0 : a9 b9 __ LDA #$b9
5ec2 : 85 35 __ STA T0 + 0 
5ec4 : 85 23 __ STA P8 
5ec6 : a9 63 __ LDA #$63
5ec8 : 85 36 __ STA T0 + 1 
5eca : 85 24 __ STA P9 
5ecc : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
5ecf : a9 42 __ LDA #$42
5ed1 : 85 25 __ STA P10 
5ed3 : 20 04 63 JSR $6304 ; (fillSpaceToEnd.s4 + 0)
5ed6 : a9 86 __ LDA #$86
5ed8 : 85 23 __ STA P8 
5eda : a9 9f __ LDA #$9f
5edc : 85 24 __ STA P9 
5ede : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
5ee1 : a9 02 __ LDA #$02
5ee3 : 85 25 __ STA P10 
5ee5 : a9 03 __ LDA #$03
5ee7 : 8d cc 9f STA $9fcc ; (sstack + 0)
5eea : a9 17 __ LDA #$17
5eec : 8d cd 9f STA $9fcd ; (sstack + 1)
5eef : 20 bb 17 JSR $17bb ; (textPrintNewLine.s4 + 0)
5ef2 : a9 86 __ LDA #$86
5ef4 : 85 23 __ STA P8 
5ef6 : a9 9f __ LDA #$9f
5ef8 : 85 24 __ STA P9 
5efa : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
5efd : a9 00 __ LDA #$00
5eff : 85 35 __ STA T0 + 0 
5f01 : 85 23 __ STA P8 
5f03 : a9 64 __ LDA #$64
5f05 : 85 36 __ STA T0 + 1 
5f07 : 85 24 __ STA P9 
5f09 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
5f0c : a9 42 __ LDA #$42
5f0e : 85 25 __ STA P10 
5f10 : 20 04 63 JSR $6304 ; (fillSpaceToEnd.s4 + 0)
5f13 : a9 86 __ LDA #$86
5f15 : 85 23 __ STA P8 
5f17 : a9 9f __ LDA #$9f
5f19 : 85 24 __ STA P9 
5f1b : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
5f1e : a9 02 __ LDA #$02
5f20 : 85 25 __ STA P10 
5f22 : a9 03 __ LDA #$03
5f24 : 8d cc 9f STA $9fcc ; (sstack + 0)
5f27 : a9 17 __ LDA #$17
5f29 : 8d cd 9f STA $9fcd ; (sstack + 1)
5f2c : 20 bb 17 JSR $17bb ; (textPrintNewLine.s4 + 0)
5f2f : a9 86 __ LDA #$86
5f31 : 85 23 __ STA P8 
5f33 : a9 9f __ LDA #$9f
5f35 : 85 24 __ STA P9 
5f37 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
5f3a : a9 1e __ LDA #$1e
5f3c : 85 35 __ STA T0 + 0 
5f3e : 85 23 __ STA P8 
5f40 : a9 64 __ LDA #$64
5f42 : 85 36 __ STA T0 + 1 
5f44 : 85 24 __ STA P9 
5f46 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
5f49 : a9 42 __ LDA #$42
5f4b : 85 25 __ STA P10 
5f4d : 20 04 63 JSR $6304 ; (fillSpaceToEnd.s4 + 0)
5f50 : a9 86 __ LDA #$86
5f52 : 85 23 __ STA P8 
5f54 : a9 9f __ LDA #$9f
5f56 : 85 24 __ STA P9 
5f58 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
5f5b : a9 02 __ LDA #$02
5f5d : 85 25 __ STA P10 
5f5f : a9 03 __ LDA #$03
5f61 : 8d cc 9f STA $9fcc ; (sstack + 0)
5f64 : a9 17 __ LDA #$17
5f66 : 8d cd 9f STA $9fcd ; (sstack + 1)
5f69 : 20 bb 17 JSR $17bb ; (textPrintNewLine.s4 + 0)
5f6c : a9 86 __ LDA #$86
5f6e : 85 23 __ STA P8 
5f70 : a9 9f __ LDA #$9f
5f72 : 85 24 __ STA P9 
5f74 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
5f77 : a9 44 __ LDA #$44
5f79 : 85 35 __ STA T0 + 0 
5f7b : 85 23 __ STA P8 
5f7d : a9 64 __ LDA #$64
5f7f : 85 36 __ STA T0 + 1 
5f81 : 85 24 __ STA P9 
5f83 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
5f86 : a9 42 __ LDA #$42
5f88 : 85 25 __ STA P10 
5f8a : 20 04 63 JSR $6304 ; (fillSpaceToEnd.s4 + 0)
5f8d : a9 86 __ LDA #$86
5f8f : 85 23 __ STA P8 
5f91 : a9 9f __ LDA #$9f
5f93 : 85 24 __ STA P9 
5f95 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
5f98 : a9 02 __ LDA #$02
5f9a : 85 25 __ STA P10 
5f9c : a9 03 __ LDA #$03
5f9e : 8d cc 9f STA $9fcc ; (sstack + 0)
5fa1 : a9 17 __ LDA #$17
5fa3 : 8d cd 9f STA $9fcd ; (sstack + 1)
5fa6 : 20 bb 17 JSR $17bb ; (textPrintNewLine.s4 + 0)
5fa9 : a9 86 __ LDA #$86
5fab : 85 23 __ STA P8 
5fad : a9 9f __ LDA #$9f
5faf : 85 24 __ STA P9 
5fb1 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
5fb4 : a9 73 __ LDA #$73
5fb6 : 85 35 __ STA T0 + 0 
5fb8 : 85 23 __ STA P8 
5fba : a9 64 __ LDA #$64
5fbc : 85 36 __ STA T0 + 1 
5fbe : 85 24 __ STA P9 
5fc0 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
5fc3 : a9 42 __ LDA #$42
5fc5 : 85 25 __ STA P10 
5fc7 : 20 04 63 JSR $6304 ; (fillSpaceToEnd.s4 + 0)
5fca : a9 86 __ LDA #$86
5fcc : 85 23 __ STA P8 
5fce : a9 9f __ LDA #$9f
5fd0 : 85 24 __ STA P9 
5fd2 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
5fd5 : a9 02 __ LDA #$02
5fd7 : 85 25 __ STA P10 
5fd9 : a9 03 __ LDA #$03
5fdb : 8d cc 9f STA $9fcc ; (sstack + 0)
5fde : a9 17 __ LDA #$17
5fe0 : 8d cd 9f STA $9fcd ; (sstack + 1)
5fe3 : 20 bb 17 JSR $17bb ; (textPrintNewLine.s4 + 0)
5fe6 : a9 86 __ LDA #$86
5fe8 : 85 23 __ STA P8 
5fea : a9 9f __ LDA #$9f
5fec : 85 24 __ STA P9 
5fee : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
5ff1 : a9 a1 __ LDA #$a1
5ff3 : 85 35 __ STA T0 + 0 
5ff5 : 85 23 __ STA P8 
5ff7 : a9 64 __ LDA #$64
5ff9 : 85 36 __ STA T0 + 1 
5ffb : 85 24 __ STA P9 
5ffd : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
6000 : a9 42 __ LDA #$42
6002 : 85 25 __ STA P10 
6004 : 20 04 63 JSR $6304 ; (fillSpaceToEnd.s4 + 0)
6007 : a9 86 __ LDA #$86
6009 : 85 23 __ STA P8 
600b : a9 9f __ LDA #$9f
600d : 85 24 __ STA P9 
600f : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
6012 : a9 02 __ LDA #$02
6014 : 85 25 __ STA P10 
6016 : a9 03 __ LDA #$03
6018 : 8d cc 9f STA $9fcc ; (sstack + 0)
601b : a9 17 __ LDA #$17
601d : 8d cd 9f STA $9fcd ; (sstack + 1)
6020 : 20 bb 17 JSR $17bb ; (textPrintNewLine.s4 + 0)
6023 : a9 86 __ LDA #$86
6025 : 85 23 __ STA P8 
6027 : a9 9f __ LDA #$9f
6029 : 85 24 __ STA P9 
602b : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
602e : a9 d0 __ LDA #$d0
6030 : 85 35 __ STA T0 + 0 
6032 : 85 23 __ STA P8 
6034 : a9 64 __ LDA #$64
6036 : 85 36 __ STA T0 + 1 
6038 : 85 24 __ STA P9 
603a : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
603d : a9 42 __ LDA #$42
603f : 85 25 __ STA P10 
6041 : 20 04 63 JSR $6304 ; (fillSpaceToEnd.s4 + 0)
6044 : a9 86 __ LDA #$86
6046 : 85 23 __ STA P8 
6048 : a9 9f __ LDA #$9f
604a : 85 24 __ STA P9 
604c : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
604f : a9 02 __ LDA #$02
6051 : 85 25 __ STA P10 
6053 : a9 03 __ LDA #$03
6055 : 8d cc 9f STA $9fcc ; (sstack + 0)
6058 : a9 17 __ LDA #$17
605a : 8d cd 9f STA $9fcd ; (sstack + 1)
605d : 20 bb 17 JSR $17bb ; (textPrintNewLine.s4 + 0)
6060 : a9 86 __ LDA #$86
6062 : 85 23 __ STA P8 
6064 : a9 9f __ LDA #$9f
6066 : 85 24 __ STA P9 
6068 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
606b : a9 00 __ LDA #$00
606d : 85 35 __ STA T0 + 0 
606f : 85 23 __ STA P8 
6071 : a9 65 __ LDA #$65
6073 : 85 36 __ STA T0 + 1 
6075 : 85 24 __ STA P9 
6077 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
607a : a9 42 __ LDA #$42
607c : 85 25 __ STA P10 
607e : 20 04 63 JSR $6304 ; (fillSpaceToEnd.s4 + 0)
6081 : a9 86 __ LDA #$86
6083 : 85 23 __ STA P8 
6085 : a9 9f __ LDA #$9f
6087 : 85 24 __ STA P9 
6089 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
608c : a9 02 __ LDA #$02
608e : 85 25 __ STA P10 
6090 : a9 03 __ LDA #$03
6092 : 8d cc 9f STA $9fcc ; (sstack + 0)
6095 : a9 17 __ LDA #$17
6097 : 8d cd 9f STA $9fcd ; (sstack + 1)
609a : 20 bb 17 JSR $17bb ; (textPrintNewLine.s4 + 0)
609d : a9 86 __ LDA #$86
609f : 85 23 __ STA P8 
60a1 : a9 9f __ LDA #$9f
60a3 : 85 24 __ STA P9 
60a5 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
60a8 : a9 25 __ LDA #$25
60aa : 85 35 __ STA T0 + 0 
60ac : 85 23 __ STA P8 
60ae : a9 65 __ LDA #$65
60b0 : 85 36 __ STA T0 + 1 
60b2 : 85 24 __ STA P9 
60b4 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
60b7 : a9 42 __ LDA #$42
60b9 : 85 25 __ STA P10 
60bb : 20 04 63 JSR $6304 ; (fillSpaceToEnd.s4 + 0)
60be : a9 86 __ LDA #$86
60c0 : 85 23 __ STA P8 
60c2 : a9 9f __ LDA #$9f
60c4 : 85 24 __ STA P9 
60c6 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
60c9 : a9 02 __ LDA #$02
60cb : 85 25 __ STA P10 
60cd : a9 03 __ LDA #$03
60cf : 8d cc 9f STA $9fcc ; (sstack + 0)
60d2 : a9 17 __ LDA #$17
60d4 : 8d cd 9f STA $9fcd ; (sstack + 1)
60d7 : 20 bb 17 JSR $17bb ; (textPrintNewLine.s4 + 0)
60da : a9 86 __ LDA #$86
60dc : 85 23 __ STA P8 
60de : a9 9f __ LDA #$9f
60e0 : 85 24 __ STA P9 
60e2 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
60e5 : a9 55 __ LDA #$55
60e7 : 85 35 __ STA T0 + 0 
60e9 : 85 23 __ STA P8 
60eb : a9 65 __ LDA #$65
60ed : 85 36 __ STA T0 + 1 
60ef : 85 24 __ STA P9 
60f1 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
60f4 : a9 42 __ LDA #$42
60f6 : 85 25 __ STA P10 
60f8 : 20 04 63 JSR $6304 ; (fillSpaceToEnd.s4 + 0)
60fb : a9 86 __ LDA #$86
60fd : 85 23 __ STA P8 
60ff : a9 9f __ LDA #$9f
6101 : 85 24 __ STA P9 
6103 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
6106 : a9 02 __ LDA #$02
6108 : 85 25 __ STA P10 
610a : a9 03 __ LDA #$03
610c : 8d cc 9f STA $9fcc ; (sstack + 0)
610f : a9 17 __ LDA #$17
6111 : 8d cd 9f STA $9fcd ; (sstack + 1)
6114 : 20 bb 17 JSR $17bb ; (textPrintNewLine.s4 + 0)
6117 : a9 86 __ LDA #$86
6119 : 85 23 __ STA P8 
611b : a9 9f __ LDA #$9f
611d : 85 24 __ STA P9 
611f : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
6122 : a9 8b __ LDA #$8b
6124 : 85 35 __ STA T0 + 0 
6126 : 85 23 __ STA P8 
6128 : a9 65 __ LDA #$65
612a : 85 36 __ STA T0 + 1 
612c : 85 24 __ STA P9 
612e : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
6131 : a9 42 __ LDA #$42
6133 : 85 25 __ STA P10 
6135 : 20 04 63 JSR $6304 ; (fillSpaceToEnd.s4 + 0)
6138 : a9 86 __ LDA #$86
613a : 85 23 __ STA P8 
613c : a9 9f __ LDA #$9f
613e : 85 24 __ STA P9 
6140 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
6143 : a9 02 __ LDA #$02
6145 : 85 25 __ STA P10 
6147 : a9 03 __ LDA #$03
6149 : 8d cc 9f STA $9fcc ; (sstack + 0)
614c : a9 17 __ LDA #$17
614e : 8d cd 9f STA $9fcd ; (sstack + 1)
6151 : 20 bb 17 JSR $17bb ; (textPrintNewLine.s4 + 0)
6154 : a9 86 __ LDA #$86
6156 : 85 23 __ STA P8 
6158 : a9 9f __ LDA #$9f
615a : 85 24 __ STA P9 
615c : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
615f : a9 bc __ LDA #$bc
6161 : 85 35 __ STA T0 + 0 
6163 : 85 23 __ STA P8 
6165 : a9 65 __ LDA #$65
6167 : 85 36 __ STA T0 + 1 
6169 : 85 24 __ STA P9 
616b : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
616e : a9 42 __ LDA #$42
6170 : 85 25 __ STA P10 
6172 : 20 04 63 JSR $6304 ; (fillSpaceToEnd.s4 + 0)
6175 : a9 86 __ LDA #$86
6177 : 85 23 __ STA P8 
6179 : a9 9f __ LDA #$9f
617b : 85 24 __ STA P9 
617d : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
6180 : a9 02 __ LDA #$02
6182 : 85 25 __ STA P10 
6184 : a9 03 __ LDA #$03
6186 : 8d cc 9f STA $9fcc ; (sstack + 0)
6189 : a9 17 __ LDA #$17
618b : 8d cd 9f STA $9fcd ; (sstack + 1)
618e : 20 bb 17 JSR $17bb ; (textPrintNewLine.s4 + 0)
6191 : a9 86 __ LDA #$86
6193 : 85 23 __ STA P8 
6195 : a9 9f __ LDA #$9f
6197 : 85 24 __ STA P9 
6199 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
619c : a9 00 __ LDA #$00
619e : 85 35 __ STA T0 + 0 
61a0 : 85 23 __ STA P8 
61a2 : a9 66 __ LDA #$66
61a4 : 85 36 __ STA T0 + 1 
61a6 : 85 24 __ STA P9 
61a8 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
61ab : a9 42 __ LDA #$42
61ad : 85 25 __ STA P10 
61af : 20 04 63 JSR $6304 ; (fillSpaceToEnd.s4 + 0)
61b2 : a9 86 __ LDA #$86
61b4 : 85 23 __ STA P8 
61b6 : a9 9f __ LDA #$9f
61b8 : 85 24 __ STA P9 
61ba : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
61bd : a9 02 __ LDA #$02
61bf : 85 25 __ STA P10 
61c1 : a9 03 __ LDA #$03
61c3 : 8d cc 9f STA $9fcc ; (sstack + 0)
61c6 : a9 17 __ LDA #$17
61c8 : 8d cd 9f STA $9fcd ; (sstack + 1)
61cb : 20 bb 17 JSR $17bb ; (textPrintNewLine.s4 + 0)
61ce : a9 88 __ LDA #$88
61d0 : 85 23 __ STA P8 
61d2 : a9 a2 __ LDA #$a2
61d4 : 8d 88 9f STA $9f88 ; (topLine[0] + 0)
61d7 : a9 9f __ LDA #$9f
61d9 : 85 24 __ STA P9 
61db : a9 a3 __ LDA #$a3
61dd : 8d c8 9f STA $9fc8 ; (topLine[0] + 64)
61e0 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
61e3 : a9 00 __ LDA #$00
61e5 : 85 49 __ STA T1 + 0 
61e7 : 85 4a __ STA T1 + 1 
61e9 : 85 4c __ STA T1 + 3 
61eb : 85 4d __ STA T2 + 0 
61ed : 85 50 __ STA T2 + 3 
61ef : a9 02 __ LDA #$02
61f1 : 85 4b __ STA T1 + 2 
61f3 : 85 4f __ STA T2 + 2 
61f5 : a9 08 __ LDA #$08
61f7 : 85 4e __ STA T2 + 1 
.l9:
61f9 : 20 b5 19 JSR $19b5 ; (kernelNextEvent.s4 + 0)
61fc : ad 66 7a LDA $7a66 ; (kernelEventData.type + 0)
61ff : c9 08 __ CMP #$08
6201 : d0 f6 __ BNE $61f9 ; (print_help.l9 + 0)
.s10:
6203 : a9 0f __ LDA #$0f
6205 : 85 1b __ STA P0 
6207 : a9 00 __ LDA #$00
6209 : 85 1c __ STA P1 
620b : 20 ff 14 JSR $14ff ; (textSetColor.s4 + 0)
620e : a9 43 __ LDA #$43
6210 : 85 25 __ STA P10 
6212 : 20 cb 16 JSR $16cb ; (textSectionClear.s4 + 0)
6215 : a9 02 __ LDA #$02
6217 : 85 01 __ STA $01 
6219 : a9 03 __ LDA #$03
621b : 85 54 __ STA T5 + 0 
.l11:
621d : 85 29 __ STA ACCU + 0 
621f : a9 00 __ LDA #$00
6221 : 85 2a __ STA ACCU + 1 
6223 : 85 2b __ STA ACCU + 2 
6225 : 85 2c __ STA ACCU + 3 
6227 : a9 50 __ LDA #$50
6229 : 20 98 72 JSR $7298 ; (mul32by8 + 0)
622c : a5 15 __ LDA WORK + 4 
622e : 85 51 __ STA T3 + 0 
6230 : a5 16 __ LDA WORK + 5 
6232 : 85 52 __ STA T3 + 1 
6234 : a5 49 __ LDA T1 + 0 
6236 : 85 1b __ STA P0 
6238 : a9 02 __ LDA #$02
623a : 85 55 __ STA T6 + 0 
623c : a5 4a __ LDA T1 + 1 
623e : 85 1c __ STA P1 
6240 : a5 4c __ LDA T1 + 3 
6242 : 85 1e __ STA P3 
.l19:
6244 : a5 4b __ LDA T1 + 2 
6246 : 85 1d __ STA P2 
6248 : 20 b6 0f JSR $0fb6 ; (FAR_PEEK.s4 + 0)
624b : aa __ __ TAX
624c : 18 __ __ CLC
624d : a5 55 __ LDA T6 + 0 
624f : 65 51 __ ADC T3 + 0 
6251 : 85 35 __ STA T0 + 0 
6253 : a5 52 __ LDA T3 + 1 
6255 : 69 c0 __ ADC #$c0
6257 : 85 36 __ STA T0 + 1 
6259 : 8a __ __ TXA
625a : a0 00 __ LDY #$00
625c : 91 35 __ STA (T0 + 0),y 
625e : e6 1b __ INC P0 
6260 : d0 0a __ BNE $626c ; (print_help.s30 + 0)
.s37:
6262 : e6 1c __ INC P1 
6264 : d0 06 __ BNE $626c ; (print_help.s30 + 0)
.s31:
6266 : e6 4b __ INC T1 + 2 
6268 : d0 02 __ BNE $626c ; (print_help.s30 + 0)
.s29:
626a : e6 1e __ INC P3 
.s30:
626c : e6 55 __ INC T6 + 0 
626e : a5 55 __ LDA T6 + 0 
6270 : c9 43 __ CMP #$43
6272 : 90 d0 __ BCC $6244 ; (print_help.l19 + 0)
.s20:
6274 : a5 1e __ LDA P3 
6276 : 85 4c __ STA T1 + 3 
6278 : a5 1c __ LDA P1 
627a : 85 4a __ STA T1 + 1 
627c : a5 1b __ LDA P0 
627e : 85 49 __ STA T1 + 0 
6280 : e6 54 __ INC T5 + 0 
6282 : a5 54 __ LDA T5 + 0 
6284 : c9 17 __ CMP #$17
6286 : 90 95 __ BCC $621d ; (print_help.l11 + 0)
.s12:
6288 : a9 03 __ LDA #$03
628a : 85 01 __ STA $01 
628c : 85 53 __ STA T4 + 0 
.l13:
628e : 84 2a __ STY ACCU + 1 
6290 : 84 2b __ STY ACCU + 2 
6292 : 84 2c __ STY ACCU + 3 
6294 : 85 29 __ STA ACCU + 0 
6296 : a9 50 __ LDA #$50
6298 : 20 98 72 JSR $7298 ; (mul32by8 + 0)
629b : a5 15 __ LDA WORK + 4 
629d : 85 49 __ STA T1 + 0 
629f : a5 16 __ LDA WORK + 5 
62a1 : 85 4a __ STA T1 + 1 
62a3 : a5 4d __ LDA T2 + 0 
62a5 : 85 1b __ STA P0 
62a7 : a9 02 __ LDA #$02
62a9 : 85 54 __ STA T5 + 0 
62ab : a5 4e __ LDA T2 + 1 
62ad : 85 1c __ STA P1 
62af : a5 50 __ LDA T2 + 3 
62b1 : 85 1e __ STA P3 
.l21:
62b3 : a5 4f __ LDA T2 + 2 
62b5 : 85 1d __ STA P2 
62b7 : 20 b6 0f JSR $0fb6 ; (FAR_PEEK.s4 + 0)
62ba : aa __ __ TAX
62bb : 18 __ __ CLC
62bc : a5 54 __ LDA T5 + 0 
62be : 65 49 __ ADC T1 + 0 
62c0 : 85 35 __ STA T0 + 0 
62c2 : a5 4a __ LDA T1 + 1 
62c4 : 69 c0 __ ADC #$c0
62c6 : 85 36 __ STA T0 + 1 
62c8 : 8a __ __ TXA
62c9 : a0 00 __ LDY #$00
62cb : 91 35 __ STA (T0 + 0),y 
62cd : e6 1b __ INC P0 
62cf : d0 0a __ BNE $62db ; (print_help.s33 + 0)
.s38:
62d1 : e6 1c __ INC P1 
62d3 : d0 06 __ BNE $62db ; (print_help.s33 + 0)
.s34:
62d5 : e6 4f __ INC T2 + 2 
62d7 : d0 02 __ BNE $62db ; (print_help.s33 + 0)
.s32:
62d9 : e6 1e __ INC P3 
.s33:
62db : e6 54 __ INC T5 + 0 
62dd : a5 54 __ LDA T5 + 0 
62df : c9 43 __ CMP #$43
62e1 : 90 d0 __ BCC $62b3 ; (print_help.l21 + 0)
.s22:
62e3 : a5 1e __ LDA P3 
62e5 : 85 50 __ STA T2 + 3 
62e7 : a5 1c __ LDA P1 
62e9 : 85 4e __ STA T2 + 1 
62eb : a5 1b __ LDA P0 
62ed : 85 4d __ STA T2 + 0 
62ef : e6 53 __ INC T4 + 0 
62f1 : a5 53 __ LDA T4 + 0 
62f3 : c9 17 __ CMP #$17
62f5 : 90 97 __ BCC $628e ; (print_help.l13 + 0)
.s14:
62f7 : 84 01 __ STY $01 
62f9 : a9 01 __ LDA #$01
62fb : 8d e0 d6 STA $d6e0 
.s3:
62fe : ad 83 9f LDA $9f83 ; (print_help@stack + 0)
6301 : 85 55 __ STA T6 + 0 
6303 : 60 __ __ RTS
--------------------------------------------------------------------
fillSpaceToEnd: ; fillSpaceToEnd(u8)->void
;1541, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s4:
6304 : a9 cb __ LDA #$cb
6306 : 85 1b __ STA P0 
6308 : a9 9f __ LDA #$9f
630a : 85 1e __ STA P3 
630c : a9 9f __ LDA #$9f
630e : 85 1c __ STA P1 
6310 : a9 ca __ LDA #$ca
6312 : 85 1d __ STA P2 
6314 : 20 39 18 JSR $1839 ; (textGetXY.s4 + 0)
6317 : ad cb 9f LDA $9fcb ; (curX + 0)
631a : c5 25 __ CMP P10 ; (endX + 0)
631c : b0 15 __ BCS $6333 ; (fillSpaceToEnd.s3 + 0)
.s5:
631e : 85 43 __ STA T2 + 0 
6320 : a9 74 __ LDA #$74
6322 : 85 23 __ STA P8 
6324 : a9 17 __ LDA #$17
6326 : 85 24 __ STA P9 
.l6:
6328 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
632b : e6 43 __ INC T2 + 0 
632d : a5 43 __ LDA T2 + 0 
632f : c5 25 __ CMP P10 ; (endX + 0)
6331 : 90 f5 __ BCC $6328 ; (fillSpaceToEnd.l6 + 0)
.s3:
6333 : 60 __ __ RTS
--------------------------------------------------------------------
6334 : __ __ __ BYT 20 4c 69 73 74 20 6f 66 20 43 6f 6d 6d 61 6e 64 :  List of Command
6344 : __ __ __ BYT 73 20 20 20 20 20 20 20 20 20 20 20 50 72 65 73 : s           Pres
6354 : __ __ __ BYT 73 20 61 20 6b 65 79 20 74 6f 20 64 69 73 6d 69 : s a key to dismi
6364 : __ __ __ BYT 73 73 2e 00                                     : ss..
--------------------------------------------------------------------
6368 : __ __ __ BYT 20 20 63 6c 65 61 72 20 20 20 20 20 20 20 20 20 :   clear         
6378 : __ __ __ BYT 20 20 20 20 20 20 20 63 6c 65 61 72 20 74 68 65 :        clear the
6388 : __ __ __ BYT 20 73 63 72 65 65 6e 00                         :  screen.
--------------------------------------------------------------------
6390 : __ __ __ BYT 20 20 77 69 66 69 20 3c 73 73 69 64 3e 20 3c 70 :   wifi <ssid> <p
63a0 : __ __ __ BYT 61 73 73 3e 20 20 20 6a 6f 69 6e 20 77 69 66 69 : ass>   join wifi
63b0 : __ __ __ BYT 20 6e 65 74 77 6f 72 6b 00                      :  network.
--------------------------------------------------------------------
63b9 : __ __ __ BYT 20 20 6f 70 65 6e 20 3c 68 6f 73 74 3e 20 5b 70 :   open <host> [p
63c9 : __ __ __ BYT 6f 72 74 5d 20 20 20 63 6f 6e 6e 65 63 74 20 74 : ort]   connect t
63d9 : __ __ __ BYT 6f 20 66 74 70 20 73 65 72 76 65 72 20 28 64 65 : o ftp server (de
63e9 : __ __ __ BYT 66 61 75 6c 74 20 70 6f 72 74 20 32 31 29 00    : fault port 21).
--------------------------------------------------------------------
63f8 : __ __ __ BYT 63 6c 65 61 72 00                               : clear.
--------------------------------------------------------------------
_ccolor:
63fe : __ __ __ BYT f0                                              : .
--------------------------------------------------------------------
_MAX_COL:
63ff : __ __ __ BYT 50                                              : P
--------------------------------------------------------------------
6400 : __ __ __ BYT 20 20 6c 6f 67 69 6e 20 3c 75 73 65 72 3e 20 3c :   login <user> <
6410 : __ __ __ BYT 70 61 73 73 3e 20 20 6c 6f 67 20 69 6e 00       : pass>  log in.
--------------------------------------------------------------------
641e : __ __ __ BYT 20 20 6c 73 20 5b 70 61 74 68 5d 20 20 20 20 20 :   ls [path]     
642e : __ __ __ BYT 20 20 20 20 20 20 20 6c 69 73 74 20 64 69 72 65 :        list dire
643e : __ __ __ BYT 63 74 6f 72 79 00                               : ctory.
--------------------------------------------------------------------
6444 : __ __ __ BYT 20 20 63 64 20 3c 70 61 74 68 3e 20 20 20 20 20 :   cd <path>     
6454 : __ __ __ BYT 20 20 20 20 20 20 20 63 68 61 6e 67 65 20 72 65 :        change re
6464 : __ __ __ BYT 6d 6f 74 65 20 64 69 72 65 63 74 6f 72 79 00    : mote directory.
--------------------------------------------------------------------
6473 : __ __ __ BYT 20 20 6c 63 64 20 3c 70 61 74 68 3e 20 20 20 20 :   lcd <path>    
6483 : __ __ __ BYT 20 20 20 20 20 20 20 63 68 61 6e 67 65 20 6c 6f :        change lo
6493 : __ __ __ BYT 63 61 6c 20 64 69 72 65 63 74 6f 72 79 00       : cal directory.
--------------------------------------------------------------------
64a1 : __ __ __ BYT 20 20 70 77 64 20 20 20 20 20 20 20 20 20 20 20 :   pwd           
64b1 : __ __ __ BYT 20 20 20 20 20 20 20 70 72 69 6e 74 20 77 6f 72 :        print wor
64c1 : __ __ __ BYT 6b 69 6e 67 20 64 69 72 65 63 74 6f 72 79 00    : king directory.
--------------------------------------------------------------------
64d0 : __ __ __ BYT 20 20 67 65 74 20 3c 72 65 6d 6f 74 65 3e 20 5b :   get <remote> [
64e0 : __ __ __ BYT 6c 6f 63 61 6c 5d 20 64 6f 77 6e 6c 6f 61 64 20 : local] download 
64f0 : __ __ __ BYT 61 20 66 69 6c 65 00                            : a file.
--------------------------------------------------------------------
64f7 : __ __ __ BYT 77 69 66 69 00                                  : wifi.
--------------------------------------------------------------------
64fc : __ __ __ BYT 6c 73 00                                        : ls.
--------------------------------------------------------------------
_MAX_ROW:
64ff : __ __ __ BYT 1e                                              : .
--------------------------------------------------------------------
6500 : __ __ __ BYT 20 20 70 75 74 20 3c 6c 6f 63 61 6c 3e 20 5b 72 :   put <local> [r
6510 : __ __ __ BYT 65 6d 6f 74 65 5d 20 75 70 6c 6f 61 64 20 61 20 : emote] upload a 
6520 : __ __ __ BYT 66 69 6c 65 00                                  : file.
--------------------------------------------------------------------
6525 : __ __ __ BYT 20 20 62 69 6e 20 20 20 20 20 20 20 20 20 20 20 :   bin           
6535 : __ __ __ BYT 20 20 20 20 20 20 20 73 65 74 20 62 69 6e 61 72 :        set binar
6545 : __ __ __ BYT 79 20 74 72 61 6e 73 66 65 72 20 74 79 70 65 00 : y transfer type.
--------------------------------------------------------------------
6555 : __ __ __ BYT 20 20 71 75 69 74 20 20 20 20 20 20 20 20 20 20 :   quit          
6565 : __ __ __ BYT 20 20 20 20 20 20 20 6c 6f 67 20 6f 75 74 20 61 :        log out a
6575 : __ __ __ BYT 6e 64 20 63 6c 6f 73 65 20 63 6f 6e 74 72 6f 6c : nd close control
6585 : __ __ __ BYT 20 6c 69 6e 6b 00                               :  link.
--------------------------------------------------------------------
658b : __ __ __ BYT 20 20 64 65 62 75 67 20 6f 6e 7c 6f 66 66 20 20 :   debug on|off  
659b : __ __ __ BYT 20 20 20 20 20 20 20 74 6f 67 67 6c 65 20 72 61 :        toggle ra
65ab : __ __ __ BYT 77 20 70 72 6f 74 6f 63 6f 6c 20 74 72 61 63 65 : w protocol trace
65bb : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
65bc : __ __ __ BYT 20 20 68 65 6c 70 20 20 20 20 20 20 20 20 20 20 :   help          
65cc : __ __ __ BYT 20 20 20 20 20 20 20 73 68 6f 77 20 74 68 69 73 :        show this
65dc : __ __ __ BYT 20 74 65 78 74 00                               :  text.
--------------------------------------------------------------------
65e2 : __ __ __ BYT 41 54 2b 43 57 4a 41 50 3d 22 25 73 22 2c 22 25 : AT+CWJAP="%s","%
65f2 : __ __ __ BYT 73 22 00                                        : s".
--------------------------------------------------------------------
65f5 : __ __ __ BYT 4a 6f 69 6e 65 64 2e 00                         : Joined..
--------------------------------------------------------------------
65fd : __ __ __ BYT 63 64 00                                        : cd.
--------------------------------------------------------------------
6600 : __ __ __ BYT 20 20 65 78 69 74 20 20 20 20 20 20 20 20 20 20 :   exit          
6610 : __ __ __ BYT 20 20 20 20 20 20 20 65 78 69 74 20 74 68 69 73 :        exit this
6620 : __ __ __ BYT 20 70 72 6f 67 72 61 6d 00                      :  program.
--------------------------------------------------------------------
wiz_join: ; wiz_join(const u8*,const u8*)->bool
; 853, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s4:
6629 : a9 43 __ LDA #$43
662b : 8d d4 9f STA $9fd4 ; (sstack + 8)
662e : a9 9f __ LDA #$9f
6630 : 8d d5 9f STA $9fd5 ; (sstack + 9)
6633 : a9 e2 __ LDA #$e2
6635 : 8d d6 9f STA $9fd6 ; (sstack + 10)
6638 : a9 65 __ LDA #$65
663a : 8d d7 9f STA $9fd7 ; (sstack + 11)
663d : ad e1 9f LDA $9fe1 ; (sstack + 21)
6640 : 8d d8 9f STA $9fd8 ; (sstack + 12)
6643 : ad e2 9f LDA $9fe2 ; (sstack + 22)
6646 : 8d d9 9f STA $9fd9 ; (sstack + 13)
6649 : ad e3 9f LDA $9fe3 ; (sstack + 23)
664c : 8d da 9f STA $9fda ; (sstack + 14)
664f : ad e4 9f LDA $9fe4 ; (sstack + 24)
6652 : 8d db 9f STA $9fdb ; (sstack + 15)
6655 : 20 3a 50 JSR $503a ; (sprintf.s4 + 0)
6658 : a9 43 __ LDA #$43
665a : 8d dd 9f STA $9fdd ; (sstack + 17)
665d : a9 9f __ LDA #$9f
665f : 8d de 9f STA $9fde ; (sstack + 18)
6662 : a9 40 __ LDA #$40
6664 : 8d df 9f STA $9fdf ; (sstack + 19)
6667 : a9 1f __ LDA #$1f
6669 : 8d e0 9f STA $9fe0 ; (sstack + 20)
666c : 4c c5 19 JMP $19c5 ; (wiz_atcmd.s4 + 0)
--------------------------------------------------------------------
666f : __ __ __ BYT 4a 6f 69 6e 20 46 61 69 6c 65 64 2e 00          : Join Failed..
--------------------------------------------------------------------
667c : __ __ __ BYT 75 73 61 67 65 3a 20 77 69 66 69 20 3c 73 73 69 : usage: wifi <ssi
668c : __ __ __ BYT 64 3e 20 3c 70 61 73 73 3e 00                   : d> <pass>.
--------------------------------------------------------------------
6696 : __ __ __ BYT 6f 70 65 6e 00                                  : open.
--------------------------------------------------------------------
ftp_open: ; ftp_open(const u8*,u16)->bool
; 901, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s1:
669b : a5 55 __ LDA T1 + 0 
669d : 8d 41 9f STA $9f41 ; (ftp_open@stack + 0)
66a0 : a5 56 __ LDA T1 + 1 
66a2 : 8d 42 9f STA $9f42 ; (ftp_open@stack + 1)
.s4:
66a5 : a9 4f __ LDA #$4f
66a7 : 85 1d __ STA P2 
66a9 : a9 00 __ LDA #$00
66ab : 8d b5 79 STA $79b5 ; (ctrl_reply_ready + 0)
66ae : 20 76 17 JSR $1776 ; (initTextXY.s4 + 0)
66b1 : ad e6 9f LDA $9fe6 ; (sstack + 26)
66b4 : 85 55 __ STA T1 + 0 
66b6 : 8d e2 9f STA $9fe2 ; (sstack + 22)
66b9 : a9 00 __ LDA #$00
66bb : 8d e1 9f STA $9fe1 ; (sstack + 21)
66be : ad e7 9f LDA $9fe7 ; (sstack + 27)
66c1 : 85 56 __ STA T1 + 1 
66c3 : 8d e3 9f STA $9fe3 ; (sstack + 23)
66c6 : ad e8 9f LDA $9fe8 ; (sstack + 28)
66c9 : 8d e4 9f STA $9fe4 ; (sstack + 24)
66cc : ad e9 9f LDA $9fe9 ; (sstack + 29)
66cf : 8d e5 9f STA $9fe5 ; (sstack + 25)
66d2 : 20 25 59 JSR $5925 ; (wiz_open_link.s4 + 0)
66d5 : a5 29 __ LDA ACCU + 0 
66d7 : d0 5f __ BNE $6738 ; (ftp_open.s6 + 0)
.s5:
66d9 : a9 d3 __ LDA #$d3
66db : 85 35 __ STA T0 + 0 
66dd : 85 23 __ STA P8 
66df : a9 67 __ LDA #$67
66e1 : 85 36 __ STA T0 + 1 
66e3 : 85 24 __ STA P9 
66e5 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
66e8 : a9 00 __ LDA #$00
66ea : 85 25 __ STA P10 
66ec : a9 2c __ LDA #$2c
66ee : 8d cc 9f STA $9fcc ; (sstack + 0)
66f1 : a9 4f __ LDA #$4f
66f3 : 85 26 __ STA P11 
66f5 : a9 3a __ LDA #$3a
66f7 : 8d cd 9f STA $9fcd ; (sstack + 1)
66fa : 20 bb 17 JSR $17bb ; (textPrintNewLine.s4 + 0)
66fd : a9 00 __ LDA #$00
66ff : 85 1b __ STA P0 
6701 : a9 0f __ LDA #$0f
6703 : 85 1c __ STA P1 
6705 : 20 ff 14 JSR $14ff ; (textSetColor.s4 + 0)
6708 : a9 19 __ LDA #$19
670a : 85 1b __ STA P0 
670c : a9 3b __ LDA #$3b
670e : 85 1c __ STA P1 
6710 : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
6713 : a9 00 __ LDA #$00
6715 : 85 23 __ STA P8 
6717 : a9 68 __ LDA #$68
6719 : 85 24 __ STA P9 
671b : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
671e : a9 0f __ LDA #$0f
6720 : 85 1b __ STA P0 
6722 : a9 00 __ LDA #$00
6724 : 85 1c __ STA P1 
6726 : 20 ff 14 JSR $14ff ; (textSetColor.s4 + 0)
6729 : a9 00 __ LDA #$00
.s3:
672b : 85 29 __ STA ACCU + 0 
672d : ad 41 9f LDA $9f41 ; (ftp_open@stack + 0)
6730 : 85 55 __ STA T1 + 0 
6732 : ad 42 9f LDA $9f42 ; (ftp_open@stack + 1)
6735 : 85 56 __ STA T1 + 1 
6737 : 60 __ __ RTS
.s6:
6738 : a9 25 __ LDA #$25
673a : 85 35 __ STA T0 + 0 
673c : 85 23 __ STA P8 
673e : a9 68 __ LDA #$68
6740 : 85 36 __ STA T0 + 1 
6742 : 85 24 __ STA P9 
6744 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
6747 : a9 00 __ LDA #$00
6749 : 85 25 __ STA P10 
674b : a9 2c __ LDA #$2c
674d : 8d cc 9f STA $9fcc ; (sstack + 0)
6750 : a9 4f __ LDA #$4f
6752 : 85 26 __ STA P11 
6754 : a9 3a __ LDA #$3a
6756 : 8d cd 9f STA $9fcd ; (sstack + 1)
6759 : 20 bb 17 JSR $17bb ; (textPrintNewLine.s4 + 0)
675c : a9 00 __ LDA #$00
675e : 85 1b __ STA P0 
6760 : a9 0f __ LDA #$0f
6762 : 85 1c __ STA P1 
6764 : 20 ff 14 JSR $14ff ; (textSetColor.s4 + 0)
6767 : a9 19 __ LDA #$19
6769 : 85 1b __ STA P0 
676b : a9 3b __ LDA #$3b
676d : 85 1c __ STA P1 
676f : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
6772 : a9 e2 __ LDA #$e2
6774 : 85 23 __ STA P8 
6776 : a9 67 __ LDA #$67
6778 : 85 24 __ STA P9 
677a : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
677d : a5 55 __ LDA T1 + 0 
677f : 85 23 __ STA P8 
6781 : a5 56 __ LDA T1 + 1 
6783 : 85 24 __ STA P9 
6785 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
6788 : a9 0f __ LDA #$0f
678a : 85 1b __ STA P0 
678c : a9 00 __ LDA #$00
678e : 85 1c __ STA P1 
6790 : 20 ff 14 JSR $14ff ; (textSetColor.s4 + 0)
6793 : a9 d0 __ LDA #$d0
6795 : 8d db 9f STA $9fdb ; (sstack + 15)
6798 : a9 07 __ LDA #$07
679a : 8d dc 9f STA $9fdc ; (sstack + 16)
679d : 20 f6 51 JSR $51f6 ; (ftp_wait_reply.s1 + 0)
67a0 : a5 29 __ LDA ACCU + 0 
67a2 : d0 27 __ BNE $67cb ; (ftp_open.s8 + 0)
.s7:
67a4 : a9 46 __ LDA #$46
67a6 : 85 35 __ STA T0 + 0 
67a8 : 85 23 __ STA P8 
67aa : a9 68 __ LDA #$68
67ac : 85 36 __ STA T0 + 1 
67ae : 85 24 __ STA P9 
67b0 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
67b3 : a9 00 __ LDA #$00
67b5 : 85 25 __ STA P10 
67b7 : a9 2c __ LDA #$2c
67b9 : 8d cc 9f STA $9fcc ; (sstack + 0)
67bc : a9 4f __ LDA #$4f
67be : 85 26 __ STA P11 
67c0 : a9 3a __ LDA #$3a
67c2 : 8d cd 9f STA $9fcd ; (sstack + 1)
67c5 : 20 bb 17 JSR $17bb ; (textPrintNewLine.s4 + 0)
67c8 : 4c ce 67 JMP $67ce ; (ftp_open.s9 + 0)
.s8:
67cb : 20 54 52 JSR $5254 ; (print_reply.s4 + 0)
.s9:
67ce : a9 01 __ LDA #$01
67d0 : 4c 2b 67 JMP $672b ; (ftp_open.s3 + 0)
--------------------------------------------------------------------
67d3 : __ __ __ BYT 43 6f 6e 6e 65 63 74 20 66 61 69 6c 65 64 00    : Connect failed.
--------------------------------------------------------------------
67e2 : __ __ __ BYT 63 6f 6e 6e 65 63 74 65 64 20 74 6f 20 00       : connected to .
--------------------------------------------------------------------
67f0 : __ __ __ BYT 6c 6f 67 69 6e 00                               : login.
--------------------------------------------------------------------
67f6 : __ __ __ BYT 55 53 45 52 20 25 73 00                         : USER %s.
--------------------------------------------------------------------
_col:
67fe : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
_row:
67ff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
6800 : __ __ __ BYT 6e 6f 74 20 63 6f 6e 6e 65 63 74 65 64 20 20 20 : not connected   
6810 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
6820 : __ __ __ BYT 20 20 20 20 00                                  :     .
--------------------------------------------------------------------
6825 : __ __ __ BYT 43 6f 6e 6e 65 63 74 65 64 2c 20 77 61 69 74 69 : Connected, waiti
6835 : __ __ __ BYT 6e 67 20 66 6f 72 20 62 61 6e 6e 65 72 2e 2e 2e : ng for banner...
6845 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
6846 : __ __ __ BYT 28 6e 6f 20 62 61 6e 6e 65 72 20 72 65 63 65 69 : (no banner recei
6856 : __ __ __ BYT 76 65 64 29 00                                  : ved).
--------------------------------------------------------------------
atoi: ; atoi(const u8*)->i16
;  30, "/mnt/d/F256/oscar64/include/stdlib.h"
.l4:
685b : a0 00 __ LDY #$00
685d : b1 1b __ LDA (P0),y ; (s + 0)
685f : aa __ __ TAX
6860 : a5 1b __ LDA P0 ; (s + 0)
6862 : 85 35 __ STA T0 + 0 
6864 : 18 __ __ CLC
6865 : 69 01 __ ADC #$01
6867 : 85 1b __ STA P0 ; (s + 0)
6869 : a5 1c __ LDA P1 ; (s + 1)
686b : 85 36 __ STA T0 + 1 
686d : 69 00 __ ADC #$00
686f : 85 1c __ STA P1 ; (s + 1)
6871 : 8a __ __ TXA
6872 : e0 21 __ CPX #$21
6874 : b0 08 __ BCS $687e ; (atoi.s5 + 0)
.s16:
6876 : aa __ __ TAX
6877 : d0 e2 __ BNE $685b ; (atoi.l4 + 0)
.s17:
6879 : 85 29 __ STA ACCU + 0 
.s3:
687b : 85 2a __ STA ACCU + 1 
687d : 60 __ __ RTS
.s5:
687e : c9 2d __ CMP #$2d
6880 : d0 1d __ BNE $689f ; (atoi.s6 + 0)
.s15:
6882 : a9 01 __ LDA #$01
6884 : 85 2b __ STA ACCU + 2 
.s14:
6886 : 18 __ __ CLC
6887 : a5 35 __ LDA T0 + 0 
6889 : 69 02 __ ADC #$02
688b : 85 1b __ STA P0 ; (s + 0)
688d : a5 36 __ LDA T0 + 1 
688f : 69 00 __ ADC #$00
6891 : 85 1c __ STA P1 ; (s + 1)
6893 : a0 01 __ LDY #$01
6895 : b1 35 __ LDA (T0 + 0),y 
.s7:
6897 : 85 2a __ STA ACCU + 1 
6899 : a9 00 __ LDA #$00
689b : 85 35 __ STA T0 + 0 
689d : f0 08 __ BEQ $68a7 ; (atoi.l8 + 0)
.s6:
689f : 84 2b __ STY ACCU + 2 
68a1 : c9 2b __ CMP #$2b
68a3 : d0 f2 __ BNE $6897 ; (atoi.s7 + 0)
68a5 : f0 df __ BEQ $6886 ; (atoi.s14 + 0)
.l8:
68a7 : 85 36 __ STA T0 + 1 
68a9 : a5 2a __ LDA ACCU + 1 
68ab : c9 30 __ CMP #$30
68ad : 90 3b __ BCC $68ea ; (atoi.s9 + 0)
.s12:
68af : c9 3a __ CMP #$3a
68b1 : b0 37 __ BCS $68ea ; (atoi.s9 + 0)
.s13:
68b3 : a0 00 __ LDY #$00
68b5 : b1 1b __ LDA (P0),y ; (s + 0)
68b7 : a8 __ __ TAY
68b8 : e6 1b __ INC P0 ; (s + 0)
68ba : d0 02 __ BNE $68be ; (atoi.s19 + 0)
.s18:
68bc : e6 1c __ INC P1 ; (s + 1)
.s19:
68be : a5 35 __ LDA T0 + 0 
68c0 : 0a __ __ ASL
68c1 : 85 29 __ STA ACCU + 0 
68c3 : a5 36 __ LDA T0 + 1 
68c5 : 2a __ __ ROL
68c6 : 06 29 __ ASL ACCU + 0 
68c8 : 2a __ __ ROL
68c9 : aa __ __ TAX
68ca : 18 __ __ CLC
68cb : a5 29 __ LDA ACCU + 0 
68cd : 65 35 __ ADC T0 + 0 
68cf : 85 35 __ STA T0 + 0 
68d1 : 8a __ __ TXA
68d2 : 65 36 __ ADC T0 + 1 
68d4 : 06 35 __ ASL T0 + 0 
68d6 : 2a __ __ ROL
68d7 : aa __ __ TAX
68d8 : a5 2a __ LDA ACCU + 1 
68da : 84 2a __ STY ACCU + 1 
68dc : 38 __ __ SEC
68dd : e9 30 __ SBC #$30
68df : 18 __ __ CLC
68e0 : 65 35 __ ADC T0 + 0 
68e2 : 85 35 __ STA T0 + 0 
68e4 : 8a __ __ TXA
68e5 : 69 00 __ ADC #$00
68e7 : 4c a7 68 JMP $68a7 ; (atoi.l8 + 0)
.s9:
68ea : a5 2b __ LDA ACCU + 2 
68ec : d0 09 __ BNE $68f7 ; (atoi.s11 + 0)
.s10:
68ee : a5 35 __ LDA T0 + 0 
68f0 : 85 29 __ STA ACCU + 0 
68f2 : a5 36 __ LDA T0 + 1 
68f4 : 4c 7b 68 JMP $687b ; (atoi.s3 + 0)
.s11:
68f7 : 38 __ __ SEC
68f8 : a9 00 __ LDA #$00
68fa : e5 35 __ SBC T0 + 0 
68fc : 85 29 __ STA ACCU + 0 
68fe : a9 00 __ LDA #$00
6900 : e5 36 __ SBC T0 + 1 
6902 : 4c 7b 68 JMP $687b ; (atoi.s3 + 0)
--------------------------------------------------------------------
6905 : __ __ __ BYT 75 73 61 67 65 3a 20 6f 70 65 6e 20 3c 68 6f 73 : usage: open <hos
6915 : __ __ __ BYT 74 3e 20 5b 70 6f 72 74 5d 00                   : t> [port].
--------------------------------------------------------------------
ftp_login: ; ftp_login(const u8*,const u8*)->bool
; 922, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s1:
691f : a5 55 __ LDA T0 + 0 
6921 : 8d a7 9e STA $9ea7 ; (ftp_login@stack + 0)
6924 : a5 56 __ LDA T0 + 1 
6926 : 8d a8 9e STA $9ea8 ; (ftp_login@stack + 1)
.s4:
6929 : a9 ab __ LDA #$ab
692b : 8d d4 9f STA $9fd4 ; (sstack + 8)
692e : a9 9e __ LDA #$9e
6930 : 8d d5 9f STA $9fd5 ; (sstack + 9)
6933 : a9 f6 __ LDA #$f6
6935 : 8d d6 9f STA $9fd6 ; (sstack + 10)
6938 : a9 67 __ LDA #$67
693a : 8d d7 9f STA $9fd7 ; (sstack + 11)
693d : ad e9 9f LDA $9fe9 ; (sstack + 29)
6940 : 8d d8 9f STA $9fd8 ; (sstack + 12)
6943 : ad ea 9f LDA $9fea ; (sstack + 30)
6946 : 8d d9 9f STA $9fd9 ; (sstack + 13)
6949 : 20 3a 50 JSR $503a ; (sprintf.s4 + 0)
694c : a9 ab __ LDA #$ab
694e : 8d e7 9f STA $9fe7 ; (sstack + 27)
6951 : a9 9e __ LDA #$9e
6953 : 8d e8 9f STA $9fe8 ; (sstack + 28)
6956 : 20 7e 50 JSR $507e ; (ftp_command.s4 + 0)
6959 : a5 29 __ LDA ACCU + 0 
695b : 85 55 __ STA T0 + 0 
695d : a5 2a __ LDA ACCU + 1 
695f : 85 56 __ STA T0 + 1 
6961 : 20 54 52 JSR $5254 ; (print_reply.s4 + 0)
6964 : a4 56 __ LDY T0 + 1 
6966 : d0 06 __ BNE $696e ; (ftp_login.s5 + 0)
.s11:
6968 : a5 55 __ LDA T0 + 0 
696a : c9 e6 __ CMP #$e6
696c : f0 4e __ BEQ $69bc ; (ftp_login.s7 + 0)
.s5:
696e : 88 __ __ DEY
696f : d0 52 __ BNE $69c3 ; (ftp_login.s8 + 0)
.s10:
6971 : a5 55 __ LDA T0 + 0 
6973 : c9 4b __ CMP #$4b
6975 : d0 4c __ BNE $69c3 ; (ftp_login.s8 + 0)
.s6:
6977 : a9 ab __ LDA #$ab
6979 : 8d d4 9f STA $9fd4 ; (sstack + 8)
697c : a9 9e __ LDA #$9e
697e : 8d d5 9f STA $9fd5 ; (sstack + 9)
6981 : a9 18 __ LDA #$18
6983 : 8d d6 9f STA $9fd6 ; (sstack + 10)
6986 : a9 6a __ LDA #$6a
6988 : 8d d7 9f STA $9fd7 ; (sstack + 11)
698b : ad eb 9f LDA $9feb ; (sstack + 31)
698e : 8d d8 9f STA $9fd8 ; (sstack + 12)
6991 : ad ec 9f LDA $9fec ; (sstack + 32)
6994 : 8d d9 9f STA $9fd9 ; (sstack + 13)
6997 : 20 3a 50 JSR $503a ; (sprintf.s4 + 0)
699a : a9 ab __ LDA #$ab
699c : 8d e7 9f STA $9fe7 ; (sstack + 27)
699f : a9 9e __ LDA #$9e
69a1 : 8d e8 9f STA $9fe8 ; (sstack + 28)
69a4 : 20 7e 50 JSR $507e ; (ftp_command.s4 + 0)
69a7 : a5 29 __ LDA ACCU + 0 
69a9 : 85 55 __ STA T0 + 0 
69ab : a5 2a __ LDA ACCU + 1 
69ad : 85 56 __ STA T0 + 1 
69af : 20 54 52 JSR $5254 ; (print_reply.s4 + 0)
69b2 : a5 56 __ LDA T0 + 1 
69b4 : d0 0d __ BNE $69c3 ; (ftp_login.s8 + 0)
.s9:
69b6 : a5 55 __ LDA T0 + 0 
69b8 : c9 e6 __ CMP #$e6
69ba : d0 07 __ BNE $69c3 ; (ftp_login.s8 + 0)
.s7:
69bc : 20 d2 69 JSR $69d2 ; (ftp_type_binary.s1 + 0)
69bf : a9 01 __ LDA #$01
69c1 : d0 02 __ BNE $69c5 ; (ftp_login.s3 + 0)
.s8:
69c3 : a9 00 __ LDA #$00
.s3:
69c5 : 85 29 __ STA ACCU + 0 
69c7 : ad a7 9e LDA $9ea7 ; (ftp_login@stack + 0)
69ca : 85 55 __ STA T0 + 0 
69cc : ad a8 9e LDA $9ea8 ; (ftp_login@stack + 1)
69cf : 85 56 __ STA T0 + 1 
69d1 : 60 __ __ RTS
--------------------------------------------------------------------
ftp_type_binary: ; ftp_type_binary()->bool
; 920, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s1:
69d2 : a5 55 __ LDA T0 + 0 
69d4 : 8d fb 9e STA $9efb ; (ftp_type_binary@stack + 0)
69d7 : a5 56 __ LDA T0 + 1 
69d9 : 8d fc 9e STA $9efc ; (ftp_type_binary@stack + 1)
.s4:
69dc : a9 11 __ LDA #$11
69de : 8d e7 9f STA $9fe7 ; (sstack + 27)
69e1 : a9 6a __ LDA #$6a
69e3 : 8d e8 9f STA $9fe8 ; (sstack + 28)
69e6 : 20 7e 50 JSR $507e ; (ftp_command.s4 + 0)
69e9 : a5 29 __ LDA ACCU + 0 
69eb : 85 55 __ STA T0 + 0 
69ed : a5 2a __ LDA ACCU + 1 
69ef : 85 56 __ STA T0 + 1 
69f1 : 20 54 52 JSR $5254 ; (print_reply.s4 + 0)
69f4 : a5 56 __ LDA T0 + 1 
69f6 : d0 0a __ BNE $6a02 ; (ftp_type_binary.s6 + 0)
.s8:
69f8 : a5 55 __ LDA T0 + 0 
69fa : c9 c8 __ CMP #$c8
69fc : d0 04 __ BNE $6a02 ; (ftp_type_binary.s6 + 0)
.s5:
69fe : a9 01 __ LDA #$01
6a00 : d0 02 __ BNE $6a04 ; (ftp_type_binary.s7 + 0)
.s6:
6a02 : a9 00 __ LDA #$00
.s7:
6a04 : 85 29 __ STA ACCU + 0 
.s3:
6a06 : ad fb 9e LDA $9efb ; (ftp_type_binary@stack + 0)
6a09 : 85 55 __ STA T0 + 0 
6a0b : ad fc 9e LDA $9efc ; (ftp_type_binary@stack + 1)
6a0e : 85 56 __ STA T0 + 1 
6a10 : 60 __ __ RTS
--------------------------------------------------------------------
6a11 : __ __ __ BYT 54 59 50 45 20 49 00                            : TYPE I.
--------------------------------------------------------------------
6a18 : __ __ __ BYT 50 41 53 53 20 25 73 00                         : PASS %s.
--------------------------------------------------------------------
6a20 : __ __ __ BYT 75 73 61 67 65 3a 20 6c 6f 67 69 6e 20 3c 75 73 : usage: login <us
6a30 : __ __ __ BYT 65 72 3e 20 3c 70 61 73 73 3e 00                : er> <pass>.
--------------------------------------------------------------------
6a3b : __ __ __ BYT 64 69 72 00                                     : dir.
--------------------------------------------------------------------
ftp_list: ; ftp_list(const u8*)->bool
;1023, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s1:
6a3f : a5 55 __ LDA T0 + 0 
6a41 : 8d 90 9e STA $9e90 ; (ftp_list@stack + 0)
6a44 : a5 56 __ LDA T0 + 1 
6a46 : 8d 91 9e STA $9e91 ; (ftp_list@stack + 1)
.s4:
6a49 : 20 9b 6b JSR $6b9b ; (ftp_clear_remote_files.s4 + 0)
6a4c : a9 02 __ LDA #$02
6a4e : 8d a6 79 STA $79a6 ; (cur_rem_y + 0)
6a51 : a9 e7 __ LDA #$e7
6a53 : 8d e9 9f STA $9fe9 ; (sstack + 29)
6a56 : a9 9e __ LDA #$9e
6a58 : 8d ea 9f STA $9fea ; (sstack + 30)
6a5b : a9 e4 __ LDA #$e4
6a5d : 8d eb 9f STA $9feb ; (sstack + 31)
6a60 : a9 9e __ LDA #$9e
6a62 : 8d ec 9f STA $9fec ; (sstack + 32)
6a65 : 20 8a 57 JSR $578a ; (ftp_pasv.s1 + 0)
6a68 : a5 29 __ LDA ACCU + 0 
6a6a : d0 03 __ BNE $6a6f ; (ftp_list.s5 + 0)
6a6c : 4c 3b 6b JMP $6b3b ; (ftp_list.s3 + 0)
.s5:
6a6f : a9 01 __ LDA #$01
6a71 : 8d e1 9f STA $9fe1 ; (sstack + 21)
6a74 : a9 e7 __ LDA #$e7
6a76 : 8d e2 9f STA $9fe2 ; (sstack + 22)
6a79 : a9 9e __ LDA #$9e
6a7b : 8d e3 9f STA $9fe3 ; (sstack + 23)
6a7e : ad e4 9e LDA $9ee4 ; (port + 0)
6a81 : 8d e4 9f STA $9fe4 ; (sstack + 24)
6a84 : ad e5 9e LDA $9ee5 ; (port + 1)
6a87 : 8d e5 9f STA $9fe5 ; (sstack + 25)
6a8a : 20 25 59 JSR $5925 ; (wiz_open_link.s4 + 0)
6a8d : a5 29 __ LDA ACCU + 0 
6a8f : d0 23 __ BNE $6ab4 ; (ftp_list.s7 + 0)
.s6:
6a91 : a9 93 __ LDA #$93
6a93 : 85 23 __ STA P8 
6a95 : a9 59 __ LDA #$59
6a97 : 85 24 __ STA P9 
6a99 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
6a9c : a9 00 __ LDA #$00
6a9e : 85 25 __ STA P10 
6aa0 : a9 2c __ LDA #$2c
6aa2 : 8d cc 9f STA $9fcc ; (sstack + 0)
6aa5 : a9 4f __ LDA #$4f
6aa7 : 85 26 __ STA P11 
6aa9 : a9 3a __ LDA #$3a
6aab : 8d cd 9f STA $9fcd ; (sstack + 1)
6aae : 20 bb 17 JSR $17bb ; (textPrintNewLine.s4 + 0)
6ab1 : 4c 37 6b JMP $6b37 ; (ftp_list.s27 + 0)
.s7:
6ab4 : ad ee 9f LDA $9fee ; (sstack + 34)
6ab7 : 85 56 __ STA T0 + 1 
6ab9 : ad ed 9f LDA $9fed ; (sstack + 33)
6abc : 85 55 __ STA T0 + 0 
6abe : 05 56 __ ORA T0 + 1 
6ac0 : f0 2a __ BEQ $6aec ; (ftp_list.s8 + 0)
.s24:
6ac2 : a0 00 __ LDY #$00
6ac4 : b1 55 __ LDA (T0 + 0),y 
6ac6 : f0 24 __ BEQ $6aec ; (ftp_list.s8 + 0)
.s25:
6ac8 : a9 94 __ LDA #$94
6aca : 8d d4 9f STA $9fd4 ; (sstack + 8)
6acd : a9 9e __ LDA #$9e
6acf : 8d d5 9f STA $9fd5 ; (sstack + 9)
6ad2 : a5 55 __ LDA T0 + 0 
6ad4 : 8d d8 9f STA $9fd8 ; (sstack + 12)
6ad7 : a5 56 __ LDA T0 + 1 
6ad9 : 8d d9 9f STA $9fd9 ; (sstack + 13)
6adc : a9 bd __ LDA #$bd
6ade : 8d d6 9f STA $9fd6 ; (sstack + 10)
6ae1 : a9 6b __ LDA #$6b
6ae3 : 8d d7 9f STA $9fd7 ; (sstack + 11)
6ae6 : 20 3a 50 JSR $503a ; (sprintf.s4 + 0)
6ae9 : 4c f7 6a JMP $6af7 ; (ftp_list.s10 + 0)
.s8:
6aec : a2 ff __ LDX #$ff
.l9:
6aee : e8 __ __ INX
6aef : bd c5 6b LDA $6bc5,x 
6af2 : 9d 94 9e STA $9e94,x ; (cmd[0] + 0)
6af5 : d0 f7 __ BNE $6aee ; (ftp_list.l9 + 0)
.s10:
6af7 : a9 00 __ LDA #$00
6af9 : 8d b7 79 STA $79b7 ; (listlinelen + 0)
6afc : 8d ae 79 STA $79ae ; (data_closed + 0)
6aff : a9 94 __ LDA #$94
6b01 : 8d e7 9f STA $9fe7 ; (sstack + 27)
6b04 : a9 9e __ LDA #$9e
6b06 : 8d e8 9f STA $9fe8 ; (sstack + 28)
6b09 : a9 01 __ LDA #$01
6b0b : 8d b6 79 STA $79b6 ; (data_sink + 0)
6b0e : 20 7e 50 JSR $507e ; (ftp_command.s4 + 0)
6b11 : a5 29 __ LDA ACCU + 0 
6b13 : 85 55 __ STA T0 + 0 
6b15 : a5 2a __ LDA ACCU + 1 
6b17 : 85 56 __ STA T0 + 1 
6b19 : 20 54 52 JSR $5254 ; (print_reply.s4 + 0)
6b1c : a5 56 __ LDA T0 + 1 
6b1e : d0 0a __ BNE $6b2a ; (ftp_list.s21 + 0)
.s23:
6b20 : a5 55 __ LDA T0 + 0 
6b22 : c9 96 __ CMP #$96
6b24 : f0 20 __ BEQ $6b46 ; (ftp_list.s11 + 0)
.s22:
6b26 : c9 7d __ CMP #$7d
6b28 : f0 1c __ BEQ $6b46 ; (ftp_list.s11 + 0)
.s21:
6b2a : a9 01 __ LDA #$01
6b2c : 8d e1 9f STA $9fe1 ; (sstack + 21)
6b2f : a9 00 __ LDA #$00
6b31 : 8d b6 79 STA $79b6 ; (data_sink + 0)
6b34 : 20 00 5a JSR $5a00 ; (wiz_close_link.s4 + 0)
.s27:
6b37 : a9 00 __ LDA #$00
.s26:
6b39 : 85 29 __ STA ACCU + 0 
.s3:
6b3b : ad 90 9e LDA $9e90 ; (ftp_list@stack + 0)
6b3e : 85 55 __ STA T0 + 0 
6b40 : ad 91 9e LDA $9e91 ; (ftp_list@stack + 1)
6b43 : 85 56 __ STA T0 + 1 
6b45 : 60 __ __ RTS
.s11:
6b46 : ad ae 79 LDA $79ae ; (data_closed + 0)
6b49 : d0 26 __ BNE $6b71 ; (ftp_list.s17 + 0)
.s12:
6b4b : 85 55 __ STA T0 + 0 
.l13:
6b4d : 20 9d 1a JSR $1a9d ; (wiz_poll_any.s4 + 0)
6b50 : aa __ __ TAX
6b51 : d0 0d __ BNE $6b60 ; (ftp_list.s15 + 0)
.s14:
6b53 : a9 01 __ LDA #$01
6b55 : 85 1d __ STA P2 
6b57 : 20 2c 19 JSR $192c ; (lilpause.s4 + 0)
6b5a : e6 55 __ INC T0 + 0 
6b5c : d0 02 __ BNE $6b60 ; (ftp_list.s15 + 0)
.s28:
6b5e : e6 56 __ INC T0 + 1 
.s15:
6b60 : ad ae 79 LDA $79ae ; (data_closed + 0)
6b63 : d0 0c __ BNE $6b71 ; (ftp_list.s17 + 0)
.s16:
6b65 : a5 56 __ LDA T0 + 1 
6b67 : c9 0b __ CMP #$0b
6b69 : d0 e2 __ BNE $6b4d ; (ftp_list.l13 + 0)
.s20:
6b6b : a5 55 __ LDA T0 + 0 
6b6d : c9 b8 __ CMP #$b8
6b6f : d0 dc __ BNE $6b4d ; (ftp_list.l13 + 0)
.s17:
6b71 : a9 27 __ LDA #$27
6b73 : 85 1d __ STA P2 
6b75 : a9 00 __ LDA #$00
6b77 : 8d b6 79 STA $79b6 ; (data_sink + 0)
6b7a : 20 76 17 JSR $1776 ; (initTextXY.s4 + 0)
6b7d : 20 a1 23 JSR $23a1 ; (flush_listline.s4 + 0)
6b80 : a9 e8 __ LDA #$e8
6b82 : 8d db 9f STA $9fdb ; (sstack + 15)
6b85 : a9 03 __ LDA #$03
6b87 : 8d dc 9f STA $9fdc ; (sstack + 16)
6b8a : 20 f6 51 JSR $51f6 ; (ftp_wait_reply.s1 + 0)
6b8d : a5 29 __ LDA ACCU + 0 
6b8f : f0 03 __ BEQ $6b94 ; (ftp_list.s18 + 0)
.s19:
6b91 : 20 54 52 JSR $5254 ; (print_reply.s4 + 0)
.s18:
6b94 : a9 01 __ LDA #$01
6b96 : 8d 59 7a STA $7a59 ; (isRemoteListed + 0)
6b99 : d0 9e __ BNE $6b39 ; (ftp_list.s26 + 0)
--------------------------------------------------------------------
ftp_clear_remote_files: ; ftp_clear_remote_files()->void
;1016, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s4:
6b9b : a9 7d __ LDA #$7d
6b9d : 85 2a __ STA ACCU + 1 
6b9f : a9 00 __ LDA #$00
6ba1 : 85 29 __ STA ACCU + 0 
6ba3 : a0 50 __ LDY #$50
.l5:
6ba5 : a9 00 __ LDA #$00
6ba7 : 91 29 __ STA (ACCU + 0),y 
6ba9 : 98 __ __ TYA
6baa : 18 __ __ CLC
6bab : 69 1d __ ADC #$1d
6bad : a8 __ __ TAY
6bae : 90 02 __ BCC $6bb2 ; (ftp_clear_remote_files.s8 + 0)
.s7:
6bb0 : e6 2a __ INC ACCU + 1 
.s8:
6bb2 : c0 d8 __ CPY #$d8
6bb4 : d0 ef __ BNE $6ba5 ; (ftp_clear_remote_files.l5 + 0)
.s6:
6bb6 : a5 2a __ LDA ACCU + 1 
6bb8 : c9 81 __ CMP #$81
6bba : d0 e9 __ BNE $6ba5 ; (ftp_clear_remote_files.l5 + 0)
.s3:
6bbc : 60 __ __ RTS
--------------------------------------------------------------------
6bbd : __ __ __ BYT 4c 49 53 54 20 25 73 00                         : LIST %s.
--------------------------------------------------------------------
6bc5 : __ __ __ BYT 4c 49 53 54 00                                  : LIST.
--------------------------------------------------------------------
ftp_cwd: ; ftp_cwd(const u8*)->bool
; 948, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s1:
6bca : a2 05 __ LDX #$05
6bcc : b5 55 __ LDA T0 + 0,x 
6bce : 9d a5 9e STA $9ea5,x ; (ftp_cwd@stack + 0)
6bd1 : ca __ __ DEX
6bd2 : 10 f8 __ BPL $6bcc ; (ftp_cwd.s1 + 2)
.s4:
6bd4 : ad e9 9f LDA $9fe9 ; (sstack + 29)
6bd7 : 85 57 __ STA T2 + 0 
6bd9 : 8d d8 9f STA $9fd8 ; (sstack + 12)
6bdc : a9 ad __ LDA #$ad
6bde : 8d d4 9f STA $9fd4 ; (sstack + 8)
6be1 : a9 9e __ LDA #$9e
6be3 : 8d d5 9f STA $9fd5 ; (sstack + 9)
6be6 : a9 97 __ LDA #$97
6be8 : 8d d6 9f STA $9fd6 ; (sstack + 10)
6beb : a9 6c __ LDA #$6c
6bed : 8d d7 9f STA $9fd7 ; (sstack + 11)
6bf0 : ad ea 9f LDA $9fea ; (sstack + 30)
6bf3 : 85 58 __ STA T2 + 1 
6bf5 : 8d d9 9f STA $9fd9 ; (sstack + 13)
6bf8 : 20 3a 50 JSR $503a ; (sprintf.s4 + 0)
6bfb : a9 ad __ LDA #$ad
6bfd : 8d e7 9f STA $9fe7 ; (sstack + 27)
6c00 : a9 9e __ LDA #$9e
6c02 : 8d e8 9f STA $9fe8 ; (sstack + 28)
6c05 : 20 7e 50 JSR $507e ; (ftp_command.s4 + 0)
6c08 : a5 29 __ LDA ACCU + 0 
6c0a : 85 55 __ STA T0 + 0 
6c0c : a5 2a __ LDA ACCU + 1 
6c0e : 85 56 __ STA T0 + 1 
6c10 : 20 54 52 JSR $5254 ; (print_reply.s4 + 0)
6c13 : a5 56 __ LDA T0 + 1 
6c15 : d0 06 __ BNE $6c1d ; (ftp_cwd.s6 + 0)
.s7:
6c17 : a5 55 __ LDA T0 + 0 
6c19 : c9 fa __ CMP #$fa
6c1b : f0 13 __ BEQ $6c30 ; (ftp_cwd.s5 + 0)
.s6:
6c1d : a9 00 __ LDA #$00
6c1f : 85 59 __ STA T3 + 0 
.s8:
6c21 : a5 59 __ LDA T3 + 0 
.s3:
6c23 : 85 29 __ STA ACCU + 0 
6c25 : a2 05 __ LDX #$05
6c27 : bd a5 9e LDA $9ea5,x ; (ftp_cwd@stack + 0)
6c2a : 95 55 __ STA T0 + 0,x 
6c2c : ca __ __ DEX
6c2d : 10 f8 __ BPL $6c27 ; (ftp_cwd.s3 + 4)
6c2f : 60 __ __ RTS
.s5:
6c30 : a9 01 __ LDA #$01
6c32 : 85 59 __ STA T3 + 0 
6c34 : a9 0d __ LDA #$0d
6c36 : 85 1b __ STA P0 
6c38 : a9 00 __ LDA #$00
6c3a : 85 1c __ STA P1 
6c3c : a0 ff __ LDY #$ff
.l9:
6c3e : c8 __ __ INY
6c3f : b1 57 __ LDA (T2 + 0),y 
6c41 : 99 c1 79 STA $79c1,y ; (remoteDirectory[0] + 0)
6c44 : d0 f8 __ BNE $6c3e ; (ftp_cwd.l9 + 0)
.s10:
6c46 : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
6c49 : a9 1a __ LDA #$1a
6c4b : 85 5a __ STA T4 + 0 
6c4d : a9 74 __ LDA #$74
6c4f : 85 23 __ STA P8 
6c51 : a9 17 __ LDA #$17
6c53 : 85 24 __ STA P9 
.l13:
6c55 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
6c58 : c6 5a __ DEC T4 + 0 
6c5a : d0 f9 __ BNE $6c55 ; (ftp_cwd.l13 + 0)
.s11:
6c5c : a9 0d __ LDA #$0d
6c5e : 85 1b __ STA P0 
6c60 : a9 00 __ LDA #$00
6c62 : 85 1c __ STA P1 
6c64 : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
6c67 : a9 fd __ LDA #$fd
6c69 : 85 23 __ STA P8 
6c6b : a9 14 __ LDA #$14
6c6d : 85 24 __ STA P9 
6c6f : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
6c72 : a5 57 __ LDA T2 + 0 
6c74 : 85 1b __ STA P0 
6c76 : a5 58 __ LDA T2 + 1 
6c78 : 85 1c __ STA P1 
6c7a : a9 fd __ LDA #$fd
6c7c : 85 1d __ STA P2 
6c7e : a9 29 __ LDA #$29
6c80 : 85 1e __ STA P3 
6c82 : 20 c3 1d JSR $1dc3 ; (strcmp.s4 + 0)
6c85 : aa __ __ TAX
6c86 : f0 99 __ BEQ $6c21 ; (ftp_cwd.s8 + 0)
.s12:
6c88 : a9 c1 __ LDA #$c1
6c8a : 85 23 __ STA P8 
6c8c : a9 79 __ LDA #$79
6c8e : 85 24 __ STA P9 
6c90 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
6c93 : a9 01 __ LDA #$01
6c95 : d0 8c __ BNE $6c23 ; (ftp_cwd.s3 + 0)
--------------------------------------------------------------------
6c97 : __ __ __ BYT 43 57 44 20 25 73 00                            : CWD %s.
--------------------------------------------------------------------
6c9e : __ __ __ BYT 75 73 61 67 65 3a 20 63 64 20 3c 70 61 74 68 3e : usage: cd <path>
6cae : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
6caf : __ __ __ BYT 6c 63 64 00                                     : lcd.
--------------------------------------------------------------------
6cb3 : __ __ __ BYT 75 73 61 67 65 3a 20 6c 63 64 20 3c 70 61 74 68 : usage: lcd <path
6cc3 : __ __ __ BYT 3e 00                                           : >.
--------------------------------------------------------------------
6cc5 : __ __ __ BYT 70 77 64 00                                     : pwd.
--------------------------------------------------------------------
ftp_pwd: ; ftp_pwd()->bool
; 969, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s1:
6cc9 : a5 55 __ LDA T0 + 0 
6ccb : 8d fb 9e STA $9efb ; (ftp_pwd@stack + 0)
6cce : a5 56 __ LDA T0 + 1 
6cd0 : 8d fc 9e STA $9efc ; (ftp_pwd@stack + 1)
.s4:
6cd3 : a9 05 __ LDA #$05
6cd5 : 8d e7 9f STA $9fe7 ; (sstack + 27)
6cd8 : a9 6d __ LDA #$6d
6cda : 8d e8 9f STA $9fe8 ; (sstack + 28)
6cdd : 20 7e 50 JSR $507e ; (ftp_command.s4 + 0)
6ce0 : a5 29 __ LDA ACCU + 0 
6ce2 : 85 55 __ STA T0 + 0 
6ce4 : a5 2a __ LDA ACCU + 1 
6ce6 : 85 56 __ STA T0 + 1 
6ce8 : 20 54 52 JSR $5254 ; (print_reply.s4 + 0)
6ceb : a6 56 __ LDX T0 + 1 
6ced : ca __ __ DEX
6cee : d0 06 __ BNE $6cf6 ; (ftp_pwd.s5 + 0)
.s7:
6cf0 : a5 55 __ LDA T0 + 0 
6cf2 : c9 01 __ CMP #$01
6cf4 : f0 02 __ BEQ $6cf8 ; (ftp_pwd.s6 + 0)
.s5:
6cf6 : a9 00 __ LDA #$00
.s6:
6cf8 : 85 29 __ STA ACCU + 0 
.s3:
6cfa : ad fb 9e LDA $9efb ; (ftp_pwd@stack + 0)
6cfd : 85 55 __ STA T0 + 0 
6cff : ad fc 9e LDA $9efc ; (ftp_pwd@stack + 1)
6d02 : 85 56 __ STA T0 + 1 
6d04 : 60 __ __ RTS
--------------------------------------------------------------------
6d05 : __ __ __ BYT 50 57 44 00                                     : PWD.
--------------------------------------------------------------------
6d09 : __ __ __ BYT 67 65 74 00                                     : get.
--------------------------------------------------------------------
6d0d : __ __ __ BYT 75 73 61 67 65 3a 20 67 65 74 20 3c 72 65 6d 6f : usage: get <remo
6d1d : __ __ __ BYT 74 65 3e 20 5b 6c 6f 63 61 6c 5d 00             : te> [local].
--------------------------------------------------------------------
6d29 : __ __ __ BYT 70 75 74 00                                     : put.
--------------------------------------------------------------------
ftp_stor: ; ftp_stor(const u8*,const u8*)->bool
;1236, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s1:
6d2d : a2 08 __ LDX #$08
6d2f : b5 55 __ LDA T0 + 0,x 
6d31 : 9d 09 9e STA $9e09,x ; (ftp_stor@stack + 0)
6d34 : ca __ __ DEX
6d35 : 10 f8 __ BPL $6d2f ; (ftp_stor.s1 + 2)
.s4:
6d37 : ad ed 9f LDA $9fed ; (sstack + 33)
6d3a : 85 57 __ STA T1 + 0 
6d3c : 85 21 __ STA P6 
6d3e : ad ee 9f LDA $9fee ; (sstack + 34)
6d41 : 85 58 __ STA T1 + 1 
6d43 : 85 22 __ STA P7 
6d45 : a9 5e __ LDA #$5e
6d47 : 85 23 __ STA P8 
6d49 : a9 6f __ LDA #$6f
6d4b : 85 24 __ STA P9 
6d4d : 20 e8 54 JSR $54e8 ; (fileOpen.s4 + 0)
6d50 : a5 2a __ LDA ACCU + 1 
6d52 : 05 29 __ ORA ACCU + 0 
6d54 : d0 35 __ BNE $6d8b ; (ftp_stor.s6 + 0)
.s5:
6d56 : a9 4f __ LDA #$4f
6d58 : 85 1d __ STA P2 
6d5a : 20 76 17 JSR $1776 ; (initTextXY.s4 + 0)
6d5d : a9 61 __ LDA #$61
6d5f : 85 23 __ STA P8 
6d61 : a9 6f __ LDA #$6f
6d63 : 85 24 __ STA P9 
6d65 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
6d68 : a5 57 __ LDA T1 + 0 
6d6a : 85 23 __ STA P8 
6d6c : a5 58 __ LDA T1 + 1 
6d6e : 85 24 __ STA P9 
6d70 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
6d73 : a9 00 __ LDA #$00
6d75 : 85 25 __ STA P10 
6d77 : a9 2c __ LDA #$2c
6d79 : 8d cc 9f STA $9fcc ; (sstack + 0)
6d7c : a9 4f __ LDA #$4f
6d7e : 85 26 __ STA P11 
6d80 : a9 3a __ LDA #$3a
6d82 : 8d cd 9f STA $9fcd ; (sstack + 1)
6d85 : 20 bb 17 JSR $17bb ; (textPrintNewLine.s4 + 0)
6d88 : 4c 02 6e JMP $6e02 ; (ftp_stor.s21 + 0)
.s6:
6d8b : a5 2a __ LDA ACCU + 1 
6d8d : 85 5a __ STA T2 + 1 
6d8f : a5 29 __ LDA ACCU + 0 
6d91 : 85 59 __ STA T2 + 0 
6d93 : a9 e7 __ LDA #$e7
6d95 : 8d e9 9f STA $9fe9 ; (sstack + 29)
6d98 : a9 9e __ LDA #$9e
6d9a : 8d ea 9f STA $9fea ; (sstack + 30)
6d9d : a9 e4 __ LDA #$e4
6d9f : 8d eb 9f STA $9feb ; (sstack + 31)
6da2 : a9 9e __ LDA #$9e
6da4 : 8d ec 9f STA $9fec ; (sstack + 32)
6da7 : 20 8a 57 JSR $578a ; (ftp_pasv.s1 + 0)
6daa : a5 29 __ LDA ACCU + 0 
6dac : f0 49 __ BEQ $6df7 ; (ftp_stor.s22 + 0)
.s7:
6dae : a9 01 __ LDA #$01
6db0 : 8d e1 9f STA $9fe1 ; (sstack + 21)
6db3 : a9 e7 __ LDA #$e7
6db5 : 8d e2 9f STA $9fe2 ; (sstack + 22)
6db8 : a9 9e __ LDA #$9e
6dba : 8d e3 9f STA $9fe3 ; (sstack + 23)
6dbd : ad e4 9e LDA $9ee4 ; (port + 0)
6dc0 : 8d e4 9f STA $9fe4 ; (sstack + 24)
6dc3 : ad e5 9e LDA $9ee5 ; (port + 1)
6dc6 : 8d e5 9f STA $9fe5 ; (sstack + 25)
6dc9 : 20 25 59 JSR $5925 ; (wiz_open_link.s4 + 0)
6dcc : a5 29 __ LDA ACCU + 0 
6dce : d0 41 __ BNE $6e11 ; (ftp_stor.s9 + 0)
.s8:
6dd0 : a9 4f __ LDA #$4f
6dd2 : 85 1d __ STA P2 
6dd4 : 20 76 17 JSR $1776 ; (initTextXY.s4 + 0)
6dd7 : a9 93 __ LDA #$93
6dd9 : 85 23 __ STA P8 
6ddb : a9 59 __ LDA #$59
6ddd : 85 24 __ STA P9 
6ddf : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
6de2 : a9 00 __ LDA #$00
6de4 : 85 25 __ STA P10 
6de6 : a9 2c __ LDA #$2c
6de8 : 8d cc 9f STA $9fcc ; (sstack + 0)
6deb : a9 4f __ LDA #$4f
6ded : 85 26 __ STA P11 
6def : a9 3a __ LDA #$3a
6df1 : 8d cd 9f STA $9fcd ; (sstack + 1)
6df4 : 20 bb 17 JSR $17bb ; (textPrintNewLine.s4 + 0)
.s22:
6df7 : a5 59 __ LDA T2 + 0 
6df9 : 85 1b __ STA P0 
6dfb : a5 5a __ LDA T2 + 1 
6dfd : 85 1c __ STA P1 
6dff : 20 50 5a JSR $5a50 ; (fileClose.s4 + 0)
.s21:
6e02 : a9 00 __ LDA #$00
.s3:
6e04 : 85 29 __ STA ACCU + 0 
6e06 : a2 08 __ LDX #$08
6e08 : bd 09 9e LDA $9e09,x ; (ftp_stor@stack + 0)
6e0b : 95 55 __ STA T0 + 0,x 
6e0d : ca __ __ DEX
6e0e : 10 f8 __ BPL $6e08 ; (ftp_stor.s3 + 4)
6e10 : 60 __ __ RTS
.s9:
6e11 : ad ef 9f LDA $9fef ; (sstack + 35)
6e14 : 85 5b __ STA T4 + 0 
6e16 : 8d d8 9f STA $9fd8 ; (sstack + 12)
6e19 : a9 94 __ LDA #$94
6e1b : 8d d4 9f STA $9fd4 ; (sstack + 8)
6e1e : a9 9e __ LDA #$9e
6e20 : 8d d5 9f STA $9fd5 ; (sstack + 9)
6e23 : a9 79 __ LDA #$79
6e25 : 8d d6 9f STA $9fd6 ; (sstack + 10)
6e28 : a9 6f __ LDA #$6f
6e2a : 8d d7 9f STA $9fd7 ; (sstack + 11)
6e2d : ad f0 9f LDA $9ff0 ; (sstack + 36)
6e30 : 85 5c __ STA T4 + 1 
6e32 : 8d d9 9f STA $9fd9 ; (sstack + 13)
6e35 : 20 3a 50 JSR $503a ; (sprintf.s4 + 0)
6e38 : a9 94 __ LDA #$94
6e3a : 8d e7 9f STA $9fe7 ; (sstack + 27)
6e3d : a9 9e __ LDA #$9e
6e3f : 8d e8 9f STA $9fe8 ; (sstack + 28)
6e42 : 20 7e 50 JSR $507e ; (ftp_command.s4 + 0)
6e45 : a5 29 __ LDA ACCU + 0 
6e47 : 85 55 __ STA T0 + 0 
6e49 : a5 2a __ LDA ACCU + 1 
6e4b : 85 56 __ STA T0 + 1 
6e4d : 20 54 52 JSR $5254 ; (print_reply.s4 + 0)
6e50 : a5 56 __ LDA T0 + 1 
6e52 : d0 0a __ BNE $6e5e ; (ftp_stor.s18 + 0)
.s20:
6e54 : a5 55 __ LDA T0 + 0 
6e56 : c9 96 __ CMP #$96
6e58 : f0 1a __ BEQ $6e74 ; (ftp_stor.s10 + 0)
.s19:
6e5a : c9 7d __ CMP #$7d
6e5c : f0 16 __ BEQ $6e74 ; (ftp_stor.s10 + 0)
.s18:
6e5e : a5 59 __ LDA T2 + 0 
6e60 : 85 1b __ STA P0 
6e62 : a5 5a __ LDA T2 + 1 
6e64 : 85 1c __ STA P1 
6e66 : 20 50 5a JSR $5a50 ; (fileClose.s4 + 0)
6e69 : a9 01 __ LDA #$01
6e6b : 8d e1 9f STA $9fe1 ; (sstack + 21)
6e6e : 20 00 5a JSR $5a00 ; (wiz_close_link.s4 + 0)
6e71 : 4c 02 6e JMP $6e02 ; (ftp_stor.s21 + 0)
.s10:
6e74 : a9 00 __ LDA #$00
6e76 : 85 5d __ STA T6 + 0 
.l11:
6e78 : a9 00 __ LDA #$00
6e7a : 85 23 __ STA P8 
6e7c : 85 25 __ STA P10 
6e7e : a9 01 __ LDA #$01
6e80 : 85 22 __ STA P7 
6e82 : a5 59 __ LDA T2 + 0 
6e84 : 8d cc 9f STA $9fcc ; (sstack + 0)
6e87 : a9 80 __ LDA #$80
6e89 : 85 24 __ STA P9 
6e8b : a5 5a __ LDA T2 + 1 
6e8d : 8d cd 9f STA $9fcd ; (sstack + 1)
6e90 : a9 14 __ LDA #$14
6e92 : 85 20 __ STA P5 
6e94 : a9 9e __ LDA #$9e
6e96 : 85 21 __ STA P6 
6e98 : 20 81 6f JSR $6f81 ; (fileRead.s4 + 0)
6e9b : a5 2a __ LDA ACCU + 1 
6e9d : 05 29 __ ORA ACCU + 0 
6e9f : f0 49 __ BEQ $6eea ; (ftp_stor.s12 + 0)
.s16:
6ea1 : a9 01 __ LDA #$01
6ea3 : 8d e0 9f STA $9fe0 ; (sstack + 20)
6ea6 : a9 14 __ LDA #$14
6ea8 : 8d e1 9f STA $9fe1 ; (sstack + 21)
6eab : a9 9e __ LDA #$9e
6ead : 8d e2 9f STA $9fe2 ; (sstack + 22)
6eb0 : a5 29 __ LDA ACCU + 0 
6eb2 : 8d e3 9f STA $9fe3 ; (sstack + 23)
6eb5 : a5 2a __ LDA ACCU + 1 
6eb7 : 8d e4 9f STA $9fe4 ; (sstack + 24)
6eba : 20 ff 50 JSR $50ff ; (wiz_cipsend.s1 + 0)
6ebd : a5 29 __ LDA ACCU + 0 
6ebf : d0 b7 __ BNE $6e78 ; (ftp_stor.l11 + 0)
.s17:
6ec1 : a9 4f __ LDA #$4f
6ec3 : 85 1d __ STA P2 
6ec5 : 20 76 17 JSR $1776 ; (initTextXY.s4 + 0)
6ec8 : a9 06 __ LDA #$06
6eca : 85 23 __ STA P8 
6ecc : a9 71 __ LDA #$71
6ece : 85 24 __ STA P9 
6ed0 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
6ed3 : a9 00 __ LDA #$00
6ed5 : 85 25 __ STA P10 
6ed7 : a9 2c __ LDA #$2c
6ed9 : 8d cc 9f STA $9fcc ; (sstack + 0)
6edc : a9 4f __ LDA #$4f
6ede : 85 26 __ STA P11 
6ee0 : a9 3a __ LDA #$3a
6ee2 : 8d cd 9f STA $9fcd ; (sstack + 1)
6ee5 : 20 bb 17 JSR $17bb ; (textPrintNewLine.s4 + 0)
6ee8 : e6 5d __ INC T6 + 0 
.s12:
6eea : a5 59 __ LDA T2 + 0 
6eec : 85 1b __ STA P0 
6eee : a5 5a __ LDA T2 + 1 
6ef0 : 85 1c __ STA P1 
6ef2 : 20 50 5a JSR $5a50 ; (fileClose.s4 + 0)
6ef5 : a9 01 __ LDA #$01
6ef7 : 8d e1 9f STA $9fe1 ; (sstack + 21)
6efa : 20 00 5a JSR $5a00 ; (wiz_close_link.s4 + 0)
6efd : a5 5d __ LDA T6 + 0 
6eff : f0 03 __ BEQ $6f04 ; (ftp_stor.s13 + 0)
6f01 : 4c 02 6e JMP $6e02 ; (ftp_stor.s21 + 0)
.s13:
6f04 : a9 d0 __ LDA #$d0
6f06 : 8d db 9f STA $9fdb ; (sstack + 15)
6f09 : a9 07 __ LDA #$07
6f0b : 8d dc 9f STA $9fdc ; (sstack + 16)
6f0e : 20 f6 51 JSR $51f6 ; (ftp_wait_reply.s1 + 0)
6f11 : a5 29 __ LDA ACCU + 0 
6f13 : f0 03 __ BEQ $6f18 ; (ftp_stor.s14 + 0)
.s15:
6f15 : 20 54 52 JSR $5254 ; (print_reply.s4 + 0)
.s14:
6f18 : a9 19 __ LDA #$19
6f1a : 85 23 __ STA P8 
6f1c : a9 71 __ LDA #$71
6f1e : 85 24 __ STA P9 
6f20 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
6f23 : a5 57 __ LDA T1 + 0 
6f25 : 85 23 __ STA P8 
6f27 : a5 58 __ LDA T1 + 1 
6f29 : 85 24 __ STA P9 
6f2b : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
6f2e : a9 c6 __ LDA #$c6
6f30 : 85 23 __ STA P8 
6f32 : a9 5a __ LDA #$5a
6f34 : 85 24 __ STA P9 
6f36 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
6f39 : a5 5b __ LDA T4 + 0 
6f3b : 85 23 __ STA P8 
6f3d : a5 5c __ LDA T4 + 1 
6f3f : 85 24 __ STA P9 
6f41 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
6f44 : a9 00 __ LDA #$00
6f46 : 85 25 __ STA P10 
6f48 : a9 2c __ LDA #$2c
6f4a : 8d cc 9f STA $9fcc ; (sstack + 0)
6f4d : a9 4f __ LDA #$4f
6f4f : 85 26 __ STA P11 
6f51 : a9 3a __ LDA #$3a
6f53 : 8d cd 9f STA $9fcd ; (sstack + 1)
6f56 : 20 bb 17 JSR $17bb ; (textPrintNewLine.s4 + 0)
6f59 : a9 01 __ LDA #$01
6f5b : 4c 04 6e JMP $6e04 ; (ftp_stor.s3 + 0)
--------------------------------------------------------------------
6f5e : __ __ __ BYT 72 62 00                                        : rb.
--------------------------------------------------------------------
6f61 : __ __ __ BYT 43 61 6e 6e 6f 74 20 6f 70 65 6e 20 6c 6f 63 61 : Cannot open loca
6f71 : __ __ __ BYT 6c 20 66 69 6c 65 20 00                         : l file .
--------------------------------------------------------------------
6f79 : __ __ __ BYT 53 54 4f 52 20 25 73 00                         : STOR %s.
--------------------------------------------------------------------
fileRead: ; fileRead(void*,u16,u16,u8*)->i16
;  27, "/mnt/d/F256/f256lib-oscar64/f256lib/f_file.h"
.s4:
6f81 : a9 00 __ LDA #$00
6f83 : 85 37 __ STA T1 + 0 
6f85 : 85 38 __ STA T1 + 1 
6f87 : a5 22 __ LDA P7 ; (nbytes + 0)
6f89 : 85 11 __ STA WORK + 0 
6f8b : a5 23 __ LDA P8 ; (nbytes + 1)
6f8d : 85 12 __ STA WORK + 1 
6f8f : a5 24 __ LDA P9 ; (nmemb + 0)
6f91 : 85 29 __ STA ACCU + 0 
6f93 : a5 25 __ LDA P10 ; (nmemb + 1)
6f95 : 85 2a __ STA ACCU + 1 
6f97 : 20 76 75 JSR $7576 ; (mul16 + 0)
6f9a : a5 14 __ LDA WORK + 3 
6f9c : 05 13 __ ORA WORK + 2 
6f9e : f0 67 __ BEQ $7007 ; (fileRead.s13 + 0)
.s6:
6fa0 : a5 14 __ LDA WORK + 3 
6fa2 : 85 3a __ STA T3 + 1 
6fa4 : a5 13 __ LDA WORK + 2 
6fa6 : 85 39 __ STA T3 + 0 
6fa8 : ad cc 9f LDA $9fcc ; (sstack + 0)
6fab : 85 3b __ STA T5 + 0 
6fad : ad cd 9f LDA $9fcd ; (sstack + 1)
6fb0 : 85 3c __ STA T5 + 1 
.l7:
6fb2 : a0 00 __ LDY #$00
6fb4 : b1 3b __ LDA (T5 + 0),y 
6fb6 : 85 1b __ STA P0 
6fb8 : 18 __ __ CLC
6fb9 : a5 20 __ LDA P5 ; (buf + 0)
6fbb : 65 37 __ ADC T1 + 0 
6fbd : 85 1c __ STA P1 
6fbf : a5 21 __ LDA P6 ; (buf + 1)
6fc1 : 65 38 __ ADC T1 + 1 
6fc3 : 85 1d __ STA P2 
6fc5 : 38 __ __ SEC
6fc6 : a5 39 __ LDA T3 + 0 
6fc8 : e5 37 __ SBC T1 + 0 
6fca : 85 1e __ STA P3 
6fcc : a5 3a __ LDA T3 + 1 
6fce : e5 38 __ SBC T1 + 1 
6fd0 : 85 1f __ STA P4 
6fd2 : 20 13 70 JSR $7013 ; (kernelRead.s4 + 0)
6fd5 : a5 2a __ LDA ACCU + 1 
6fd7 : 30 33 __ BMI $700c ; (fileRead.s11 + 0)
.s8:
6fd9 : 05 29 __ ORA ACCU + 0 
6fdb : f0 2a __ BEQ $7007 ; (fileRead.s13 + 0)
.s9:
6fdd : 18 __ __ CLC
6fde : a5 37 __ LDA T1 + 0 
6fe0 : 65 29 __ ADC ACCU + 0 
6fe2 : 85 37 __ STA T1 + 0 
6fe4 : a5 38 __ LDA T1 + 1 
6fe6 : 65 2a __ ADC ACCU + 1 
6fe8 : 85 38 __ STA T1 + 1 
6fea : c5 3a __ CMP T3 + 1 
6fec : 90 c4 __ BCC $6fb2 ; (fileRead.l7 + 0)
.s12:
6fee : d0 17 __ BNE $7007 ; (fileRead.s13 + 0)
.s10:
6ff0 : a5 37 __ LDA T1 + 0 
6ff2 : c5 39 __ CMP T3 + 0 
6ff4 : 90 bc __ BCC $6fb2 ; (fileRead.l7 + 0)
.s5:
6ff6 : 85 29 __ STA ACCU + 0 
6ff8 : a5 38 __ LDA T1 + 1 
6ffa : 85 2a __ STA ACCU + 1 
6ffc : a5 22 __ LDA P7 ; (nbytes + 0)
6ffe : 85 11 __ STA WORK + 0 
7000 : a5 23 __ LDA P8 ; (nbytes + 1)
7002 : 85 12 __ STA WORK + 1 
7004 : 4c f2 75 JMP $75f2 ; (divmod + 0)
.s13:
7007 : a5 37 __ LDA T1 + 0 
7009 : 4c f6 6f JMP $6ff6 ; (fileRead.s5 + 0)
.s11:
700c : a9 ff __ LDA #$ff
700e : 85 29 __ STA ACCU + 0 
7010 : 85 2a __ STA ACCU + 1 
.s3:
7012 : 60 __ __ RTS
--------------------------------------------------------------------
kernelRead: ; kernelRead(u8,void*,u16)->i16
;  31, "/mnt/d/F256/f256lib-oscar64/f256lib/f_file.c"
.s4:
7013 : a5 1b __ LDA P0 ; (fd + 0)
7015 : d0 12 __ BNE $7029 ; (kernelRead.s6 + 0)
.s5:
7017 : 20 a8 70 JSR $70a8 ; (f256getchar.l4 + 0)
701a : a5 29 __ LDA ACCU + 0 
701c : a0 00 __ LDY #$00
701e : 91 1c __ STA (P1),y ; (buf + 0)
7020 : a9 01 __ LDA #$01
.s20:
7022 : 85 29 __ STA ACCU + 0 
7024 : a9 00 __ LDA #$00
.s3:
7026 : 85 2a __ STA ACCU + 1 
7028 : 60 __ __ RTS
.s6:
7029 : a2 60 __ LDX #$60
702b : 8e cb 7a STX $7acb ; (_kern_target + 0)
702e : a2 ff __ LDX #$ff
7030 : 8e cc 7a STX $7acc ; (_kern_target + 1)
7033 : ae 64 7a LDX $7a64 ; (kernelArgs + 0)
7036 : 86 35 __ STX T1 + 0 
7038 : ae 65 7a LDX $7a65 ; (kernelArgs + 1)
703b : 86 36 __ STX T1 + 1 
703d : a0 03 __ LDY #$03
703f : 91 35 __ STA (T1 + 0),y 
7041 : a9 01 __ LDA #$01
7043 : c5 1f __ CMP P4 ; (nbytes + 1)
7045 : f0 04 __ BEQ $704b ; (kernelRead.s16 + 0)
.s17:
7047 : 90 06 __ BCC $704f ; (kernelRead.s15 + 0)
7049 : b0 08 __ BCS $7053 ; (kernelRead.s7 + 0)
.s16:
704b : a5 1e __ LDA P3 ; (nbytes + 0)
704d : f0 04 __ BEQ $7053 ; (kernelRead.s7 + 0)
.s15:
704f : a9 00 __ LDA #$00
7051 : f0 02 __ BEQ $7055 ; (kernelRead.s18 + 0)
.s7:
7053 : a5 1e __ LDA P3 ; (nbytes + 0)
.s18:
7055 : a0 04 __ LDY #$04
7057 : 91 35 __ STA (T1 + 0),y 
7059 : 20 2f 29 JSR $292f ; (_kernelCallWrapper.s4 + 0)
705c : ad cd 7a LDA $7acd ; (_kernelError + 0)
705f : d0 12 __ BNE $7073 ; (kernelRead.s11 + 0)
.l8:
7061 : 20 4f 29 JSR $294f ; (kernelNextEvent.s4 + 0)
7064 : ad 66 7a LDA $7a66 ; (kernelEventData.type + 0)
7067 : c9 2c __ CMP #$2c
7069 : f0 13 __ BEQ $707e ; (kernelRead.s13 + 0)
.s9:
706b : c9 30 __ CMP #$30
706d : f0 0b __ BEQ $707a ; (kernelRead.s12 + 0)
.s10:
706f : c9 38 __ CMP #$38
7071 : d0 ee __ BNE $7061 ; (kernelRead.l8 + 0)
.s11:
7073 : a9 ff __ LDA #$ff
.s19:
7075 : 85 29 __ STA ACCU + 0 
7077 : 4c 26 70 JMP $7026 ; (kernelRead.s3 + 0)
.s12:
707a : a9 00 __ LDA #$00
707c : f0 f7 __ BEQ $7075 ; (kernelRead.s19 + 0)
.s13:
707e : a5 1c __ LDA P1 ; (buf + 0)
7080 : a0 0b __ LDY #$0b
7082 : 91 35 __ STA (T1 + 0),y 
7084 : a9 04 __ LDA #$04
7086 : 8d cb 7a STA $7acb ; (_kern_target + 0)
7089 : a9 ff __ LDA #$ff
708b : 8d cc 7a STA $7acc ; (_kern_target + 1)
708e : a5 1d __ LDA P2 ; (buf + 1)
7090 : c8 __ __ INY
7091 : 91 35 __ STA (T1 + 0),y 
7093 : ad 6c 7a LDA $7a6c ; (kernelEventData.u + 3)
7096 : c8 __ __ INY
7097 : 91 35 __ STA (T1 + 0),y 
7099 : 20 2f 29 JSR $292f ; (_kernelCallWrapper.s4 + 0)
709c : ad 6c 7a LDA $7a6c ; (kernelEventData.u + 3)
709f : d0 81 __ BNE $7022 ; (kernelRead.s20 + 0)
.s14:
70a1 : 85 29 __ STA ACCU + 0 
70a3 : a9 01 __ LDA #$01
70a5 : 4c 26 70 JMP $7026 ; (kernelRead.s3 + 0)
--------------------------------------------------------------------
f256getchar: ; f256getchar()->i16
;  18, "/mnt/d/F256/f256lib-oscar64/f256lib/f_platform.h"
.l4:
70a8 : 20 d6 70 JSR $70d6 ; (kernelNextEvent.s4 + 0)
70ab : ad cd 7a LDA $7acd ; (_kernelError + 0)
70ae : f0 10 __ BEQ $70c0 ; (f256getchar.s5 + 0)
.s8:
70b0 : a9 0c __ LDA #$0c
70b2 : 8d cb 7a STA $7acb ; (_kern_target + 0)
70b5 : a9 ff __ LDA #$ff
70b7 : 8d cc 7a STA $7acc ; (_kern_target + 1)
70ba : 20 e6 70 JSR $70e6 ; (_kernelCallWrapper.s4 + 0)
70bd : 4c a8 70 JMP $70a8 ; (f256getchar.l4 + 0)
.s5:
70c0 : ad 66 7a LDA $7a66 ; (kernelEventData.type + 0)
70c3 : c9 08 __ CMP #$08
70c5 : d0 e1 __ BNE $70a8 ; (f256getchar.l4 + 0)
.s6:
70c7 : ad 6c 7a LDA $7a6c ; (kernelEventData.u + 3)
70ca : d0 dc __ BNE $70a8 ; (f256getchar.l4 + 0)
.s7:
70cc : ad 6b 7a LDA $7a6b ; (kernelEventData.u + 2)
70cf : 85 29 __ STA ACCU + 0 
70d1 : a9 00 __ LDA #$00
70d3 : 85 2a __ STA ACCU + 1 
.s3:
70d5 : 60 __ __ RTS
--------------------------------------------------------------------
kernelNextEvent: ; kernelNextEvent()->u8
;  66, "/mnt/d/F256/f256lib-oscar64/f256lib/f_kernel.h"
.s4:
70d6 : a9 00 __ LDA #$00
70d8 : 8d cb 7a STA $7acb ; (_kern_target + 0)
70db : 8d 66 7a STA $7a66 ; (kernelEventData.type + 0)
70de : a9 ff __ LDA #$ff
70e0 : 8d cc 7a STA $7acc ; (_kern_target + 1)
70e3 : 4c e6 70 JMP $70e6 ; (_kernelCallWrapper.s4 + 0)
--------------------------------------------------------------------
_kernelCallWrapper: ; _kernelCallWrapper()->u8
;  56, "/mnt/d/F256/f256lib-oscar64/f256lib/f_kernel.h"
.s4:
70e6 : 20 ee 70 JSR $70ee ; (_kernelCallRaw + 0)
70e9 : 85 29 __ STA ACCU + 0 
.s3:
70eb : a5 29 __ LDA ACCU + 0 
70ed : 60 __ __ RTS
--------------------------------------------------------------------
_kernelCallRaw: ; _kernelCallRaw
70ee : ad cb 7a LDA $7acb ; (_kern_target + 0)
70f1 : 8d fb 70 STA $70fb ; (_kernelCallRaw + 13)
70f4 : ad cc 7a LDA $7acc ; (_kern_target + 1)
70f7 : 8d fc 70 STA $70fc ; (_kernelCallRaw + 14)
70fa : 20 00 00 JSR $0000 
70fd : aa __ __ TAX
70fe : a9 00 __ LDA #$00
7100 : 6a __ __ ROR
7101 : 8d cd 7a STA $7acd ; (_kernelError + 0)
7104 : 8a __ __ TXA
7105 : 60 __ __ RTS
--------------------------------------------------------------------
7106 : __ __ __ BYT 55 70 6c 6f 61 64 20 73 65 6e 64 20 66 61 69 6c : Upload send fail
7116 : __ __ __ BYT 65 64 00                                        : ed.
--------------------------------------------------------------------
7119 : __ __ __ BYT 55 70 6c 6f 61 64 65 64 20 00                   : Uploaded .
--------------------------------------------------------------------
7123 : __ __ __ BYT 75 73 61 67 65 3a 20 70 75 74 20 3c 6c 6f 63 61 : usage: put <loca
7133 : __ __ __ BYT 6c 3e 20 5b 72 65 6d 6f 74 65 5d 00             : l> [remote].
--------------------------------------------------------------------
713f : __ __ __ BYT 62 69 6e 00                                     : bin.
--------------------------------------------------------------------
7143 : __ __ __ BYT 71 75 69 74 00                                  : quit.
--------------------------------------------------------------------
7148 : __ __ __ BYT 62 79 65 00                                     : bye.
--------------------------------------------------------------------
ftp_quit: ; ftp_quit()->bool
; 981, "/mnt/d/F256/f256lib-oscar64/doodles/ftpclient/src/ftpclient.c"
.s1:
714c : a5 55 __ LDA T1 + 0 
714e : 8d fb 9e STA $9efb ; (ftp_quit@stack + 0)
7151 : a5 56 __ LDA T1 + 1 
7153 : 8d fc 9e STA $9efc ; (ftp_quit@stack + 1)
.s4:
7156 : a9 bf __ LDA #$bf
7158 : 8d e7 9f STA $9fe7 ; (sstack + 27)
715b : a9 71 __ LDA #$71
715d : 8d e8 9f STA $9fe8 ; (sstack + 28)
7160 : 20 7e 50 JSR $507e ; (ftp_command.s4 + 0)
7163 : a5 29 __ LDA ACCU + 0 
7165 : 85 55 __ STA T1 + 0 
7167 : a5 2a __ LDA ACCU + 1 
7169 : 85 56 __ STA T1 + 1 
716b : 20 54 52 JSR $5254 ; (print_reply.s4 + 0)
716e : a9 00 __ LDA #$00
7170 : 8d e1 9f STA $9fe1 ; (sstack + 21)
7173 : 20 00 5a JSR $5a00 ; (wiz_close_link.s4 + 0)
7176 : a9 00 __ LDA #$00
7178 : 85 1b __ STA P0 
717a : a9 0f __ LDA #$0f
717c : 85 1c __ STA P1 
717e : 20 ff 14 JSR $14ff ; (textSetColor.s4 + 0)
7181 : a9 19 __ LDA #$19
7183 : 85 1b __ STA P0 
7185 : a9 3b __ LDA #$3b
7187 : 85 1c __ STA P1 
7189 : 20 52 05 JSR $0552 ; (textGotoXY.s4 + 0)
718c : a9 c4 __ LDA #$c4
718e : 85 23 __ STA P8 
7190 : a9 71 __ LDA #$71
7192 : 85 24 __ STA P9 
7194 : 20 0c 15 JSR $150c ; (textPrint.s4 + 0)
7197 : a9 0f __ LDA #$0f
7199 : 85 1b __ STA P0 
719b : a9 00 __ LDA #$00
719d : 85 1c __ STA P1 
719f : 20 ff 14 JSR $14ff ; (textSetColor.s4 + 0)
71a2 : a5 56 __ LDA T1 + 1 
71a4 : d0 0a __ BNE $71b0 ; (ftp_quit.s6 + 0)
.s8:
71a6 : a5 55 __ LDA T1 + 0 
71a8 : c9 dd __ CMP #$dd
71aa : d0 04 __ BNE $71b0 ; (ftp_quit.s6 + 0)
.s5:
71ac : a9 01 __ LDA #$01
71ae : d0 02 __ BNE $71b2 ; (ftp_quit.s7 + 0)
.s6:
71b0 : a9 00 __ LDA #$00
.s7:
71b2 : 85 29 __ STA ACCU + 0 
.s3:
71b4 : ad fb 9e LDA $9efb ; (ftp_quit@stack + 0)
71b7 : 85 55 __ STA T1 + 0 
71b9 : ad fc 9e LDA $9efc ; (ftp_quit@stack + 1)
71bc : 85 56 __ STA T1 + 1 
71be : 60 __ __ RTS
--------------------------------------------------------------------
71bf : __ __ __ BYT 51 55 49 54 00                                  : QUIT.
--------------------------------------------------------------------
71c4 : __ __ __ BYT 6e 6f 74 20 63 6f 6e 6e 65 63 74 65 64 20 20 20 : not connected   
71d4 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
71e4 : __ __ __ BYT 20 20 20 00                                     :    .
--------------------------------------------------------------------
71e8 : __ __ __ BYT 64 65 62 75 67 00                               : debug.
--------------------------------------------------------------------
71ee : __ __ __ BYT 6f 6e 00                                        : on.
--------------------------------------------------------------------
71f1 : __ __ __ BYT 64 65 62 75 67 20 00                            : debug .
--------------------------------------------------------------------
71f8 : __ __ __ BYT 6f 66 66 00                                     : off.
--------------------------------------------------------------------
__multab3L:
71fc : __ __ __ BYT 00 03 06 09                                     : ....
--------------------------------------------------------------------
7200 : __ __ __ BYT 65 78 69 74 00                                  : exit.
--------------------------------------------------------------------
7205 : __ __ __ BYT 4c 65 61 76 69 6e 67 20 74 68 65 20 46 54 50 20 : Leaving the FTP 
7215 : __ __ __ BYT 43 6c 69 65 6e 74 2e 20 53 65 65 20 79 61 21 00 : Client. See ya!.
--------------------------------------------------------------------
7225 : __ __ __ BYT 55 6e 6b 6e 6f 77 6e 20 63 6f 6d 6d 61 6e 64 2e : Unknown command.
7235 : __ __ __ BYT 20 54 79 70 65 20 27 68 65 6c 70 27 2e 00       :  Type 'help'..
--------------------------------------------------------------------
f256Reset: ; f256Reset()->void
; 212, "/mnt/d/F256/f256lib-oscar64/f256lib/f256lib.h"
.s4:
7243 : 78 __ __ SEI
7244 : a9 07 __ LDA #$07
7246 : 85 0f __ STA $0f 
7248 : a9 de __ LDA #$de
724a : 8d a2 d6 STA $d6a2 
724d : a9 ad __ LDA #$ad
724f : 8d a3 d6 STA $d6a3 
7252 : a9 f0 __ LDA #$f0
7254 : 8d a0 d6 STA $d6a0 
7257 : a9 00 __ LDA #$00
7259 : 8d a0 d6 STA $d6a0 
725c : 6c fc ff JMP ($fffc)
.s3:
725f : 60 __ __ RTS
--------------------------------------------------------------------
mul16by8: ; mul16by8
7260 : 4a __ __ LSR
7261 : f0 2e __ BEQ $7291 ; (mul16by8 + 49)
7263 : a2 00 __ LDX #$00
7265 : a0 00 __ LDY #$00
7267 : 90 13 __ BCC $727c ; (mul16by8 + 28)
7269 : a4 29 __ LDY ACCU + 0 
726b : a6 2a __ LDX ACCU + 1 
726d : b0 0d __ BCS $727c ; (mul16by8 + 28)
726f : 85 10 __ STA $10 
7271 : 18 __ __ CLC
7272 : 98 __ __ TYA
7273 : 65 29 __ ADC ACCU + 0 
7275 : a8 __ __ TAY
7276 : 8a __ __ TXA
7277 : 65 2a __ ADC ACCU + 1 
7279 : aa __ __ TAX
727a : a5 10 __ LDA $10 
727c : 06 29 __ ASL ACCU + 0 
727e : 26 2a __ ROL ACCU + 1 
7280 : 4a __ __ LSR
7281 : 90 f9 __ BCC $727c ; (mul16by8 + 28)
7283 : d0 ea __ BNE $726f ; (mul16by8 + 15)
7285 : 18 __ __ CLC
7286 : 98 __ __ TYA
7287 : 65 29 __ ADC ACCU + 0 
7289 : 85 29 __ STA ACCU + 0 
728b : 8a __ __ TXA
728c : 65 2a __ ADC ACCU + 1 
728e : 85 2a __ STA ACCU + 1 
7290 : 60 __ __ RTS
7291 : b0 04 __ BCS $7297 ; (mul16by8 + 55)
7293 : 85 29 __ STA ACCU + 0 
7295 : 85 2a __ STA ACCU + 1 
7297 : 60 __ __ RTS
--------------------------------------------------------------------
mul32by8: ; mul32by8
7298 : a0 00 __ LDY #$00
729a : 84 15 __ STY WORK + 4 
729c : 84 16 __ STY WORK + 5 
729e : 84 17 __ STY WORK + 6 
72a0 : 4a __ __ LSR
72a1 : b0 0d __ BCS $72b0 ; (mul32by8 + 24)
72a3 : f0 26 __ BEQ $72cb ; (mul32by8 + 51)
72a5 : 06 29 __ ASL ACCU + 0 
72a7 : 26 2a __ ROL ACCU + 1 
72a9 : 26 2b __ ROL ACCU + 2 
72ab : 26 2c __ ROL ACCU + 3 
72ad : 4a __ __ LSR
72ae : 90 f5 __ BCC $72a5 ; (mul32by8 + 13)
72b0 : aa __ __ TAX
72b1 : 18 __ __ CLC
72b2 : a5 15 __ LDA WORK + 4 
72b4 : 65 29 __ ADC ACCU + 0 
72b6 : 85 15 __ STA WORK + 4 
72b8 : a5 16 __ LDA WORK + 5 
72ba : 65 2a __ ADC ACCU + 1 
72bc : 85 16 __ STA WORK + 5 
72be : a5 17 __ LDA WORK + 6 
72c0 : 65 2b __ ADC ACCU + 2 
72c2 : 85 17 __ STA WORK + 6 
72c4 : 98 __ __ TYA
72c5 : 65 2c __ ADC ACCU + 3 
72c7 : a8 __ __ TAY
72c8 : 8a __ __ TXA
72c9 : d0 da __ BNE $72a5 ; (mul32by8 + 13)
72cb : 84 18 __ STY WORK + 7 
72cd : 60 __ __ RTS
--------------------------------------------------------------------
freg: ; freg
72ce : b1 27 __ LDA (IP + 0),y 
72d0 : c8 __ __ INY
72d1 : aa __ __ TAX
72d2 : b5 00 __ LDA $00,x 
72d4 : 85 11 __ STA WORK + 0 
72d6 : b5 01 __ LDA $01,x 
72d8 : 85 12 __ STA WORK + 1 
72da : b5 02 __ LDA $02,x 
72dc : 85 13 __ STA WORK + 2 
72de : b5 03 __ LDA $03,x 
72e0 : 85 14 __ STA WORK + 3 
72e2 : a5 13 __ LDA WORK + 2 
72e4 : 0a __ __ ASL
72e5 : a5 14 __ LDA WORK + 3 
72e7 : 2a __ __ ROL
72e8 : 85 16 __ STA WORK + 5 
72ea : f0 06 __ BEQ $72f2 ; (freg + 36)
72ec : a5 13 __ LDA WORK + 2 
72ee : 09 80 __ ORA #$80
72f0 : 85 13 __ STA WORK + 2 
72f2 : a5 2b __ LDA ACCU + 2 
72f4 : 0a __ __ ASL
72f5 : a5 2c __ LDA ACCU + 3 
72f7 : 2a __ __ ROL
72f8 : 85 15 __ STA WORK + 4 
72fa : f0 06 __ BEQ $7302 ; (freg + 52)
72fc : a5 2b __ LDA ACCU + 2 
72fe : 09 80 __ ORA #$80
7300 : 85 2b __ STA ACCU + 2 
7302 : 60 __ __ RTS
7303 : 06 2c __ ASL ACCU + 3 
7305 : a5 15 __ LDA WORK + 4 
7307 : 6a __ __ ROR
7308 : 85 2c __ STA ACCU + 3 
730a : b0 06 __ BCS $7312 ; (freg + 68)
730c : a5 2b __ LDA ACCU + 2 
730e : 29 7f __ AND #$7f
7310 : 85 2b __ STA ACCU + 2 
7312 : 60 __ __ RTS
--------------------------------------------------------------------
faddsub: ; faddsub
7313 : a5 14 __ LDA WORK + 3 
7315 : 49 80 __ EOR #$80
7317 : 85 14 __ STA WORK + 3 
7319 : a9 ff __ LDA #$ff
731b : c5 15 __ CMP WORK + 4 
731d : f0 04 __ BEQ $7323 ; (faddsub + 16)
731f : c5 16 __ CMP WORK + 5 
7321 : d0 11 __ BNE $7334 ; (faddsub + 33)
7323 : a5 2c __ LDA ACCU + 3 
7325 : 09 7f __ ORA #$7f
7327 : 85 2c __ STA ACCU + 3 
7329 : a9 80 __ LDA #$80
732b : 85 2b __ STA ACCU + 2 
732d : a9 00 __ LDA #$00
732f : 85 29 __ STA ACCU + 0 
7331 : 85 2a __ STA ACCU + 1 
7333 : 60 __ __ RTS
7334 : 38 __ __ SEC
7335 : a5 15 __ LDA WORK + 4 
7337 : e5 16 __ SBC WORK + 5 
7339 : f0 38 __ BEQ $7373 ; (faddsub + 96)
733b : aa __ __ TAX
733c : b0 25 __ BCS $7363 ; (faddsub + 80)
733e : e0 e9 __ CPX #$e9
7340 : b0 0e __ BCS $7350 ; (faddsub + 61)
7342 : a5 16 __ LDA WORK + 5 
7344 : 85 15 __ STA WORK + 4 
7346 : a9 00 __ LDA #$00
7348 : 85 29 __ STA ACCU + 0 
734a : 85 2a __ STA ACCU + 1 
734c : 85 2b __ STA ACCU + 2 
734e : f0 23 __ BEQ $7373 ; (faddsub + 96)
7350 : a5 2b __ LDA ACCU + 2 
7352 : 4a __ __ LSR
7353 : 66 2a __ ROR ACCU + 1 
7355 : 66 29 __ ROR ACCU + 0 
7357 : e8 __ __ INX
7358 : d0 f8 __ BNE $7352 ; (faddsub + 63)
735a : 85 2b __ STA ACCU + 2 
735c : a5 16 __ LDA WORK + 5 
735e : 85 15 __ STA WORK + 4 
7360 : 4c 73 73 JMP $7373 ; (faddsub + 96)
7363 : e0 18 __ CPX #$18
7365 : b0 33 __ BCS $739a ; (faddsub + 135)
7367 : a5 13 __ LDA WORK + 2 
7369 : 4a __ __ LSR
736a : 66 12 __ ROR WORK + 1 
736c : 66 11 __ ROR WORK + 0 
736e : ca __ __ DEX
736f : d0 f8 __ BNE $7369 ; (faddsub + 86)
7371 : 85 13 __ STA WORK + 2 
7373 : a5 2c __ LDA ACCU + 3 
7375 : 29 80 __ AND #$80
7377 : 85 2c __ STA ACCU + 3 
7379 : 45 14 __ EOR WORK + 3 
737b : 30 31 __ BMI $73ae ; (faddsub + 155)
737d : 18 __ __ CLC
737e : a5 29 __ LDA ACCU + 0 
7380 : 65 11 __ ADC WORK + 0 
7382 : 85 29 __ STA ACCU + 0 
7384 : a5 2a __ LDA ACCU + 1 
7386 : 65 12 __ ADC WORK + 1 
7388 : 85 2a __ STA ACCU + 1 
738a : a5 2b __ LDA ACCU + 2 
738c : 65 13 __ ADC WORK + 2 
738e : 85 2b __ STA ACCU + 2 
7390 : 90 08 __ BCC $739a ; (faddsub + 135)
7392 : 66 2b __ ROR ACCU + 2 
7394 : 66 2a __ ROR ACCU + 1 
7396 : 66 29 __ ROR ACCU + 0 
7398 : e6 15 __ INC WORK + 4 
739a : a5 15 __ LDA WORK + 4 
739c : c9 ff __ CMP #$ff
739e : f0 83 __ BEQ $7323 ; (faddsub + 16)
73a0 : 4a __ __ LSR
73a1 : 05 2c __ ORA ACCU + 3 
73a3 : 85 2c __ STA ACCU + 3 
73a5 : b0 06 __ BCS $73ad ; (faddsub + 154)
73a7 : a5 2b __ LDA ACCU + 2 
73a9 : 29 7f __ AND #$7f
73ab : 85 2b __ STA ACCU + 2 
73ad : 60 __ __ RTS
73ae : 38 __ __ SEC
73af : a5 29 __ LDA ACCU + 0 
73b1 : e5 11 __ SBC WORK + 0 
73b3 : 85 29 __ STA ACCU + 0 
73b5 : a5 2a __ LDA ACCU + 1 
73b7 : e5 12 __ SBC WORK + 1 
73b9 : 85 2a __ STA ACCU + 1 
73bb : a5 2b __ LDA ACCU + 2 
73bd : e5 13 __ SBC WORK + 2 
73bf : 85 2b __ STA ACCU + 2 
73c1 : b0 19 __ BCS $73dc ; (faddsub + 201)
73c3 : 38 __ __ SEC
73c4 : a9 00 __ LDA #$00
73c6 : e5 29 __ SBC ACCU + 0 
73c8 : 85 29 __ STA ACCU + 0 
73ca : a9 00 __ LDA #$00
73cc : e5 2a __ SBC ACCU + 1 
73ce : 85 2a __ STA ACCU + 1 
73d0 : a9 00 __ LDA #$00
73d2 : e5 2b __ SBC ACCU + 2 
73d4 : 85 2b __ STA ACCU + 2 
73d6 : a5 2c __ LDA ACCU + 3 
73d8 : 49 80 __ EOR #$80
73da : 85 2c __ STA ACCU + 3 
73dc : a5 2b __ LDA ACCU + 2 
73de : 30 ba __ BMI $739a ; (faddsub + 135)
73e0 : 05 2a __ ORA ACCU + 1 
73e2 : 05 29 __ ORA ACCU + 0 
73e4 : f0 0f __ BEQ $73f5 ; (faddsub + 226)
73e6 : c6 15 __ DEC WORK + 4 
73e8 : f0 0b __ BEQ $73f5 ; (faddsub + 226)
73ea : 06 29 __ ASL ACCU + 0 
73ec : 26 2a __ ROL ACCU + 1 
73ee : 26 2b __ ROL ACCU + 2 
73f0 : 10 f4 __ BPL $73e6 ; (faddsub + 211)
73f2 : 4c 9a 73 JMP $739a ; (faddsub + 135)
73f5 : a9 00 __ LDA #$00
73f7 : 85 29 __ STA ACCU + 0 
73f9 : 85 2a __ STA ACCU + 1 
73fb : 85 2b __ STA ACCU + 2 
73fd : 85 2c __ STA ACCU + 3 
73ff : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul: ; crt_fmul
7400 : a5 29 __ LDA ACCU + 0 
7402 : 05 2a __ ORA ACCU + 1 
7404 : 05 2b __ ORA ACCU + 2 
7406 : f0 0e __ BEQ $7416 ; (crt_fmul + 22)
7408 : a5 11 __ LDA WORK + 0 
740a : 05 12 __ ORA WORK + 1 
740c : 05 13 __ ORA WORK + 2 
740e : d0 09 __ BNE $7419 ; (crt_fmul + 25)
7410 : 85 29 __ STA ACCU + 0 
7412 : 85 2a __ STA ACCU + 1 
7414 : 85 2b __ STA ACCU + 2 
7416 : 85 2c __ STA ACCU + 3 
7418 : 60 __ __ RTS
7419 : a5 2c __ LDA ACCU + 3 
741b : 45 14 __ EOR WORK + 3 
741d : 29 80 __ AND #$80
741f : 85 2c __ STA ACCU + 3 
7421 : a9 ff __ LDA #$ff
7423 : c5 15 __ CMP WORK + 4 
7425 : f0 42 __ BEQ $7469 ; (crt_fmul + 105)
7427 : c5 16 __ CMP WORK + 5 
7429 : f0 3e __ BEQ $7469 ; (crt_fmul + 105)
742b : a9 00 __ LDA #$00
742d : 85 17 __ STA WORK + 6 
742f : 85 18 __ STA WORK + 7 
7431 : 85 19 __ STA WORK + 8 
7433 : a4 29 __ LDY ACCU + 0 
7435 : a5 11 __ LDA WORK + 0 
7437 : d0 06 __ BNE $743f ; (crt_fmul + 63)
7439 : a5 12 __ LDA WORK + 1 
743b : f0 0a __ BEQ $7447 ; (crt_fmul + 71)
743d : d0 05 __ BNE $7444 ; (crt_fmul + 68)
743f : 20 9a 74 JSR $749a ; (crt_fmul8 + 0)
7442 : a5 12 __ LDA WORK + 1 
7444 : 20 9a 74 JSR $749a ; (crt_fmul8 + 0)
7447 : a5 13 __ LDA WORK + 2 
7449 : 20 9a 74 JSR $749a ; (crt_fmul8 + 0)
744c : 38 __ __ SEC
744d : a5 19 __ LDA WORK + 8 
744f : 30 06 __ BMI $7457 ; (crt_fmul + 87)
7451 : 06 17 __ ASL WORK + 6 
7453 : 26 18 __ ROL WORK + 7 
7455 : 2a __ __ ROL
7456 : 18 __ __ CLC
7457 : 29 7f __ AND #$7f
7459 : 85 19 __ STA WORK + 8 
745b : a5 15 __ LDA WORK + 4 
745d : 65 16 __ ADC WORK + 5 
745f : 90 19 __ BCC $747a ; (crt_fmul + 122)
7461 : e9 7f __ SBC #$7f
7463 : b0 04 __ BCS $7469 ; (crt_fmul + 105)
7465 : c9 ff __ CMP #$ff
7467 : d0 15 __ BNE $747e ; (crt_fmul + 126)
7469 : a5 2c __ LDA ACCU + 3 
746b : 09 7f __ ORA #$7f
746d : 85 2c __ STA ACCU + 3 
746f : a9 80 __ LDA #$80
7471 : 85 2b __ STA ACCU + 2 
7473 : a9 00 __ LDA #$00
7475 : 85 29 __ STA ACCU + 0 
7477 : 85 2a __ STA ACCU + 1 
7479 : 60 __ __ RTS
747a : e9 7e __ SBC #$7e
747c : 90 15 __ BCC $7493 ; (crt_fmul + 147)
747e : 4a __ __ LSR
747f : 05 2c __ ORA ACCU + 3 
7481 : 85 2c __ STA ACCU + 3 
7483 : a9 00 __ LDA #$00
7485 : 6a __ __ ROR
7486 : 05 19 __ ORA WORK + 8 
7488 : 85 2b __ STA ACCU + 2 
748a : a5 18 __ LDA WORK + 7 
748c : 85 2a __ STA ACCU + 1 
748e : a5 17 __ LDA WORK + 6 
7490 : 85 29 __ STA ACCU + 0 
7492 : 60 __ __ RTS
7493 : a9 00 __ LDA #$00
7495 : 85 2c __ STA ACCU + 3 
7497 : f0 d8 __ BEQ $7471 ; (crt_fmul + 113)
7499 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul8: ; crt_fmul8
749a : 38 __ __ SEC
749b : 6a __ __ ROR
749c : 90 1e __ BCC $74bc ; (crt_fmul8 + 34)
749e : aa __ __ TAX
749f : 18 __ __ CLC
74a0 : 98 __ __ TYA
74a1 : 65 17 __ ADC WORK + 6 
74a3 : 85 17 __ STA WORK + 6 
74a5 : a5 18 __ LDA WORK + 7 
74a7 : 65 2a __ ADC ACCU + 1 
74a9 : 85 18 __ STA WORK + 7 
74ab : a5 19 __ LDA WORK + 8 
74ad : 65 2b __ ADC ACCU + 2 
74af : 6a __ __ ROR
74b0 : 85 19 __ STA WORK + 8 
74b2 : 8a __ __ TXA
74b3 : 66 18 __ ROR WORK + 7 
74b5 : 66 17 __ ROR WORK + 6 
74b7 : 4a __ __ LSR
74b8 : f0 0d __ BEQ $74c7 ; (crt_fmul8 + 45)
74ba : b0 e2 __ BCS $749e ; (crt_fmul8 + 4)
74bc : 66 19 __ ROR WORK + 8 
74be : 66 18 __ ROR WORK + 7 
74c0 : 66 17 __ ROR WORK + 6 
74c2 : 4a __ __ LSR
74c3 : 90 f7 __ BCC $74bc ; (crt_fmul8 + 34)
74c5 : d0 d7 __ BNE $749e ; (crt_fmul8 + 4)
74c7 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fdiv: ; crt_fdiv
74c8 : a5 29 __ LDA ACCU + 0 
74ca : 05 2a __ ORA ACCU + 1 
74cc : 05 2b __ ORA ACCU + 2 
74ce : d0 03 __ BNE $74d3 ; (crt_fdiv + 11)
74d0 : 85 2c __ STA ACCU + 3 
74d2 : 60 __ __ RTS
74d3 : a5 2c __ LDA ACCU + 3 
74d5 : 45 14 __ EOR WORK + 3 
74d7 : 29 80 __ AND #$80
74d9 : 85 2c __ STA ACCU + 3 
74db : a5 16 __ LDA WORK + 5 
74dd : f0 62 __ BEQ $7541 ; (crt_fdiv + 121)
74df : a5 15 __ LDA WORK + 4 
74e1 : c9 ff __ CMP #$ff
74e3 : f0 5c __ BEQ $7541 ; (crt_fdiv + 121)
74e5 : a9 00 __ LDA #$00
74e7 : 85 17 __ STA WORK + 6 
74e9 : 85 18 __ STA WORK + 7 
74eb : 85 19 __ STA WORK + 8 
74ed : a2 18 __ LDX #$18
74ef : a5 29 __ LDA ACCU + 0 
74f1 : c5 11 __ CMP WORK + 0 
74f3 : a5 2a __ LDA ACCU + 1 
74f5 : e5 12 __ SBC WORK + 1 
74f7 : a5 2b __ LDA ACCU + 2 
74f9 : e5 13 __ SBC WORK + 2 
74fb : 90 13 __ BCC $7510 ; (crt_fdiv + 72)
74fd : a5 29 __ LDA ACCU + 0 
74ff : e5 11 __ SBC WORK + 0 
7501 : 85 29 __ STA ACCU + 0 
7503 : a5 2a __ LDA ACCU + 1 
7505 : e5 12 __ SBC WORK + 1 
7507 : 85 2a __ STA ACCU + 1 
7509 : a5 2b __ LDA ACCU + 2 
750b : e5 13 __ SBC WORK + 2 
750d : 85 2b __ STA ACCU + 2 
750f : 38 __ __ SEC
7510 : 26 17 __ ROL WORK + 6 
7512 : 26 18 __ ROL WORK + 7 
7514 : 26 19 __ ROL WORK + 8 
7516 : ca __ __ DEX
7517 : f0 0a __ BEQ $7523 ; (crt_fdiv + 91)
7519 : 06 29 __ ASL ACCU + 0 
751b : 26 2a __ ROL ACCU + 1 
751d : 26 2b __ ROL ACCU + 2 
751f : b0 dc __ BCS $74fd ; (crt_fdiv + 53)
7521 : 90 cc __ BCC $74ef ; (crt_fdiv + 39)
7523 : 38 __ __ SEC
7524 : a5 19 __ LDA WORK + 8 
7526 : 30 06 __ BMI $752e ; (crt_fdiv + 102)
7528 : 06 17 __ ASL WORK + 6 
752a : 26 18 __ ROL WORK + 7 
752c : 2a __ __ ROL
752d : 18 __ __ CLC
752e : 29 7f __ AND #$7f
7530 : 85 19 __ STA WORK + 8 
7532 : a5 15 __ LDA WORK + 4 
7534 : e5 16 __ SBC WORK + 5 
7536 : 90 1a __ BCC $7552 ; (crt_fdiv + 138)
7538 : 18 __ __ CLC
7539 : 69 7f __ ADC #$7f
753b : b0 04 __ BCS $7541 ; (crt_fdiv + 121)
753d : c9 ff __ CMP #$ff
753f : d0 15 __ BNE $7556 ; (crt_fdiv + 142)
7541 : a5 2c __ LDA ACCU + 3 
7543 : 09 7f __ ORA #$7f
7545 : 85 2c __ STA ACCU + 3 
7547 : a9 80 __ LDA #$80
7549 : 85 2b __ STA ACCU + 2 
754b : a9 00 __ LDA #$00
754d : 85 2a __ STA ACCU + 1 
754f : 85 29 __ STA ACCU + 0 
7551 : 60 __ __ RTS
7552 : 69 7f __ ADC #$7f
7554 : 90 15 __ BCC $756b ; (crt_fdiv + 163)
7556 : 4a __ __ LSR
7557 : 05 2c __ ORA ACCU + 3 
7559 : 85 2c __ STA ACCU + 3 
755b : a9 00 __ LDA #$00
755d : 6a __ __ ROR
755e : 05 19 __ ORA WORK + 8 
7560 : 85 2b __ STA ACCU + 2 
7562 : a5 18 __ LDA WORK + 7 
7564 : 85 2a __ STA ACCU + 1 
7566 : a5 17 __ LDA WORK + 6 
7568 : 85 29 __ STA ACCU + 0 
756a : 60 __ __ RTS
756b : a9 00 __ LDA #$00
756d : 85 2c __ STA ACCU + 3 
756f : 85 2b __ STA ACCU + 2 
7571 : 85 2a __ STA ACCU + 1 
7573 : 85 29 __ STA ACCU + 0 
7575 : 60 __ __ RTS
--------------------------------------------------------------------
mul16: ; mul16
7576 : a0 00 __ LDY #$00
7578 : 84 14 __ STY WORK + 3 
757a : a5 11 __ LDA WORK + 0 
757c : a6 12 __ LDX WORK + 1 
757e : f0 1c __ BEQ $759c ; (mul16 + 38)
7580 : 38 __ __ SEC
7581 : 6a __ __ ROR
7582 : 90 0d __ BCC $7591 ; (mul16 + 27)
7584 : aa __ __ TAX
7585 : 18 __ __ CLC
7586 : 98 __ __ TYA
7587 : 65 29 __ ADC ACCU + 0 
7589 : a8 __ __ TAY
758a : a5 14 __ LDA WORK + 3 
758c : 65 2a __ ADC ACCU + 1 
758e : 85 14 __ STA WORK + 3 
7590 : 8a __ __ TXA
7591 : 06 29 __ ASL ACCU + 0 
7593 : 26 2a __ ROL ACCU + 1 
7595 : 4a __ __ LSR
7596 : 90 f9 __ BCC $7591 ; (mul16 + 27)
7598 : d0 ea __ BNE $7584 ; (mul16 + 14)
759a : a5 12 __ LDA WORK + 1 
759c : 4a __ __ LSR
759d : 90 0d __ BCC $75ac ; (mul16 + 54)
759f : aa __ __ TAX
75a0 : 18 __ __ CLC
75a1 : 98 __ __ TYA
75a2 : 65 29 __ ADC ACCU + 0 
75a4 : a8 __ __ TAY
75a5 : a5 14 __ LDA WORK + 3 
75a7 : 65 2a __ ADC ACCU + 1 
75a9 : 85 14 __ STA WORK + 3 
75ab : 8a __ __ TXA
75ac : 06 29 __ ASL ACCU + 0 
75ae : 26 2a __ ROL ACCU + 1 
75b0 : 4a __ __ LSR
75b1 : b0 ec __ BCS $759f ; (mul16 + 41)
75b3 : d0 f7 __ BNE $75ac ; (mul16 + 54)
75b5 : 84 13 __ STY WORK + 2 
75b7 : 60 __ __ RTS
--------------------------------------------------------------------
divs16: ; divs16
75b8 : 24 2a __ BIT ACCU + 1 
75ba : 10 0d __ BPL $75c9 ; (divs16 + 17)
75bc : 20 d6 75 JSR $75d6 ; (negaccu + 0)
75bf : 24 12 __ BIT WORK + 1 
75c1 : 10 0d __ BPL $75d0 ; (divs16 + 24)
75c3 : 20 e4 75 JSR $75e4 ; (negtmp + 0)
75c6 : 4c f2 75 JMP $75f2 ; (divmod + 0)
75c9 : 24 12 __ BIT WORK + 1 
75cb : 10 f9 __ BPL $75c6 ; (divs16 + 14)
75cd : 20 e4 75 JSR $75e4 ; (negtmp + 0)
75d0 : 20 f2 75 JSR $75f2 ; (divmod + 0)
75d3 : 4c d6 75 JMP $75d6 ; (negaccu + 0)
--------------------------------------------------------------------
negaccu: ; negaccu
75d6 : 38 __ __ SEC
75d7 : a9 00 __ LDA #$00
75d9 : e5 29 __ SBC ACCU + 0 
75db : 85 29 __ STA ACCU + 0 
75dd : a9 00 __ LDA #$00
75df : e5 2a __ SBC ACCU + 1 
75e1 : 85 2a __ STA ACCU + 1 
75e3 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp: ; negtmp
75e4 : 38 __ __ SEC
75e5 : a9 00 __ LDA #$00
75e7 : e5 11 __ SBC WORK + 0 
75e9 : 85 11 __ STA WORK + 0 
75eb : a9 00 __ LDA #$00
75ed : e5 12 __ SBC WORK + 1 
75ef : 85 12 __ STA WORK + 1 
75f1 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
75f2 : a5 2a __ LDA ACCU + 1 
75f4 : d0 31 __ BNE $7627 ; (divmod + 53)
75f6 : a5 12 __ LDA WORK + 1 
75f8 : d0 1e __ BNE $7618 ; (divmod + 38)
75fa : 85 14 __ STA WORK + 3 
75fc : a2 04 __ LDX #$04
75fe : 06 29 __ ASL ACCU + 0 
7600 : 2a __ __ ROL
7601 : c5 11 __ CMP WORK + 0 
7603 : 90 02 __ BCC $7607 ; (divmod + 21)
7605 : e5 11 __ SBC WORK + 0 
7607 : 26 29 __ ROL ACCU + 0 
7609 : 2a __ __ ROL
760a : c5 11 __ CMP WORK + 0 
760c : 90 02 __ BCC $7610 ; (divmod + 30)
760e : e5 11 __ SBC WORK + 0 
7610 : 26 29 __ ROL ACCU + 0 
7612 : ca __ __ DEX
7613 : d0 eb __ BNE $7600 ; (divmod + 14)
7615 : 85 13 __ STA WORK + 2 
7617 : 60 __ __ RTS
7618 : a5 29 __ LDA ACCU + 0 
761a : 85 13 __ STA WORK + 2 
761c : a5 2a __ LDA ACCU + 1 
761e : 85 14 __ STA WORK + 3 
7620 : a9 00 __ LDA #$00
7622 : 85 29 __ STA ACCU + 0 
7624 : 85 2a __ STA ACCU + 1 
7626 : 60 __ __ RTS
7627 : a5 12 __ LDA WORK + 1 
7629 : d0 1f __ BNE $764a ; (divmod + 88)
762b : a5 11 __ LDA WORK + 0 
762d : 30 1b __ BMI $764a ; (divmod + 88)
762f : a9 00 __ LDA #$00
7631 : 85 14 __ STA WORK + 3 
7633 : a2 10 __ LDX #$10
7635 : 06 29 __ ASL ACCU + 0 
7637 : 26 2a __ ROL ACCU + 1 
7639 : 2a __ __ ROL
763a : c5 11 __ CMP WORK + 0 
763c : 90 02 __ BCC $7640 ; (divmod + 78)
763e : e5 11 __ SBC WORK + 0 
7640 : 26 29 __ ROL ACCU + 0 
7642 : 26 2a __ ROL ACCU + 1 
7644 : ca __ __ DEX
7645 : d0 f2 __ BNE $7639 ; (divmod + 71)
7647 : 85 13 __ STA WORK + 2 
7649 : 60 __ __ RTS
764a : a9 00 __ LDA #$00
764c : 85 13 __ STA WORK + 2 
764e : 85 14 __ STA WORK + 3 
7650 : 84 10 __ STY $10 
7652 : a0 10 __ LDY #$10
7654 : 18 __ __ CLC
7655 : 26 29 __ ROL ACCU + 0 
7657 : 26 2a __ ROL ACCU + 1 
7659 : 26 13 __ ROL WORK + 2 
765b : 26 14 __ ROL WORK + 3 
765d : 38 __ __ SEC
765e : a5 13 __ LDA WORK + 2 
7660 : e5 11 __ SBC WORK + 0 
7662 : aa __ __ TAX
7663 : a5 14 __ LDA WORK + 3 
7665 : e5 12 __ SBC WORK + 1 
7667 : 90 04 __ BCC $766d ; (divmod + 123)
7669 : 86 13 __ STX WORK + 2 
766b : 85 14 __ STA WORK + 3 
766d : 88 __ __ DEY
766e : d0 e5 __ BNE $7655 ; (divmod + 99)
7670 : 26 29 __ ROL ACCU + 0 
7672 : 26 2a __ ROL ACCU + 1 
7674 : a4 10 __ LDY $10 
7676 : 60 __ __ RTS
--------------------------------------------------------------------
mods16: ; mods16
7677 : 24 2a __ BIT ACCU + 1 
7679 : 10 10 __ BPL $768b ; (mods16 + 20)
767b : 20 d6 75 JSR $75d6 ; (negaccu + 0)
767e : 24 12 __ BIT WORK + 1 
7680 : 10 03 __ BPL $7685 ; (mods16 + 14)
7682 : 20 e4 75 JSR $75e4 ; (negtmp + 0)
7685 : 20 f2 75 JSR $75f2 ; (divmod + 0)
7688 : 4c 96 76 JMP $7696 ; (negtmpb + 0)
768b : 24 12 __ BIT WORK + 1 
768d : 10 03 __ BPL $7692 ; (mods16 + 27)
768f : 20 e4 75 JSR $75e4 ; (negtmp + 0)
7692 : 4c f2 75 JMP $75f2 ; (divmod + 0)
7695 : 60 __ __ RTS
--------------------------------------------------------------------
negtmpb: ; negtmpb
7696 : 38 __ __ SEC
7697 : a9 00 __ LDA #$00
7699 : e5 13 __ SBC WORK + 2 
769b : 85 13 __ STA WORK + 2 
769d : a9 00 __ LDA #$00
769f : e5 14 __ SBC WORK + 3 
76a1 : 85 14 __ STA WORK + 3 
76a3 : 60 __ __ RTS
--------------------------------------------------------------------
f32_to_i16: ; f32_to_i16
76a4 : 20 f2 72 JSR $72f2 ; (freg + 36)
76a7 : a5 15 __ LDA WORK + 4 
76a9 : c9 7f __ CMP #$7f
76ab : b0 07 __ BCS $76b4 ; (f32_to_i16 + 16)
76ad : a9 00 __ LDA #$00
76af : 85 29 __ STA ACCU + 0 
76b1 : 85 2a __ STA ACCU + 1 
76b3 : 60 __ __ RTS
76b4 : e9 8e __ SBC #$8e
76b6 : 90 16 __ BCC $76ce ; (f32_to_i16 + 42)
76b8 : 24 2c __ BIT ACCU + 3 
76ba : 30 09 __ BMI $76c5 ; (f32_to_i16 + 33)
76bc : a9 ff __ LDA #$ff
76be : 85 29 __ STA ACCU + 0 
76c0 : a9 7f __ LDA #$7f
76c2 : 85 2a __ STA ACCU + 1 
76c4 : 60 __ __ RTS
76c5 : a9 00 __ LDA #$00
76c7 : 85 29 __ STA ACCU + 0 
76c9 : a9 80 __ LDA #$80
76cb : 85 2a __ STA ACCU + 1 
76cd : 60 __ __ RTS
76ce : aa __ __ TAX
76cf : a5 2a __ LDA ACCU + 1 
76d1 : 46 2b __ LSR ACCU + 2 
76d3 : 6a __ __ ROR
76d4 : e8 __ __ INX
76d5 : d0 fa __ BNE $76d1 ; (f32_to_i16 + 45)
76d7 : 24 2c __ BIT ACCU + 3 
76d9 : 10 0e __ BPL $76e9 ; (f32_to_i16 + 69)
76db : 38 __ __ SEC
76dc : 49 ff __ EOR #$ff
76de : 69 00 __ ADC #$00
76e0 : 85 29 __ STA ACCU + 0 
76e2 : a9 00 __ LDA #$00
76e4 : e5 2b __ SBC ACCU + 2 
76e6 : 85 2a __ STA ACCU + 1 
76e8 : 60 __ __ RTS
76e9 : 85 29 __ STA ACCU + 0 
76eb : a5 2b __ LDA ACCU + 2 
76ed : 85 2a __ STA ACCU + 1 
76ef : 60 __ __ RTS
--------------------------------------------------------------------
sint16_to_float: ; sint16_to_float
76f0 : 24 2a __ BIT ACCU + 1 
76f2 : 30 03 __ BMI $76f7 ; (sint16_to_float + 7)
76f4 : 4c 0e 77 JMP $770e ; (uint16_to_float + 0)
76f7 : 38 __ __ SEC
76f8 : a9 00 __ LDA #$00
76fa : e5 29 __ SBC ACCU + 0 
76fc : 85 29 __ STA ACCU + 0 
76fe : a9 00 __ LDA #$00
7700 : e5 2a __ SBC ACCU + 1 
7702 : 85 2a __ STA ACCU + 1 
7704 : 20 0e 77 JSR $770e ; (uint16_to_float + 0)
7707 : a5 2c __ LDA ACCU + 3 
7709 : 09 80 __ ORA #$80
770b : 85 2c __ STA ACCU + 3 
770d : 60 __ __ RTS
--------------------------------------------------------------------
uint16_to_float: ; uint16_to_float
770e : a5 29 __ LDA ACCU + 0 
7710 : 05 2a __ ORA ACCU + 1 
7712 : d0 05 __ BNE $7719 ; (uint16_to_float + 11)
7714 : 85 2b __ STA ACCU + 2 
7716 : 85 2c __ STA ACCU + 3 
7718 : 60 __ __ RTS
7719 : a2 8e __ LDX #$8e
771b : a5 2a __ LDA ACCU + 1 
771d : 30 06 __ BMI $7725 ; (uint16_to_float + 23)
771f : ca __ __ DEX
7720 : 06 29 __ ASL ACCU + 0 
7722 : 2a __ __ ROL
7723 : 10 fa __ BPL $771f ; (uint16_to_float + 17)
7725 : 0a __ __ ASL
7726 : 85 2b __ STA ACCU + 2 
7728 : a5 29 __ LDA ACCU + 0 
772a : 85 2a __ STA ACCU + 1 
772c : 8a __ __ TXA
772d : 4a __ __ LSR
772e : 85 2c __ STA ACCU + 3 
7730 : a9 00 __ LDA #$00
7732 : 85 29 __ STA ACCU + 0 
7734 : 66 2b __ ROR ACCU + 2 
7736 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
7737 : 84 10 __ STY $10 
7739 : a0 20 __ LDY #$20
773b : a9 00 __ LDA #$00
773d : 85 15 __ STA WORK + 4 
773f : 85 16 __ STA WORK + 5 
7741 : 85 17 __ STA WORK + 6 
7743 : 85 18 __ STA WORK + 7 
7745 : a5 13 __ LDA WORK + 2 
7747 : 05 14 __ ORA WORK + 3 
7749 : d0 78 __ BNE $77c3 ; (divmod32 + 140)
774b : a5 12 __ LDA WORK + 1 
774d : d0 27 __ BNE $7776 ; (divmod32 + 63)
774f : 18 __ __ CLC
7750 : 26 29 __ ROL ACCU + 0 
7752 : 26 2a __ ROL ACCU + 1 
7754 : 26 2b __ ROL ACCU + 2 
7756 : 26 2c __ ROL ACCU + 3 
7758 : 2a __ __ ROL
7759 : 90 05 __ BCC $7760 ; (divmod32 + 41)
775b : e5 11 __ SBC WORK + 0 
775d : 38 __ __ SEC
775e : b0 06 __ BCS $7766 ; (divmod32 + 47)
7760 : c5 11 __ CMP WORK + 0 
7762 : 90 02 __ BCC $7766 ; (divmod32 + 47)
7764 : e5 11 __ SBC WORK + 0 
7766 : 88 __ __ DEY
7767 : d0 e7 __ BNE $7750 ; (divmod32 + 25)
7769 : 85 15 __ STA WORK + 4 
776b : 26 29 __ ROL ACCU + 0 
776d : 26 2a __ ROL ACCU + 1 
776f : 26 2b __ ROL ACCU + 2 
7771 : 26 2c __ ROL ACCU + 3 
7773 : a4 10 __ LDY $10 
7775 : 60 __ __ RTS
7776 : a5 2c __ LDA ACCU + 3 
7778 : d0 10 __ BNE $778a ; (divmod32 + 83)
777a : a6 2b __ LDX ACCU + 2 
777c : 86 2c __ STX ACCU + 3 
777e : a6 2a __ LDX ACCU + 1 
7780 : 86 2b __ STX ACCU + 2 
7782 : a6 29 __ LDX ACCU + 0 
7784 : 86 2a __ STX ACCU + 1 
7786 : 85 29 __ STA ACCU + 0 
7788 : a0 18 __ LDY #$18
778a : 18 __ __ CLC
778b : 26 29 __ ROL ACCU + 0 
778d : 26 2a __ ROL ACCU + 1 
778f : 26 2b __ ROL ACCU + 2 
7791 : 26 2c __ ROL ACCU + 3 
7793 : 26 15 __ ROL WORK + 4 
7795 : 26 16 __ ROL WORK + 5 
7797 : 90 0c __ BCC $77a5 ; (divmod32 + 110)
7799 : a5 15 __ LDA WORK + 4 
779b : e5 11 __ SBC WORK + 0 
779d : aa __ __ TAX
779e : a5 16 __ LDA WORK + 5 
77a0 : e5 12 __ SBC WORK + 1 
77a2 : 38 __ __ SEC
77a3 : b0 0c __ BCS $77b1 ; (divmod32 + 122)
77a5 : 38 __ __ SEC
77a6 : a5 15 __ LDA WORK + 4 
77a8 : e5 11 __ SBC WORK + 0 
77aa : aa __ __ TAX
77ab : a5 16 __ LDA WORK + 5 
77ad : e5 12 __ SBC WORK + 1 
77af : 90 04 __ BCC $77b5 ; (divmod32 + 126)
77b1 : 86 15 __ STX WORK + 4 
77b3 : 85 16 __ STA WORK + 5 
77b5 : 88 __ __ DEY
77b6 : d0 d3 __ BNE $778b ; (divmod32 + 84)
77b8 : 26 29 __ ROL ACCU + 0 
77ba : 26 2a __ ROL ACCU + 1 
77bc : 26 2b __ ROL ACCU + 2 
77be : 26 2c __ ROL ACCU + 3 
77c0 : a4 10 __ LDY $10 
77c2 : 60 __ __ RTS
77c3 : a0 10 __ LDY #$10
77c5 : a5 2c __ LDA ACCU + 3 
77c7 : 85 16 __ STA WORK + 5 
77c9 : a5 2b __ LDA ACCU + 2 
77cb : 85 15 __ STA WORK + 4 
77cd : a9 00 __ LDA #$00
77cf : 85 2b __ STA ACCU + 2 
77d1 : 85 2c __ STA ACCU + 3 
77d3 : 18 __ __ CLC
77d4 : 26 29 __ ROL ACCU + 0 
77d6 : 26 2a __ ROL ACCU + 1 
77d8 : 26 15 __ ROL WORK + 4 
77da : 26 16 __ ROL WORK + 5 
77dc : 26 17 __ ROL WORK + 6 
77de : 26 18 __ ROL WORK + 7 
77e0 : a5 15 __ LDA WORK + 4 
77e2 : c5 11 __ CMP WORK + 0 
77e4 : a5 16 __ LDA WORK + 5 
77e6 : e5 12 __ SBC WORK + 1 
77e8 : a5 17 __ LDA WORK + 6 
77ea : e5 13 __ SBC WORK + 2 
77ec : aa __ __ TAX
77ed : a5 18 __ LDA WORK + 7 
77ef : e5 14 __ SBC WORK + 3 
77f1 : 90 11 __ BCC $7804 ; (divmod32 + 205)
77f3 : 86 17 __ STX WORK + 6 
77f5 : 85 18 __ STA WORK + 7 
77f7 : a5 15 __ LDA WORK + 4 
77f9 : e5 11 __ SBC WORK + 0 
77fb : 85 15 __ STA WORK + 4 
77fd : a5 16 __ LDA WORK + 5 
77ff : e5 12 __ SBC WORK + 1 
7801 : 85 16 __ STA WORK + 5 
7803 : 38 __ __ SEC
7804 : 88 __ __ DEY
7805 : d0 cd __ BNE $77d4 ; (divmod32 + 157)
7807 : 26 29 __ ROL ACCU + 0 
7809 : 26 2a __ ROL ACCU + 1 
780b : a4 10 __ LDY $10 
780d : 60 __ __ RTS
--------------------------------------------------------------------
crt_malloc: ; crt_malloc
780e : 18 __ __ CLC
780f : a5 29 __ LDA ACCU + 0 
7811 : 69 05 __ ADC #$05
7813 : 29 fc __ AND #$fc
7815 : 85 11 __ STA WORK + 0 
7817 : a5 2a __ LDA ACCU + 1 
7819 : 69 00 __ ADC #$00
781b : 85 12 __ STA WORK + 1 
781d : ad e4 7a LDA $7ae4 ; (HeapNode.end + 0)
7820 : d0 26 __ BNE $7848 ; (crt_malloc + 58)
7822 : a9 00 __ LDA #$00
7824 : 8d 92 81 STA $8192 
7827 : 8d 93 81 STA $8193 
782a : ee e4 7a INC $7ae4 ; (HeapNode.end + 0)
782d : a9 90 __ LDA #$90
782f : 09 02 __ ORA #$02
7831 : 8d e2 7a STA $7ae2 ; (HeapNode.next + 0)
7834 : a9 81 __ LDA #$81
7836 : 8d e3 7a STA $7ae3 ; (HeapNode.next + 1)
7839 : 38 __ __ SEC
783a : a9 00 __ LDA #$00
783c : e9 02 __ SBC #$02
783e : 8d 94 81 STA $8194 
7841 : a9 90 __ LDA #$90
7843 : e9 00 __ SBC #$00
7845 : 8d 95 81 STA $8195 
7848 : a9 e2 __ LDA #$e2
784a : a2 7a __ LDX #$7a
784c : 85 2b __ STA ACCU + 2 
784e : 86 2c __ STX ACCU + 3 
7850 : 18 __ __ CLC
7851 : a0 00 __ LDY #$00
7853 : b1 2b __ LDA (ACCU + 2),y 
7855 : 85 29 __ STA ACCU + 0 
7857 : 65 11 __ ADC WORK + 0 
7859 : 85 13 __ STA WORK + 2 
785b : c8 __ __ INY
785c : b1 2b __ LDA (ACCU + 2),y 
785e : 85 2a __ STA ACCU + 1 
7860 : f0 20 __ BEQ $7882 ; (crt_malloc + 116)
7862 : 65 12 __ ADC WORK + 1 
7864 : 85 14 __ STA WORK + 3 
7866 : b0 14 __ BCS $787c ; (crt_malloc + 110)
7868 : a0 02 __ LDY #$02
786a : b1 29 __ LDA (ACCU + 0),y 
786c : c5 13 __ CMP WORK + 2 
786e : c8 __ __ INY
786f : b1 29 __ LDA (ACCU + 0),y 
7871 : e5 14 __ SBC WORK + 3 
7873 : b0 0e __ BCS $7883 ; (crt_malloc + 117)
7875 : a5 29 __ LDA ACCU + 0 
7877 : a6 2a __ LDX ACCU + 1 
7879 : 4c 4c 78 JMP $784c ; (crt_malloc + 62)
787c : a9 00 __ LDA #$00
787e : 85 29 __ STA ACCU + 0 
7880 : 85 2a __ STA ACCU + 1 
7882 : 60 __ __ RTS
7883 : a5 13 __ LDA WORK + 2 
7885 : 85 15 __ STA WORK + 4 
7887 : a5 14 __ LDA WORK + 3 
7889 : 85 16 __ STA WORK + 5 
788b : a0 02 __ LDY #$02
788d : a5 15 __ LDA WORK + 4 
788f : d1 29 __ CMP (ACCU + 0),y 
7891 : d0 15 __ BNE $78a8 ; (crt_malloc + 154)
7893 : c8 __ __ INY
7894 : a5 16 __ LDA WORK + 5 
7896 : d1 29 __ CMP (ACCU + 0),y 
7898 : d0 0e __ BNE $78a8 ; (crt_malloc + 154)
789a : a0 00 __ LDY #$00
789c : b1 29 __ LDA (ACCU + 0),y 
789e : 91 2b __ STA (ACCU + 2),y 
78a0 : c8 __ __ INY
78a1 : b1 29 __ LDA (ACCU + 0),y 
78a3 : 91 2b __ STA (ACCU + 2),y 
78a5 : 4c c5 78 JMP $78c5 ; (crt_malloc + 183)
78a8 : a0 00 __ LDY #$00
78aa : b1 29 __ LDA (ACCU + 0),y 
78ac : 91 15 __ STA (WORK + 4),y 
78ae : a5 15 __ LDA WORK + 4 
78b0 : 91 2b __ STA (ACCU + 2),y 
78b2 : c8 __ __ INY
78b3 : b1 29 __ LDA (ACCU + 0),y 
78b5 : 91 15 __ STA (WORK + 4),y 
78b7 : a5 16 __ LDA WORK + 5 
78b9 : 91 2b __ STA (ACCU + 2),y 
78bb : c8 __ __ INY
78bc : b1 29 __ LDA (ACCU + 0),y 
78be : 91 15 __ STA (WORK + 4),y 
78c0 : c8 __ __ INY
78c1 : b1 29 __ LDA (ACCU + 0),y 
78c3 : 91 15 __ STA (WORK + 4),y 
78c5 : a0 00 __ LDY #$00
78c7 : a5 13 __ LDA WORK + 2 
78c9 : 91 29 __ STA (ACCU + 0),y 
78cb : c8 __ __ INY
78cc : a5 14 __ LDA WORK + 3 
78ce : 91 29 __ STA (ACCU + 0),y 
78d0 : 18 __ __ CLC
78d1 : a5 29 __ LDA ACCU + 0 
78d3 : 69 02 __ ADC #$02
78d5 : 85 29 __ STA ACCU + 0 
78d7 : 90 02 __ BCC $78db ; (crt_malloc + 205)
78d9 : e6 2a __ INC ACCU + 1 
78db : 60 __ __ RTS
--------------------------------------------------------------------
crt_free: ; crt_free
78dc : a5 29 __ LDA ACCU + 0 
78de : 05 2a __ ORA ACCU + 1 
78e0 : d0 01 __ BNE $78e3 ; (crt_free + 7)
78e2 : 60 __ __ RTS
78e3 : 38 __ __ SEC
78e4 : a5 29 __ LDA ACCU + 0 
78e6 : e9 02 __ SBC #$02
78e8 : 85 29 __ STA ACCU + 0 
78ea : b0 02 __ BCS $78ee ; (crt_free + 18)
78ec : c6 2a __ DEC ACCU + 1 
78ee : a0 00 __ LDY #$00
78f0 : b1 29 __ LDA (ACCU + 0),y 
78f2 : 85 2b __ STA ACCU + 2 
78f4 : c8 __ __ INY
78f5 : b1 29 __ LDA (ACCU + 0),y 
78f7 : 85 2c __ STA ACCU + 3 
78f9 : a9 e2 __ LDA #$e2
78fb : a2 7a __ LDX #$7a
78fd : 85 13 __ STA WORK + 2 
78ff : 86 14 __ STX WORK + 3 
7901 : a0 01 __ LDY #$01
7903 : b1 13 __ LDA (WORK + 2),y 
7905 : f0 28 __ BEQ $792f ; (crt_free + 83)
7907 : aa __ __ TAX
7908 : 88 __ __ DEY
7909 : b1 13 __ LDA (WORK + 2),y 
790b : e4 2c __ CPX ACCU + 3 
790d : 90 ee __ BCC $78fd ; (crt_free + 33)
790f : d0 1e __ BNE $792f ; (crt_free + 83)
7911 : c5 2b __ CMP ACCU + 2 
7913 : 90 e8 __ BCC $78fd ; (crt_free + 33)
7915 : d0 18 __ BNE $792f ; (crt_free + 83)
7917 : a0 00 __ LDY #$00
7919 : b1 2b __ LDA (ACCU + 2),y 
791b : 91 29 __ STA (ACCU + 0),y 
791d : c8 __ __ INY
791e : b1 2b __ LDA (ACCU + 2),y 
7920 : 91 29 __ STA (ACCU + 0),y 
7922 : c8 __ __ INY
7923 : b1 2b __ LDA (ACCU + 2),y 
7925 : 91 29 __ STA (ACCU + 0),y 
7927 : c8 __ __ INY
7928 : b1 2b __ LDA (ACCU + 2),y 
792a : 91 29 __ STA (ACCU + 0),y 
792c : 4c 44 79 JMP $7944 ; (crt_free + 104)
792f : a0 00 __ LDY #$00
7931 : b1 13 __ LDA (WORK + 2),y 
7933 : 91 29 __ STA (ACCU + 0),y 
7935 : c8 __ __ INY
7936 : b1 13 __ LDA (WORK + 2),y 
7938 : 91 29 __ STA (ACCU + 0),y 
793a : c8 __ __ INY
793b : a5 2b __ LDA ACCU + 2 
793d : 91 29 __ STA (ACCU + 0),y 
793f : c8 __ __ INY
7940 : a5 2c __ LDA ACCU + 3 
7942 : 91 29 __ STA (ACCU + 0),y 
7944 : a0 02 __ LDY #$02
7946 : b1 13 __ LDA (WORK + 2),y 
7948 : c5 29 __ CMP ACCU + 0 
794a : d0 1d __ BNE $7969 ; (crt_free + 141)
794c : c8 __ __ INY
794d : b1 13 __ LDA (WORK + 2),y 
794f : c5 2a __ CMP ACCU + 1 
7951 : d0 16 __ BNE $7969 ; (crt_free + 141)
7953 : a0 00 __ LDY #$00
7955 : b1 29 __ LDA (ACCU + 0),y 
7957 : 91 13 __ STA (WORK + 2),y 
7959 : c8 __ __ INY
795a : b1 29 __ LDA (ACCU + 0),y 
795c : 91 13 __ STA (WORK + 2),y 
795e : c8 __ __ INY
795f : b1 29 __ LDA (ACCU + 0),y 
7961 : 91 13 __ STA (WORK + 2),y 
7963 : c8 __ __ INY
7964 : b1 29 __ LDA (ACCU + 0),y 
7966 : 91 13 __ STA (WORK + 2),y 
7968 : 60 __ __ RTS
7969 : a0 00 __ LDY #$00
796b : a5 29 __ LDA ACCU + 0 
796d : 91 13 __ STA (WORK + 2),y 
796f : c8 __ __ INY
7970 : a5 2a __ LDA ACCU + 1 
7972 : 91 13 __ STA (WORK + 2),y 
7974 : 60 __ __ RTS
--------------------------------------------------------------------
textColors:
7975 : __ __ __ BYT 00 00 00 dd 00 33 00 00 99 dd 22 dd 00 77 22 55 : .....3...."..w"U
7985 : __ __ __ BYT 55 55 22 22 ff 66 aa ff 88 55 00 ff 66 00 aa aa : UU"".f...U..f...
7995 : __ __ __ BYT aa ff 99 88 00 dd 00 ff ff 00 55 ff 99 ff ff ff : ..........U.....
--------------------------------------------------------------------
cur_cli_y:
79a5 : __ __ __ BYT 2c                                              : ,
--------------------------------------------------------------------
cur_rem_y:
79a6 : __ __ __ BYT 02                                              : .
--------------------------------------------------------------------
cur_loc_y:
79a7 : __ __ __ BYT 02                                              : .
--------------------------------------------------------------------
at_ok:
79a8 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
at_error:
79a9 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
rxstate:
79aa : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
linelen:
79ab : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
ipd_hdr_len:
79ac : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
debug_mode:
79ad : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
data_closed:
79ae : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
ipd_link:
79af : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
ipd_remaining:
79b0 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
ctrllen:
79b2 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
ctrl_reply_code:
79b3 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
ctrl_reply_ready:
79b5 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
data_sink:
79b6 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
listlinelen:
79b7 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
filebuf_len:
79b8 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
downloadBytes:
79b9 : __ __ __ BYT 00 00 00 00                                     : ....
--------------------------------------------------------------------
out_fp:
79bd : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
s:
79bf : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
remoteDirectory:
79c1 : __ __ __ BYT 2f 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : /...............
79d1 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
79e1 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
79f1 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00             : ............
--------------------------------------------------------------------
f256k_color:
79fd : __ __ __ BYT f0                                              : .
--------------------------------------------------------------------
oldHighlight:
79fe : __ __ __ BYT ff                                              : .
--------------------------------------------------------------------
oldHighlightLocal:
79ff : __ __ __ BYT ff                                              : .
--------------------------------------------------------------------
localDirectory:
7a00 : __ __ __ BYT 2f 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : /...............
7a10 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
7a20 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
7a30 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00             : ............
--------------------------------------------------------------------
fround5:
7a3c : __ __ __ BYT 00 00 00 3f cd cc 4c 3d 0a d7 a3 3b 6f 12 03 3a : ...?..L=...;o..:
7a4c : __ __ __ BYT 17 b7 51 38 ac c5 a7 36 bd 37 06 35             : ..Q8...6.7.5
--------------------------------------------------------------------
isFileTrailing:
7a58 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
isRemoteListed:
7a59 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
downloadTotal:
7a5a : __ __ __ BYT 00 00 00 00                                     : ....
--------------------------------------------------------------------
downloadComplete:
7a5e : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
downloadProgressY:
7a5f : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
progressTickCounter:
7a60 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
progressLastFilled:
7a62 : __ __ __ BYT ff                                              : .
--------------------------------------------------------------------
progressLastY:
7a63 : __ __ __ BYT ff                                              : .
--------------------------------------------------------------------
kernelArgs:
7a64 : __ __ __ BSS	2
--------------------------------------------------------------------
kernelEventData:
7a66 : __ __ __ BSS	7
--------------------------------------------------------------------
_MAX_X:
7a6d : __ __ __ BSS	2
--------------------------------------------------------------------
_active:
7a6f : __ __ __ BSS	1
--------------------------------------------------------------------
_color:
7a70 : __ __ __ BSS	1
--------------------------------------------------------------------
_BITMAP_BASE:
7a71 : __ __ __ BSS	12
--------------------------------------------------------------------
_BITMAP_CLUT:
7a7d : __ __ __ BSS	3
--------------------------------------------------------------------
_tileSize:
7a80 : __ __ __ BSS	3
--------------------------------------------------------------------
_spriteCtl:
7a83 : __ __ __ BSS	64
--------------------------------------------------------------------
_dirStream:
7ac3 : __ __ __ BSS	8
--------------------------------------------------------------------
_kern_target:
7acb : __ __ __ BSS	2
--------------------------------------------------------------------
_kernelError:
7acd : __ __ __ BSS	1
--------------------------------------------------------------------
ipd_hdr:
7ace : __ __ __ BSS	20
--------------------------------------------------------------------
HeapNode:
7ae2 : __ __ __ BSS	4
--------------------------------------------------------------------
at_resp_line:
7b00 : __ __ __ BSS	128
--------------------------------------------------------------------
linebuf:
7b80 : __ __ __ BSS	128
--------------------------------------------------------------------
ctrlline:
7c00 : __ __ __ BSS	128
--------------------------------------------------------------------
ctrl_reply_text:
7c80 : __ __ __ BSS	128
--------------------------------------------------------------------
listline:
7d00 : __ __ __ BSS	80
--------------------------------------------------------------------
remoteFiles:
7d50 : __ __ __ BSS	696
--------------------------------------------------------------------
filebuf:
8008 : __ __ __ BSS	128
--------------------------------------------------------------------
fileDirEntS:
8088 : __ __ __ BSS	258
--------------------------------------------------------------------
mainpalette:
10000 : __ __ __ BYT 00 00 00 ff aa 00 00 ff 00 aa 00 ff aa aa 00 ff : ................
10010 : __ __ __ BYT 00 00 aa ff aa 00 aa ff 00 55 aa ff aa aa aa ff : .........U......
10020 : __ __ __ BYT 55 55 55 ff ff 55 55 ff 55 ff 55 ff ff ff 55 ff : UUU..UU.U.U...U.
10030 : __ __ __ BYT 55 55 ff ff ff 55 ff ff 55 ff ff ff ff ff ff ff : UU...U..U.......
10040 : __ __ __ BYT 00 00 00 ff 10 10 10 ff 20 20 20 ff 35 35 35 ff : ........   .555.
10050 : __ __ __ BYT 45 45 45 ff 55 55 55 ff 65 65 65 ff 75 75 75 ff : EEE.UUU.eee.uuu.
10060 : __ __ __ BYT 8a 8a 8a ff 9a 9a 9a ff aa aa aa ff ba ba ba ff : ................
10070 : __ __ __ BYT ca ca ca ff df df df ff ef ef ef ff ff ff ff ff : ................
10080 : __ __ __ BYT ff 00 00 ff ff 00 41 ff ff 00 82 ff ff 00 be ff : ......A.........
10090 : __ __ __ BYT ff 00 ff ff be 00 ff ff 82 00 ff ff 41 00 ff ff : ............A...
100a0 : __ __ __ BYT 00 00 ff ff 00 41 ff ff 00 82 ff ff 00 be ff ff : .....A..........
100b0 : __ __ __ BYT 00 ff ff ff 00 ff be ff 00 ff 82 ff 00 ff 41 ff : ..............A.
100c0 : __ __ __ BYT 00 ff 00 ff 41 ff 00 ff 82 ff 00 ff be ff 00 ff : ....A...........
100d0 : __ __ __ BYT ff ff 00 ff ff be 00 ff ff 82 00 ff ff 41 00 ff : .............A..
100e0 : __ __ __ BYT ff 82 82 ff ff 82 9e ff ff 82 be ff ff 82 df ff : ................
100f0 : __ __ __ BYT ff 82 ff ff df 82 ff ff be 82 ff ff 9e 82 ff ff : ................
10100 : __ __ __ BYT 82 82 ff ff 82 9e ff ff 82 be ff ff 82 df ff ff : ................
10110 : __ __ __ BYT 82 ff ff ff 82 ff df ff 82 ff be ff 82 ff 9e ff : ................
10120 : __ __ __ BYT 82 ff 82 ff 9e ff 82 ff be ff 82 ff df ff 82 ff : ................
10130 : __ __ __ BYT ff ff 82 ff ff df 82 ff ff be 82 ff ff 9e 82 ff : ................
10140 : __ __ __ BYT ff ba ba ff ff ba ca ff ff ba df ff ff ba ef ff : ................
10150 : __ __ __ BYT ff ba ff ff ef ba ff ff df ba ff ff ca ba ff ff : ................
10160 : __ __ __ BYT ba ba ff ff ba ca ff ff ba df ff ff ba ef ff ff : ................
10170 : __ __ __ BYT ba ff ff ff ba ff ef ff ba ff df ff ba ff ca ff : ................
10180 : __ __ __ BYT ba ff ba ff ca ff ba ff df ff ba ff ef ff ba ff : ................
10190 : __ __ __ BYT ff ff ba ff ff ef ba ff ff df ba ff ff ca ba ff : ................
101a0 : __ __ __ BYT 71 00 00 ff 71 00 1c ff 71 00 39 ff 71 00 55 ff : q...q...q.9.q.U.
101b0 : __ __ __ BYT 71 00 71 ff 55 00 71 ff 39 00 71 ff 1c 00 71 ff : q.q.U.q.9.q...q.
101c0 : __ __ __ BYT 00 00 71 ff 00 1c 71 ff 00 39 71 ff 00 55 71 ff : ..q...q..9q..Uq.
101d0 : __ __ __ BYT 00 71 71 ff 00 71 55 ff 00 71 39 ff 00 71 1c ff : .qq..qU..q9..q..
101e0 : __ __ __ BYT 00 71 00 ff 1c 71 00 ff 39 71 00 ff 55 71 00 ff : .q...q..9q..Uq..
101f0 : __ __ __ BYT 71 71 00 ff 71 55 00 ff 71 39 00 ff 71 1c 00 ff : qq..qU..q9..q...
10200 : __ __ __ BYT 71 39 39 ff 71 39 45 ff 71 39 55 ff 71 39 61 ff : q99.q9E.q9U.q9a.
10210 : __ __ __ BYT 71 39 71 ff 61 39 71 ff 55 39 71 ff 45 39 71 ff : q9q.a9q.U9q.E9q.
10220 : __ __ __ BYT 39 39 71 ff 39 45 71 ff 39 55 71 ff 39 61 71 ff : 99q.9Eq.9Uq.9aq.
10230 : __ __ __ BYT 39 71 71 ff 39 71 61 ff 39 71 55 ff 39 71 45 ff : 9qq.9qa.9qU.9qE.
10240 : __ __ __ BYT 39 71 39 ff 45 71 39 ff 55 71 39 ff 61 71 39 ff : 9q9.Eq9.Uq9.aq9.
10250 : __ __ __ BYT 71 71 39 ff 71 61 39 ff 71 55 39 ff 71 45 39 ff : qq9.qa9.qU9.qE9.
10260 : __ __ __ BYT 71 51 51 ff 71 51 59 ff 71 51 61 ff 71 51 69 ff : qQQ.qQY.qQa.qQi.
10270 : __ __ __ BYT 71 51 71 ff 69 51 71 ff 61 51 71 ff 59 51 71 ff : qQq.iQq.aQq.YQq.
10280 : __ __ __ BYT 51 51 71 ff 51 59 71 ff 51 61 71 ff 51 69 71 ff : QQq.QYq.Qaq.Qiq.
10290 : __ __ __ BYT 51 71 71 ff 51 71 69 ff 51 71 61 ff 51 71 59 ff : Qqq.Qqi.Qqa.QqY.
102a0 : __ __ __ BYT 51 71 51 ff 59 71 51 ff 61 71 51 ff 69 71 51 ff : QqQ.YqQ.aqQ.iqQ.
102b0 : __ __ __ BYT 71 71 51 ff 71 69 51 ff 71 61 51 ff 71 59 51 ff : qqQ.qiQ.qaQ.qYQ.
102c0 : __ __ __ BYT 41 00 00 ff 41 00 10 ff 41 00 20 ff 41 00 31 ff : A...A...A. .A.1.
102d0 : __ __ __ BYT 41 00 41 ff 31 00 41 ff 20 00 41 ff 10 00 41 ff : A.A.1.A. .A...A.
102e0 : __ __ __ BYT 00 00 41 ff 00 10 41 ff 00 20 41 ff 00 31 41 ff : ..A...A.. A..1A.
102f0 : __ __ __ BYT 00 41 41 ff 00 41 31 ff 00 41 20 ff 00 41 10 ff : .AA..A1..A ..A..
10300 : __ __ __ BYT 00 41 00 ff 10 41 00 ff 20 41 00 ff 31 41 00 ff : .A...A.. A..1A..
10310 : __ __ __ BYT 41 41 00 ff 41 31 00 ff 41 20 00 ff 41 10 00 ff : AA..A1..A ..A...
10320 : __ __ __ BYT 41 20 20 ff 41 20 28 ff 41 20 31 ff 41 20 39 ff : A  .A (.A 1.A 9.
10330 : __ __ __ BYT 41 20 41 ff 39 20 41 ff 31 20 41 ff 28 20 41 ff : A A.9 A.1 A.( A.
10340 : __ __ __ BYT 20 20 41 ff 20 28 41 ff 20 31 41 ff 20 39 41 ff :   A. (A. 1A. 9A.
10350 : __ __ __ BYT 20 41 41 ff 20 41 39 ff 20 41 31 ff 20 41 28 ff :  AA. A9. A1. A(.
10360 : __ __ __ BYT 20 41 20 ff 28 41 20 ff 31 41 20 ff 39 41 20 ff :  A .(A .1A .9A .
10370 : __ __ __ BYT 41 41 20 ff 41 39 20 ff 41 31 20 ff 41 28 20 ff : AA .A9 .A1 .A( .
10380 : __ __ __ BYT 41 2d 2d ff 41 2d 31 ff 41 2d 35 ff 41 2d 3d ff : A--.A-1.A-5.A-=.
10390 : __ __ __ BYT 41 2d 41 ff 3d 2d 41 ff 35 2d 41 ff 31 2d 41 ff : A-A.=-A.5-A.1-A.
103a0 : __ __ __ BYT 2d 2d 41 ff 2d 31 41 ff 2d 35 41 ff 2d 3d 41 ff : --A.-1A.-5A.-=A.
103b0 : __ __ __ BYT 2d 41 41 ff 2d 41 3d ff 2d 41 35 ff 2d 41 31 ff : -AA.-A=.-A5.-A1.
103c0 : __ __ __ BYT 2d 41 2d ff 31 41 2d ff 35 41 2d ff 3d 41 2d ff : -A-.1A-.5A-.=A-.
103d0 : __ __ __ BYT 41 41 2d ff 41 3d 2d ff 41 35 2d ff 41 31 2d ff : AA-.A=-.A5-.A1-.
103e0 : __ __ __ BYT 00 00 00 ff 00 00 00 ff 00 00 00 ff 00 00 00 ff : ................
103f0 : __ __ __ BYT 00 00 00 ff 00 00 00 ff 00 00 00 ff 00 00 00 ff : ................
--------------------------------------------------------------------
fileIconSprite:
10400 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
10410 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
10420 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
10430 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
10440 : __ __ __ BYT 00 00 00 00 00 21 21 21 21 21 21 21 21 21 21 21 : .....!!!!!!!!!!!
10450 : __ __ __ BYT 21 21 21 00 00 00 00 00 00 00 00 00 00 00 00 00 : !!!.............
10460 : __ __ __ BYT 00 00 00 00 00 21 17 17 17 17 17 17 17 17 17 17 : .....!..........
10470 : __ __ __ BYT 17 17 21 21 00 00 00 00 00 00 00 00 00 00 00 00 : ..!!............
10480 : __ __ __ BYT 00 00 00 00 00 21 17 18 18 18 18 18 18 18 18 18 : .....!..........
10490 : __ __ __ BYT 18 17 21 1b 21 00 00 00 00 00 00 00 00 00 00 00 : ..!.!...........
104a0 : __ __ __ BYT 00 00 00 00 00 21 17 18 19 19 19 19 19 19 19 19 : .....!..........
104b0 : __ __ __ BYT 18 17 21 1b 1b 21 00 00 00 00 00 00 00 00 00 00 : ..!..!..........
104c0 : __ __ __ BYT 00 00 00 00 00 21 17 18 19 19 19 19 19 19 19 19 : .....!..........
104d0 : __ __ __ BYT 18 17 21 1b 1c 1b 21 00 00 00 00 00 00 00 00 00 : ..!...!.........
104e0 : __ __ __ BYT 00 00 00 00 00 21 17 18 19 19 19 19 19 19 19 19 : .....!..........
104f0 : __ __ __ BYT 18 17 21 1b 1c 1c 1b 21 00 00 00 00 00 00 00 00 : ..!....!........
10500 : __ __ __ BYT 00 00 00 00 00 21 17 18 19 19 19 19 19 19 19 19 : .....!..........
10510 : __ __ __ BYT 18 17 21 1b 1c 1c 1c 1b 21 00 00 00 00 00 00 00 : ..!.....!.......
10520 : __ __ __ BYT 00 00 00 00 00 21 17 18 19 19 19 19 19 19 19 19 : .....!..........
10530 : __ __ __ BYT 18 17 21 1b 1c 1c 1c 1c 1b 21 00 00 00 00 00 00 : ..!......!......
10540 : __ __ __ BYT 00 00 00 00 00 21 17 18 19 19 19 19 19 19 19 19 : .....!..........
10550 : __ __ __ BYT 18 17 21 1b 1b 1b 1b 1b 1b 1b 21 00 00 00 00 00 : ..!.......!.....
10560 : __ __ __ BYT 00 00 00 00 00 21 17 18 19 19 19 19 19 19 19 19 : .....!..........
10570 : __ __ __ BYT 18 17 21 21 21 21 21 21 21 21 21 21 00 00 00 00 : ..!!!!!!!!!!....
10580 : __ __ __ BYT 00 00 00 00 00 21 17 18 19 19 19 19 19 19 19 19 : .....!..........
10590 : __ __ __ BYT 18 17 17 17 17 17 17 17 17 17 17 21 00 00 00 00 : ...........!....
105a0 : __ __ __ BYT 00 00 00 00 00 21 17 18 19 19 19 19 19 19 19 19 : .....!..........
105b0 : __ __ __ BYT 18 18 18 18 18 18 18 18 18 18 17 21 00 00 00 00 : ...........!....
105c0 : __ __ __ BYT 00 00 00 00 00 21 17 18 19 19 19 19 19 19 19 19 : .....!..........
105d0 : __ __ __ BYT 19 19 19 19 19 19 19 19 19 18 17 21 00 00 00 00 : ...........!....
105e0 : __ __ __ BYT 00 00 00 00 00 21 17 18 19 19 19 19 19 19 19 19 : .....!..........
105f0 : __ __ __ BYT 19 19 19 19 19 19 19 19 19 18 17 21 00 00 00 00 : ...........!....
10600 : __ __ __ BYT 00 00 00 00 00 21 17 18 19 19 19 19 19 19 19 19 : .....!..........
10610 : __ __ __ BYT 19 19 19 19 19 19 19 19 19 18 17 21 00 00 00 00 : ...........!....
10620 : __ __ __ BYT 00 00 00 00 00 21 17 18 19 19 19 19 19 19 19 19 : .....!..........
10630 : __ __ __ BYT 19 19 19 19 19 19 19 19 19 18 17 21 00 00 00 00 : ...........!....
10640 : __ __ __ BYT 00 00 00 00 00 21 17 18 19 19 19 19 19 19 19 19 : .....!..........
10650 : __ __ __ BYT 19 19 19 19 19 19 19 19 19 18 17 21 00 00 00 00 : ...........!....
10660 : __ __ __ BYT 00 00 00 00 00 21 17 18 19 19 19 19 19 19 19 19 : .....!..........
10670 : __ __ __ BYT 19 19 19 19 19 19 19 19 19 18 17 21 00 00 00 00 : ...........!....
10680 : __ __ __ BYT 00 00 00 00 00 21 17 18 19 19 19 19 19 19 19 19 : .....!..........
10690 : __ __ __ BYT 19 19 19 19 19 19 19 19 19 18 17 21 00 00 00 00 : ...........!....
106a0 : __ __ __ BYT 00 00 00 00 00 21 17 18 19 19 19 19 19 19 19 19 : .....!..........
106b0 : __ __ __ BYT 19 19 19 19 19 19 19 19 19 18 17 21 00 00 00 00 : ...........!....
106c0 : __ __ __ BYT 00 00 00 00 00 21 17 18 19 19 19 19 19 19 19 19 : .....!..........
106d0 : __ __ __ BYT 19 19 19 19 19 19 19 19 19 18 17 21 00 00 00 00 : ...........!....
106e0 : __ __ __ BYT 00 00 00 00 00 21 17 18 19 19 19 19 19 19 19 19 : .....!..........
106f0 : __ __ __ BYT 19 19 19 19 19 19 19 19 19 18 17 21 00 00 00 00 : ...........!....
10700 : __ __ __ BYT 00 00 00 00 00 21 17 18 19 19 19 19 19 19 19 19 : .....!..........
10710 : __ __ __ BYT 19 19 19 19 19 19 19 19 19 18 17 21 00 00 00 00 : ...........!....
10720 : __ __ __ BYT 00 00 00 00 00 21 17 18 19 19 19 19 19 19 19 19 : .....!..........
10730 : __ __ __ BYT 19 19 19 19 19 19 19 19 19 18 17 21 00 00 00 00 : ...........!....
10740 : __ __ __ BYT 00 00 00 00 00 21 17 18 19 19 19 19 19 19 19 19 : .....!..........
10750 : __ __ __ BYT 19 19 19 19 19 19 19 19 19 18 17 21 00 00 00 00 : ...........!....
10760 : __ __ __ BYT 00 00 00 00 00 21 17 18 18 18 18 18 18 18 18 18 : .....!..........
10770 : __ __ __ BYT 18 18 18 18 18 18 18 18 18 18 17 21 00 00 00 00 : ...........!....
10780 : __ __ __ BYT 00 00 00 00 00 21 17 17 17 17 17 17 17 17 17 17 : .....!..........
10790 : __ __ __ BYT 17 17 17 17 17 17 17 17 17 17 17 21 00 00 00 00 : ...........!....
107a0 : __ __ __ BYT 00 00 00 00 00 21 21 21 21 21 21 21 21 21 21 21 : .....!!!!!!!!!!!
107b0 : __ __ __ BYT 21 21 21 21 21 21 21 21 21 21 21 21 00 00 00 00 : !!!!!!!!!!!!....
107c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
107d0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
107e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
107f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................

/*
 * muOPL3.c: OPL2/OPL3 VGM routines for the onboard YMF262 for fm synth music and sound effects
 * Uses the fpga based YMF262 of generation 1 F256K or generation Wildbits/Jr2/K2
 * v1.0 July 21st 2026
 * Written by Mu0n aka 1Bit Fever Dreams aka AnyBits Fever Dreams
 *
 * Usage: 
 * 1) To start using these routines, make sure you run opl3_initialize() once during you setup.
 * 2) Optional: start fresh with all the channels with opl3_initialize_defs()
 * 3) To make any sound, you'll have to set an instrument using a struct opl3Instrument (check muOPL3.h) and the function opl3_setInstrument
 *    followed by at least one call to opl3_note with a note on, and a second call to opl3_note for note off when you're done.
 */
 
#include "f256lib.h"
#include "muOPL3.h"
	
static opl3I opl3_instrument_defs[18]; //used to store instrument definitions while playback occurs!
uint8_t chip_VT_PERC; //chip wide vibrato tremolo depth, highest 2 MSb
uint8_t chip_OPL3_PAIRS; //checks out which channels are together if detected, set the byte to 0x3F when spreading that instrument throughout.
uint8_t chip_enable; //enable waveforms other than sine bits
uint8_t chip_NOTESEL; //note select and CSW

//these are used the build the base frequencies for notes of a full octave (12 semi-tones in equal temperament). read the docs because it's not 1:1 to frequency in Hz here.
const uint16_t opl3_fnums[] = {0x205, 0x223, 0x244, 0x267, 0x28B, 0x2B2,
						       0x2DB, 0x306, 0x334, 0x365, 0x399, 0x3CF};
					

//Must perform this at least once at the beginning of your program
void opl3_initialize() {
	uint8_t i;
	
	//chip wide operators
	opl3_write(OPL_EN, 0x20); //chip wide reset
	opl3_write(OPL_T1, 0x00); 
	opl3_write(OPL_T2, 0x00); 
	opl3_write(OPL_FOE, 0x00); //four operator enable
	opl3_write(OPL_OPL3, 0x01); //enable opl3
	opl3_write(OPL_CSW, 0x00); //composite sine wave mode off
	opl3_write(OPL_PERC, 0x00); //no vibrato depth, trem depth and turn perc mode all off
	
	//channel wide settings
	for(i=0;i<9;i++) {
		opl3_write((uint16_t)OPL_CH_FEED |  (uint16_t)i,   0x30); //channels 0 to 8
	}	
	for(i=0;i<9;i++) {
		opl3_write(0x0100 | (uint16_t)OPL_CH_FEED |  (uint16_t)i,   0x30); //channels 0 to 8
	}
	opl3_quietAll();
}

//Only use this if you want to directly write your own operators/channels to tweak instruments
void opl3_initialize_defs() {
	chip_VT_PERC = 0;
	chip_OPL3_PAIRS = 0;
	chip_enable = 0;
	for(uint8_t i=0;i<18;i++)
	{
		opl3_instrument_defs[i].OP2_TVSKF=0; //OP2 Carrier, OP1 Modulator
		opl3_instrument_defs[i].OP2_TVSKF=0; //OP2 Carrier, OP1 Modulator
		opl3_instrument_defs[i].OP1_TVSKF=0;
		opl3_instrument_defs[i].OP2_KSLVOL=0;
		opl3_instrument_defs[i].OP1_KSLVOL=0;
		opl3_instrument_defs[i].OP2_AD=0;
		opl3_instrument_defs[i].OP1_AD=0;
		opl3_instrument_defs[i].OP2_SR=0;
		opl3_instrument_defs[i].OP1_SR=0;
		opl3_instrument_defs[i].OP2_WAV=0;
		opl3_instrument_defs[i].OP1_WAV=0;
		opl3_instrument_defs[i].CHAN_FEED=0;
		opl3_instrument_defs[i].CHAN_FRLO=0;
		opl3_instrument_defs[i].CHAN_FNUM=0;
		opl3_instrument_defs[i].KEYHIT = 0x00;
	}
}

void opl3_quietAll()
{	
	uint8_t channel;
	for(channel=0;channel<9;channel++) 
	{
		opl3_write(OPL_CH_KBF_HI | channel, 0x00); //channels 0 to 8 remove key on
		opl3_write(OPL_CH_F_LO   | channel, 0x00); //channels 0 to 8
	}
	for(channel=0;channel<9;channel++) 
	{
		opl3_write(0x0100 | (uint16_t)OPL_CH_KBF_HI | (uint16_t)channel, 0x00); //channels 9 to 17 remove key on
		opl3_write(0x0100 | (uint16_t)OPL_CH_F_LO   | (uint16_t)channel, 0x00); //channels 9 to 17
	}
}

void opl3_setInstrument(struct opl3Instrument inst, uint8_t chan)
{ 
	uint16_t highb=0x0000;
	
	uint8_t offset= 0x00;
	
	offset += chan;
	if(chan>2) offset += 0x05;
	if(chan>5) offset += 0x05;
	if(chan>8) 
	{
		offset -= 19;
		highb=0x0100;
	}
	if(chan>11) offset += 0x05;
	if(chan>14) offset += 0x05;
	
	
	opl3_write(highb | (uint16_t)OPL_OP_WAV     | (uint16_t)offset,                 inst.OP1_WAV);
	opl3_write(highb | (uint16_t)OPL_OP_WAV     | (uint16_t)offset+ (uint16_t)0x03, inst.OP2_WAV);
	
	opl3_write(highb | (uint16_t)OPL_OP_TVSKF   | (uint16_t)offset,                 inst.OP1_TVSKF);
	opl3_write(highb | (uint16_t)OPL_OP_TVSKF   | (uint16_t)offset+ (uint16_t)0x03, inst.OP2_TVSKF);
	
	opl3_write(highb | (uint16_t)OPL_OP_KSLVOL  | (uint16_t)offset,                 inst.OP1_KSLVOL);
	opl3_write(highb | (uint16_t)OPL_OP_KSLVOL  | (uint16_t)offset+ (uint16_t)0x03, inst.OP2_KSLVOL);
	
	opl3_write(highb | (uint16_t)OPL_OP_AD      | (uint16_t)offset,                 inst.OP1_AD);
	opl3_write(highb | (uint16_t)OPL_OP_AD      | (uint16_t)offset+ (uint16_t)0x03, inst.OP2_AD);
	
	opl3_write(highb | (uint16_t)OPL_OP_SR      | (uint16_t)offset,                 inst.OP1_SR);
	opl3_write(highb | (uint16_t)OPL_OP_SR      | (uint16_t)offset+ (uint16_t)0x03, inst.OP2_SR);
}

//This set of the following 3 functions can set chip-wide settings
void opl3_setFeed(uint8_t val, uint8_t which)
{
	if(which>8) opl3_write(0x100 | (uint16_t)OPL_CH_FEED | (uint16_t)which,   val);
	else opl3_write((uint16_t)OPL_CH_FEED | (uint16_t)which,   val);
}

void opl3_setFrLo(uint8_t val, uint8_t which)
{
	if(which>8) opl3_write(0x100 | (uint16_t)OPL_CH_F_LO | (uint16_t)which, val);
	else opl3_write((uint16_t)OPL_CH_F_LO | (uint16_t)which, val);
}

void opl3_setFnum(uint8_t val, uint8_t which)
{
	if(which>8) opl3_write(0x100 | (uint16_t)OPL_CH_KBF_HI | (uint16_t)which, val);
	else opl3_write((uint16_t)OPL_CH_KBF_HI | (uint16_t)which, val);
}

// Function to write a value to a YMF262 register
void opl3_write(uint16_t address, uint8_t value) {
    if (address < 0x100) {
        // Address in range 0x000 - 0x0FF
		POKE(OPL_ADDR_L, address);
    } else {
        // Address in range 0x100 - 0x1FF
		POKE(OPL_ADDR_H,(address & 0xFF));
    }
    // Write the value to OPL_DATA
	POKE(OPL_DATA, value);
}

// opl3_note is used to turn on/off notes. 
// channel: 0 to 8 to use the first opl2 compatible bank, channel 9 to 17 to use the opl3 exclusive bank
// fnum: Pick one of 12 tones from opl3_fnums, 
// block: pick your 0-7 octave 'block' and duration in frames
// onOrOff: true to start the note and false to begin to end it
void opl3_note(uint8_t channel, uint16_t fnum, uint8_t block, bool onOrOff) {
	uint16_t hb = 0x0000;
	uint8_t reduce = 0;
	if(channel>8)
	{
	hb = 0x0100;
	reduce = 9;
	}
	// Set frequency (low byte)
    opl3_write(hb | (uint16_t)OPL_CH_F_LO | (uint16_t)(channel-reduce), fnum & 0xFF);
    // Set block/frequency (high byte) and enable sound (Key-On) or off depending on onOrOff value
    opl3_write(hb | (uint16_t)OPL_CH_KBF_HI | (uint16_t)(channel-reduce), ((fnum >> 8) & 0x03) | ((uint16_t)block << 2) | (onOrOff?0x20:0x00));
}

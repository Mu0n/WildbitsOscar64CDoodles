/*
 * muMIDI.c: basic midi command functionality for sending notes, changing instruments, stopping
 * channels and storing the header information read from a standard MIDI file with the
 * struct midiRecord.
 * Uses the sam2695 dream chip of generation 2 Wildbits/Jr2/K2 which uses a FIFO buffer at MIDI_FIFO (0xDDA1)
 * v1.0 July 21st 2026
 * Written by Mu0n aka 1Bit Fever Dreams aka AnyBits Fever Dreams
 */

#ifndef MUMIDI_C
#define MUMIDI_C

#include "f256lib.h"
#include "muMidi.h"

//shut one channel in particular from 0 to 15
void midiShutAChannel(uint8_t chan) {
	POKE(MIDI_FIFO, 0xB0 | chan); // control change message
	POKE(MIDI_FIFO, 0x78); // hard stop with enveloppe killing
	POKE(MIDI_FIFO, 0x00); 
}
//shut all channels from 0 to 15
void midiShutAllChannels() {
	uint8_t i=0;
	for(i=0;i<16;i++)
	{
	POKE(MIDI_FIFO, 0xB0 | i); // control change message
	POKE(MIDI_FIFO, 0x78); // hard stop with enveloppe killing
	POKE(MIDI_FIFO, 0x00); 
	}
}

//Stop all ongoing sounds (ie MIDI panic button)
void midiShutUp() {
	POKE(MIDI_FIFO, 0xFF);
}

//Reset all instruments for all 16 channels to acoustic grand piano 00
void resetInstruments() {
	uint8_t i;
	for(i=0;i<16;i++)
	{
		POKE(MIDI_FIFO, 0xC0 | i);
		POKE(MIDI_FIFO, 0x00);
		
		POKE(MIDI_FIFO, 0xB0 | i); // control change message
		POKE(MIDI_FIFO, 0x7B); // all notes off command, but respects sustain pedal
		POKE(MIDI_FIFO, 0x00); 
		
		POKE(MIDI_FIFO, 0xB0 | i); // control change message
		POKE(MIDI_FIFO, 0x79); // reset all controllers (bend, etc)
		POKE(MIDI_FIFO, 0x00); 
		
	}
	midiShutUp();
}
//Set an instrument prg to channel chan
void prgChange(uint8_t prg, uint8_t chan) {
	POKE(MIDI_FIFO, 0xC0 | chan);
	POKE(MIDI_FIFO, prg);
}

//Cuts an ongoing note on a specified channel
void midiNoteOff(uint8_t channel, uint8_t note, uint8_t speed) {
	POKE(MIDI_FIFO, 0x80 | channel);
	POKE(MIDI_FIFO, note);
	POKE(MIDI_FIFO, speed);
}
//Plays a note on a specified channel
void midiNoteOn(uint8_t channel, uint8_t note, uint8_t speed) {
	POKE(MIDI_FIFO, 0x90 | channel);
	POKE(MIDI_FIFO, note);
	POKE(MIDI_FIFO, speed);
}

void initMidiRecord(struct midiRecord *rec, uint32_t baseAddr) {
	rec->totalDuration=0;
	//if(rec->fileName == NULL) rec->fileName = malloc(sizeof(char) * 64);
	rec->format = 0;
	rec->trackcount =0;
	rec->tick = 48;
	rec->fileSize = 0;
	rec->nn=4;
	rec->dd=2;
	rec->cc=24;
	rec->bb=8;
	rec->currentSec=0;
	rec->totalSec=0;
	rec->baseAddr=baseAddr;
}
	


#endif // MUMIDI_C
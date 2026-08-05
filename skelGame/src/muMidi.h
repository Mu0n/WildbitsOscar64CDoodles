/*
 * muMIDI.h: basic midi command functionality for sending notes, changing instruments, stopping
 * channels and storing the header information read from a standard MIDI file with the
 * struct midiRecord.
 * Uses the sam2695 dream chip of generation 2 Wildbits/Jr2/K2 which uses a FIFO buffer at MIDI_FIFO (0xDDA1)
 * v1.0 July 21st 2026
 * Written by Mu0n aka 1Bit Fever Dreams aka AnyBits Fever Dreams
 */


#ifndef MUMIDI_H
#define MUMIDI_H

//MIDI related meta codes
#define MetaSequence        0x00
#define MetaText            0x01
#define MetaCopyright       0x02
#define MetaTrackName       0x03
#define MetaInstrumentName  0x04
#define MetaLyrics          0x05
#define MetaMarker          0x06
#define MetaCuePoint        0x07
#define MetaChannelPrefix   0x20
#define MetaChangePort      0x21
#define MetaEndOfTrack      0x2F
#define MetaSetTempo        0x51
#define MetaSMPTEOffset     0x54
#define MetaTimeSignature   0x58
#define MetaKeySignature    0x59
#define MetaSequencerSpecific  0x7F

//SAM2695 midi - use all of these for that chip
#define MIDI_CTRL 	   0xDDA0
#define MIDI_FIFO 	   0xDDA1
#define MIDI_RXD 	   0xDDA2
#define MIDI_RXD_COUNT 0xDDA3
#define MIDI_TXD       0xDDA4
#define MIDI_TXD_COUNT 0xDDA5

#include "f256lib.h"

//struct for holding info about the midi file itself, for info display purposes
typedef struct midiRecord {
	char *fileName;
	uint16_t format; //0: single track, 1: multitrack
	uint16_t trackcount;
	uint32_t tick; //ticks per beat (aka per quarter note). default of 48 can and will probably be replaced by reading a std midi file
	uint32_t fileSize; //number of bytes for the midi file
	uint8_t nn, dd, cc, bb; //nn numerator of time signature, dd= denom. cc=nb of midi clocks in metro click. bb = nb of 32nd notes in a beat defaults: nn=4 dd=2 cc=24 bb=8
	uint32_t totalDuration; //in units to be divded by 125000 and fudge to get seconds
	uint16_t totalSec;
	uint16_t currentSec;
	uint8_t  nbTempoChanges; //count of tempo changes to perform during playback
	uint8_t bpm;
	uint32_t baseAddr;
} midiRec, *midiRecPtr;

void resetInstruments(void); //
void midiShutAChannel(uint8_t); //sends 0xBn 0x7B 0x00: notes off to channel n
void midiShutAllChannels(void); //sends 0xBn 0x7B 0x00: notes off to all 16 channels
void midiShutUp(void); //acts like classic MIDI panic button
void prgChange(uint8_t, uint8_t); //pick channel n, program byte
void midiNoteOff(uint8_t, uint8_t, uint8_t); //pick channel n, note byte, velocity byte
void midiNoteOn(uint8_t, uint8_t, uint8_t); //pick channel n, note byte, velocity byte

void initMidiRecord(struct midiRecord *, uint32_t);

#endif // MUMIDI_H
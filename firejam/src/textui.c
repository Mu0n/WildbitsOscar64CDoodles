#include "f256lib.h"
#include "../src/textui.h"
#include "../src/muopl3.h"
#include "../src/muMidi.h"
#include "../src/musid.h"
#include "../src/muUtils.h"
#include "../src/mudispatch.h"

#define CHAR_EMPTY_CIRC 179
#define CHAR_FILLED_CIRC 180

//chip activity:little circle characters that are empty/filled depending on activity per chip at the top right
void layoutChipAct()
{
	
	textSetColor(textColorGreen,00);
	textGotoXY(60,3);textPrint("MIDI Sam ");textPutChar(CHAR_EMPTY_CIRC);
	textGotoXY(60,4);textPrint("MIDI  VS ");textPutChar(CHAR_EMPTY_CIRC);
	textGotoXY(60,5);textPrint("     SID ");textPutChar(CHAR_EMPTY_CIRC);
	textGotoXY(60,6);textPrint("     PSG ");textPutChar(CHAR_EMPTY_CIRC);
	textGotoXY(60,7);textPrint("  YMF262 ");textPutChar(CHAR_EMPTY_CIRC);
	
}

//update the chip activity circles depending on activity
void refreshChipAct(uint8_t *status)
{
	textGotoXY(69,3); if(status[0]>0) {textSetColor(textColorOrange,0); textPutChar(CHAR_FILLED_CIRC);} 
	else {textSetColor(textColorGreen,0); textPutChar(CHAR_EMPTY_CIRC);}
	textGotoXY(69,4); if(status[1]>0) {textSetColor(textColorOrange,0); textPutChar(CHAR_FILLED_CIRC);}
	else {textSetColor(textColorGreen,0); textPutChar(CHAR_EMPTY_CIRC);}
	textGotoXY(69,5); if(status[2]>0) {textSetColor(textColorOrange,0); textPutChar(CHAR_FILLED_CIRC);}
	else {textSetColor(textColorGreen,0); textPutChar(CHAR_EMPTY_CIRC);}
	textGotoXY(69,6); if(status[3]>0) {textSetColor(textColorOrange,0); textPutChar(CHAR_FILLED_CIRC);}
	else {textSetColor(textColorGreen,0); textPutChar(CHAR_EMPTY_CIRC);}
	textGotoXY(69,7); if(status[4]>0) {textSetColor(textColorOrange,0); textPutChar(CHAR_FILLED_CIRC);}
	else {textSetColor(textColorGreen,0); textPutChar(CHAR_EMPTY_CIRC);}
	
}


//This is part of the text instructions and interface during regular play mode
void refreshInstrumentText(aTrack *gT)
{
	textGotoXY(1,30);textPrint("                                       ");
	textGotoXY(1,31);textPrint("                                       ");
	textGotoXY(1,31);textPrint("                                       ");
	textGotoXY(0,30);textPrint(" ");
	textGotoXY(0,31);textPrint(" ");
	textGotoXY(0,32);textPrint(" ");
	
	switch(gT->chipChoice)
		{
		case 0: //MIDI
			textGotoXY(1,30); (gT->chSelect==0)?textSetColor(textColorOrange,0x00):textSetColor(textColorGreen,0x00);
			printf("%03d ",gT->prgInst[0]);
			textGotoXY(5,30); textPrint(midi_instruments[gT->prgInst[0]]);
			/*
			textGotoXY(1,31); (gT->chSelect==1)?textSetColor(textColorOrange,0x00):textSetColor(textColorGreen,0x00);
			printf("%03d ",gT->prgInst[1]);
			textGotoXY(9,31); textPrint(midi_instruments[gT->prgInst[1]]);
			textGotoXY(1,32); (gT->chSelect==9)?textSetColor(textColorOrange,0x00):textSetColor(textColorGreen,0x00);
			textPrint("Percussion");
			*/
			/*
			if(gT->isTwinLinked){
				textGotoXY(5,31);
				textSetColor(textColorOrange,0x00);
				printf("%03d ",gT->prgInst[1]);
				textGotoXY(9,31); textPrint(midi_instruments[gT->prgInst[1]]);
				}
			*/
			textSetColor(textColorOrange,0x00);
			switch(gT->chSelect)
				{
					case 0:
						textGotoXY(0,30);textPutChar(0xFA);
						textGotoXY(0,31);textPrint(" ");
						textGotoXY(0,32);textPrint(" ");
						break;
					case 1:
						textGotoXY(0,30);textPrint(" ");
						textGotoXY(0,31);textPutChar(0xFA);
						textGotoXY(0,32);textPrint(" ");
						break;
					case 9:
						textGotoXY(0,30);textPrint(" ");
						textGotoXY(0,31);textPrint(" ");
						textGotoXY(0,32);textPutChar(0xFA);
						break;
				}
				/*
			if(gT->isTwinLinked)
				{
						textGotoXY(0,30);textPutChar(0xFA);
						textGotoXY(0,31);textPutChar(0xFA);
						textGotoXY(0,32);textPrint(" ");
				}
				*/
			break;
		case 1: //SID
			textGotoXY(2,30);printf("%03d ",gT->sidInstChoice);
			textGotoXY(6,30); textPrint(sid_instruments_names[gT->sidInstChoice]);
			break;
		case 3: //OPL3
			textGotoXY(2,30);printf("%03d ",gT->opl3InstChoice);
			textGotoXY(6,30); textPrint(opl3_instrument_names[gT->opl3InstChoice]);
			break;
		}		
	

}

//This is part of the text instructions and interface during regular play mode
void channelTextMenu(aTrack *gT)
{
	textSetColor(textColorOrange,0x00);
	
	textGotoXY(1,29);textPrint("              ");
	textGotoXY(2,30);textPrint("                           ");
	textGotoXY(2,31);textPrint("                           ");
	textGotoXY(2,32);textPrint("                           ");
	textGotoXY(0,33);textPrint("                                ");
	textGotoXY(0,27);textPrint("                                  ");
			
	textGotoXY(0,25); //chip selection
	switch(gT->chipChoice)
	{
		case 0: //MIDI
			if(gT->wantVS1053) textPrint(" MIDI - using the VS1053b, unlimited polyphony              ");
			else  textPrint(" MIDI - using the SAM2695, unlimited polyphony         ");
			
			textSetColor(textColorGreen,0x00);
			textGotoXY(0,27);textPrint("[F3] to change your output channel");
			textGotoXY(1,29);textPrint("Instrument");
			//textGotoXY(2,30);textPrint("0: ");
			//textGotoXY(2,31);textPrint("1: ");
			//textGotoXY(2,32);textPrint("9: ");
			//textGotoXY(0,33);textPrint("[X] to twin link channels 0 & 1");
			
			//Instrument selection instructions
			textGotoXY(0,35);textPrint("[");textPutChar(0xF8);textPrint("] / ");
							 textPrint("[");textPutChar(0xFB);textPrint("] to change the instrument");
			textGotoXY(0,36);textPrint("[Shift-");textPutChar(0xF8);textPrint("] / [Shift-");
							 textPrint("[");textPutChar(0xFB);textPrint("] to move by 10 - [Alt-");
							 textPutChar(0xF8);textPrint("] / [Alt-");textPutChar(0xFB);textPrint("] go to the ends ");
	
			break;
		
		case 1: //SID
			textPrint(" Dual SID - Sound Interface Device, 6 channels polyphony                     ");
			
			textSetColor(textColorGreen,0x00);
			textGotoXY(1,29);textPrint("Wave type");
			
			//Instrument selection instructions
			textGotoXY(0,35);textPrint("[");textPutChar(0xF8);textPrint("] / ");
							 textPrint("[");textPutChar(0xFB);textPrint("] to change the instrument");
			textGotoXY(0,36);textPrint("[Shift-");textPutChar(0xF8);textPrint("] / [Shift-");
							 textPrint("[");textPutChar(0xFB);textPrint("] to move by 10 - [Alt-");
							 textPutChar(0xF8);textPrint("] / [Alt-");textPutChar(0xFB);textPrint("] go to the ends ");
			break;
		
		case 2: //PSG
		
			textPrint(" Dual PSG - Programmable Sound Generator, 6 channels polyphony               ");
			
			textSetColor(textColorGreen,0x00);
			
			//Instrument selection instructions
			textGotoXY(0,35);printf("                                    ");
			textGotoXY(0,36);printf("                                                                           ");
			break;
		
		case 3: //OPL3
			textPrint(" YMF262 - OPL3, 18 channels polyphony                                        ");
			
			textSetColor(textColorGreen,0x00);
			textGotoXY(1,29);textPrint("Instrument");
			//Instrument selection instructions
			textGotoXY(0,35);textPrint("[");textPutChar(0xF8);textPrint("] / ");
							 textPrint("[");textPutChar(0xFB);textPrint("] to change the instrument");
			textGotoXY(0,36);textPrint("[Shift-");textPutChar(0xF8);textPrint("] / [Shift-");
							 textPrint("[");textPutChar(0xFB);textPrint("] to move by 10 - [Alt-");
							 textPutChar(0xF8);textPrint("] / [Alt-");textPutChar(0xFB);textPrint("] go to the ends ");
			break;
		
	}
	refreshInstrumentText(gT);
	textSetColor(textColorGreen,0x00);
	textGotoXY(0,26);textPrint("[F1] to pick an instrument from a list");

}




//This is the part of the text instructions and interface for selecting the sound output of the keyboard
void chipSelectTextMenu(aTrack *gT)
{
	textSetColor(textColorGreen,0x00);
	textGotoXY(5,57);textPrint("C to Cycle chip choice: ");
	textSetColor(textColorGreen,0x00);
	textGotoXY(5,58);textPrint("M to toggle MIDI:");
	showChipChoiceText(gT);
}

void keybInstructionsRefresh()//Note play through spacebar instructions
{
	
	textGotoXY(0,40);textSetColor(textColorOrange,0x00);textPrint("[WLD] toggle the typing keyboard play mode");
	
	textGotoXY(0,43);
	if(gT.typeKeybPlay)
	{
	textPrint("[");textPutChar(0xF9);textPrint("] / [");textPutChar(0xFA);textPrint("] to move the accessible notes by typing keyboard");
	}
	else textPrint("                                                               ");
}

//This restores the full text instructions and interface during regular play mode
void textTitle()
{
	uint16_t c;
	//Text Title area
	
	textSetColor(textColorRed,0x00);textGotoXY(21,0);for(c=8;c>0;c--) textPutChar(0x15+c);
	textGotoXY(30,0);textSetColor(textColorWhite,0x00);textPrint("FireJam  v1.5 "); 
	textSetColor(textColorRed,0x00);textGotoXY(44,0);for(c=1;c<9;c++) textPutChar(0x15+c);
	textGotoXY(33,1);textSetColor(textColorWhite,0x00);textPrint("by Mu0n");
    textDefineForegroundColor(0,0xff,0xff,0xff);
	textSetColor(textColorBlue,0x00);
	textGotoXY(0,2); textPrint("Plug in a midi controller in the MIDI IN port and play!");
	channelTextMenu(&(tracks[0]));
	textSetColor(textColorBlue,0x00);

	keybInstructionsRefresh();

	/*
	textGotoXY(0,42);textPrint("[Shift-");textPutChar(0xF9);textPrint("] / [Shift-");
					 textPutChar(0xFA);textPrint("] to move an octave");
	
	textPrint(" - [Alt-");
					 textPutChar(0xF9);textPrint("] / [Alt-");textPutChar(0xFA);textPrint("] go to the ends ");
	*/
	
	//Chip status, midi chip choice status
	chipSelectTextMenu(&(tracks[0]));
	
	//Chip activity
	layoutChipAct();
}


void updateTempoText(uint8_t tempo)
{
	/*
	textSetColor(textColorGreen,0x00);
	textGotoXY(45,31);textPrint("Tempo BPM: ");textPrintInt(tempo);textPrint("  ");
	textGotoXY(45,32);textPrint("[: -1 ]: +1 Sh-[: -10  Sh-]: +10");
	*/
}

//This swaps the text of the midi chip choice
void showMIDIChoiceText(aTrack *gT)
{
	uint8_t firstColor = textColorOrange, secondColor= textColorGreen;
	
	if(gT->chipChoice > 0) firstColor = textColorGreen; //won't highlight any midi in orange
	else if(gT->wantVS1053)
	{
		firstColor = textColorGreen; //reverse colors, vs highlighted in orange, sam in green
		secondColor = textColorOrange;
	}
	textSetColor(firstColor,0x00);textGotoXY(29,57);
	if(gT->wantVS1053) textPrint(" MIDI sam2695  ");
	else textPrint("[MIDI sam2695] ");
	textSetColor(secondColor,0x00);textGotoXY(29,58);
	if(gT->wantVS1053) textPrint("[MIDI VS1053b] ");
	else textPrint(" MIDI VS1053b  ");	
}


//This swaps the text of the chip choice
void showChipChoiceText(aTrack *gT)
{
	switch(gT->chipChoice)
	{
		case 0: //midi
			showMIDIChoiceText(gT);
			textGotoXY(45,57);textSetColor(textColorGreen,0x00);textPrint("SID   PSG   OPL3 ");
			break;
		case 1: //SID
			showMIDIChoiceText(gT);
			textGotoXY(44,57);textSetColor(textColorOrange,0x00);textPrint("[SID] ");
			textGotoXY(50,57);textSetColor(textColorGreen,0x00);textPrint(" PSG   OPL3  ");
			break;
		case 2: //PSG
			showMIDIChoiceText(gT);
			textGotoXY(44,57);textSetColor(textColorGreen,0x00);textPrint(" SID  ");
			textGotoXY(50,57);textSetColor(textColorOrange,0x00);textPrint("[PSG] ");
			textGotoXY(56,57);textSetColor(textColorGreen,0x00);textPrint(" OPL3  ");
			break;
		case 3: //OPL3
			showMIDIChoiceText(gT);
			textGotoXY(44,57);textSetColor(textColorGreen,0x00);textPrint(" SID   PSG  ");
			textGotoXY(56,57);textSetColor(textColorOrange,0x00);textPrint("[OPL3]");
			break;
	}
}


//In this Instrument Picking mode called by hitting [F1], display all General MIDI instruments in 3 columns
//and highlight the currently activated one for the selected channel
//SID and OPL3 can also be shown, probably in 1 column at first
void instListShow(aTrack *gT)
{
	uint8_t i, y=1;
	if(gT->chipChoice==0){
	midiShutAChannel(0, gT->wantVS1053);
	midiShutAChannel(1, gT->wantVS1053);
	midiShutAChannel(9, gT->wantVS1053);
	}
	if(gT->chipChoice==1) shutAllSIDVoices();
	if(gT->chipChoice==3) opl3_quietAll();
	realTextClear();
	
	textSetColor(textColorOrange,0x00);
	if(gT->chipChoice==0) //MIDI
	{
		textGotoXY(0,0);textPrint("Select your instrument for channel ");textPrintInt(gT->chSelect);textPrint(". [Arrows] [Enter] [Space] [Back]");
		textSetColor(textColorWhite,0x00);
		for(i=0; i<sizeof(midi_instruments)/sizeof(midi_instruments[0]);i++)
		{
			textGotoXY(2,y);printf("%003d ",i);
			textGotoXY(6,y);textPrint(midi_instruments[i]);textPrint(" ");
			i++;
			textGotoXY(27,y);printf("%003d ",i);
			textGotoXY(31,y);textPrint(midi_instruments[i]);textPrint(" ");
			i++;if(i==sizeof(midi_instruments)/sizeof(midi_instruments[0])) break;
			textGotoXY(52,y);printf("%003d ",i);
			textGotoXY(56,y);textPrint(midi_instruments[i]);textPrint(" ");
			y++;
		}
	}
	if(gT->chipChoice==1) //SID
	{
		textGotoXY(0,0);textPrint("Select your instrument for SID. [Arrows] [Enter] [Space] [Back]");
		textSetColor(textColorWhite,0x00);
		for(i=0; i<sid_instrumentsSize;i++)
		{
			textGotoXY(2,1+y+i);printf("%003d ",i);
			textGotoXY(6,1+y+i);textPrint(sid_instruments_names[i]);textPrint(" ");

		}
	}
	if(gT->chipChoice==3) //OPL3
	{
		textGotoXY(0,0);textPrint("Select your instrument for OPL3. [Arrows] [Enter] [Space] [Back]");
		textSetColor(textColorWhite,0x00);
		for(i=0; i<opl3_instrumentsSize;i++)
		{
			textGotoXY(2,1+y+i);printf("%003d ",i);
			textGotoXY(6,1+y+i);textPrint(opl3_instrument_names[i]);textPrint(" ");

		}
	}
	highLightInstChoice(true, gT);
}

//This function highlights or de-highlights a choice in Instrument Picking mode
void highLightInstChoice(bool isNew, aTrack *gT)
{
	uint8_t x, y;
	isNew?textSetColor(textColorOrange,0):textSetColor(textColorWhite,0);
	
	if(gT->chipChoice==0) //MIDI
	{
		x= 2 + 25 * (gT->prgInst[gT->chSelect]%3);
		y= 1 + (gT->prgInst[gT->chSelect]/3);
		textGotoXY(x,y);printf("%003d ",gT->prgInst[gT->chSelect]);
		textGotoXY(x+4,y);textPrint(midi_instruments[gT->prgInst[gT->chSelect]]);
	}
	if(gT->chipChoice==1) //SID
	{
		x= 2;
		y= 2 + gT->sidInstChoice;
		textGotoXY(x,y);printf("%003d ",gT->sidInstChoice);
		textGotoXY(x+4,y);textPrint(sid_instruments_names[gT->sidInstChoice]);
	}
	if(gT->chipChoice==3) //OPL3
	{
		x= 2;
		y= 2 + gT->opl3InstChoice;
		textGotoXY(x,y);printf("%003d ",gT->opl3InstChoice);
		textGotoXY(x+4,y);textPrint(opl3_instrument_names[gT->opl3InstChoice]);
	}
}

//These four next functions are for moving around your selection in Instrument Picking mode
void modalMoveUp(aTrack *gT, bool shift)
{
	highLightInstChoice(false,gT);
	if(gT->chipChoice==0)gT->prgInst[gT->chSelect] -= (3 + shift*27);
	if(gT->chipChoice==1)gT->sidInstChoice--;
	if(gT->chipChoice==3)gT->opl3InstChoice--;
	highLightInstChoice(true,gT);
}
void modalMoveDown(aTrack *gT, bool shift)
{
	highLightInstChoice(false,gT);
	if(gT->chipChoice==0)gT->prgInst[gT->chSelect] += (3 + shift*27);
	if(gT->chipChoice==1)gT->sidInstChoice++;
	if(gT->chipChoice==3)gT->opl3InstChoice++;
	highLightInstChoice(true,gT);
}
void modalMoveLeft(aTrack *gT)
{
	highLightInstChoice(false,gT);
	if(gT->chipChoice==0)gT->prgInst[gT->chSelect] -= 1;
	highLightInstChoice(true,gT); 
}
void modalMoveRight(aTrack *gT)
{
	highLightInstChoice(false,gT);
	if(gT->chipChoice==0)gT->prgInst[gT->chSelect] += 1;
	highLightInstChoice(true,gT);
}
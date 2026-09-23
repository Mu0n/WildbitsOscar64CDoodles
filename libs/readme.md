# Mu0n's library files #

## Background standard MIDI file playback ##

This allows the playback of a type 0 or type 1, but not type 2 midi file, which you integrate somewhere as part as your game loop.

### Dependencies ###

This will use the SAM2695 onboard midi chip present in the Jr2 and K2. This will monopolize your timer0 during playback.

Just include muMidiPlay.c and the rest will follow.
```
[Your project] -> [muMidiPlay.c] --+--> [muMidiPlay.h]
                                   |
                                   +--> [muMidi.c] -> [muMidi.h]
                                   |
                                   +--> [muGen2Ram.c] -> [muGen2Ram.h]
                                   |
                                   +--> [muTimer0Int.c] -> [muTimer0Int.h]
```

### Typical Usage ###

1.a) keep your standard midi file external and at a known location which could include a path (i.e. `media/midi/yourfile.mid`), and load it into high memory using 
`loadSMFile("yourfile.mid", 0x50000)` 
where 0x50000 is a good address that gives you almost 196kb of space, more than enough than most MIDI files. Select anything else if needed, of course above 0x10000.

or

1.b) embed your MIDI file. 
With oscar64, use this at the top of your main source file:
```
#pragma section( midimus, 0)
#pragma region( midimus, 0x50000, 0x5FFFF, , , {midimus} )
#pragma data(midimus)
__export const char smf[] = {
	#embed "../assets/canyon.mid"
};
#pragma data(data)
```
With llvm-mos, use this at the top of your main source file:

`EMBED(canyon, "../assets/canyon.mid", 0x50000);`
 
2) During your setup, use this only once: `prepMIDIForPlay(0x50000); //change the addresss if needed`
3) During a loop pass, do this once per pass: `midiLoopPass();`
4) During a loop pass, do this to check if the midi playback has ended: `if(isMIDIDone()) { ... }`
5) Do this to "rewind" the midi file at its beginning and start the playback over: `rewindAndPlayMIDI();`
6) To load a new MIDI file and start playing that one, do steps 1a+2 to load from a .mid file or steps 1b+2 to get it from memory

## Background VGM file playback ##

This allows the playback of a vgm file that targets either the YM3812 (opl2 mode) or the YMF262 (opl3 mode), which you integrate somewhere as part as your game loop.

### Dependencies ###

This will use the real onboard YMF262 chip of the K, or the FPGA based YMF262 implementation of the Jr2 and the K2. Note: the Jr doesn't have it. This will monopolize your timer0 during playback.

Just include muVGMPlay.c and the rest will follow.
```
[Your project] -> [muVGMPlay.c] --+--> [muVGMPlay.h]
                                  |
                                  +--> [muOPL3.c] -> [muOPL3.h]
                                  |
                                  +--> [muGen2Ram.c] -> [muGen2Ram.h]
                                  |
                                  +--> [muTimer0Int.c] -> [muTimer0Int.h]
```

### Typical Usage ###

1.a) keep your vgm file external and at a known location which could include a path (i.e. `media/vgm/yourfile.vgm`), and load it into high memory using 
`loadVGMile("yourfile.vgm", 0x50000)` 
where 0x50000 is a good address that gives you almost 196kb of space, more than enough than most VGM files. Select anything else if needed, of course above 0x10000.

or

1.b) embed your VGM file. 
With oscar64, use this at the top of your main source file:
```
#pragma section( vgmmus, 0)
#pragma region( vgmmus, 0x50000, 0x5FFFF, , , {vgmmus} )
#pragma data(vgmmus)
__export const char vgmf[] = {
	#embed "../assets/doom.vgm"
};
#pragma data(data)
```
With llvm-mos, use this at the top of your main source file:

`EMBED(doom, "../assets/doom.vgm", 0x50000);`
 
2) During your setup, use this only once: `prepVGMForPlay(0x50000); //change the addresss if needed`
3) During a loop pass, do this once per pass: `VGMLoopPass();`
4) During a loop pass, do this to check if the VGM playback has ended: `if(isVGMDone()) { ... }`
5) Do this to "rewind" the VGM file at its beginning and start the playback over: `rewindAndPlayVGM();`
6) To load a new VGM file and start playing that one, do steps 1a+2 to load from a .vgm file or steps 1b+2 to get it from memory

## Background TR2 file playback ##

This allows the playback of a tr2 file that targets either the PSG, a format from Ernesto Contrera from his superbasic program tracker2.bas https://github.com/econtrerasd/Tracker2/releases

### Dependencies ###

This will use the FPGA based PSG chip of the K, Jr, K2 and Jr2. This will monopolize your timer0 during playback.

Just include muTr2Play.c and the rest will follow.
```
[Your project] -> [muTr2Play.c] --+--> [muTr2Play.h]
                                  |
                                  +--> [muPSG.c] -> [muPSG.h]
                                  |
                                  +--> [muGen2Ram.c] -> [muGen2Ram.h]
                                  |
                                  +--> [muTimer0Int.c] -> [muTimer0Int.h]
```

### Typical Usage ###

1.a) keep your tr2 file external and at a known location which could include a path (i.e. `media/tr2/yourfile.tr2`), and load it into high memory using 
`loadTR2ile("yourfile.tr2", 0x50000)` 
where 0x50000 is a good address that gives you almost 196kb of space, more than enough than most tr2 files which are all 16kb. Select anything else if needed, of course above 0x10000.

or

1.b) embed your tr2 file. 
With oscar64, use this at the top of your main source file:
```
#pragma section( tr2mus, 0)
#pragma region( tr2mus, 0x50000, 0x5FFFF, , , {tr2mus} )
#pragma data(tr2mus)
__export const char tr2f[] = {
	#embed "../assets/moonlight.tr2"
};
#pragma data(data)
```
With llvm-mos, use this at the top of your main source file:

`EMBED(moonlight, "../assets/moonlight.tr2", 0x50000);`
 
2) During your setup, use this only once: `prepTR2ForPlay(0x50000); //change the addresss if needed`
3) During a loop pass, do this once per pass: `TR2LoopPass();`
4) During a loop pass, do this to check if the tr2 playback has ended: `if(isTR2Done()) { ... }`
5) Do this to "rewind" the tr2 file at its beginning and start the playback over: `rewindAndPlayTR2();`
6) To load a new tr2 file and start playing that one, do steps 1a+2 to load from a .tr2 file or steps 1b+2 to get it from memory

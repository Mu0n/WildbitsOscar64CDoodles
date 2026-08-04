### Skeleton Game Project

Use this oscar64 project to get a running start on your own game. This provides:

* a bitmap background full screen image
* a sprite with 2 states (walk left, walk right) with 2 frames each
* a standard MIDI file playback in the background
* an opl3 .VGM file playback in the background
* keyboard input managed with the kernel
* timers based on frames, using the kernel

The embedded files are at these locations

* full bitmap of size 0x12C00 at address 0x6C000
* color look up table palette of size 0x400 at address 0x10000
* 32x32 sprite with 4 frames of size 0x1000 at address 0x14000
* .mid file of size 0x9000 at address 0x40000
* .vgm file of size 0x1702C at address 0x20000

The memory map looks like this - change to your liking!
<img width="648" height="607" alt="image" src="https://github.com/user-attachments/assets/bad9e967-cab7-4ed1-9df3-8128ab8b6146" />
<img width="302" height="259" alt="image" src="https://github.com/user-attachments/assets/d0eecb3c-247d-4386-9383-9b2829942c2f" />




This is the structure of included files:

```
[skelgame.c] --+--> [myBitmap.c] -> [myBitmap.h]
               |
               +--> [mySprites.c] -> [mySprites.h]
               |
               +--> [myTimers.c] -> [myTimers.h]
               |
               +--> [muMidiPlay.c] --+--> [muMidiPlay.h]
               |                     |
               |                     +--> [muMidi.c] -> [muMidi.h]
               |                     |
               |                     +--> [muGen2Ram.c] -> [muGen2Ram.h]
               |                     |
               |                     +--> [muTimer0Int.c] -> [muTimer0Int.h]
               |
               +--> [muVGMPlay.c] --+--> [muVGMPlay.h]
                                    |
                                    +--> [muOPL3.c] -> [muOPL3.h]
                                    |
                                    +--> [muGen2Ram.c] -> [muGen2Ram.h]
                                    |
                                    +--> [muTimer0Int.c] -> [muTimer0Int.h]
```

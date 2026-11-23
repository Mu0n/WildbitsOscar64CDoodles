#ifndef MYBITMAP_H
#define MYBITMAP_H

#define PAL_BASE    0x23000 //Palette location
#define BM_BASE     0x10000 //320x240 bitmap location
#define BM_BASE2    0x40000 //320x240 bitmap2 location for chip gfx during playback
#define BM_ROOM2    0x100000 //320x240 bitmap location for the 2nd room
#define BM_PSG    0x53000 //32x32 psg logo
#define BM_MID    0x54000 //32x32 mid logo
#define BM_SID    0x55000 //32x32 sid logo
#define BM_OPL    0x56000 //32x32 opl logo
#define BM_MP3    0x57000 //32x32 mp3 logo
#define BM_WOR    0x58000 //32x32 whiskers worried you're quitting
#define BM_LOGO_OFF  0x237A

enum {
LOGO_NIL,
LOGO_PSG,
LOGO_MID,
LOGO_SID,
LOGO_OPL,
LOGO_MP3,
LOGO_WHI	
};

void initMyBitmap(void);
void swapBMLogo(uint8_t);
void swapRoom(uint8_t);

#endif //MYBITMAP_H
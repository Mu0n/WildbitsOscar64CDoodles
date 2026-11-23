#ifndef TEXTAREAS_H
#define TEXTAREAS_H

#define SCR_HELP_X         9
#define SCR_HELP_Y         3
#define SCR_HELP_X_END     71
#define SCR_HELP_Y_END     17
#define SCR_CREDITS_X       9
#define SCR_CREDITS_Y       3
#define SCR_CREDITS_X_END   71
#define SCR_CREDITS_Y_END   6
#define SCR_SPLASH_X       19
#define SCR_SPLASH_X_END   61
#define SCR_SPLASH_Y       9
#define SCR_SPLASH_Y_END   17
#define TEXT_STATUS_Y 59

enum{
DLG_HELP,
DLG_CREDITS,
DLG_SPLASH
};


void waitForAnyKey(void);        //wait for keystroke and wipe text area
void writePlaying(const char *); //status bar update during playback start
void wipeStatusBar(void);        //status bar wipe to white background
void textSectionClear(uint8_t); //wipe a specific section using a unique endx identifier
void fillSpaceToEnd(uint8_t);   //add space character until reaching the X coord from this argument
void commonBoxTop(uint8_t, uint8_t, uint8_t);
void commonBoxBottom(uint8_t, uint8_t, uint8_t);
void showHelp(void);            //modal splash instructions box
void showCredits(void);
void showSplash(void);          //timed mini-instructions at the start
void textPrintNewLine(uint8_t);   //go back to next line, constrained by start x and y, can loop back from end y to start y


#endif //TEXTAREAS_H
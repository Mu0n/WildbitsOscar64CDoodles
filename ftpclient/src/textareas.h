#ifndef TEXTAREAS_H
#define TEXTAREAS_H

#define SCR_CLI_X          0
#define SCR_CLI_Y          44
#define SCR_CLI_X_END      79
#define SCR_CLI_Y_END      58
#define SCR_REMOTE_X       1  // top left corner
#define SCR_REMOTE_Y       2
#define SCR_REMOTE_X_END   39 // bot right corner
#define SCR_REMOTE_Y_END   41
#define SCR_REMOTE_X_DIR   (SCR_REMOTE_X + 12) //for remote directory name
#define SCR_LOCAL_X        40 // top left corner
#define SCR_LOCAL_Y        2
#define SCR_LOCAL_X_END    78 // bot right corner
#define SCR_LOCAL_Y_END    41
#define SCR_LOCAL_X_DIR    (SCR_LOCAL_X + 11) //for local directory name
#define SCR_HELP_X         2
#define SCR_HELP_Y         3
#define SCR_HELP_X_END     67
#define SCR_HELP_Y_END     25
#define SCR_STATUS_Y       59
#define SCR_STATUS_WIFI     6
#define SCR_STATUS_FTP     25

void forceFileHighlight(uint8_t,uint8_t, uint8_t, uint8_t);
void textSectionClear(uint8_t); //wipe a specific section using a unique endx identifier
void fillSpaceToEnd(uint8_t);

extern uint8_t cur_cli_y; // current line for the command line interface area
extern uint8_t cur_rem_y; // current line for the remote area
extern uint8_t cur_loc_y; // current line for the local area




#endif //TEXTAREAS_H
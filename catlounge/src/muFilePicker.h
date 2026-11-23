#ifndef MUFILEPICKER_H
#define MUFILEPICKER_H
#include "f256lib.h"
#include <string.h>
#include <stdbool.h>
#include <ctype.h>

#define MAX_FILES 200
#define MAX_FILENAME_LEN 120
#define MAX_PATH_LEN 60
#define MAX_FILE_EXTS 6
#define EXT_LEN 3
#define MAX_VISIBLE_FILES 20
#define RESERVED_ENTRY_INDEX 0
#define DIRECTORY_X 10
#define DIRECTORY_Y 2
#define FPR_BASE 0x60000
#define GUIDE_X 16
#define GUIDE_X_END 78
#define GUIDE_Y 30

#define FPR_tlX              0
#define FPR_tlY              1

#define FPR_currentPath      2
#define FPR_selectedFile     (FPR_currentPath + MAX_PATH_LEN)

#define FPR_fileList         (FPR_selectedFile + MAX_FILENAME_LEN)
#define FPR_fileListEntry(i) (FPR_fileList + ((i) * MAX_FILENAME_LEN))

#define FPR_isDirList        (FPR_fileList + (MAX_FILES * MAX_FILENAME_LEN))
#define FPR_isDir(i)         (FPR_isDirList + (i))

#define FPR_fileCount        (FPR_isDirList + MAX_FILES)
#define FPR_cursorIndex      (FPR_fileCount + 4)
#define FPR_visualIndex      (FPR_cursorIndex + 4)
#define FPR_scrollOffset     (FPR_visualIndex + 4)

#define FPR_fileExts         (FPR_scrollOffset + 4)
#define FPR_fileExt(i)       (FPR_fileExts + ((i) * 3))

#define FPR_TOTAL_SIZE       (FPR_fileExts + 12)

#define FPR_ADDR(off)   (FPR_BASE + (uint32_t)(off))


// Main picker record

static inline uint8_t fpr_get8(uint32_t);
static inline void fpr_set8(uint32_t, uint8_t);

enum{
EXT_MID,
EXT_RSN,
EXT_RSP,
EXT_VGM,
EXT_TR2,
EXT_MP3	
};

// Core API
uint8_t joystickPicking(void);

void fpr_set_currentPath(const char *);
void fpr_get_currentPath(char *);
void fpr_get_selectedFile(char *);

uint8_t pickFile_far(void);

void showFilesInDirectory(uint8_t, uint8_t);

uint8_t coloredByExtension(const char *);

uint8_t filePickModal_far(uint8_t, uint8_t,
                          const char *, const char *, const char *, const char *, const char *, const char *,
                          bool);
void reprepFPR_far(bool);
void initFilePickRecord_far(uint8_t, uint8_t, bool);

void initFPR(void);
uint8_t getTheFile_far(char *);
void backUpDirectory_far(void);
void readDirectory_far(bool);
bool isExtensionAllowed_far(const char *);
void sortFileList_far(void);
void displayFileList_far(int);
void wipeArea_far(bool);
void formatGuide(bool);

extern char FPName[];

#endif // MUFILEPICKER_H

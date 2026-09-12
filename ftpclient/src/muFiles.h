#ifndef MUFILES_H
#define MUFILES_H


#define MAX_REMOTE_FILES 24

typedef struct  {
		char name[24];
		uint32_t size;
		bool is_dir;
} RemoteFile;


extern RemoteFile remoteFiles[];

#endif //MUFILES_H
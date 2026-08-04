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

## Usage during runtime

WASD movement
1 to switch to MIDI playback (default)
2 to switch to OPL3 playback

## Compiling with oscar64

Run the following script inside WSL, in folder `...\f256lib-oscar64\doodles` like so: 

`./car.sh skelgame`

This assumes `...\f256lib-oscar64\doodles\skelgame\` contains the skelgame project files found in this repo.

Modify `/mnt/d/F256/oscar64/bin/oscar64` to where your oscar64 compiler is located

Modify `D:\\F256\\llvm-mos\\f256dev\\FoenixMgr\\FoenixMgr\\fnxmgr.py` to where the python FoenixMgr is located

Modify `D:\\F256\\f256lib-oscar64\\doodles\\` to where your oscar64 project folders are located.

```
#!/bin/bash

# --- 1. CONFIGURATION ---
OSCAR_BIN="/mnt/d/F256/oscar64/bin/oscar64"
# Use the Windows python launcher (it handles COM8 perfectly)
PYTHON_EXE="python.exe" 
# Use the Windows path for the script (escaped backslashes)
FOENIX_MGR="D:\\F256\\llvm-mos\\f256dev\\FoenixMgr\\FoenixMgr\\fnxmgr.py"

# --- 2. ARGUMENTS ---
PROJ_NAME="$1"
SRC_DIR="${PROJ_NAME}/src/"
SRC_FILE="${PROJ_NAME}/src/${PROJ_NAME}.c"
OUT_DIR="${PROJ_NAME}/"
BIN_FILE="${PROJ_NAME}.pgz"
FLAGS="-tm=f256k -n -i=../f256lib"
# --- 3. Gather all files in src/

mapfile -t CFILES < <(find "$SRC_DIR" -maxdepth 1 -type f -name "*.c")

# --- 4. COMPILE ---
echo "Compiling:"
printf '%s\n' "${CFILES[@]}"
echo
echo "Linking into ${OUT_DIR}/${PROJ_NAME}.pgz"
$OSCAR_BIN $FLAGS "${CFILES[@]}" -o="./$OUT_DIR/$PROJ_NAME.pgz"

# --- 5. TRANSFER ---
if [ $? -eq 0 ]; then
    echo "Transferring to F256K2 via Windows Python..."
    # We use the Windows path for the file we just built
    WIN_BIN_PATH="D:\\F256\\f256lib-oscar64\\doodles\\${PROJ_NAME}\\${BIN_FILE}"
    
    $PYTHON_EXE "$FOENIX_MGR" --port COM8 --run-pgz "$WIN_BIN_PATH"
else
    echo "Compilation failed."
    exit 1
fi
```


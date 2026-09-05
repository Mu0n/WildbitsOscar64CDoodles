#ifndef TEXTAREAS_C
#define TEXTAREAS_C

#include "f256lib.h"
#include "textareas.h"


uint8_t cur_cli_y = SCR_CLI_Y; // current line for the command line interface area
uint8_t cur_rem_y = SCR_REMOTE_Y; // current line for the remote area
uint8_t cur_loc_y = SCR_LOCAL_Y; // current line for the local area


void textSectionClear(uint8_t endX) //wipe a specific section using a unique endx identifier
{
	uint8_t iStart = 0, jStart = 0, iEnd = 0, jEnd = 0;
	uint8_t i, j;
	
	switch(endX) //update the current line for the section that's been tapped here; endx is a unique identifier
	{
	case SCR_CLI_X_END:
		iStart = SCR_CLI_X; iEnd = SCR_CLI_X_END;
		jStart = SCR_CLI_Y; jEnd = SCR_CLI_Y_END;
		cur_cli_y = SCR_CLI_Y;
		break;
	case SCR_REMOTE_X_END:
		iStart = SCR_REMOTE_X; iEnd = SCR_REMOTE_X_END;
		jStart = SCR_REMOTE_Y; jEnd = SCR_REMOTE_Y_END+2;
		cur_rem_y = SCR_REMOTE_Y;
		break;
	case SCR_LOCAL_X_END:
		iStart = SCR_LOCAL_X; iEnd = SCR_LOCAL_X_END;
		jStart = SCR_LOCAL_Y; jEnd = SCR_LOCAL_Y_END+2;
		cur_loc_y = SCR_LOCAL_Y;
		break;
	case SCR_HELP_X_END:
		iStart = SCR_HELP_X; iEnd = SCR_HELP_X_END;
		jStart = SCR_HELP_Y; jEnd = SCR_HELP_Y_END;
		break;
	}
	
	textGotoXY(iStart, jStart);
	for(j = jStart; j < jEnd; j++)
	{
		for(i = iStart; i < iEnd; i++)
		{
			textPrint(" ");
		}
		textGotoXY(iStart, j); //change line
	}
}


#endif //TEXTAREAS_C
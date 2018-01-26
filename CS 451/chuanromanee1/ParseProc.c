/*
 * Author: Tya Chuanromanee
 * Assignment Number: 1
 * CS-451, Fall 2017
 * Date of Submission: 10/17/2017
 * Name of this file: ParseProc.c
*/

#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <dirent.h>
#include <unistd.h>
#include <stdio.h>
#include <signal.h>
#include "declarations.h"

/*
 * Function Name: processFlags
 * Input to the method: The process number and status of all flags
 * Output (return value): none
 * Description: Processes flags and calls appropriate methods
*/
void processFlags(int processID, int tFlagSet, int sFlagSet, int vFlagSet, int cFlagSet) {
	char * procDir = "/proc"; // The proc directory
	 // Allocate variables to hold filepaths for stat, statm, and cmd files
	char statFile[50], statmFile[50], cmdFile[50];
	// Declare header string to display before the data (PID is always included)
	char headerString[50] = "PID"; 
	char dataString[200]; // String containing process data
	sprintf(dataString, "%d\t", processID); // Every data line has a process ID
	// Define filepaths
	sprintf(statFile, "/proc/%d/stat", processID);
	sprintf(statmFile, "/proc/%d/statm", processID);
	sprintf(cmdFile, "/proc/%d/cmdline", processID);
	sprintf(headerString, "PID\t"); // Every header line has the PID
	// Process and call each flag's methods
	if (sFlagSet) {
		strcat(headerString, "STATE\t"); // Update header
		processState(processID, statFile, dataString);
	}
	if (tFlagSet) {
		strcat(headerString, "TIME\t\t"); // Update header
		readTime(processID, statFile, &dataString);
	}
	if (vFlagSet) {
		strcat(headerString, "VIRTUAL MEM\t"); // Update header
		readVirtualMemory(processID, statmFile, &dataString);
	}
	if (cFlagSet) {
		strcat(headerString, "CMD\t"); // Update header
		readCmdLine(processID, cmdFile, &dataString);
	}
	// Display header string and data after processing is done
	printf("%s\n", headerString);
	printf("%s\n", dataString);
}

/*
 * Function Name: processState
 * Input to the method: Process number, file name to open, and string to write to
 * Output (return value): none
 * Description: Retrieves and processes state information for the given process ID
*/
void processState(int processID, char * fileName, char ** dataString) {
	int pidRead; // The process ID in the stat file
	char state[2]; // The State of the process
	FILE * statFile = fopen(fileName, "r"); // Open the statFile
	if (statFile != NULL) {
		fscanf(statFile, "%d", &pidRead); // Read process ID
		// Skip unneccessary entries and read the state
		fscanf(statFile, "%*s%s", state);
		strcat(state, "\t"); // Preparatory formatting
		strcat(dataString, state); // Add the state to the output data string
		fclose(statFile); // Close the stat file
	}
	else { // StatFile doesn't exist
		printf("Stat or process ID doesn't exist!");
	}
}

/*
 * Function Name: readCmdLine
 * Input to the method: Process number, file name to open, string to write to
 * Output (return value): none
 * Description: Retrieves command line information for the given process ID
*/
void readCmdLine(int processID, char * fileName, char ** dataString) {
	 // Open the file to read cmd information from
	FILE * cmdFile = fopen(fileName, "r");
	char cmdLine[150];	
	if (cmdFile != NULL) {
		fscanf(cmdFile, "%s\t", cmdLine); // Read cmdLine data
		strcat(dataString, cmdLine); // Append cmdLine to dataString
		fclose(cmdFile); // Close the cmd file
	}
	else { // CmdFile does not exist
		printf("CMD does not exist. Try checking again");
	}
}	

/*
 * Function Name: readTime
 * Input to the method: Process number, file name to open, and string to write to
 * Output (return value): none
 * Description: Read and process time information into a human-readable format
*/
void readTime(int processID, char * fileName, char **dataString) {
	// Open the file to read time information from
	FILE * statFile = fopen(fileName, "r"); 
	unsigned int utimeRead, stimeRead; // Time data read from stat file
	unsigned int totalTime; // total time in clock cycles
	int totalTimeSecs; // total time in seconds
	int ticksPerSec = sysconf(_SC_CLK_TCK); // clock cyles per second
	char formattedString[50]; // Formatted output time string
	if (statFile != NULL) { // If stat file exists
		// Skip all the entries and get utime
		fscanf(statFile, "%*d%*s%*s%*d%*d%*d%*d%*d%*u%*u%*u%*u%*u");
		fscanf(statFile, "%u", &utimeRead); // get utime
		fscanf(statFile, "%u", &stimeRead); // get stime
		totalTime = utimeRead + stimeRead; // Obtain total time
		totalTimeSecs = totalTime / ticksPerSec; // Obtain total time in seconds
		// Get hrs, mins, secs
		int hrs = totalTimeSecs / 3600;
		int mins = (totalTimeSecs / 60) % 60;
		int secs = totalTimeSecs % 60;
		// Write the formatted time to formatted string
		sprintf(formattedString,"%02d:%02d:%02d\t", hrs, mins, secs);
		strcat(dataString, formattedString); // Write formatted string to dataString
	}
	else { // Stat file does not exist
		printf("Stat file does not exist. Try checking again");
	}
	fclose(statFile); // Close the stat file
}


/*
 * Function Name: readVirtualMemory
 * Input to the method: Process number, file name to open, and string to write to
 * Output (return value): none
 * Description: Read and virtual memory from statm file
*/
void readVirtualMemory(int processID, char * fileName, char **dataString) {
	// Open the file to read virtual memory from
	FILE * statmFile = fopen(fileName, "r");
	int virtualMemUsed; // Memory used
	char vmUsedStr[50]; // Formatted string for outputting
	if (statmFile != NULL) { // If the statm file exists
		fscanf(statmFile, "%d", &virtualMemUsed); // Read the memory used
		 // Write the memory used to an output format
		sprintf(vmUsedStr, "%d\t", virtualMemUsed);
		strcat(dataString, vmUsedStr); // Add vmUsedStr to dataString
	}
	else { // Statm file does not exist
		printf("Statm file does not exist. Try checking again");
	}
	fclose(statmFile); // Close the statm file
}

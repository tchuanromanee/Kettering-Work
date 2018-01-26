/*
 * Author: Tya Chuanromanee
 * Assignment Number: 1
 * CS-451, Fall 2017
 * Date of Submission: 10/17/2017
 * Name of this file: 5ps.c
 * Description of the program: A PS program accepting up to 5 arguments
*/

#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <dirent.h>
#include <unistd.h>
#include <stdio.h>
#include <signal.h>
#include <errno.h>
#include "declarations.h"

/*
 * Function Name: main
 * Input to the method: Command line arguments
 * Output (return value): an int to indicate successful completion
 * Description: Processes command line arguments and calls parser
*/
int main(int argc, char **argv ) {
	char * procDir; // Process directory of the specifc process ID
	DIR *dirToRead; // Directory to read
	struct dirent *procDirStruct; // /proc direcotry that is opened
	const char *options = "stvcp:"; // Valid options
	int pFlagSet = 0; // Flag to determine whether -p command was set
	int tFlagSet = 0; // Flag to determine whether -t command was set
	int sFlagSet = 0; // Flag to determine whether -s command was set
	int vFlagSet = 0; // Flag to determine whether -v command was set
	int cFlagSet = 0; // Flag to determine whether -c command was set
	int processExists = 1; // By default, init process (1) exists
	int nextArg; // next argument to be read
	int processNumber = 1; // Default process is init
	while ((nextArg = getopt (argc, argv, options)) != -1) { // get arg
		switch(nextArg) { // Read flags
			case 'p':
				pFlagSet = 1;
				processNumber = atoi(optarg); // Parse process number
				break;
			case 't':	
				tFlagSet = 1;
				break;
			case 's':
				sFlagSet = 1;
				break;
			case 'v':
				vFlagSet = 1;
				break;
			case 'c':
				cFlagSet = 1;
				break;
			case '?': // Flag has no matching number
			default: 
				printf("An error happened here. Please check your arguments.");
				printf("\n");
				return -1;
		}
	}
	// Check if the process exists or not
	if (pFlagSet) { // Need only to do this with processes that are not 1
		// Set directory to open as this process' directory
		sprintf(procDir, "/proc/%d/", processNumber);
		// Try opening proc directory to read
		if ( opendir(procDir) == NULL) {
			perror("Process does not exist. Please try again.\n");
			processExists = 0;
		}
		else if ((procDirStruct = readdir(opendir(procDir))) == NULL) {
			perror("Process does not exist. Please try again.\n");
			processExists = 0;
		}
	}
	if (processExists) {
		processFlags(processNumber, tFlagSet, sFlagSet, vFlagSet, cFlagSet);
	}
	return 0;
}


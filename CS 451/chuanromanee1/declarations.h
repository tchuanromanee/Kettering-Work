/*
 * Author: Tya Chuanromanee
 * Assignment Number: 1
 * CS-451, Fall 2017
 * Date of Submission: 10/17/2017
 * Name of this file: declarations.h
*/

void readCmdLine(int processID, char * fileName, char **dataString);
void readTime(int processID, char * fileName, char **dataString);
void processState(int processID, char * fileName, char **dataString);
void processFlags(int processID, int tFlagSet, int sFlagSet, int vFlagSet, int cFlagSet);
void readVirtualMemory(int processID, char * fileName, char **dataString);

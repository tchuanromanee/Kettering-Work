5PS program
Written by Tya Chuanromanee
email: chua0563@kettering.edu

How to Run:
1. Unzip the folder "chuanromanee1"
2. Open a terminal and cd into the folder "chuanromanee1"
3. Compile the .c files into an executable by typing the following:
	$ gcc 5ps.c ParseProc.c declarations.h -o out
4. Run the program by typing "./out"
5. The following arguments are supported:
	-p followed by a process number will display the process information for that specific process number
	-s shows the state of the process
	-t shows the time of the process
	-c shows the command line that started the process
	-v shows the virtual memory used by the process


Limitations:
* The program will only support the five arguments, nothing more
* The -p flag must be followed by a process number, otherwise the program will warn the user and stop running
* If a process number that was specified does not exist, the program will warn the user and stop running

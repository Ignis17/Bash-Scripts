#!/bin/bash
# Author: Eva Cedent
# Co-Author: Joel Turbi
# Created: 03/26/2018
# Description: Shell script to compile C++ file(s)

# Set Bash to quit script and exit on errors.
set -e

menu()
{
	echo
	echo "  *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
	echo "  * Welcome to the C++ compiler & executable program  *"
	echo "  *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
	echo
}

# Lists the files in the current directory
directory()
{
	echo "*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*"
	echo
	ls -t
	echo 
	echo "*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*"
}

compile()
{
	menu
	directory
	echo
	echo " Please enter the name of the file you'd like to compile:"

	read name # Reads input from keyboard.
	fileName=${name%.*}.out #Reads file name from left to right up until the '.' 

	g++ -o $fileName $name # compiles file & creates execuatable object.

	echo " Your file $fileName has been created."
	echo
	echo " Would you like to compile your code (Y/N) ?"
	read answer # Reads input from keyboard.

	# Conditional statement - Does the user want to run / execute program.
	if [ "$answer" = "y" ] || [ "$answer" = "Y" ]; then
	echo "*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*"
	echo "         *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
	echo "         * Here is the output of $fileName *"
	echo "         *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
	echo
	./$fileName
	echo
	echo "*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*"
	else
		leave
	fi

}


clean()
{

	echo
	echo "*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
	echo "*  Removing files with the extension .out   *"
	echo "*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
	echo
	echo -ne '#####                     (33%)\r'
	sleep 1
	echo -ne '#############             (66%)\r'
	sleep 1
	echo -ne '#######################   (100%)\r'
	echo -ne '\n'
	rm -f *.out
	echo
	echo "*-*-*-*-*-*-*-*-*-*-*"
	echo "* File was removed. *"
	echo "*-*-*-*-*-*-*-*-*-*-*"

	exit
}

leave()
{
	echo
	echo "*-*-*-*-*-*-*-*-*-*-*-*-*"
	echo "*  Exiting compiler...  *"
	echo "*-*-*-*-*-*-*-*-*-*-*-*-*"
	echo
	echo -ne '#####                     (33%)\r'
	sleep 1
	echo -ne '#############             (66%)\r'
	sleep 1
	echo -ne '#######################   (100%)\r'
	echo -ne '\n'
	exit
}
if [ "$1" == "--clean" ]; then
	clean
	leave
fi


if [ -n "$1" ]; then
	echo "Invalid argument."
	exit 1
fi

compile

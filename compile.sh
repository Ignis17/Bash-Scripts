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
	echo "  ****************************************************"
	echo "  * Welcome to the C++ compiler & executable program *"
	echo "  ****************************************************"
	echo
}

# Lists the files in the current directory
directory()
{
	echo "________________________________________________________"
	echo " Files in $PWD :"
	echo

	for files in *;
	do
		echo $files
	done 
	echo "________________________________________________________"
}

compile()
{
	directory
	echo
	echo "Please enter the name of the file you'd like to compile:"

	read name # Reads input from keyboard.
	fileName=${name%.*}.out #Reads file name from left to right up until the '.' 

	g++ -o $fileName $name # compiles file & creates execuatable object.

	echo "Your file $fileName has been created."
	echo
	echo "Would you like to compile your code (Y/N) ?"
	read answer # Reads input from keyboard.

	# Conditional statement - Does the user want to run / execute program.
	if [ "$answer" = "y" ] || [ "$answer" = "Y" ]; then
	echo "_______________________________________________________"
	echo "         ***********************************"
	echo "         * Here is the output of $fileName *"
	echo "         ************************.o***********"
	./$fileName
	echo
	echo "_______________________________________________________"
	else
		leave
		exit
	fi
}

clean()
{
	echo ".out file has been deleted."
	rm -f *.out
}

leave()
{
	echo "Goodbye!, Until Next Time :)"
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
menu
compile

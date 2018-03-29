#!/bin/bash
# Author: Eva Cedent
# Co-Author: Joel Turbi
# Created: 03/26/2018
# Description: Shell script to compile C++ file(s)

echo "  ****************************************************"
echo "  * Welcome to the C++ compiler & executable program *"
echo "  ****************************************************"
echo
# Lists the files in the current directory
echo "________________________________________________________"
echo " Files in $PWD :"
echo
for files in $PWD'*';
do
	ls -a $files
	echo
done
echo "________________________________________________________"
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
	echo "         ***********************************"
	./$fileName
	echo
	echo "_______________________________________________________"
	#Performs a mild clean-up by deleting '.out' file based on users choice
	echo "Would you like to remove the $fileName (Y/N) ?"
	read input

	if [ "$input" = "y" ] || [ " $input " = "Y" ]; then
		rm -f $fileName
	elif [ "$input" = "n" ] || [ "$input" = "N" ]; then
		echo "Goodbye!, Until Next Time :)"
		exit
	fi
elif [ "$answer" = "n" ] || [ "$answer" = "N" ]; then
	echo "Goodbye!, Until Next Time :)"
	exit
fi

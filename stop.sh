#!/bin/bash

# This script allows the user to kill background processes by using systemclt tool.
# The use can choose to kill the predetermined processes or simply enter the name
# of the process desired to stop.

# Choice menu.
menu(){
	echo "	Make a selection: "
	echo
	echo "- 1) Kill/stop predetermined processes(E.g. Apache2,Cassandra, Mongodb, MySQL)."
	echo "- 2) Enter name of process you'd like to kill/stop."
	echo "- 3) Exit."
	echo
}

# function to perform user's selection
stop(){
	menu
	read -p 	"Selection #: " var
	case $var in
		1)
		/etc/init.d/apache2 stop;
		/etc/init.d/cassandra stop;
		/etc/init.d/mongodb stop;
		/etc/init.d/mysql stop;;
		2) read -p "Enter name of process: " choice; /etc/init.d/"$choice" stop;;
		3) echo "Done"; exit 0;;
		*) echo "Invalid selection. Try again!"; exit 1;;
	esac
}

# Function calls: 
stop

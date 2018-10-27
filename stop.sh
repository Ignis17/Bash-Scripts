#!/bin/bash

# This script allows the user to kill background processes by using systemclt tool.
# The use can choose to kill the predetermined processes or simply enter the name
# of the process desired to stop.

# Choice menu.
menu(){
	echo "	Make a selection: "
	echo
	echo "	- 1) Kill/stop predetermined processes(E.g. Apache2,Cassandra, Mongodb, MySQL)."
	echo "	- 2) Stop predetermined processes(E.g. Apache2, Cassandra, Mongodb, MySQL), from auto-starting."
	echo "	- 3) Re-enable predetermined processes to auto-start at boot-up."
	echo "	- 4) Enter name of process you'd like to kill/stop."
	echo "	- 5) Exit."
	echo
}

auto-enable(){
	echo "Starting..."
	sudo systemctl enable cassandra
	sudo systemctl start cassandra
	sudo systemctl enable apache2
	sudo systemctl start apache2
	sudo systemctl enable mongodb
	sudo systemctl start mongodb
	sudo systemctl enable mysql
	sudo systemctl start mysql
	echo "Done."
}

auto-disable(){
	echo "Starting..."
	sudo systemctl stop cassandra
	sudo systemctl disable cassandra
	sudo systemctl stop apache2
	sudo systemctl disable apache2
	sudo systemctl stop mongodb
	sudo systemctl disable mongodb
	sudo systemctl stop mysql
	sudo systemctl disable mysql
	echo "Done."
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
		2) auto-disable;;
		3) auto-enable ;;
		4) read -p "Enter name of process: " choice; /etc/init.d/"$choice" stop;;
		5) echo "Done"; exit 0;;
		*) echo "Invalid selection. Try again!"; exit 1;;
	esac
}

# Function calls:
stop

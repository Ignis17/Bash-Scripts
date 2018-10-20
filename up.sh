#!/bin/bash
# Author: Joel Turbi
# Created: 03/25/2018
# Update & upgrade linux environment
# Ported from Joe Collins www.ezeelinux.com (GNU/General Public License version 2.0)

# Set BASH to quit script and exit on errors:

set -e

# Functions:

bar()
{
	BAR='!@#$%^'
	# this is full bar, mine is 6 chars
	for i in {1..6}; do
	       	echo -ne "\r${BAR:0:$i}" # print $i chars of $BAR from 0 position
		sleep .1
		echo
	done
	for i in {6..1}; do
		echo -ne "\r${BAR:0:$i}"
		sleep .1
		echo
	done
}

update()
{
	echo
	echo "*-*-*-*-*-*-*-*-*-*-*-*"
	echo "* Looking for updates *"
	echo "*-*-*-*-*-*-*-*-*-*-*-*"
        echo
	sudo apt-get update -qq
	sudo apt-get dist-upgrade -yqq
}

clean()
{
	echo
	echo "*-*-*-*-*-*-*-*-*-*-*-*-*"
	echo "*     Cleaning up...    *"
	echo "*-*-*-*-*-*-*-*-*-*-*-*-*"
	echo
	sudo apt-get autoremove -yqq
	sudo apt-get autoclean -yqq
	bar
	echo
	echo "*-*-*-*-*-*-*-*-*-*-*-*-*"
	echo "*  Clean up completed!  *"
	echo "*-*-*-*-*-*-*-*-*-*-*-*-*"
	echo
}

leave()
{
	echo
	echo "*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
	echo "* System updates completed! *"
	echo "*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
	echo
	exit
}

up-help()
{

	cat << _EOF__

	*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*
	* 										*
	*  Commands:									*
	*										*
	* 1) up = full system update.							*
	* - Running "up" with no options will update the apt cache and then perform a   *
	*   full distribution update automatically.					*
	*										*
	* 2) up -c = Perform system cleanup.			                	*
	* - Adding the "-c" option will invoke the apt commands to search for and       *
	*   remove locally cached packages that are no longer in the repositories and   *
	*   remove orphaned packages that are no longer needed by programs.		*
	*										*
	* 3) up -h = shows this help page.						*
	*										*
	*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*

_EOF__

}

# Execution.

# Displays this message once executed
menu()
{
	echo
	echo "*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*"
	echo "|                                                                                               |"
	echo "*       This tool automates the update process for Debian & Ubuntu based Linux systems.         *"
	echo "|_______________________________________________________________________________________________|"
	echo "*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*"
	echo
}

# Update and clean:

if [ "$1" == "-c" ]; then
	sudo echo
	menu
	clean
	echo
	exit
fi

if [ "$1" == "-h" ]; then
	up-help
	exit
fi

# Check for invalid argument

if  [ -n "$1"  ]; then
	echo "Up Error: Invalid argument. Try 'up -h' for more info." >&2
	exit 1
fi

sudo echo
menu
update
bar
leave

#!/bin/bash
# Author: Joel Turbi
# Created: 03/25/2018 
# Update & upgrade linux environment 
# Ported from Joe Collins www.ezeelinux.com (GNU/General Public License version 2.0)

# Set BASH to quit script and exit on errors:

set -e

# Functions:

update()
{
	echo
	echo "*-*-*-*-*-*-*-*-*-*-*-*"
	echo "*                     *"
	echo "* Looking for updates *"
	echo "*                     *"
	echo "*-*-*-*-*-*-*-*-*-*-*-*"
	echo

	sudo apt-get update
	sudo apt-get dist-upgrade -yy
}

clean()
{
	echo
	echo "*-*-*-*-*-*-*-*"
	echo "*             *"
	echo "* Cleaning up *"
	echo "*             *"
	echo "*-*-*-*-*-*-*-*"
	echo

	sudo apt-get autoremove -yy
	sudo apt-get autoclean
	
	echo
	echo "*-*-*-*-*-*-*-*-*-*-*-*-*"
	echo "*                       *"
	echo "*  Clean up completed!  *"
	echo "*                       *"
	echo "*-*-*-*-*-*-*-*-*-*-*-*-*"
	echo
}

leave()
{
	echo
	echo "*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
	echo "*                           *"
	echo "* System updates completed! *"
	echo "*                           *"
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
	* 2) up --clean = full system update with cleanup.				*
	* - Adding the "--clean" option will invoke the apt commands to search for and  *
	*   remove locally cached packages that are no longer in the repositories and   *
	*   remove orphaned packages that are no longer needed by programs.		*
	*										*
	* 3) up --help = shows this help page.						*
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

if [ "$1" == "--clean" ]; then
	menu
	clean
	exit
fi

if [ "$1" == "--help" ]; then
	up-help
	exit
fi

# Check for invalid argument

if  [ -n "$1"  ]; then
	echo "Up Error: Invalid argument. Try 'up --help' for more info." >&2
	exit 1
fi

menu
update
leave

#!/bin/bash
# Author: Joel Turbi
# Created: 03/25/2018 
# Update & upgrade linux environment

# Set BASH to quit script and exit on errors:

set -e

# Functions:

update() {

echo "*************************"
echo "** Looking for updates **"
echo "*************************"
sudo apt-get update
sudo apt-get dist-upgrade -yy

}

clean() {

echo "*****************"
echo "** Cleaning up **"
echo "*****************"
sudo apt-get autoremove -yy
sudo apt-get autoclean

}

leave() {

echo "*******************************"
echo "** System updates completed! **"
echo "*******************************"
exit

}

up-help() {

cat << _EOF_
 Up is a tool that automates the update procedure for Debian and Ubuntu based
 Linux systems.
 Commands:
    up = full system update.
    Running "up" with no options will update the apt cache and then perform a
    full distribution update automatically.
    up --clean = full system update with cleanup.
    Adding the "--clean" option will invoke the apt commands to search for and
    remove locally cached packages that are no longer in the repositories and
    remove orphaned packages that are no longer needed by programs.
    up --help = shows this help page.
_EOF_

}

# Execution.

# Displays this message once executed
echo "_________________________________________________________________________________________________"
echo "* This is a tool that automates the update procedure for Debian and Ubuntu based Linux systems. *"
echo "_________________________________________________________________________________________________"

# Update and clean:

if [ "$1" == "--clean" ]; then
    update
    clean
    leave
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

update
leave

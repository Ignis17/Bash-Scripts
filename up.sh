#!/bin/bash
# Author: Joel Turbi
# Created: 03/25/2018 
# Update & upgrade linux environment

echo "*************************"
echo "** Looking for updates **"
echo "*************************"
echo "Checking for permissions:"
sudo ls >/dev/null  # Before a command is executed, its input and output may be
                    # redirected using a special notation interpreted by the shell.
sudo apt update
sudo apt dist-upgrade -yqq
sudo apt-get autoremove -yqq
sudo apt-get autoclean -qq
echo "*******************************"
echo "** System updates completed! **"
echo "*******************************"

#!/bin/bash
# Author: Joel Turbi
# Created: 10/17/2018
# Description: This script automates the stages of git:
# 	Untracked: the file exists, but is not part of git's version control.
#	Staged: the file has been added to git's version control but changes have not been committed.
# 	Committed: the change has been committed

# Function to automate github staging process:

push(){
	echo "Enter message to be committed:"
	read msg
	git add .
	git commit -a -m "$msg"
	git push -u origin master
	echo
	echo "****************************************"
	echo "* Changes have been uploaded to GitHub *"
	echo "****************************************"
}

menu(){
	echo
	echo "*********************************************************************"
	echo "* This script automates the process of submitting changes to github *"
	echo "*********************************************************************"
	echo
}

# Function calls: 
menu
push



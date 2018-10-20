#!/bin/bash
# Author: Joel Turbi
# Created: 10/17/2018
# Description: This script automates the stages of git:
# 	Untracked: the file exists, but is not part of git's version control.
#	Staged: the file has been added to git's version control but changes have not been committed.
# 	Committed: the change has been committed

# Set Bash to quit script and exit on errors:
set -e

# Function to automate github staging process:
# Stages all files by adding them and committing them to Github
push(){
	push_s
	echo
	echo "E.g. to add everything to the staging area, enter "\"."\" or name of the file."
	echo
	echo "Enter name of file to commit:"
	read file
	echo "Enter message to be committed:"
	read msg
	git add "$file"
	git commit -a -m "$msg"
	git push -u origin master
	echo
	echo "*======================================*"
	echo "| Changes have been uploaded to GitHub |"
	echo "*======================================*"
}

# Displays this message when script is run for the first time.
menu(){
	echo
	echo "*====================================================================*"
	echo "| This script automates the process of submitting changes to github  |"
	echo "*====================================================================*"
	echo
	echo "1) Check for recent changes made in local repository."
	echo "2) Start staging and commit process."
	echo "3) Pull recent changes from remote repository."
	echo "4) Exit."
	read -p "Enter your choice: " reply
	case $reply in
		"1")
			push_s ;;
		"2")
			push ;;
		"3")
			pull ;;
		"4")
			echo "Goodbye!"
			exit 0;;
		*) echo "Invalid choice"; exit 1;;
	esac
}

# Checks for changes made to current repository:
push_s(){
	echo "*============================*"
	echo "| Checking for local changes |"
	echo "*============================*"
	echo
	git status
	echo
	echo "*===========================*"
	echo "| Done checking for changes |"
	echo "*===========================*"
}	

pull(){
	echo "*=============================*"
	echo "| Checking for recent changes |"
	echo "*=============================*"
	echo
	git pull
	echo 
	echo "*==================================*"
	echo "| Done checking for recent changes |"
	echo "*==================================*"
}

# Function calls:
menu

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
	read -p "Enter name of file to commit:" file
	read -p "Enter message to be committed:" msg
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
	echo "4) Push commited changes to remote repository."
	echo "5) Github configuration set up."
	echo "6) Clone a repository by url."
	echo "7) Exit."
	read -p "Enter your choice: " reply
	case $reply in
		"1")
			push_s;
			exit 0;;
		"2")
			push;
			exit 0;;
		"3")
			pull;
			exit 0;;
		"4")
			git push;
			exit 0;;
		"5")
			config;
			exit 0;;
		"6")
			read -p "Paste url here: " url;
			git clone "$url";
		       	exit 0;;
	
		"7")
			echo "Goodbye!";
			exit 0 ;;
		*) echo "Invalid choice"; exit 1 ;;
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

# Configures Github Enviroment to user's info.

config(){
	echo
	echo "*=======================================*"	
	echo "| Welcome to Github Configuration Setup |"
	echo "*=======================================*"
	echo
	read -p "Enter Username: " user
	echo 
	read -p "Enter Email address: " email
	echo
	git config --global user.name "$user"
	git config --global user.email "$email"
	echo "*========================*"
	echo "| Changes have been made |"
	echo "*========================*"
}

# Function calls:
menu

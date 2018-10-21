#!/bin/bash
# Author: Joel Turbi
# Created: 10/17/2018
# Description: This script automates the stages of git:
# 	Untracked: the file exists, but is not part of git's version control.
#	Staged: the file has been added to git's version control but changes have not been committed.
# 	Committed: the change has been committed


# Function to automate github staging process:
# Stages all files by adding them and committing them to Github
push(){
	echo
	echo "E.g. to add everything to the staging area, enter "\"."\" or name of the file."
	echo
	read -p "Enter name of file to commit: " file
	read -p "Enter message to be committed: " msg
	git add "$file"
	git commit -a -m "$msg"
	git push -u origin master
	echo
	echo "| Changes have been uploaded to GitHub |"
}

# Displays this message when script is run for the first time.
menu(){
	while [[ $reply != 7 ]]; do
		clear
		echo "*====================================================================*"
		echo "| This script automates the process of submitting changes to github  |"
		echo "*====================================================================*"
		echo
		echo "
		| Enter selection |

		1) Check for recent changes in local repository.
		2) Stage & commit changes from local repository.
		3) Pull recent changes from remote repository.
		4) Push commited changes to remote repository.
		5) Github configuration setup.
		6) Clone a repository by url.
		7) Exit.
		"
		read -p "Selection #: " reply
		if [ $reply == 1 ]; then
			push_s
			sleep 2
		elif [ $reply == 2 ]; then
			push
			sleep 2

		elif [ $reply == 3 ]; then
			pull;
			sleep 2

		elif [ $reply == 4 ]; then
			git push
			sleep 2

		elif [ $reply == 5 ]; then
			config
			sleep 2

		elif [ $reply == 6 ]; then
			echo
			read -p "Paste url here: " url
			git clone "$url"
		  sleep 2
		elif [ $reply == 7 ]; then
			echo
			echo "Program terminated. Goodbye! :)"
			exit 0
		else
			echo "Invalid selection."
			echo "Try again."
			sleep 1
		fi
	done
}

# Checks for changes made to current repository:
push_s(){
	echo
	echo "| Checking for local changes |"
	echo
	git status
	echo
	echo "| Done checking for changes |"
}

pull(){
	echo "| Checking for recent changes |"
	echo
	git pull
	echo
	echo "| Done checking for recent changes |"
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
	echo "| Changes have been made |"
}

# Function calls:
menu

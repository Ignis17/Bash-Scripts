#!/bin/bash

# Function to automate github staging process:

push(){
	echo "Enter message to be committed:"
	read msg
	git add .
	git commit -a -m "$msg"
	git push -u origin master
	echo "Changes have been uploaded to *GitHub*"
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



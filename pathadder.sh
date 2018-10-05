#!/bin/bash

# Author: Joel Turbi
# Created: 10/1/2018
# This bash script creates a bin folder/directory under user's home directory & appends such location to PATH enviromental variable.

# Creates bin folder under user's directory
mkdir $HOME/bin
# Add bin folder to Enviromental PATH variable
echo "export PATH='\$PATH:~/bin'" >> $HOME/.bashrc && echo "Done!"

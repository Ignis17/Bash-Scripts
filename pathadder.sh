#!/bin/bash

# Creates bin folder under user's directory
mkdir $HOME/bin
# Add bin folder to Enviromental PATH variable
echo "export PATH='\$PATH:~/bin'" >> $HOME/.bashrc && echo "Done!"

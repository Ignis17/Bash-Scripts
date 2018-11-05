#!/bin/bash

# Author: Joel Turbi
# Created: 10/1/2018
# This bash script creates a bin folder under user's home directory & appends the location to PATH enviromental variable.

create(){
  # Creates bin folder under user's directory
  mkdir $HOME/bin
  # Add bin folder to Enviromental PATH variable
  echo "export PATH=\"\$PATH:~/bin\"" >> $HOME/.bashrc && echo "Done!"
}

undo(){
  # Searches for string in given file and deletes the line.
  rm -rf $HOME/bin
  sed -i "/export PATH=\"\$PATH:\$HOME\/bin\"/d" $HOME/.bashrc && echo "Done!"
}

menu(){
  while [[ $reply != 3 ]]; do
    clear
    echo "  Welcome to Pathadder  "
    echo "
    | Enter selection |

    1) Create local bin folder under home directory and add it to PATH enviroment variable.
    2) Undo changes made to PATH variable and bin directory.
    3) Exit.

    "
    read -p "Selection #: " reply
    if [ $reply == 1 ]; then
      create
      sleep 2
    elif [ $reply == 2 ]; then
      undo
      sleep 2
    elif [ $reply == 3 ]; then
      echo "Shutting down..."
      exit 0
    else
      echo "Invalid selection."
      echo "Try again"
      sleep 1
    fi
  done
}
menu

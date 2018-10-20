# Author: Joel Turbi
# Created: 09/13/18
# Simple password generator
#!/bin/bash


echo "** This is a simple password generator **"
echo "Please enter the lenght of the password:"
read PASS_LENGTH

for p in $(seq 1 10);
do
	openssl rand -base64 48 | cut -c1-$PASS_LENGTH
done

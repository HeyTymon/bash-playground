#!/usr/bin/env bash

counter=0
giveup=0

if [[ ! -d ./files/images ]] ; then mkdir ./files/images ; fi

while [[ giveup -le 10 ]] ; do

link='https://downloads.codingcoursestv.eu/055%20-%20bash/while/images/image-'"${counter}.jpg"

curl --fail -o ./files/images/image-"${counter}.jpg" "${link}"

 if [[ $(echo $?) != 0 ]] ; then
	echo "Download failed"
	giveup=$((giveup + 1))
 else
	echo "Download succesfull"
 fi

counter=$((counter + 1))

done




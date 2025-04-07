#!/bin/bash

function info(){
	echo "Zero argument were passed to script"
	exit
}

function fileExisit() {

local file=$1

if [[ -e "$file" ]]
then
	echo "File $file does exist"
else
	echo "File $file does NOT exist"
fi
}

[[ $# -eq 0 ]] && info

for i in "$@"
do
	fileExisit $i
done

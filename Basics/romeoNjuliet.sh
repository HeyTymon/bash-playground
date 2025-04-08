#!/usr/bin/env bash

if [[ ! -e "./files/romeo.txt" ]] ; then
	wget -P ./files 'https://downloads.codingcoursestv.eu/055%20-%20bash/if/romeo.txt'
	if [[ $? -eq 0 ]] ; then echo "Download completed" ; else echo "Down failed" >&2 ; exit 1; fi
fi

echo "$(grep 'love' ./files/romeo.txt | wc -l) that many lines contains word 'love'" ; exit 0



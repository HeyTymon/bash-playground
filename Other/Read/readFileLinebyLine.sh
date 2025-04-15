#!/usr/bin/env bash

echo -e "one \n two \n three \n four \n five" > ./tmp.txt

while IFS= read -r line; do
	echo "${line}"
done < ./tmp.txt

rm ./tmp.txt

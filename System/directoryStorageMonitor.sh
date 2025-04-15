#!/usr/bin/env bash

declare -a paths=()

while read -r line ; do
 paths+=("${line}")
done < "$1"

for d in "${paths[@]}" ; do
 read -r size rest < <(du -sm "${d}")
 echo "${size} : $d"
done


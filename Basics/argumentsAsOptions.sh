#!/usr/bin/env bash

var=0
p=1

echo $#

while getopts 'qwhp' opt 2>/dev/null; do
 case "${opt}" in
  h) echo "Help menu..." ; exit 2 ;;
  q) var=$((var + 1)) ;;
  w) var=$((var + 2)) ;;
  p) p=0 ;;
  ?) echo "Ivalid argument" ;;
 esac
done

if (( p == 0 )) ; then
 case "${var}" in
  0) echo "q and w arguments were not passed into the script" ;;
  1) echo "q argument was passed into the script" ;;
  2) echo "w argument was passed into the script" ;;
  3) echo "q and w arguments were passed into the script" ;;
 esac
fi

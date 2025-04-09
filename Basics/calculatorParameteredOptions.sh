#!/usr/bin/env bash

file=""
operation=""
print=1
declare -i var1
declare -i var2

while getopts 'f:o:p' opt ; do
 case "${opt}" in
  f) file="${OPTARG}" ;;
  o) operation="${OPTARG}" ;;
  p) print=0 ;;
  ?) echo "Invalid argument" ; exit 2 ;;
 esac
done

shift $((5 - print))

if [[ -n "$1" ]] ; then
 var1="$1"
else
 var1=1
fi

if [[ -n "$2" ]] ; then
 var2="$2"
else
 var2=1
fi

case "${operation}" in
 "+") echo "scale=2; $var1 + $var2" | bc >> "${file}" ;;
 "-") echo "scale=2; $var1 - $var2" | bc >> "${file}" ;;
 "*") echo "scale=2; $var1 * $var2" | bc >> "${file}" ;;
 "/") if [[ "${var2}" -eq 0 ]] ; then
       echo "Division by 0" ; exit 3
      else
       echo "scale=2; $var1 / $var2" | bc >> "${file}" 
      fi ;;
 "^") echo "scale=2; $var1 ^ $var2" | bc >> "${file}" ;;
 *) echo "Invalid operation" ; exit 3 ;;
esac

if [[ "${print}" -eq 0 ]] ; then
 echo "Last 5 results:"
 tail -n 5 "${file}" 
fi

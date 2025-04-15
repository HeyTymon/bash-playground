#!/usr/bin/env bash

file=""
operation=""
print=1
declare -i var1
declare -i var2
help='-f provide file path'"\n"'-o provide mathematical operation +,-,*,/,^'"\n"'-p prints last 5 results'"\n"'two next arguments are numbers - by default are 1 and 1' 

while getopts 'f:o:ph' opt ; do
 case "${opt}" in
  f) file="${OPTARG}" ;;
  o) operation="${OPTARG}" ;;
  p) print=0 ;;
  h) echo -e "${help}" ; exit 0 ;;
  ?) echo "Invalid argument" ; exit 1 ;;
 esac
done

shift $((5 - print))

var1=${1:-1}
var2=${2:-1}

case "${operation}" in
 "+"|"-"|"*"|"^") echo "scale=2; $var1 $operation $var2" | bc >> "${file}" ;;
 "/") if [[ "${var2}" -eq 0 ]] ; then
       echo "Division by 0" ; exit 2
      else
       echo "scale=2; $var1 / $var2" | bc >> "${file}" 
      fi ;;
 *) echo "Invalid operation" ; exit 1 ;;
esac

if [[ "${print}" -eq 0 ]] ; then
 echo "Last 5 results:"
 tail -n 5 "${file}" 
fi

#!/usr/bin/env bash

character() {
 min=0
 max=256
 case $1 in
  0)min=97 ; max=122 ;;
  1)min=65 ; max=90 ;;
  2)min=48 ; max=57 ;;
  3)min=32 ; max=47 ;;
 esac

 number=$(( min + RANDOM % (max - min + 1)))
 echo -n "$(printf "\\$(printf '%03o' "$number")")"
}

generate() {
 for c in $(seq 0 "$1") ; do
  password+=$(character $(( RANDOM % "$2" )))
 done
}

file=1
chars=10
groups=4
declare -a password=()

while getopts 'cgf' opt 2>/dev/null
do
 case "${opt}" in
  c) chars="${OPTARG}"
     if [[ "${chars}" -lt 1 ]] ; then  echo "Invalid argument" ; chars=10 ; fi ;;
  g) groups="${OPTARG}"
     if [[ "${groups}" -lt 0 || "${groups}" -gt 3 ]] ; then echo "Invalid argument" ; groups=4; fi ;;
  f) file=0 ;;
  *) echo "Invalid argument"; exit 1 ;;
 esac
done

generate "${chars}" "${groups}"

if [[ "${file}" -eq 0 ]] ; then
cd ~/
echo "${password[*]}" >> password.pass
exit 0
fi

echo "${password[*]}"

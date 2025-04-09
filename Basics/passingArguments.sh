#!/usr/bin/env bash

echo "-----------------------------------"

echo "Script: $0"
echo "First arg: $1"
echo "Second arg: $2"

echo "Number of args: $#"
echo "Args array: $@"
echo "Args as a single string: $*"
echo "PID: $$"

echo "-----------------------------------"

while (( $# != 0 )) ; do
 echo $1
 shift
done


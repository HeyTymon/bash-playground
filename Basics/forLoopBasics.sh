#!/usr/bin/env bash

for command in uptime ls pwd
do
 $command
done

var=0

for i in {1..9}; do
 var=$((var + 1))
done
echo $var

for i in $(seq 1 9); do
 var=$(( var + i ))
done
echo $var

for i in $(seq "${var}" -1 1); do
 var=$((var - 1))
done
echo $var

for file in ./files/*'.txt'; do
 echo $file
done

for (( i = 0; i <= 5; i++ )); do 
 var=$((var + i))
done
echo $var


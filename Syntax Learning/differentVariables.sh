#!/usr/bin/env bash

name='Tymon'
greating="Hello ${name}"

home_content="$(ls -al ~) ; echo greating"

echo "${home_content}" | wc -l > ./files/variables.txt  

# declare -r -> RO var
declare -r read_only_var="I'am read only variable"

echo "${read_only_var}" >> ./files/variables.txt

# declare -i -> int var
declare -i int_var=$(echo "${home_content}" | wc -l)

echo "${int_var}" >> ./files/variables.txt 

# declare -x -> env var
declare -x VAR=var

env | grep VAR >> ./files/variables.txt 

declare -xri NUM=$(ls . | wc -l)

env | grep NUM >> ./files/variables.txt 


#!/usr/bin/env bash

# Simple read
read -p "Enter two values seprated by whitespace: " var1 var2 

echo -e "Value of the first variable is ${var1} \nValue of the second variable is ${var2}"

# default IFS -> whitespace tab new-line -> IFS=$' \t\n

IFS=";"

read -p "Enter two values seprated by semicolon: " var1 var2

echo -e "Value of the first variable is ${var1} \nValue of the second variable is ${var2}"

IFS=$' \t\n'

read hour rest < <(uptime)
echo -e "${hour} \n ${rest}"


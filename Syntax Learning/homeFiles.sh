#!/usr/bin/env bash

declare -r color="$(tput setaf 5)"
declare -r clear_color="$(tput sgr0)"

read -p "Username: " name 

echo "Files in ${color}/home/${name}${clear_color}: $(ls /home/${name} 2> /dev/null | wc -l)"

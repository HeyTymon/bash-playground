#!/usr/bin/env bash

declare -r reset="$(tput sgr0)"
declare -r bold="$(tput bold)"
declare -r line="------------------------------------------${reset}"

echo "${bold}Basic system info${reset}"
echo "${line}"

echo "${bold}System uptime:${reset}"
uptime
echo "${line}"

echo "${bold}Most CPU% consuming processes:${reset}"
ps -eo pid,%cpu,comm --sort=-%cpu | head -n 5
echo "${line}"

echo "${bold}Available memory:${reset}"
grep 'MemAvailable:' /proc/meminfo
echo "${line}"

echo "${bold}Available storage for main drive:${reset}"
df -h | grep '/dev/sda1'
echo "${line}"

echo "${bold}HTTP server status:${reset}"
if systemctl is-active --quiet apache2; then
  systemctl status apache2.service | grep 'Active:'
else
  echo "Apache2 service is not active or not installed."
fi
echo "${line}"

echo "${bold}Internet connection:${reset}"
ping -c 4 8.8.8.8

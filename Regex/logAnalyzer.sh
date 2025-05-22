#!/usr/bin/env bash

file="$1"
> ipv4.list
> count_ip.list

echo -n "Requests have been answered with status 200: " ; grep -c '200' "${file}"

echo -n "GET requests issued to .zip files: " ; grep -c 'GET.*\.zip' "${file}"

echo "List of extracted IPv4 addresses created - ip.list" ; grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}' "${file}" >> ipv4.list

echo -n "Unique IPs: " ; sort -u ipv4.list | wc -l

sort ipv4.list | uniq -c | while read -r count ip
do
  echo "$ip $count" >> count_ip.list
done

#IPv6
grep -oE '([0-9a-fA-F]{0,4}:){2,7}[0-9a-fA-F]{0,4}' "${file}" | wc -l




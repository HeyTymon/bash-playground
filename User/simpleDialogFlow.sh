#!/usr/bin/env bash

if [[ ! -e ./files/names.txt ]] ; then touch ./files/names.txt ; fi

while true ; do

 name=$(dialog --keep-tite --inputbox 'Enter a name:' 0 0 2>&1 >/dev/tty) 
 echo "$name" >> ./files/names.txt

 if [[ "$?" -ne 0 ]] ; then break ; fi

 dialog --keep-tite --yesno 'Do you want to add another name?' 0 0 
 if [[ "$?" -ne 0 ]] ; then break ; fi

done


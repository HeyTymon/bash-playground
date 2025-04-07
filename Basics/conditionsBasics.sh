#!/usr/bin/env bash

#true = 0
#false != 1

var1=5
var2=10

[[ "${var1}" == 5 ]] ; echo "Exit code: ${?}" #true

[[ "${var1}" == "$(( var2 - 5))" ]] ; echo "Exit code: ${?}" #true

[[ "$(echo "10/2" | bc)" == "$(( var2 - var1 ))" ]] ; echo "Exit code: ${?}" #true

[[ "$(echo '1 2 3 4 5' | wc -w)" == 5 ]] ; echo "Exit code: ${?}" #true

[[ "Tymon" == T[yi]m* ]] ; echo "Exit code: ${?}" #true

[[ "${var1}" -lt "$(( var2 - 4 ))" ]] ; echo "Exit code: ${?}" #true

[[ 0 -le "$(( 1 < 2 ))" ]] ; echo "Exit code: ${?}" #true

[[ "1" < "2" ]] && [[ "10" < "2" ]] ; echo "Exit code: ${?}" #true -> alphabetically sorted values (1 is before 2)

[[ "${var1}" -gt 3 && "${var2}" -lt 12 ]] ; echo "Exit code: ${?}" #true


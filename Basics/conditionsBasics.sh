#!/usr/bin/env bash

#true = 0
#false != 1

var1=5
var2=10

[[ "${var1}" == 5 ]]
echo "Exit code: ${?}" #true

[[ "${var1}" == "$(( $var2 - 5))" ]]
echo "Exit code: ${?}" #true

[[ "$(echo "10/2" | bc)" == "$(( $var2 - $var1 ))" ]]
echo "Exit code: ${?}" #true

#!/usr/bin/env bash

declare -i ivar
ivar=10
echo "${ivar}" #10

ivar='10'
echo "${ivar}" #10

ivar='10+x'
echo "${ivar}" #10

x=5
ivar='10+x'
echo "${ivar}" #15

ivar=10 * x
echo "${ivar}" #10 all files in . x

# Best practice
ivar=$((10 * x))
(( ivar = 10 * x ))


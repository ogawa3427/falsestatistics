#!/bin/bash

r=9223372036854000000
h=9223372036854000000
#-9223372036854551616

while true ; do #[ $i -gt 0 ]; do
   # echo $1
    echo "$h" 100000 +
    h=$(./allc.sh "$h" 100000 +)

    echo $h
    r=$((r + 100000))
    echo $r
    echo
done
exit
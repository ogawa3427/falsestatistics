#!/bin/bash
tur=0
echo -n "" > test
while [ $tur -lt 10000 ]; do
echo $RANDOM >> test
((++tur))
done
exit

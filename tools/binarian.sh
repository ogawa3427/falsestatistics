#!/bin/bash

cat infoa | sed 's/ /\n/g' > tenpji.txt

filename=tenpji.txt

ze="0"

while IFS= read -r line; do
  pri=$(echo "ibase=16; obase=2; $line" | bc)
  count="${#pri}"
 
  	while [ $count -lt 8 ]; do

  		pri=$(echo $ze$pri)
#  		echo $ze$pri
  		count="${#pri}"
  	done
  	echo -n $pri" "

done < "$filename"
exit


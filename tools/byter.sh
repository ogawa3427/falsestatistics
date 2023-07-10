#!/bin/bash

#hachi_ume
#fill_for_me

while IFS= read -r hex; do

	while [ ${#hex} -lt 8 ]; do
		hex=$(echo -n "0$hex")
	done
	echo $hex
done

exit

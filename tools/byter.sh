#!/bin/bash

#hachi_ume
#fill_for_me

if [ -n "$1" ]; then
    
    echo $1
else
    
    while IFS= read -r line; do
       
        echo "ファイルからの入力: $line"
    done < "$filename"
fi


while IFS= read -r hex; do

	while [ ${#hex} -lt 8 ]; do
		hex=$(echo -n "0$hex")
	done
	echo $hex
done

exit
#partly_ChatGPTed

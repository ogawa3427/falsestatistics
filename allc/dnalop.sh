#!/bin/bash

function gyaku () {
	echo -n "" > stemp
	exec 3<"$1"
	while true; do
        IFS= read -r -n1 -u3 char
        if [ -z "$char" ]; then
        	break
        fi
        echo -n "$char" > onetemp
        cat onetemp stemp > temptemp
        rm stemp
        rm onetemp
        mv temptemp stemp
    done   
    exec 3<&-
    rm "$1"
    mv stemp "$1"
}

function add () {
	echo "add" >&2

	gyaku farg
	gyaku sarg

	exec 3<"farg"
	exec 4<"sarg"

	flag=0
	echo -n > rawout

	while true; do
  		IFS= read -r -n1 -u3 char1
  		IFS= read -r -n1 -u4 char2

  		if [ -z "$char1" ] && [ -z "$char2" ]; then
    		break
  		fi

  		[ -z "$char1" ] && char1="0"
  		[ -z "$char2" ] && char2="0"

		#ワイの答えはこれや！
  		sum=$((char1 + char2))
		sum=$((sum + flag))

		#記録&go next
		if [ $sum -lt 10 ]; then
			echo -n "$sum" >> rawout
			flag=0
		elif [ $sum -eq 10 ]; then
			echo -n "z" >> rawout
			flag=1
		else
			sum=$((sum - 10))
			echo -n $sum >> rawout
			flag=1
		fi
	done
	exec 3<&-
	exec 4<&-

	echo $flag >> rawout
	gyaku rawout

	cat rawout
	echo
}

function sub () {
	echo sub
}

function mul () {
	echo mul
}
function div () {
	echo div
}

echo "$1" > farg
echo "$2" > sarg

if [ $# -eq 3 ]; then
	case $3 in
		+)
		add
		;;
		-)
		sub
		;;
		\*)
		mul
		;;
		/)
		div
		;;
		*)
		echo "error! ./allc.sh (val) (val) (ope) "
		;;
	esac
else
	echo "error! ./allc.sh (val) (val) (ope) "
fi

rm farg
rm sarg
exit
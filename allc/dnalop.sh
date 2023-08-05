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

#たしざん&0埋め
	exec 3<"farg"
	exec 4<"sarg"

	flag=0
	echo -n > rawout

	while true; do
  		IFS= read -r -n1 -u3 char1
  		IFS= read -r -n1 -u4 char2

  		if [ -z "$char1" ] && [ -z "$char2" ]; then
    # 両方のファイルが終了した場合、ループを抜ける
    		break
  		fi

  		# もしchar1が空なら0を設定
  		[ -z "$char1" ] && char1="0"
  		# もしchar2が空なら0を設定
  		[ -z "$char2" ] && char2="0"

		#ワイの答えはこれや！
  		sum=$((char1 + char2))
		sum=$((sum + flag))

		#記録&go next
		if [ $sum -lt 10 ]; then
			echo -n "$sum" | sed 's/0/z/g' >> rawout
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

	echo $flag | sed 's/0//g' >> rawout
	gyaku rawout


cat rawout | sed 's/z/0/g'
echo

rm g*
rm sgf
rm sgs
rm so
rm stemp
rm ftemp
rm otemp
rm rawout
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
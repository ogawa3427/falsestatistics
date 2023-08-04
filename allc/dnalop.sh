#!/bin/bash

function gyaku () {
	echo -n "" > temp
	exec 3<"$1"

}

function add () {

#逆順にする
	echo "add" >&2
	exec 3<"tempf"
    exec 4<"temps"

    echo -n "" > ftemp
    echo -n "" > stemp
    echo -n "" > sgs
    echo -n "" > sgf

    while true; do
        IFS= read -r -n1 -u3 char1
        IFS= read -r -n1 -u4 char2

        if [ -z "$char1" ] && [ -z "$char2" ]; then
            break #終わったら抜ける
        fi

  #      [ -z "$char1" ] && char1="0"
  #      [ -z "$char2" ] && char2="0" そなたはまだ力を開放すべきではない

		#頭に来ますね(加賀並感)
		echo -n $char1  > gf
		cat gf sgf > ngf
		rm  sgf
		mv  ngf sgf

		echo -n $char2  > gs
		cat gs sgs > ngs
		rm sgs
		mv ngs sgs

    done

    exec 3<&-
    exec 4<&-

#たしざん&0埋め

exec 3<"sgf"
exec 4<"sgs"

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
	echo -n $sum | sed 's/0/z/g' >> rawout
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

# ファイルディスクリプタを閉じる
exec 3<&-
exec 4<&-

echo $flag | sed 's/0//g' >> rawout

#逆順にする
	exec 3<"rawout"

    echo -n "" > otemp
    echo -n "" > so

    while true; do
        IFS= read -r -n1 -u3 char1

        if [ -z "$char1" ] ; then
            break #終わったら抜ける
        fi

		#頭に来ますね(加賀並感)
		echo -n $char1  > go
		cat go so > no
		rm  so
		mv  no so

    done

    exec 3<&-

cat so | sed 's/z/0/g'
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

echo "$1" > tempf
echo "$2" > temps

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

rm tempf
rm temps
exit
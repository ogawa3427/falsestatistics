#!/bin/bash
echo -n > stdlog.txt

mae=0
while [ $mae -lt 100 ]; do # 例: maeが1000未満の場合にループ
  ato=0
  while [ $ato -lt 100 ]; do # 例: atoが1000未満の場合にループ
    echo "($mae,$ato)" >&2
    homemade=$(./allc.sh "$mae" "$ato" +)
    echo $homemade >&2

    readymade=$((mae + ato))
    echo $readymade >&2

    if [ $homemade = $readymade ]; then
      echo "($mae,$ato)" OK >> stdlog.txt
    else
      echo "($mae,$ato)" NG $homemade $readymade >> stdlog.txt
    fi
    ato=$((ato + 1))
  done
  mae=$((mae + 1))
done

cat stdlog | grep NG > stdNGlog.txt
echo fin
exit

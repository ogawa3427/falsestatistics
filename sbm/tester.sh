#!/bin/bash

echo h
./max -h

echo help
./max --help

#echo 3sannmoji
#echo i--te
./max -i -- mitest

#echo min--te
./max --min -- mitest

#echo 2nimoji
#echo it
./max -i mitest
#echo ti
./max test -i

#echo mint
./max --min test
./max test --min

#echo 1itimoji
./max test
cat test | ./max -i
cat test | ./max --min

cat test | ./max

echo dou?
./max < test

echo "$ ./max test"
./max test
echo ""

echo "$ cat mitest | ./max"
cat mitest | ./max
echo ""

echo "$ ./max < mitest"
./max < mitest
echo ""

echo "$ ./max -h"
./max -h
echo ""

echo "$ ./max --help"
./max --help
echo ""

echo "$./max -- mitest"
./max --min -- mitest
echo ""

echo "$./max mitest"
./max mitest
echo ""

echo "$ ./max 1 2 3 4 "
./max 1 2 3 4
echo ""

echo "$ ./max -i mitest"
./max -i mitest
echo ""

echo "$ ./max --min -- mitest"
./max --min -- mitest
echo ""

echo "cat mitest | ./max --min"
cat mitest | ./max --min
echo ""

exit

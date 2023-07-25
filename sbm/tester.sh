#!/bin/bash

echo "$ ./max file"
./max mitest
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

echo "$./max -e mitest"
./max -e mitest
echo ""

echo "$./max --escape mitest"
./max -e mitest
echo ""

echo "$ ./max 1 2 3 4 "
./max 1 2 3 4
echo ""
exit

#!/bin/bash

echo file
./max mitest

echo pppipe
cat mitest | ./max

echo redirect
./max < mitest
exit

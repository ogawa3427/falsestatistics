#!/bin/bash
#リトルエンディアン
hex=$1
echo ${hex: -2} ${hex:4:2} ${hex:2:2} ${hex:0:2}

exit

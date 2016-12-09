#!/bin/bash
# Script that counts arithmetic mean of given parameters.

avg=0;
cnt=0;

for i in $@
do
let "avg += i"
let "cnt += 1"
done

echo "scale=2; $avg / $cnt" | bc





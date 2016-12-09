#!/bin/bash

# Script for finding maximum processor temperature from November 2011 using lost24/monitor dataset.

files=~/lost24/monitor/*/*/*temps.txt
max=0;
tempfile=0;

for file in $files
do
temp=$(grep 'PRO' $file | cut -c32-33)
if [ $max -lt $temp ]; then
  max=$temp
tempfile=$file
fi

done
echo The maximum processor temperature of November 2011 is $max and it can be found on $tempfile.

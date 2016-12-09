#!/bin/bash

# Script for finding minimum and maximum processor temperatures of lost24/monitor dataset, which location is given as parameter.
max=0
min=100
minfile=0
maxfile=0


# loop for going through dates

data=$(find $1 -name '*temps.txt' -exec grep 'PROCESSOR' {} + )

IFS=$'\n'
for line in $data
  do
  tmp=${line:88:2}
  temp=${tmp//[^0-9]/}
  tempfile=${line:0:56}

if [ $min -gt $temp ]; then
  min=$temp
  minfile=$tempfile
fi

if [ $max -lt $temp ]; then
  max=$temp
  maxfile=$tempfile
fi

done
unset IFS

echo "The maximum processor temperature of dataset is $max and it can be found on $maxfile 
and the minimum processor temperature of dataset is $min and it can be found on $minfile"

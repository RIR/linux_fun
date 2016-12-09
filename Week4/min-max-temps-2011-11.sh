#!/bin/bash

# Script for finding minimum and maximum processor temperatures by date from November 2011 using lost24/monitor dataset.

tempfile="$(mktemp)"
dayfiles=~/lost24/monitor/2011.11.*

# loop for going through days of month
for dayfile in $dayfiles
  do
timefiles=${dayfile}/*/*temps.txt
max=0
min=100

# loop for going through times of a day
for timefile in $timefiles
  do
temp=$(grep 'PRO' $timefile | cut -c32-33)

if [ $min -gt $temp ]; then
  min=$temp
fi

if [ $max -lt $temp ]; then
  max=$temp
fi

done
  echo $(echo $dayfile| cut -c30-) $min $max >> $tempfile
done

gnuplot -e "filename='$tempfile'" min-max-temps-2011-11.gnuplot



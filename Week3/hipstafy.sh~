#!/bin/bash

# This script hipsterizes photos in folder that is given as a parameter

folder="$@"
files="${folder}/*.jpg"

for inputfile in $files
do
prefix=${inputfile%.jpg}
outputfile=$prefix-hipstah.jpg
convert -sepia-tone 60% +polaroid $inputfile $outputfile
done


#!/bin/bash

# Script that accepts a single numerical (greater than 0) command line parameter and prints a cat made from ASCII characters, that has a stomach length equivalent to the given parameter.

num=$1

if [ "$num" -lt "1" ]; then
   echo You have to give number greater than 0
	(exit 1)
elif [ "$num" == "1" ]; then
   echo $'\nShortcat\n\n\n'
   cat shortcat.txt	
else
   echo $'\nLongcat' "$num" $'\n\n\n'
   head -9 shortcat.txt	
 for ((i=0;i<num;i++))
  do 
   sed -n '10p' shortcat.txt
 done
   
   tail -6 shortcat.txt
fi




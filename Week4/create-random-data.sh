#!/bin/bash

# Script takes a numerical parameter n and produces n lines with two random numbers.

count=$1

 for ((i=0;i<count;i++))
  do 
    echo $RANDOM $RANDOM
 done
   



#!/bin/bash

# Script for finding minimum and maximum processor temperatures by date from given month of given year using lost24/monitor dataset. $yearmonth is parameter given in form yyyy.mm

tempfile1="$(mktemp)"
tempfile2="$(mktemp)"
yearmonth=${@: -1}
outputtime=$(echo $yearmonth | sed 's/\./\-/')

dayfiles=~/lost24/monitor/$yearmonth*

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
  echo $(echo $dayfile| cut -c30-) $min >> $tempfile1
  echo $(echo $dayfile| cut -c30-) $max >> $tempfile2
done

# getopts arguments
while getopts "c:w:b:a:h" opt; do
  case $opt in
    c)
    gnuplot -e "filename1='$tempfile1'; outp='min-max-temps-$outputtime.eps'; terma='postscript default'" min-max-temps-of-month-getopts.gnuplot
      ;;
    w)
     gnuplot -e "filename2='$tempfile2'; outp='min-max-temps-$outputtime.eps'; terma='postscript default'" min-max-temps-of-month-getopts.gnuplot
      ;;
    b)
     gnuplot -e "filename1='$tempfile1'; filename2='$tempfile2'; outp='min-max-temps-$outputtime.eps'; terma='postscript default'" min-max-temps-of-month-getopts.gnuplot
      ;;
    a)
         gnuplot -e "filename1='$tempfile1'; filename2='$tempfile2'; termd='dumb'" min-max-temps-of-month-getopts.gnuplot
      ;;
    h)
      echo "Ohjelma tulostaa prosessorin lämpötilatiedot annetulta kuukaudelta 
	   (parametri oltava muotoa yyyy.kk) kaaviona .eps-tiedostoon .
	    Argumentti vaihtoehdot: 
	    -c = kylmimmät
	    -w = lämpimimmät
	    -b = molemmat
	    -a = kaavio tulostetaan ASCII-merkistönä terminaaliin 
		(annettava ensimmäisenä jos annetaan useampi argumentti)
	    -h = ohjeet

	    esimerkkisyöte: ./min-max-temps-of-month-withgetopts.sh -a -b 2012.07"
      ;;
  esac
done

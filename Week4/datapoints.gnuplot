# gnuplot script for printing datapoints from random-data.txt file

set terminal dumb
set title "Datapoints"
set style data points
plot "random-data.txt" using 1:2 title ''

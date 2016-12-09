# gnuplot script for printing daily maximum processor temperatures from chosen data set.

set terminal postscript eps size 3.5,2.62 enhanced color \
    font 'Helvetica,20' linewidth 2
set output outp

set title "Daily minimum and maximum temperatures"
set xlabel 'Date'
set timefmt "%Y.%m.%d"
set xdata time
set xrange [ * : * ]
set yrange [ * : ]
set ylabel 'Temperature'
set style data linespoints
plot filename using 1:2 title 'min' with linespoints,\
filename using 1:3 title 'max' with linespoints

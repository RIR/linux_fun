# gnuplot script for printing daily maximum processor temperatures from chosen data set.

if (!exists ("termd")) set output outp

if (exists ("termd")) { 
set terminal dumb
} else {set terminal postscript default}

set title "Daily minimum and maximum temperatures"
set xlabel 'Date'
set timefmt "%Y.%m.%d"
set xdata time
set xrange [ * : * ]
set yrange [ * : ]
set ylabel 'Temperature'
set style data linespoints

if (exists ("filename1") && exists ("filename2")) plot filename1 using 1:2 notitle with linespoints,\
filename2 using 1:2 notitle with linespoints 

if (exists ("filename1") && !exists ("filename2")) plot filename1 using 1:2 notitle with linespoints

if (!exists ("filename1") && exists ("filename2")) plot filename2 using 1:2 notitle with linespoints

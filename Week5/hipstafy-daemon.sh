#!/bin/bash
# This is a simple daemon shell script.
#
# Traps:
# signal HUP (1) read config file again
# signal QUIT (3) delete temp files
# signal TERM (15) delete temp files

conf=/tmp/bashdaemon.conf
source $conf
tempfile=/tmp/BASHDAEMON_$$
touch $tempfile

# set traps
trap 'source $conf' 1
trap 'rm -f $tempfile; exit' 0
trap 'rm -f $tempfile; exit' 3
trap 'rm -f $tempfile; exit' 15

# loop forever
while :
do
    echo $foo
    echo $bar
    sleep 30
done

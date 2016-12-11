#!/bin/bash

# Daemon for hipstafy-wait.sh

trap "" HUP
case "$1" in
	start)
		echo "Hipstafy-daemon started"
		nohup ./hipstafy-wait.sh 2>>hip_err.log 1>>hipstafy.log &
		echo $! > pid.txt
		;;
	stop)
		echo "Hipstafy-daemon stopped"
		kill $(cat pid.txt) 2>/dev/null
		;;
	status)
		kill -0 $(cat pid.txt) 2>/dev/null
		  if [ $? -eq 0 ]
		  then
  		    echo "Daemon is alive"
		  else 
		    echo "Daemon is not running"
		  fi
		;;	
	restart)
		echo "Hipstafy-daemon stopped"
		kill $(cat pid.txt) 2>/dev/null

		echo "Hipstafy-daemon started"
		nohup ./hipstafy-wait.sh 2>>hip_err.log 1>>hipstafy.log &
		echo $! > pid.txt
		;;
esac

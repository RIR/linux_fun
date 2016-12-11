# Week 5 study diary


## Exercises:

1. Counting in the shell. average.sh:

    ```
    #!/bin/bash
    # Script that counts arithmetic mean of given parameters.

    avg=0;
    cnt=0;

    for i in $@
    do
    let "avg += i"
    let "cnt += 1"
    done

    echo "scale=2; $avg / $cnt" | bc
    ```
2. Gone in 10 seconds. Did this in my student laptop and although the script is considerably faster than the previous (previous script would take forever to go through whole dataset), i think it's impossible to go through the dataset in 10 seconds (in Ukko node that would probably happen, but i think the instruction on earlier in course was not to download the dataset there). Here's my script and output:

    ```
    #!/bin/bash

    # Script for finding minimum and maximum processor temperatures of lost24/monitor dataset, which location is given as parameter.
    max=0
    min=100
    minfile=0
    maxfile=0


    # loop for going through dates

    data=$(find $1 -name '*temps.txt' -exec grep 'PROCESSOR' {} + )

    IFS=$'\n'
    for line in $data
     do
        tmp=${line:88:2}
        temp=${tmp//[^0-9]/}
        tempfile=${line:0:56}

    if [ $min -gt $temp ]; then
        min=$temp
        minfile=$tempfile
    fi

    if [ $max -lt $temp ]; then
        max=$temp
        maxfile=$tempfile
    fi

    done
    unset IFS

    echo "The maximum processor temperature of dataset is $max and it can be found on $maxfile and the minimum processor temperature of dataset is $min and it can be found on $minfile"
    ```
    
    ```
    fuksi@dhcp-asv-103:~/Dev/LinuxFundamentals2016/Week5$ time ./fast-min-max-temperature.sh /home/fuksi/lost24
    The maximum processor temperature of dataset is 54 and it can be found on /home/fuksi/lost24/monitor/2012.04.25/10:55/hp-temps.txt and the minimum processor temperature of dataset is 7 and it can be found on /home/fuksi/lost24/monitor/2012.02.02/04:40/hp-temps.txt

    real	0m39.282s
    user	0m7.116s
    sys	0m6.567s
    ```

3. Hipstafy-dropbox. Here's the script for it:

    ```
    #!/bin/bash

    # This script hipstafies images that are moved or copied to hipstafy-dropbox folder

    inotifywait -e MOVED_TO,CREATE -m hipstafy-dropbox | 
    while read log; 
    do
    if [[ "$log" == *.jpg ]]; then
    file=$(echo $log | cut -f 3 -d ' ')
    echo "hipstafying $file"
    mv /home/fuksi/Dev/LinuxFundamentals2016/Week5/hipstafy-dropbox/*.jpg hipstafy-dropbox/to_be_hipstafied;

    # hipstafying happens in /hipstafy-dropbox/to_be_hipstafied. Then already hipstafied pictures will be moved to /hipstafied folder
    # and original pictures stay in /to_be_hipstafied folder. 

    /home/fuksi/Dev/LinuxFundamentals2016/Week3/hipstafy.sh hipstafy-dropbox/to_be_hipstafied;
    mv /home/fuksi/Dev/LinuxFundamentals2016/Week5/hipstafy-dropbox/to_be_hipstafied/*-hipstah.jpg hipstafy-dropbox/hipstafied;

    # uncomment following if you want to automatically remove not hipstafied files from /hipstafy-dropbox/to_be_hipstafied/
    # rmfiles=$(find /home/fuksi/Dev/LinuxFundamentals2016/Week5/hipstafy-dropbox/to_be_hipstafied/ -type f -not -name "*hipstah.jpg" )
    # for file in $rmfiles
    # do
    # rm $file;
    # done 

    else
    echo "Hipstafy works only for .jpg-pictures!"
    fi
    done
    ```
    Summoning daemons. Script for daemon interface:

    ![Sauna](hipstafy-dropbox/hipstafied/sauna-hipstah.jpg)


     Summoning daemons. Script for daemon interface:
    
    ```
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
    ```

    Output from hip_err.log
    
    ```  
    Setting up watches.
	Watches established.
	mv: tiedoston ”/home/fuksi/Dev/LinuxFundamentals2016/Week5/hipstafy-dropbox/*.jpg” tilaa ei voi lukea: Tiedostoa tai hakemistoa ei ole
    ```
    
    Output from hipstafy.log
    
    ```
    hipstafying watch-your-thoughts__62381.1429316292.400.650.jpg
    Hipstafy works only for .jpg-pictures!
    ```

        






        


    


	
	



	




























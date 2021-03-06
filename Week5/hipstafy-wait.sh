#!/bin/bash

# This script hipstafies images that are moved or copied to hipstafy-dropbox folder

inotifywait -e MOVED_TO,CREATE -m hipstafy-dropbox | 
while read log; 
do
if [[ "$log" == *.jpg ]]; then
 file=$(echo $log | cut -f 3 -d ' ')
  echo "hipstafying $file";
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





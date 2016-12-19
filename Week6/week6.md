# Week 6 study diary


## Exercises:

HIPSTAFY-URL.SH. Script for the assignment (script is using TickTick as helper):

```
#!/bin/bash

# This script hipsterizes a downloaded image and uploads it to imgur.
 . ticktick.sh

client_id="4879e067a5136df"
curl -O $1
inputfile=$(basename $1)
if [[ $inputfile == *.jpg ]]
then  
prefix=${inputfile%.jpg}
outputfile=$prefix-hipstah.jpg
convert -sepia-tone 60% +polaroid $inputfile $outputfile
fi

data=$(curl -v -H "Content-Type: application/json" -H "Authorization: Client-ID $client_id" --data-binary "@$outputfile" https://api.imgur.com/3/upload)

tickParse "$data"
echo "Your hipstafied image is located in ``data.link``"
```

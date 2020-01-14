#!/bin/bash

while IFS= read -r line
do
   echo;echo;echo $line
   wpscan --url $line --follow-redirection --batch >> scan_output.txt
done < sites.txt
 

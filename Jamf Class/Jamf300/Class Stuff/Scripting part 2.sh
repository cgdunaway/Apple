#!/bin/bash

#for loops
#for i in red blue green; do
#	/bin/echo "The color is $i"
#	sleep 1
#done

#use a for loop to make sites with the api
#for site in siteA siteB siteC; do
#	/bin/echo "Creating site $site"
#	curl -sku api:api https://pro.jamf.training:8443/00/JSSResource/sites/id/0 -H "content-type: text/xml" -X POST -d "<site><name>$site</name></site>"
#done

#while loops

#use a while loop to read in a multi-row csv file
#IFS=,
#while read firstName lastName instrument persona; do
#	/bin/echo "$firstName $lastName is the $persona and plays $instrument."
#	sleep 1
#done < ~/Desktop/KISS.csv

#do a thing until a file exists
#while [[ -f ~/Desktop/stop.txt ]]; do
#	say "oh no. the file is not there."
#	sleep 5
#done


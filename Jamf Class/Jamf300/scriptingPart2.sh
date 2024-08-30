#!/bin/bash

#for loops
#for i in red blue green; do
#	/bin/echo "The color is $i"
#	sleep 1
#done

#use a for loop to make sites with Jamf API
#for site in siteA siteB siteC; do
#	/bin/echo "Creating site $site..."
#	curl -sku api:api https://pro.jamf.training:8443/03/JSSResource/sites/id/0 -H "content-type: application/xml" -X POST -d "<site><name>$site</name></site>"
#done

#while loops
#IFS=,
#set a variable per column in csv
#while read firstName lastName instrument persona; do
#	/bin/echo "$firstName $lastName is the $persona and plays $instrument."
#	sleep 1
#done < ~/Desktop

#do a thing until file exists
#while [[ ! -f ~/Desktop/stop.txt ]]; do
#	say "oh no"
#	sleep 30
#done

#for department in Art Music Math Science History; do
#	/bin/echo "Creating department $department..."
#	curl -sku api:api https://pro.jamf.training:8443/03/JSSResource/departments/id/0 -H "content-type: application/xml" -X POST -d "<department><name>$department</name></department>"
#	echo
#	sleep 1
#done

#if [[ -f $4 ]]; then
#	jamf displayMessage -message "$5"
#fi

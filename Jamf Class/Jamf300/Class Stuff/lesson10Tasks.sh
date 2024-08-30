#!/bin/bash

#Compose a script with a for-loop to create departments
for department in Art Music Math Science History; do
	/bin/echo "Creating the $department department."
	curl -sku api:api https://pro.jamf.training:8443/00/JSSResource/departments/id/0 -H "content-type: text/xml" -X POST -d "<department><name>$department</name></department>"
done

#Compose a script to check for a file and show a message if the file exists
##(this goes into Settings > Computer Management > Scripts)
#fileToCheck="$4"
#messageToDisplay="$5"
#if [[ -e $fileToCheck ]];then
#jamf displayMessage -message "$messageToDisplay"
#fi
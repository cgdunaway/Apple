#!/bin/bash

#set the health check status to a variable
healthCheckStatus=$(/usr/bin/curl -m 10 -ks https://pro.jamf.training:8443/00/healthCheck.html)

/bin/echo "The status is $healthCheckStatus"

#write an if statement - if the status is not [], show the user and print status to a file
if [[ "$healthCheckStatus" != "[]" ]]; then
	/usr/local/jamf/bin/jamf displayMessage -message "Oh no! The status is: $healthCheckStatus"
	/bin/echo "$healthCheckStatus" >> /Users/Shared/brokeJamf.txt
fi

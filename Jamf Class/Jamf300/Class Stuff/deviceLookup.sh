#!/bin/bash

#prompt the user to type in a serial number
serialToLookUp=$(osascript -e 'text returned of (display dialog "Type the serial number here" default answer "" buttons {"OK"} default button 1)')
/bin/echo "The user typed in $serialToLookUp"

#perform an api call with the serial and set the return body as a variable
deviceInfo=$(curl -sku api:api https://pro.jamf.training:8443/00/JSSResource/mobiledevices/serialnumber/$serialToLookUp -H "accept: text/xml" -X GET | xmllint --format -)

#echo the xml and use xpath to find user, depatment, and building
deviceUser=$(/bin/echo "$deviceInfo" | xmllint --xpath '/mobile_device/location/real_name/text()' -)
deviceDepartment=$(/bin/echo "$deviceInfo" | xmllint --xpath '/mobile_device/location/department/text()' -)
deviceBuilding=$(/bin/echo "$deviceInfo" | xmllint --xpath '/mobile_device/location/building/text()' -)

/bin/echo "This device belongs to $deviceUser in the $deviceDepartment department in the $deviceBuilding building."

#show the info to the user
jamf displayMessage -message "This device belongs to $deviceUser in the $deviceDepartment department in the $deviceBuilding building."
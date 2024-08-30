#!/bin/bash

#set assetTage as a variable
#assetTag=js12345
#use previous variable to update asset tag
#sudo /usr/local/jamf/bin/jamf recon -assetTag "$assetTag"

#
#command substitution
#

#set my healthCheck status as a variable and show it to the user
#healthCheckStatus=$(curl -sk https://pro.jamf.training:8443/00/healthCheck.html)
#/bin/echo "The status is $healthCheckStatus"
#/usr/local/jamf/bin/jamf displayMessage -message "The status is $healthCheckStatus"

#get my computer's serial number and set it as a variable
#system_profiler SPHardwareDataType
#system_profiler SPHardwareDataType | awk '/Serial/'
#system_profiler SPHardwareDataType | awk '/Serial/{print $4}'
#system_profiler SPHardwareDataType | awk '/Serial/{print $NF}'
#computerSerialNumber=$(system_profiler SPHardwareDataType | awk '/Serial/{print $NF}')
#/bin/echo "$computerSerialNumber"

#
#Prompts
#

#use read to prompt users for info
#read -p "Please enter your jamf pro username: " jamfUserName
#/bin/echo "Hello, $jamfUserName"
#
#read -sp "Please enter your jamf pro password: " jamfPassword
#/bin/echo "You should never pass $jamfPassword in plain text :( "
#
#curl -sku "$jamfUserName":"$jamfPassword" https://yoururl

#use apple scripts to prompt users for info
#assetTag=$(/usr/bin/osascript -e 'text returned of (display dialog "Please type your Asset Tag" default answer "JS#####" buttons {"OK"} default button 1)')
#sudo jamf recon -assetTag "$assetTag"

#
#Parameters
#

#firstName=$1
#middleName=$2
#lastName=$3
#
#/bin/echo "My full name is $firstName $middleName $lastName"

#
#Redirects
#

#programatically create a csv file on my desktop: computer ID,asset tag,room number
#/bin/echo -n "44," > ~/Desktop/classCSV.csv
#/bin/echo -n "JS12345," >> ~/Desktop/classCSV.csv
#/bin/echo -n "215" >> ~/Desktop/classCSV.csv

#read in my csv and perform an api call
#IFS=,
#read computerID assetTag roomNumber < ~/Desktop/classCSV.csv
#/bin/echo "Computer with id $computerID has asset tag $assetTag and is in room $roomNumber"
#curl -sku api:api https://pro.jamf.training:8443/00/JSSResource/computers/id/"$computerID" -H "content-type: text/xml" -X PUT -d "<computer><general><asset_tag>$assetTag</asset_tag></general><location><room>$roomNumber</room></location></computer>"

#
#cat
#

#read in until the end of a file and redirect that data to my desktop
#we will reference this in lesson 10
#cat << EOF > ~/Desktop/KISS.csv
#Paul,Stanley,Guitar,Star Child
#Ace,Frehley,Guitar,Space Ace
#Gene,Simmons,Bass,Demon
#Peter,Criss,Drums,Cat
#EOF

#use a hereDoc to create a daemon with a script
#cat << EOF > /Library/LaunchDaemons/jamfCourseResources.plist
#<?xml version="1.0" encoding="UTF-8"?>
#<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
#<plist version="1.0">
#<dict>
#<key>Label</key>
#<string>jamfCourseResources</string>
#<key>ProgramArguments</key>
#<array>
#<string>sh</string>
#<string>/private/var/restart.sh</string>
#</array>
#<key>StartInterval</key>
#<integer>$userTimeChoice</integer>
#<key>RunAtLoad</key>
#<true/>
#</dict>
#</plist>
#EOF
#
#chmod 644 /Library/LaunchDaemons/jamfCourseResources.plist
#chown root:wheel /Library/LaunchDaemons/jamfCourseResources.plist
#launchctl load /Library/LaunchDaemons/jamfCourseResources.plist 
#
#cat << EOF > /privat/var/restart.sh
##!/bin/bash
#
#
#/sbin/shutdown -r
#EOF

#
#tr
#

#/bin/echo "leet speek" | tr e 3

#
#date
#

#print the jamf-formatted date
#date +%F\ %T

#get the last reboot time using kernel boot time
#sysctl kern.boottime
#sysctl kern.boottime | awk '{print $5}'
#sysctl kern.boottime | awk '{print $5}' | tr -d ,

#kernelBootTime=$(sysctl kern.boottime | awk '{print $5}' | tr -d ,)
#/bin/echo "$kernelBootTime"
#bootTimeFormatted=$(date -jf %s $kernelBootTime +%F\ %T)
#/bin/echo "<result>$bootTimeFormatted</result>"
#!/bin/sh
#This is the extension attribute template from Jamf by the name "Battery Health Status"
result=`ioreg -r -c "AppleSmartBattery" | grep "PermanentFailureStatus" | awk '{print $3}' | sed s/\"//g`

if [ "$result" == "1" ]; then
result="Failure"
elif [ "$result" == "0" ]; then
result="OK"
fi

echo "<result>$result</result>"

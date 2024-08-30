#!/bin/sh
CP_ServerAddress="EditFromTemplate_CrashPlan_Server_Name"
CP_ServerPort="4285"
CP_AdminUsername="EditFromTemplate_CrashPlan_Service_Account_Username"
CP_AdminPassword="EditFromTemplate_CrashPlan_Service_Account_Password"

if [ "$CP_ServerAddress" == "" ] || [ "$CP_ServerPort" == "" ] || [ "$CP_AdminUsername" == "" ] || [ "$CP_AdminPassword" == "" ];then
echo "<result>Please ensure all variables are set in the extension attribute script.</result>"
else
if [ -f /Library/Application\ Support/CrashPlan/.identity ];then
	GUID=`/bin/cat /Library/Application\ Support/CrashPlan/.identity | grep guid | sed s/guid\=//g`
	echo "<result>`/usr/bin/curl -u "$CP_AdminUsername":"$CP_AdminPassword" -k https://"$CP_ServerAddress":"$CP_ServerPort"/rest/computers?guid="$GUID" | grep -w alertStates | awk '{print $2}' | sed s/,//g | sed 's/..\(.*\)/\1/' | sed 's/\(.*\)../\1/'`</result>"
else
	echo "<result>Not installed</result>"
fi
fi
	

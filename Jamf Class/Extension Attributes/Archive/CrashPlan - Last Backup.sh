#!/bin/sh
CP_ServerAddress="EditFromTemplate_CrashPlan_Server_Name"
CP_ServerPort="4285"
CP_AdminUsername="EditFromTemplate_CrashPlan_Service_Account_Username"
CP_AdminPassword="EditFromTemplate_CrashPlan_Service_Account_Password"

if [ "$CP_ServerAddress" == "" ] || [ "$CP_ServerPort" == "" ] || [ "$CP_AdminUsername" == "" ] || [ "$CP_AdminPassword" == "" ];then
echo "Please ensure all variables are set in the extension attribute script."
else
if [ -f /Library/Application\ Support/CrashPlan/.identity ];then
	GUID=`/bin/cat /Library/Application\ Support/CrashPlan/.identity | grep guid | sed s/guid\=//g`
	value=`/usr/bin/curl -u "$CP_AdminUsername":"$CP_AdminPassword" -k https://"$CP_ServerAddress":"$CP_ServerPort"/rest/computerUsage?sourceGuid="$GUID" | grep -w lastActivity | awk '{print $2}' | sed s/,//g | sed 's/.\(.*\)/\1/'`
	result=`/bin/date -j -f "%Y-%m-%dT%H:%M:%S" "$value" "+%Y-%m-%d %H:%M:%S"`
	echo "<result>$result</result>"
else
	echo "<result>Not installed</result>"
fi
fi
	

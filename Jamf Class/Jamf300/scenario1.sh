#!/bin/bash

JSSResource="https://pro.jamf.training:8443/03/JSSResource"
apiUserName="api_scenario1"
apiPassword="api"
targetSerial=$(system_profiler SPHardwareDataType | awk '/Serial Number/{print $NF}')
targetJamfID=$(curl -sku "$apiUserName":"$apiPassword" "$JSSResource"/computers/serialnumber/"$targetSerial" -H "accept: text/xml" -X GET | xmllint --xpath '/computer/general/id/text()' -)
echo "$targetSerial"
echo "$targetJamfID"

curl -sku "$apiUserName":"$apiPassword" "$JSSResource"/fileuploads/computers/id/"$targetJamfID" -F name=@/var/log/system.log -X POST
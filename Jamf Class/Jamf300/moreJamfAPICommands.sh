#!/bin/bash

#create a category called Design with a priority of 12
#curl -sku api:api https://pro.jamf.training:8443/03/JSSResource/categories/id/0 -H "content-type: application/xml" -X POST -d "<category><name>Design</name><priority>12</priority></category>"

#move computer id 44 to the staging site
#curl -sku api:api https://pro.jamf.training:8443/03/JSSResource/computers/id/44 -H "content-type: application/xml" -X PUT -d "<computer><general><site><name>Staging</name></site></general></computer>"

#move ipad with id 44 to Staging site
#curl -sku api:api https://pro.jamf.training:8443/03/JSSResource/mobiledevices/id/44 -H "content-type: application/xml" -X PUT -d "<mobile_device><general><site><name>Staging</name></site></general></mobile_device>"

#Send a restart command to my ipad
#curl -sku api:api https://pro.jamf.training:8443/03/JSSResource/mobiledevicecommands/command/RestartDevice/id/3000 -X POST

#Upload the system.log file to my computers inventory record
#curl -sku api:api https://pro.jamf.training:8443/03/JSSResource/fileuploads/computers/id/3000 -F name=@/var/log/system.log -X POST

#Same same but different (with date)
#curl -sku api:api https://pro.jamf.training:8443/03/JSSResource/fileuploads/computers/id/3000 -F name="@/var/log/system.log; filename=system-`date`.log" -X POST

#create the Updates category
#curl -sku api:api https://pro.jamf.training:8443/03/JSSResource/categories/id/0 -H "content-type: application/xml" -d "<category><name>Updates</name></category>"

#Move your computer to the Testing site
#curl -sku api:api https://pro.jamf.training:8443/03/JSSResource/computers/id/3000 -H "content-type: application/xml" -d "<computer><general><site><name>Testing</name></site></general></computer>" -X PUT

#Move your mobile device to the Production site
#curl -sku api:api https://pro.jamf.training:8443/03/JSSResource/mobiledevices/id/3000 -H "content-type: application/xml" -d "<mobile_device><general><site><name>Production</name></site></general></mobile_device>" -X PUT

#Send an update inventory command to your mobiledevice
curl -sku api:api https://pro.jamf.training:8443/03/JSSResource/mobiledevicecommands/command/UpdateInventory/id/3000 -X POST
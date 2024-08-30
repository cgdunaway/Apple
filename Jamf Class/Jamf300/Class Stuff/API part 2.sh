#!/bin/bash

#create a category called Design with a priority of 12
#curl -sku api:api https://pro.jamf.training:8443/00/JSSResource/categories/id/0 -H "content-type: text/xml" -X POST -d "<category><name>Design</name><priority>12</priority></category>"

#move computer with id 44 to the Staging site
#curl -sku api:api https://pro.jamf.training:8443/00/JSSResource/computers/id/44 -H "content-type: text/xml" -X PUT -d "<computer><general><site><name>Staging</name></site></general></computer>"

#move iPad with id 44 to the Staging site
#curl -sku api:api https://pro.jamf.training:8443/00/JSSResource/mobiledevices/id/44 -H "content-type: text/xml" -X PUT -d "<mobile_device><general><site><name>Staging</name></site></general></mobile_device>"

#send a restart command to my iPad (POST)
#curl -sku api:api https://pro.jamf.training:8443/00/JSSResource/mobiledevicecommands/command/RestartDevice/id/3000 -X POST

#upload the system.log file to my computer's inventory record
#curl -sku api:api https://pro.jamf.training:8443/00/JSSResource/fileuploads/computers/id/3000 -F name=@/var/log/system.log -X POST

#upload the system.log file WITH DATE to my computer's inventory record
#curl -sku api:api https://pro.jamf.training:8443/00/JSSResource/fileuploads/computers/id/3000 -F name="@/var/log/system.log; filename=system-`date`.log" -X POST

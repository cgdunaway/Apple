#!/bin/bash

#Create the Updates category
#curl -sku api:api https://pro.jamf.training:8443/00/JSSResource/categories -H "content-type: text/xml" -X POST -d "<category><name>Updates</name></category>"

#Move your computer to the Testing site
#curl -sku api:api https://pro.jamf.training:8443/00/JSSResource/computers/id/3000 -H "content-type: text/xml" -X PUT -d "<computer><general><site><name>Testing</name></site></general></computer>"

#Move your mobile device to the Production site
#curl -sku api:api https://pro.jamf.training:8443/00/JSSResource/mobiledevices/id/3000 -H "content-type: text/xml" -X PUT -d "<mobile_device><general><site><name>Production</name></site></general></mobile_device>"

#Send an update inventory command to your mobile device
#curl -sku api:api https://pro.jamf.training:8443/00/JSSResource/mobiledevicecommands/command/UpdateInventory/id/3000 -X POST
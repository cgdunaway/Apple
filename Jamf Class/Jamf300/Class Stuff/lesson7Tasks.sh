#!/bin/bash

#Print a list of sites to a file
#curl -sku api:api https://pro.jamf.training:8443/00/JSSResource/sites -H "accept: text/xml" -X GET -o ~/Desktop/sitesFromCurl.xml
#curl -sku api:api https://pro.jamf.training:8443/00/JSSResource/sites -H "accept: text/xml" -X GET | xmllint --format - > ~/Desktop/prettySites.xml

#Format the response of the All Managed Clients smart group
#curl -sku api:api https://pro.jamf.training:8443/00/JSSResource/computergroups/id/1 -H "accept: text/xml" -X GET | xmllint --format -

#Format the inventory record for your comptuer. Print the formatted response to a file
#curl -sku api:api https://pro.jamf.training:8443/00/JSSResource/computers/serialnumber/C02RK01GGFWK -H "accept: text/xml" -X GET | xmllint --format - > ~/Desktop/myComputer.xml

#Print the activation code without xml tags
curl -sku api:api https://pro.jamf.training:8443/00/JSSResource/activationcode -H "accept: text/xml" -X GET | xmllint --xpath '/activation_code/code/text()' - > ~/Desktop/activationcode.txt
#!/bin/bash

JSSResource="https://pro.jamf.training:8443/03/JSSResource"

#GET JSS categories
#curl -sku api:api https://pro.jamf.training:8443/03/JSSResource/categories -H "accept: application/xml" -X GET

#GET category 3
#curl -sku api:api https://pro.jamf.training:8443/03/JSSResource/categories/id/3 -H "accept: application/xml" -X GET

#GET category 3 and output results to desktop
#curl -sku api:api https://pro.jamf.training:8443/03/JSSResource/categories/id/3 -H "accept: application/xml" -X GET >> /Users/localadmin/Desktop/category3.xml

#GET category 3 and format response
#curl -sku api:api https://pro.jamf.training:8443/03/JSSResource/categories/id/3 -H "accept: application/xml" -X GET | xmllint --format -

#GET category 3, format, direct to file on desktop
#curl -sku api:api https://pro.jamf.training:8443/03/JSSResource/categories/id/3 -H "accept: application/xml" -X GET | xmllint --format - >> /Users/localadmin/Desktop/category3readable.xml

#GET a list of all computers
#curl -sku api:api https://pro.jamf.training:8443/03/JSSResource/computers -H "accept: application/XML" -X GET | xmllint --format -

#GET my computer's inventory record using serial and format 
#curl -sku api:api https://pro.jamf.training:8443/03/JSSResource/computers/serialnumber/C02RK02YGFWK -H "accept: application/xml" -X GET | xmllint --format -

#GET my computer's Jamf Pro ID using serial number
#curl -sku api:api "$JSSResource"/computers/serialnumber/C02RK02YGFWK -H "accept: application/xml" -X GET | xmllint --xpath '/computer/general/id/text()' -

#GET a list of sites and output to file on desktop
#curl -sku api:api "$JSSResource"/sites -H "accept: application/xml" -X GET | xmllint --format - >> /Users/localadmin/Desktop/sitesList.xml

#Format the response of All Managed Clients smart group
#curl -sku api:api "$JSSResource"/computergroups/id/1 -H "accept: application/xml" -X GET | xmllint --format -

#Format the inventory record for your computer and output to desktop
#curl -sku api:api https://pro.jamf.training:8443/03/JSSResource/computers/serialnumber/C02RK02YGFWK -H "accept: application/xml" -X GET | xmllint --format - >> /Users/localadmin/Desktop/inventoryRecord.xml

#Print the activation code for Jamf Pro without xml tags
#curl -sku api:api $JSSResource/activationcode -H "accept: application/xml" -X GET | xmllint --xpath '/activation_code/code/text()' --format -


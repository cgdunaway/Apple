#!/bin/bash

#GET all of the categories in my Jamf Pro server
#curl -sku api:api https://pro.jamf.training:8443/00/JSSResource/categories -H "accept: text/xml" -X GET 

#GET category with id of 3
#curl -sku api:api https://pro.jamf.training:8443/00/JSSResource/categories/id/3 -H "accept: text/xml" -X GET 

#GET category with id of 3 and output result to my Desktop
#curl -sku api:api https://pro.jamf.training:8443/00/JSSResource/categories/id/3 -H "accept: text/xml" -X GET -o ~/Desktop/category3.xml

#GET category with id of 3 and FORMAT the xml response
#curl -sku api:api https://pro.jamf.training:8443/00/JSSResource/categories/id/3 -H "accept: text/xml" -X GET | xmllint --format -

#GET category with id of 3, format the response, and redirect to a file on my desktop
#curl -sku api:api https://pro.jamf.training:8443/00/JSSResource/categories/id/3 -H "accept: text/xml" -X GET | xmllint --format - > ~/Desktop/category3Pretty.xml 

#GET a list of all computers and format the response
#curl -sku api:api https://pro.jamf.training:8443/00/JSSResource/computers -H "accept: text/xml" -X GET | xmllint --format -

#GET my comptuer's inventory record with its serialnumber and format the response
#curl -sku api:api https://pro.jamf.training:8443/00/JSSResource/computers/serialnumber/C02RK01GGFWK -H "accept: text/xml" -X GET | xmllint --format -

#GET my computer's jamf pro ID using serial number
#curl -sku api:api https://pro.jamf.training:8443/00/JSSResource/computers/serialnumber/C02RK01GGFWK -H "accept:text/xml" -X GET | xmllint --xpath '/computer/general/id' -

#GET my computer's id and remove the xml tags
#curl -sku api:api https://pro.jamf.training:8443/00/JSSResource/computers/serialnumber/C02RK01GGFWK -H "accept:text/xml" -X GET | xmllint --xpath '/computer/general/id/text()' -


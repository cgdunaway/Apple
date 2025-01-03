#!/bin/bash

# Variables
jamfURL="https://jss.cisl.ucar.edu:8443"
apiUser="casper-gdunaway"
apiPass="Prog#221344"
siteID="2"

# Get all computer IDs from the specified site
computerIDs=$(curl -X 'GET' \
  'https://jss.cisl.ucar.edu:8443/api/v1/sites/2/objects?page=0&page-size=1000&sort=objectType%3Aasc&filter=objectType%3D%3D%22Computer%22' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdXRoZW50aWNhdGVkLWFwcCI6IkdFTkVSSUMiLCJhdXRoZW50aWNhdGlvbi10eXBlIjoiTERBUCIsImdyb3VwcyI6WzM0LDQ2LDcwXSwic3ViamVjdC10eXBlIjoiTERBUF9VVUlEIiwidG9rZW4tdXVpZCI6ImQwYzhjZjU4LWFhM2QtNDYyNy1iNGE1LWRiMTRjYzYyNzc2MSIsImxkYXAtc2VydmVyLWlkIjo4LCJzdWIiOiJDQUJEMjU0RC01NjEwLTQyMUMtODI2My1ENzUzMjBGNTc2Q0YiLCJleHAiOjE3Mjc5OTExMzN9.RofVY0vLTpAbIp1VjazdWHockhCNW1lBRtxchqOHArA'
)

echo $computerIDs

# Loop through each computer ID and get the inventory record
# for id in $computerIDs; do
#     curl -su "$apiUser:$apiPass" "$jamfURL/JSSResource/computers/id/$id" -o "computer_$id.xml"
# done
#
# echo "Inventory records have been saved."

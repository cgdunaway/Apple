#!/bin/bash

#Jamf Script Parameter Values
#Echoes and displays Jamf script parameter values from $1-3
#By Greg Dunaway 7/12/22

echo $1
echo $2
echo $3

osascript <<EOF
display dialog {"Parameter 1 (mount point): $1\n\nParameter 2 (computer name): $2\n\nParameter 3 (username): $3"} \
with title {"Jamf Parameter Values"} \
with icon {"/Users/$3/Library/Application Support/com.jamfsoftware.selfservice.mac/Documents/Images/brandingimage.png"} \
buttons {"OK"}
EOF

exit 0

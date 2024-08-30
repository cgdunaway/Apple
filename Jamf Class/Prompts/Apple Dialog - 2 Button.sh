#!/bin/bash

#Apple Dialog - 2 Button.sh
#a script to display Apple dialogs using AppleScript and Jamf parameters.
#By Greg Dunaway 2/22/21

#four="paragraph: use \n for a new line"
#five="title"
#six="/path to/.icns or .png"
#seven="cancel button text"
#eight="default button text"
#nine="Script to run when cancel button selected"
#ten="Script to run when default button selected"
#eleven=""

#Defaults

icon=$6
if [ -z $icon ]; then
  icon="/Users/$3/Library/Application Support/com.jamfsoftware.selfservice.mac/Documents/Images/brandingimage.png"
fi

userSelect=$(osascript <<EOF
display dialog {"$4"} \
with title {"$5"} \
with icon {"$icon"} \
buttons {"$7","$8"} \
default button {"$8"}
EOF)

echo $userSelect

if [ "$userSelect" = "button returned:$7" ]; then
  $9
elif [ "$userSelect" = "button returned:$8" ]; then
  ${10}
else
  echo "Dialog closed with no selection"
fi

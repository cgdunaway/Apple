#!/bin/bash
#displayAppleAlert.sh
#a script to display Apple alerts using AppleScript and Jamf parameters. This only has 1 button for confirmation.
#By Greg Dunaway 2/3/21
#four="paragraph 1"
#five="paragraph 2"
#six="paragraph 3"
#seven="title"
#eight="/path/to/.icns or .png"
#nine="button text"
#ten=
#eleven=
osascript <<EOF
display dialog {"Test\n\nTest2\n\nTest3"} \
with title {"title"} \
with icon stop \
buttons {"OK","TEST"}
EOF

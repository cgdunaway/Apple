#!/bin/bash
#displayAppleDialog.sh
#a script to display Apple dialogs using AppleScript and Jamf parameters. This one has 2 buttons.
#By Greg Dunaway 2/3/21

userSelect=$(osascript <<EOT
display dialog {"$4\n\n$5\n\n$6"} \
with title {"$7"} \
with icon {"$8"} \
buttons {"$9","$10"} \
default button {"$10"} \
cancel button {"$9"}
EOT)

if(userSelect = "$9"); then
  echo "User cancelled"
else if(userSelect = "$10"); then
  echo "User proceeded"
  $11
else
  echo "Prompt closed with no selection"
fi

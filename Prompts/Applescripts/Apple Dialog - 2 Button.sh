#!/bin/bash
#Apple Dialog - 2 Button.sh
#a script to display Apple dialogs using AppleScript and Jamf parameters. This one has 2 buttons.
#By Greg Dunaway 2/3/21

# userSelect=$(osascript <<EOT
# display dialog {"$4\n\n$5\n\n$6"} \
# with title {"$7"} \
# with icon {"$8"} \
# buttons {"$9","$10"} \
# default button {"$10"} \
# cancel button {"$9"}
# EOT)

userSelect=$(osascript <<EOF
display dialog {"Test\n\nTest2\n\nTest3"} \
with title {"title"} \
buttons {"OK","TEST"} \
default button {"TEST"}
EOF)

echo $userSelect

if [ "$userSelect" = "button returned:TEST" ]; then
  open "https://google.com"
  say "Test"
elif [ "$userSelect" = "button returned:OK" ]; then
  echo "User selected OK"
  say "OK"
else
  echo "Dialog closed with no selection"
fi

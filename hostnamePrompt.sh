#!/bin/bash

# computerName=$(osascript -e 'tell app "System Events" to display dialog "Enter the computer name:" default answer "cgdm-" buttons {"OK"} default button 1
# return text returned of result')
# echo $computerName

computerName=$(/usr/bin/osascript<<EOL
tell application "Self Service"
activate
set answer to text returned of (display dialog "Set Computer Name" default answer "cgdm-")
end
EOL)
echo $computerName

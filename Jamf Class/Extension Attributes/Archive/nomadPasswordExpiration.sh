#!/bin/bash

#nomadPasswordExpiration.sh
#By Greg Dunaway
#7-24-2020

loggedInUser=$(python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");')
userPreferences="/Users/$loggedInUser/Library/Preferences"

if [[ -f "$userPreferences/com.trusourcelabs.ucar-nomad.plist" ]]; then
  LastPasswordExpireDate=$(defaults read "$userPreferences/com.trusourcelabs.ucar-nomad.plist" LastPasswordExpireDate | cut -f 1-2 -d " ")
elif [[ -f "$userPreferences/com.trusourcelabs.NoMAD.plist" ]]; then
  LastPasswordExpireDate=$(defaults read "$userPreferences/com.trusourcelabs.NoMAD.plist" LastPasswordExpireDate | cut -f 1-2 -d " ")
else
  echo "<result>Unknown</result>"
  exit 0
fi

echo "<result>$LastPasswordExpireDate</result>"
exit 0

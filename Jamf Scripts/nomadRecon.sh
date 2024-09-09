#!/bin/bash

#nomadRecon.sh
#Greg Dunaway 8/25/20
#Check NoMAD values and report to Jamf
#Missing attributes, will need to use dscl when Active Directory is reachable
#-phone
#-position
#-department
#-building
#-room

loggedInUser=$(python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");')
userPreferences="/Users/$loggedInUser/Library/Preferences"

if [[ -f "$userPreferences/com.trusourcelabs.ucar-nomad.plist" ]]; then
  plist="$userPreferences/com.trusourcelabs.ucar-nomad.plist"
elif [[ -f "$userPreferences/com.trusourcelabs.NoMAD.plist" ]]; then
  plist="$userPreferences/com.trusourcelabs.NoMAD.plist"
else
  echo "NoMAD not configured"
  exit 1
fi

fullName=$(defaults read $plist DisplayName)
emailAddress=$(defaults read $plist UserEmail)

jamf recon -endUsername "$loggedInUser" -realname "$fullName" -email "$emailAddress" -ldapServerID $4

exit 0

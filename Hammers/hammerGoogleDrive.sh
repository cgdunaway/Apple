#!/bin/bash

#hammerGoogleDrive.sh
#By Greg Dunaway

loggedInUser=$(/usr/bin/python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");')

rm -r "/Applications/Google Drive"
rm -r "/Library/Application Support/Google/DriveFS"
rm -r "/Library/Preferences/com.google.drivefs"
rm -r "/Users/$loggedInUser/Library/Application Support/Google/Drive"
rm -r "/Users/$loggedInUser/Library/Preferences/com.google.drivefs"
rm -r "/Users/$loggedInUser/Library/Preferences/com.google.GoogleDrive"
rm -r "/Users/$loggedInUser/Library/Containers/com.google.drivefs"
rm -r "/Users/$loggedInUser/Library/Containers/com.google.GoogleDrive"

echo "Done."

exit

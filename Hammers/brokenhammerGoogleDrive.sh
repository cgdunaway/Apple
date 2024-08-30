#!/bin/bash

#hammerGoogleDrive.sh
#By Greg Dunaway

loggedInUser=$(/usr/bin/python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");')
OLDIFS=$IFS
IFS=$(echo -e "\n")

TARGET="/Applications/Google Drive
/Library/Application Support/Google/DriveFS
/Library/Preferences/com.google.drivefs
/Users/$loggedInUser/Library/Application Support/Google/Drive
/Users/$loggedInUser/Library/Preferences/com.google.drivefs
/Users/$loggedInUser/Library/Preferences/com.google.GoogleDrive
/Users/$loggedInUser/Library/Containers/com.google.drivefs
/Users/$loggedInUser/Library/Containers/com.google.GoogleDrive"

echo "logged in as $loggedInUser"

for i in $TARGET; do
  echo $i
  #rm -r "$i"*".old" #2> /dev/null
  #mv "$i"* ".old" #2> /dev/null
done

#rm -r "/Users/gdunaway/Library/Preferences/com.google.GoogleDrive"*".old"

#would be nice to do another loop and confirm there are no matching files

IFS=$OLDIFS

echo "Done."

exit

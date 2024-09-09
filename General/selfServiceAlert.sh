#!/bin/bash

#selfServiceAlert.sh
#Sets the Self Service notification type to Alert in the current user's preferences
#by Greg Dunaway

#Count the number of apps in the notifications preference pane
#count=$(/usr/libexec/PlistBuddy -c "Print :apps" "$HOME/Library/Preferences/com.apple.ncprefs.plist" | grep -c "bundle-id")'

#Check the position of the Self Service bundle-id in the list of app bundle-ids
selfServiceID=$(/usr/libexec/PlistBuddy -c "Print :apps" "$HOME/Library/Preferences/com.apple.ncprefs.plist" | grep -a "bundle-id" | awk '1;/com.jamfsoftware.selfservice.mac/{exit}' | grep -c "bundle-id")
#Subtract one from the Self Service position due to the index starting with 0
selfServiceIndex=`expr $selfServiceID - 1`

#Set the Self Service flag for Alert style (this is different for every application and requires checking flags for each app)
/usr/libexec/PlistBuddy -c "Set :apps:$selfServiceIndex:flags 8278" "$HOME/Library/Preferences/com.apple.ncprefs.plist"

killall cfprefsd
killall sighup usernoted
killall sighup NotificationCenter

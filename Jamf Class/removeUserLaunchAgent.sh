#!/bin/bash

#removeSystemLaunchAgents.sh

#get current logged in user
loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`

#jamf parameter, name of LaunchAgent
launchAgent="$4"

rm /Users/$loggedInUser/Library/LaunchAgents/$launchAgent

exit 0

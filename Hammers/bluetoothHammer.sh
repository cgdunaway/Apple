#!/bin/bash

#bluetoothHammer.sh
#By Greg Dunaway

loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`

rm /Library/Preferences/com.apple.Bluetooth*

rm /Users/$loggedInUser/com.apple.Bluetooth*

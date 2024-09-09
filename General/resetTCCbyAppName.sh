#!/bin/bash

#resetTCCbyAppName.sh
#This script will reset ALL (Camera, Microphone, ScreenCapture, and anything else listed in Privacy) access for the app whose name (as it appears in /Applications, .app not necessary but ok) is entered in the Jamf parameter

appName="$4"
bundleID=`osascript -e 'id of app "$appName"'`

if [[ -z "$appName" ]]; then
  echo "Error. No app name specified."
  exit 1
elif osascript -e 'id of app "$appName"'; then
  bundleID=`osascript -e 'id of app "$appName"'`
  tccutil reset All "$bundleID"
else
  echo "Error. BundleID couldn't be found."
  exit 2
fi

exit 0

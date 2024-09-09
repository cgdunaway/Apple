#!/bin/bash

#resetTCCbyBundleID.sh
#This script will reset ALL (Camera, Microphone, ScreenCapture, and anything else listed in Privacy) access for the app whose Bundle ID is entered in the Jamf parameter

bundleID="$4"

if [[ -z "$bundleID" ]]; then
  echo "Error. No BundleID specified."
  exit 1
else
  tccutil reset All "$bundleID"
fi

exit 0

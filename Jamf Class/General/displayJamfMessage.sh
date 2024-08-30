#!/bin/bash

# displayMessage.sh
# A basic script for custom pop-up windows using jamfHelper
# By Greg Dunaway

jamfHelper="/Library/Application Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper"

"$jamfHelper" \
-windowType "$4" \
-windowPosition "$5" \
-title "$6" \
-heading "$7" \
-description "$8" \
-icon "$9" \
-button1 "${10}" \
-alignDescription natural \
-alignHeading natural \

#!/bin/bash

# Displays a dialog to the end user with a five minute countdown. If the countdown reaches 0:00 or the user clicks the button, the dialog disappears allowing the remainder of the workflow to proceed.

"/Library/Application Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper" \
-windowType utility \
-timeout 20 \
-countdown

exit 0

#!/bin/bash
#Find default browser
open -n https://people.ucar.edu
open https://www.cgd.ucar.edu/systems/space/
open https://calldb.cgd.ucar.edu/calldb/
#Exit terminal window after executing command
osascript -e 'tell application "Terminal" to close front window' > /dev/null 2>&1 &

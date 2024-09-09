#!/bin/bash

#remotehostsync.sh
#by Greg Dunaway

#Initiate restore from remote machine

#prompt user ok
#osascript -e 'display dialog ""'

#Prompt for remote hostname
rhostname=$(osascript<<EOL
display dialog "Enter the hostname of the remote system:" default answer ""
set rhostname to text returned of result
EOL)
#Prompt for remote username
rusername=$(osascript<<EOL
display dialog "Enter the owner's username:" default answer ""
set username to text returned of result
EOL)
#Prompt for authentication username
ausername=$(osascript<<EOL
display dialog "Enter the owner's username:" default answer ""
set username to text returned of result
EOL)
# rootpass=$(osascript<<EOL
# display dialog "Enter the root password:" with hidden answer default answer ""
# set rootpass to text returned of result
# EOL)
ping -c 1 -t 1 $rhostname >> /dev/null
if [[ $? == 0 ]]; then
  caffeinate -dims &
  caffeinate -i rsync -avrP --exclude="/Users/$rusername/Library" "$ausername@$rhostname:/Users/$rusername/" "/Users/$rusername.bak"
  killall caffeinate
else
  osascript -e 'display dialog "Host could not be reached. (ping failed)"'
fi

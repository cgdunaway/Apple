#!/bin/zsh

# updateUserAssignment.sh
# A script to fix out-of-date device User & Location data in Jamf.
# Username of the current logged in user will be filtered and passed to Jamf recon.

# Relies on enabling LDAP lookups for JSS
# JSS > Settings > Computer Management > Inventory Collection > Enable "Collect user and location information from Directory Service"

# Jamf Parameter 4: Username filter with regex, already filtered: (root|ral-.*|.*admin.*|.*adm.*|local|_mbsetupser|reboot|shutdown|local|.*setup.*|fadmin|boss|.*root.*)

username=$(scutil <<< "show State:/Users/ConsoleUser" | awk '/Name :/ && ! /loginwindow/ { print $3 }')
echo "Active user: $username"

# Standard filter
if [[ "$username" =~ ^(root|ral-.*|.*admin.*|.*adm.*|local|_mbsetupser|reboot|shutdown|local|.*setup.*|fadmin|boss|.*root.*)$ ]]; then
  echo "$username is not an end user... exiting"
  exit 1
# Use a Jamf parameter to allow custom filtering of accounts based on site.
elif [[ "$username" =~ ^($4)$ ]]; then
  echo "$username was in the custom filter... exiting"
  exit 1
elif [ -z "$username" ]; then
  echo "No user is logged in... exiting"
  exit 1
else
  echo "Assigning $HOSTNAME to $username"
  /usr/local/bin/jamf recon -endUsername $username
fi

exit 0

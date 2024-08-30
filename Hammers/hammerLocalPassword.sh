#!/bin/bash
#Check what systems are locally cached
cachedUser=$(dscl . -list /Users AuthenticationAuthority | grep -m 1 LocalCachedUser | awk '{print $1}')
echo $cachedUser
#Remove the account in question (can do it when logged in as that user)
dscl . -delete /Users/$cachedUser
#Recreate the mobile user (can do when logged in as user):
/System/Library/CoreServices/ManagedClient.app/Contents/Resources/createmobileaccount -P -v -n $cachedUser
#Prompt appears
exit
reboot

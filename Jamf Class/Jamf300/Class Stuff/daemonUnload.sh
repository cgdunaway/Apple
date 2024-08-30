#!/bin/bash

#look for loaded daemon and if it's there, unload it
#this is the pre-install script
if (launchctl list | grep updateManagementFramework); then
	/bin/echo "the daemon is loaded"
	/bin/launchctl unload /Library/LaunchDaemons/updateManagementFramework.plist
	/bin/rm /Library/LaunchDaemons/updateManagementFramework.plist
fi

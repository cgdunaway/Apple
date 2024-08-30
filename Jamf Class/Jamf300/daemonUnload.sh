#!/bin/bash

#Look for loaded daemon and if it's there, unload it

if (/bin/launchctl list | grep "updateManagementFramework"); then
	/bin/echo "The daemon is loaded. Unloading..."
	/bin/launchctl unload /Library/LaunchDaemons/updateManagementFramework.plist
	/bin/echo "The daemon has been unloaded."
	else
		/bin/echo "The daemon is not loaded."
fi

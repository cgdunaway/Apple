#!/bin/bash

#remove and unload any previos version of the same daemon
if (/bin/launchctl list | grep lesson17Task4); then
	/bin/launchctl unload /Library/LaunchDaemons/lesson17Task4.plist
	/bin/rm /Library/LaunchDaemons/lesson17Task4.plist
fi

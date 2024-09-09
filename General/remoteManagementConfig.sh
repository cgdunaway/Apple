#!/bin/bash

#remoteManagementConfig
#Allows the "Administrator" user control via Apple Remote Desktop
#Greg Dunaway

privs="-DeleteFiles -ControlObserve -TextMessages -OpenQuitApps -GenerateReports -RestartShutDown -SendFiles -ChangeSettings"
targetUsername="Administrator"

/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -configure -access -on -privs $privs -users $targetUsername
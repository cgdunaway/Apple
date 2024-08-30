#!/bin/bash

loggedInUser=$(/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }')

rm -r "/Applications/VMware Fusion.app"
rm -r "/Library/Application Support/VMware"
rm -r "/Library/Application Support/VMware Fusion"
rm -r "/Library/Preferences/VMware Fusion"
rm -r "/Users/gdunaway/Library/Application Support/VMware Fusion"
rm -r "/Users/gdunaway/Library/Caches/com.vmware.fusion"
rm -r "/Users/gdunaway/Library/Preferences/VMware Fusion"
rm -r "/Users/gdunaway/Library/Preferences/com.vmware.fusion.LSSharedFileList.plist"
rm -r "/Users/gdunaway/Library/Preferences/com.vmware.fusion.plist"
rm -r "/Users/gdunaway/Library/Preferences/com.vmware.fusion.plist.lockfile"
rm -r "/Users/gdunaway/Library/Preferences/com.vmware.fusionDaemon.plist"
rm -r "/Users/gdunaway/Library/Preferences/com.vmware.fusionDaemon.plist.lockfile"
rm -r "/Users/gdunaway/Library/Preferences/com.vmware.fusionStartMenu.plist"
rm -r "/Users/gdunaway/Library/Preferences/com.vmware.fusionStartMenu.plist.lockfile"

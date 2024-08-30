#!/bin/bash

lastReboot=`date -jf "%s" "$(sysctl kern.boottime | awk -F'[= |,]' '{print $6}')" +"%Y-%m-%d %T"`

echo "<result>"$lastReboot"</result>"

exit 0

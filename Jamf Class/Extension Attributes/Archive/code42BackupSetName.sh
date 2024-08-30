#!/bin/zsh

# A script to report CrashPlan Backup Set Name
# The extension attribute will result in 3 potential values depending on what's found:
# No Backup Found:
#   No backup found.
# <Computer Name as reported in CrashPlan>:
#   The computer name that CrashPlan reports in the web console.
# Not Installed:
#   CrashPlan is not installed.

# CrashPlan Application Path
CrashPlanPath="/Applications/Code42.app"

# Check if CrashPlan is installed before anything else
if [[ ! -d "$CrashPlanPath" ]]; then
    echo "<result>Not Installed</result>"
    exit 0
fi

# Sets value of CrashPlan Application Log
CrashPlanAppLog="/Library/Logs/CrashPlan/app.log"

# Checks app.log for Backup Set Name and reports it
if [ -f "$CrashPlanAppLog" ]; then
    CrashPlanBackupName="$(/usr/bin/awk -F,  '/COMPUTERS/{getline; gsub(/^[ \t]+|[ \t]+$/,"",$2);  print $2}' "$CrashPlanAppLog")"

    if [ "$CrashPlanBackupName" = "" ]; then
        CrashPlanBackupName="No Backup Name Found"
    fi
else
    CrashPlanBackupName="No Backup Name Found"
fi

echo "<result>${CrashPlanBackupName}</result>"

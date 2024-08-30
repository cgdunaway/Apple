#!/bin/zsh

# An extension attribute script to report the last completed backup date by CrashPlan
# Defaults to an empty string "" if backup has never completed

# Sets location of all CrashPlan History Logs
CrashPlanLogs=$(/bin/ls /Library/Logs/CrashPlan/history.log*)

# Runs a loop to check CrashPlan history logs for the date and time of most recent Completed Backup
# If found, converts the date format, and reports it.
# If no completed backup is found, it goes to a previous log.
# If no completed backup is found, it defaults to ""

for LINE in $CrashPlanLogs; do
    CrashPlanDate=$(/usr/bin/awk '/Completed\ backup/{print $2, $3}' $LINE | /usr/bin/tail -n1)

    if [ -z "$CrashPlanDate" ]; then
        CrashPlanResult=""
        continue
    else
        CrashPlanResult=$(/bin/date -j -f "%m/%d/%y %l:%M%p" "$CrashPlanDate" "+%Y-%m-%d %k:%M:%S")
        break
    fi
done

echo "<result>${CrashPlanResult}</result>"

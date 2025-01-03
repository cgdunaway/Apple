#!/bin/bash

#translocate.sh

#DIY alectrona migrator; rsync and the good stuff
#Pieces taken from erase-install: check power, check storage?, prompts?

#rsync sections





# -----------------------------------------------------------------------------
# Check if device is on battery or AC power.
# If not, and our power_wait_timer is above 1, allow user to connect to power
# for the specified time period.
# Acknowledgements: https://github.com/kc9wwh/macOSUpgrade/blob/master/macOSUpgrade.sh
# -----------------------------------------------------------------------------
check_power_status() {
    # default power_wait_timer to 60 seconds
    [[ ! $power_wait_timer ]] && power_wait_timer=60

    power_wait_timer_friendly=$( printf '%02dh:%02dm:%02ds\n' $((power_wait_timer/3600)) $((power_wait_timer%3600/60)) $((power_wait_timer%60)) )

    if /usr/bin/pmset -g ps | /usr/bin/grep "AC Power" > /dev/null ; then
        echo "   [check_power_status] OK - AC power detected"
    else
        echo "   [check_power_status] WARNING - No AC power detected"
        if [[ "$power_wait_timer" -gt 0 ]]; then
            if [[ -f "$jamfHelper" ]]; then
                # use jamfHelper if possible
                "$jamfHelper" -windowType "utility" -title "${!dialog_power_title}" -description "${!dialog_power_desc} ${power_wait_timer_friendly}" -alignDescription "left" -icon "$dialog_confirmation_icon" &
                wait_for_power "jamfHelper"
            else
                # open_osascript_dialog syntax: title, message, button1, icon
                open_osascript_dialog "${!dialog_power_title}" "${!dialog_power_desc}  ${power_wait_timer_friendly}" "OK" stop &
                wait_for_power "osascript"
            fi
        else
            echo "   [check_power_status] ERROR - No AC power detected after ${power_wait_timer_friendly}, cannot continue."
            exit 1
        fi
    fi
}

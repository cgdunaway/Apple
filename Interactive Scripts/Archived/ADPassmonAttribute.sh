#!/bin/bash
# Capture the Active Directory user name of the Computer's primary user
jssUser=$(dscl . -readall /Users|sed '/admin/d'|grep -A 20 @CIT.UCAR|grep RecordName|cut -d' ' -f2)

# Capture the Days Until Password Expiration (AS reported by ADPassMon)
expireDays=$(defaults read /Users/$jssUser/Library/Preferences/org.pmbuko.ADPassMon.plist menu_title)

# Returns true if any value is returned, false if null
if [[ "$expireDays" ]]; then
    echo "<result>$jssUser: $expireDays</result>"
else
    echo "<result>Not Reported</result>"
fi

exit 0

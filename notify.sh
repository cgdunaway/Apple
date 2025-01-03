#!/bin/zsh

# Jamf Connect Notify script
# Based on https://github.com/jamf/jamfconnect/blob/main/scripts/Notify/Jamf-Connect-Notify-Script.sh
# Edited by Greg Dunaway 3/20/24

# This script can be deployed to a computer via a prestage enrollment package
# The script must be located in a directory which has execute permissions
# The script file must have execute permissions for the root user (700)
# We recommend that the script owner be set to root:wheel

### VARIABLES #######################################################################################
# Set the location of the control file
controlFile="/var/tmp/depnotify.log"
# Expected location of the Jamf binary
jamfBinary="/usr/local/bin/jamf"
# Branding
orgName="NSF NCAR|UCAR"
# Required apps
REQUIRED_POLICIES=()


### FUNCTIONS #######################################################################################
# Helper function to manage array
function addpolicy () {
	REQUIRED_POLICIES+=($1)
}

# Call this function with 3 arguments: Application Directory, "Name", and "Custom Jamf Policy Event"
function appcheck () {
	if [[ -e $1 ]]; then
		echo "$1 is already installed"
	else
		string="Installing $2...,$3"
		addpolicy $string
	fi
}


### INITIAL CHECKS #######################################################################################
# Wait until the Jamf Binary is downloaded and installed
until [ -f "$jamfBinary" ]
do
	echo "Status: Waiting on Jamf Pro agent install" >> "$controlFile"
	sleep 2
done

# Wait until Jamf Self Service is downloaded and installed
until [ -f "/Applications/Self Service.app/Contents/Resources/AppIcon.icns" ]
do
	echo "Status: Installing Jamf Self Service..." >> "$controlFile"
	sleep 2
done


### BEGIN NOTIFY #######################################################################################
echo "Command: MainTitle: Welcome to $orgName!" >> "$controlFile"
echo "Command: MainText: Welcome to your new Mac.\\nSit tight as we do some basic setup. You can see the status of the setup on the progress bar below." >> "$controlFile"
echo "Command: Image: /Applications/Self Service.app/Contents/Resources/AppIcon.icns" >> "$controlFile"
echo "Status: Installing Jamf..." >> "$controlFile"

# Check if necessary profiles exist: Alectrona, Filevault, swiftDialog
profilesString=$(profiles show | grep "attribute: name:" | awk -F ': ' '{print $3}')
n=0
echo "Waiting for profiles..."
until [[ $profilesString == *"Alectrona"* ]] && [[ $profilesString == *"Filevault"* ]] && [[ $profilesString == *"swiftDialog"* ]]; do
	sleep 3
	((n++))
	if [[ $n == 10 ]]; then
		echo "Profiles not found"
		exit 1
	fi
done
echo "Profiles installed"

# More than one policy can be triggered by one trigger event.  Policies will be
# run in alpha numeric order as they are named.  For example, a policy named
###  10 - Install Essential Software
# will run before a policy named
###  20 - Install Even More Essential Software
# if both policies run on a custom trigger named "OnboardingEssentials"

#### NOTE NOTE NOTE We should install Alectrona, THEN Install Jamf Connect, Rosetta, VPN, Cortex 

appcheck /usr/local/bin/apatch "Alectrona Patch" "eg-install-alectrona"
appcheck /Applications/GlobalProtect.app "GlobalProtect VPN" "pg-install-globalprotect"
appcheck /usr/local/bin/dialog "swiftDialog" "pg-install-swiftdialog"
# GLPI - Can't install here, need hostname
# Cortex XDR - Can't install here, need hostname
# Crashplan - Can't install here, need hostname
echo ${REQUIRED_POLICIES[*]}

# Checking policy array and adding the count to Notify, borrowed from CGD-DEPNotify
ARRAY_LENGTH="$((${#REQUIRED_POLICIES[@]}))"
echo "Command: Determinate: $ARRAY_LENGTH"
echo "Command: Determinate: $ARRAY_LENGTH" >> "$controlFile"

# Call policies with messages
for POLICY in "${REQUIRED_POLICIES[@]}"; do
	 echo "Status: $(echo "$POLICY" | cut -d ',' -f1)" >> "$controlFile"
	 echo $POLICY
 	 $jamfBinary policy "-event" "$(echo "$POLICY" | cut -d ',' -f2)"
 done



# Once your onboarding is complete, it is best practice to disable the notify
# screen from appearing at every login

# Disable notify screen from loginwindow process
/usr/local/bin/authchanger -reset -JamfConnect

# Close the notify screen and continue the loginwindow process.  The user will
# now start their first macOS user session
echo "Command: Quit" >> "$controlFile"

# The notify screen will read all of the commands in a control file when it
# launches. Therefore, in case you ever need to use the notify screen on the
# same computer again, it's best to clean up after ourselves and delete the
# control file.

rm -rf "$controlFile"

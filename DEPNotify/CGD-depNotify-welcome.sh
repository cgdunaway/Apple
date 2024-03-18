#!/bin/bash

#Greg Dunaway 5/20/21

#This script could be smoother by disabling Window Animations temporarily. See comments below.
#Run the following command as current user
#defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool NO
#Should read the value first then reset it accordingly


# Remove LaunchAgent that was put in place by initial DEPNotify script
rm /Library/LaunchAgents/com.depnotify.CGDwelcome.plist

jamf policy -event dockSelfService

#Required DEPNotify variables
DEP_NOTIFY_APP="/Applications/Utilities/DEPNotify.app"
DEP_NOTIFY_LOG="/var/tmp/depnotify.log"
DEP_NOTIFY_DEBUG="/var/tmp/depnotifyDebug.log"
DEP_NOTIFY_DONE="/var/tmp/com.depnotify.provisioning.done"

#The following sections will repeat for every screen that will displayed
#-----------------------------------------------------------------------
#Set configuration for GlobalProtect DEPNotify window
BANNER_IMAGE_PATH="/Applications/GlobalProtect.app/Contents/Resources/PanMSAgent.icns"
BANNER_TITLE="GlobalProtect VPN"
MAIN_TEXT="Launch GlobalProtect and click on the globe icon in your menubar. Sign in with your CIT credentials, authenticate with DUO, and you’ll be connected to our internal services. When you login a 24-hour key will be stored so you can easily reconnect."
#Apply configuration for the next DEPNotify window
echo "Command: Image: $BANNER_IMAGE_PATH" >> "$DEP_NOTIFY_LOG"
echo "Command: MainTitle: $BANNER_TITLE" >> "$DEP_NOTIFY_LOG"
echo "Command: MainText: $MAIN_TEXT" >> "$DEP_NOTIFY_LOG"
echo "Command: ContinueButton: Next" >> "$DEP_NOTIFY_LOG"
#Set behavior for DEPNotify progress Bar
echo "Command: DeterminateOff:" >> "$DEP_NOTIFY_LOG"
echo "Command: DeterminateOffReset:" >> "$DEP_NOTIFY_LOG"
echo "Command: DeterminateManual: 4" >> "$DEP_NOTIFY_LOG"
echo "Command: DeterminateManualStep: 1" >> "$DEP_NOTIFY_LOG"
echo "Status: 1 of 4" >> "$DEP_NOTIFY_LOG"
#Open new DEPNotify window and wait until user presses the button
sudo open -a "$DEP_NOTIFY_APP" --args -path "$DEP_NOTIFY_LOG"
pid=$(pgrep -l "DEPNotify" | cut -d' ' -f1)
while kill -0 $pid 2> /dev/null; do
  wait
done
sleep 1

#Set configuration for NoMAD DEPNotify window
BANNER_IMAGE_PATH="/Applications/NoMAD.app/Contents/Resources/AppIcon.icns"
BANNER_TITLE="Manage your CIT Credentials with NoMAD"
MAIN_TEXT="NoMAD is a tool to check the status of your CIT account, change your CIT password, and more. It appears in your menubar as a triangle with dots at the points and a check mark if you are signed in. In order to sign in you will need to be on an internal UCAR network or connected to the VPN."
#Apply configuration for the next DEPNotify window
echo "Command: Image: $BANNER_IMAGE_PATH" >> "$DEP_NOTIFY_LOG"
echo "Command: MainTitle: $BANNER_TITLE" >> "$DEP_NOTIFY_LOG"
echo "Command: MainText: $MAIN_TEXT" >> "$DEP_NOTIFY_LOG"
echo "Command: ContinueButton: Next" >> "$DEP_NOTIFY_LOG"
#Set behavior for DEPNotify progress Bar
echo "Command: DeterminateOff:" >> "$DEP_NOTIFY_LOG"
echo "Command: DeterminateOffReset:" >> "$DEP_NOTIFY_LOG"
echo "Command: DeterminateManual: 4" >> "$DEP_NOTIFY_LOG"
echo "Command: DeterminateManualStep: 2" >> "$DEP_NOTIFY_LOG"
echo "Status: 2 of 4" >> "$DEP_NOTIFY_LOG"
#Open new DEPNotify window and wait until user presses the button
sudo open -a "$DEP_NOTIFY_APP" --args -path "$DEP_NOTIFY_LOG"
pid=$(pgrep -l "DEPNotify" | cut -d' ' -f1)
while kill -0 $pid 2> /dev/null; do
  wait
done
sleep 1

#Set configuration for Code42 DEPNotify window
BANNER_IMAGE_PATH="/Applications/CrashPlan.app/Contents/Resources/icon.icns"
BANNER_TITLE="Backups with CrashPlan"
MAIN_TEXT="CrashPlan is our mandatory backup solution. We use these backups to ensure important work-related data isn’t lost from your system. This device should automatically begin backing up data to our servers. You can check on the status of your device and restore files by clicking the C icon in your menubar."
#Apply configuration for the next DEPNotify window
echo "Command: Image: $BANNER_IMAGE_PATH" >> "$DEP_NOTIFY_LOG"
echo "Command: MainTitle: $BANNER_TITLE" >> "$DEP_NOTIFY_LOG"
echo "Command: MainText: $MAIN_TEXT" >> "$DEP_NOTIFY_LOG"
echo "Command: ContinueButton: Next" >> "$DEP_NOTIFY_LOG"
#Set behavior for DEPNotify progress Bar
echo "Command: DeterminateOff:" >> "$DEP_NOTIFY_LOG"
echo "Command: DeterminateOffReset:" >> "$DEP_NOTIFY_LOG"
echo "Command: DeterminateManual: 4" >> "$DEP_NOTIFY_LOG"
echo "Command: DeterminateManualStep: 3" >> "$DEP_NOTIFY_LOG"
echo "Status: 3 of 4" >>"$DEP_NOTIFY_LOG"
#Open new DEPNotify window and wait until user presses the button
sudo open -a "$DEP_NOTIFY_APP" --args -path "$DEP_NOTIFY_LOG"
pid=$(pgrep -l "DEPNotify" | cut -d' ' -f1)
while kill -0 $pid 2> /dev/null; do
  wait
done
sleep 1

#Set configuration for Self Service DEPNotify window
BANNER_IMAGE_PATH="/Applications/Self Service.app/Contents/Resources/AppIcon.icns"
BANNER_TITLE="Self Service"
MAIN_TEXT="Your account isn't an administrator account. You’ll notice an application called Self Service with the NCAR/UCAR logo as an icon. This app is where you can install pre-approved applications, temporarily enable administrator privileges, and other useful things. If you find something amiss, or need any IT help, please let us know! Email help@ucar.edu and we will assist you. Best wishes, IT"
#Apply configuration for the next DEPNotify window
echo "Command: Image: $BANNER_IMAGE_PATH" >> "$DEP_NOTIFY_LOG"
echo "Command: MainTitle: $BANNER_TITLE" >> "$DEP_NOTIFY_LOG"
echo "Command: MainText: $MAIN_TEXT" >> "$DEP_NOTIFY_LOG"
echo "Command: ContinueButton: Next" >> "$DEP_NOTIFY_LOG"
#Set behavior for DEPNotify progress Bar
echo "Command: DeterminateOff:" >> "$DEP_NOTIFY_LOG"
echo "Command: DeterminateOffReset:" >> "$DEP_NOTIFY_LOG"
echo "Command: DeterminateManual: 4" >> "$DEP_NOTIFY_LOG"
echo "Command: DeterminateManualStep: 4" >> "$DEP_NOTIFY_LOG"
echo "Status: 4 of 4" >>"$DEP_NOTIFY_LOG"
#Open new DEPNotify window and wait until user presses the button
sudo open -a "$DEP_NOTIFY_APP" --args -path "$DEP_NOTIFY_LOG"
pid=$(pgrep -l "DEPNotify" | cut -d' ' -f1)
while kill -0 $pid 2> /dev/null; do
  wait
done
sleep 1

# #Set configuration for Wiki window
# BANNER_IMAGE_PATH="/Applications/Self Service.app/Contents/Resources/AppIcon.icns"
# BANNER_TITLE="Wiki"
# MAIN_TEXT=""
# #Apply configuration for the next DEPNotify window
# echo "Command: Image: $BANNER_IMAGE_PATH" >> "$DEP_NOTIFY_LOG"
# echo "Command: MainTitle: $BANNER_TITLE" >> "$DEP_NOTIFY_LOG"
# echo "Command: MainText: $MAIN_TEXT" >> "$DEP_NOTIFY_LOG"
# echo "Command: ContinueButton: Done" >> "$DEP_NOTIFY_LOG"
# echo "Command: Website: https://wiki.ucar.edu/display/cgdisg/CGD+Workstation+Setup" >> "$DEP_NOTIFY_LOG"
# #Set behavior for DEPNotify progress Bar
# echo "Command: DeterminateOff:" >> "$DEP_NOTIFY_LOG"
# echo "Command: DeterminateOffReset:" >> "$DEP_NOTIFY_LOG"
# #Open new DEPNotify window and wait until user presses the button
# open -jga "/Applications/Safari.app" "https://wiki.ucar.edu/spaces/flyingpdf/pdfpageexport.action?pageId=450101532"
# pid=$(pgrep -l "DEPNotify" | cut -d' ' -f1)
# while kill -0 $pid 2> /dev/null; do
#   wait
# done
# sleep 1


#-----------------------------------------------------------------------


jamf recon

exit 0

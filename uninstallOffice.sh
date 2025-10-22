#!/bin/zsh

# uninstallOffice.sh
# By Greg Dunaway
# Following Microsofts recommendations here:
# https://support.microsoft.com/en-us/office/troubleshoot-office-for-mac-issues-by-completely-uninstalling-before-you-reinstall-ec3aa66e-6a76-451f-9d35-cba2e14e94c0

# Get current user
currentUser="test"

# Apps
rm -rf /Applications/Microsoft\ Excel.app 2>/dev/null
rm -rf /Applications/Microsoft\ OneNote.app 2>/dev/null
rm -rf /Applications/Microsoft\ PowerPoint.app 2>/dev/null
rm -rf /Applications/Microsoft\ Word.app 2>/dev/null

# Library Files
rm /Library/LaunchDaemons/com.microsoft.office.licensingV2.helper.plist 2>/dev/null
rm /Library/LaunchDaemons/com.microsoft.autoupdate.helper.plist 2>/dev/null
rm /Library/LaunchDaemons/com.microsoft.onedriveupdaterdaemon.plist 2>/dev/null
rm /Library/LaunchAgents/com.microsoft.update.agent.plist 2>/dev/null
rm /Library/PrivilegedHelperTools/com.microsoft.office.licensingV2.helper 2>/dev/null
rm /Library/PrivilegedHelperTools/com.microsoft.autoupdate.helper 2>/dev/null
rm /Library/Preferences/com.microsoft.office.licensingV2.* 2>/dev/null

# User Library Files
rm /Users/$currentUser/Library/Containers/com.microsoft.errorreporting 2>/dev/null
rm /Users/$currentUser/Library/Containers/com.microsoft.Excel 2>/dev/null
rm /Users/$currentUser/Library/Containers/com.microsoft.netlib.shipassertprocess 2>/dev/null
rm /Users/$currentUser/Library/Containers/com.microsoft.Office365ServiceV2 2>/dev/null
rm /Users/$currentUser/Library/Containers/com.microsoft.onedrive.findersync 2>/dev/null
rm /Users/$currentUser/Library/Containers/com.microsoft.Outlook 2>/dev/null
rm /Users/$currentUser/Library/Containers/com.microsoft.Powerpoint 2>/dev/null
rm /Users/$currentUser/Library/Containers/com.microsoft.RMS-XPCService 2>/dev/null
rm /Users/$currentUser/Library/Containers/com.microsoft.Word 2>/dev/null
rm /Users/$currentUser/Library/Containers/com.microsoft.onenote.mac 2>/dev/null
rm /Users/$currentUser/Library/Cookies/com.microsoft.onedrive.binarycookies 2>/dev/null
rm /Users/$currentUser/Library/Cookies/com.microsoft.onedriveupdater.binarycookies 2>/dev/null
rm /Users/$currentUser/Library/Group\ Containers/UBF8T346G9.ms 2>/dev/null
rm /Users/$currentUser/Library/Group\ Containers/UBF8T346G9.Office 2>/dev/null
rm /Users/$currentUser/Library/Group\ Containers/UBF8T346G9.OfficeOneDriveSyncIntegration 2>/dev/null
rm /Users/$currentUser/Library/Group\ Containers/UBF8T346G9.OfficeOsfWebHost 2>/dev/null
rm /Users/$currentUser/Library/Group\ Containers/UBF8T346G9.OneDriveStandaloneSuite 2>/dev/null

# Saved Application State
rm -rf /Users/$currentUser/Library/Saved\ Application\ State/com.microsoft.* 2>/dev/null


echo "Microsoft Office files have been removed"

#!/bin/bash
TARGET=~/Desktop/com.microsoft.autoupdate2.plist
defaults write "$TARGET" AcknowledgedDataCollectionPolicy RequiredDataOnly
defaults write "$TARGET" Applications -dict "Application ID" XCEL2019 "Application ID" ONMC2019 "Application ID" PPT32019 "Application ID" MSWD2019 "Application ID" MSau04
defaults write "$TARGET" DisableInsiderCheckbox -bool FALSE
defaults write "$TARGET" EnableCheckForUpdatesButton -bool TRUE
defaults write "$TARGET" HowToCheck -string 'AutomaticDownload'
defaults write "$TARGET" SendAllTelemetryEnabled -bool FALSE
defaults write "$TARGET" StartDaemonOnAppLaunch -bool TRUE
defaults write "$TARGET" UpdateCheckFrequency -int 720
/usr/bin/plutil -convert xml1 "$TARGET"

#!/bin/bash
TARGET=~/Desktop/com.microsoft.office.plist
defaults write "$TARGET" ConnectedOfficeExperiencesPreference -bool FALSE
defaults write "$TARGET" OptionalConnectedExperiencesPreference -bool TRUE
defaults write "$TARGET" OfficeExperiencesAnalyzingContentPreference -bool TRUE
defaults write "$TARGET" OfficeExperiencesDownloadingContentPreference -bool TRUE
defaults write "$TARGET" DefaultsToLocalOpenSave -bool TRUE
defaults write "$TARGET" DiagnosticDataTypePreference -string 'ZeroDiagnosticData'
defaults write "$TARGET" InstallOneDrive -bool FALSE
defaults write "$TARGET" InstallOutlook -bool FALSE
defaults write "$TARGET" InstallTeams -bool FALSE
defaults write "$TARGET" OfficeAutoSignIn -bool TRUE
defaults write "$TARGET" SendAllTelemetryEnabled -bool FALSE
defaults write "$TARGET" TermsAccepted1809 -bool TRUE
/usr/bin/plutil -convert xml1 "$TARGET"

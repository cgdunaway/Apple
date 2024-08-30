#!/bin/bash
TARGET=~/Desktop/com.trusourcelabs.NoMAD.plist
defaults write "$TARGET" ADDomain "cit.ucar.edu"
defaults write "$TARGET" DontShowWelcomeDefaultOn -bool true
defaults write "$TARGET" GetHelpOptions mailto:help@cgd.ucar.edu
defaults write "$TARGET" GetHelpType URL
defaults write "$TARGET" HidePrefs -bool true
defaults write "$TARGET" LocalPasswordSync -bool true
defaults write "$TARGET" LocalPasswordSyncDontSyncLocalUsers -array administrator
defaults write "$TARGET" LoginItem -bool true
defaults write "$TARGET" MenuChangePassword "Change CIT Password"
defaults write "$TARGET" MenuHomeDirectory "Mount CGD Home Directory"
defaults write "$TARGET" MenuPasswordExpires "Sign in below"
defaults write "$TARGET" MenuUserName "Manage your CIT"
defaults write "$TARGET" MessageLocalSync "Please provide your local password. This could be an old CIT password. Contact help@cgd.ucar.edu for assistance if needed."
defaults write "$TARGET" MessageNotConnected ""
defaults write "$TARGET" PasswordExpireCustomWarnTime -int 22
defaults write "$TARGET" PasswordExpireCustomAlertTime -int 14
defaults write "$TARGET" PersistExpiration -bool true
defaults write "$TARGET" TitleSignIn "CIT Login"
/usr/bin/plutil -convert xml1 "$TARGET"

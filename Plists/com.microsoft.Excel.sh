#!/bin/bash
TARGET=~/Desktop/com.microsoft.Excel.plist
defaults write "$TARGET" SendAllTelemetryEnabled -bool FALSE
defaults write "$TARGET" SignInOptions -int 2
/usr/bin/plutil -convert xml1 "$TARGET"

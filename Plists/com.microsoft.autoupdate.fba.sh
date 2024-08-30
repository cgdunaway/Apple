#!/bin/bash
TARGET=~/Desktop/com.microsoft.autoupdate.fba.plist
defaults write "$TARGET" SendAllTelemetryEnabled -bool FALSE
/usr/bin/plutil -convert xml1 "$TARGET"

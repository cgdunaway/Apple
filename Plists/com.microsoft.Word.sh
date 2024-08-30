#!/bin/bash
TARGET=~/Desktop/com.microsoft.Word.plist
defaults write "$TARGET" SendAllTelemetryEnabled -bool FALSE
/usr/bin/plutil -convert xml1 "$TARGET"

#!/bin/bash

#curl down the chrome dmg
curl "https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg" -o /tmp/googlechrome.dmg

#attach the dmg so that the user doesn't see it
hdiutil attach -nobrowse /tmp/googlechrome.dmg

#recursively copy the app bundle to the /Applcations folder
cp -R "/Volumes/Google Chrome/Google Chrome.app" /Applications

#detach the volume 
hdiutil detach "/Volumes/Google Chrome"

#remove the dmg
rm /tmp/googlechrome.dmg
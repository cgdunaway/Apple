#!/bin/bash

mv /Library/Preferences/SystemConfiguration/com.apple.airport.preferences.plist com.apple.airport.preferences.plist.old
mv /Library/Preferences/SystemConfiguration/com.apple.network.identification.plist com.apple.network.identification.plist.old
mv /Library/Preferences/SystemConfiguration/com.apple.wifi.message-tracer.plist com.apple.wifi.message-tracer.plist.old
mv /Library/Preferences/SystemConfiguration/NetworkInterfaces.plist NetworkInterfaces.plist.old
mv /Library/Preferences/SystemConfiguration/preferences.plist preferences.plist.old

reboot

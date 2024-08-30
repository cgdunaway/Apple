#!/bin/bash

#deploy a launch daemon with nothing but a script ;)

/bin/cat << EOF > /Library/LaunchDaemons/scripting.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
<key>Label</key>
<string>scripting</string>
<key>ProgramArguments</key>
<array>
<string>open</string>
<string>https://jamfnation.com</string>
</array>
<key>StartInterval</key>
<integer>60</integer>
<key>RunAtLoad</key>
<true/>
</dict>
</plist>
EOF

#set the daemon ownership and permissions
chown root:wheel /Library/LaunchDaemons/scripting.plist
chmod 644 /Library/LaunchDaemons/scripting.plist
launchctl load /Library/LaunchDaemons/scripting.plist
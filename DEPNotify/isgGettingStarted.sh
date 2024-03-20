#!/bin/bash

#isgGettingStarted.sh
#By Greg Dunaway

curl -L -o "/usr/local/sbin/cgdisg/NCARUCAR Rounded Icon.png" 'https://docs.google.com/uc?export=download&id='1oZ6s52Zdvdvu39PBQ5TOGXSxYhHbgjB7

if [[ -e '/var/tmp/com.depnotify.provisioning.done' ]]; then
osascript << EOT
display dialog {"Check out our ISG Quick Sheet for a few tips about our environment:\n\nhttps://www.cgd.ucar.edu/systems/getting-started\n\nPlease contact us with any feedback or questions you have by emailing help@cgd.ucar.edu!\n\nEnjoy your new system! ~ ISG"} \
with title {"Getting Started with ISG"} \
with icon {"/usr/local/sbin/cgdisg/NCARUCAR Rounded Icon.png"} \
buttons {"Open link","Got it!"} \
default button 2
if button returned of result is "Open link" then
        tell application "Safari" to make new document with properties {URL:"https://www.cgd.ucar.edu/systems/getting-started"}
    end if
EOT
else
  echo "System has not completed DEPNotify."
fi


exit

#!/bin/zsh

title="NRIT Onboarding"
button1text="Continue"
defaultArgs="--helpmessage 'Email help@ucar.edu for assistance.' \
"

#Welcome

dialog --title $title \
--message "Welcome to your NCAR Mac supported by NRIT. These prompts will explain the basics of your device.

To begin, select continue." \
--button1text $button1text \
--helpmessage 'Email help@ucar.edu for assistance.'

#Support

dialog --title $title \
--message "Read our getting started page:" \
--webcontent "https://kb.ucar.edu" \
--button1text $button1text \
--helpmessage 'Email help@ucar.edu for assistance.'

#Recommended applications

appSelection=$(dialog --title $title \
--message "We recommend this software because it is commonly used. You may opt-out if you prefer." \
--button1text $button1text \
--jsonfile Prompts/SwiftDialog/onboardingApps.json )

# case word in
#   pattern )
#     ;;
# esac


#Set defaults

#Self Service

dialog --title $title \
--style centered \
--message "Self Service is an application on your Mac. We have a catalog of software available for install." \
--button1text $button1text \
--helpmessage 'Email help@ucar.edu for assistance.'

#Goodbye

dialog --title $title \
--message "That's it!" \
--button1text $button1text \
--helpmessage 'Email help@ucar.edu for assistance.'


open /Applications/Self\ Service.app && open -u 'jamfselfservice://content?action=category&id=3'

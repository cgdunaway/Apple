#!/bin/zsh

#grantSecureToken.sh
#Greg Dunaway 12/30/2020
#Grants current logged in user a secure token via Jamf Policy. Requires admin credentials to be enter

sysadminctl -adminUser adminUsername -adminPassword adminPassword -secureTokenOn receivingUsername -password receivingUsernamePassword

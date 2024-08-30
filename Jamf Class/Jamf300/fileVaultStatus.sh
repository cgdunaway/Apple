#!/bin/bash

fileVaultStatus=$(fdesetup status | awk '/FileVault is/{print $3}' | tr -d .)

if [[ $fileVaultStatus == "Off" ]]; then
	open -a "Self Service"
	jamf displayMessage -message "Please encrypt your computer."
	else
		jamf recon
fi

exit

#!/bin/bash

#install the config profile and then delete it
/usr/bin/profiles -IF /tmp/guestWiFiNetwork.mobileconfig
sleep 3
/bin/rm /tmp/guestWiFiNetwork.mobileconfig
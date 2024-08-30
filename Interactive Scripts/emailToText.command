#!/bin/bash

#emailToText.command

#intro
echo "Enter the phone number you'd like to text:"
#ask for phone number
read -e number
  #may need to cleanup number
echo "You've entered $number"
#list carriers
echo "1	AT&T
2	T-Mobile
3	Verizon
4	Sprint
5	Google Fi (Project Fi)
6 OTHER"

echo "Which carrier does the phone number belong to? (enter number)"
read -e carrier
  #check for number entry
  #prompt if images will be included #use MMS?
  case $carrier in
  1)
    domain="txt.att.net"
    ;;
  2)
    domain="tmomail.net"
    ;;
  3)
    domain="vtext.com"
    ;;
  4)
    domain="messaging.sprintpcs.com"
    ;;
  5)
    domain="msg.fi.google.com"
    ;;
  6)
    domain="OTHER"
    ;;
  esac

if [ "$domain" = "OTHER" ]; then
  echo "Enter the carrier's SMS or MMS domain (no @):"
  read -e domain
fi

#create mailto: link
#https://developer.yoast.com/blog/guide-mailto-links/
mailTo="mailto:$number@$domain"
echo $mailTo
open $mailTo

exit 0

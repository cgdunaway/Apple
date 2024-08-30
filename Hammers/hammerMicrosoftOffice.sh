#!/bin/bash

consoleuser=$(ls -l /dev/console | awk '{ print $3 }')

rm /Applications/Microsoft*
rm /Users/$consoleuser/Library/Containers/com.microsoft*

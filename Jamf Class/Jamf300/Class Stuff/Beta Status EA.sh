#!/bin/bash

betaStatus=$(/System/Library/PrivateFrameworks/Seeding.framework/Resources/seedutil current | awk '/enrolled/{print $NF}')
echo "<result>$betaStatus</result>"

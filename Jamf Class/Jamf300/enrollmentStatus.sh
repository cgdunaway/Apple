#!/bin/bash

enrollmentStatus=$(/System/Library/PrivateFrameworks/Seeding.framework/Resources/seedutil current | awk '/enrolled/{print $NF}')
/bin/echo "<result>$enrollmentStatus</result>"
#!/bin/bash

jamf recon &
pid=$!
echo $pid

while kill -0 $pid 2> /dev/null; do
    echo "scanning"
    say "scanning"
    sleep 5
done

say "Scan complete"

exit 0

#!/bin/bash
curl -o zoomtest https://api.zoom.us/v1/report/getuserreport \
    -X POST \
    -d api_key=M4nApJ4ISiy6Mng40AsuJQ \
    -d api_secret=4o9RgfyE51fNUzDMDQfT3pKFjBKHrVXLX4Jp \
    -d user_id=me \
#    -d from="2013-01-11T08:18:09Z" \
#    -d to="2013-02-11T08:18:09Z"

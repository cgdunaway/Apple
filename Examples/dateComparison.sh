#!/bin/bash

today=$(date +%s)
deadline=1567549621 #$4

if (( $today >= $deadline ));
then
    echo "update time"
  else
    echo "not update time"
fi

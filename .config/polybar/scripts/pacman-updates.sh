#!/bin/bash
set -e

# credits
# https://linuxconfig.org/polybar-a-better-wm-panel-for-your-linux-system

IS_CONNECTED=$(/bin/sh ~/.config/polybar/scripts/connect.sh)
if [ "$IS_CONNECTED" == "1" ]
then
    UPDATE=$(checkupdates | wc -l)
    if [ "$UPDATE" != 0 ]
    then
        echo $UPDATE
    else
        echo ""
    fi
else
    echo ?
fi

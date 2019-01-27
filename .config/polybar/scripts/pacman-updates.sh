#!/bin/bash

# credits
# https://linuxconfig.org/polybar-a-better-wm-panel-for-your-linux-system

isConnected=$(/bin/sh ~/.config/polybar/scripts/connect.sh)
if [ "$isConnected" == "1" ]
then
    update_manjaro=$(checkupdates | wc -l)
    updates_aur=$(yay -Pn)
    updates=$(("$update_manjaro" + "$updates_aur")) 
    if [ "$updates" != "0" ]
    then
        echo $updates
    else
        echo ""
    fi
else
    echo ?
fi

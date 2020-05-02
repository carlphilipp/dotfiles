#!/bin/bash

# credits
# https://linuxconfig.org/polybar-a-better-wm-panel-for-your-linux-system

IS_CONNECTED=$(/bin/sh ~/.config/polybar/scripts/connect.sh)
if [ "$IS_CONNECTED" == "1" ]
then
    JSON=$(curl -s https://ifconfig.co/json)
    if [[ "$JSON" == \<* ]]
    then
        echo "VPN: connected"
    else
        COUNTRY_ISO=$(echo "$JSON" | json country_iso)
        COUNTRY=$(echo "$JSON" | json country)
	    CITY=$(echo "$JSON" | json city)
        if [ "$COUNTRY_ISO" != "" ] && [ "$CITY" != "" ]; then
            echo "VPN: $CITY, $COUNTRY_ISO"
            exit 1
        fi
        if [ "$COUNTRY" != "" ]; then
            echo "VPN: $COUNTRY"
            exit 1
        fi
        echo "VPN: connected"
    fi
else
    echo "VPN: offline"
fi

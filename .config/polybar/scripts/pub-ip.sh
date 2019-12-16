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
        COUNTRY=$(echo "$JSON" | json country_iso)
	    CITY=$(echo "$JSON" | json city)

	    if [ "$COUNTRY" != "" ]
	    then
	        echo "VPN: $CITY, $COUNTRY"
	    else
	        echo "VPN: connected"
	    fi
    fi
else
    echo "VPN: offline"
fi

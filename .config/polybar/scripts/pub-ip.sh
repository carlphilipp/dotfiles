#!/bin/bash

# credits
# https://linuxconfig.org/polybar-a-better-wm-panel-for-your-linux-system

IS_CONNECTED=$(/bin/sh ~/.config/polybar/scripts/connect.sh)
if [ "$IS_CONNECTED" == "1" ]
then
	COUNTRY=$(curl -s https://ifconfig.co/json | json country)
	CITY=$(curl -s https://ifconfig.co/json | json city)

	if [ "$COUNTRY" != "" ]
	then
	  echo $COUNTRY, $CITY
	else
	  echo "No VPN"
	fi
else
    echo ?
fi

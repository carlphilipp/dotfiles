#!/bin/bash

# credits
# https://linuxconfig.org/polybar-a-better-wm-panel-for-your-linux-system

#IP=$(dig +short myip.opendns.com @resolver1.opendns.com)
COUNTRY=$(sleep 11 && curl -s https://ifconfig.co/json | json country)
CITY=$(curl -s https://ifconfig.co/json | json city)

if [ "$COUNTRY" != "" ]
then
  echo $COUNTRY, $CITY
else
  echo "No VPN"
fi

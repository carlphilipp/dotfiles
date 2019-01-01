#!/bin/sh

#echo " Write in your age: "
#age="5"

#if [[ "$age" -le 7 || "$age" -ge 65 ]] ; then
#    echo " You can walk in for free "
#elif [[ "$age" -gt 7 && "$age" -lt 65 ]] ; then
#    echo " You have to pay for ticket "
#fi

IS_CONNECTED=$(/bin/sh ~/.config/polybar/scripts/connect.sh)
if [ "$IS_CONNECTED" == "1" ]
then
    RESPONSE=$(curl -s https://min-api.cryptocompare.com/data/pricemultifull\?fsyms\=BTC\&tsyms\=USD)
    VALUE=$(echo $RESPONSE | json RAW.BTC.USD.PRICE | sed 's/ //g')
    PERCENTAGE=$(echo $RESPONSE | json DISPLAY.BTC.USD.CHANGEPCT24HOUR)

    if [ $(echo $PERCENTAGE'>'0 | bc -l) == 1 ] ; then
        PERCENTAGE_DISPLAY=+$PERCENTAGE%
    else 
        PERCENTAGE_DISPLAY=-$PERCENTAGE%
    fi

    echo \$$VALUE $PERCENTAGE_DISPLAY
else
    echo ?
fi

#!/bin/sh

IS_CONNECTED=$(/bin/sh ~/.config/polybar/scripts/connect.sh)
if [ "$IS_CONNECTED" == "1" ]
then
    RESPONSE=$(curl -s https://min-api.cryptocompare.com/data/pricemultifull\?fsyms\=ETH\&tsyms\=USD)
    VALUE=$(echo $RESPONSE | json RAW.ETH.USD.PRICE | sed 's/ //g')
    PERCENTAGE=$(echo $RESPONSE | json DISPLAY.ETH.USD.CHANGEPCT24HOUR)

    if [ $(echo $PERCENTAGE'>'0 | bc -l) == 1 ] ; then
         PERCENTAGE_DISPLAY=+$PERCENTAGE%
     else
         PERCENTAGE_DISPLAY=-$PERCENTAGE%
     fi

     echo \$$VALUE $PERCENTAGE_DISPLAY

else
    echo ?
fi    

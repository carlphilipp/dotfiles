#!/bin/sh

IS_CONNECTED=$(/bin/sh ~/.config/polybar/scripts/connect.sh)
if [ "$IS_CONNECTED" == "1" ]
then
    RESPONSE=$(curl -s https://min-api.cryptocompare.com/data/pricemultifull\?fsyms\=ETH\&tsyms\=USD)
    VALUE=$(echo $RESPONSE | json RAW.ETH.USD.PRICE | sed 's/ //g')
    PERCENTAGE=$(echo $RESPONSE | json DISPLAY.ETH.USD.CHANGEPCT24HOUR)
    echo \$$VALUE $PERCENTAGE%
else
    echo ?
fi    

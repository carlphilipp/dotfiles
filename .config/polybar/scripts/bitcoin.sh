#!/bin/sh

IS_CONNECTED=$(/bin/sh ~/.config/polybar/scripts/connect.sh)
if [ "$IS_CONNECTED" == "1" ]
then
    RESPONSE=$(curl -s https://min-api.cryptocompare.com/data/pricemultifull\?fsyms\=BTC\&tsyms\=USD)
    VALUE=$(echo $RESPONSE | json RAW.BTC.USD.PRICE | sed 's/ //g')
    PERCENTAGE=$(echo $RESPONSE | json DISPLAY.BTC.USD.CHANGEPCT24HOUR)

    echo \$$VALUE $PERCENTAGE%
else
    echo ?
fi

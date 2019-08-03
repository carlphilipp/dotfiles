#!/bin/sh

IS_CONNECTED=$(/bin/sh ~/.config/polybar/scripts/connect.sh)
if [ "$IS_CONNECTED" == "1" ]
then
    RESPONSE=$(curl -s https://min-api.cryptocompare.com/data/pricemultifull\?fsyms\=BTC\&tsyms\=USD\&api_key=b13f76b096bc9b7e7eac7d83f7e28fec56463194b875fa3d377e26d4db94c078)
    VALUE=$(echo $RESPONSE | json RAW.BTC.USD.PRICE | sed 's/ //g')
    PERCENTAGE=$(echo $RESPONSE | json DISPLAY.BTC.USD.CHANGEPCT24HOUR)

    if [ $(echo $PERCENTAGE'>'0 | bc -l) == 1 ] ; then
        PERCENTAGE_DISPLAY=+$PERCENTAGE%
	else
        PERCENTAGE_DISPLAY=$PERCENTAGE%
    fi

    echo \$$VALUE $PERCENTAGE_DISPLAY
else
    echo ?
fi

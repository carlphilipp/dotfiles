#!/bin/sh

VALUE=$(curl -s https://min-api.cryptocompare.com/data/pricemultifull\?fsyms\=BTC\&tsyms\=USD | json RAW.BTC.USD.PRICE | sed 's/ //g')

echo \$$VALUE
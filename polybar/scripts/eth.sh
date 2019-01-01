#!/bin/sh

VALUE=$(curl -s https://min-api.cryptocompare.com/data/pricemultifull\?fsyms\=ETH\&tsyms\=USD | json RAW.ETH.USD.PRICE | sed 's/ //g')

echo \$$VALUE
#!/bin/sh
i=1
while [ $i -le 10 ];
do
    ping -c1 -W 10 google.com 1>/dev/null 2>&1
    if [ $? -eq 0 ]
    then
        echo "1"
        exit 1
    fi
    i=$(( $i + 1 ))
    sleep 1
done
echo "2"

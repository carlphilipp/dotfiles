#!/bin/sh

# Credits to https://github.com/x70b1/polybar-scripts/tree/master/polybar-scripts/popup-calendar

YAD_WIDTH=200
YAD_HEIGHT=200
DATE="$(date +"%a %d %H:%M")"

case "$1" in
    --popup)

        # TODO Detect if the window exists already and close it
    
        pos_y=32
        pos_x=1654

        yad --calendar --undecorated --fixed --close-on-unfocus --no-buttons \
            --width=$YAD_WIDTH --height=$YAD_HEIGHT --posx=$pos_x --posy=$pos_y \
            > /dev/null
        ;;
    *)
        echo "$DATE"
        ;;
esac

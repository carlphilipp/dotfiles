#!/bin/sh

## Created By Aditya Shakya
## https://github.com/adi1090x/dots/blob/master/usr/bin/pmenu

MENU="$(rofi -sep "|" -dmenu -i -p 'System' -location 3 -yoffset 50 -xoffset -15 -width 15 -hide-scrollbar -line-padding 4 -padding 20 -lines 4 -font "Iosevka 10" <<< " Lock| Logout| Reboot| Shutdown")"
            case "$MENU" in
                *Lock) i3lock-fancy ;;
                *Logout) i3-msg exit ;;
                *Reboot) systemctl reboot ;;
                *Shutdown) systemctl -i poweroff
esac

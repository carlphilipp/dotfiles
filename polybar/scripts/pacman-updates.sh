#!/bin/bash
set -e

# credits
# https://linuxconfig.org/polybar-a-better-wm-panel-for-your-linux-system

update=$(sleep 10 && checkupdates | wc -l)
if [ "$update" != 0 ]
then
  echo $update
else
  echo ""
fi

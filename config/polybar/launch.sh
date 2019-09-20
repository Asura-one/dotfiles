#!/usr/bin/env bash

killall -q polybar

while pgrep -x > /dev/null; do sleep 1; done

# polybar -c /home/cimer/.config/polybar/config_1 i3mainbar
# polybar -c /home/cimer/.config/polybar/config_2 satu
# polybar -c /home/cimer/.config/polybar/config_2 dua
# polybar -c /home/cimer/.config/polybar/config.ini main &
# path='/home/cimer/.config/polybar/config.ini'
path='/home/cimer/.config/polybar/polybar-nord-theme/config'
# arg='main'
arg='nord-top'

if type "xrandr"; then
  for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload -c $path $arg &
  done
else
  polybar --reload -c $path $arg &
fi

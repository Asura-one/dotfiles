#!/usr/bin/env bash

killall -q conky

while pgrep -x > /dev/null; do sleep 1; done

conky --daemonize --pause=1
# conky -c /home/cimer/.config/conky/conkyrc --daemonize --pause=1

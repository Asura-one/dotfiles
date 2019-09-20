#!/usr/bin/env bash

killall -q albert

while pgrep -x > /dev/null; do sleep 1; done

/usr/bin/albert >> /var/log/albert.log &

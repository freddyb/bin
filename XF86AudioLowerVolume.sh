#!/bin/bash
VOLUME=$(amixer -D pulse sset Master 5%- 2>&1 | egrep -m1 -o '\[[[:digit:]][[:digit:]]?%\]')
notify-send $(basename $0) "Volume at $VOLUME"


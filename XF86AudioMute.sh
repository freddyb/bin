#!/bin/bash
amixer -D pulse set Master 1+ toggle 2>&1 | egrep -q '\[off\]';
#amixer -D pulse set Master 1+ toggle 2>&1 | egrep '\[[[:digit:]][[:digit:]]?[[:digit:]]?%\] \[on\]';
if [ $? -eq 1 ]
then
    notify-send $(basename $0) "Audio Enabled"
else
    notify-send $(basename $0) "Audio Muted"
fi

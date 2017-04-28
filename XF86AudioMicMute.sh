#!/bin/bash
amixer -D pulse sset Capture toggle 2>&1 | egrep -q '\[off\]';
if [ $? -eq 1 ]
then
    notify-send $0 "Microphone Listening"
else
    notify-send $0 "Microphone Muted"
fi

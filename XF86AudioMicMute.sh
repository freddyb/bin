amixer -D pulse sset Capture toggle 2>&1 | egrep -q '\[off\]';
if [ $? -eq 1 ]
then
    notify-send XF86AudioMicMute "Microphone Listening"
else
    notify-send XF86AudioMicMute "Microphone Muted"
fi

#!/bin/bash
wmname LG3D
setxkbmap de
xfce4-power-manager
update-notifier
xscreensaver -nosplash
pgrep nm-applet || nm-applet
pgrep tomboy || tomboy
autocutsel -f
fixkeyboard
workrave &          
ubuntuone-launch &
/bin/bash /usr/bin/VidyoDesktop &

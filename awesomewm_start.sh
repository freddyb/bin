#!/bin/bash
wmname LG3D
setxkbmap de
xfce4-power-manager
update-notifier
pgrep nm-applet || nm-applet
pgrep tomboy || tomboy
autocutsel -f
fixkeyboard
/bin/bash /usr/bin/VidyoDesktop &

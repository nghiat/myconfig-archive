#!/bin/sh
xset -display :0.0 dpms 300 300 &
xautolock -time 10 -locker "systemctl suspend" -detectsleep &
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
setxkbmap -option caps:super
ibus-daemon -drx 
syndaemon -i 0.2 -t -K -R -d
xset -b
#pgrep redshift &> /dev/null || redshift &> /dev/null &
exec i3

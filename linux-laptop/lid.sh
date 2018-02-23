#!/bin/sh
if grep -q open /proc/acpi/button/lid/LID0/state
then
XAUTHORITY=/home/nghia/.Xauthority /usr/bin/xset -display :0.0 dpms force on
else
XAUTHORITY=/home/nghia/.Xauthority /usr/bin/xset -display :0.0 dpms force off
fi

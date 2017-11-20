#!/bin/sh
TMPBG=/tmp/screen.png
RES=1920x1080
ffmpeg -f x11grab -video_size $RES -i $DISPLAY -filter_complex "boxblur=20:1" -vframes 1 $TMPBG -loglevel quiet
i3lock -i $TMPBG
rm $TMPBG

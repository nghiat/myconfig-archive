#!/bin/sh

if [ "$(pgrep -x ibus-daemon)" ]; then
    engine=$(ibus engine)
    prefix=""
    text=$(
	case "$engine" in
	     ("xkb:us::eng") echo "US" ;;
	     ("xkb:de::ger") echo "DE" ;;
	     ("Unikey") echo "VI" ;;
	     (*) echo "$engine" ;;
	esac)
    echo "$prefix $text"
fi

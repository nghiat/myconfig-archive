#!/bin/bash
clean=""
while true; do
    case "$1" in
        --clean ) clean="true"; shift ;;
        * ) break ;;
    esac
done

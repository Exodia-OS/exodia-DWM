#!/usr/bin/env bash


rofi -dmenu \
     -password \
     -i \
     -no-fixed-num-lines \
     -p "User Password: " \
     -theme /usr/share/exodia/dwm/rofi/themes/askpass.rasi &

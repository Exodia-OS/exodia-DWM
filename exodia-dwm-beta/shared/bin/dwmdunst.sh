#!/usr/bin/env bash

## Launch dunst daemon
if [[ `pidof dunst` ]]; then
	pkill dunst
fi

dunst -config /usr/share/exodia/dwm/dunstrc &

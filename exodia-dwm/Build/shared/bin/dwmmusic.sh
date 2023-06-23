#!/usr/bin/env bash

## Run ncmpcpp with alternate config

# dwm directory
DIR='/usr/share/exodia/dwm'

CONFIG="$DIR/alacritty/alacritty.yml"

alacritty --class 'Music,Music' --config-file "$CONFIG" \
		  -o window.dimensions.columns=109 window.dimensions.lines=22 \
		  -e ~/.ncmpcpp/scripts/ncmpcpp-art

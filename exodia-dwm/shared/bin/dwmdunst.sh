#!/usr/bin/env bash

#####################################
#                                   #
#  @author      : 00xWolf           #
#    GitHub    : @mmsaeed509       #
#    Developer : Mahmoud Mohamed   #
#  﫥  Copyright : Exodia OS        #
#                                   #
#####################################

## Launch dunst daemon ##
if [[ `pidof dunst` ]];
	
	then

		pkill dunst
		
fi

dunst -config /usr/share/exodia/dwm/dunstrc &

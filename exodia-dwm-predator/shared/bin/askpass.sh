#!/usr/bin/env bash

#####################################
#                                   #
#  @author      : 00xWolf           #
#    GitHub    : @mmsaeed509       #
#    Developer : Mahmoud Mohamed   #
#  﫥  Copyright : Exodia OS        #
#                                   #
#####################################

rofi -dmenu \
     -password \
     -i \
     -no-fixed-num-lines \
     -p "User Password: " \
     -theme /usr/share/exodia/dwm/rofi/themes/askpass.rasi &

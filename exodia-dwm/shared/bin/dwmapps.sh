#!/usr/bin/env bash

#####################################
#                                   #
#  @author      : 00xWolf           #
#    GitHub    : @mmsaeed509       #
#    Developer : Mahmoud Mohamed   #
#  﫥  Copyright : Exodia OS        #
#                                   #
#####################################

## Launch Applications ##

if [[ "$1" == "--file" ]];
	
	then
		
		thunar

elif [[ "$1" == "--editor" ]];
	
	then
		
		geany

elif [[ "$1" == "--web" ]];
	
	then
		
		google-chrome-stable
		
fi

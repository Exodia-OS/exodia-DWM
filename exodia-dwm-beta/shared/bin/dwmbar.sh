#!/usr/bin/bash

##########################################################################################################
#																										 
#    Copyright © 2022 To Cyb3rTh1eveZ																	 
#																										 
#     ██████╗██╗   ██╗██████╗ ██████╗ ██████╗ ████████╗██╗  ██╗ ██╗███████╗██╗   ██╗███████╗███████╗	 
#    ██╔════╝╚██╗ ██╔╝██╔══██╗╚════██╗██╔══██╗╚══██╔══╝██║  ██║███║██╔════╝██║   ██║██╔════╝╚══███╔╝     
#    ██║      ╚████╔╝ ██████╔╝ █████╔╝██████╔╝   ██║   ███████║╚██║█████╗  ██║   ██║█████╗    ███╔╝      
#    ██║       ╚██╔╝  ██╔══██╗ ╚═══██╗██╔══██╗   ██║   ██╔══██║ ██║██╔══╝  ╚██╗ ██╔╝██╔══╝   ███╔╝       
#    ╚██████╗   ██║   ██████╔╝██████╔╝██║  ██║   ██║   ██║  ██║ ██║███████╗ ╚████╔╝ ███████╗███████╗     
#     ╚═════╝   ╚═╝   ╚═════╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝ ╚═╝╚══════╝  ╚═══╝  ╚══════╝╚══════╝     
#																										 
#																										 
#																										 
#    Copyright (C) Mahmoud Mohamed (00xWolf)  <https://github.com/mmsaeed509>								 
#    LICENSE © GNU-GPL3																					 
#																										 
##########################################################################################################

# ^c$var^ = fg color
# ^b$var^ = bg color

interval=0

# load colors
. /usr/share/exodia/dwm/bin/catppuccin

# Cpu Info #
cpu_info() {

	cpu_load=$(grep -o "^[^ ]*" /proc/loadavg)

	printf "^c$black^ ^b$green^ "
	printf "^c$white^ ^b$grey^ $cpu_load"

}

# Memory #
memory() {

	printf "^c$blue^^b$black^   $(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g) "

}

# GitHub Notifications #
GitHub_Notifications() {

	USER="username"
	# You can get your Personal access tokens from here : https://github.com/settings/tokens #
	TOKEN="accessToken"
	notifications=$(echo "user = \"$USER:$TOKEN\"" | curl -sf -K- https://api.github.com/notifications | jq ".[].unread" | grep -c true)

	printf "^c$white^^b$black^  $notifications "

}


## Wi-fi
wlan() {

	ssid=$(iwgetid -r)
	case "$(cat /sys/class/net/w*/operstate 2>/dev/null)" in
		up) printf "^c$black^ ^b$blue^  ^d^%s" " ^c$blue^$ssid " ;;
		down) printf "^c$black^ ^b$blue^ 睊 ^d^%s" " ^c$blue^Disconnected " ;;
	esac

}

## Time
clock() {

	printf "^c$black^ ^b$darkblue^ 󱑆 "
	printf "^c$black^^b$blue^ $(date '+%a, %I:%M %p') "

}

## System Update
updates() {

	updates=$(checkupdates 2>/dev/null | wc -l)

	if [ -z "$updates" ]; then
	
		printf "  ^c$green^    Fully Updated"
	
	else
    	
		printf "  ^c$green^    $updates"" updates"
		
	fi

}

## Battery Info
battery() {

	BAT=$(upower -i `upower -e | grep 'BAT'` | grep 'percentage' | cut -d':' -f2 | tr -d '%,[:blank:]')
	AC=$(upower -i `upower -e | grep 'BAT'` | grep 'state' | cut -d':' -f2 | tr -d '[:blank:]')

	if [[ "$AC" == "charging" ]]; then

		printf "^c$red^  $BAT%%"

	elif [[ "$AC" == "fully-charged" ]]; then

		printf "^c$green^  Full"

	else

		if [[ ("$BAT" -ge "0") && ("$BAT" -le "20") ]]; then

			printf "^c$blue^  $BAT%%"

		elif [[ ("$BAT" -ge "20") && ("$BAT" -le "40") ]]; then

			printf "^c$blue^  $BAT%%"

		elif [[ ("$BAT" -ge "40") && ("$BAT" -le "60") ]]; then

			printf "^c$blue^  $BAT%%"

		elif [[ ("$BAT" -ge "60") && ("$BAT" -le "80") ]]; then

			printf "^c$blue^  $BAT%%"

		elif [[ ("$BAT" -ge "80") && ("$BAT" -le "100") ]]; then

			printf "^c$blue^  $BAT%%"

		fi

	fi

}

## Brightness
brightness() {

	LIGHT=$(printf "%.0f\n" `light -G`)

	if [[ ("$LIGHT" -ge "0") && ("$LIGHT" -le "25") ]]; then
		printf "^c$cyan^  $LIGHT%%"
	elif [[ ("$LIGHT" -ge "25") && ("$LIGHT" -le "50") ]]; then
		printf "^c$cyan^  $LIGHT%%"
	elif [[ ("$LIGHT" -ge "50") && ("$LIGHT" -le "75") ]]; then
		printf "^c$cyan^  $LIGHT%%"
	elif [[ ("$LIGHT" -ge "75") && ("$LIGHT" -le "100") ]]; then
		printf "^c$cyan^  $LIGHT%%"
	fi

}

## Main
while true; do
  [ "$interval" == 0 ] || [ $(("$interval" % 3600)) == 0 ] && updates=$(updates)
  interval=$((interval + 1))

  sleep 1 && xsetroot -name "$(battery) $(brightness) $(GitHub_Notifications) $(cpu_info) $(memory) $(wlan) $(clock)"
done

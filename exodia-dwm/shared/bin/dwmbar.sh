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

# Weather #
weather(){

	# dwm config directory #
	DWM_DIR="/usr/share/exodia/dwm"
	API_KEY=$(grep -oP 'weather-API = \K.*' "${DWM_DIR}/exodia.conf")
	CITY_ID=$(grep -oP 'weather-city-ID = \K.*' "${DWM_DIR}/exodia.conf")

	# Weather data #
	KEY=$API_KEY
	ID=$CITY_ID
	UNIT="metric"	# Available options : 'metric' or 'imperial'

	weather=$(curl -sf "http://api.openweathermap.org/data/2.5/weather?APPID="$KEY"&id="$ID"&units="$UNIT"")

	if [ ! -z "$weather" ];
		
		then

			WEATHER_TEMP=`echo "$weather" | jq ".main.temp" | cut -d "." -f 1`
			WEATHER_ICON_CODE=`echo "$weather" | jq -r ".weather[].icon" | head -1`
			weather_description=`echo "$weather" | jq -r ".weather[].description" | head -1 | sed -e "s/\b\(.\)/\u\1/g"`

			# Big long if statement of doom #
			if [ "$WEATHER_ICON_CODE" == "50d"  ];
			
				then

					WEATHER_ICON=" "
					weather_quote="Forecast says it's misty \nMake sure you don't get lost on your way..."
					WEATHER_HEX="#84afdb"

			elif [ "$WEATHER_ICON_CODE" == "50n"  ];
				
				then

					WEATHER_ICON=" "
					WEATHER_QUOTE="Forecast says it's a misty night \nDon't go anywhere tonight or you might get lost..."
					WEATHER_HEX="#84afdb"

			elif [ "$WEATHER_ICON_CODE" == "01d"  ];
				
				then

					WEATHER_ICON=" "
					WEATHER_QUOTE="It's a sunny day, gonna be fun! \nDon't go wandering all by yourself though..."
					WEATHER_HEX="#ffd86b"

			elif [ "$WEATHER_ICON_CODE" == "01n"  ];
				
				then

					WEATHER_ICON=" "
					WEATHER_QUOTE="It's a clear night \nYou might want to take a evening stroll to relax..."
					WEATHER_HEX="#fcdcf6"

			elif [ "$WEATHER_ICON_CODE" == "02d"  ];
			
				then

					WEATHER_ICON=" "
					WEATHER_QUOTE="It's  cloudy, sort of gloomy \nYou'd better get a book to read..."
					WEATHER_HEX="#adadff"

			elif [ "$WEATHER_ICON_CODE" == "02n"  ];
				
				then

					WEATHER_ICON=" "
					WEATHER_QUOTE="It's a cloudy night \nHow about some hot chocolate and a warm bed?"
					WEATHER_HEX="#adadff"

			elif [ "$WEATHER_ICON_CODE" == "03d"  ];
				
				then

					WEATHER_ICON=" "
					WEATHER_QUOTE="It's  cloudy, sort of gloomy \nYou'd better get a book to read..."
					WEATHER_HEX="#adadff"

			elif [ "$WEATHER_ICON_CODE" == "03n"  ];
				
				then

					WEATHER_ICON=" "
					WEATHER_QUOTE="It's a cloudy night \nHow about some hot chocolate and a warm bed?"
					WEATHER_HEX="#adadff"

			elif [ "$WEATHER_ICON_CODE" == "04d"  ];
				
				then

					WEATHER_ICON=" "
					WEATHER_QUOTE="It's  cloudy, sort of gloomy \nYou'd better get a book to read..."
					WEATHER_HEX="#adadff"

			elif [ "$WEATHER_ICON_CODE" == "04n"  ];
			
				then

					WEATHER_ICON=" "
					WEATHER_QUOTE="It's a cloudy night \nHow about some hot chocolate and a warm bed?"
					WEATHER_HEX="#adadff"

			elif [ "$WEATHER_ICON_CODE" == "09d"  ];
				
				then

					WEATHER_ICON=" "
					WEATHER_QUOTE="It's rainy, it's a great day! \nGet some ramen and watch as the rain falls..."
					WEATHER_HEX="#6b95ff"

			elif [ "$WEATHER_ICON_CODE" == "09n"  ];
			
				then

					WEATHER_ICON=" "
					WEATHER_QUOTE=" It's gonna rain tonight it seems \nMake sure your clothes aren't still outside..."
					WEATHER_HEX="#6b95ff"

			elif [ "$WEATHER_ICON_CODE" == "10d"  ];
			
				then

					WEATHER_ICON=" "
					WEATHER_QUOTE="It's rainy, it's a great day! \nGet some ramen and watch as the rain falls..."
					WEATHER_HEX="#6b95ff"

			elif [ "$WEATHER_ICON_CODE" == "10n"  ];
			
				then

					WEATHER_ICON=" "
					WEATHER_QUOTE=" It's gonna rain tonight it seems \nMake sure your clothes aren't still outside..."
					WEATHER_HEX="#6b95ff"

			elif [ "$WEATHER_ICON_CODE" == "11d"  ];
			
				then

					WEATHER_ICON=""
					WEATHER_QUOTE="There's storm for forecast today \nMake sure you don't get blown away..."
					WEATHER_HEX="#ffeb57"

			elif [ "$WEATHER_ICON_CODE" == "11n"  ];
				
				then

					WEATHER_ICON=""
					WEATHER_QUOTE="There's gonna be storms tonight \nMake sure you're warm in bed and the windows are shut..."
					WEATHER_HEX="#ffeb57"

			elif [ "$WEATHER_ICON_CODE" == "13d"  ];
				
				then

					WEATHER_ICON=" "
					WEATHER_QUOTE="It's gonna snow today \nYou'd better wear thick clothes and make a snowman as well!"
					WEATHER_HEX="#e3e6fc"

			elif [ "$WEATHER_ICON_CODE" == "13n"  ];
				
				then

					WEATHER_ICON=" "
					WEATHER_QUOTE="It's gonna snow tonight \nMake sure you get up early tomorrow to see the sights..."
					WEATHER_HEX="#e3e6fc"

			elif [ "$WEATHER_ICON_CODE" == "40d"  ];
			
				then

					WEATHER_ICON=" "
					WEATHER_QUOTE="Forecast says it's misty \nMake sure you don't get lost on your way..."
					WEATHER_HEX="#84afdb"

			elif [ "$WEATHER_ICON_CODE" == "40n"  ];
				
				then

					WEATHER_ICON=" "
					WEATHER_QUOTE="Forecast says it's a misty night \nDon't go anywhere tonight or you might get lost..."
					WEATHER_HEX="#84afdb"

			else

				WEATHER_ICON=" "
				WEATHER_QUOTE="Sort of odd, I don't know what to forecast \nMake sure you have a good time!"
				WEATHER_HEX="#adadff"

			fi

			printf "^c$cyan^ $WEATHER_ICON$WEATHER_TEMP°C"

		else

			printf "^c$cyan^  Weather Unavailable"
			
	fi


}

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

	# dwm config directory #
	DWM_DIR="/usr/share/exodia/dwm"

	USERNAME=$(grep -oP 'github-username = \K.*' "${DWM_DIR}/exodia.conf")
	ACCESS_TOKEN=$(grep -oP 'github-access-token = \K.*' "${DWM_DIR}/exodia.conf")

	USER="${USERNAME}"
	# You can get your Personal access tokens from here : https://github.com/settings/tokens #
	TOKEN="${ACCESS_TOKEN}"
	notifications=$(echo "user = \"$USER:$TOKEN\"" | curl -sf -K- https://api.github.com/notifications | jq ".[].unread" | grep -c true)

	printf "^c$white^^b$black^  $notifications "

}


# Wi-fi #
wlan(){

	ssid=$(iwgetid -r)

	if [[ ssid == "" ]];
		
		then

			ssid="LAN"

	fi

	case "$(cat /sys/class/net/w*/operstate 2>/dev/null)" in
		up) printf "^c$black^ ^b$blue^  ^d^%s" " ^c$blue^$ssid " ;;
		down) printf "^c$black^ ^b$blue^ 睊 ^d^%s" " ^c$blue^Disconnected " ;;
	esac


}

# Time #
clock() {

	printf "^c$black^ ^b$darkblue^ 󱑆 "
	printf "^c$black^^b$blue^ $(date '+%a, %I:%M %p') "

}

# System Update #
updates() {

	if ! updates=$(checkupdates 2> /dev/null | wc -l );
		
		then
			
			updates=0

    fi
	
	if [ "$updates" -gt 0 ];
		
		then
			
			printf " ^c$green^ $updates"

	else

    	printf " ^c$green^ 0"

	fi

}

# Battery Info #
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

# Brightness #
brightness() {

	LIGHT=$(printf "%.0f\n" `light -G`)

	if [[ ("$LIGHT" -ge "0") && ("$LIGHT" -le "25") ]]; then
		printf "^c$pink^  $LIGHT%%"
	elif [[ ("$LIGHT" -ge "25") && ("$LIGHT" -le "50") ]]; then
		printf "^c$pink^  $LIGHT%%"
	elif [[ ("$LIGHT" -ge "50") && ("$LIGHT" -le "75") ]]; then
		printf "^c$pink^  $LIGHT%%"
	elif [[ ("$LIGHT" -ge "75") && ("$LIGHT" -le "100") ]]; then
		printf "^c$pink^  $LIGHT%%"
	fi

}

# Audio Volume #
audio_volume() {

	VOLUME=$(printf "%.0f\n" `amixer sget Master | awk -F'[][]' '/%/ {print $2; exit}' | tr -d '%'`)

	if [[ ("$VOLUME" -ge "0") && ("$VOLUME" -le "25") ]]; then
		printf "^c$purple^ 奄 $VOLUME%%"
	elif [[ ("$VOLUME" -ge "25") && ("$VOLUME" -le "50") ]]; then
		printf "^c$purple^ 奔 $VOLUME%%"
	elif [[ ("$VOLUME" -ge "50") && ("$VOLUME" -le "75") ]]; then
		printf "^c$purple^ 墳 $VOLUME%%"
	elif [[ ("$VOLUME" -ge "75") && ("$VOLUME" -le "100") ]]; then
		printf "^c$purple^ 墳 $VOLUME%%"
	fi

}

# Main #
while true; do
  [ "$interval" == 0 ] || [ $(("$interval" % 3600)) == 0 ] && updates=$(updates)
  interval=$((interval + 1))

  sleep 1 && xsetroot -name "$(battery) $(weather) $(audio_volume) $(brightness) $(GitHub_Notifications) $(cpu_info) $(memory) $(wlan) $(clock)"

done

# while true;
	
# 	do
		
# 		sleep 1 && xsetroot -name "$(battery) $(updates) $(weather) $(audio_volume) $(brightness) $(GitHub_Notifications) $(cpu_info) $(memory) $(wlan) $(clock)"

# done

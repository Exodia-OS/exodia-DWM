#!/usr/bin/env bash

# Kill already running process
_ps=(picom dunst ksuperkey mpd xfce-polkit xfce4-power-manager)
for _prs in "${_ps[@]}"; do
	if [[ `pidof ${_prs}` ]]; then
		killall -9 ${_prs}
	fi
done

# Fix cursor
xsetroot -cursor_name left_ptr

# Polkit agent
/usr/lib/xfce-polkit/xfce-polkit &

# Enable power management
xfce4-power-manager &

# Enable Super Keys For Menu
ksuperkey -e 'Super_L=Alt_L|F1' &
ksuperkey -e 'Super_R=Alt_L|F1' &

#!/usr/bin/env bash

# Kill already running process
_ps=(picom dunst ksuperkey mpd xfce-polkit xfce4-power-manager)
for _prs in "${_ps[@]}"; do
	if [[ `pidof ${_prs}` ]]; then
		killall -9 ${_prs}
	fi
done

# Fix cursor
xsetroot -cursor_name left_ptr

# Polkit agent
/usr/lib/xfce-polkit/xfce-polkit &

# Enable power management
xfce4-power-manager &

# Enable Super Keys For Menu
ksuperkey -e 'Super_L=Alt_L|F1' &
ksuperkey -e 'Super_R=Alt_L|F1' &

# # setup dual monitors #
# if [[ $(xrandr -q | grep 'HDMI-1-0 connected') ]]; then

# 	xrandr --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP1 --off --output DP2 --off --output DP3 --off --output HDMI1 --off --output HDMI2 --off --output VIRTUAL1 --off --output DP-1-0 --off --output DP-1-1 --off --output HDMI-1-0 --mode 1920x1080 --pos 1920x0 --rotate normal
		  
# fi


# Restore wallpaper
hsetroot -cover /usr/share/backgrounds/waves_right_colored.png

# Lauch dwmbar
/usr/share/exodia/dwm/bin/dwmbar.sh &

# Lauch notification daemon
/usr/share/exodia/dwm/bin/dwmdunst.sh

# Lauch compositor
/usr/share/exodia/dwm/bin/dwmcomp.sh

# Start mpd
exec mpd &

# Fix Java problems
wmname "LG3D"
export _JAVA_AWT_WM_NONREPARENTING=1

# Add your autostart programs here #

# Launch DWM
while dwm; [ $? -ne 0  ]; do echo "start dwm"; done


# Restore wallpaper
hsetroot -cover /usr/share/backgrounds/waves_right_colored.png

# Lauch dwmbar
/usr/share/exodia/dwm/bin/dwmbar.sh &

# Lauch notification daemon
/usr/share/exodia/dwm/bin/dwmdunst.sh

# Lauch compositor
/usr/share/exodia/dwm/bin/dwmcomp.sh

# Start mpd
exec mpd &

# Fix Java problems
wmname "LG3D"
export _JAVA_AWT_WM_NONREPARENTING=1

# Add your autostart programs here #

# Launch DWM
while dwm; [ $? -ne 0  ]; do echo "start dwm"; done

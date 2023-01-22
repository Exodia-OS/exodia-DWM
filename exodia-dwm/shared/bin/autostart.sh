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

# Restore wallpaper
hsetroot -cover /usr/share/backgrounds/magenta-cat.png

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

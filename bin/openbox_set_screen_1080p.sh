#!/bin/bash

#----------------------------------------------------------------------------------------
# openbox_set_screen_1080p.sh
# 
# WebSite:
# https://github.com/pablomenino/dotfiles/
# 
# Copyright © 2020 - Pablo Meniño <pablo.menino@mfwlab.com>
#----------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------
# begin

host=$(hostname)
wm=$(wmctrl -m | grep "Name" | cut -c7-)

HOST_XPS=xps13

wm_ob=Openbox
wm_gnome="GNOME Shell"

# xps13 and Openbox
if [ "$host" == "$HOST_XPS" ] && [ "$wm" == "$wm_ob" ];
then
	echo "change screen resolution for xps13 || Openbox"
	xrandr --output eDP-1 --mode 1920x1080 --rate 60.01
fi

exit 0

#----------------------------------------------------------------------------------------
# End
#----------------------------------------------------------------------------------------

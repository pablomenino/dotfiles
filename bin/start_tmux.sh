#!/bin/bash

#----------------------------------------------------------------------------------------
# start_tmux.sh
# 
# WebSite:
# https://github.com/pablomenino/dotfiles/
# 
# Copyright © 2020 - Pablo Meniño <pablo.menino@mfwlab.com>
#----------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------
# begin

# Start tmux

# host=$(hostname)
wm=$(wmctrl -m | grep "Name" | cut -c7-)

wm_gnome="GNOME Shell"
wm_kde=KWin

# Gnome
if [ "$wm" == "$wm_gnome" ];
then
	echo "Gnome"
    gnome-terminal --name=tmux-global --hide-menubar --maximize --command "tmux new-session -A -s global" &
fi

# KDE
if [ "$wm" == "$wm_kde" ];
then
	echo "KDE"
    konsole -e "tmux new-session -A -s global" &
fi

exit 0

#----------------------------------------------------------------------------------------
# End
#----------------------------------------------------------------------------------------

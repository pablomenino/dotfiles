#!/bin/bash

#----------------------------------------------------------------------------------------
# mfw.steam_on.sh
# 
# WebSite:
# https://github.com/pablomenino/dotfiles/
# 
# Copyright © 2017 - Pablo Meniño <pablo.menino@mfwlab.com>
#----------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------
# begin

# Switch monitor/sound card and start Steam in big picture

xrandr --output HDMI-1 --auto
xrandr --output HDMI-0 --off
xrandr --output DVI-I-1 --off

sleep 5

soundoutput=$(pactl list short sinks | grep hdmi-stereo | awk '{print $1}')

cmd='pacmd set-default-sink $soundoutput'
eval $cmd

steam -bigpicture

notify-send 'Steam' 'mode on' --icon=dialog-information

exit 0

#----------------------------------------------------------------------------------------
# End
#----------------------------------------------------------------------------------------

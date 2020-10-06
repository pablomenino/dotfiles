#!/bin/bash

#----------------------------------------------------------------------------------------
# mfw.steam_off.sh
# 
# WebSite:
# https://github.com/pablomenino/dotfiles/
# 
# Copyright © 2017 - Pablo Meniño <pablo.menino@mfwlab.com>
#----------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------
# begin

# Switch monitor/sound card
xrandr --output HDMI-0 --primary --auto
xrandr --output DVI-I-1 --right-of HDMI-0 --auto
xrandr --output HDMI-1 --off

sleep 5

soundoutput=$(pactl list short sinks | grep analog-surround-51 | awk '{print $1}')

cmd='pacmd set-default-sink $soundoutput'
eval $cmd

notify-send 'Steam' 'mode off' --icon=dialog-information

exit 0

#----------------------------------------------------------------------------------------
# End
#----------------------------------------------------------------------------------------

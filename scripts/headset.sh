#!/bin/bash

#----------------------------------------------------------------------------------------
# mfw.xboxdrv_start.sh
# 
# WebSite:
# https://github.com/pablomenino/dotfiles/
# 
# Copyright © 2018 - Pablo Meniño <pablo.menino@mfwlab.com>
#----------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------
# begin

# Fix Head Set sound noise on Dell XPS 13 (9350)

soundoutput=$(pactl list short sinks | grep bluez_sink | awk '{print $1}')
cmd='pacmd set-default-sink $soundoutput'
eval $cmd

pacmd set-card-profile 2 a2dp_sink

notify-send 'HeadSet' 'Enable and A2DP' --icon=dialog-information

exit 0

#----------------------------------------------------------------------------------------
# End
#----------------------------------------------------------------------------------------

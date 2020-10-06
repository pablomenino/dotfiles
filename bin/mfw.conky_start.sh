#!/bin/bash

#----------------------------------------------------------------------------------------
# mfw.conky_start.sh
# 
# WebSite:
# https://github.com/pablomenino/dotfiles/
# 
# Copyright © 2020 - Pablo Meniño <pablo.menino@mfwlab.com>
#----------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------
# begin

host=$(hostname)
HOST_NORC=norc
HOST_XPS=xps13

killall conky
killall conky

# NORC
if [ "$host" == "$HOST_NORC" ];
then
	echo "Start Conky for NORC"
	sleep 20 && conky --config=$HOME/.conky/norc/conky/conkyrc_c &
	sleep 20 && conky --config=$HOME/.conky/norc/conkyrc_solar2 &
fi

# xps13
if [ "$host" == "$HOST_XPS" ];
then
	echo "Start Conky for xps13"
	sleep 20 && conky --config=$HOME/.conky/xps13/conky/conkyrc_c &
	sleep 20 && conky --config=$HOME/.conky/xps13/conkyrc_solar2 &
fi

notify-send 'Conky' 'start conky scripts' --icon=dialog-information

exit 0

#----------------------------------------------------------------------------------------
# End
#----------------------------------------------------------------------------------------

#!/bin/bash

#----------------------------------------------------------------------------------------
# amixer_mute.sh
# 
# WebSite:
# https://github.com/pablomenino/dotfiles/
# 
# Copyright © 2020 - Pablo Meniño <pablo.menino@mfwlab.com>
#----------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------
# begin


CURRENT_STATE=`amixer get Master | egrep 'Playback.*?\[o' | egrep -o '\[o.+\]' | head -1`

if [[ $CURRENT_STATE == '[on]' ]]; then
    amixer set Master mute
else
    amixer set Master unmute
    #amixer set Front unmute
    #amixer set Headphone unmute
fi

exit 0

#----------------------------------------------------------------------------------------
# End
#----------------------------------------------------------------------------------------

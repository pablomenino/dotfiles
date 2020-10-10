#!/bin/bash

#----------------------------------------------------------------------------------------
# obs-xxxx.sh
# 
# WebSite:
# https://github.com/pablomenino/dotfiles/
# 
# Copyright © 2020 - Pablo Meniño <pablo.menino@mfwlab.com>
#----------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------
# begin


# Get OBS Windows ID
WINDOWID=$(xdotool search --name "OBS 25" | head -1)

# Check if Windows ID is valid, if not, repeat
re='^[0-9]+$'
if ! [[ $WINDOWID =~ $re ]] ; then
   echo "Error: Not a number" >&2
   echo "Repeat" >&2
   WINDOWID=$(xdotool search --name "OBS 25" | head -1)
fi

# Check if Windows ID is valid, if not, exit
re='^[0-9]+$'
if ! [[ $WINDOWID =~ $re ]] ; then
   echo "Error: Not a number" >&2; exit 1
fi

echo "----------------"
echo $WINDOWID
echo "----------------"

# execute key stroke in OBS

xdotool windowactivate --sync $WINDOWID key SUPER+ALT+2
exit 0

#----------------------------------------------------------------------------------------
# End
#----------------------------------------------------------------------------------------

#!/bin/bash

#----------------------------------------------------------------------------------------
# virtual-cam.sh
# 
# WebSite:
# https://github.com/pablomenino/dotfiles/
# 
# Copyright © 2020 - Pablo Meniño <pablo.menino@mfwlab.com>
#----------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------
# begin


# Operation start/stop
operation=$1

if [ "$operation" == "start" ];
then
	echo "Load v4l2loopback module"
	# Set module v4l2loopback for OBS (OBS/obs-v4l2sink)
	sudo modprobe v4l2loopback devices=1 video_nr=10 card_label="VirtualCam" exclusive_caps=1
elif [ "$operation" == "stop" ];
then
    echo "Unload v4l2loopback module"
    sudo modprobe -r v4l2loopback
else
    echo "Invalid parameter, use start or stop."
fi

exit 0

#----------------------------------------------------------------------------------------
# End
#----------------------------------------------------------------------------------------

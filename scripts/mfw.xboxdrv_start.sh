#!/bin/bash

#----------------------------------------------------------------------------------------
# mfw.xboxdrv_start.sh
# 
# WebSite:
# https://github.com/pablomenino/dotfiles/
# 
# Copyright © 2017 - Pablo Meniño <pablo.menino@mfwlab.com>
#----------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------
# begin

sudo xboxdrv --mimic-xpad --config $HOME/scripts/mfw-xboxdrv.conf

notify-send 'xboxdrv' 'start xbox 360 drivers' --icon=dialog-information

exit 0

#----------------------------------------------------------------------------------------
# End
#----------------------------------------------------------------------------------------

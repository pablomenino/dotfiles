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

# Original author: Michalis Georgiou <mechmg93@gmail.comr>
# Modified by Pablo Meniño <pablo.menino@gmail.com>

# sudo yum install y mercurial

# Download and install Google Fonts

notify-send 'Google Fonts' 'Starting download fonts' --icon=dialog-information

_hgroot="https://googlefontdirectory.googlecode.com/hg/"
_hgrepo="googlefontdirectory"

echo "Connecting to Mercurial server...."
if [ -d $_hgrepo ] ; then
        cd $_hgrepo
        hg pull -u || return 1
        echo "The local files have been updated."
        cd ..
else
        hg clone $_hgroot $_hgrepo || return 1
fi
echo "Mercurial checkout done or server timeout"
mkdir ~/.fonts/google-fonts/
find ~/scripts/googlefontdirectory/ -name "*.ttf" -exec cp {} ~/.fonts/google-fonts/ \; || return 1
#find . -name \*.bak -print0 | xargs -I{} -0 cp -v {} /mnt/usb
#fc-cache -f > /dev/null
echo "done."

#hg clone "https://googlefontdirectory.googlecode.com/hg/" "googlefontdirectory" || return 2

notify-send 'Google Fonts' 'Finish installing new fonts' --icon=dialog-information

exit 0

#----------------------------------------------------------------------------------------
# End
#----------------------------------------------------------------------------------------

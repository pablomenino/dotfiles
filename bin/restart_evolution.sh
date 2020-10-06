#!/bin/bash

#----------------------------------------------------------------------------------------
# restart_evolution.sh
# 
# WebSite:
# https://github.com/pablomenino/dotfiles/
# 
# Copyright © 2020 - Pablo Meniño <pablo.menino@mfwlab.com>
#----------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------
# begin

# Restart Evolution

pkill evolution

sleep 1

for evo in evolution-addressbook-factory evolution-source-registry evolution-calendar-factory evolution-alarm-notify
do
    pkill $evo
done

sleep 2

pkill -9 evolution

sleep 1

evolution > /dev/null 2>&1 &

exit 0

#----------------------------------------------------------------------------------------
# End
#----------------------------------------------------------------------------------------

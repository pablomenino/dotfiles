#!/bin/bash

#----------------------------------------------------------------------------------------
# check_ip_address.sh
# 
# WebSite:
# https://github.com/pablomenino/dotfiles/
# 
# Copyright © 2020 - Pablo Meniño <pablo.menino@mfwlab.com>
#----------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------
# begin


check_ip=$1

function valid_ip()
{
    local  ip=$1
    local  stat=1

    if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        OIFS=$IFS
        IFS='.'
        ip=($ip)
        IFS=$OIFS
        [[ ${ip[0]} -le 255 && ${ip[1]} -le 255 \
            && ${ip[2]} -le 255 && ${ip[3]} -le 255 ]]
        stat=$?
    fi
    return $stat
}

if valid_ip $check_ip; then stat='good'; else stat='bad'; fi
printf "%-20s: %s\n" "$check_ip" "$stat"

exit 0

#----------------------------------------------------------------------------------------
# End
#----------------------------------------------------------------------------------------
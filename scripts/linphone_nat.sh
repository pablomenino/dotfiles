#!/bin/bash

#----------------------------------------------------------------------------------------
# mfw.linphone_nat.sh
# 
# WebSite:
# https://github.com/pablomenino/dotfiles/
# 
# Copyright © 2017 - Pablo Meniño <pablo.menino@mfwlab.com>
#----------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------
# begin

# Change linphone config values for NAT (VPN Split)

########################################################################
echo "Init - Change linphone config values for NAT (For Split VPN)"

dayfile="$(date -d "today" +"%Y%m%d%H%M%S")"

########################################################################
echo "GetCurrentVPNIP"

all_nics="$(ip addr show | cut -d ' ' -f2 | tr -d : | grep -Ev "^$")"
all_nics=(${all_nics[@]//lo/})	 # Remove lo interface.

for nic in "${all_nics[@]}"; do
	if [ $nic == "tun0" ]
	then
		# Parse IP address for the NIC.
		lan_ip="$(ip addr show ${nic} | grep '\<inet\>' | tr -s ' ' | cut -d ' ' -f3)"
		# Trim the CIDR suffix.
		lan_ip="${lan_ip%/*}"
		# Only display the last entry
		lan_ip="$(echo "$lan_ip" | tail -1)"
		[ -n "$lan_ip" ]
	fi
	#[ -n "$lan_ip" ] && break
done

########################################################################
echo "GetConfigValues"

# Get current configuration values
myNatVar=$(cat ~/.linphonerc | grep "nat_address" | awk '{print $1;}')
myNatFirst=$(echo $myNatVar | sed -E  's/(.*)={1}(.*)/\1/')
myNatSecond=$(echo $myNatVar | sed -E  's/(.*)={1}(.*)/\2/')

# Get current configuration values
myContactVar=$(cat ~/.linphonerc | grep "$myNatSecond" | grep "contact")
myContactFirst=$(echo $myContactVar | sed -E  's/(.*)={1}(.*)/\1/')
myContactSecond=$(echo $myContactVar | sed -E  's/(.*)={1}(.*)/\2/')

########################################################################
echo "SetConfigValues"

#echo "$myNatVar"
#echo "$myNatFirst"
echo "Change IP $myNatSecond to IP ${lan_ip}"

#echo "$myContactVar"
#echo "$myContactFirst"
echo "Change Contact $myContactSecond to new IP ${lan_ip}"

########################################################################

check_ip=$lan_ip

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

if valid_ip $check_ip;
then
	stat='good';
	echo $stat;
	# Backup
	cp ~/.linphonerc ~/.linphonerc.$dayfile
	# Modify
	perl -pi -e "s/$myNatSecond/$lan_ip/g" ~/.linphonerc
	# EnableNat - firewall_policy=1
	perl -pi -e "s/firewall_policy=0/firewall_policy=1/g" ~/.linphonerc
else
	stat='bad';
	echo $stat;
	# Backup
	cp ~/.linphonerc ~/.linphonerc.$dayfile
	# Modify
	# perl -pi -e "s/$myNatSecond/$lan_ip/g" ~/.linphonerc
	# DisableNat - firewall_policy=0
	perl -pi -e "s/firewall_policy=1/firewall_policy=0/g" ~/.linphonerc
fi

# Run Linphone
linphone

exit 0

#----------------------------------------------------------------------------------------
# End
#----------------------------------------------------------------------------------------

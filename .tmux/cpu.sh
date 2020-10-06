#!/bin/bash

########################################################################
# CPU usage
CPU=`eval $(awk '/^cpu /{print "previdle=" $5 "; prevtotal=" $2+$3+$4+$5 }' /proc/stat); sleep 0.4; eval $(awk '/^cpu /{print "idle=" $5 "; total=" $2+$3+$4+$5 }' /proc/stat); intervaltotal=$((total-${prevtotal:-0})); echo "$((100*( (intervaltotal) - ($idle-${previdle:-0}) ) / (intervaltotal) ))"`

########################################################################
# Temperature
temperature=`sensors | grep "Package id 0" | awk '{print $4;}' | awk '{printf "%1.0f", $1}';`


########################################################################
# Print
echo -n "CPU: ᚋ $CPU% ( ᚌ $temperature ºC)"

########################################################################

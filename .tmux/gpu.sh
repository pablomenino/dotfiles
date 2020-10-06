#!/bin/bash


host=$(hostname)

HOST_NORC=norc

if [ "$host" == "$HOST_NORC" ];
then

command_exists() {
	local command="$1"
	command -v "$command" &> /dev/null
}

########################################################################
# CPU usage

if command_exists "nvidia-smi"; then
	loads=$(nvidia-smi)
elif command_exists "cuda-smi"; then
	loads=$(cuda-smi)
else
	echo "nvidia-smi/cuda-smi not found"
	return
fi
loads=$(echo "$loads" | sed -nr 's/.*\s([0-9]+)%.*/\1/p')
gpus=$(echo "$loads" | wc -l)
load=$(echo "$loads" | awk '{count+=$1} END {print count}')
GPU=`echo "$load $gpus" | awk '{printf "%1.0f%%", $1/$2}'`

# CPU=`eval $(awk '/^cpu /{print "previdle=" $5 "; prevtotal=" $2+$3+$4+$5 }' /proc/stat); sleep 0.4; eval $(awk '/^cpu /{print "idle=" $5 "; total=" $2+$3+$4+$5 }' /proc/stat); intervaltotal=$((total-${prevtotal:-0})); echo "$((100*( (intervaltotal) - ($idle-${previdle:-0}) ) / (intervaltotal) ))"`

########################################################################
# Temperature
temperature=`nvidia-settings -t -q GPUCoreTemp | head -n 1 |  awk '{printf "%1.0f", $1}';`

########################################################################
# Print
echo -n "GPU: ᚋ $GPU ( ᚌ $temperature ºC)"

########################################################################

fi


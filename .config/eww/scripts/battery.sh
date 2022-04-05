#!/bin/bash

batteryper=$(cat /sys/class/power_supply/BAT1/capacity)

(( batteryperround = (batteryper+4)/10, batteryperround *= 10 ))

batstatus=$(cat /sys/class/power_supply/BAT1/status)

Charging=("", "", "", "", "", "", "", "", "", "")

Discharging=("", "", "", "", "", "", "", "", "", "")

if [[ "$1" == "--icon" ]] ; then
    if [[ $batstatus != "Full" ]] ; then
        subst="$batstatus[$((batteryperround/10 - 1))]"
        echo "${!subst:0:1}"
    else
	echo ""
    fi
elif [[ "$1" == "--color" ]] ; then
    if [[ $batteryper < 15 && $batstatus != "Charging" && $batteryper != "100" ]] ; then
	echo "#fc3f3f"
    else
	echo "#bdbdbd"
    fi
else 
    echo $((batteryper))
fi

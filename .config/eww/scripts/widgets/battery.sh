#!/usr/bin/env bash

batteryper=$(cat /sys/class/power_supply/BAT0/capacity)

(( batteryperround = (batteryper+4)/10, batteryperround *= 10 ))

batstatus=$(cat /sys/class/power_supply/BAT0/status)

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
    if [[ $batteryper < 16 && $batstatus != "Charging" && $batteryper != "100" ]] ; then
	echo "#fc3f3f"
    else
	echo "#d1d1d1"
    fi
else 
    echo $((batteryper))
fi

if [[ $((batteryper)) < 16 && $NOTIFIED == 0 ]] ; then
    notify-send "Houston we have a problem." "Battery low"
    NOTIFIED=1
fi

if [[ $((batteryper)) > 16 ]] ; then
    NOTIFIED=0
fi

#!/usr/bin/env bash

volumelev=$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master | sed 's/%//'))
volumelev=$(($volumelev))

isOn=$(awk -F"[][]" '/Left:/ { print $4 }' <(amixer sget Master))

if [[ $volumelev == 0 || $isOn == "off" ]] ; then
    icon="ﱝ"
elif [[ $volumelev > 66 ]] ; then
    icon="墳"
elif [[ $volumelev > 33 ]] ; then
    icon="奔"
else
    icon="奄"
fi

eww update volume="$volumelev"
eww update iconvol="$icon"
echo "$icon"

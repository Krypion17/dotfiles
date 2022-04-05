#!/bin/bash

volumelev=$(awk -F"[][]" '/Mono:/ { print $2 }' <(amixer -c 0 get Master | sed 's/%//'))
volumelev=$((volumelev))

if [[ "$1" == "--icon" ]] ; then
    if [[ $volumelev == 0 ]] ; then
        echo "ﱝ"
    elif [[ $volumelev > 66 ]] ; then
        echo "墳"
    elif [[ $volumelev > 33 ]] ; then
        echo "奔"
    else
        echo "奄"
    fi
else
    echo $volumelev
fi

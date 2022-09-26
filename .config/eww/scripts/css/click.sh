#!/usr/bin/env bash

if [[ "$1" == "vol" ]] ; then
    eww update classvol="clickable-active"
    ~/.config/eww/scripts/widgets/volume.sh
    if [[ "$2" == "true" ]] ; then
        eww update enabledvol=false
        eww close volumepop
    elif [[ "$2" == "false" ]] ; then
        eww open volumepop
        eww update enabledvol=true
    fi
    sleep 0.5
    eww update classvol="clickable"
    eww update iconvol=$(~/.config/eww/scripts/widgets/volume.sh)
elif [[ "$1" == "power" ]] ; then
    eww update classpow="clickable-active"
    ~/.config/rofi/applets/menu/powermenu.sh
    sleep 0.5
    eww update classpow="clickable"
elif [[ "$1" == "cal" ]] ; then
    eww update classcal="clickable-active"
    if [[ "$2" == "true" ]] ; then
        eww update calenabled=false
        eww close calendarpop
    else
        eww open calendarpop
        eww update calenabled=true
    fi
    sleep 0.5
    eww update classcal="clickable"
elif [[ "$1" == "1" ]] ; then
    eww update class1="clickable-active"
    ~/.config/eww/scripts/widgets/workspaces.sh $1
    sleep 0.5
    eww update class1="clickable"
elif [[ "$1" == "2" ]] ; then
    eww update class2="clickable-active"
    ~/.config/eww/scripts/widgets/workspaces.sh $1
    sleep 0.5
    eww update class2="clickable"
elif [[ "$1" == "3" ]] ; then
    eww update class3="clickable-active"
    ~/.config/eww/scripts/widgets/workspaces.sh $1
    sleep 0.5
    eww update class3="clickable"
elif [[ "$1" == "4" ]] ; then
    eww update class4="clickable-active"
    ~/.config/eww/scripts/widgets/workspaces.sh $1
    sleep 0.5
    eww update class4="clickable"
elif [[ "$1" == "5" ]] ; then
    eww update class5="clickable-active"
    ~/.config/eww/scripts/widgets/workspaces.sh $1
    sleep 0.5
    eww update class5="clickable"
fi

#!/bin/bash

if [[ "$1" == "vol" ]] ; then
    eww update classvol="clickable-active"
    sleep 0.5
    eww update classvol="clickable"
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

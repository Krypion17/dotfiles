#!/usr/bin/env bash

title=$(xdotool getwindowfocus getwindowname)

if [[ ${#title} < 2 ]] ; then
    echo "Home"
else
    echo $title
fi

#!/bin/bash

title=watch xdotool getwindowfocus getwindowname

if [[ $title == null ]] ; then
    echo "Home"
else
    echo $title
fi

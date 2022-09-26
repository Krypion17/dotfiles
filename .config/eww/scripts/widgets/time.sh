#!/usr/bin/env bash

hour=$(date +%I)
hour=${hour#0}

icons=("" "" "" "" "" "" "" "" "" "" "" "" "")

if [[ "$1" == "--icon" ]] ; then
    echo ${icons[hour]}
elif [[ "$1" == "--full-time" ]] ; then
    echo "$(date +%a) $(date +%d) $(date +%b), $(date +%Y)"
else
    echo $(date +%I:%M%p)
fi

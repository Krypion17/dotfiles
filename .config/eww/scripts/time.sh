#!/bin/bash

hour=$(date +%I)

icons=("" "" "" "" "" "" "" "" "" "" "" "" "")

echo ${icons[$((hour))]}

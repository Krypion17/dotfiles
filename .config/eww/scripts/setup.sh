#!/usr/bin/env bash

eww update volume="$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer -D pulse sget Master | sed 's/%//'))"

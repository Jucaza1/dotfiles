#!/bin/sh

while true
do
find ~/wall/ -type f \( -name '*.jpg' -o -name '*.png' -o -name '*.jpeg' -o -name '*.gif' \) -print0 |
	shuf -n1 -z | xargs -0 feh --bg-scale
sleep 5m
done

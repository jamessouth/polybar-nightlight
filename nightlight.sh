#!/usr/bin/env bash

displays=(eDP-1)
profiles=(
	1:1:1
	1:.97:.94
	1:.93:.88
	1:.90:.81
	1:.86:.73
	1:.82:.64
	1:.77:.54
	1:.71:.42
	1:.68:.35
	1:.64:.28
	1:.59:.18
	1:.54:.08
	1:.32:.03
	1:.18:.01
)

config="${XDG_DATA_HOME:-$HOME/.local/share}/$(basename "$0" .sh)"

# shellcheck source=/dev/null
source "$config"

len=${#profiles[@]}

# shellcheck disable=SC2154
case "$1" in
	"+" )    new_ind=$((ind+1 > len-1 ? len-1 : ind+1));;
	"-" )    new_ind=$((ind-1 < 0 ? 0 : ind-1));;
esac

new_prof="${profiles[$new_ind]}"

for display in "${displays[@]}"; do
	xrandr --output "$display" --gamma "${new_prof}"
done

echo "ind=${new_ind}" > "$config"
echo "${new_prof}"

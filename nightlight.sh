#!/usr/bin/env bash

usage() {
	echo "$(basename "$0") [+|-]"
}

displays=(DisplayPort-0 DisplayPort-1)
profiles=(
	1:.18:.01
	1:.32:.03
	1:.54:.08
	1:.59:.18
	1:.64:.28
	1:.68:.35
	1:.71:.42
	1:.77:.54
	1:.82:.64
	1:.86:.73
	1:.90:.81
	1:.93:.88
	1:.97:.94
	1:1:1
)

[[ $# -gt 1 ]] && { usage; exit 1; }

# default
profile="${profiles[-1]}"
config="$XDG_DATA_HOME/$(basename "$0" .sh)"
index=-1

[[ -f "$config" ]] && source "$config"
for i in "${!profiles[@]}"; do
	if [[ "${profiles[$i]}" = "$profile" ]]; then
		index="$i"
		break
	fi
done

profiles_max="$((${#profiles[@]} - 1))"
current_choice="${profiles[$index]}"

case "$1" in
	"+" )
		if [ "$index" -lt "$profiles_max" ]; then
			new_choice="${profiles[$((index + 1))]}"
		fi
		;;

	"-" )
		if [ "$index" -gt 0 ]; then
			new_choice="${profiles[$((index - 1))]}"
		fi
		;;
esac

if [ -n "$new_choice" ]; then
	for display in "${displays[@]}"; do
		xrandr --output "$display" --gamma "${new_choice}"
	done

	echo "profile=${new_choice}" > "$config"
fi

echo " ${new_choice:-$current_choice}"

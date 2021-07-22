#!/usr/bin/env bash

indexFile="$1"

dataFile="$2"

current_index=$(cat "$indexFile")

len=$(wc -l "$dataFile" | cut -d' ' -f1)

case "$3" in
	"+" )   new=$((current_index + 1))
		new_index=$((new > len ? len : new));;

	"-" )   new=$((current_index - 1))
		new_index=$((new < 1 ? 1 : new));;
esac

gamma=$(sed -n "${new_index}"p "$dataFile")

xrandr --output "$4" --gamma ${gamma}
#xrandr --output "$5" --gamma ${gamma}
#xrandr --output "$6" --gamma ${gamma}

echo ${new_index} > "$indexFile"
echo ${gamma}

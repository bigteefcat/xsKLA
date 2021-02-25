#! /bin/bash
. ./config.txt


analyzeText () {
	layout=$1
	input=$1	
}

formatLayout () {
	. $1
	e=("monkey")
	declare -A array
	for (( z=1; z<="$layers"; z++ )); do
		for (( y=1; y<="$columnLength"; y++ )); do
			for (( x=1; x<="$rowLength"; x++ )); do
				let element=$x-$rowLength+$y*$rowLength
			#	echo "$element"
				array[$x,$y,$z]="${e[$element]}"
			done
		done
	done
	echo "${array[1,1,1]}"
}

formatLayout $1

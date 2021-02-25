#! /bin/bash


formatText () {
	# turns input into array of words and formats it
	while read line; do
	inputLines+=("$line") # turns input into lines
	while read -a word; do # turns lines into words
		for i in "${word[@]}"; do
			inputWords+=("$i" "SPACE") # adds word and SPACE to new array for every word
		done
	done < <(echo "$line")
	inputWords+=("$word" "ENTER") # adds the last word of the line along with ENTER
	done < $1

	# repeats line to words for the last line of the array
	while read -a word; do
	for word in "${word[@]}"; do
		inputWords+=("$word" "SPACE")
	done
	done < <(echo "$line")

	# turn words array into letters
	for word in "${inputWords[@]}"; do 
	case "$word" in
		"SPACE" ) inputLetters+=("SPACE") ;;
		"ENTER" ) inputLetters+=("ENTER") ;;
		"TAB" ) inputLetters+=("TAB") ;;
		* )  
		while read -N1 letter; do
			inputLetters+=("$letter")
		done < <(echo "$word")
		inputLetters+=("$letter")
		;;
	esac
	done

	# deletes \r's and \n's
	for (( i="${#inputLetters[@]}"; i>=0; i-- )); do 
	if [[ "${inputLetters[$i]}" == $'\r' ]] || [[ "${inputLetters[$i]}" == $'\n' ]] || [[ -z "${inputLetters[$i]}" ]]; then
		unset "inputLetters[$i]"
	fi
	done
	inputLetters=("${inputLetters[@]}") # re-indexing

	for (( i=0; i<"${#inputLetters[@]}"; i++ )); do
	case ${inputLetters[$i]} in
		ENTER ) unset "inputLetters[$i-1]" ;; # removes the space before enters
		TAB ) unset "inputLetters[$i+1]" ;; # removes the spaces after tabs
		* ) ;;
	esac
	done

	inputLetters=("${inputLetters[@]}") # re-indexing


	for i in "${inputLetters[@]}"; do
		echo "$i" >> $2
	done
}

run () {
	loading="true"
	for i in ./input/*.txt; do 
		file=$(basename $i .txt)
		if [[ ! -f ./input/formatted/$file-formatted.txt ]]; then
			( formatText $i ./input/formatted/$file-formatted.txt ) &
		fi
	done
	
	wait
	loading="false"
}

if [[ -d "./input/formatted" ]]; then
	run
else
	mkdir ./input/formatted
	run
fi

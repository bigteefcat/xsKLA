#!/bin/bash
input="$1"
layout="$2"



### Make an array of letters from the input file ###

# make array of words
while read line; do
	input_words+=("$line" "ENTER")
done < $input
input_words+=("$line") # add last line to array
for (( i="${#input_words[@]}"; i>0; i-- )); do
	if [[ -z "${input_words[$i]}" ]]; then
		unset "input_words[$i]"
	fi
done # remove empty strings


# translate word array to letters_raw
for i in "${input_words[@]}"; do
	if [[ $i != "ENTER" ]]; then
		while read -N1 letter; do
			input_letters_raw+=("$letter")
		done < <(echo "$i") # seperate words into letters
	else
		input_letters_raw+=("ENTER") # if item is ENTER add ENTER to letter_raw
	fi
done


# format letters_raw into letters_processed
for (( i="${#input_letters_raw[@]}"; i>0; i-- )); do
	if [[ "${input_letters_raw[$i]}" == $'\n' ]]; then
		unset "input_letters_raw[$i]" # remove line breaks
	elif [[ "${input_letters_raw[$i]}" == [[:space:]] ]]; then
                # echo "$i"
		input_letters_raw[$i]="SPACE" # replace empty strings with SPACE
	fi
done
for (( i=0; i<"${#input_letters_raw[@]}"; i++ )); do
	if [[ -n "${input_letters_raw[$i]}" ]]; then
		input_letters_processed+=("${input_letters_raw[$i]}")
	fi
done # transfers letters_raw into letters_processed to remove gaps



### Calculate finger strain and travel distances  ###

# source layouts and config
. ./config.txt
. $2


# find location of input key, calculate strain based off and key travel, then strain based off location of other fingers


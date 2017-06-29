#!/bin/bash

#create audio files for uttering multiplication table
#loop from 1 to 10
for i in {1..10}
do
	#t is multiplication of input with the counter i
	t=$(($1*$i))
	#touch create an empty file with the given file name
	file="table$i.wav"
	touch $file
	#display in the terminal what is being written in which file
	echo "$1 times $i equals $t $file"
	#espeak create an utterance of the above text and store in the respective file
	espeak -ven+f3 -s150 "$1 times $i equals $t" -w $file
done

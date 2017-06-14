#!/bin/bash
for i in {1..10}
do
	t=$(($1*$i))
	file="table$i.wav"
	echo "$1 times $i equals $t $file"
	espeak -ven+f3 -s150 "$1 times $i equals $t" -w $file
done

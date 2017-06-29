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

#!/bin/bash

#initial announcement
espeak -ven+f3 -s150 "Your resting time starts now" -w table.wav
aplay table.wav

#signal to EEG setup through arduino
#IMPORTANT: you may need to change ACM0 that arduino is using
#It can be check by comparing the result of command "ls /dev/tty*" without quotes before and after pluging the arduino
echo aa > /dev/ttyACM0 9600

#waiting period of 3s
sleep 30

#Table recitation begin
espeak -ven+f3 -s150 "Table begins now" -w table11.wav

#signal is send before the playing the file
echo aa > /dev/ttyACM0 9600
aplay table11.wav

#wait for 3s
sleep 3

#recitation in loop from 1 to 10
for i in {1..10}
do
	file="table$i.wav"
	echo aa > /dev/ttyACM0 9600
	aplay $file
	sleep 3
done

for i in {1..10}
do
	rm "table$i.wav"
done

rm "table.wav"
rm "table11.wav"
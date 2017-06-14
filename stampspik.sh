#!/bin/bash
#espeak -ven+f3 -s150 "Your resting time starts now" -w table.wav
aplay table.wav
echo aa > /dev/ttyACM0 9600
sleep 30
#espeak -ven+f3 -s150 "Table begins now" -w t2able.wav
echo aa > /dev/ttyACM0 9600
aplay t2able.wav
sleep 3
for i in {1..10}
do
	file="table$i.wav"
	echo aa > /dev/ttyACM0 9600
	aplay $file
	sleep 3
done

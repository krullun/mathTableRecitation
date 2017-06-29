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

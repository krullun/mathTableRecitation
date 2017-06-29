#MTR

#Requirements
##Hardware
-	Raspberry pi 3 with latest version of [Raspbian OS](https://www.raspberrypi.org/downloads/raspbian/)
-	Arduino Uno

#Setup
##Setup (Raspberry Pi)
-	[Enable SSH](https://hackernoon.com/raspberry-pi-headless-install-462ccabd75d0) on Pi by creating a file named ‘ssh’ without any extension on the SD card containing the Raspian OS.
-	Download [Putty](http://www.putty.org/) and [Xming](https://sourceforge.net/projects/xming/) 
-	Open Xming, it will keep running in the background.
-	In Command Prompt, use `ipconfig` to find the ip address assigned to Pi.
-	In Putty, enter username: **pi@<ip-address>** and password: **raspberry**
-	Also go to Connection->SSH->X11, tick Enable X11 forwarding and change X Display location to -> **localhost:0**
-	Now type the command: `lxsession`. This should now open a GUI of Pi.
-	Install Espeak (Voice Synthesizer). Follow [this guide](https://www.pubnub.com/blog/2015-10-14-text-to-speech-audio-broadcast-with-raspberry-pi/) to setup speakers and install espeak.
-	Download [mtr.sh](https://github.com/krullun/mathTableRecitation/blob/master/mtr.sh) file to Pi using [WinSCP](https://winscp.net/eng/download.php).
-	Open terminal on Pi.
-	Change the working directory of terminal to the location of **mtr.sh** file using command: `cd <path/to/the/file>`
-	Run this command: `sudo chmod +x mtr.sh`
##Setup (Arduino)
-	Install the Arduino driver and IDE on your computer. [Here’s the guide](https://www.arduino.cc/en/Guide/ArduinoUno).
-	Upload [Blink.ino](https://github.com/krullun/mathTableRecitation/blob/master/Blink.ino) file to Arduino Uno.
-	Connect Arduino Uno to Raspberry Pi using the USB cable.
-	Check the port assigned to the Arduino Uno by comparing the result of the command of the `ls /dev/tty*` before and after connecting the Uno to Pi. By default its set to **/dev/ttyACM0**.  If it is different in your case then change it where it is IMPORTANT in mtr.sh file using sudo nano mtr.sh
##Usage
-	Now run `./mtr.sh <#number>`  to recite the multiplication table of the number.

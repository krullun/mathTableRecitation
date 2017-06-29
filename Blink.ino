int incomingByte = 0;
int led = 13;
void setup() {
Serial.begin(9600); // opens serial port, sets data rate to 9600 bps
pinMode(led, OUTPUT);
}
void loop() {
  if (Serial.available() > 0) {
    incomingByte = Serial.read(); // read the incoming byte:
    Serial.print(" I received:");
    Serial.println(incomingByte);
  }
  if (incomingByte == 97)
    digitalWrite(led, HIGH);
  else
    digitalWrite(led, LOW);
}

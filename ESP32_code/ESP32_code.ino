/*
  Blink
*/

//Setting Constants for GPIO Pins on ESP32
const int button = 14;
const int flip = 12;
const int joyy = 32;
const int joyx = 35;

//Declaring analog values for input
int analog_value = 0;
int analogs_value = 0;
int analogy_value = 0;
int analogx_value = 0;

//Output string that concatenates analog values
String msgOut;

void setup() {
  //Establish Serial connection and initialize pins as input
  Serial.begin(115200);
  pinMode(button, INPUT);
  pinMode(flip, INPUT);
  pinMode(joyy, INPUT);
  pinMode(joyx, INPUT);
  delay(1000);
}

// the loop function runs over and over again forever
void loop() {

  //Button
  analog_value = analogRead(button);

  //Joystick
  analogy_value = analogRead(joyy);
  analogx_value = analogRead(joyx);

  //Switch
  analogs_value = analogRead(flip);

  //Combining values and sending it out
   msgOut = String(analog_value) + ", " + String(analogs_value) + ", " + String(analogy_value) + ", " + String(analogx_value);
   Serial.println(msgOut);

   delay(200);
  
}

/*
  Blink
*/

// ledPin refers to ESP32 GPIO 14
//const int button = 14;
//const int flip = 12;
//was using 17 and 18
const int joyy = 12;
const int joyx = 14;
//  int analog_value = 0;
//  int analogs_value = 0;
int analogy_value = 0;
int analogx_value = 0;

// the setup function runs once when you press reset or power the board
void setup() {
  // initialize digital pin ledPin as an output.
  Serial.begin(115200);
//  pinMode(button, INPUT);
//  pinMode(flip, INPUT);
  pinMode(joyy, INPUT);
  pinMode(joyx, INPUT);
  delay(1000);
}

// the loop function runs over and over again forever
void loop() {

  //Button
//  analog_value = analogRead(button);
//  Serial.print(analog_value, DEC);
//  delay(200);

  //Joystick
  analogy_value = analogRead(joyy);
  analogx_value = analogRead(joyx);

//  Serial.println(analogy_value, DEC);
  Serial.println(analogx_value, DEC);

  delay(200);

   //Switch
//   analogs_value = analogRead(flip);
//   Serial.print(analogs_value, DEC);
//   delay(200);
  
}

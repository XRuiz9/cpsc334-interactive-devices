/*
  Blink
*/

// ledPin refers to ESP32 GPIO 14
const int button = 14;
//const int joyy = 12;
//const int joyx = 13;
  int analog_value = 0;
//int analogy_value = 0;
//int analogx_value = 0;

// the setup function runs once when you press reset or power the board
void setup() {
  // initialize digital pin ledPin as an output.
  Serial.begin(9600);
  pinMode(button, OUTPUT);
//  pinMode(joyy, INPUT);
//  pinMode(joyx, INPUT);
  delay(1000);
  Serial.println("ESP32 Analog IN Test");
}

// the loop function runs over and over again forever
void loop() {

  //Button
  analog_value = analogRead(button);
  Serial.println(analog_value);
  delay(500);

  //Joystick
//  analogy_value = analogRead(joyy);
//  analogx_value = analogRead(joyx);

//  Serial.println(analogy_value);
//  Serial.println(analogx_value);
//  Serial.println("x:" + analogx_value);

  delay(500);
  
}

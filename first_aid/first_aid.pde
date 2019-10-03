import processing.serial.*;

int emote = 0;
boolean pressButton = false;
boolean flipSwitch = false;
boolean joyRight = false;
boolean joyLeft = false;
boolean joyUp = false;
boolean joyDown = false;

int joyLimit = 0;

Serial myPort;  // The serial port

void setup() {
  // List all the available serial ports
  printArray(Serial.list());
  // Open the port you are using at the rate you want:
  myPort = new Serial(this, Serial.list()[11], 115200);
}

//save

void beSad() {
  pressButton = false;
  flipSwitch = false;
  joyDown = false;
  joyUp = false;
  joyRight = false;
  joyLeft = false;
  
  float button = random(0, 1);
  float flip = random(0, 1);
  float axis = random(0, 1);
  float y = random(0, 1);
  float x = random(0, 1);
  
  //Setting Button Limit
  if (button >= 0.5) {
    pressButton = true;
  }
  
  //Setting Flip Limit
  if (flip >= 0.5) {
    flipSwitch = true;
  }
  
  //Setting Joystick Limit
  if (axis >= 0.5) {
    if (y >= 0.5) {
      joyDown = true;
    } else {
      joyUp = true;
    }
  } else {
    if (x >= 0.5) {
      joyRight = true;
    } else {
      joyLeft = true;
    }
  }
  
}

void draw() {
  beSad();
  println(buttonLimit, flipLimit, joyLimit);
  //while (myPort.available() > 0) {
  //  String inMsg = myPort.readString();
  //  println(inMsg);
    
  //  String[] input = split(inMsg, ", ");
    
  //  // Button
  //  if (input[0] > 2000) {
  //  }
    
  //  // Switch
  //  if (input[1] > 1000) {
  //  }
    
  //  // YJoystick
  //  if (input[2] > 1000) {
  //  }
    
  //  // XJoystick
  //  if (input[3] > 1000) {
  //  }
    
    
  //  //if (inInt > 900) {
  //  //  background(255, 186, 240);
  //  //}
  //  //else {
  //  //  background(0);
  //  //}
  //}
}

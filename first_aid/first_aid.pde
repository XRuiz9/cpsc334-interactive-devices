import processing.serial.*;

int emote = 0;
boolean pressButton = false;
boolean flipSwitch = false;
boolean joyUp = false;
boolean joyDown = false;
boolean joyLeft = false;
boolean joyRight = false;


Serial myPort;  // The serial port

void setup() {
  // List all the available serial ports
  printArray(Serial.list());
  // Open the port you are using at the rate you want:
  myPort = new Serial(this, Serial.list()[11], 115200);
}

void beSad() {
  //Reset all values
  pressButton = false;
  flipSwitch = false;
  joyUp = false;
  joyDown = false;
  joyLeft = false;
  joyRight = false;
  emote = 0;
  
  //Create random seed that will establish new expected input
  float button = random(0, 1);
  float flip = random(0, 1);
  float axis = random(0, 1);
  float y = random(0, 1);
  float x = random(0, 1);
  
  //Setting button input
  if (button >= 0.5) {
    pressButton = true;
  }
  
  //Setting switch input
  if (flip >= 0.5) {
    flipSwitch = true;
  }
  
  //Setting joystick axis
  if (axis >= 0.5) {
    //Setting joystick y input
    if (y >= 0.5) {
      joyDown = true;
    } else {
      joyUp = true;
    }
  } else {
    //Setting joystick x input
    if (x >= 0.5) {
      joyRight = true;
    } else {
      joyLeft = true;
    }
  }
  println("I'm sad again.");
}

void beHappy() {
  println("Finally, I am happy!");
  delay(5000);
  beSad();
}

void draw() {
  if (emote == 3) {
    beHappy();
  }
  
  if (pressButton) {
    if (input[0] > 2000) {
      emote += 1;
      pressButton = false;
    }
  }
  
  if (flipSwitch) {
    if (input[1] > 3000) {
      emote += 1;
      flipSwitch = false;
    }
  }
  
  if (joyUp) {
    if (input[2] < 500) {
      emote += 1;
      joyUp = false;
    }
  }
  
  if (joyDown) {
    if (inpuy[2] > 3000) {
      emote += 1;
      joyDown = false;
    }
  }
  
  if (joyLeft) {
    if (input[3] < 500) {
      emote += 1;
      joyLeft = false;
    }
  }
  
  if (joyRight) {
    if (input[3] > 3000) {
      emote += 1;
      joyRight = false;
    }
  }
 
  //while (myPort.available() > 0) {
  //  String inMsg = myPort.readString();
  //  println(inMsg);
    
  //  String[] input = split(inMsg, ", ");
    
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

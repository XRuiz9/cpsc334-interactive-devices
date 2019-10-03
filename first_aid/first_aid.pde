import processing.serial.*;

int emote, emoteLimit;
boolean pressButton, flipSwitch, joyUp, joyDown, joyLeft, joyRight;
PImage face1, face2, face3, face4;

Serial myPort;  // The serial port

void setup() {
  // List all the available serial ports
  //printArray(Serial.list());
  // Open the port you are using at the rate you want:
  size(800, 480);
  
  myPort = new Serial(this, Serial.list()[11], 115200);
  
  face1 = loadImage("face1.png");
  face2 = loadImage("face2.png");
  face3 = loadImage("face3.png");
  face4 = loadImage("face4.png");
  
  emote = 3;
  emoteLimit = 3;
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
  image(face1, 0, 0);
  println(face1);
  println("Finally, I am happy!");
  delay(5000);
  beSad();
}

void displayFace() {
  
  if (emote == (emoteLimit - 1)) {
    image(face2, 0, 0);
  }
  
  if (emote == (emoteLimit - 2)) {
    image(face3, 0, 0);
  }
  
  if (emote == (emoteLimit - 3)) {
    image(face4, 0, 0);
  }
}

void draw() {
  while (myPort.available() > 0) {
    String inMsg = myPort.readString();
    println(inMsg);
    displayFace();
    String[] input = split(inMsg, ",");
    //printArray(input);
  
    if (emote == emoteLimit) {
      beHappy();
      println(pressButton, flipSwitch, joyUp, joyDown, joyLeft, joyRight);
      emoteLimit = int(pressButton) + int(flipSwitch) + int(joyUp) + int(joyDown) + int(joyLeft) + int(joyRight);
    }
    
    if (pressButton) {
      if (int(input[0]) < 100) {
        emote += 1;
        pressButton = false;
        println("Feeling better..");
      }
    }
    
    if (flipSwitch) {
      if (int(input[1]) > 3000) {
        emote += 1;
        flipSwitch = false;
        println("Feeling better..");
      }
    }
    
    if (joyUp) {
      if (int(input[2]) < 500) {
        emote += 1;
        joyUp = false;
        println("Feeling better..");
      }
    }
    
    if (joyDown) {
      if (int(input[2]) > 3000) {
        emote += 1;
        joyDown = false;
        println("Feeling better..");
      }
    }
    
    if (joyLeft) {
      if (int(input[3]) < 500) {
        emote += 1;
        joyLeft = false;
        println("Feeling better..");
      }
    }
    
    if (joyRight) {
      if (int(input[3]) > 3000) {
        emote += 1;
        joyRight = false;
        println("Feeling better..");
      }
    }
  }
        
  //  //if (inInt > 900) {
  //  //  background(255, 186, 240);
  //  //}
  //  //else {
  //  //  background(0);
  //  //}
  //}
}

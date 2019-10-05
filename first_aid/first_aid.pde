import processing.serial.*;
import ddf.minim.*;
import ddf.minim.ugens.*;

//Handle Audio Sources
Minim minim;
AudioOutput out;
Sampler allBetterS, sadAgainS, better1S, better2S;


int emote, emoteLimit, tStart;
boolean isSad, pressButton, switchOn, switchOff, joyUp, joyDown, joyLeft, joyRight;
PImage face1, face2, face3, face4;

//Establish Serial Port
Serial myPort;

void setup() {
  size(800, 480);
  
  myPort = new Serial(this, Serial.list()[11], 115200);
  
  //Load faces
  face1 = loadImage("face1.png");
  face2 = loadImage("face2.png");
  face3 = loadImage("face3.png");
  face4 = loadImage("face4.png");
  
  //Load sounds
  minim = new Minim(this);
  out = minim.getLineOut();
  allBetterS = new Sampler("AllBetter.wav", 4, minim);
  allBetterS.patch(out);
  sadAgainS = new Sampler("SadAgain.wav", 4, minim);
  sadAgainS.patch(out);
  better1S = new Sampler("Better1.wav", 4, minim);
  better1S.patch(out);
  better2S = new Sampler("Better2.wav", 4, minim);
  better2S.patch(out);
  
  //Set Start Emotion
  emote = 3;
  emoteLimit = 3;
}

//Function to randomize expected input
void beSad() {
  
  //Reset all values
  isSad = true;
  pressButton = false;
  switchOn = false;
  switchOff = false;
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
    switchOn = true;
  } else {
    switchOff = true;
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
}

//Display proper face image depending on emote level
void displayFace() {
  if (emote == emoteLimit) {
    image(face1, 0, 0);
    isSad = false;
  }
  
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

//Play proper sound depending on emote level
void playSound() {
  if (emote == emoteLimit) {
    allBetterS.trigger();
  }
  
  if (emote == (emoteLimit - 1)) {
    better2S.trigger();
  }
  
  if (emote == (emoteLimit - 2)) {
    better1S.trigger();
  }
}

void draw() {

  while (myPort.available() > 0) {
    displayFace();
    
    String inMsg = myPort.readString();
    String[] input = split(inMsg, ",");
    
    //Updates timer as long until is not sad
    if (isSad) {
      tStart = millis();
    }
  
    //Sets random timer to be sad again
    if (emote == emoteLimit) {
      if (millis() - tStart > random(5000, 10000)) {
        beSad();
        
        //Useful message for debugging
        println(pressButton, switchOn, switchOff, joyUp, joyDown, joyLeft, joyRight);
        
        emoteLimit = int(pressButton) + int(switchOn) + int(switchOff) + int(joyUp) + int(joyDown) + int(joyLeft) + int(joyRight);
        
        sadAgainS.trigger();
      }
    }
    
    //Println messages are for making sure input is being properly received
    
    if (pressButton) {
      if (int(input[0]) < 100) {
        emote += 1;
        pressButton = false;
        playSound();
        println("Feeling better... button");
      }
    }
    
    if (switchOn) {
      if (int(input[1]) > 3000) {
        emote += 1;
        switchOn = false;
        playSound();
        println("Feeling better... switchon");
      }
    }
    
    if (switchOff) {
      if (int(input[1]) < 3000) {
        emote += 1;
        switchOff = false;
        playSound();
        println("Feeling better... switchoff");
      }
    }
    
    if (joyUp) {
      if (int(input[2]) < 500) {
        emote += 1;
        joyUp = false;
        playSound();
        println("Feeling better... jup");
      }
    }
    
    if (joyDown) {
      if (int(input[2]) > 3000) {
        emote += 1;
        joyDown = false;
        playSound();
        println("Feeling better... jdown");
      }
    }
    
    if (joyLeft) {
      if (int(input[3]) < 500) {
        emote += 1;
        joyLeft = false;
        playSound();
        println("Feeling better... jleft");
      }
    }
    
    if (joyRight) {
      if (int(input[3]) > 3000) {
        emote += 1;
        joyRight = false;
        playSound();
        println("Feeling better... jright");
      }
    }
  }
}

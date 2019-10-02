import processing.serial.*;

Serial myPort;  // The serial port

void setup() {
  // List all the available serial ports
  printArray(Serial.list());
  // Open the port you are using at the rate you want:
  myPort = new Serial(this, Serial.list()[11], 115200);
}

void draw() {
  while (myPort.available() > 0) {
    int inInt = int(myPort.readString());
    println(inInt);
    
    if (inInt > 900) {
      background(255, 186, 240);
    }
    else {
      background(0);
    }
  }
}

import processing.serial.*;
Serial myPort;

void setup(){
  println(Serial.list());
  myPort = new Serial(this, Serial.list()[6], 9600);
  myPort.write("IN;");  //Here come the commands!
}

void draw(){    
  myPort.write("CI"); //draw a circle
  myPort.write(random(7000)); //set the circle size
  myPort.write(";"); //send the command
  
  delay(300); //wait a bit to give the machine some rest
}

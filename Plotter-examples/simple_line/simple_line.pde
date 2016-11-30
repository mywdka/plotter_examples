import processing.serial.*;
Serial myPort;

void setup(){
  println(Serial.list());
  myPort = new Serial(this, Serial.list()[6], 9600);
  myPort.write("IN;");  //Here come the commands!
  myPort.write("PA1000,1000;"); //Go to 1000, 1000
  
  myPort.write("PD;"); //Put pen on paper
  myPort.write("PA2000,2000;"); //Go to 2000, 2000
}

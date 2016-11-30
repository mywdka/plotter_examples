import processing.serial.*;
Serial myPort;

void setup(){
  println(Serial.list());
  myPort = new Serial(this, Serial.list()[6], 9600);
  myPort.write("IN;");  //Here come the commands!
  myPort.write("LB"+ "Hello world!"); //write the label "hello world"
}

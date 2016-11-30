import processing.serial.*;
Serial myPort;

void setup(){
  println(Serial.list());
  try{
     String portName = Serial.list()[6];
     myPort = new Serial(this, portName, 9600); 
     myPort.write("IN");
     
   }catch ( Exception e){println(e); }
}

void draw(){
  
  plotterLine( random(7000) , random(7000) , 3000 , 3000 );
  
  delay(300);
  
}

void plotterLine(float x1, float y1, float x2, float y2) {
   myPort.write("PU");
   myPort.write("PA" + str(x1) + "," + str(y1) +";");
   myPort.write("PD");
   myPort.write("PA" + str(x2) + "," + str(y2) +";");
   myPort.write("PU");
}

import processing.serial.*;
Serial myPort;  // Create object from Serial class

int maxX = 15500; // hoogte van a3 papier
int maxY = 11000; // breedte van a3 papier

void setup(){
   size(1000,1000);
  background(255);
  stroke(21);  
  
  println(Serial.list());
  
  try{
     String portName = Serial.list()[0];
     myPort = new Serial(this, portName, 9600); 
     myPort.write("IN"); 
     myPort.write("PD");
  }catch ( Exception e){ 
     println(e); 
  }
   
  float x;
  float y;
  float i = 0;
  while (i < (1000*PI))
  {
    x= maxX/2 + (maxX/2)*sin(PI*i);
    y= (maxY/2) + (maxY/2) * cos(i*PI)*cos(i*PI*1.2);
    plotterLine(x,y);
    i = i + 0.27;
    delay(350);
  }
 }
              
void plotterLine(float x, float y){    
    myPort.write("PA" + str((int)x) + "," + str((int)y) +";");
} 

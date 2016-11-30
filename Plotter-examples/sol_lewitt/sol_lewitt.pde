import processing.serial.*;
Serial myPort;

float x[] = new float[10];
float y[] = new float[10];

void setup(){
  println(Serial.list());
  try{
     String portName = Serial.list()[0];
     myPort = new Serial(this, portName, 9600); 
     myPort.write("IN");
     
     for(int i = 0;i<10;i++){
        x[i] = int(random(15500));
        y[i] = int(random(11000));
     }
      
    for(int i=0;i<x.length;i++){
      for(int j=0;j<x.length;j++){
        plotterLine(x[i],y[i],x[j],y[j]);
         delay(500);
      } 
    }
     
   }catch ( Exception e){println(e); }
}

void plotterLine(float x1, float y1, float x2, float y2) {
   myPort.write("PU");
   myPort.write("PA" + str(x1) + "," + str(y1) +";");
   myPort.write("PD");
   myPort.write("PA" + str(x2) + "," + str(y2) +";");
   myPort.write("PU");
}

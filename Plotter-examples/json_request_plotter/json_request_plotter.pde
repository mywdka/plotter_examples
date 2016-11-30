import processing.serial.*;
Serial myPort;  

String baseURL = "http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&num=8&q=http%3A%2F%2Fnews.google.com%2Fnews%3Foutput%3Drss";

void setup() {

  JSONObject json = loadJSONObject(baseURL);
  JSONObject data = json.getJSONObject("responseData");
  JSONObject feed = data.getJSONObject("feed");
  JSONArray entries = feed.getJSONArray("entries");
  JSONObject artikel1 = entries.getJSONObject(0);

  try{
       String portName = Serial.list()[0];
       myPort = new Serial(this, portName, 9600);    
       myPort.write("IN;");
       myPort.write("PA1000,1000;"); 
       myPort.write("LB"+artikel1.getString("title"));   
     }catch ( Exception e){    
     }

    delay(1000);
    
     
  
  print(artikel1.getString("title"));
}


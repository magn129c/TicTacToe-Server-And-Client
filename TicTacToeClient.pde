import processing.net.*; 

Client myClient; 
String playerID = str((int)(random(1, 5000000)));
int dataIn; 
 
void setup() { 
  size(200, 200); 
  myClient = new Client(this, "10.202.144.163",5100);
  myClient.write(playerID);
  println(playerID);
  
} 
 
void draw() { 


} 

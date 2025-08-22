import processing.net.*;

Server ticTacToeServer;
Client player1;
Client player2;

String player1IP;
String player2IP;

int port = 5100;

void setup() {
  size(200, 200);
  ticTacToeServer = new Server(this, port); 
}

void draw() {
  player1 = ticTacToeServer.available();
  if(player1 != null) {
    String player1IP = player1.readString();
    if(player1IP != null) {
      println("P1 ip: " + player1IP);
    }
  }
  
  player2 = ticTacToeServer.available();
  if(player2 != null) {
    String player2IP = player2.readString();
    if(player2IP != null) {
      println("P2 ip: " + player2IP);
    }
  } 
}

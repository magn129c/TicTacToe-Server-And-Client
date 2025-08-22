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
    String player1ID = player1.readString();
    if(player1ID != null) {
      println("P1 ID: " + player1IP);
    }
  }
  
  player2 = ticTacToeServer.available();
  if(player2 != null) {
    String player2ID = player2.readString();
    if(player2ID != null) {
      println("P2 ID: " + player2IP);
    }
  } 
}

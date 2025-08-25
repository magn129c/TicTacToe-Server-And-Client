import processing.net.*; //<>//

Server ticTacToeServer;
Client player1;
Client player2;

String player1ID;
String player2ID;

int port = 5100;

String board;
boolean duringGame = false;
int playerTurn;

void setup() {
  size(200, 200);
  ticTacToeServer = new Server(this, port);
}

void draw() {
  if (player1 == null) {
    player1 = ticTacToeServer.available();
    if (player1 != null) {
      player1ID = player1.readString();
      if (player1ID != null) {
        println("P1 ID: " + player1ID);
      }
    }
  } else if (player1 != null && player2 == null) {
    player2 = ticTacToeServer.available();
    if (player2 != null) {
      player2ID = player2.readString();
      if (player2ID != null) {
        println("P2 ID: " + player2ID);
      }
    }
  } else {
    if(!duringGame) {
      startGame();
      
      String player1Board = board + " " + player1ID.toString() + " 1";
      String player2Board = board + " " + player2ID.toString() + " 2";
      
      player1.write(playerTurn);
      player1.write(player1Board);
      
      player2.write(playerTurn);
      player2.write(player2Board);
    }
  }
}

void startGame() {
 
  board = "1000000000"; // Spliiter først mellem de 2 første characters, derfor er der bare et 1-tal
  int random = (int) random(0, 2);
  
  playerTurn = random;
  duringGame = true;
}

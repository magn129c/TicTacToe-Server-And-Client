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
      //              X  XOO   Tilfældig ID Spiller ID Nuværende Tur
      // Eksempelvis: 100122000  838582         1             2
      String player1Board = board + " " + player1ID.toString() + " 1" + " " + playerTurn;
      String player2Board = board + " " + player2ID.toString() + " 2" + " " + playerTurn;
      player1.write(player1Board);
      player2.write(player2Board);
    } else {
      Client clientData = ticTacToeServer.available();
      if(clientData != null) {
        String move = clientData.readString();
        println(move);
        if(move != null) {
          String[] splitMove = move.split(" ");
          if(playerTurn == 1 && splitMove[1] == player1ID) {
            playerTurn = 2;
          } else if(playerTurn == 2 && splitMove[1] == player2ID) {
            playerTurn = 1;
            
          }
        }
      }
    }
  }
}

void startGame() {
 
  board = "000000000";
  int random = (int) (Math.random() * 2 + 1);;
  
  playerTurn = random;
  duringGame = true;
}

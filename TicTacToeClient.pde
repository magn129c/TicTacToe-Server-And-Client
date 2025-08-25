import processing.net.*;
int playerTurn;
String board;
String board1[];
Client myClient;
String playerID = str((int)(random(1, 5000000)));


void setup() {
  size(600, 600);

  myClient = new Client(this, "10.202.144.163", 5100);
  myClient.write(playerID);

  //println(playerID);
}
void draw() {
  background(200);
  drawBoard();
  playerTurn=myClient.read();
  board=myClient.readString();
  
  if (playerTurn==1||playerTurn==0) {
    println(playerTurn);
  }
  
  if (board!=null && board.contains(playerID)) {
   // board1=board.split(" ");
    println(board);
    //println(board1[2]);
  }
}


void drawBoard() {
  strokeWeight(2);
  line(200, 600, 200, 0);
  line(400, 600, 400, 0);
  line(600, 200, 0, 200);
  line(600, 400, 0, 400);
}

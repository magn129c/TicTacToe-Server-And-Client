import processing.net.*; //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
int playerTurn;
String[] boardID;
int playerNumber;
int fieldHeight;
int fieldWidth;
int textOffset=12;
char[][] board = new char[3][3];
Client myClient;
String playerID = str((int)(random(1, 5000000)));


void setup() {
  size(600, 600);
  initBoard();
  fieldHeight=height/3;
  fieldWidth=width/3;
  myClient = new Client(this, "10.202.144.163", 5100);
  myClient.write(playerID);

  //println(playerID);
}
void draw() {
  background(200);
  drawBoard();
  if (boardID!=null) {
    fillBoard();
  }
  playerTurn=myClient.read();
  String tempBoardID=myClient.readString();
  String gottenPlayerID;

  if (playerTurn==1||playerTurn==0) {
    println(playerTurn);
  }

  if (tempBoardID!=null && tempBoardID.contains(playerID)) {
    String[] tempBoard=tempBoardID.split(" ");
    tempBoardID = tempBoard[0];
    gottenPlayerID = tempBoard[1];
    playerNumber = Integer.valueOf(tempBoard[2]);
    boardID = tempBoardID.split("");
    printArray(boardID);
  }
  textSize(50);
  fill(1);
}


void drawBoard() {
  strokeWeight(2);
  line(200, 600, 200, 0);
  line(400, 600, 400, 0);
  line(600, 200, 0, 200);
  line(600, 400, 0, 400);
}


void fillBoard() {
  for (int i=0; i<3; i++) {
    for (int j=0; j<3; j++) {
      board[i][j]=boardID[i+j*3];
    }}

      for (int i=0; i<3; i++) {

        for (int j=0; j<3; j++) {
          println(boardID[(i + j * 3)]);
          if (boardID[(i + j * 3)]=="1") {
            text("X", fieldWidth/2+fieldWidth*i-textOffset, fieldHeight/2+fieldHeight*j);
          }
          if (boardID[(i + j * 3)]=="2") {
            text("O", fieldWidth/2+fieldWidth*i-textOffset, fieldHeight/2+fieldHeight*j);
          }
        }
      }
    }

    /*
void mouseReleased() {
     int tempX=mouseX/fieldWidth;
     println(tempX);
     
     int tempY=mouseY/fieldHeight;
     println(tempY);
     if (board[tempX][tempY]==' ') {
     if (playerTurn) {
     board[tempX][tempY]='X';
     } else {
     board[tempX][tempY]='O';
     }
     playerTurn=!playerTurn;
     }
     }
     
     */
    void initBoard() {
      for (int i=0; i<3; i++) {
        for (int j=0; j<3; j++) {
          board[i][j]=' ';
        }
      }
    }

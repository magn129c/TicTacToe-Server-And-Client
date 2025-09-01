import processing.net.*; //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
int playerTurn;
String[] boardID;
int playerNumber;
int fieldHeight;
int fieldWidth;
int textOffset=12;
String[][] board = new String[3][3];
Client myClient;
String playerID = str((int)(random(1, 5000000)));


void setup() {
  size(600, 600);
  fieldHeight=height/3;
  fieldWidth=width/3;
  //myClient = new Client(this, "10.202.144.163", 5100);
  //myClient.write(playerID);

  //println(playerID);
}
void draw() {
  background(200);
  drawBoard();
  convertArray();

  if (board != null) {
    fillBoard();
  }


  //playerTurn=myClient.read();


  if (playerTurn==1||playerTurn==0) {
    //println(playerTurn);
  }




  textSize(50);
  fill(1);
}

void convertArray() {
  String tempBoardID="1120212101 "+playerID +" 1";
  //String tempBoardID=myClient.readString();
  String gottenPlayerID;
  if (tempBoardID!=null && tempBoardID.contains(playerID)) {
    String[] tempBoard=tempBoardID.split(" ");
    tempBoardID = tempBoard[0];
    gottenPlayerID = tempBoard[1];
    playerNumber = Integer.valueOf(tempBoard[2]);
    boardID = tempBoardID.split("");
    for (int i=0; i<9; i++) {
      int j=0;
      int k=0;
      board[k][j]=boardID[i];
      if (i==2||i==5) {
        j++;
        
      }
      if(i==2||i==5){
      k=0;
      }
      else {
      k++;
      }
    }
  }
}

void drawBoard() {
  strokeWeight(2);
  line(200, 600, 200, 0);
  line(400, 600, 400, 0);
  line(600, 200, 0, 200);
  line(600, 400, 0, 400);
}


void fillBoard() {
  //printArray(boardID);


  if (board!=null) { //<>//
    for (int i=0; i<3; i++) {

      for (int j=0; j<3; j++) {
        println(i+" "+j);
        println(board[i][j]);
        //println(i + j * 3);
        //println(boardID[(i + j * 3)]);
        if (board[i][j].equals("1")) {
          text("X", fieldWidth/2+fieldWidth*i-textOffset, fieldHeight/2+fieldHeight*j);
        }
        if (board[i][j].equals("2")) {
          text("O", fieldWidth/2+fieldWidth*i-textOffset, fieldHeight/2+fieldHeight*j);
        }
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

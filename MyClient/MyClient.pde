import processing.net.*; //<>//

int playerTurn;
String[] boardID;
int playerNumber;
int fieldHeight;
int fieldWidth;
int textOffset=12;
char[][] board = new char[3][3];  //har lavet det om til et 2D af char
Client myClient;
String playerID = str((int)(random(1, 5000000))); //laver et tilfældigt tal om til en int for at runde ned og til str


void setup() {
  size(600, 600);
  fieldHeight=height/3;
  fieldWidth=width/3;
  textSize(50);
  fill(1);

  myClient = new Client(this, "10.202.144.163", 5100);
  myClient.write(playerID);

  //println(playerID);
}
void draw() {
  background(200);
  getServerData();
  drawBoard();
  println(playerTurn+ "turn");
  println(playerNumber+"number");

  if (board != null) {
    fillBoard();
  }


  if (playerTurn==1||playerTurn==0) {
  }
}

void getServerData() {
  String gottenPlayerID;
  String tempBoardID=myClient.readString();

  if (tempBoardID!=null && tempBoardID.contains(playerID)) {
    String[] tempBoard=tempBoardID.split(" ");
    tempBoardID = tempBoard[0];
    gottenPlayerID = tempBoard[1];
    playerNumber = Integer.valueOf(tempBoard[2]);
    playerTurn = Integer.valueOf(tempBoard[3]);
    boardID = tempBoardID.split("");

    convertArray(tempBoard[0]);
  }
}


void convertArray(String str) {
  int index = 0; // holder styr på pos i 1D array
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      board[i][j] = str.charAt(index);
      index++;
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


  if (board!=null) {
    for (int i=0; i<3; i++) {
      for (int j=0; j<3; j++) {

        //println(i + j * 3);
        //println(boardID[(i + j * 3)]);
        if (board[i][j]=='\u0000') {
        } else if (board[i][j]==('1')) {
          text("X", fieldWidth/2+fieldWidth*i-textOffset, fieldHeight/2+fieldHeight*j);
        } else if (board[i][j]==('2')) {
          text("O", fieldWidth/2+fieldWidth*i-textOffset, fieldHeight/2+fieldHeight*j);
        }
      }
    }
  }
}

void mouseReleased() {
  int tempX=mouseX/fieldWidth;
  println(tempX);

  int tempY=mouseY/fieldHeight;
  println(tempY);
  if (board[tempX][tempY]==' ') {
    if (playerTurn==0) {
      board[tempX][tempY]='X';
      playerTurn=1;
    } else {
      board[tempX][tempY]='O';
      playerTurn=0;
    }
  }
}

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

  myClient = new Client(this, "127.0.0.1", 5100); //laver en client som forbindes til serverens IP og Port
  myClient.write(playerID); //skirver PlayerID til severen
}
void draw() {
  background(200);
  getServerData();
  drawBoard();

  if (board != null) {
    fillBoard();
  }
}

void getServerData() {
  String tempBoardID=myClient.readString();//indlæser boardID fra serveren
  if (tempBoardID!=null && tempBoardID.contains(playerID)) {
    String[] tempBoard=tempBoardID.split(" ");//opdeler tempBoard op ved mellemrum
    tempBoardID = tempBoard[0];//boardID er den første del som severen har sendt
    playerNumber = Integer.valueOf(tempBoard[2]);// playernumber er 3. del som er sendt
    playerTurn = Integer.valueOf(tempBoard[3]);//playerturn er 4. del som er sendt
    boardID = tempBoardID.split(""); //deler BoardID op så tallene står enkeltvis

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
  int tempY=mouseY/fieldHeight;
  String play="fejl";
  if (tempX==0 && tempY==0) {
    play="0"+" "+playerID;
    println("0"+" "+playerID);
  }
  if (tempX==0 && tempY==1) {
    play="1"+" "+playerID;
    println("1"+" "+playerID);
  }
  if (tempX==0 && tempY==2) {
    play="2"+" "+playerID;
    println("2"+" "+playerID);
  }
  if (tempX==1 && tempY==0) {
    play="3"+" "+playerID;
    println("3"+" "+playerID);
  }
  if (tempX==1 && tempY==1) {
    play="4"+" "+playerID;
    println("4"+" "+playerID);
  }
  if (tempX==1 && tempY==2) {
    play="5"+" "+playerID;
    println("5"+" "+playerID);
  }
  if (tempX==2 && tempY==0) {
    play="6"+" "+playerID;
    println("6"+" "+playerID);
  }
  if (tempX==2 && tempY==1) {
    play="7"+" "+playerID;
    println("7"+" "+playerID);
  }
  if (tempX==2 && tempY==2) {
    play="8"+" "+playerID;
    println("8"+" "+playerID);
  }

  myClient.write(play);
}

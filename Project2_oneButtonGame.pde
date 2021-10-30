int gameScreen = 0;
float ballX, ballY;
int ballSize = 20;
int ballColor = color(0);
float gravity = 1;
float ballSpeedVert = 0;
int racketBounceRate = 20;
//pong
float speed = 5;
float xPos;
float yPos;
float boxHight = 90;
float boxWidth = 20;
float hyHeight = boxWidth/2;
float racketWidth = 100;
float racketHeight = 10;
PVector position;
 boolean isTouched = false;
float triggerDistance1 = 100;
void setup() {
  size(800, 600, P2D);
  ballX=width/4;
  ballY=height/5;
  xPos = height/2;
  yPos = width/1.5;
}
void draw() {
  background(125);
  if (gameScreen == 0) {
    initScreen();
  } else if (gameScreen == 1) {
    gameScreen();
  } else if (gameScreen == 2) {
    gameOverScreen();
  }
}
void initScreen() {
  background(0);
  textAlign(CENTER);
  text("Click to start", height/2, width/2);
}
void gameScreen() {
  background(255);
  drawBall();
  applyGravity();
  keepInScreen();
  drawRacket();
}   
void drawBall() {
  fill(ballColor);
  ellipse(ballX, ballY, ballSize, ballSize);
  ballX += speed;

  // keeps the paddle from leaving the window
  if (ballX < hyHeight ||ballX > width - hyHeight) speed *= -1;
}
void drawRacket() {

 // rect(xPos, yPos, boxHight, boxWidth);
//  xPos += speed;

  // keeps the paddle from leaving the window
//  if (xPos < hyHeight || xPos > width - hyHeight) speed *= -1;
  
}

void applyGravity() {
  ballSpeedVert += gravity;
  ballY += ballSpeedVert;
}
void makeBounceBottom(float surface) {
  ballY = surface-(ballSize/2);
  ballSpeedVert*=-1;
}
void makeBounceTop(float surface) {
  ballY = surface+(ballSize/2);
  ballSpeedVert*=-1;
}
// keep ball in the screen
void keepInScreen() {
  // ball hits floor
  if (ballY+(ballSize/2) > height) { 
    makeBounceBottom(height);
  }
  // ball hits ceiling
  if (ballY-(ballSize/2) < 0) {
    makeBounceTop(0);
  }
}

void gameOverScreen() {
  // codes for game over screen
}
public void mousePressed() {
  // if we are on the initial screen when clicked, start the game
  if (gameScreen==0) {
    startGame();
  }
  if (ballY >= hyHeight && ballY <= height - hyHeight) speed *= -1;
}
void startGame() {
  gameScreen=1;
}

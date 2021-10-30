int gameScreen = 0;
float ballX, ballY;
int ballSize = 20;
int ballColor = color(0);
float gravity = 1;
float ballSpeedVert = 0;
float airfriction = 0.0001;
float friction = 0.1;
int racketBounceRate = 20;
//pong
float speed = 5;
float yPos;
float racketWidth = 20;
float boxHight = 90;
float boxWidth = 20;
float hyHeight = boxHight/2;
void setup(){
  size(800, 600, P2D);
  ballX=width/4;
  ballY=height/5;
   yPos = height/2;
}
void draw(){
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
void drawRacket(){
 rect(yPos, 580, boxHight, boxWidth);
  
  yPos += speed;
  
  // keeps the paddle from leaving the window
  if (yPos < hyHeight || yPos > width - hyHeight) speed *= -1;
}
void applyGravity() {
  ballSpeedVert += gravity;
  ballY += ballSpeedVert;
  ballSpeedVert -= (ballSpeedVert * airfriction);
}
void makeBounceBottom(float surface) {
  ballY = surface-(ballSize/2);
  ballSpeedVert*=-1;
  ballSpeedVert -= (ballSpeedVert * friction);
}
void makeBounceTop(float surface) {
  ballY = surface+(ballSize/2);
  ballSpeedVert*=-1;
  ballSpeedVert -= (ballSpeedVert * friction);
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
void drawBall() {
  fill(ballColor);
  ellipse(ballX, ballY, ballSize, ballSize);
}
void gameOverScreen() {
  // codes for game over screen
}
public void mousePressed() {
  // if we are on the initial screen when clicked, start the game
  if (gameScreen==0) {
    startGame();
  }
  if (yPos >= hyHeight && yPos <= height - hyHeight) speed *= -1;
}
void startGame() {
  gameScreen=1;
}

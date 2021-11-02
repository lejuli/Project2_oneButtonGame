Player player;
ArrayList<Alien> aliens;

int timeLimit = 60;
int currentTime = 0;
int markTime = 0;
int alienInterval = 1000;
float crashRange = 80;
boolean debug = false;
color debugColor = color(255, 127, 0);

PFont font;
int fontSize = 48;

float speed = 5;
float yPos;
float yHeight = 50;
float hyHeight = yHeight/2;
PImage back;

void setup() {
  size(800, 600, P2D);
  font = createFont("Arial", fontSize);
  textFont(font, fontSize);
  player = new Player();
  aliens = new ArrayList<Alien>();
   yPos = height/2;
  back = loadImage("back.png");
}

void draw() {
  noStroke();
  
  int t = millis();
  currentTime = abs(timeLimit - int(t/1000));
  
  if (t > markTime + alienInterval) {
    aliens.add(new Alien());
    markTime = t;
  }
  
  background(back);
   
  for (Alien alien : aliens) {
    alien.run();
    if (debug) {
      stroke(debugColor);
      line(alien.position.x, alien.position.y, player.position.x, player.position.y);
    }
    if (player.position.dist(alien.position) < crashRange) player.alive = false;
  }
  
  player.run();
  
  fill(255);
  text(currentTime, 10, fontSize);
  
 
  for (int i=aliens.size()-1; i>=0; i--) {
    if (!aliens.get(i).alive) {
      aliens.remove(i);
    }
  }
  
  surface.setTitle("" + frameRate);
}

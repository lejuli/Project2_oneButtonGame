Player player;
ArrayList<Car> cars;

int timeLimit = 60;
int currentTime = 0;
int markTime = 0;
int carInterval = 1000;
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
  cars = new ArrayList<Car>();
   yPos = height/2;
  rectMode(CENTER);
  back = loadImage("back.png");
}

void draw() {
  noStroke();
  
  int t = millis();
  currentTime = abs(timeLimit - int(t/1000));
  
  if (t > markTime + carInterval) {
    cars.add(new Car());
    markTime = t;
  }
  
  background(back);
  
  fill(0);
  rectMode(CENTER);      
  
  for (Car car : cars) {
    car.run();
    if (debug) {
      stroke(debugColor);
      line(car.position.x, car.position.y, player.position.x, player.position.y);
    }
    if (player.position.dist(car.position) < crashRange) player.alive = false;
  }
  
  player.run();
  
  fill(255);
  text(currentTime, 10, fontSize);
  
  // clean up cars that have left the screen
  for (int i=cars.size()-1; i>=0; i--) {
    if (!cars.get(i).alive) {
      cars.remove(i);
    }
  }
  
  surface.setTitle("" + frameRate);
}

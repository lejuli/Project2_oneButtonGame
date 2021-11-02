class Player {

  PVector startPosition, position, target;
  float movementStep = 50;
  float movementSpeed = 0.1;
  color col = color(127, 255, 10);
  boolean alive;
  float speed = 5;
  float yPos;
  float yHeight = 50;
  float hyHeight = yHeight/2;
  PImage alien;
  Player() {
    init();
    alien= loadImage("alien.png");
  }

  void init() {
    alive = true;
    startPosition = new PVector(width/2, height - 50);
    position = startPosition.copy();
    target = position.copy();
    yPos = height/2;
    rectMode(CENTER);
    
  }

  void moveForward() {
    
     if (yPos >= hyHeight && yPos <= height - hyHeight) speed *= -1;
  }

  void update() {
    //position.lerp(target, movementSpeed);
  }

  void draw() {
    rectMode(CENTER);
    if (alive) {
      fill(col); 
    } else {
    
    }
   
    image(alien, 100, yPos, 120, 90);
    yPos += speed; 
    if (yPos < hyHeight || yPos > height - hyHeight) speed *= -1;
    if (debug) {
      noFill();
      stroke(debugColor);
      ellipse(player.position.x, player.position.y, crashRange, crashRange);
    }
  }
 


  void run() {
    update();
    draw();
  }
}

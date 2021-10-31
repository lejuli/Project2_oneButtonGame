void keyPressed() {
  if (key == ' ') {
    player.moveForward(); 
     if (yPos >= hyHeight && yPos <= height - hyHeight) speed *= -1;
  }  else if (key == 'r') { // reset
    player.init();
  }
}

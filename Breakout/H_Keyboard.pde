void keyPressed() {
  if (keyCode == RIGHT) rightkey = true;
  if (keyCode == LEFT) leftkey = true;
}

void keyReleased() {
  if (keyCode == RIGHT) rightkey = false;
  if (keyCode == LEFT) leftkey = false;
}

void pause() {
  textFont(Logo_Font);
  //Pause Button
  pushMatrix();  
  tactileR(10, 110, 10, 60);
  fill(255);
  rect(10, 10, 100, 50, width/50, width/50, width/50, width/50);
  stroke(0);
  fill(0);
  triangle(50, 20, 75, 35, 50, 50);

  //Pause Text
  textSize(130);
  fill(0);
  text("Pause", width/2 -2, height/2 +2);
  fill(255);
  text("Pause", width/2, height/2);
  popMatrix();
}

void pausec() {
  if (mouseX > 10 && mouseX < 110 && mouseY > 10 && mouseY < 60) {
    mode = Game;
  }
}

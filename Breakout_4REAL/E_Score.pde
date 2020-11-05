void Score() {
  background(Purple);
  textFont(Logo_Font);

  //Lives 
  textSize(50);
  fill(0);
  text("Lives : " + live, 58, height - 18);
  fill(255);
  text("Lives : " + live, 60, height - 20);
  
  //Score 
  textSize(50);
  fill(0);
  text("Score : " + score, width-58, height - 20 +2);
  fill(255);
  text("Score : " + score, width-60, height - 20);

  //Ball
  stroke(0);
  strokeWeight(6);
  circle(ballx, bally, balld);

  //Brick
  for (int i = 0; i < N; i++) {
      if (Alive[i] == true) {
        bb(i);
      }
  }

  //Paddle
  fill(255);
  stroke(0);
  strokeWeight(6);
  circle(paddlex, paddley, paddled);

  //Pause Button  
  tactileR(10, 110, 10, 60);
  fill(255);
  rect(10, 10, 100, 50, width/50, width/50, width/50, width/50);
  stroke(0);
  fill(0);
  triangle(50, 20, 75, 35, 50, 50);
}


void scorec() {
  mode = Game;
}

void game() {
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

  //Paddle
  stroke(0);
  strokeWeight(6);
  circle(paddlex, paddley, paddled);

  if (paddlex == width - paddled/2) {
    paddlex = width - paddled/2;
    rightkey = false;
  } else if (rightkey == true) {
    paddlex = paddlex + 7;
  }

  if (paddlex == paddled/2) {
    paddlex = paddled/2;
    leftkey = false;
  } else if (leftkey == true) {
    paddlex = paddlex - 7;
  }

  if (dist(paddlex, paddley, ballx, bally) <= balld/2+paddled/2) {
    vx = (ballx - paddlex) /10;
    vy = (bally - paddley) /10;
    boop.rewind();
    boop.play();
  }

  //ball
  stroke(0);
  strokeWeight(3);
  circle(ballx, bally, balld);

  ballx = ballx + vx;
  bally = bally + vy;

  //Ball Collisions
  if (bally < 10) {
    vy = vy * -1;
    boop.rewind();
    boop.play();
  }
  
  if (ballx < balld/2 || ballx > width - balld/2) {
    vx = vx * -1;
    boop.rewind();
    boop.play();
  }
  if (bally > height - balld/2) {
    live = live - 1;
    ballx = width/2; 
    bally = height/2+100;
    vx = 0;
    vy = 3;
    mode = Score;
    boop.rewind();
    boop.play();
  }

  //Brick
  for (int i = 0; i < N; i++) {
      if (Alive[i] == true) {
        bb(i);
      }
  }

  //Lives + score
  if (live < 1) {
    live = 3;
    score = 0;
    ballx = width/2; 
    bally = height/2+100;
    vx = 0;
    vy = 3;
    paddlex = width/2;
    paddley = height;
    mode = GameOver;
    Lose = true;
    lose.rewind();
    lose.play();
  }
  
  if (score>N-1){
    live = 3;
    score = 0;
    mode = GameOver;
    Win = true;
    win.rewind();
    win.play();
  }

  //Pause Button
  tactileR(10, 110, 10, 60);
  fill(255);
  rect(10, 10, 100, 50, width/50, width/50, width/50, width/50);
  stroke(0);
  fill(0);
  rect(50, 20, 5, 30);
  rect(65, 20, 5, 30);
}

void bb(int i) {
  stroke(0);
  strokeWeight(2);
  fill (pallet[(bY[i]-75)/50-1]);
  circle(bX[i], bY[i], bd);
  if (dist(ballx, bally, bX[i], bY[i]) <= balld/2+bd/2) {
    vx = (ballx - bX[i]) /5;
    vy = (bally - bY[i]) /5;
    score = score + 1;
    Alive[i] = false;
    beep.rewind();
    beep.play();
  }
}


void gamec() {
  if (mouseX > 10 && mouseX < 110 && mouseY > 10 && mouseY < 60) {
    mode = Pause;
  }
}

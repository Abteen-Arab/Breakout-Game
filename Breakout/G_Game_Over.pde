void go() {
  background(0);
  
  //Text Setup
  textFont(Logo_Font);
  pop = pop + pvx ;
  if (pop > 150 || pop < 100) {
    pvx = pvx * -1;
  }
  
  if (Win == true) {
    textSize(pop);
    fill(0);
    text("Congratulations", width/2 -2, height/2 +2);
    fill(255);
    text("Congratulations", width/2, height/2);
  }
  
  if (Lose == true) {
    textSize(pop);
    fill(0);
    text("Game Over", width/2 -2, height/2 +2);
    fill(255);
    text("Game Over", width/2, height/2);
  }
}

void goc() {
  mode = Intro;
  for (int i = 0; i < N; i++) {
    Alive[i] = true;
  }
}

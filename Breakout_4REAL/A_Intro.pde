void intro() { 
  //Background
  textFont(Logo_Font);
  background (Purple);
  image (gif[i1],0,0,width,height);
  i1++;
  if (i1 == np) i1 = 1;
  
  //Title
  pop = pop + pvx ;
  
  if (pop > 150 || pop < 100) {
    pvx = pvx * -1;
  }
  textSize(pop);
  fill(0);
  text("BREAKOUT", width/2 -2, height/4 +2);
  fill(255);
  text("BREAKOUT", width/2, height/4);
  
  //Start Text
  textSize(50);
  fill(0);
  text("Tap To Begin", width/2 -2, height/2+2);
  fill(255);
  text("Tap To Begin", width/2, height/2);
  
  //Preset
  Win = false;
  Lose = false;
} 

void introc() { 
  mode = Game;
}

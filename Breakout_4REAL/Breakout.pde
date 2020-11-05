// Abteen Arab
// "Date"
// Block: 1-1B 
// BreakOut

//Minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//controls different screens (modes)
int mode; 
int introc, Optionc, Instc, gamec, pausec, goc;
final int Intro =0, Option = 1, Inst=2, Game=3, Pause=4, GameOver=5, Score = 6; //these are used to give purpose ot modes, final locks the varaible

//Actual Movement Variables
float paddlex, paddley, paddled, ballx, bally, balld, ballxs, ballys;
float vx, vy;

//Brick Varaibles
int[] bX, bY; 
int bd, N = 44;
int tx = 50, ty = 125;
boolean[] Alive;

//Movement Decider Variable 
boolean leftkey, rightkey;

//Color Variables
color Purple = #6D1981;
color Orange = #FFA600;
color Green  = #078901;
color Pink   = #FF00E6;
color Cyan   = #02CEB4;

color[] pallet = {Pink, Cyan, Green, Orange};

//Score + Lives
int live;
int score;
boolean Win, Lose;

//Text + Score Variables
int pop, pvx;

//Logo
PFont Logo_Font;

//Image
PImage[] gif;
int np, i1;

Minim minim;
AudioPlayer beep, boop, lose, win, theme, shatter;

void setup() { // =============================================================
  size(800, 600);
  frameRate(60);
  mode = Intro;
  score = 0;
  Win = false;
  Lose = false;
  
  //Text Setup
  textAlign(CENTER, CENTER);
  pop = 100;
  pvx = 1;

  //Color Setup
  Purple = #6D1981;
  Orange = #FFA600;
  Green  = #078901;
  Pink   = #FF00E6;
  Cyan   = #02CEB4; 

  //Paddle Setup
  paddlex = width/2;
  paddley = height;
  paddled = 100;

  //Ball Setup
  ballx = width/2; 
  bally = height/2 + height/4; 
  balld = 15;
  vx = 0; 
  vy = 1;

  //Brick SetUp
  bX    = new int [N];
  bY    = new int [N];
  Alive = new boolean[N];
  bd = 40;

  for (int i=0; i < N; i++) {
    bX[i] = tx;
    bY[i] = ty;
    Alive [i] = true;
    tx = tx + 70;
    if (tx > width - 50) {
      tx = 50; 
      ty = ty + 50;
    }
  }

  //live setup
  live = 3;

  //Gif
  np = 60;
  gif = new PImage[np];
  i1 = 1;

  for (int o = 0; o < np; o++) {
    gif[o] = loadImage ("frame_"+o+"_delay-0.03s.gif");
  }
  
  //Music Setup
  minim = new Minim(this);
  beep = minim.loadFile("beep.wav");
  boop = minim.loadFile("boop.wav");
  lose = minim.loadFile("failure.wav");
  win = minim.loadFile("win.wav");
  shatter = minim.loadFile("break.wav");
  theme = minim.loadFile("theme.mp3");
  
  Logo_Font = createFont("cool.otf", 13);
}

void draw() { // =============================================================
  //Organizational Framework For The Code; chooses between one of many functions
  if (mode == Intro) {
    intro();
  } else if (mode == Game) { // else is if the prevous if is not true
    game();
  } else if (mode == Pause) { // else is if the prevous if is not true
    pause();
  } else if (mode == Score) { // else is if the prevous if is not true
    Score();
  } else if (mode == GameOver) { // else is if the prevous if is not true
    go();
  } else { // else is if the prevous if is not true
    println("Error: Mode = " + mode);
  }
  
  //Main Music
  if (mode == Intro) {
    theme.play();
  } else {
    theme.pause();
    theme.rewind();
  }
} // =========================================================================

void tactileR(int x, int x1, int y, int y1) { //==============================
  if (mouseX > x && mouseX < x1 && mouseY > y && mouseY < y1) {
    stroke (255);
    strokeWeight(8);
  } else {
    stroke (0);
    strokeWeight(5);
  }
} // =========================================================================

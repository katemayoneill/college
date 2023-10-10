Alien theAliens[];

Player thePlayer;
Bullet theBullet;

boolean gameOver = false;
boolean isBomb = false;
//boolean win = false;
PFont myFont;
int deaths;


void settings() {
  size(SCREENX, SCREENY);
}
void setup() { // font and image should be in here
  PImage normalImg, explodeImg;
  myFont = loadFont("ComicSansMS-Bold-30.vlw");

  normalImg = loadImage("invader.gif");
  explodeImg = loadImage("exploding.gif");
  theAliens = new Alien[10];
  init_aliens(theAliens, normalImg, explodeImg);

  thePlayer = new Player(SCREENY - MARGIN - PLAYERHEIGHT);
  theBullet = new Bullet();
}
void init_aliens(Alien baddies[], PImage okImg, PImage exImg) {
  for (int i = 0; i < baddies.length; i++) {
    // This is buggy, what is the problem?
    baddies[i] = new Alien(i * (okImg.width + GAP), 0, okImg, exImg);
  }
}

void draw() {
  background(255);
  for (int i=0; i < theAliens.length; i++) {
    theAliens[i].move();
    theAliens[i].draw();
  }
  if (mousePressed) {
    theBullet = new Bullet();
    
  }
  if (gameOver) {
    textFont(myFont);
    text("game over", 20, 20);
    noLoop();
  }


  theBullet.move();
  theBullet.draw();
  theBullet.collide(theAliens);
  thePlayer.move(mouseX);
  thePlayer.draw();
  for (int i=0; i < theAliens.length; i++) {
    theAliens[i].theBomb.move();
    theAliens[i].theBomb.draw();
    theAliens[i].theBomb.collide(thePlayer);
  }
  if(theAliens[0].status==ALIEN_DEAD && 
  theAliens[1].status==ALIEN_DEAD && 
  theAliens[2].status==ALIEN_DEAD &&
  theAliens[3].status==ALIEN_DEAD &&
  theAliens[4].status==ALIEN_DEAD &&
  theAliens[5].status==ALIEN_DEAD &&
  theAliens[6].status==ALIEN_DEAD &&
  theAliens[7].status==ALIEN_DEAD &&
  theAliens[8].status==ALIEN_DEAD &&
  theAliens[9].status==ALIEN_DEAD) {
    textFont(myFont);
    text("you win", 20, 20);
    noLoop();
  }
  
}
//void bombsMove(Bomb[] theBombs) {
//  for (int i = 0; i< theBombs.length; i++) {
//    if (isBomb) theBombs[i].move();
//  }
//}
//void bombsDraw(Bomb[] theBombs) {
//  for (int i = 0; i< theBombs.length; i++) {
//    if (isBomb) theBombs[i].draw();
//  }
//}

Alien theAliens[];
Player thePlayer;

void settings(){
  size(SCREENX, SCREENY);
}
void setup(){
  PImage normalImg, explodeImg;
  
  normalImg = loadImage("invader.gif");
  explodeImg = loadImage("exploding.gif");
  theAliens = new Alien[10];
  init_aliens(theAliens, normalImg, explodeImg);
  
  thePlayer = new Player(SCREENY - MARGIN - PLAYERHEIGHT);
  
  
  
}
void init_aliens(Alien baddies[], PImage okImg, PImage exImg){
  for(int i = 0; i < baddies.length; i++){
    // This is buggy, what is the problem?
    baddies[i] = new Alien(i * (okImg.width + GAP), 0, okImg, exImg);
  }
}

void draw(){
  background(255);
  for(int i=0; i < theAliens.length; i++){
    theAliens[i].move();
    theAliens[i].draw();
    if(random(0, 500) < 1) theAliens[i].die();
  }
  
  thePlayer.move(mouseX);
  thePlayer.draw();
}

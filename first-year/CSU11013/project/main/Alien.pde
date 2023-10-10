final int A_FORWARD = 1;
final int A_DOWN = 2;
final int SCREENY = 240;
final int SCREENX = 320;
final int ALIEN_HEIGHT = 25;
final int ALIEN_WIDTH = 30;
final int EXPLOSION_DURATION = 120;

class Alien {
 int xpos;
 int ypos;
 PImage displayImage;
 PImage explodingImage;
 boolean hasExploded;
 int dx;
 int dy;
 int distanceTravelledDown;
 int explosionTimer;
 int randomDeathChance;
 
 Alien(int x, int y, PImage alienImage,PImage explodeImage,int deathChance){
  /* set up the new alien object */
  xpos = x;
  ypos = y;
  dx = A_FORWARD;
  dy = 0;
  displayImage = alienImage;
  explodingImage = explodeImage;
  hasExploded = false;
  distanceTravelledDown = 0;
  explosionTimer = 0;
  randomDeathChance = deathChance;
 }
  
  public void move(){
  /* Move the alien according to the instructions in the exercise */
  if (dy == 0 && (xpos < 5 || xpos > (SCREENX-ALIEN_WIDTH-5)))
  {
    dy = A_DOWN;
    dx = 0;
    distanceTravelledDown = 0;
  }
  else if (dx == 0 && distanceTravelledDown > ALIEN_HEIGHT)
  {
    dy = 0;
    if (xpos<10)
      dx = A_FORWARD;
    else if (xpos > 220)
      dx = -A_FORWARD;
  }
  
  xpos += dx;
  ypos += dy;
  distanceTravelledDown += dy;
  }
  
   public void draw(){
    /* Draw the alien using the image() method demonstrated in class */
    image(displayImage,xpos,ypos);
    if (hasExploded)
      explosionTimer ++;
  }
  
  public void gambleExplosion(){
    if (round(random(1,pow(randomDeathChance,2))) == 1)
      explode();
  }
  public void explode(){
    hasExploded = true;
    displayImage = explodingImage;
  }
}

class Bullet {
  float x;
  float y;
  float dx;
  float dy;
  int radius;
  color bulletcolor = color(200, 100, 50);


  Bullet() {

    x = mouseX;
    y = SCREENY - MARGIN - PLAYERHEIGHT;
  }

  void move() {

    y -= 2;
  }
  void draw() {
    fill(bulletcolor);
    rect(int(x), int(y), 5,
      5);
  }
  void collide (Alien theAliens[]) {
    for (int i = 0; i < theAliens.length; i++) {

      if ((y+5/2)<=(theAliens[i].y + ALIEN_HEIGHT) &&
        (y-5/2)>= theAliens[i].y &&
        x+5/2 >= theAliens[i].x &&
        x+5/2 <= theAliens[i].x + ALIEN_WIDTH) {

        theAliens[i].die();
        

        // call method to explode alien
      }
    }
  }
}

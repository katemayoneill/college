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
}

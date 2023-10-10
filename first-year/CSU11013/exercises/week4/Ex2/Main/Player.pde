class Player {

  int xpos, ypos;
  color playercolor = color(50);

  Player(int screen_y)
  {
    xpos = SCREENX/2;
    ypos = screen_y;
  }
  void move(int x) {
    if (x > SCREENX - PLAYERWIDTH) xpos = SCREENX - PLAYERWIDTH;
    else xpos = x;
  }
  void draw() {
    fill(playercolor);
    rect(xpos, ypos, PLAYERWIDTH, PLAYERHEIGHT);
  }
}

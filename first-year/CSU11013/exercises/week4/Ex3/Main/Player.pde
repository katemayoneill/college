class Player {

  int playerX, playerY;
  //color playercolor = color(50);
  color playercolor = #FF0000;

  Player(int screen_y)
  {
    playerX = SCREENX/2;
    playerY = screen_y;
  }

  void move(int x) {
    if (x > SCREENX - PLAYERWIDTH) playerX = SCREENX - PLAYERWIDTH;
    else playerX = x;
  }

  void draw() {
    fill(playercolor);
    rect(playerX, playerY, PLAYERWIDTH, PLAYERHEIGHT);
  }
}

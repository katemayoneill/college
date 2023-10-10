class Bomb {
  color bombColour = #FF0000;

  int bombX, bombY, x, y;


  Bomb(int x, int y) { // constructor
    bombX = x;
    bombY = y;
  }

  void move() {

    bombY += 2;
  }

  void draw() {
    fill(bombColour);
    rect(bombX, bombY, 5, 5);
  }

  boolean offScreen() {
    if (bombY >= SCREENY) {
      return true;
    } else {
      return false;
    }
  }
  boolean collide(Player thePlayer) {

    if ((bombY + 5) >= thePlayer.playerY
      && bombY <= (thePlayer.playerY + PLAYERHEIGHT)
      && bombX >= thePlayer.playerX
      && bombX <= (thePlayer.playerX + PLAYERWIDTH) ) {
      System.out.println("collided");
      return true;
    }
    return false;
  }
}

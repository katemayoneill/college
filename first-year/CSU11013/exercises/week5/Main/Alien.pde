class Alien {
  int x, y, direction;
  int status;
  Bomb theBomb;
  PImage normalImg, explodeImg;

  Alien(int alienX, int alienY, PImage okImg, PImage exImg) {
    x = alienX;
    y = alienY;
    status = ALIEN_ALIVE;
    normalImg = okImg;
    explodeImg = exImg;
    direction = FORWARD;
    theBomb = new Bomb(x, y);
  }

  void move() {
    if (direction == FORWARD) {
      if (x + ALIEN_WIDTH < SCREENX - 1)
        x++;
      else {
        direction = BACKWARD;
        y += ALIEN_HEIGHT + GAP;
      }
    } else if (x > 0) x--;
    else {
      direction = FORWARD;
      y += ALIEN_HEIGHT + GAP;
    }
    if (theBomb.collide(thePlayer)) {
      gameOver = true;
    }
    if (random(0, 500) < 1) {
      if (theBomb.offScreen() && status == ALIEN_ALIVE) { //dont need an array of bombs
        theBomb = new Bomb(x + (ALIEN_WIDTH / 2), y + (ALIEN_HEIGHT / 2));
        isBomb = true;
      }
    }

    //if (random(0, 500) < 1 && isBomb == false) {
    //  for (int i=0; i < theAliens.length; i++) {
    //    theBombs[i] = new Bomb(x + (ALIEN_WIDTH / 2), y + (ALIEN_HEIGHT/2));
    //    theBombs[i].move();
    //    theBombs[i].draw();
    //    ///stop intializing it all the time
    //    isBomb = true;
    //    if (y >= SCREENY) {
    //      isBomb = false;
    //    }
    //  }
    //}
  }

  void draw() {
    if (status == ALIEN_ALIVE)
      image(normalImg, x, y);
    else if (status != ALIEN_DEAD) {
      image(explodeImg, x, y);
      status++;
    }
    // otherwise dead, don't draw anything
  }

  void die() {
    if (status == ALIEN_ALIVE){
      status++;

  }
}
}
//get bombs to only sppear if offscrren

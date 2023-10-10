//Seán
class scrollBar {
  int sliderWidth;
  int sliderHeight;
  float xpos, ypos;
  float sliderPos, newSliderPos;
  float sliderPosMax, sliderPosMin;
  int loose;
  boolean over;
  boolean locked;
  float ratio;

  scrollBar(float xpos, float ypos, int sliderWidth, int sliderHeight,
    int loose) {
    this.sliderWidth = sliderWidth;
    this.sliderHeight = sliderHeight;
    int widthtoheight = sliderWidth - sliderHeight;
    ratio = (float)sliderWidth / (float)widthtoheight;
    this.xpos = xpos;
    this.ypos = ypos-sliderHeight/2;
    sliderPos = xpos + sliderWidth/2 - sliderHeight/2;
    newSliderPos = sliderPos;
    sliderPosMin = xpos;
    sliderPosMax = xpos + sliderWidth - sliderHeight;
    this.loose = loose;
  }
   boolean overEvent() {
    if (mouseX > xpos && mouseX < xpos+sliderWidth &&
      mouseY > ypos -5 && mouseY < ypos+sliderHeight+5) {
      return true;
    } else {
      return false;
    }
  }
  void update() {
     over= overEvent();
    if (mousePressed && overEvent()) {
      locked = true;
    }
    if (!mousePressed || !over) {
      locked = false;
    }
    if (locked) {
      newSliderPos = constrain(mouseX-sliderHeight/2, sliderPosMin, sliderPosMax);
    }
    if (abs(newSliderPos - sliderPos) > 1) {
      sliderPos = sliderPos + (newSliderPos-sliderPos)/loose;
    }
  }
  

  void display() {
    stroke(255);
    fill(#E78587);
    rect(xpos, ypos, sliderWidth, sliderHeight);
    if (overEvent() || locked) {
      fill(255);
    } else {
      fill(0);
    }
    rect(sliderPos, ypos, sliderHeight, sliderHeight);
  }
  float getPos() {
    return sliderPos * ratio;
  }
}
  class verticalScrollBar extends scrollBar{
   verticalScrollBar(float xpos, float ypos, int sliderWidth, int sliderHeigth,
    int loose) {
     super(xpos,ypos,sliderWidth,sliderHeigth,loose);
    this.sliderWidth = sliderWidth;
    this.sliderHeight = sliderHeigth;
    int HeightoWidth = sliderHeight - sliderWidth;
    ratio = (float)sliderHeight / (float)HeightoWidth;
    this.xpos = xpos-sliderWidth/2;
    this.ypos = ypos;
    sliderPos = ypos + sliderHeigth/2 - sliderWidth/2;
    newSliderPos = sliderPos;
    sliderPosMin = ypos;
    sliderPosMax = ypos + sliderHeight - sliderWidth;
    this.loose = loose;
  }
  void update() {
     over= overEvent();
    if (mousePressed && over || locked) {
      locked = true;
    }
    if (!mousePressed) {
      locked = false;
    }
    if (locked) {
      newSliderPos = constrain(mouseY-sliderWidth/2, sliderPosMin, sliderPosMax);
    }
    if (abs(newSliderPos - sliderPos) > 1) {
      sliderPos = sliderPos + (newSliderPos-sliderPos)/loose;
    }
  }
    void display() {
    stroke(255);
    fill(#E78587);
    rect(xpos, ypos, sliderWidth, sliderHeight);
    if (over || locked) {
      fill(255);
    } else {
      fill(0);
    }
    rect(xpos, sliderPos, sliderWidth, sliderWidth);
  }
  float getPos() {
    return sliderPos*ratio;
   }
  }

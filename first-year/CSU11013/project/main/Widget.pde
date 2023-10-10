//kate
class Widget { // uses Gavin's Widget class as a superclass
  int x, y, width, height;
  String label;
  int event;
  color widgetColor, labelColor;
  PFont widgetFont;

  Widget(int x, int y, int width, int height, String label,
    color widgetColor, PFont widgetFont, int event) {
    this.x=x;
    this.y=y;
    this.width = width;
    this.height= height;
    this.label=label;
    this.event=event;
    this.widgetColor=widgetColor;
    this.widgetFont=widgetFont;
    labelColor= color(0);
  }
  void draw() {
    fill(widgetColor);
    rect(x, y, width, height);
    fill(labelColor);
    text(label, x+10, y+height-10);
  }
  int getEvent(int mX, int mY) {
    if (mX>x && mX < x+width && mY >y && mY <y+height) {
      return event;
    }
    return EVENT_NULL;
  }
}

class RadioWidget extends Widget { // kate
  boolean active = false;
  RadioWidget(int x, int y, int width, int height, String label,
    color widgetColor, PFont widgetFont, int event) {
    super(x, y, width, height, label, widgetColor, widgetFont, event);
  }
  int getEvent(int mX, int mY) {
    if (hover(mX, mY)) {
      return event;
    }
    return EVENT_NULL;
  }
  boolean hover(int mX, int mY) {
    if (mX>x-width/2 && mX<x+width/2 && mY>y-height/2 && mY <y+height/2) {
      return true;
    }
    return false;
  }
  void draw() {
    ellipseMode(CENTER);
    fill(widgetColor);
    ellipse(x, y, width, height);
    fill(#FFFFFF);
    text(label, x-width, y+height+10);
    //if (hover(mouseX, mouseY) && mousePressed) {
    //  active = true;
    //}
    if (active) {

      fill(#000000);
      ellipse(x, y, width/1.5, height/1.5);
    }
  }
}

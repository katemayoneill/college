//Vaibhav(4/4/22)
class CheckBoxWidget {
  int x, y, width, height;
  String label;
  String displayLabel;
  int event;
  color widgetColor, labelColor;
  PFont widgetFont;
  boolean active;
  PShape button;
  int boxSide;
  boolean isVisible;

  CheckBoxWidget(int x, int y, int width, int height, String label,
    color widgetColor) {
    this.x=x;
    this.y=y;
    this.width = width;
    this.height=height;
    this.label = label;
    if (label.length()>6)
    {
      this.displayLabel = label.substring(0,6)+"..";
    }
    else
    {
      this.displayLabel = label;
    }
    this.widgetColor=color(#FFFAFA);
    labelColor = color(0);
    button = createShape(RECT, x, y, width, height);
    button.setFill(widgetColor);
    boxSide = height-4;
    active = true;
  }

  void draw() {
    fill(widgetColor);
    stroke(0);
    shape(button);
    rect(x-50,y,50,height);
    fill(labelColor);
    textFont(plainFont);
    text(displayLabel,x-45,y+20);
    textFont(stdFont);
    if (active){
      text("X", x+width-boxSide-1, y+height-1);
    }
  }

 boolean getEvent(int mX, int mY){
     if(isVisible && (mX>x+width-boxSide-2 && mX < x+width-2&& mY >y+height-boxSide-2 && mY <y+height-2)){
          active = !active;
          return true;
        }
     return false;
  }
}
//

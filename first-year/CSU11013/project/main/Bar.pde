//Daire
class Bar
{
  int x, y, width, height;
  color barColor;
  String label;
  PFont font;
  boolean selected;
  String multiLineString;
  
  Bar(int x, int y, int width, int height, color barColor, String label, PFont font)
  {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.barColor = barColor;
    this.label = label;
    this.font = font;
    multiLineString = autoNewLine(label,12);
  }
  
  void draw()
  {
    if (selected)
      stroke(0);
    else
      stroke(255);
    fill(barColor);
    rect(x, y-height, width, height);
    stroke(255);
    strokeWeight(1.5);
    textFont(font);
    text(multiLineString, x, y+22);
  }
  
  void draw(int x)   // peter, added for scrolling
  {
    if (selected)
      stroke(0);
    else
      noStroke();
    fill(barColor);
    rect(x, y-height, width, height);
    strokeWeight(1.5);
    stroke(255);
    textFont(font);
    text(multiLineString, x, y+22);
  }
 void zoom(){
   //if(scrollBar.sliderPos){
   //}
 }
}

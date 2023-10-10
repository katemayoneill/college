int x=-50, y= x-199;
void setup() {
  size (200, 200);
  noStroke();
}
void draw() {
  background(255);
  fill(#FFFF00);
  rect(x, 20, 50, 50);
  x++;
  if(x>=199*2-50) {
    x=-50;
  }
  rect(y, 20, 50, 50);
  if(y++>=199*2-50) {
    y=x-200;
  }
}

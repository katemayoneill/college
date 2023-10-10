int x = 0, y = 0, z = 0;
void setup() {
  size (200, 200);
  noStroke();
}
void draw() {
  background(255);
  x++;
  y = (int)sin(x);
  z++;
  fill(#FFFF00+z);
  rect(x, y, 50, 50);
  if(x++>=199) {
    x=-50;
  }
    fill(#009900+z);
  rect(x, y, 50, 50);
  if(x++<=-50) {
    y=199;
  }
}

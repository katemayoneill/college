int x=-50, y=x-199, a=199, b=a+199;
void setup() {
  size (200, 200);
  noStroke();
}
void draw() {
  background(255);
  fill(#FFFF00);
  rect(x, 20, 50, 50);
  if(x++>=199*2-50) {
    x=-50;
  }
  fill(#FFFF00);
  rect(y, 20, 50, 50);
  if(y++>=199*2-50) {
    y=x-200;
  }
  fill(#000FFF);
  rect(a, 80, 50, 50);
  if(a--<=-199) {
    a=199;
  }
  fill(#000FFF);
  rect(b, 80, 50, 50);
  if(b--<=-199) {
    b=a-200;
  }
  
}

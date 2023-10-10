int i=0;
void setup() {
  size (200, 200);
  noStroke();
}
void draw() {
  background(255);
  fill(#FFFF00);
  rect(i, 20, 50, 50);
  if(i++>=199) {
    i=0;
  }
}

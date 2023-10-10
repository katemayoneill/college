int i=0;
void setup() {
  size (200, 200);
  noStroke();
  
  i=0;
}
void draw() {
  background(255);
  fill(#FFFF00);
  rect(-i, 20, 50, 50);
  fill(#009900);
  rect(i, 40, 50, 50);
  fill(#66B2FF);
  rect(30, i, 50, 50);
  i++;
}

float c = 5;
int n = 0;
float angle = 137.9;

void setup() {
  size(300,300);
  background(51);
  colorMode(HSB);
}

float rad(float deg) {
  return PI * deg / 180;
}

void draw() {
  float phi = n*rad(angle);
  float r = c* sqrt(n);
  float x = r*cos(phi);
  float y = r*sin(phi);
  translate(width/2, height/2);
  noStroke();
  float hu = map(r, 0, height*sqrt(2)/2, 0, 255);
  fill(hu, 255, 255);
  ellipse(x, y, 4, 4);
  n++;
}
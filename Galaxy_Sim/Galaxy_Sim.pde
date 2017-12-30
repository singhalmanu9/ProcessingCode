int numStars = 600;
Star[] stars = new Star[numStars];
float G_const = 1;

void setup() {
  size(1800, 1000);
  for (int i = 0; i < numStars; i ++) {
    stars[i] = new Star(random(width), random(height));
  }
}

void draw() {
  background(0);
  for (int i = 0 ; i < numStars; i ++) {
    for (int j = 0; j < numStars; j ++) {
      if(i != j) {
        stars[i].attract(stars[j]);
      }
    }
    stars[i].show();
    stars[i].update();
  }
  println(frameRate);
}
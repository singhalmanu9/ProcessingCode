int numStars = 1000;
Star[] stars = new Star[numStars];
float G_const = .1;
boolean pause;

void setup() {
  size(1800, 1000);
  for (int i = 0; i < numStars; i ++) {
    if (random(1) < .15) {
      if (random(1) < 0.1) {
        stars[i] = new Star(random(width/10) + width/10, random(height/16) + height/10, true);
      } else {
        stars[i] = new Star(random(width), random(height/16) + 5*height/8, true);
      }
    } else {
      stars[i] = new Star(random(width), random(height), false);
    }
  }
  pause = false;
}

void mousePressed() {
  pause = !pause;
}

void draw() {
  if (!pause) {
    background(0);
    for (int i = 0; i < numStars; i ++) {
      for (int j = 0; j < numStars; j ++) {
        if (i != j) {
          stars[i].attract(stars[j]);
        }
      }
      stars[i].show();
      stars[i].update();
    }
    println(frameRate);
  }
}
class Particle {
  float x;
  float y;
  boolean stuck;

  Particle() {
    x = random(width);
    y = random(height);
    stuck = false;
  }

  Particle(float x_, float y_) {
    x = x_;
    y = y_;
    stuck = true;
  }
  
  boolean checkStuck(ArrayList<Particle> others) {
    for (Particle p: others) {
      if (dist2(x, y, p.x, p.y) < 100) {
        return true;
      }
    }
    return false;
  }

  void update() {
    if (!stuck) {
      x += random(-1, 1);
      y += random(-1, 1);
      x = max(0, x);
      x = min(x, width);
      y = max(0, y);
      y = min(y, width);
    }
  }

  void show() {
    if (stuck) {
      fill(0, 255, 255);
    } else {
      fill(255, 10);
    }
    noStroke();
    ellipse(x, y, 12, 12);
  }
}
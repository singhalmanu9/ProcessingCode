int numFree = 400;
int iterations = 300;
ArrayList<Particle> free = new ArrayList<Particle>();
ArrayList<Particle> tree = new ArrayList<Particle>();

void setup() {
  size(500, 500);
  for (int i = 0; i < numFree; i ++) {
    free.add(new Particle());
  }
  tree.add(new Particle(width/2, height/2));
  //compute();
}

float dist2(float x1, float y1, float x2, float y2) {
  float dx = x1-x2;
  float dy = y1-y2;
  return dx*dx+dy*dy;
}

void compute() {
  while (free.size() != 0) {
    for (int i = 0; i < iterations; i ++) {
      for (int j = free.size()-1; j >= 0; j--) {
        Particle p = free.get(j);
        p.update();
        if (p.checkStuck(tree)) {
          p.stuck = true;
          tree.add(p);
          free.remove(p);
        }
      }
    }
  }
}

void draw() {
  background(0);
  for (int i = 0; i < iterations; i ++) {
    for (int j = free.size()-1; j >= 0; j--) {
      Particle p = free.get(j);
      p.update();
      if (p.checkStuck(tree)) {
        p.stuck = true;
        tree.add(p);
        free.remove(p);
      }
    }
  }
  for (Particle p: free) {
    p.show();
  }
  for (Particle p : tree) {
    p.show();
  }
}
class Star {

  PVector pos;
  PVector vel;
  PVector acc;

  float mass;
  float radius;

  float maxSpeed = 1;
  float maxAcc = 5;
  boolean dark;

  Star(float x, float y, boolean dark_) {
    pos = new PVector(x, y);
    vel = PVector.random2D();
    acc = new PVector();
    dark = dark_;
    acc.set(0, 0);
    if (dark) {
      mass = random(5) + 5;
      radius = 4;
    } else {
      mass = random(5);
      radius = 4;
    }
  }

  PVector getPos() {
    return pos.copy();
  }

  PVector getVel() {
    return vel.copy();
  }

  PVector getAcc() {
    return acc.copy();
  }

  void applyForce(PVector force) {
    acc = getAcc().add(force);
    acc.limit(maxAcc);
  }

  void attract(Star other) {
    PVector force = other.getPos().sub(getPos()).normalize();
    float d = max(getPos().dist(other.getPos()), 75);
    force.mult(G_const* mass * other.mass / (d*d));
    applyForce(force);
  }

  void restrict() {
    if (pos.x > width || pos.x < 0) {
      vel.x = -vel.x;
    }
    if (pos.y > height || pos.y < 0) {
      vel.y = -vel.y;
    }
  }

  void update() {
    pos = getPos().add(vel);
    vel = getVel().add(acc);
    vel.limit(maxSpeed);
    restrict();
  }

  void show() {
    noStroke();
    if (dark) {
      fill(255, 0, 0);
    } else {
      fill(255);
    }
    ellipse(getPos().x, getPos().y, radius, radius);
  }
}
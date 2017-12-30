class Star {
 
  PVector pos;
  PVector vel;
  PVector acc;
  
  float mass;
  float radius;
  
  float maxSpeed = 1;
  float maxAcc = 5;
  
  Star(float x, float y) {
    pos = new PVector(x, y);
    vel = PVector.random2D();
    acc = new PVector();
    acc.set(0, 0);
    mass = random(5);
    radius = map(mass, 0, 5, 2, 8);
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
    float d = max(getPos().dist(other.getPos()), 150);
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
    fill(255);
    ellipse(getPos().x, getPos().y, radius, radius);
  }
}
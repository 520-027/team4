class Firework {
  PVector pos;
  color col;
  float radius;
  int life;

  Firework(float x, float y, float r, color c) {
    pos = new PVector(x, y);
    col = c;
    radius = r;
    life = 60;
  }

  void update() {
    life--;
  }

  void display() {
    noStroke();
    fill(col, map(life, 0, 60, 0, 255));
    ellipse(pos.x, pos.y, radius, radius);
  }

  boolean isDead() {
    return life <= 0;
  }
}

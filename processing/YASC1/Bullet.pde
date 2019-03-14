class Bullet
{
  PVector pos;
  color c; 
  PVector forward;
  float theta;

  Bullet(float x, float y, float theta) {
    pos = new PVector(x, y);
    this.theta = theta;
    forward = new PVector();
  }

  void move() {
    forward.x = sin(theta);
    forward.y = -cos(theta);
    pos.add(forward);
  }

  void render() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    line(0, -5, 0, 5);
    popMatrix();
  }
}

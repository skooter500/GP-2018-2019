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
    // pos += forward * speed
    float speed = 5;
    pos.add(PVector.mult(forward, speed));
    
    if (pos.x < 0 || pos.x > width || pos.y < 0 || pos.y > height)
    {
      bullets.remove(this);
    }
    
    /*
    if (pos.x < 0)
    {
      pos.x = width;
    }
    if (pos.x > width)
    {
      pos.x = 0;
    }
    if (pos.y < 0)
    {
      pos.y = height;
    }
    if (pos.y > height)
    {
      pos.y = 0;
    }
    */
  }

  void render() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    line(0, -5, 0, 5);
    popMatrix();
  }
}

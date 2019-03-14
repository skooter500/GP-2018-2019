void setup()
{
  size(500, 500);
  
  /*
  // Adding
  //a += b
  a.add(b);
  
  //c = a + b
  c = PVector.add(a, b);
  
  // Subtract
  a.sub(b);
  c = PVector.sub(a, b);
  
  //a *= f
  a.mult(f);
  
  c = PVector.mult(a, f);
  
  c.normalize();
  
  println(a);
  println(b);
  println(c);
  println(a.mag());
  */
  
  // Calculate the speed
  speed = dist(a.x, a.y, b.x,b.y) / time;
  
}

PVector a = new PVector(10, 10);
PVector b = new PVector(20, 20);
PVector c = new PVector(0, 0);
float f = 2;

float speed = 20;
float time = 5.0f;
float timeDelta = 1.0f / 60.0f;
void draw()
{
  // Make a move towards b at 20 units per second
  background(0);
  noStroke();
  fill(0, 0, 255);
  ellipse(a.x, a.y, 10, 10);
  
  fill(255, 0, 0);
  ellipse(b.x, b.y, 10, 10);
  
  /*
  // Move at speed
  c = PVector.sub(b, a);
  c.normalize();
  c.mult(timeDelta * speed);
  a.add(c);
  
  b.x = mouseX;
  b.y = mouseY;  
  */
  
  c = PVector.sub(b, a);
  c.normalize();
  c.mult(timeDelta * speed);
  a.add(c);
  
}

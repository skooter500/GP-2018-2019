class Ship
{
   color c; // fields
   PVector pos;
   PVector forward;
   float theta;
 
   // Constructor
  Ship()
  {
    pos = new PVector(width / 2, height / 2);
    c = color(255);
    forward = new PVector(0, 0);
  }
  
  // Parameterised constructor
  // Gets called when an object is instanciated
  Ship(float x, float y, color c)
  {
    pos = new PVector(x, y);
    forward = new PVector(0, 0);
    this.c = c;
  }
  
  void render()  
  {
    translate(pos.x, pos.y);
    rotate(theta);
    
    stroke(c);
    line(- hp, + hp, 0, - hp);
    line(0, - hp, + hp, + hp);
    line(hp, 0 + hp, 0 , 0);
    line(0, 0, - hp , + hp);  
  }
  
  void move()
  {
    forward.x = sin(theta);
    forward.y = -cos(theta);
    if (keys[UP])
    {
      pos.add(forward);
    }
    if (keys[DOWN])
    {
      pos.sub(forward);
    }
    
    if (keys[LEFT])
    {
      theta -= 0.1f;
    }
    if (keys[RIGHT])
    {
      theta += 0.1f;
    }
  }

   
}

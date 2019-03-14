void setup()
{
  size(500, 500);
  s = new Ship(100, 100, color(255));
  s1 = new Ship(10, 10, color(0, 0, 255));
  s2 = new Ship(50, 50, color(255, 0, 255));
  strokeWeight(2);
  
  /*
  pos += forward;
  pos.add(forward);
  
  pos += forward * 5;
  pos.add(PVector.mult(forward, 5));
  
   spawnPoint = pos + forward * 5;
   spawnPoint = 
      PVector.add(pos, PVector.mult(forward, 5)));
  */
 
}

Ship s;
Ship s1;
Ship s2;

float pw = 50;
float hp = pw / 2;

boolean[] keys = new boolean[1024];

void keyPressed()
{
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false;
}

ArrayList<Bullet> bullets = new ArrayList<Bullet>();


void draw()
{
  background(0);
  //drawPlayer(px, py);
  s.render();
  s.move();
  
  s1.render();
  s1.move();
  
  s2.render();
  s2.move();
  
  for(int i = 0 ; i < bullets.size() ; i ++)
  {
    Bullet b = bullets.get(i);
    b.render();
    b.move();
  }
}

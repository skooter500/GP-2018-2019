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
  if (key == CODED)
  {
    keys[keyCode] = true;
  }
  else
  {
    keys[key] = true;
  }
}

void keyReleased()
{
  if (key == CODED)
  {
    keys[keyCode] = false;
  }
  else
  {
    keys[key] = false;
  }
}

ArrayList<Bullet> bullets = new ArrayList<Bullet>();


float timeDelta = 0;
float last = 0;
void draw()
{
  
  float now = millis();
  timeDelta = (now - last) / 1000.0f;
  last = now;
  //println(timeDelta);
  background(0);
  text("Bullets: " + bullets.size(), 10, 50);
  
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
  
  if (keys['a'])
  {
    println("AAAA");
  }
}

void setup()
{
  size(500, 500);
  s = new Ship(100, 100, color(255));
}

Ship s;
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




void draw()
{
  background(0);
  //drawPlayer(px, py);
  s.render();
  s.move();
}

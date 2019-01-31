void setup()
{
  size(500, 500);
  rectMode(CENTER);
  colorMode(HSB);
  noStroke();
  cx = width / 2;
  cy = height / 2;
  
  for(int i = 0 ; i < 10 ; i ++)
  {
    x[i] = random(0, width);
    hue[i] = (int) random(0, 255);
  }
}

float cx, cy;

float[] x = new float[10];
int[] hue = new int[10];

int mode = 0;

void circles()
{
  float diameter = height / 10;
  float r = diameter / 2;
  for(int i = 0 ; i < 10 ; i ++)
  {
    fill(hue[i], 255, 255);
    ellipse(x[i], r + (diameter * i), diameter, diameter);
    x[i] ++;
    if (x[i] > width + r)
    {
      x[i] = - r;
    }
  }
}

void rects()
{
  float r = 10;
  float w = width;
  float wd = width / r;
  noStroke();
  float h = 255;
  float hd = 255 / r;
  for(int i = 0 ; i < r ; i ++)
  {
    fill(h, 255, 255);
    rect(cx, cy, w, w);
    w -= wd;
    h -= hd;
  }
  
  for(int i = 10 ; i > 0 ; i--)
  {
    w = i * wd;
    fill(i * hd, 255, 255);
    rect(cx, cx, w, w);
  }
  
  int i = 10;
  while(i > 0)
  {
    w = i * wd;
    fill(i * hd, 255, 255);
    rect(cx, cy, w, w);
    i --;
  }
}  

void triangles()
{
  float hd = 255 / 10;
  noStroke();
  
  float gap = cx / 10;
  for(int i = 0 ; i < 10 ; i ++)
  {
    fill(i * hd, 255, 255);
    triangle(gap * i, height - (i * gap), cx, gap * i, width - (gap * i), height - (i * gap));
    
  }
}

void keyPressed()
{
  if (key == ' ')
  {
    /*
    mode ++;
    if (mode == 3)
    {
      mode = 0;
    }
    */
    mode = (mode + 1) % 3;
  }
  
}


void draw()
{
  background(0);
  if (mode == 0)
  {
    rects();
  }
  else if (mode == 1)
  {
    triangles();
  }
  else if (mode == 2)
  {
    circles();
  }
}

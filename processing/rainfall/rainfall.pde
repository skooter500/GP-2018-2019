void setup()
{
  size(500, 500);
  colorMode(HSB);
  for(int i = 0 ; i < rainFall.length ; i ++) 
  {
    println(months[i] + ": " + rainFall[i]);
  }
  
  // One way to evaluate the minimum of the array
  float minR = rainFall[0];
  String m = "";
  for(int i = 1 ; i < rainFall.length ; i ++)
  {
    if (rainFall[i] < minR)
    {
      minR = rainFall[i];
      m = months[i];
    }
  }
  println("Lowest month: " + m + " rainfall: " + minR);
  
  // A better way!
  int lowestIndex = 0;
  for(int i = 0 ; i < rainFall.length ; i ++)
  {
    if (rainFall[i] < rainFall[lowestIndex])
    {
      lowestIndex = i;
    }
  }
  println("Lowest month: " + months[lowestIndex] + " rainfall: " + rainFall[lowestIndex]);
  
  float barheight = height / (float)rainFall.length;
  println(barheight);
  for(int i = 0 ; i < rainFall.length ; i ++) {
    fill(random(0, 255), 255, 255);
    rect(0, i * barheight, rainFall[i] * 2, barheight);
    fill(0);
    text(months[i], 20, i * barheight + 25);
  }  
}

float[] rainFall = {45, 37, 55, 27, 38, 50, 79, 48, 104, 31, 100, 58};
String[] months = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};

void draw()
{
}
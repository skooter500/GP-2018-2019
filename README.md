# DT508 Game Programming 2018-2019

Resources
---------
* [P5 Editor](http://editor.p5.org)
* [The P5 Reference](https://p5js.org/reference/)
* [The Coding Train](https://www.youtube.com/channel/UCvjgXvBlbQiydffZU7m1_aw)
* [The Nature of Code](http://natureofcode.com/)
* [Games Fleadh](http://www.gamesfleadh.ie/)

## Past Exams
- [Supplemental Lab Test 2018](https://github.com/skooter500/GP-Autumn-Lab-Test-2018)
- [Lab Test 1 2016](https://github.com/skooter500/GP_Lab_Test_1)
- [Supplemental lab test 2 2016](https://github.com/skooter500/DT508-Lab-Test-Supplemental-2016)
- [End of year lab test 2016 Solution](https://github.com/skooter500/DT508-Lab-Test-Solution-2016)
- [Lab Test 1 2015](https://github.com/skooter500/dt508_2015_labtest1)

## Contact the lecturer
* Email: bryan.duggan@dit.ie
* Twitter: [@skooter500](http://twitter.com/skooter500)
* [My website & other ways to contact me](http://bryanduggan.org)

## Assignments

- 19 November 2018 Lab Test 20%
- 3 December 2018 Assignment 1 submission 20%
- Assignment 2 - 30% - Due TBC 
- End of Year lab test - 30% - TBC 

[Assignment rubric & description](assignments.md)

Some assignments from previous years:

[![YouTube](http://img.youtube.com/vi/TY6Wv9lr72A/0.jpg)](https://www.youtube.com/watch?v=TY6Wv9lr72A)

[![YouTube](http://img.youtube.com/vi/cW8s5i9dmqA/0.jpg)](https://www.youtube.com/watch?v=cW8s5i9dmqA)

## Lecture
- [The contract for this course](https://1drv.ms/w/s!Ak7y2552PWCrjPYXt8HlWl1T1cg5Og)

## Lab

### Learning Outcomes
- Enroll on Google Classroom
- Setup an account on editor.p5.org
- Know good online resourses
- Check out previosu student work
- Learn how to draw using p5
- Become familiar with writing and running sketches

### Instructions
- Log onto [Google Classroom](http://classroom.google.com) and enroll on the module okbrtfr.
- Create an account at the [P5 Editor](http://editor.p5.org)
- Check out [the P5 reference](https://p5js.org/reference/)
- Check out [The Coding Train](https://www.youtube.com/channel/UCvjgXvBlbQiydffZU7m1_aw)
- Check out [these Sci-Fi user interfaces made by last years OOP students](https://www.youtube.com/playlist?list=PL1n0B6z4e_E5RZYrubD2pcxq0qzGy-3vr)
- Check out [these music visualisers made in Processing by previous programming students](https://www.youtube.com/watch?v=cW8s5i9dmqA&list=PL1n0B6z4e_E6jErrS0ScSCaVrN7KV729x)
- If you are curious, check out [some of my creature videos](https://www.youtube.com/watch?v=cW8s5i9dmqA&list=PL1n0B6z4e_E6jErrS0ScSCaVrN7KV729x)
- Look up the following methods in the p5 reference to make sure you are clear about the syntax and parameters:
    - noStroke
    - noFill
    - line
    - ellipse
    - rect
    - background
    - stroke
    - fill
    - size
    - arc
    - triangle

Write sketches to draw the following shapes:

![Sketch](images/p1.png)

![Sketch](images/p1.1.png)

![Sketch](images/p1.2.png)

```JavaScript
function setup() {
  createCanvas(500, 500);
  colorMode(HSB);
}

function drawLadder(x, y, w, h, steps)
{
  line(x, y, x, y - h);
  line(x + w, y, x + w, y - h);
  var gap = h / (steps + 1);
  for(var i = 0 ; i < steps ; i ++)
  {
    var gy = (y - gap) - (i * gap);
    line(x, gy, x + w, gy); 
  }
}

function drawKey(x, y)
{  
  var w = 10;
  ellipse(x, y, w, w);
  var c = x;
  var h = y + w * 3;
  line(c, y + w / 2, c, h);
  line (c, h - 5, c - 5, h - 5);
  line (c, h - 10, c - 5, h - 10);
  line (c, h - 15, c - 5, h - 15);
}

function drawPlayer(x,y, w, happy)
{
  ellipse(x, y, w, w);
  ellipse(x - 10, y - 10, 5, 5);
  ellipse(x + 10, y - 10, 5, 5);
  ellipse(x, y, 5, 5);
  line(x - 10, y + 10, x + 10 , y + 10);
  if (happy)
  {
    line(x-10, y + 10, x-13, y + 2);
    line(x+10, y + 10, x+13, y + 2);    
  }
  else
  {
    line(x-10, y + 10, x-13, y + 15);
    line(x+10, y + 10, x+13, y + 15);    
  }
}

var lx = 200, ly = 400, lw = 60;
var kx = 225, ky = 370;
var px = 50, py = 375;

function checkKeys()
{
  if (keyIsDown(LEFT_ARROW))
  {
    px --;
  }
  if (keyIsDown(RIGHT_ARROW))
  {
    px ++;
  }
}

var happy = false;
var theta = 0;

function draw()
{
  if (happy)
  {
    noFill();
    px =random(0, width);
    py = random(0, height);
    stroke(map(px+py, 0, width+height, 0, 255), 255, 255);
    if (frameCount % 120 == 0)
    {
      background(random(0, 255), 255, 255);
    }
    
  }
  else
  {
    background(0);
    stroke(255);
    noFill();
  }
    
	checkKeys();
  //line(0, 400, width, 400);
  if (! happy)
  {
    drawKey(kx, ky);
  }
  drawPlayer(px, py, 50, happy);
  
  var d = dist(px, py, kx, ky);
  if (d < 10)
  {
    happy = true;
  }
  
}
```
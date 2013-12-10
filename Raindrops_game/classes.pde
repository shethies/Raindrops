class Rain {
  PVector loc, vel;
  int d;
  PVector cLoc;

  Rain(PVector cLoc2) {
    loc = new PVector(random(width), random(height));
    vel = new PVector(0, random(2, 5));
    d = int(random(3-10));
    cLoc = cLoc2;
  }

  void show() {
    noStroke();
    fill(0, 170, 225);
    ellipse(loc.x, loc.y, d, d);
  }

  void fall() {
    loc.add(vel);
    if (loc.y + d/2 >= height) {
      loc.y = 0;
      if (loc.y + d/2 == 450 && loc.x <= cLoc.x+75 && loc.x >= cLoc.x-75) {
        loc.x = 0;
      }
    }
  }
}

class Catcher {
  PVector cLoc;
  int w, h;

  Catcher() {
    cLoc = new PVector(250, 450);
    w = int(150);
    h = int(25);
  }

  void show() {
    noStroke();
    rectMode(CENTER);
    fill(255);
    rect(cLoc.x, cLoc.y, w, h);
  }

  void move() {
    if (keyPressed) {
      if (key == CODED) {
        if (keyCode == LEFT) {
          cLoc.x-=3;
        }
        if (keyCode == RIGHT) {
          cLoc.x+=3;
        }
        if (0 < cLoc.x + w/2 && cLoc.x + w/2 < width) {
          cLoc.x=cLoc.x;
        }
      }
    }
  }
}

class Timer {
  int currentTime;
  int oldTime;
  color wow;
  PImage hawlucha;

  Timer() {
    currentTime = 0;
    oldTime = 0;
    wow = color(255, 255, 255);
    hawlucha = loadImage("HAWLUCHA.png");
  }

  void show() {
    currentTime = millis();
    wow = color(255, 255, 255);
    
    fill(wow);
    textSize(25);
    text(millis(), width/2, height/2);

    if (currentTime == 10000) {
      stop();
    }
  }
}



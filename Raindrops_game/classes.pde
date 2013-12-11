/* RAIN CLASS */
class Rain {
  PVector loc, vel;
  int d;
  PVector cLoc;

  Rain() {
    loc = new PVector(random(width), random(height));
    vel = new PVector(0, random(2, 5));
    d = int(random(3-10));
  }

  void show() {
    noStroke();
    fill(0, 170, 225);
    ellipse(loc.x, loc.y, d, d);
  }

  void fall() {
    loc.add(vel);
    if (loc.y + d/2 >= height) {    // If the object falls out of the square,
      loc.y = 0;                    // they are reset to fall from the top
      if (loc.y + d/2 == 450 && loc.x <= cLoc.x+75 && loc.x >= cLoc.x-75) {
        loc.x = 0;
      }
    }
  }
}

/* CATCHER CLASS */
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

  void move() {       // Moves catcher object with arrow keys
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

/* TIMER CLASS */
class Timer {
  int currentTime;
  color wow;

  Timer() {
    currentTime = 0;
    wow = color(255, 255, 255);
  }

  void show() {
    currentTime = gameTime;    // accounting for startup screen time
    wow = color(255, 255, 255);

    fill(wow);
    textSize(15);
    text("TIME: " + currentTime, width/2, height/2);    // Displays time
  }

  void halt() {
    if (numberRemoved == 1000) {
      stop();    // Stops the timer if 1000 objects/all objects
                 // in the array are deleted
    }
  }
}



/* RAINDROPS GAME: SKETCH VER. */

PVector bwone, bwtwo;
int numberRemoved;
color gradientColor1, gradientColor2;
Catcher catchie = new Catcher();
Timer timer1 = new Timer();
ArrayList<Rain> rainDrops = new ArrayList<Rain>();

void gradient(int xLoc, int yLoc, float w, float h, color c1, color c2) {
  for (int i = yLoc; i <=yLoc+h; i++) {
    float in = map(i, yLoc, yLoc+h, 0, 1);
    color c = lerpColor(c1, c2, in);
    stroke(c);
    line(xLoc, i, xLoc+w, i);
  }
}

void setup() {
  gradientColor1 = color(25, 20, 50);
  gradientColor2 = color(5, 20, 25);
  
  numberRemoved = rainDrops.size();
  
  textAlign(CENTER);
  frameRate(10);
  background(0);

  size(500, 500);
  frameRate(60);

  for (int i = 0; i<=1000; i++) {
    rainDrops.add(new Rain());
  }
}

void draw() {
  gradient(0, 0, width, height, gradientColor1, gradientColor2);
  for (int i = 0; i < rainDrops.size(); i++) {
    Rain drop = rainDrops.get(i);
    drop.show();
    drop.fall();
    if (drop.loc.y + drop.d/2 >= catchie.cLoc.y - 12 && drop.loc.y + drop.d/2 <= catchie.cLoc.y && drop.loc.x + drop.d/2 <= catchie.cLoc.x-catchie.w/2 && drop.loc.x + drop.d/2 >= catchie.cLoc.x+catchie.w/2) {
      rainDrops.remove(i);
    }
  }

  timer1.show();
  textSize(15);
  text("SCORE: " + numberRemoved, width/2, 270);

  catchie.show();
  catchie.move();
}


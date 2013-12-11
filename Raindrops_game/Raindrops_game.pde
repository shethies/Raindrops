/* RAINDROPS GAME */

PVector bwone, bwtwo;
int numberRemoved, dropNumber;
color gradientColor1, gradientColor2;
Catcher catchie = new Catcher();
Timer timer1 = new Timer();
ArrayList<Rain> rainDrops = new ArrayList<Rain>();

void gradient(int xLoc, int yLoc, float w, float h, color c1, color c2) {
  for (int i = yLoc; i <=yLoc+h; i++) {     // Function for gradient bg
    float in = map(i, yLoc, yLoc+h, 0, 1);
    color c = lerpColor(c1, c2, in);
    stroke(c);
    line(xLoc, i, xLoc+w, i);
  }
}

void setup() {
  gradientColor1 = color(25, 20, 50);
  gradientColor2 = color(5, 20, 25);
  
  textAlign(CENTER);
  frameRate(10);
  background(0);

  size(500, 500);
  frameRate(60);

  for (int i = 0; i<=1000; i++) {    // Setting up arraylist so that
    rainDrops.add(new Rain());       // it makes 1000 rainDrops objects
  }
}

void draw() {
  gradient(0, 0, width, height, gradientColor1, gradientColor2);
  for (int i = 0; i < rainDrops.size(); i++) { // Displaying the raindrops
    Rain drop = rainDrops.get(i);
    drop.show();
    drop.fall();
    if (drop.loc.y + drop.d/2 >= catchie.cLoc.y - 12 && drop.loc.y + drop.d/2 <= catchie.cLoc.y && drop.loc.x + drop.d/2 >= catchie.cLoc.x-catchie.w/2 && drop.loc.x + drop.d/2 <= catchie.cLoc.x+catchie.w/2) {
      rainDrops.remove(i);    // Removes object once it hits the rectangle @ bottom
    }
  }

  dropNumber = rainDrops.size();      // Calculate the number of objects removed
  numberRemoved = 1000 - dropNumber;  // from the class to use in scoring

  timer1.show();
  textSize(15);
  text("SCORE: " + numberRemoved, width/2, 270);
  timer1.halt();    // Stops timer when score = 1000

  catchie.show();
  catchie.move();
}

/* RAINDROPS GAME */

PVector bwone, bwtwo;
int numberRemoved, dropNumber, actualTime, gameTime;
color gradientColor1, gradientColor2;
Catcher catchie = new Catcher();
Timer timer1 = new Timer();
ArrayList<Rain> rainDrops = new ArrayList<Rain>();
String in1, in2;

void ss() {    // (basic) Start screen function
  in1 = "Use the arrow keys to move the rectangle and catch the raindrops.";
  in2 = "Catch all 1000 in less than 25000 milliseconds to win!";
  if (actualTime <= 2000) {
    background(0);
    textAlign(CENTER);
    fill(150);
    text("RAINDROPS GAME", width/2, height/2);
    textSize(10);
    fill(100);
    text(in1, width/2, 300);
    text(in2, width/2, 320);
  }
}

void es() {    // (basic) End screen function
  if (actualTime <= 25000 && numberRemoved == 1000) {
    background(0);
    textAlign(CENTER);
    fill(150);
    textSize(18);
    text("CONGRATULATIONS!", width/2, height/2);
  }
}

void go() {    // (basic) Game Over screen function
    if (actualTime > 2000 && numberRemoved < 1000) {
    background(0);
    textAlign(CENTER);
    fill(150);
    textSize(18);
    text("BETTER LUCK NEXT TIME!", width/2, height/2);
  }
}

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

  actualTime = 0;
  gameTime = 0;

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
  actualTime = millis();
  gameTime = actualTime - 2000;

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

  ss();
  es();
  go();
}


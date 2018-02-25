//initializing of variables for class Kaninchen
Kaninchen left;
Kaninchen right;
Kaninchen down;
Kaninchen top;

void setup () {
  size(2000, 1000);
//setting up initial points for ear drawing
  left = new Kaninchen(300, "left"); //the second parameter tell on what side the point should be and the first where exact it should locate at the.relevant side.
  right = new Kaninchen(700, "right");
  down = new Kaninchen(500, "down");
  top = new Kaninchen(1500, "top");
}

void draw() { 
  background(205);
  left.draw_ear();
  right.draw_ear();
  down.draw_ear();
  top.draw_ear();
}
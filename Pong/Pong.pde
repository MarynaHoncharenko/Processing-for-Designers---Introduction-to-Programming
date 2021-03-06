////////////////////////////////////////
// Pin Pong Game with game control
///////////////////////////////////////



import org.gamecontrolplus.gui.*;
import org.gamecontrolplus.*;
import net.java.games.input.*;

ControlIO control;
Configuration config;
ControlDevice gpad;

float spieler_x; // x-Position of the bar
float spieler_y; // y-Position of the bar
float ball_x; // x-Position of the ball
float ball_y; // y-Position of the ball
float ball_geschwindigkeit_x; // Speed of the ball in x-direction
float ball_geschwindigkeit_y; // Speed of the ball in y-direction

int runde;

void setup() {
  control = ControlIO.getInstance(this);

  gpad = control.getMatchedDevice("pong");
  if (gpad == null) {
    println("No suitable device configured");
    System.exit(-1); // End the program NOW!
  }
  spieler_x = 20; // x-position of the rectangle
  spieler_y = gpad.getSlider("YPOS").getValue();
  ball_x = 300; // starting x-coordinate of the ball
  ball_y = 300; // starting y-coordinate of the ball
  ball_geschwindigkeit_x = -4; // direction of ball, here in our direction
  ball_geschwindigkeit_y = 0;
  runde = 0;
  size (800, 600);
  rectMode(CENTER);
}

void draw() {
  background(0);
  rect(spieler_x, spieler_y, 20, 100); // coordinate and size of the bar
  rect(ball_x, ball_y, 10, 10); // coordinate and size of the ball
  spieler_y =  0.9f * map(gpad.getSlider("YPOS").getValue(), -310, 250, 0, 600); // controll rectangle in y-position with game controlers

  ball_x = ball_x + ball_geschwindigkeit_x; 
  ball_y = ball_y + ball_geschwindigkeit_y; 

  if (ball_x < 30) {
    // when ball meets the bar 
    if (ball_y < (spieler_y + 55) && ball_y > (spieler_y -55)) {
      //ball changes the direction and increases speed
      ball_geschwindigkeit_x = -ball_geschwindigkeit_x +1;
      ball_geschwindigkeit_y = ball_geschwindigkeit_y - (spieler_y - ball_y) * 0.1;
      runde = runde +1; 
    } else {
      // when ball doesn't meet bar, end of the game
      ball_x = 400;
      ball_y = 300;
      //reset ball direction and speed
      ball_geschwindigkeit_x = -4;
      ball_geschwindigkeit_y = 0;
      runde = 0;
    }
  }
// when ball meets the wall 
  if (ball_y > 595 || ball_y < 5) {
    ball_geschwindigkeit_y = -ball_geschwindigkeit_y; // ball changes the y-direction 
  }
  // when ball meets the wall
  if (ball_x > 795) {
    ball_geschwindigkeit_x = -ball_geschwindigkeit_x; // ball changes the x-direction
  }
  text("Runde: " + runde, 700, 20);
}
////////////////////////////////////////
// Draw the line
//
// Mouse over the screen and than see, what you have drawn
///////////////////////////////////////


int amount = 300; // amount of array for drawing
float [] traj = new float[amount]; // array for storing the x-coordinate of the cursor
float [] traj2 = new float [amount]; // array for storing the y-coordinate of the cursor
int i = 0;
int j = 0;
boolean touch = false;

void setup(){
  size(1000,1000); 
  background(#AEEA00);
}

void draw(){
  // Draw the line
 if (touch) { 
   if (i<amount)
   {
      traj[i]= mouseX;
      traj2[i]= mouseY;
      i++;
   }
   // Warning
   else {
     fill(255);
     textSize(32);
     String t = "Too much for me! Please click the mouse button to draw results";
     text(t,200,500, 400, 500);
   }
 }  
 // Show the line
 else {
    if (j<i-1)
     {
      stroke (255);
      strokeWeight(4);
      strokeCap(ROUND);
      line(traj[j], traj2[j],traj[j+1],traj2[j+1]); // Reverse reading of storing coordinate information
      j++;
     }
     //Show the notification of ending the drawing and instruction, how to continue
     else {
       fill(255);
       textSize(32);
       String end = "Please click the mouse button to draw a line";
       text(end,200,500, 400, 500);
       j=0;
       i=0;
     }
   }
   
 }
// Reload programm, show new blank screen
void mousePressed() {
  background (#AEEA00);
  touch = !touch;
}
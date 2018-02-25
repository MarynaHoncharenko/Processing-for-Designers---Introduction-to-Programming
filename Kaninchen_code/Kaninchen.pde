class Kaninchen  {
 float max_ohr_h, max_ohr_dist, dicke_aussenohr, dicke_innenohr, ohr_angle, small_big; //variables for the function of calculation proportions
 float x, y,angle; // declare variables that will be the coordinates of the center of the ear and the angle when they are deployed
 
 Kaninchen (float k, String p)
{
  // two arrays, which with the help of elements selection in the cycle we will determine the proper coordinates of the center of the ears
  String[] sides_name = {"top", "right", "down", "left"};  
  float[][] sides_pos = {{k, 0}, {width, k}, {k, height}, {0, k}}; 
  
  for (int i = 0; i<4; i++) 
  {
    if (sides_name[i]==p) 
    {
      x=sides_pos[i][0]; //the center of ears
      y=sides_pos[i][1]; //coordinates of the corresponding elements of the array
      angle = i*90; //set proper to the the the step angle 
      break; 
    }
  }
  proportions(); 
}
 
 
 void proportions () //function for calculating the proportions of the ears depending on the size of the screen
{
 max_ohr_h = (width+height)/2/5; //the maximum length of the outer ear depending on the size of the screen
 max_ohr_dist = max_ohr_h/3.5; //distance between two ears (75% of outer ear height)
 small_big = 0.8; //the ratio of the inner ear to the outer
 dicke_aussenohr = max_ohr_h/2; //calculate the thickness of the outer ear in proportion to its height
 dicke_innenohr = max_ohr_h*small_big/3.5; //calculate the thickness of the outer ear in proportion to its height
 ohr_angle = 5.5; //how much the ears are from each other
}
 
 void draw_ear ()
{
  float ohr_h;
  ohr_h=move_detection(); //determine the height of the outer ears, depending on the distance of the cursor from the center of the ears
  pushMatrix(); 
  translate(x, y); //Shift the coordinate grid so that the center of the ears is on the right side

  for (int i = -1; i<=1; i+=2) //cycle for symmetrical drawing of right and left ear
  {
    pushMatrix(); 
    rotate(radians(angle)-i*radians(ohr_angle)); //direction of ear moving
    strokeWeight(dicke_aussenohr); //set the length of the line to be drawn, according to proportions
    stroke(#ef97b6); 
    line(i*max_ohr_dist, 0, i*max_ohr_dist, ohr_h); 
    for (int j = 0; j<=1; j++) //draw inner ear
    {
      strokeWeight(dicke_innenohr);
      stroke(244);
      line(i*max_ohr_dist, 0, i*max_ohr_dist, ohr_h*small_big);
    }
    popMatrix(); 
  }
  popMatrix(); 
}

float move_detection () {
  float distance = dist(mouseX, mouseY, x, y); //Determine the distance from the cursor
  
  //determine the distance from the corners of the screen (potentially the most distant points)
  float a=dist(x, y, width, height);
  float b=dist(x, y, width, 0);
  float c=dist(x, y, 0, height);
  float d=dist(x, y, 0, 0);
  
  float max_dist = max(max(a, b, c), d);//select the most remote point
  float max_ohr_h_big = (width+height)/2/4; //variable to calculate the maximum ear length depending on the size of the screen
  float l = map (distance, 0, max_dist, 0, max_ohr_h_big); //scaling distance from cursor to ear length (ratio of real value to maximum)
  return l;
}
 
}
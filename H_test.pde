//tests
//Global variables
int  appWidth, appHeight, smallerDimension;
float faceX, faceY, faceDiameter;
float backgroundX, backgroundY, backgroundWidth, backgroundHeight;
float leftEyeX, leftEyeY, rightEyeX, rightEyeY, eyeDimater;
float noseX1, noseY1, noseX2, noseY2, noseX3, noseY3;
float mouthX1, mouthY1, mouthX2, mouthY2, mouthOpen, mouthReset;
float measleX, measleY, measleDiameter;
float button1X, button1Y, button2X, button2Y, button3X, button3Y, buttonSide;
color Pastelblue=#74BCF5, Pinegreen = #149B3B, black=#000000, resetColour=#FFFFFF;
color hoverOverColour=resetColour;
String start="Start", stop="STOP", quit="X";
PFont buttonFont;  
Boolean measlesON=false;
  void setup() {
  size(800, 600);
  appWidth = width;
  appHeight = height;
  smallerDimension = (appWidth >= appHeight) ? appHeight : appWidth;
  //
  //Population
  faceX = appWidth*1/2;
  faceY = appHeight*1/2;
  faceDiameter= smallerDimension;
  backgroundX = faceX - faceDiameter*1/2;
  backgroundY = faceY - faceDiameter*1/2;
  backgroundWidth= faceDiameter;
  backgroundHeight = faceDiameter;
  leftEyeX = backgroundX+smallerDimension*1/4;
  leftEyeY = backgroundY+smallerDimension*1/4;
  eyeDimater = smallerDimension*1/11;
  rightEyeX =  backgroundX+smallerDimension*3/4;
  rightEyeY =  leftEyeY;
  noseX1 =  faceX;
  noseY1 =  rightEyeY;
  noseX2 = leftEyeX;
  noseY2 = faceY;
  noseX3 = rightEyeX;
  noseY3 = faceY;
  mouthX1 = noseX2;
  mouthY1 = backgroundY+smallerDimension*3/4;
  mouthX2 = noseX3;
  mouthY2 = mouthY1;
  mouthOpen = smallerDimension*1/8;
  mouthReset = smallerDimension/smallerDimension;
  buttonFont = createFont("MalgunGothic-Semilight-48", 54);
  //
  //
  //DIVs
  rect( backgroundX, backgroundY, backgroundWidth, backgroundHeight );
  ellipse( faceX, faceY, faceDiameter, faceDiameter );
  button1X = backgroundX;
  button1Y = backgroundY;
  button2X = backgroundX+faceDiameter-buttonSide;
  button2Y = button1Y;
  button3X = button2X;
  button3Y = backgroundY+faceDiameter-buttonSide;
  rect( button1X, button1Y, buttonSide, buttonSide );
  println(backgroundX, smallerDimension, smallerDimension/2, sq( smallerDimension/2 ), sq( smallerDimension/2 ) /2, sqrt( sq( smallerDimension/2 ) /2 ), smallerDimension/2-sqrt(sq(smallerDimension/2)/2) );
} // End setup
//
void draw() {
  if ( mouseX>button1X && mouseX<button1X+buttonSide && mouseY>button1Y && mouseY<button1Y+buttonSide ) { 
    hoverOverColour = Pinegreen;
    fill( hoverOverColour );
    rect( button1X, button1Y, buttonSide, buttonSide );
    fill( resetColour );
  } else if ( mouseX>button2X && mouseX<button2X+buttonSide && mouseY>button2Y && mouseY<button2Y+buttonSide ) { 
    hoverOverColour = Pinegreen;
    fill( hoverOverColour );
    rect( button2X, button2Y, buttonSide, buttonSide );
  } else if ( mouseX>button3X && mouseX<button3X+buttonSide && mouseY>button3Y && mouseY<button3Y+buttonSide ) { 
    hoverOverColour = Pastelblue;
    fill( hoverOverColour );
    rect( button3X, button3Y, buttonSide, buttonSide );
  } else {
    hoverOverColour = resetColour;
    fill( hoverOverColour );
    rect( button1X, button1Y, buttonSide, buttonSide );
    rect( button2X, button2Y, buttonSide, buttonSide );
    rect( button3X, button3Y, buttonSide, buttonSide );
  }
  //
  fill(black);
  textAlign(CENTER, CENTER); 

  int size = 21;
  textFont(buttonFont, size);
  text( start, button1X, button1Y, buttonSide, buttonSide);
  text( stop, button2X, button2Y, buttonSide, buttonSide);
  text( quit, button3X, button3Y, buttonSide, buttonSide);
  //
  ellipse ( leftEyeX, leftEyeY, eyeDimater, eyeDimater ); 
  ellipse ( rightEyeX, rightEyeY, eyeDimater, eyeDimater ); 
  triangle( noseX1, noseY1, noseX2, noseY2, noseX3, noseY3 ); 
  strokeWeight(mouthOpen);
  line( mouthX1, mouthY1, mouthX2, mouthY2 ); 
  strokeWeight(mouthReset); 
  //
  color measleColour = color( 255, random(0, 84), random(0, 103) );
  fill(measleColour);
  measleDiameter = random( smallerDimension*1/100, smallerDimension*1/30 );
  measleX = random( backgroundX+(measleDiameter/2), (backgroundX+backgroundWidth)-(measleDiameter/2) );
  measleY = random( backgroundY+(measleDiameter/2), (backgroundY+backgroundHeight)-(measleDiameter/2) );
  while ( measleX <= button1X+buttonSide+(measleDiameter/2) && measleY <= button1Y+buttonSide+(measleDiameter/2)) {
    measleX = random( button1X+buttonSide+(measleDiameter/2), (backgroundX+backgroundWidth)-(measleDiameter/2) );
  
  }
  noStroke();
  if ( ((measleX-faceX)*(measleX-faceX))+((measleY-faceY)*(measleY-faceY)) < sq( ((faceDiameter/2)-(measleDiameter/2)) ) ) { 
    if ( measlesON==true ) ellipse( measleX, measleY, measleDiameter, measleDiameter );
  } 

  stroke(1); 
  fill(resetColour);
}
//End Draw
void keyPressed() {
  if (key==' ' ) measlesON=true; 
  if (keyCode==BACKSPACE ) measlesON=false;
  if (keyCode==ESC) exit();
} //End keyPressed 
//
void mousePressed() { 
  //
  if (mouseX>button1X && mouseX<button1X+buttonSide && mouseY>button1Y  && mouseY>button1Y+buttonSide) measlesON=true;
  if (mouseX>button2X &&  mouseX<button2X+buttonSide  && mouseY>button2Y &&  mouseY>button2Y+buttonSide) measlesON=false;
  if (mouseX>button3X && mouseX<button3X+buttonSide && mouseY>button3Y && mouseY>button3Y+buttonSide ); exit(); 
} //End mousePressed
//
//End MAIN Program

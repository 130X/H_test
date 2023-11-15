//tests
//Global Variables
int appWidth, appHeight, smallerDimension;
float faceX, faceY, faceDiameter;
float backgroundX, backgroundY, backgroundWidth, backgroundHeight;
float leftEyeX, leftEyeY, rightEyeX, rightEyeY, eyeDiameter;
float noseX1, noseY1, noseX2, noseY2, noseX3, noseY3;
float mouthX1, mouthY1, mouthX2, mouthY2, mouthopen, mouthreset;
float measleX, measleY, measleDiameter;
float button1X, button1Y, button2X, button2Y, button3X, button3Y, buttonSide;
color purple=#2C08FF, yellow = #E9FF00, blackInk=#000000, resetColour=#FFFFFF;
color hoverOverColour=resetColour;
String start="Start", stop="STOP", quit="X";
PFont buttonFont;
Boolean measlesON=false, splashScreen=false;
//
void setup() {
  size(700,500);
  appWidth = width; 
  appHeight = height; 
  smallerDimension = (appWidth >= appHeight) ? appHeight : appWidth; 
//Population
  faceX = appWidth*1/2;
  faceY = appHeight*1/2;
  faceDiameter = smallerDimension;
  backgroundX = faceX - faceDiameter*1/2;
  backgroundY = faceY - faceDiameter*1/2;
  backgroundWidth = faceDiameter; 
  backgroundHeight = faceDiameter;
  leftEyeX = backgroundX+smallerDimension*1/4; 
  leftEyeY = backgroundY+smallerDimension*1/4;
  eyeDiameter = smallerDimension*1/11;
  rightEyeX = backgroundX+smallerDimension*3/4;
  rightEyeY =leftEyeY;
  noseX1 = faceX;
  noseY1 = rightEyeY;
  noseX2 = leftEyeX;
  noseY2 = faceY; 
  noseX3 = rightEyeX; 
  noseY3 = faceY;
  mouthX1 = noseX2;
  mouthY1 = backgroundY+smallerDimension*3/4;
  mouthX2 = noseX3;
  mouthY2 = mouthY1;
  mouthopen = smallerDimension*1/8;
  mouthreset = smallerDimension/smallerDimension;
//DIVs
  rect(backgroundX, backgroundY, backgroundWidth, backgroundHeight );
  ellipse( faceX, faceY, faceDiameter, faceDiameter ); 
  button1X = backgroundX; 
  button1Y = backgroundY; 
  button2X = backgroundX+faceDiameter-buttonSide; 
  button2Y = button1Y; 
  button3X = button2X; 
  button3Y = backgroundY+faceDiameter-buttonSide; 
  rect( button1X, button1Y, buttonSide, buttonSide );
// 
  } // End setup 
//
void draw() { 
  
//
} //End draw
//
void keyPressed() {
  
// 
} //end keyPressed 
//
void mousePressed() {
  
//
} //end mousePressed
//
//End Main Program
  
  
  
  
  
  

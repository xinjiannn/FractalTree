private double fractionLength = .83; 
private int smallestBranch = 10; 
private double branchAngle = .5;  
public void setup() 
{   
  size(640,500);    
  noLoop(); 
} 
public void mousePressed(){
  redraw();
}
public void draw() 
{   
  background(0);   
  stroke(225);
  strokeWeight(2);
  line(320,500,320,380);   
  drawBranches(320,380,100,3*Math.PI/2);  //will add later 
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
  stroke(x+20,y+20,150);
  strokeWeight(1);
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  branchLength = branchLength * fractionLength;

  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);

  if (branchLength < smallestBranch){
    fill(180, 201, 168);
    ellipse(endX1, endY1, 6,4);
  }
  else{
    drawBranches(endX1, endY1, branchLength, angle1);
    drawBranches(endX2, endY2, branchLength, angle2);
  }
} 

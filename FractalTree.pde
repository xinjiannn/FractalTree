private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;  
public void setup() 
{   
	size(640,480);    
	noLoop(); 
} 
public void draw() 
{   
	background(0);   
	stroke(0,255,0);   
	line(320,480,320,380);   
	drawBranches(320,380,100,-Math.PI/5);  //will add later 
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1 = angle + branchAngle;
	double angle2 = angle - branchAngle;
	branchLength = branchLength * fractionLength;

	int endX1 = (int)(branchLength*Math.cos(angle) + x);
	int endY1 = (int)(branchLength*Math.sin(angle) + y);
	int endX2 = (int)(x-branchLength*Math.cos(angle));
	int endY2 = (int)(branchLength*Math.sin(angle) + y);
	//int endX2 = x;
	//int endY2 = y;
	line(x, y, endX1, endY1);
	line(x, y, endX2, endY2);

	if (branchLength>smallestBranch){
		drawBranches(endX1,endY1,branchLength-10,-Math.PI/(Math.random()*3));
		drawBranches(endX2,endY2,branchLength-10,-Math.PI/5);
	}
} 

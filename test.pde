// The statements in the setup() function 
// execute once when the program begins

PVector[] p = new PVector[3];
float shift = 1.0;
float fade = 0;
float fillCol = 0;
float rot = 0;
float spin = 0;

void setup() {
  size(500, 500);
  background(#5E142F);
  smooth();
  fade = 255.0 / (width/2.0/shift);
  spin = 360.0 / (width/2.0/shift);
  p[0] = new PVector(-width/2, height/2);
  p[1] = new PVector(width/2, height/2);
  p[2] = new PVector(0, -height/2);
  noStroke();
  //noLoop();
  frameRate(500);
  translate(width/2, height/2);
}
// The statements in draw() are executed until the 
// program is stopped. Each statement is executed in 
// sequence and after the last line is read, the first 
// line is executed again.
void draw() { 
  triBlur();
  drawCircle(300, 300, 80, 8);
}
void triBlur() {
  fill(fillCol);
  fillCol += fade;
  rotate(spin);
  // another interesting variation: uncomment the line below 
  rotate(rot+=radians(spin));
  triangle(p[0].x += shift, p[0].y -= shift/2, 
           p[1].x -= shift, p[1].y -= shift/2, 
           p[2].x, p[2].y += shift); 
  if (p[0].x < 0) {
    // recursive call
    setTimeout(function() {
    	triBlur();
    }, 100);
  }
}
void drawCircle(float x, float y, int radius, int level) 
{                    
  float tt = 126 * level/6.0;
  fill(tt, 153);
  ellipse(x, y, radius*2, radius*2);      
  if(level > 1) {
    level = level - 1;
    int num = int(random(2, 6));
    for(int i=0; i<num; i++) {
	      float a = random(0, TWO_PI);
	      float nx = x + cos(a) * 6.0 * level;
	      float ny = y + sin(a) * 6.0 * level;	
	      drawCircle(nx, ny, radius/2, level);
    }
  }
}
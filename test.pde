//se declaran las variable que se usaran durante el programa
PVector[] p = new PVector[3];
float shift = 1.0;
float fade = 0;
float fillCol = 0;
float rot = 0;
float spin = 0;

// La funcion setup() se ejectura cuando el programa comienza
//aqui se confugra el ambiente del programa
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
// draw() se ejectua cuando el programa se detiene 
//despues de que la ultima linea es leida, la primera linea es leida enseguida
void draw() { 
  triBlur();
  drawCircle(300, 300, 80, 8);
}
// fcunion que crea la serie de triangulos
void triBlur() {
  fill(fillCol);
  fillCol += fade;
  rotate(spin);
  // da el efecto de que esta rotando la figura
  rotate(rot+=radians(spin));
  triangle(p[0].x += shift, p[0].y -= shift/2, 
           p[1].x -= shift, p[1].y -= shift/2, 
           p[2].x, p[2].y += shift); 
  if (p[0].x < 0) {
    //llamada recursiva hacia la funcion
    setTimeout(function() {
    	triBlur();
    }, 100);
  }
}
// fucnion que crea la serie de circulos
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

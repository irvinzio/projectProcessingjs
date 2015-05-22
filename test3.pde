// Declaracion de arreglo 2D
Cell[][] grid;

// numero de columnas y filas del nuestro arreglo
int cols = 30;
int rows = 30;

void setup() {
  size(500,500);
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // se inicializa cada celda que es un objeto
      grid[i][j] = new Cell(i*20,j*20,20,20,i+j);
    }
  }
}

void draw() {
  background(0);
  // The counter variables i and j are also the column and row numbers and 
  // are used as arguments to the constructor for each object in the grid.  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // para cada celda oscila el color y se muestra en pantalla
      grid[i][j].oscillate();
      grid[i][j].display();
    }
  }
}

// objeto de una celda y sus atributos 
class Cell {
  //Una celda sabe su ubicacion dentro del arreglo asi como su tamaño y el valor de sus variables x,y,w,h.
  float x,y;   // x,y ubicacion
  float w,h;   // tamaño y ancho
  float angle; // angulo del color que oscilara

  // contructor de la celda
  Cell(float tempX, float tempY, float tempW, float tempH, float tempAngle) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    angle = tempAngle;
  } 
  
  // al oscilaar se le incrementa el angulo
  void oscillate() {
    angle += 0.02; 
  }

  void display() {
    stroke(255);
    // color calculado utilizando el seno ya que solo tendra que scilar entre 1 y -1
    fill(127+127*sin(angle));
    rect(x,y,w,h); 
  }
}

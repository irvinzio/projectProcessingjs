//se declaran en numero de vectores que se mostraran en pantalla
Mover[] movers = new Mover[10];

void setup() {
  size(500,500);
  smooth();
  background(255, 204, 0);
  //inicializa los vectores
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(); 
  }
}

void draw() {
  noStroke();
  fill(255,10);
  rect(0,0,width,height);
  //setea cada uno de los veectores en la pantalla
  for (int i = 0; i < movers.length; i++) {
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display(); 
  }
}
//los atributos que tendra cada vector
class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  Mover() {
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    topspeed = 4;
  }
  void update() {
    // calcula la acelaracion
    PVector mouse = new PVector(mouseX,mouseY);
    PVector dir = PVector.sub(mouse,location);  // apunta el vector hacia el puntero del mouse
    dir.normalize();     // Normalize
    dir.mult(5);       // Scale 
    acceleration = dir;  // aceleracion

    // la velocidad cambia por aceleracion, y la ubicacion por la velocidad.
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }
  //muestra el vector
  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x,location.y,16,16);
  }
//checa las dimensines de la pantalla para que los vectores no lo sobrepasen
  void checkEdges() {

    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    }  else if (location.y < 0) {
      location.y = height;
    }

  }

}

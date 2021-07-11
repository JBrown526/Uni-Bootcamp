// create stellar body objects for each body in the solar system
Stellar_body sun;
Stellar_body mercury;
Stellar_body venus;
Stellar_body earth, luna;
Stellar_body mars, phobos, deimos;
Stellar_body jupiter, io, europa, ganymede, callisto;
Stellar_body saturn;
Stellar_body uranus;
Stellar_body neptune;
Stellar_body pluto;
// speed and zoom values
float yearSpeed;
float zoom;

void setup() {
  // initialise screen and simulation settings
  fullScreen(P3D);
  yearSpeed=1;
  zoom=1;
  
  // applies radius, distance from sun, orbital speed, rotational speed and path to image values for each stellar body
  sun = new Stellar_body(40, 0, 0, 7, "sun.jpg");
  mercury = new Stellar_body(5, 50, 4, 6.2, "mercury.jpg");
  venus = new Stellar_body(8, 70, 1.6, -1.5, "venus.jpg");
  earth = new Stellar_body(8.5, 100, 1, 11, "earth.jpg");
  luna = new Stellar_body(2, 15, 13.5, 13.5, "luna.jpg");
  mars = new Stellar_body(6, 140, 0.5, 12, "mars.png");
  phobos = new Stellar_body(1.75, 12, 15, 15, "phobos.jpg");
  deimos = new Stellar_body(1.5, 17, 17, 17, "deimos.jpg");
  jupiter = new Stellar_body(20, 230, 0.08, 8, "jupiter.jpg");
  io = new Stellar_body(2, 27, 20, 20, "io.jpg");
  europa = new Stellar_body(2, 34, 18, 18, "europa.jpg");
  ganymede = new Stellar_body(2.5, 40, 17, 17, "ganymede.jpg");
  callisto = new Stellar_body(2.5, 46, 15, 15, "callisto.jpg");
  saturn = new Stellar_body(17, 320, 0.03, 12, "saturn.jpg");
  uranus = new Stellar_body(12, 390, 0.01, -10, "uranus.jpg");
  neptune = new Stellar_body(10, 430, 0.006, 14, "neptune.jpg");
  pluto = new Stellar_body(3, 450, 0.004, 6, "pluto.jpg");
}

void draw() {
  // sets background to black and centres the sun
  background(0);
  translate(width/2, height/2, 0);
  scale(zoom);
  // creates the sun
  sun.move();
  sun.display();
  
  // creates mercury then returns to the sun's coordinate system   
  mercury.move();
  mercury.display();
  popMatrix();

  venus.move();
  venus.display();
  popMatrix();

  earth.move();
  earth.display();
  // moon created without popping from matrix stack to allow it to orbit earth
  luna.move();
  luna.display();
  popMatrix();
  popMatrix();

  mars.move();
  mars.display();
  phobos.move();
  phobos.display();
  popMatrix();
  deimos.move();
  deimos.display();
  popMatrix();
  popMatrix();

  jupiter.move();
  jupiter.display();
  io.move();
  io.display();
  popMatrix();
  europa.move();
  europa.display();
  popMatrix();
  ganymede.move();
  ganymede.display();
  popMatrix();
  callisto.move();
  callisto.display();
  popMatrix();
  popMatrix();

  saturn.move();
  saturn.display();
  popMatrix();

  uranus.move();
  uranus.display();
  popMatrix();

  neptune.move();
  neptune.display();
  popMatrix();

  pluto.move();
  pluto.display();
  popMatrix();
  popMatrix();
}

// listens for key presses to adjust simulation settings
void keyPressed() {
  if (key=='w') {
    zoom=2*zoom;
    println("zoom " + zoom);
  }
  if (key=='s') {
    zoom=zoom/2;
    println("zoom " + zoom);
  }
  if (key=='d') {
    yearSpeed=2*yearSpeed;
    println("Year speed " + yearSpeed);
  }
  if (key=='a') {
    yearSpeed=yearSpeed/2;
    println("Year speed " + yearSpeed);
  }
}

class Stellar_body {
  PShape globe;
  PImage texture;
  float diam;
  float dist;
  color colour;
  float orbitalVel;
  float rotVel;

  Stellar_body(float rad, float x, float orbitSpeed, float rotSpeed, String text) {
    dist = x;
    diam = rad*2;
    orbitalVel = orbitSpeed;
    rotVel = rotSpeed;
    texture = loadImage(text);
    noStroke();
    noFill();
    globe = createShape(SPHERE, diam/2);
  }
  
  // displays the planetary body
  void display() {
    // uses the provided texture map
    globe.setTexture(texture);
    shape(globe);
    popMatrix();
  }
  
  // 
  void move() {
    // pushmatrix saves the prior coordinate system to the stack allowing for new tranformations that don't effect previous entities
    // this allows for multiple layers of orbiting objects using the same class
    pushMatrix();
    // moves body along its orbit
    rotate(radians(frameCount)*orbitalVel*yearSpeed);
    // moves body to its orbital distance from its parent body
    translate(dist, 0);
    // saves the orbital coordinate system to allow for planetary rotation
    pushMatrix();
    // keeps Z and X axis locked
    rotateZ(radians(90));
    rotateX(radians(-90));
    // rotates body based on its rotational velocity and simulation speed
    rotateY(radians(frameCount)*rotVel*yearSpeed);
  }
}

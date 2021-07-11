class Grain{
  PVector position;
  float size;
  int value;
  color colour;
  
  Grain(float x, float y){
    position = new PVector(x,y);
    size = grainSize;
    value = 0;
    colour = color(grain0);
  }
  
  // draws a grain on the canvas based on its position and colour
  void draw(){
    noStroke();
    fill(colour);
    rect(position.x,position.y,size,size);
  }
  
  // selects a grains colour from its value
  void colourPicker(){
    if(value<=0){
      colour=grain0;
    }else if(value==1){
      colour=grain1;
    }else if(value==2){
      colour=grain2;
    }else if(value>=3){
      colour=grain3;
    }
  }
}

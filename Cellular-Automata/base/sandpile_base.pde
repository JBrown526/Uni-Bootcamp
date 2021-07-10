color grain0 = color(255);
color grain1 = color(255,0,0);
color grain2 = color(0,255,0);
color grain3 = color(0,0,255);
int grainSize = 1;
int cols = 1000/grainSize;
int rows = 1000/grainSize;
Grain[][] grain;

void setup(){
  size(1000,1000);
  grain = new Grain[cols][rows];
  for(int i=0; i<cols; i++){
    for(int j=0; j<rows; j++){
      grain[i][j] = new Grain(grainSize*i,grainSize*j);
    }
  }
  grain[int(cols/2)][int(rows/2)].value=10000000;
  println(cols, rows);
}

void draw(){
  background(255);
  for(int i=0; i<cols; i++){
    for(int j=0; j<rows; j++){
      if(grain[i][j].value>0){
        valueChange(i,j);
        grain[i][j].colourPicker();
        grain[i][j].draw();
      }
    }
  }
}

void valueChange(int i, int j){
  if(grain[i][j].value>=4){
    grain[i][j-1].value=grain[i][j-1].value+1;
    grain[i+1][j].value=grain[i+1][j].value+1;
    grain[i][j+1].value=grain[i][j+1].value+1;
    grain[i-1][j].value=grain[i-1][j].value+1;
    grain[i][j].value=grain[i][j].value-4;
  }
}

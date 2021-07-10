// sets the possible grain colours
color grain0 = color(255);
color grain1 = color(255, 0, 0);
color grain2 = color(0, 255, 0);
color grain3 = color(0, 0, 255);
// sets the size of the grain in pixels
int grainSize = 1;
// the size of the grain grid
int cols = 600/grainSize;
int rows = 600/grainSize;
Grain[][] grain;

void setup() {
  // initialises the canvas and grain grid
  size(600, 600);
  grain = new Grain[cols][rows];
  for (int i=0; i<cols; i++) {
    for (int j=0; j<rows; j++) {
      grain[i][j] = new Grain(grainSize*i, grainSize*j);
    }
  }
  
  // gives the central grain its value
  grain[int(cols/2)][int(rows/2)].value=100000;
}

void draw() {
  // resets the canvas to white after previous draw cycle
  background(255);
  // loops through the grain grid
  for (int i=0; i<cols; i++) {
    for (int j=0; j<rows; j++) {
      if (grain[i][j].value>0) {
        // updates a grain if needed and draws it on the canvas
        valueChange(i, j);
        grain[i][j].colourPicker();
        grain[i][j].draw();
      }
    }
  }
}

// updates a grain and its orthogonal neighbours if the central grain's value equals or is greater than 4
void valueChange(int i, int j) {
  // repeats the value change operation on a cell until it's value is less than 4
  for (; grain[i][j].value>=4; ) {
    if (grain[i][j].value>=4) {
      grain[i][j-1].value=grain[i][j-1].value+1;
      grain[i+1][j].value=grain[i+1][j].value+1;
      grain[i][j+1].value=grain[i][j+1].value+1;
      grain[i-1][j].value=grain[i-1][j].value+1;
      grain[i][j].value=grain[i][j].value-4;
    }
  }
}

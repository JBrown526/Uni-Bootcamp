// sets the possible grain colours
color grain0 = color(255);
color grain1 = color(255, 0, 0);
color grain2 = color(0, 255, 0);
color grain3 = color(0, 0, 255);
// sets the size of the grain in pixels
int grainSize = 1;
// the size of the grain grid
int cols = 300/grainSize;
int rows = 300/grainSize;
Grain[][] grain;
Grain[][] grainUpdate;

void setup() {
  // initialises the canvas, the grain grid and the update grid
  size(300, 300);
  grain = new Grain[cols][rows];
  for (int i = 0; i<cols; i++) {
    for (int j = 0; j<rows; j++) {
      grain[i][j] = new Grain(grainSize * i, grainSize * j);
    }
  }
  grainUpdate = new Grain[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grainUpdate[i][j] = new Grain(grainSize * i, grainSize * j);
    }
  }
  
  // gives the central grain its value
  grain[int(cols/2)][int(rows/2)].value=10000;
}

void draw() {
  // resets the canvas to white after previous draw cycle
  background(255);
  // loops through the grain grid
  for (int i = 0; i<cols; i++) {
    for (int j = 0; j<rows; j++) {
      if (grain[i][j].value > 0) {
        // updates a grain if needed and draws it on the canvas
        valueChange(i, j);
        grain[i][j].colourPicker();
        grain[i][j].draw();
      }
    }
  }
  
  // adds the update grid's values to the grain grid and resets the update grid
  for (int i=0; i<cols; i++) {
    for (int j=0; j<rows; j++) {
      grain[i][j].value = grain[i][j].value + grainUpdate[i][j].value;
      grainUpdate[i][j].value = 0;
    }
  }
}

// changes the corresponding grains in the update grid if a grain has a value of 4 or more
void valueChange(int i, int j) {
  // repeats the value change operation on a grain until its value is less than 4
  for (; grain[i][j].value >= 4; ) {
    if (grain[i][j].value >= 4) {
      if (j > 0) {
        grainUpdate[i][j-1].value = grainUpdate[i][j-1].value + 1;
      }
      if (i<cols-1) {
        grainUpdate[i+1][j].value = grainUpdate[i+1][j].value + 1;
      }
      if (j<rows-1) {
        grainUpdate[i][j+1].value = grainUpdate[i][j+1].value + 1;
      }
      if (i>0) {
        grainUpdate[i-1][j].value = grainUpdate[i-1][j].value + 1;
      }
      // removes from the grain instead of update to prevent infinite looping 
      grain[i][j].value = grain[i][j].value - 4;
    }
  }
}

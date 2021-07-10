A simple "sandpile" cellular automata where grains collapse onto orthogonally adjecent cells if they are too big

#### Base
- Initial naive approach
- Loops through the entire grid
- Updates each grain's value once
- Updates bottom right at a faster rate due to nested loops
- Very slow with larger grid sizes

#### Fast
- Same basic design as Base
- Loops through entire grid
- Updates each grain's value until it is below the threshold
- Updates bottom right at a faster rate due to nested loops
- Very fast even with larger grid sizes

#### Even
- Maintains a separate grid holding updated grain values
- Loops through entire grid, then loops again adding the updated values
- Updates each grain's value until it below the threshold, placing updated values into the updated grain grid
- Updates entire grid at the same time
- Not quite as fast, but more visually satisfying to watch

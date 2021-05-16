class Cube {
  Cuboid[][][] cubies;
  Cuboid[][][] place;
  int dim;
  Cube(int p_dim){
    dim = p_dim;
    cubies = new Cuboid[dim][dim][dim];
    place = new Cuboid[dim][dim][dim];
    for(int i = 0; i < dim; i++){
      for(int j = 0; j < dim; j++){
        for(int k = 0; k < dim; k++){
          float offset = (dim-1)*len/2;
          float x = len * i - offset;
          float y = len * j - offset;
          float z = len * k - offset;
          cubies[i][j][k] = new Cuboid(x, y, z);
          place[i][j][k] = new Cuboid(x, y, z);
        }
      }
    }
  }
  
  void show(){
    for(int i = 0; i < dim; i++){
      for(int j = 0; j < dim; j++){
        for(int k = 0; k < dim; k++){
          cubies[i][j][k].show();
        }
      }
    }
  }
  
  void move(){
    if(keys['a']){
      boolean stop = moveUP(-1);
      if(stop)keys['a'] = false;
    }
    if(keys['d']){
      boolean stop = moveUP(1);
      if(stop)keys['d'] = false;
    }
  }
  
  boolean moveRight(int turn){
    boolean stop;
    stop = cubies[0][0][0].keyMove(X, turn, cubies[2][0][0].pos);
    stop = cubies[2][0][0].keyMove(Y, turn, cubies[0][2][0].pos);
    stop = cubies[0][2][0].keyMove(Z, turn, cubies[0][0][2].pos);
    return stop;
  }
  boolean moveUP(int turn){
    boolean stop = false;
    // center
    if(dim%2 != 0 ) {
      stop = cubies[(dim-1)/2][0][(dim-1)/2].keyMove(Z, turn, cubies[(dim-1)/2][0][(dim-1)/2].posT);
    }
    // corners
    for(int i = 1; i < dim - 1; i++){
      stop = cubies[i-1][0][i-1].keyMove(Z, turn, place[dim-1][0][i-1].posT);
      stop = cubies[dim-1][0][i-1].keyMove(Z, turn, place[dim-1][0][dim-1].posT);
      stop = cubies[dim-1][0][dim-1].keyMove(Z, turn, place[i-1][0][dim-1].posT);
      stop = cubies[i-1][0][dim-1].keyMove(Z, turn, place[i-1][0][i-1].posT);
    }
    
    // edges
    for(int i = 1; i < dim - 1; i++){
      stop = cubies[1][0][0].keyMove(Z, turn, place[2][0][1].posT);
      stop = cubies[2][0][1].keyMove(Z, turn, place[1][0][2].posT);
      stop = cubies[1][0][2].keyMove(Z, turn, place[0][0][1].posT);
      stop = cubies[0][0][1].keyMove(Z, turn, place[1][0][0].posT);
    }
    return stop;
  }
  
}

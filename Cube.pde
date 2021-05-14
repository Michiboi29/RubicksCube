class Cube {
  Cuboid[][][] cubies;
  int dim;
  Cube(int p_dim){
    dim = p_dim;
    cubies  = new Cuboid[dim][dim][dim];
    for(int i = 0; i < dim; i++){
      for(int j = 0; j < dim; j++){
        for(int k = 0; k < dim; k++){
          float offset = (dim-1)*len/2;
          float x = len * i - offset;
          float y = len * j - offset;
          float z = len * k - offset;
          cubies[i][j][k] = new Cuboid(x, y, z);
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
      boolean stop = moveRight(2);
      if(stop)keys['a'] = false;
    }
  }
  
  boolean moveRight(int turn){
    boolean stop;
    stop = cubies[0][0][0].keyMove(X, turn, cubies[2][0][0].pos);
    stop = cubies[2][0][0].keyMove(Y, turn, cubies[0][2][0].pos);
    stop = cubies[0][2][0].keyMove(Z, turn, cubies[0][0][2].pos);
    return stop;
  }
  
}

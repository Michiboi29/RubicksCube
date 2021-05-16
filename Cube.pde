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
      int [] center = {4,3,4};
      int [][] corners = {{0,3,0},{2,3,0},{2,3,2},{0,3,2}};
      int [][] edges = {{1,3,0},{2,3,1},{1,3,2},{0,3,1}};
      boolean stop = move_(Z, -1, center, corners, edges);
      if(stop)keys['a'] = false;
    }
    if(keys['d']){
      int [] center = {4,3,4};
      int [][] corners = {{0,3,0},{2,3,0},{2,3,2},{0,3,2}};
      int [][] edges = {{1,3,0},{2,3,1},{1,3,2},{0,3,1}};
      boolean stop = move_(Z, 1, center, corners, edges);
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
  boolean reversed = false;
  boolean move_(int axe, int turn, int[] center, int[][] corners, int[][] edges){
    boolean stop = false;
    //dehardcode
    //if(turn < 0 && !reversed){ 
    //  //corners = reverse(corners); 
      
    //  corners[1] = corners[3];
    //  corners[3] = corners[1];
    //  //edges = reverse(edges);
    //  edges[1] = edges[3];
    //  edges[3] = edges[1];
    //  reversed = true;
    //}
    int [] val = new int[5];
    val[3] = 0;
    val[4] = (dim-1)/2;
    // center
    if(dim%2 != 0 ){
      Cuboid center1 = cubies[val[center[0]]][val[center[1]]][val[center[2]]];
      stop = center1.keyMove(axe, turn, center1.posT);
    }
    // for all within layers
    for(int i = 1; i < dim - 1; i++){
      val[2] = dim-i;
      val[0] = i-1;
      // corners
      Cuboid corner0 = cubies[val[corners[0][0]]][val[corners[0][1]]][val[corners[0][2]]];
      Cuboid corner1 = cubies[val[corners[1][0]]][val[corners[1][1]]][val[corners[1][2]]];
      Cuboid corner2 = cubies[val[corners[2][0]]][val[corners[2][1]]][val[corners[2][2]]];
      Cuboid corner3 = cubies[val[corners[3][0]]][val[corners[3][1]]][val[corners[3][2]]];
      stop = corner0.keyMove(axe, turn, corner1.posT);
      stop = corner1.keyMove(axe, turn, corner2.posT);
      stop = corner2.keyMove(axe, turn, corner3.posT);
      stop = corner3.keyMove(axe, turn, corner0.posT);
      
      for(int j = i; j < dim - i; j++){
        val[1] = j;
        // edges
        Cuboid edge0 = cubies[val[edges[0][0]]][val[edges[0][1]]][val[edges[0][2]]];
        Cuboid edge1 = cubies[val[edges[1][0]]][val[edges[1][1]]][val[edges[1][2]]];
        Cuboid edge2 = cubies[val[edges[2][0]]][val[edges[2][1]]][val[edges[2][2]]];
        Cuboid edge3 = cubies[val[edges[3][0]]][val[edges[3][1]]][val[edges[3][2]]];
        stop = edge0.keyMove(axe, turn, edge1.posT);
        stop = edge1.keyMove(axe, turn, edge2.posT);
        stop = edge2.keyMove(axe, turn, edge3.posT);
        stop = edge3.keyMove(axe, turn, edge0.posT);
      }
    }
    if(stop)reversed=false;
    return stop;
  }
  
}

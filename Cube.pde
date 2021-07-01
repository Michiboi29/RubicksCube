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
          cubies[i][j][k] = new Cuboid(x, y, z, i, j, k);
          place[i][j][k] = new Cuboid(x, y, z, i, j, k);
          place[i][j][k].place_ptr = cubies[i][j][k];
        }
      }
    }
  }
  
  void show(){
    //place[0][0][0].place_ptr.show();
    cubies[0][0][0].show();
    for(int i = 0; i < dim; i++){
      for(int j = 0; j < dim; j++){
        for(int k = 0; k < dim; k++){
          cubies[i][j][k].show();
        }
      }
    }
  }
  
  void move(){
    if(!moveBuffer.isEmpty()){
      int move = moveBuffer.get(0);
      // up
      if(move == U+1){
        int[] center = {4,3,4};
        int [][] corners = {{0,3,0},{0,3,2},{2,3,2},{2,3,0}};
        int [][] edges = {{1,3,0},{0,3,1},{1,3,2},{2,3,1}};
        boolean stop = move_(Z, -1, center, corners, edges);
        if(stop)moveBuffer.remove(0);
      }
      // up reverse
      if(move == -1*(U+1)){
        int [] center = {4,3,4};
        int [][] corners = {{0,3,0},{2,3,0},{2,3,2},{0,3,2}};
        int [][] edges = {{1,3,0},{2,3,1},{1,3,2},{0,3,1}};
        boolean stop = move_(Z, 1, center, corners, edges);
        if(stop)moveBuffer.remove(0);
      }
      // down
      if(move == D+1){
        int[] center = {4,5,4};
        int [][] corners = {{0,5,0},{0,5,2},{2,5,2},{2,5,0}};
        int [][] edges = {{1,5,0},{0,5,1},{1,5,2},{2,5,1}};
        boolean stop = move_(Z, -1, center, corners, edges);
        if(stop)moveBuffer.remove(0);
      }
      // down reverse
      if(move == -1*(D+1)){
        int [] center = {4,5,4};
        int [][] corners = {{0,5,0},{2,5,0},{2,5,2},{0,5,2}};
        int [][] edges = {{1,5,0},{2,5,1},{1,5,2},{0,5,1}};
        boolean stop = move_(Z, 1, center, corners, edges);
        if(stop)moveBuffer.remove(0);
      }
      // face
      if(move == F+1){
        int [] center = {4,4,5};
        int [][] corners = {{0,0,5},{0,2,5},{2,2,5},{2,0,5}};
        int [][] edges = {{1,0,5},{0,1,5},{1,2,5},{2,1,5}};
        boolean stop = move_(X, 1, center, corners, edges);
        if(stop)moveBuffer.remove(0);
      }
      // face reverse
      if(move == -1*(F+1)){
        int [] center = {4,4,5};
        int [][] corners = {{0,0,5},{2,0,5},{2,2,5},{0,2,5}};
        int [][] edges = {{1,0,5},{2,1,5},{1,2,5},{0,1,5}};
        boolean stop = move_(X, -1, center, corners, edges);
        if(stop)moveBuffer.remove(0);
      }
      // back
      if(move == B+1){
        int [] center = {4,4,3};
        int [][] corners = {{0,0,3},{0,2,3},{2,2,3},{2,0,3}};
        int [][] edges = {{1,0,3},{0,1,3},{1,2,3},{2,1,3}};
        boolean stop = move_(X, 1, center, corners, edges);
        if(stop)moveBuffer.remove(0);
      }
      // back reverse
      if(move == -1*(B+1)){
        int [] center = {4,4,3};
        int [][] corners = {{0,0,3},{2,0,3},{2,2,3},{0,2,3}};
        int [][] edges = {{1,0,3},{2,1,3},{1,2,3},{0,1,3}};
        boolean stop = move_(X, -1, center, corners, edges);
        if(stop)moveBuffer.remove(0);
      }
      // right
      if(move == R+1){
        int [] center = {5,4,4};
        int [][] corners = {{5,0,0},{5,0,2},{5,2,2},{5,2,0}};
        int [][] edges = {{5,1,0},{5,0,1},{5,1,2},{5,2,1}};
        boolean stop = move_(Y, 1, center, corners, edges);
        if(stop)moveBuffer.remove(0);
      }
      // right reverse
      if(move == -1*(R+1)){
        int [] center = {5,4,4};
        int [][] corners = {{5,0,0},{5,2,0},{5,2,2},{5,0,2}};
        int [][] edges = {{5,1,0},{5,2,1},{5,1,2},{5,0,1}};
        boolean stop = move_(Y, -1, center, corners, edges);
        if(stop)moveBuffer.remove(0);
      }
      // left
      if(move == L+1){
        int [] center = {3,4,4};
        int [][] corners = {{3,0,0},{3,0,2},{3,2,2},{3,2,0}};
        int [][] edges = {{3,1,0},{3,0,1},{3,1,2},{3,2,1}};
        boolean stop = move_(Y, 1, center, corners, edges);
        if(stop)moveBuffer.remove(0);
      }
      // left reverse
      if(move == -1*(L+1)){
        int [] center = {3,4,4};
        int [][] corners = {{3,0,0},{3,2,0},{3,2,2},{3,0,2}};
        int [][] edges = {{3,1,0},{3,2,1},{3,1,2},{3,0,1}};
        boolean stop = move_(Y, -1, center, corners, edges);
        if(stop)moveBuffer.remove(0);
      }
      // mid X
      if(move == MX+mid+1){
        
        moveBuffer.remove(0);
      }
      // mid X reverse
      if(move == -1*(MX+mid+1)){
        moveBuffer.remove(0);
      }
      // mid Y
      if(move == MY+mid+1){
        moveBuffer.remove(0);
      }
      // mid Y reverse
      if(move == -1*(MY+mid+1)){
        moveBuffer.remove(0);
      }
      // mid Z
      if(move == MZ+mid+1){
        int[] center = {4,6,4};
        int [][] corners = {{0,6,0},{0,6,2},{2,6,2},{2,6,0}};
        int [][] edges = {{1,6,0},{0,6,1},{1,6,2},{2,6,1}};
        boolean stop = move_(Z, -1, center, corners, edges);
        if(stop)moveBuffer.remove(0);
      }
      // mid Z reverse
      if(move == -1*(MZ+mid+1)){
        int[] center = {4,6,4};
        int [][] corners = {{0,6,0},{0,6,2},{2,6,2},{2,6,0}};
        int [][] edges = {{1,6,0},{0,6,1},{1,6,2},{2,6,1}};
        boolean stop = move_(Z, 1, center, corners, edges);
        if(stop)moveBuffer.remove(0);
      }
    }
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
    int [] val = new int[7];
    val[3] = 0;
    val[4] = (dim-1)/2;
    val[5] = (dim-1);
    val[6] = mid+1;
    // center
    if(dim%2 != 0 ){
      Cuboid center1 = cubies[val[center[0]]][val[center[1]]][val[center[2]]];
      stop = center1.keyMove(axe, turn, center1.posT);
    }
    // for all within layers
    for(int i = 1; i-1 < dim-i; i++){
      val[2] = dim-i;
      val[0] = i-1;
      // corners
      Cuboid corner0 = place[val[corners[0][0]]][val[corners[0][1]]][val[corners[0][2]]];
      Cuboid corner1 = place[val[corners[1][0]]][val[corners[1][1]]][val[corners[1][2]]];
      Cuboid corner2 = place[val[corners[2][0]]][val[corners[2][1]]][val[corners[2][2]]];
      Cuboid corner3 = place[val[corners[3][0]]][val[corners[3][1]]][val[corners[3][2]]];
      // ptr points to cubies
      stop = corner0.place_ptr.keyMove(axe, turn, corner1.posT);
      stop = corner1.place_ptr.keyMove(axe, turn, corner2.posT);
      stop = corner2.place_ptr.keyMove(axe, turn, corner3.posT);
      stop = corner3.place_ptr.keyMove(axe, turn, corner0.posT);
      if(stop){
        Cuboid tmp0 = corner0.place_ptr;
        Cuboid tmp1 = corner1.place_ptr;
        Cuboid tmp2 = corner2.place_ptr;
        Cuboid tmp3 = corner3.place_ptr;
        corner0.place_ptr = tmp3;
        corner3.place_ptr = tmp2;
        corner2.place_ptr = tmp1;
        corner1.place_ptr = tmp0;
      }
      // for all edges
      for(int j = i; j < dim-i; j++){
        val[1] = j;
        // edges
        Cuboid edge0 = place[val[edges[0][0]]][val[edges[0][1]]][val[edges[0][2]]];
        Cuboid edge1 = place[val[edges[1][0]]][val[edges[1][1]]][val[edges[1][2]]];
        Cuboid edge2 = place[val[edges[2][0]]][val[edges[2][1]]][val[edges[2][2]]];
        Cuboid edge3 = place[val[edges[3][0]]][val[edges[3][1]]][val[edges[3][2]]];
        // ptr points to cubies
        stop = edge0.place_ptr.keyMove(axe, turn, edge1.posT);
        stop = edge1.place_ptr.keyMove(axe, turn, edge2.posT);
        stop = edge2.place_ptr.keyMove(axe, turn, edge3.posT);
        stop = edge3.place_ptr.keyMove(axe, turn, edge0.posT);
        if(stop){
          Cuboid tmp0 = edge0.place_ptr;
          Cuboid tmp1 = edge1.place_ptr;
          Cuboid tmp2 = edge2.place_ptr;
          Cuboid tmp3 = edge3.place_ptr;
          edge0.place_ptr = tmp3;
          edge3.place_ptr = tmp2;
          edge2.place_ptr = tmp1;
          edge1.place_ptr = tmp0;
        }
      }
    }
    return stop;
  }
  
}

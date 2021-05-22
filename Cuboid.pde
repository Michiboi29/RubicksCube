class Cuboid {
  PVector pos;
  final float[] posT;
  int[] indexs = new int[3];
  Cuboid place_ptr;
  color[] colors_face;
  Cuboid(float x, float y, float z, int i, int j, int k){
    this.pos = new PVector(x,y,z);
    float[] tmp = {x,y,z};
    this.posT = tmp;
    this.indexs[0] = i;
    this.indexs[1] = j;
    this.indexs[2] = k;
    colors_face = colors;
  }
  //Cuboid(Cuboid c){
  //  this.pos = new PVector(c.pos.x,c.pos.y,c.pos.z);
  //  this.posT = new PVector(c.posT.x,c.posT.y,c.posT.z);
  //}
  void changePos(float x, float y, float z){
    this.pos = new PVector(x,y,z);
  }
  void changePos(PVector posV){
    this.pos = posV;
  }
  void changePos(float[] posV){
    this.pos.x = posV[0];
    this.pos.y = posV[1];
    this.pos.z = posV[2];
  }
  int[] rotation = {0, 0, 0};
  int[]rotationList = {};
  float[] anglesRotation = {radians(0), radians(0), radians(0)};
  void changeRotation(int axe){
    if(this.rotation[0] == 0 && this.rotation[1] == 0 && this.rotation[2] == 0 && this.rotationList.length > 0){
      int [] tmp = {};
      this.rotationList = tmp;
    }
    this.rotation[axe] = (rotation[axe] + 1)%4;
    this.rotationList = append(this.rotationList, axe);
  }
  void changeRotation(int axe, int turn){
    if(this.rotation[0] == 0 && this.rotation[1] == 0 && this.rotation[2] == 0 && this.rotationList.length > 0){
      int [] tmp = {};
      this.rotationList = tmp;
    }
    this.rotation[axe] = (rotation[axe] + turn)%4;
    turn = turn%4;
    if (turn == -2)turn = 2;
    if (turn == -1)turn = 3;
    for (int i = 0; i<turn; i++){
      this.rotationList = append(this.rotationList, axe);
    }
  }
  void unrotate(){
    anglesRotation[X] = 0;
    anglesRotation[X] = 0;
    anglesRotation[X] = 0;
  }
  void changeColor(){
    
  }
  
  int count = 0;
  float[] angleMove = new float[3]; 
  boolean keyMove(int axe, int turn, float[] newPos){
    count++;
    boolean stop = false;
    int maxCount = 9;
    int dir = 1;
    if(turn < 0) dir = -1;
    // rotate
    anglesRotation[axe] += radians(90/maxCount)*dir*-1;
    // move
    // dehardcode depand de axe !!TODO check si axes X et Y sont en odre cos /sin
    if(axe == Z){
      float angleMove = (anglesRotation[axe]) + atan2(newPos[0], newPos[2]);
      float r = sqrt(pow(pos.x,2)+pow(pos.z,2));
      this.pos.x = sin(angleMove)*r;
      this.pos.z = cos(angleMove)*r;
    }
    else if(axe == X){
      float angleMove = anglesRotation[axe]*-1 + atan2(newPos[0], newPos[1]);
      float r = sqrt(pow(pos.x,2)+pow(pos.y,2));
      this.pos.x = sin(angleMove)*r;
      this.pos.y = cos(angleMove)*r;
    }
    else if(axe == Y){
      float angleMove = anglesRotation[axe]*-1 + atan2(newPos[1], newPos[2]);
      float r = sqrt(pow(pos.y,2)+pow(pos.z,2));
      this.pos.y = sin(angleMove)*r;
      this.pos.z = cos(angleMove)*r;
    }
     //end move and rotate
    //print(pos);println(newPos);
    //print(indexs[0]);print(indexs[1]);println(indexs[2]);
    if(count == maxCount * turn * dir){
      println("stopo");
      count = 0;
      stop = true;
      changeRotation(axe, turn);
      changePos(newPos);
      unrotate();
      changeColor();
      //print(rotation[X]);print(rotation[Y]);println(rotation[Z]);
    }
    return stop;
  }
  
  void show(){
    fill(255);
    stroke(0);
    strokeWeight(8);
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    // change fucntion to rotate depends on previus rotation
    rotateZ(anglesRotation[X]);
    rotateX(anglesRotation[Y]);
    rotateY(anglesRotation[Z]);
    rotating();
    
    beginShape(QUADS);
    float l = len/2;
    
    // face 
    fill(colors_face[F]);
    vertex(-l, -l, l);
    vertex(l, -l, l);
    vertex(l, l, l);  
    vertex(-l, l, l);
    // back
    fill(colors_face[B]);
    vertex(-l, -l, -l);
    vertex(l, -l, -l);
    vertex(l, l, -l);  
    vertex(-l, l, -l);
    
    //  right
    fill(colors_face[R]);
    vertex(l, -l, -l);
    vertex(l, l, -l);
    vertex(l, l, l);  
    vertex(l, -l, l);
    // left
    fill(colors_face[L]);
    vertex(-l, -l, -l);
    vertex(-l, l, -l);
    vertex(-l, l, l);  
    vertex(-l, -l, l);
    
    // down
    fill(colors_face[D]);
    vertex(-l, l, -l);
    vertex(l, l, -l);
    vertex(l, l, l);  
    vertex(-l, l, l);
    // up 
    fill(colors_face[U]);
    vertex(-l, -l, -l);
    vertex(l, -l, -l);
    vertex(l, -l, l);  
    vertex(-l, -l, l);
    endShape();
    popMatrix();
  }
  
  void rotating(){
    //rotateZ(anglesRotation[X]);
    //rotateX(anglesRotation[Y]);
    //rotateY(anglesRotation[Z]);
  }

}

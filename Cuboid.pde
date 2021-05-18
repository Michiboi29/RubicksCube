class Cuboid {
  PVector pos;
  PVector posT;
  int[] indexs = new int[3];
  Cuboid place_ptr;
  Cuboid(float x, float y, float z, int i, int j, int k){
    pos = new PVector(x,y,z);
    posT = new PVector(x,y,z);
    indexs[0] = i;
    indexs[1] = j;
    indexs[2] = k;
  }
  Cuboid(Cuboid c){
    this.pos = new PVector(c.pos.x,c.pos.y,c.pos.z);
    this.posT = new PVector(c.posT.x,c.posT.y,c.posT.z);
  }
  void changePos(float x, float y, float z){
    pos = new PVector(x,y,z);
  }
  void changePos(PVector posV){
    pos = posV;
  }
  int[] rotation = {0, 0, 0};
  float[] angles = {radians(0), radians(0), radians(0)};
  void changeRotation(int axe){
    rotation[axe] = (rotation[axe] + 1)%4;
  }
  void changeRotation(int axe, int turn){
    rotation[axe] = (rotation[axe] + turn)%4;
  }
  int count = 0;
  boolean keyMove(int axe, int turn, PVector newPos){
    count++;
    boolean stop = false;
    int maxCount = 9;
    int dir = 1;
    if(turn < 0) dir = -1;
    // rotate
    angles[axe] += radians(90/maxCount)*dir;
    // move
    // dehardcode depand de axe !!TODO check si axes X et Y sont en odre cos /sin
    if(axe == Z){
      float angle = (angles[axe])*-1 + atan2(newPos.z, newPos.x);
      float r = sqrt(pow(pos.x,2)+pow(pos.z,2));
      pos.x = cos(angle)*r;
      pos.z = sin(angle)*r;
    }
    else if(axe == X){
      float angle = angles[axe] + atan2(newPos.y, newPos.x);
      float r = sqrt(pow(pos.x,2)+pow(pos.y,2));
      pos.x = cos(angle)*r;
      pos.y = sin(angle)*r;
    }
    else if(axe == Y){
      float angle = angles[axe] + atan2(newPos.z, newPos.y);
      float r = sqrt(pow(pos.y,2)+pow(pos.z,2));
      pos.y = cos(angle)*r;
      pos.z = sin(angle)*r;
    }
    // end move and rotate
    println(count);
    if(count == maxCount * turn * dir){
      count = 0;
      stop = true;
      changeRotation(axe, turn);
      print(indexs[0]);print(indexs[1]);println(indexs[2]);
      print(rotation[X]);print(rotation[Y]);println(rotation[Z]);
    }
    return stop;
  }
  
  void show(){
    fill(255);
    stroke(0);
    strokeWeight(8);
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    rotateX(angles[Y]);
    rotateY(angles[Z]);
    rotateZ(angles[X]);
    beginShape(QUADS);
    float l = len/2;
    
    //face back
    fill(colors[GREEN]);
    vertex(-l, -l, l);
    vertex(l, -l, l);
    vertex(l, l, l);  
    vertex(-l, l, l);
    fill(colors[BLUE]);
    vertex(-l, -l, -l);
    vertex(l, -l, -l);
    vertex(l, l, -l);  
    vertex(-l, l, -l);
    
    // left right
    fill(colors[ORANGE]);
    vertex(l, -l, -l);
    vertex(l, l, -l);
    vertex(l, l, l);  
    vertex(l, -l, l);
    fill(colors[RED]);
    vertex(-l, -l, -l);
    vertex(-l, l, -l);
    vertex(-l, l, l);  
    vertex(-l, -l, l);
    
    // up and down
    fill(colors[WHITE]);
    vertex(-l, l, -l);
    vertex(l, l, -l);
    vertex(l, l, l);  
    vertex(-l, l, l);
    fill(colors[YELLOW]);
    vertex(-l, -l, -l);
    vertex(l, -l, -l);
    vertex(l, -l, l);  
    vertex(-l, -l, l);
    endShape();
    popMatrix();
  }

}

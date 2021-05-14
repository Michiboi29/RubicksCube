class Cuboid {
  PVector pos;
  Cuboid(float x, float y, float z){
    pos = new PVector(x,y,z);
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
    boolean stop = false;
    int dir = 1;
    if(turn < 0)dir = -1;
    angles[axe] += radians(10)*dir;
    changePos(newPos);
    count++;
    if(count >= 9 * turn * dir){
      count = 0;
      stop = true;
      changeRotation(axe, turn);
      //print(rotation[axe]);
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

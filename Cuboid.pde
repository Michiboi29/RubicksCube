class Cuboid {
  PVector pos;
  Cuboid(float x, float y, float z){
    pos = new PVector(x,y,z);
  }
  void changePos(float x, float y, float z){
    pos = new PVector(x,y,z);
  }
  int[] rotation = {0, 0, 0};
  void changeRotation(int axe){
    rotation[axe] = (rotation[axe] + 1)%4;
  }
  
  void show(){
    fill(255);
    stroke(0);
    strokeWeight(8);
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    rotateX(radians(90*rotation[0]));
    rotateY(radians(90*rotation[1]));
    rotateZ(radians(90*rotation[2]));
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

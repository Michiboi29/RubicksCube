import peasy.*;

PeasyCam cam;
boolean [] keys = new boolean[128];

// up, down, face, back, left, right
final int YELLOW = 0, WHITE = 1, GREEN = 2, BLUE = 3, RED = 4, ORANGE = 5;
color[] colors = {
  #cccc00, #ffffff,
  #00cc00, #0066ff,
  #990000, #ff9900
};
// axes
final int X = 0, Y = 1, Z = 2;

//int dim = 3;
float len = 25;

Cube cube = new Cube(3);
void setup(){
  size(1200,900,P3D);
  cam = new PeasyCam(this, 400);
  cube.cubies[0][0][0].changePos(-25,-100,-75);
  print(cube.cubies[0][0][0].rotation[Y]);
  cube.cubies[0][0][0].changeRotation(Y);
  print(cube.cubies[0][0][0].rotation[Y]);
  cube.cubies[0][0][0].changeRotation(Y);
  print(cube.cubies[0][0][0].rotation[Y]);
  cube.cubies[0][0][0].changeRotation(Y);
  print(cube.cubies[0][0][0].rotation[Y]);
  cube.cubies[0][0][0].changeRotation(Y);
  print(cube.cubies[0][0][0].rotation[Y]);
}

void draw(){
  background(51);
  cube.show();
  cube.cubies[0][0][0].keyMove();
}

void keyPressed(){
  keys[key] = !keys[key];
  }
 
//void keyReleased(){
//    keys[key] = false;
//  }

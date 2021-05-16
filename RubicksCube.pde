import peasy.*;

PeasyCam cam;
boolean [] keys = new boolean[128];
boolean [] moving = new boolean[128];

// up, down, face, back, left, right
final int YELLOW = 0, WHITE = 1, GREEN = 2, BLUE = 3, RED = 4, ORANGE = 5;
color[] colors = {
  #cccc00, #ffffff,
  #00cc00, #0066ff,
  #990000, #ff9900
};
// axes
final int X = 0, Y = 1, axe = 2;

//int dim = 3;
float len = 25;

Cube cube = new Cube(3);
void setup(){
  size(1200,900,P3D);
  cam = new PeasyCam(this, 400);
  //print(cube.cubies[0][0][0].pos.x);print(cube.cubies[0][0][0].pos.y);println(cube.cubies[0][0][0].pos.z);
  //print(cube.cubies[1][0][0].pos.x);print(cube.cubies[1][0][0].pos.y);println(cube.cubies[1][0][0].pos.z);
  //print(cube.cubies[0][0][1].pos.x);print(cube.cubies[0][0][1].pos.y);println(cube.cubies[0][0][1].pos.z);
  //print(cube.cubies[1][0][1].pos.x);print(cube.cubies[1][0][1].pos.y);println(cube.cubies[1][0][1].pos.z);
  //print(cube.cubies[1][1][1].pos.x);print(cube.cubies[1][1][1].pos.y);println(cube.cubies[1][1][1].pos.z);
  
  //cube.cubies[1][0][0].changePos(-100,-200,-200);
  //cube.cubies[0][1][0].changePos(-100,-100,-100);
  //cube.cubies[0][0][1].changePos(-100,-200,-200);
}

void draw(){
  background(51);
  cube.show();
  cube.move();
}

void keyPressed(){
  keys[key] = true;
  }
 
//void keyReleased(){
//    keys[key] = false;
//  }

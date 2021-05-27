import peasy.*;

PeasyCam cam;
boolean [] keys = new boolean[128];
int[] moving;

// up, down, face, back, left, right
final int YELLOW = 0, WHITE = 1, GREEN = 2, BLUE = 3, RED = 4, ORANGE = 5;
final int U = 0, D = 1, F = 2, B = 3, L = 4, R = 5;
final color[] colors = {
  #cccc00, #ffffff,
  #00cc00, #0066ff,
  #990000, #ff9900
};
// axes
final int X = 0, Y = 1, Z = 2;

//int dim = 3;
float len = 25;

Cube cube = new Cube(6);
void setup(){
  size(900,700,P3D);
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
  draw_axes();
  cube.show();
  cube.move();
}

void draw_axes()
{
    //grenn X
    stroke(255,0,0);
    line(0,-250,0,250);
    // red Y
    stroke(0,250,0);
    line(-250,0,250,0);
    // blue Z
    stroke(0,0,255);
    line(0,0,-250,0,0,250);
    stroke(0);
}

// try catch shift : ArrayIndexOutOfBoundsException: 65535
void keyPressed(){
  keys[key] = true;
  }
 
//void keyReleased(){
//    keys[key] = false;
//  }

/* function that reverses dir of array for lenght of 4 */
static int[] reverseArr(int a[]){
    int n = 4;
    int [] b = new int[n];
    
    b[0] = a[0];
    b[1] = a[3];
    b[2] = a[2];
    b[3] = a[1];
    
    /*printing the reversed array*/
    System.out.println("Reversed array is: \n");
    for (int k = 0; k < n; k++) {
        System.out.println(b[k]);
    }
    
    return b;
}

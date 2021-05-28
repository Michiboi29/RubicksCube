import peasy.*;

PeasyCam cam;
//boolean [] keys = new boolean[128];

// dimmentions
int DIM = 2;
float len = 25;

// up, down, face, back, left, right
final int YELLOW = 0, WHITE = 1, GREEN = 2, BLUE = 3, RED = 4, ORANGE = 5;
final int U = 0, D = 1, F = 2, B = 3, L = 4, R = 5, MX = 6, MY = MX + DIM - 2, MZ = MY + DIM - 2;
int mid = 0;
final color[] colors = {
  #cccc00, #ffffff,
  #00cc00, #0066ff,
  #990000, #ff9900
};
// axes
final int X = 0, Y = 1, Z = 2;

// buffer
//int [] moveBuffer = new int[1024];
 ArrayList<Integer> moveBuffer = new ArrayList<Integer>(1024);

Cube cube = new Cube(DIM);
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
  
  // using add() to initialize values
  //moveBuffer.add(1);
  //moveBuffer.add(2);
  //moveBuffer.add(3);
  //moveBuffer.add(4);
  
  // printing initial value ArrayList
  System.out.print("ArrayList: " + moveBuffer);

  // find first element
  //int first = moveBuffer.get(0);
  //moveBuffer.remove(0);
  //moveBuffer.remove(0);
  //first = moveBuffer.get(0);

  // find last element
  //int last = moveBuffer.get(moveBuffer.size() - 1);

  // print first and last element of ArrayList
  //System.out.println("\nFirst : " + first
  //                   + ", Last : " + last);
                     
  System.out.print("ArrayList: " + moveBuffer);
}

void draw(){
  background(51);
  //draw_axes();
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
  // up
  if(key=='e'){
    moveBuffer.add(1*(U+1));
  }
  // up reverse
  if(key=='w'){
    moveBuffer.add(-1*(U+1));
  }
  // down
  if(key=='d'){
    moveBuffer.add(1*(D+1));
  }
  // down reverse
  if(key=='s'){
    moveBuffer.add(-1*(D+1));
  }
  // face
  if(key=='c'){
    moveBuffer.add(1*(F+1));
  }
  // face reverse
  if(key=='v'){
    moveBuffer.add(-1*(F+1));
  }
  // back
  if(key=='z'){
    moveBuffer.add(1*(B+1));
  }
  // back reverse
  if(key=='x'){
    moveBuffer.add(-1*(B+1));
  }
  // right
  if(key=='f'){
    moveBuffer.add(1*(R+1));
  }
  // right reverse
  if(key=='r'){
    moveBuffer.add(-1*(R+1));
  }
  // left
  if(key=='a'){
    moveBuffer.add(1*(L+1));
  }
  // left reverse
  if(key=='q'){
    moveBuffer.add(-1*(L+1));
  }
  if (DIM > 2){
    // mid X
    if(key=='u'){
      moveBuffer.add(1*(MX+mid+1));
    }
    // mid X reverse
    if(key=='j'){
      moveBuffer.add(-1*(MX+mid+1));
    }
    // mid Y
    if(key=='y'){
      moveBuffer.add(1*(MY+mid+1));
    }
    // mid Y reverse
    if(key=='h'){
      moveBuffer.add(-1*(MY+mid+1));
    }
    // mid Z
    if(key=='i'){
      moveBuffer.add(1*(MZ+mid+1));
    }
    // mid Z reverse
    if(key=='k'){
      moveBuffer.add(-1*(MZ+mid+1));
    }
    // change mid row
    if(key==' '){
      int n = DIM - 2;
      if(n > 0) mid = (mid + 1)%n;
      System.out.print(" n: "+n);
    }
    System.out.print(" mid: "+mid);
  }
  
  // scramble
  if(key=='m'){
    int n = DIM*15;
    for (int i = 0; i < n; i++) {
      // int r = (int)random(MZ+DIM-2);
      int r = (int)random(R) + 1;
      moveBuffer.add(r);
    }
  }
 
  System.out.print(" buffer: "+moveBuffer);
}

/* function that reverses dir of array for lenght of 4 */
static int[] reverseArr(int a[]){
    int n = 4;
    int [] b = new int[n];
    
    b[0] = a[0];
    b[1] = a[3];
    b[2] = a[2];
    b[3] = a[1];
    
    return b;
}

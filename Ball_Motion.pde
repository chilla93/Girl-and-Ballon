Ball mpira;
girl mtoto;
float accelarationX = 0.6;
float angle1 = 0;
//nt numSegments = 10;
//float[] oldx = new float[numSegments];
//float[] oldy = new float[numSegments];
float yoff = 0.0;
float girlangle = 0;

void setup(){
  size(640, 360);
  mpira = new Ball(60,60,50);
  mtoto = new girl();
}

void draw(){
  background(150);
  
  
  mpira.display();  
  mpira.move();
  
    
       

  
  


  
  
}

class Ball{
  
  float x, y, diameter, radius;
  float girlx, girly; // forward these values to girl object
  
  
  float xdirection = -1;
  float ydirection = -1;
  float yspeed = 1;
  float xspeed = 1;
  float vx = 1;
  float vy = 1;
  float oldx = 100;
  float oldy = 100;
  

  
  float segLength = 40;
  float xline, yline;
  
  
  Ball (float a, float b, float c){
    x = a;
    y = b;
    diameter = c;
    radius = c/2;
       
      }
  
  void display(){
  float dx = x - oldx;
  float dy = y - oldy;
  angle1 = atan2(dy, dx);  
  oldx = x - (cos(angle1) * segLength);
  oldy = y - (sin(angle1) * segLength);   
        
    stroke(100);
    segment(oldx, oldy, angle1); 
    
    noStroke();
    fill(0,100,210);
    //ellipse(100, 100, diameter, diameter);  
    
    pushMatrix();
    translate(x, y - 30);
    //rotate(angle1);
    beginShape();
    arc(0, 0, 45, 45, -PI, 0);  // upper half of circle
    arc(0, 0, 45, 75, 0, PI);  // upper half of circle
    endShape();
    popMatrix();
  
  float dm = oldx - girlx;
  float dn = oldy - girly;
  girlangle = atan2(dn, dm);  
  girlx = oldx - (cos(girlangle)*segLength);
  girly = oldy - (sin(girlangle)*segLength); 
  stroke(100);
  segment(girlx, girly, girlangle);    
  noStroke();
   mtoto.display(girlx, girly, girlangle);
        
  }
  
  void segment(float x, float y, float a){
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();
    
  }
  
  void move(){
    if(vx>1.5) vx-=accelarationX;
    if(vy > 1.5) vy-=accelarationX;
    
    
        
    
    x += (xdirection*vx);
    y+=(ydirection*vy);
    
    if(x>(640-12) || x<(12)){
      xdirection*=-1;
      vx=20;
    } 
 
  if(y>(360 - 10) || y<(50)){
      ydirection*=-1;
      vy = 15;
    }       
    
  }
  
  
}

class girl{
  float bodyradius, shade, headradius;
  float x = 600;
  float y = 600;
  
  
  
  girl(){
    bodyradius = 20;
    headradius = 20;
    shade = 250;    
  }
  
  void display(float a, float b, float c){
    
    fill(shade);
    pushMatrix();
    translate(a, b);
    rotate(c + PI/2);
    beginShape();
    noStroke();    
    //ellipse(0, 0, headradius, headradius);
    ellipse(-10, 0, headradius, headradius);
    stroke(255);
    strokeWeight(3);
    /*line(15,0,10,30);
    noStroke();
    vertex(0,0);
    vertex(20,50);
    vertex(-20,50);*/
    line(0,0,-5,30);
    noStroke();
    
    
    float xoff = 0;
    
     for (float x = -25; x <= 15; x ++) {
    // Calculate a y value according to noise, map to 
    float y = map(noise(xoff, yoff), 0, 1, 100,10); // Option #1: 2D Noise
    // float y = map(noise(xoff), 0, 1, 200,300);    // Option #2: 1D Noise
    
    // Set the vertex
    vertex(x, y); 
    // Increment x dimension for noise
    xoff += 0.05;
  }
  
  // increment y dimension for noise
  yoff += 0.01;
  vertex(-5,0);    
    //vertex(15,50);
    //vertex(-25,50);  
    endShape();
    popMatrix();
    
  }
  
 

void findxy(float xin, float yin, float a) {
  
  float dx = xin - x;
  float dy = yin - y;
  girlangle = atan2(dy, dx);  
  //x = xin - cos(angle) * 70;
  //y = yin - sin(angle) * 70;
  x = xin;
  y = yin;
}
  
}

import Turtle.*;
Turtle t;

void setup(){
  
  size(800,800);
  strokeWeight(3);
  noLoop();
  noFill();
  
  translate(width/2,height/2);
  drawTeardrops();
  
  flowerDesigns(width/4,width/4);
  flowerDesigns(width/4,-200);
  flowerDesigns(-200,height/4);
  flowerDesigns(-200,height/2-600);
  
}

void drawTeardrops(){
  
   for (int i = 0; i < 8; i++) {
    
    pushMatrix();
    
    rotate(i * TWO_PI/8);
    
    float scaleFactor = 1.0;
    if (i == 0) scaleFactor = 1.2;
    if (i == 2) scaleFactor = 1.2;
    if (i == 4) scaleFactor = 1.2;
    if (i == 6) scaleFactor = 1.2;
    
    scale(scaleFactor);
    
    translate(0, -100);
    teardrop();
    popMatrix();
  }
  
}

void flowerDesigns(int x,int y){
 
  pushMatrix();
  translate(x,y);
  scale(0.5);

  for (int i = 0; i < 4; i++) {
    pushMatrix();
    rotate(i * TWO_PI/4);
    translate(0, -80);
    teardrop();
    popMatrix();
  }
  ellipse(0,0,15,15);
  popMatrix();
  
}

void drawBorder(int offset){
  
  t.right(90);
  t.penUp();
  t.goToPoint(offset,offset);
  t.penDown();
  t.forward(width-offset*2);
  t.right(90);
  t.forward(height-offset*2);
  t.right(90);
  t.forward(width-offset*2);
  t.right(90);
  t.forward(height-offset*2);
  
}


void outline(){
  
  pushMatrix();
  arc(width/2, height/2+100, 300, 250, 0, PI);
  arc(width/2, height/2+95, 270, 240, 0, PI);
  arc(width/2+150, height/2, 200, 200, -HALF_PI,HALF_PI);
  arc(width/2+137, height/2, 170, 190, -HALF_PI,HALF_PI);
  arc(width / 2 - 150, height / 2, 200, 200, HALF_PI, 3*HALF_PI);
  arc(width / 2 - 137, height / 2, 170, 190, HALF_PI, 3*HALF_PI);
  arc(width / 2, height / 2 - 100, 300, 250, PI, TWO_PI);
  arc(width / 2, height / 2 - 95, 270, 240, PI, TWO_PI);
  popMatrix();
  
}

void teardrop(){
  
  beginShape();
  vertex(0, -33);
  bezierVertex(20, -33, 33, 16, 0, 66);
  bezierVertex(-33, 16, -20, -33, 0, -33);
  endShape();
}


void draw(){
  t = new Turtle(this); 
  drawBorder(40);
  drawBorder(80);
  drawBorder(100);
  drawBorder(110);
  outline();
  
  ellipse(125,125,10,10);
  ellipse(140,140,20,20);
  ellipse(width-125,125,10,10);
  ellipse(width-140,140,20,20);
  ellipse(125,height-125,10,10);
  ellipse(140,height-140,20,20);
  ellipse(width-125,height-125,10,10);
  ellipse(width-140,height-140,20,20);
  ellipse(height / 2, width / 2, 30, 30);
  
}

import Turtle.*;
Turtle t;

void setup(){
  
   size(800,800);
   noLoop(); 
   t = new Turtle(this);
   strokeWeight(2);
   
}


void draw(){
  
  triangle();
  letterI();
  letterT();
  pentagon();
  circle(70);
}

void triangle(){
  
  t.penUp();
  t.goToPoint(80,80);
  t.right(30);
  t.penDown();
  
  t.forward(30);
  t.right(120);
  t.forward(30);
  t.right(120);
  t.forward(30);
  
}

void letterI(){
  
  t.penUp();
  t.goToPoint(150,150);
  t.right(90);
  t.penDown();
  
  t.push();
  t.forward(30);
  t.right(90);
  t.push();
  t.forward(10);
  t.pop();
  t.back(10);
  t.pop();
  t.right(90);
  t.push();
  t.forward(10);
  t.pop();
  t.back(10);
  
}

void letterT(){
  
  t.penUp();
  t.goToPoint(200,200);
  t.left(90);
  t.penDown();
  
  t.forward(30);
  t.right(90);
  t.push();
  t.forward(10);
  t.pop();
  t.back(10);
  
}

void pentagon(){
  
  t.penUp();
  t.goToPoint(250,250);
  t.left(180);
  t.penDown();
  
  for(int i = 0; i < 5; i++){
    t.forward(30);
    t.right(72);
  }
  
}

void circle(int radius){
  
  t.penUp();
  t.goToPoint(300,300);
  t.left(180);
  t.penDown();
  
  float circumference = 2 * PI * radius;
  
  for (int i = 0; i < 60; i+=1){
    
    t.forward(circumference/360);
    t.right(360/50);
    
    
  }
  
}

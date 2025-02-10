import processing.pdf.*;

int petal_width=120;
int petal_length=300;

void setup() {
  
  background(255,255,255);
  size(800,800);
  strokeWeight(9);
  fill(255,255,255);
  noLoop();
}

void flower(){
  
    int numPetals = 20;
  
    for (int i=0; i<2; i+=1) {
      scale(0.65);
      petal(numPetals, petal_width, petal_length);
      numPetals -=2;

  }
  ellipse(0, 0, 330, 330);
  
}

void petal(int numPetals, int petal_width, int petal_length){
  
    for (int i = 0; i < numPetals; i++) 
    {
      
       ellipse(0, -200, petal_width, petal_length);
       rotate(radians(360)/numPetals);

  }
  
}


void draw() {
  translate(width/2, height/2);
  flower();
  
}


void keyPressed() { 
  if (key == 's') {
    String folder = "output";
    String fileName = "m2_flower.pdf";
    beginRecord(PDF, folder + "/" + fileName);
    setup();
    draw();
    endRecord();
    println("Saved to file: " + fileName);
  }
} 

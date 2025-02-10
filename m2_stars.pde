import processing.pdf.*;

void setup() {
  size(800, 800);
  background(255);
  stroke(0); 
  strokeWeight(5);
  fill(255, 255, 255);
}

void drawStar(int length2, int length1) {
  int r = length2;
  int theta = 0;
  
  beginShape();
  for (int i = 0; i < 10; i++) {
    
    theta += 36;
    vertex(getPolarX(r, theta), getPolarY(r, theta));
    
    if (r == length2) {
      r = length1;
    } else {
      r = length2;
    }
  }
  endShape(CLOSE);
}


void drawNestedStars(int length1, int length2, int layers, float scaleFactor) {
  for (int i = 0; i < layers; i++) {
    
    drawStar(length2, length1);
    
    length2 *= scaleFactor;
    length1 *= scaleFactor;
  }
}

float getPolarX(float radius, float theta) {
  return radius * cos(radians(theta));
}

float getPolarY(float radius, float theta) {
 return radius * sin(radians(theta)); 
}


void draw(){

  translate(width / 2, height / 2);
  drawNestedStars(300, 120, 4, 0.6);
  
}

void keyPressed() { 
  if (key == 's') {
    String folder = "output";
    String fileName = "m2_star.pdf";
    beginRecord(PDF, folder + "/" + fileName);
    setup();
    draw();
    endRecord();
    println("Saved to file: " + fileName);
  }
} 

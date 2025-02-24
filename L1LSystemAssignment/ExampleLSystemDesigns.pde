// ExampleLSystemDesigns - contains helper methods to create and 
// initialize an LSystem
// to set up parameters and init the LSystem (from the main file)

import java.util.HashMap;

// [TODO]: create your own L-System initialization methods
// and use/test in the setup() method of L1LSystemAssignment file. 
// See example for Square Lsystem below.


ProbabilisticLSystem ProbabilisticPlant() {
  
  float moveDist = 20; 
  float rotateAngle = 25;
  float scaleFactor = 1.5; 
  String axiom = "X";
  
  String[] xRules = { "F[-X]FF[+X]FXF[+X]", "F[+X]F", "F+F" };
  String[] fRules = { "FF","FX","F" };
  
  
  HashMap<Character, String[]> rules = new HashMap<>();
  rules.put('X', xRules);
  rules.put('F', fRules); 

  return new ProbabilisticLSystem(axiom, rules, moveDist, rotateAngle, scaleFactor);
}

LSystem plant() {
    float moveDist = 15; 
    float rotateAngle = 25;
    float scaleFactor = 1.5; 

    String axiom = "X";

    // Define production rules
    HashMap<Character, String> rules = new HashMap<>();
    rules.put('X', "F[-X]FF[+X]FXF[+X]"); 
    rules.put('F', "FF"); 


    return new LSystem(axiom, rules, moveDist, rotateAngle, scaleFactor);
}


LSystem triangles() {

  float moveDist = 20;
  float rotateAngle = 240;
  float scaleFactor = 1;
  
  String axiom = "F+F+F";
  
  HashMap<Character, String> rules = new HashMap<>();
  rules.put('F', "F-FF+FF");
    
  return new LSystem(axiom, rules, moveDist, rotateAngle, scaleFactor);
}

LSystem snowflake() {

  float moveDist = 10;
  float rotateAngle = 45;
  float scaleFactor = 1;
  
  String axiom = "F+F+F+F+F+F+F+F";
  
  HashMap<Character, String> rules = new HashMap<>();
  rules.put('F', "F+F+F+F-FF--FF-FF++FF"); //snowflake
    
  return new LSystem(axiom, rules, moveDist, rotateAngle, scaleFactor);
}

// Square Lsystem initialization 
// This method returns an Lsystem object that uses
// The rules and axioms for a square based system
LSystem initSquare() {
  // initialize turtle variables
  float moveDist = 10;
  float rotateAngle = 90;
  float scaleFactor = 1;
  
  // The intial axiom / input string
  String axiom = "F+F+F+F";
  
  // Create any production rules
  HashMap<Character, String> rules = new HashMap<>();
  rules.put('F', "F+F-F-FF+F+F-F");
    
  // Create and return the Lsystem
  return new LSystem(axiom, rules, moveDist, rotateAngle, scaleFactor);
}

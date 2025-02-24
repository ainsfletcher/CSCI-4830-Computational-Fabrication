// This is an implementation of an L-System that extends the class 
// "BaseLSystem", which makes it easy to make new types of LSystems (e.g., probabalistic)
// without repeating lots of code.
// It assumes all input vocabulary not given a rule are constants. 
// Though you could give an explicit rule for a constant using "F" --> "F"
// It contains a StringBuffer (currentIterationBuffer) that should be used
// to handle production rules when computing the currentIteration string as part of iterate
// in order avoid wasteful creation of strings and memory problems.
// The StringBuffer is used in the iterate method of the LSystem.
// @author: @mriveralee
import java.util.HashMap;
import java.util.Random;

class ProbabilisticLSystem extends BaseLSystem {
  
 // Production rules
  private HashMap<Character, String[]> rules;
  private Random random;

  // Constructor for making an Lsystem object
  public ProbabilisticLSystem(String axiom, HashMap<Character, String[]> rules, 
    float moveDistance, float rotateAngle, float scaleFactor) {            
    
    // Call Super Class constructor to initialize variables
    // You must always call this.
    super(axiom, moveDistance, rotateAngle, scaleFactor);
    
    // Set the Rules
    this.rules = rules;
    
    this.random = new Random();
    
    // Reset the state
    this.reset();
  }
  
  // runs 1 iteration, performing the rules for each character
  // on the current string. The result of the replacement is added to the currentIterationBuffer.
  public void iterate() {
    // get a copy of the current iteration string
    String current = this.getIterationString();
    
    // Now clear the current interation string
    this.clearCurrentStringBuffer();
    
    // [TODO]: Implement the procedure for using the rules to replace characters in the current string, 
    // and append them them to the currentIterationBuffer
    for(int i = 0; i < current.length();i+=1){
      
      char letter = current.charAt(i);
      if (rules.containsKey(letter)) {
        String[] choices = rules.get(letter);
        float p = random.nextFloat(); 

        String rule;
        if (p <= 0.33) {
          rule = choices[0];
        } else if (p <= 0.66) {
          rule = choices[1]; 
        } else {
          rule = choices[2]; 
        }
        
        this.currentIterationBuffer.append(rule);
      } else {
        this.currentIterationBuffer.append(letter);
      }
    }

     // Increment our iteration after we are done
     iterationNum += 1;
  }
  
  // This function uses the turtle to draw based on each character in the LSystem's 
  // iteration string. It also handles scaling the moveDistance (to keep the image in frame), if desired
  public void drawLSystem(Turtle t) {
    // Our turtle's move distance
    float dist = this.moveDistance;
    
    // Scale the movement, if necessary, to help keep the image in frame 
    // when it gets too big
    if (scaleFactor != 0) {
      // Get the current iteration number for scaling 
      int iterationNum = this.getIterationNum();
      dist = dist / (scaleFactor * (iterationNum + 1));
    }
    
    // Get the current iteration string
    String currentIteration = this.getIterationString(); 
    
    // [TODO]: Loop through each character in the iteration string,
    // and do turtle operations based on the character
    for (int i = 0; i < currentIteration.length(); i++) {
      Character c = currentIteration.charAt(i); 
      // [TODO]: Implement different l-system vocabulary
      switch (c) {
        case 'F':
          t.forward(dist);
          break; // The "break" exits out of the switch statement and prevents the next cases from running
         case '+':
           // [TODO]: Implement operations for each l-system vocabulary
          t.left(rotateAngle);
           break;
         case '-':
          t.right(rotateAngle);
           break;
         case '[':  
           t.push();
          break;
         case ']':
          t.pop();
          break;
         case 'X':
          break;
         default:
           // Throw an error if we don't have a draw operation implemented 
           throw new IllegalArgumentException("Missing a drawing operation case for character: " + c.toString());  
      }
    }
  }
}

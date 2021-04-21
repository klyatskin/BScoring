# BScoring
Scoring engine for bowling


Classes design:

- Constants.swift: global constants

- Frame.swift: 
    var isTenth: Bool  // is it last 10th frame  
    var rolls: [Int]   // all rolls for the frame   
    var numberOfRolls: Int // amount of rolls  
    var isFinished    // is frame completed  
    
    func rollWith(pins: Int) -> Bool // roll input for the current frame. Returns true/false base of input acceptance  
    func isStrike() -> Bool // returns true if the frame is strike  
    func isSpare() -> Bool // returns true is the frame is spare  
    func pinsKnocked() -> Int // returns aceppted total rolls for the frame  
    
    
 - Scoring.swift: scoring engine  
    var score: Int // current score  
    
    func reset() // reset scoring to virgin state  
    func rollWith(pins: Int) -> Bool // roll new input. Returns true/false base of input acceptance   
    
- String+Utilities.swift: String extension  
    func isInteger() -> Bool // return true is the string presents an integer  
        
- ViewController.swift: User interaction class to get the rolls input and present the score  

- BScoringTests.swift: Unit test for scoring. 
    func testScoring() throws  // test different inputs...  
  
--   


 

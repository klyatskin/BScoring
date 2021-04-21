//
//  Scoring.swift
//  BScoring
//
//  Created by Konstantin Klyatskin on 2021-04-20.
//

import Foundation


class Scoring {
    
    var score: Int {
        return calcScore()
    }

    private var frames: [Frame] = []
    private var currentFrame: Int = 0
    

    init() {
        resetFrames()
    }

    func reset() {
        resetFrames()
    }
  
    
    private func resetFrames(){
        frames = [Frame](repeating: Frame(), count: Constants.kMaxFrame)
        frames[Constants.kMaxFrame - 1].isTenth = true
        currentFrame = 0
    }
    
    
    
    func rollWith(pins: Int) -> Bool {
        if currentFrame == Constants.kMaxFrame {
            return false
        }
        if frames[currentFrame].rollWith(pins: pins) == false {
            return false
        }
        if frames[currentFrame].isFinished {
            currentFrame += 1
        }
        return true
    }
    
    
    private func calcScore() -> Int {
        
        let showOutput = UserDefaults.standard.bool(forKey: "isTest")
        if showOutput {
            print("--> Frame scores:")
        }
        var score: Int = 0
        for i in 0 ..< Constants.kMaxFrame {
            score += frames[i].pinsKnocked()
            if frames[i].isStrike() {
                if frames[i+1].isStrike() {
                    score += frames[i+1].rolls[0] + frames[i+2].rolls[0]
                } else {
                    score += frames[i+1].rolls[0] + frames[i+1].rolls[1]
                }
            }
            if frames[i].isSpare() {
                score += frames[i+1].rolls[0]
            }
            if showOutput {
                print(score, separator: " ", terminator: " ")
            }
        }
        if showOutput {
            print()
        }
        return score
    }
    
    
/*************************************/
    //MARK: - for DEBUG only
    
    var currentFrameRollString: String {
        return getCurrentFrameRollString()
    }
    
    private func getCurrentFrameRollString() -> String {
        if currentFrame >= Constants.kMaxFrame {
            return "Done"
        }
        let currentRoll = frames[currentFrame].numberOfRolls + 1
        return "\(currentFrame+1)/\(currentRoll)"
    }
    
    func debugDump() {
        print("--> Frame rolls:")
        for frame in frames {
            debugDump(frame)
        }
        print("")
    }

    private func debugDump(_ frame: Frame) {
        print("(", separator: " ", terminator: "")
        print(frame.rolls[0], separator: " ", terminator: "")

        if frame.isStrike() {
            print ("[", separator: "", terminator: "")
        } else if frame.isSpare() {
            print ("<", separator: "", terminator: "")
        } else {
            print (".", separator: "", terminator: "")
        }

        print(frame.rolls[1], separator: "", terminator: "")

        if frame.isStrike() {
            print ("]", separator: "", terminator: "")
        } else if frame.isSpare() {
            print (">", separator: "", terminator: "")
        } else {
            print (".", separator: "", terminator: "")
        }
        print (frame.rolls[2], separator: "", terminator: "")

        let sum = frame.rolls.reduce(0, +)
        print (" =\(sum))", separator: "", terminator: " ")
    }
    
}

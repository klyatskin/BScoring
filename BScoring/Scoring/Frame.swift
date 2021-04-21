//
//  Frame.swift
//  BScoring
//
//  Created by Konstantin Klyatskin on 2021-04-20.
//

import Foundation



struct Frame {
    var isTenth: Bool = false
    var rolls: [Int] = [Int](repeating: 0, count: Constants.kMaxRoll)
    var numberOfRolls: Int = 0
    var isFinished: Bool = false


    mutating func rollWith(pins: Int) -> Bool {
        if numberOfRolls == Constants.kMaxRoll { return false }
        if isFinished { return false }

        if pins > Constants.kMaxPins { return false }
        if (!isTenth && numberOfRolls == 1) {
            if pins + rolls[0] > Constants.kMaxPins {
                return false
            }
        }
        rolls[numberOfRolls] = pins
        numberOfRolls += 1
        
        if isTenth {
            if (rolls[0] == Constants.kMaxPins || rolls[0] + rolls[1] == Constants.kMaxPins) {
                isFinished = numberOfRolls == Constants.kMaxRoll
            } else {
                isFinished = numberOfRolls == 2
            }
        } else {
            if isStrike() {
                isFinished = numberOfRolls == 1
            } else {
                isFinished = numberOfRolls == 2
            }
        }
        return true
    }
    
    
    func isStrike() -> Bool {
        if isTenth { return false }
        return rolls[0] == Constants.kMaxPins
    }

    
    func isSpare() -> Bool {
        if isTenth { return false }
        return rolls[0] != Constants.kMaxPins &&
            rolls[0] + rolls[1] == Constants.kMaxPins
    }
       
    
    func pinsKnocked() -> Int {
        return rolls.reduce(0, +)
    }
        
}

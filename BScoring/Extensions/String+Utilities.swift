//
//  String+Utilities.swift
//  BScoring
//
//  Created by Konstantin Klyatskin on 2021-04-20.
//

import Foundation


extension String {
    
    func isInteger() -> Bool {
        let objcString = self as NSString
        return objcString.length > 0 && objcString.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted).location == NSNotFound
    }
}

//
//  BScoringTests.swift
//  BScoringTests
//
//  Created by Konstantin Klyatskin on 2021-04-20.
//

import XCTest
@testable import BScoring

class BScoringTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testScoring() throws {
    
        let scoring = Scoring()
        test(scoring, score: 133, [1,4,4,5,6,4,5,5,10,0,1,7,3,6,4,10,2,8,6], checkInput: true)
        test(scoring, score: 300, [10,10,10,10,10,10,10,10,10,10,10,10], checkInput: true)
        test(scoring, score: 168, [10,7,3,7,2,9,1,10,10,10,2,3,6,4,7,3,3], checkInput: true)
        test(scoring, score: 187, [10,9,1,5,5,7,2,10,10,10,9,0,8,2,9,1,10], checkInput: true)
        test(scoring, score: 122, [8,0,7,0,5,3,9,1,9,1,10,8,0,5,1,3,7,9,0], checkInput: true)
        test(scoring, score: 133, [8,2,9,0,4,4,7,2,9,0,10,10,8,0,3,5,9,1,7], checkInput: true)
        test(scoring, score: 125, [8,2,9,0,4,4,7,2,9,0,10,10,8,0,3,5,9,0], checkInput: true)

    }

    func test(_ scoring: Scoring, score: Int, _ rolls: [Int], checkInput: Bool) {
        scoring.reset()
        rolls.forEach({
            let accepted = scoring.rollWith(pins: $0);
            if (checkInput) {
                XCTAssert(accepted, "Wrong input: \($0)")
            }
        })
        let result = scoring.score
        scoring.debugDump()
        XCTAssert(result == score, "Scoring failed: \(result)")
    }
    
    
}

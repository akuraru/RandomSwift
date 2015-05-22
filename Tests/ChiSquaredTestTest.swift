//
//  ChiSquaredTestTest.swift
//  RandomSwift
//
//  Created by akuraru on 2015/06/05.
//  Copyright (c) 2015年 akuraru. All rights reserved.
//

import Foundation
import XCTest

class ChiSquaredTestTest : XCTestCase {
    func testOne() {
        let t = ChiSquaredTest()
        let b = t.observedCounts([1], expectedProbabilities: [1], significanceLevel: 0.95)
        XCTAssert(b, "hoge")
    }
    func testherf() {
        let t = ChiSquaredTest()
        let b = t.observedCounts([100, 100], expectedProbabilities: [0.5, (0.5)], significanceLevel: 0.95)
        XCTAssert(b, "hoge")
    }
    func testHerfFale() {
        let t = ChiSquaredTest()
        let b = t.observedCounts([100, 0], expectedProbabilities: [0.5, (0.5)], significanceLevel: 0.95)
        XCTAssert(b == false, "hoge")
    }
}

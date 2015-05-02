//
//  RandomTestTest.swift
//  RandomTest
//
//  Created by akuraru on 2015/04/16.
//  Copyright (c) 2015年 akuraru. All rights reserved.
//

import Foundation
import XCTest

class RandomTestTest : XCTestCase {
    let r = Random()
    
    func testInt() {
        let expect = r.intValue()
        XCTAssert(0 < expect && expect < Int.max, "\(expect)")
    }
    
    func testRange() {
        let start = 100
        let end = 200
        let expect = r.intValue(Range(start: start, end: end))
        XCTAssert(start <= expect && expect <= end, "\(expect)")
    }
    
    func
}

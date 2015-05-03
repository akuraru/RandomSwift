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
    
    func testBool() {
        let expcet = Set((1...100).map{i in self.r.boolValue()})
        XCTAssertEqual(expcet, Set([true, false]), "\(expcet)")
    }
    
    func testString() {
        let expect = r.stringValue()
        let a = expect.toInt()?.description
        XCTAssertEqual(expect, a!, "\(expect)")
        XCTAssert(0 < expect.lengthOfBytesUsingEncoding(4), "\(expect)")
    }
}

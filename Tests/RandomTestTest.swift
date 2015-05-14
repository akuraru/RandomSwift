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
        let l = self.length(expect)
        XCTAssert(0 < l, "\(expect)")
    }
    
    // Alphabet
    func testAlphabet() {
        let expect = r.alphabet()
        let l = self.length(expect)
        XCTAssert(0 < l && l <= 100, "\(expect)")
    }
    func testAlphabetIsRandom() {
        let expcet = Set((1...100).map{i in self.r.alphabet()})
        XCTAssertEqual(expcet.count, 100, "\(expcet)")
    }
    func testAlphabetlength() {
        let length = 50
        let expect = r.alphabet(length)
        let l = self.length(expect)
        XCTAssertEqual(l, length, "\(expect)")
    }
    func testAlphabetlengthIsRandom() {
        let expcet = Set((1...100).map{i in self.r.alphabet(50)})
        XCTAssertEqual(expcet.count, 100, "\(expcet)")
    }
    func testAlphabetRange() {
        let start = 50
        let end = 100
        let expect = r.alphabet(Range(start: start, end: end))
        let l = self.length(expect)
        XCTAssert(start <= l && l <= end, "\(expect)")
    }
    func testAlphabetRangeIsRandom() {
        let expcet = Set((1...100).map{i in self.r.alphabet(50...100)})
        XCTAssertEqual(expcet.count, 100, "\(expcet)")
    }
    
    // Japanese
    func testJapanese() {
        let expect = r.japanese()
        let l = self.length(expect)
        XCTAssert(0 < l && l <= 100, "\(expect)")
    }
    func testJapaneseIsRandom() {
        let expcet = Set((1...100).map{i in self.r.japanese()})
        XCTAssertEqual(expcet.count, 100, "\(expcet)")
    }
    func testJapaneselength() {
        let length = 50
        let expect = r.japanese(length)
        let l = self.length(expect)
        XCTAssertEqual(l, length, "\(expect)")
    }
    func testJapaneselengthIsRandom() {
        let expcet = Set((1...100).map{i in self.r.japanese(50)})
        XCTAssertEqual(expcet.count, 100, "\(expcet)")
    }
    func testJapaneseRange() {
        let start = 50
        let end = 100
        let expect = r.japanese(Range(start: start, end: end))
        let l = self.length(expect)
        XCTAssert(start <= l && l <= end, "\(expect)")
    }
    func testJapaneseRangeIsRandom() {
        let expcet = Set((1...100).map{i in self.r.japanese(50...100)})
        XCTAssertEqual(expcet.count, 100, "\(expcet)")
    }
    
    // Words
    func testWords() {
        let expect = r.words()
        let l = self.length(expect)
        XCTAssert(0 < l && l <= 100, "\(expect)")
    }
    func testWordsIsRandom() {
        let expcet = Set((1...100).map{i in self.r.words()})
        XCTAssertEqual(expcet.count, 100, "\(expcet)")
    }
    func testWordslength() {
        let length = 50
        let expect = r.words(length)
        let l = self.length(expect)
        XCTAssertEqual(l, length, "\(expect)")
    }
    func testWordslengthIsRandom() {
        let expcet = Set((1...100).map{i in self.r.words(50)})
        XCTAssertEqual(expcet.count, 100, "\(expcet)")
    }
    func testWordsRange() {
        let start = 50
        let end = 100
        let expect = r.words(Range(start: start, end: end))
        let l = self.length(expect)
        XCTAssert(start <= l && l <= end, "\(expect)")
    }
    func testWordsRangeIsRandom() {
        let expcet = Set((1...100).map{i in self.r.words(50...100)})
        XCTAssertEqual(expcet.count, 100, "\(expcet)")
    }
    
    // SpaseSet
    func testSpaseSet() {
        let expect = r.spaseSet()
        let l = self.length(expect)
        XCTAssert(0 < l && l <= 100, "\(expect)")
    }
    func testSpaseSetIsRandom() {
        let expcet = Set((1...100).map{i in self.r.spaseSet()})
        XCTAssertEqual(expcet.count, 100, "\(expcet)")
    }
    func testSpaseSetlength() {
        let length = 50
        let expect = r.spaseSet(length)
        let l = self.length(expect)
        XCTAssertEqual(l, length, "\(expect)")
    }
    func testSpaseSetLengthIsRandom() {
        let expcet = Set((1...100).map{i in self.r.spaseSet(50)})
        XCTAssertEqual(expcet.count, 100, "\(expcet)")
    }
    func testSpaseSetRange() {
        let start = 50
        let end = 100
        let expect = r.spaseSet(Range(start: start, end: end))
        let l = self.length(expect)
        XCTAssert(start <= l && l <= end, "\(expect)")
    }
    func testSpaseSetRangeIsRandom() {
        let expcet = Set((1...100).map{i in self.r.spaseSet(50...100)})
        XCTAssertEqual(expcet.count, 100, "\(expcet)")
    }

    
    func length(s: String) -> Int {
        var result = 0
        var index = s.startIndex
        while (index < s.endIndex) {
            index = index.successor()
            result++;
        }
        return result
    }
}

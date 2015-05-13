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
        let l = self.lenght(expect)
        XCTAssert(0 < l, "\(expect)")
    }
    
    // Alphabet
    func testAlphabet() {
        let expect = r.alphabet()
        let l = self.lenght(expect)
        XCTAssert(0 < l && l <= 100, "\(expect)")
    }
    func testAlphabetIsRandom() {
        let expcet = Set((1...100).map{i in self.r.alphabet()})
        XCTAssertEqual(expcet.count, 100, "\(expcet)")
    }
    func testAlphabetLenght() {
        let lenght = 50
        let expect = r.alphabet(lenght)
        let l = self.lenght(expect)
        XCTAssertEqual(l, lenght, "\(expect)")
    }
    func testAlphabetLenghtIsRandom() {
        let expcet = Set((1...100).map{i in self.r.alphabet(50)})
        XCTAssertEqual(expcet.count, 100, "\(expcet)")
    }
    func testAlphabetRange() {
        let start = 50
        let end = 100
        let expect = r.alphabet(Range(start: start, end: end))
        let l = self.lenght(expect)
        XCTAssert(start <= l && l <= end, "\(expect)")
    }
    func testAlphabetRangeIsRandom() {
        let expcet = Set((1...100).map{i in self.r.alphabet(50...100)})
        XCTAssertEqual(expcet.count, 100, "\(expcet)")
    }
    
    // Japanese
    func testJapanese() {
        let expect = r.japanese()
        let l = self.lenght(expect)
        XCTAssert(0 < l && l <= 100, "\(expect)")
    }
    func testJapaneseIsRandom() {
        let expcet = Set((1...100).map{i in self.r.japanese()})
        XCTAssertEqual(expcet.count, 100, "\(expcet)")
    }
    func testJapaneseLenght() {
        let lenght = 50
        let expect = r.japanese(lenght)
        let l = self.lenght(expect)
        XCTAssertEqual(l, lenght, "\(expect)")
    }
    func testJapaneseLenghtIsRandom() {
        let expcet = Set((1...100).map{i in self.r.japanese(50)})
        XCTAssertEqual(expcet.count, 100, "\(expcet)")
    }
    func testJapaneseRange() {
        let start = 50
        let end = 100
        let expect = r.japanese(Range(start: start, end: end))
        let l = self.lenght(expect)
        XCTAssert(start <= l && l <= end, "\(expect)")
    }
    func testJapaneseRangeIsRandom() {
        let expcet = Set((1...100).map{i in self.r.japanese(50...100)})
        XCTAssertEqual(expcet.count, 100, "\(expcet)")
    }
    
    // Words
    func testWords() {
        let expect = r.words()
        let l = self.lenght(expect)
        XCTAssert(0 < l && l <= 100, "\(expect)")
    }
    func testWordsIsRandom() {
        let expcet = Set((1...100).map{i in self.r.words()})
        XCTAssertEqual(expcet.count, 100, "\(expcet)")
    }
    func testWordsLenght() {
        let lenght = 50
        let expect = r.words(lenght)
        let l = self.lenght(expect)
        XCTAssertEqual(l, lenght, "\(expect)")
    }
    func testWordsLenghtIsRandom() {
        let expcet = Set((1...100).map{i in self.r.words(50)})
        XCTAssertEqual(expcet.count, 100, "\(expcet)")
    }
    func testWordsRange() {
        let start = 50
        let end = 100
        let expect = r.words(Range(start: start, end: end))
        let l = self.lenght(expect)
        XCTAssert(start <= l && l <= end, "\(expect)")
    }
    func testWordsRangeIsRandom() {
        let expcet = Set((1...100).map{i in self.r.words(50...100)})
        XCTAssertEqual(expcet.count, 100, "\(expcet)")
    }
    
    func lenght(s: String) -> Int {
        var result = 0
        var index = s.startIndex
        while (index < s.endIndex) {
            index = index.successor()
            result++;
        }
        return result
    }
}

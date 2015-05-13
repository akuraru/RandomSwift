//
//  RandomSetString.swift
//  RandomSwift
//
//  Created by akuraru on 2015/05/16.
//  Copyright (c) 2015年 akuraru. All rights reserved.
//

import Foundation
import XCTest

class RandomSetStringTest : XCTestCase {
    func testJapaneseFirst() {
        let words = Japanese()
        XCTAssertEqual(words[0], "ぁ")
    }
    func testJapaneseLength() {
        let words = Japanese()
        XCTAssertEqual(words.length, 21066)
    }
    func testJapaneseLast() {
        let words = Japanese()
        XCTAssertEqual(words[words.length - 1], "龠")
    }
    
    func testAlphabetFirst() {
        let words = Alphabet()
        XCTAssertEqual(words[0], "A")
    }
    func testAlphabetLength() {
        let words = Alphabet()
        XCTAssertEqual(words.length, 52)
    }
    func testAlphabetLast() {
        let words = Alphabet()
        XCTAssertEqual(words[words.length - 1], "z")
    }
    
    func testWordsFirst() {
        let words = Words()
        XCTAssertEqual(words[0], "A")
    }
    func testWordsLength() {
        let words = Words()
        XCTAssertEqual(words.length, 63)
    }
    func testWordsLast() {
        let words = Words()
        XCTAssertEqual(words[words.length - 1], "_")
    }
    
    func testSpaseSetFirst() {
        let words = SpaseSet()
        XCTAssertEqual(words[0], " ")
    }
    func testSpaseSetLength() {
        let words = SpaseSet()
        XCTAssertEqual(words.length, 5)
    }
    func testSpaseSetLast() {
        let words = SpaseSet()
        XCTAssertEqual(words[words.length - 1], "\u{0C}")
    }
}

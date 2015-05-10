//
//  RandomStringTest.swift
//  RandomSwift
//
//  Created by akuraru on 2015/05/10.
//  Copyright (c) 2015年 akuraru. All rights reserved.
//

import Foundation
import XCTest

class RandomStringTest : XCTestCase {
    let r = Random()
    
    func testCaptalAlphabet() {
        let alphabet = CaptalAlphabet()
        XCTAssertEqual(alphabet[0], "A")
    }
    func testCaptalAlphabetLength() {
        let alphabet = CaptalAlphabet()
        XCTAssertEqual(alphabet.length, 26)
    }
    func testCaptalAlphabetLast() {
        let alphabet = CaptalAlphabet()
        XCTAssertEqual(alphabet[alphabet.length - 1], "Z")
    }
}

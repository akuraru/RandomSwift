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
    func testCaptalAlphabet() {
        let words = CaptalAlphabet()
        XCTAssertEqual(words[0], "A")
    }
    func testCaptalAlphabetLength() {
        let words = CaptalAlphabet()
        XCTAssertEqual(words.length, 26)
    }
    func testCaptalAlphabetLast() {
        let words = CaptalAlphabet()
        XCTAssertEqual(words[words.length - 1], "Z")
    }
    
    
    func testLowerCaseAlphabetFirst() {
        let words = LowerCaseAlphabet()
        XCTAssertEqual(words[0], "a")
    }
    func testLowerCaseAlphabetLength() {
        let words = LowerCaseAlphabet()
        XCTAssertEqual(words.length, 26)
    }
    func testLowerCaseAlphabetLast() {
        let words = LowerCaseAlphabet()
        XCTAssertEqual(words[words.length - 1], "z")
    }
    
    func testAsciiWordFirst() {
        let words = AsciiWord()
        XCTAssertEqual(words[0], " ")
    }
    func testAsciiWordLength() {
        let words = AsciiWord()
        XCTAssertEqual(words.length, 95)
    }
    func testAsciiWordLast() {
        let words = AsciiWord()
        XCTAssertEqual(words[words.length - 1], "~")
    }
    
    func testNumberFirst() {
        let words = Number()
        XCTAssertEqual(words[0], "0")
    }
    func testNumberLength() {
        let words = Number()
        XCTAssertEqual(words.length, 10)
    }
    func testNumberLast() {
        let words = Number()
        XCTAssertEqual(words[words.length - 1], "9")
    }
    
    func testHiraganaFirst() {
        let words = Hiragana()
        XCTAssertEqual(words[0], "ぁ")
    }
    func testHiraganaLength() {
        let words = Hiragana()
        XCTAssertEqual(words.length, 83)
    }
    func testHiraganaLast() {
        let words = Hiragana()
        XCTAssertEqual(words[words.length - 1], "ん")
    }
    
    func testKatakanaFirst() {
        let words = Katakana()
        XCTAssertEqual(words[0], "ァ")
    }
    func testKatakanaLength() {
        let words = Katakana()
        XCTAssertEqual(words.length, 86)
    }
    func testKatakanaLast() {
        let words = Katakana()
        XCTAssertEqual(words[words.length - 1], "ヶ")
    }
    
    func testCommonKanjiFirst() {
        let words = CommonKanji()
        XCTAssertEqual(words[0], "一")
    }
    func testCommonKanjiLength() {
        let words = CommonKanji()
        XCTAssertEqual(words.length, 20897)
    }
    func testCommonKanjiLast() {
        let words = CommonKanji()
        XCTAssertEqual(words[words.length - 1], "龠")
    }
    
    func testKanji1First() {
        let words = Kanji1()
        XCTAssertEqual(words[0], "㈠")
    }
    func testKanji1Length() {
        let words = Kanji1()
        XCTAssertEqual(words.length, 37)
    }
    func testKanji1Last() {
        let words = Kanji1()
        XCTAssertEqual(words[words.length - 1], "㉄")
    }
    
    func testKanji2First() {
        let words = Kanji2()
        XCTAssertEqual(words[0], "㊀")
    }
    func testKanji2Length() {
        let words = Kanji2()
        XCTAssertEqual(words.length, 49)
    }
    func testKanji2Last() {
        let words = Kanji2()
        XCTAssertEqual(words[words.length - 1], "㊰")
    }
    
    func testKanji3First() {
        let words = Kanji3()
        XCTAssertEqual(words[0], "㐀")
    }
    func testKanji3Length() {
        let words = Kanji3()
        XCTAssertEqual(words.length, 27648)
    }
    func testKanji3Last() {
        let words = Kanji3()
        XCTAssertEqual(words[words.length - 1], "鿿")
    }
    
    func testKanji4First() {
        let words = Kanji4()
        XCTAssertEqual(words[0], "豈")
    }
    func testKanji4Length() {
        let words = Kanji4()
        XCTAssertEqual(words.length, 512)
    }
    func testKanji4Last() {
        let words = Kanji4()
        XCTAssertEqual(words[words.length - 1], "﫿")
    }
    
    func testKanji5First() {
        let words = Kanji5()
        XCTAssertEqual(words[0], "𠀀")
    }
    func testKanji5Length() {
        let words = Kanji5()
        XCTAssertEqual(words.length, 65536)
    }
    func testKanji5Last() {
        let words = Kanji5()
        XCTAssertEqual(words[words.length - 1], "𯿿")
    }
    
    
    func testHorizontalTabFirst() {
        let words = HorizontalTab()
        XCTAssertEqual(words[0], "\t")
    }
    func testHorizontalTabLength() {
        let words = HorizontalTab()
        XCTAssertEqual(words.length, 1)
    }
    func testHorizontalTabLast() {
        let words = HorizontalTab()
        XCTAssertEqual(words[words.length - 1], "\t")
    }
    
    func testVerticalTabFirst() {
        let words = VerticalTab()
        XCTAssertEqual(words[0], "\u{0B}")
    }
    func testVerticalTabLength() {
        let words = VerticalTab()
        XCTAssertEqual(words.length, 1)
    }
    func testVerticalTabLast() {
        let words = VerticalTab()
        XCTAssertEqual(words[words.length - 1], "\u{0B}")
    }
    
    func testNewlineFirst() {
        let words = Newline()
        XCTAssertEqual(words[0], "\n")
    }
    func testNewlineLength() {
        let words = Newline()
        XCTAssertEqual(words.length, 1)
    }
    func testNewlineLast() {
        let words = Newline()
        XCTAssertEqual(words[words.length - 1], "\n")
    }
    
    func testReturnFirst() {
        let words = Return()
        XCTAssertEqual(words[0], "\u{0D}")
    }
    func testReturnLength() {
        let words = Return()
        XCTAssertEqual(words.length, 1)
    }
    func testReturnLast() {
        let words = Return()
        XCTAssertEqual(words[words.length - 1], "\u{0D}")
    }
    
    func testBackSpaceFirst() {
        let words = BackSpace()
        XCTAssertEqual(words[0], "\u{08}")
    }
    func testBackSpaceLength() {
        let words = BackSpace()
        XCTAssertEqual(words.length, 1)
    }
    func testBackSpaceLast() {
        let words = BackSpace()
        XCTAssertEqual(words[words.length - 1], "\u{08}")
    }
    
    func testFormFeedFirst() {
        let words = FormFeed()
        XCTAssertEqual(words[0], "\u{0C}")
    }
    func testFormFeedLength() {
        let words = FormFeed()
        XCTAssertEqual(words.length, 1)
    }
    func testFormFeedLast() {
        let words = FormFeed()
        XCTAssertEqual(words[words.length - 1], "\u{0C}")
    }
    
    func testBellFirst() {
        let words = Bell()
        XCTAssertEqual(words[0], "\u{07}")
    }
    func testBellLength() {
        let words = Bell()
        XCTAssertEqual(words.length, 1)
    }
    func testBellLast() {
        let words = Bell()
        XCTAssertEqual(words[words.length - 1], "\u{07}")
    }
    
    func testEscapeFirst() {
        let words = Escape()
        XCTAssertEqual(words[0], "\u{1B}")
    }
    func testEscapeLength() {
        let words = Escape()
        XCTAssertEqual(words.length, 1)
    }
    func testEscapeLast() {
        let words = Escape()
        XCTAssertEqual(words[words.length - 1], "\u{1B}")
    }
    
    func testUnderBarFirst() {
        let words = UnderBar()
        XCTAssertEqual(words[0], "_")
    }
    func testUnderBarLength() {
        let words = UnderBar()
        XCTAssertEqual(words.length, 1)
    }
    func testUnderBarLast() {
        let words = UnderBar()
        XCTAssertEqual(words[words.length - 1], "_")
    }
    
    func testBackslashFirst() {
        let words = Backslash()
        XCTAssertEqual(words[0], "\\")
    }
    func testBackslashLength() {
        let words = Backslash()
        XCTAssertEqual(words.length, 1)
    }
    func testBackslashLast() {
        let words = Backslash()
        XCTAssertEqual(words[words.length - 1], "\\")
    }
    
    func testSpaceFirst() {
        let words = Space()
        XCTAssertEqual(words[0], " ")
    }
    func testSpaceLength() {
        let words = Space()
        XCTAssertEqual(words.length, 1)
    }
    func testSpaceLast() {
        let words = Space()
        XCTAssertEqual(words[words.length - 1], " ")
    }
    func testSpace() {
        let words = Space()
        let w = words[0]
        XCTAssertEqual(stringLength(w), 1)
    }
    func testHorizontalTab() {
        let words = HorizontalTab()
        let w = words[0]
        XCTAssertEqual(stringLength(w), 1)
    }
    func testReturn() {
        let words = Return()
        let w = words[0]
        XCTAssertEqual(stringLength(w), 1)
    }
    
    func testNewline() {
        let words = Newline()
        let w = words[0]
        XCTAssertEqual(stringLength(w), 1)
    }
    
    func testFormFeed() {
        let words = FormFeed()
        let w = words[0]
        XCTAssertEqual(stringLength(w), 1)
    }
    func testReturnAndNewLine() {
        let r = Return()
        let n = Newline()
        let w = "\(r[0])\(n[0])"
        XCTAssertEqual(stringLength(w), 1)
    }
}

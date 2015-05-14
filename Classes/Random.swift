import Foundation


public class Random {
    init () {
    }
    func intValue() -> Int {
        return Int(arc4random())
    }
    func intValue(range: Range<Int>) -> Int {
        return Int(arc4random_uniform(UInt32(range.endIndex - range.startIndex))) + range.startIndex
    }
    func boolValue() -> Bool {
        return arc4random_uniform(2) == 0 ? true : false
    }
    func stringValue() -> String {
        return "0"
    }
    func alphabet() -> String {
        return alphabet(1...100)
    }
    func alphabet(range: Range<Int>) -> String {
        return alphabet(intValue(range))
    }
    func alphabet(length: Int) -> String {
        let words = Alphabet()
        return (0...(length - 1)).map{i in
            words[self.intValue((0...(words.length - 1)))]
        }.reduce("", combine: { (s, t) in s + t})
    }
    
    func japanese() -> String {
        return japanese(1...100)
    }
    func japanese(range: Range<Int>) -> String {
        return japanese(intValue(range))
    }
    func japanese(length: Int) -> String {
        let words = Japanese()
        return (0...(length - 1)).map{i in
            words[self.intValue((0...(words.length - 1)))]
        }.reduce("", combine: { (s, t) in s + t})
    }
    
    func words() -> String {
        return words(1...100)
    }
    func words(range: Range<Int>) -> String {
        return words(intValue(range))
    }
    func words(length: Int) -> String {
        let words = Words()
        return (0...(length - 1)).map{i in
            words[self.intValue((0...(words.length - 1)))]
        }.reduce("", combine: { (s, t) in s + t})
    }
    
    func spaseSet() -> String {
        return spaseSet(1...100)
    }
    func spaseSet(range: Range<Int>) -> String {
        return spaseSet(intValue(range))
    }
    func spaseSet(length: Int) -> String {
        let words = SpaseSet()
        return (0...(length - 1)).map{i in
            words[self.intValue((0...(words.length - 1)))]
        }.reduce("", combine: { (s, t) in s + t})
    }
}

// Random String
public class RandomString {
    let length: Int
    init (length: Int) {
        self.length = length
    }
    
    subscript(index: Int) -> String { return "" }
}

public class WordsString : RandomString {
    let location: Int
    init (range: Range<Int>) {
        self.location = range.startIndex
        super.init(length: range.endIndex - range.startIndex)
    }
    override subscript(index: Int) -> String {
        assert(0 <= index && index < length, "fatal error: Array index out of range")
        if ((index + location) < Int(UniChar.max)) {
            let uniChar: UniChar = UniChar(index + location);
            return NSString(characters: [unichar](arrayLiteral: uniChar), length: 1) as String
        } else {
            var inputChar = UTF32Char(index + location)
            inputChar -= 0x10000
            var highSurrogate: unichar = unichar(inputChar >> 10); // leave the top 10 bits
            highSurrogate += 0xD800;
            var lowSurrogate: unichar = unichar(inputChar & 0x3FF); // leave the low 10 bits
            lowSurrogate += 0xDC00;
            return NSString(characters: [unichar](arrayLiteral: highSurrogate, lowSurrogate), length: 2) as String
        }
    }
}

public class SetString : RandomString {
    let words: [RandomString]
    
    init(words: [RandomString]) {
        self.words = words
        let l = words.reduce(0){(s, w) in s + w.length}
        super.init(length: l)
    }
    override subscript(index: Int) -> String {
        assert(0 <= index && index < length, "fatal error: Array index out of range")
        
        var i = index
        for w in self.words {
            if (i < w.length) {
                return w[i]
            } else {
                i -= w.length
            }
        }
        return ""
    }
}

public class CaptalAlphabet: WordsString {
    init () {
        super.init(range: 0x41...0x5a)
    }
}

public class LowerCaseAlphabet: WordsString {
    init() {
        super.init(range: 0x61...0x7a)
    }
}

public class AsciiWord: WordsString {
    init() {
        super.init(range: 0x20...0x7E)
    }
}

public class Number: WordsString {
    init() {
        super.init(range: 0x30...0x39)
    }
}

public class Hiragana: WordsString {
    init() {
        super.init(range: 0x3041...0x3093)
    }
}

public class Katakana: WordsString {
    init() {
        super.init(range: 0x30A1...0x30F6)
    }
}

public class CommonKanji: WordsString {
    init() {
        super.init(range: 0x4E00...0x9FA0)
    }
}

public class Kanji1: WordsString {
    init() {
        super.init(range: 0x3220...0x3244)
    }
}

public class Kanji2: WordsString {
    init() {
        super.init(range: 0x3280...0x32B0)
    }
}

public class Kanji3: WordsString {
    init() {
        super.init(range: 0x3400...0x9FFF)
    }
}

public class Kanji4: WordsString {
    init() {
        super.init(range: 0xF900...0xFAFF)
    }
}

public class Kanji5: WordsString {
    init() {
        super.init(range: 0x20000...0x2FFFF)
    }
}


public class HorizontalTab: WordsString {
    init() {
        super.init(range: 0x09...0x09)
    }
}

public class VerticalTab: WordsString {
    init() {
        super.init(range: 0x0B...0x0B)
    }
}

public class Newline: WordsString {
    init() {
        super.init(range: 0x0A...0x0A)
    }
}

public class Return: WordsString {
    init() {
        super.init(range: 0x0D...0x0D)
    }
}

public class BackSpace: WordsString {
    init() {
        super.init(range: 0x08...0x08)
    }
}

public class FormFeed: WordsString {
    init() {
        super.init(range: 0x0C...0x0C)
    }
}

public class Bell: WordsString {
    init() {
        super.init(range: 0x07...0x07)
    }
}

public class Escape: WordsString {
    init() {
        super.init(range: 0x1B...0x1B)
    }
}

public class UnderBar: WordsString {
    init() {
        super.init(range: 0x5F...0x5F)
    }
}

public class Backslash: WordsString {
    init() {
        super.init(range: 0x5c...0x5c)
    }
}

public class Space: WordsString {
    init() {
        super.init(range: 0x20...0x20)
    }
}


public class Japanese: SetString {
    init() {
        super.init(words: [
            Hiragana(),
            Katakana(),
            CommonKanji(),
        ])
    }
}

public class Alphabet: SetString {
    init() {
        super.init(words: [
            CaptalAlphabet(),
            LowerCaseAlphabet(),
        ])
    }
}

public class Words: SetString {
    init() {
        super.init(words: [
            Alphabet(),
            Number(),
            UnderBar(),
        ])
    }
}
    
public class SpaseSet: SetString {
    init() {
        super.init(words: [
            Space(),
            HorizontalTab(),
            Return(),
            Newline(),
            FormFeed(),
        ])
    }
}

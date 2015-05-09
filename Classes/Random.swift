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
        return alphabet(100)
    }
    func alphabet(range: Range<Int>) -> String {
        return alphabet(intValue(range))
    }
    func alphabet(length: Int) -> String {
        let captalAlphabet = CaptalAlphabet()
        return (0...(length - 1)).map{i in
            captalAlphabet[self.intValue((0...(captalAlphabet.length - 1)))]
        }.reduce("", combine: { (s, t) in s + t})
    }
}

// Random String
public class RandomString {
    let length: Int
    init (length: Int) {
        self.length = length
    }
    
    func stringFromIndex(index: Int) -> String { return "" }
}

public class WordsString : RandomString {
    let location: Int
    init (range: Range<Int>) {
        self.location = range.startIndex
        super.init(length: range.endIndex - range.startIndex)
    }
    subscript(index: Int) -> String {
        assert(0 <= index && index < length, "fatal error: Array index out of range")
        let uniChar: UniChar = UniChar(index + location);
        if (CFStringIsSurrogateHighCharacter(uniChar) == 1 || CFStringIsSurrogateLowCharacter(uniChar) == 1) {
            var inputChar = UTF32Char(index + location)
            inputChar -= 0x10000
            var highSurrogate: unichar = unichar(inputChar >> 10); // leave the top 10 bits
            highSurrogate += 0xD800;
            var lowSurrogate: unichar = unichar(inputChar & 0x3FF); // leave the low 10 bits
            lowSurrogate += 0xDC00;
            return NSString(characters: [unichar](arrayLiteral: highSurrogate, lowSurrogate), length: 2) as String
        }
        return NSString(characters: [unichar](arrayLiteral: uniChar), length: 1) as String
    }
}

public class CaptalAlphabet: WordsString {
    init () {
        super.init(range: 0x41...0x5a)
    }
}
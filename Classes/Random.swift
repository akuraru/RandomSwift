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
        return "1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890"
    }
    func alphabet(length: Int) -> String {
        return "1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890".substringToIndex(length)
    }
}
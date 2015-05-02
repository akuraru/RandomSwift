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
}
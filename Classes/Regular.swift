//
//  Regular.swift
//  RandomSwift
//
//  Created by akuraru on 2015/05/26.
//  Copyright (c) 2015年 akuraru. All rights reserved.
//

import Foundation

class RegularBase {
    var str = Array<RegularBase>()
    var strings = Array<RegularBase>()
    
    init() {
    }
    init(regular: String) {
        self.toObject(regular)
        self.spliteOr()
    }
    func toObject(var regular: String) {
        str = Array<RegularBase>()
        while (0 < regular.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)) {
            var (s, r) = self.push(regular)
            regular = r
            if s == "\\" {
                let (next, r) = self.slishWord(regular)
                regular = r
            } else if s == "*" {
                str[str.count - 1] = RegularRepeatZero(regular: str.last!)
            } else if s == "+" {
                str[str.count - 1] = RegularRepeatOne(regular: str.last!)
            } else if s == "?" {
                str[str.count - 1] = RegularQuestion(regular: str.last!)
            } else if s == "." {
                str.append(RegularAll())
            } else if s == "(" {
                str.append(RegularGroupStart())
            } else if s == "|" {
                str.append(RegularOR())
            } else if s == ")" {
                var i = str.count - 1
                for (; (0 <= i || str[i] as? RegularGroupStart != nil) ; i++) {
                }
                str.removeAtIndex(i)
                let renge = i..<(str.count - i)
                let group = str[renge]
                str.removeRange(renge)
                str.append(RegularGroup(group: Array(group)))
            } else {
                str.append(RegularOneString(string: s))
            }
        }
    }
    func spliteOr() {
        for var i = 0, _len = str.count; i < _len ; i++ {
            var regular = str[i]
            if let r = regular as? RegularOr {
                strings += str[0...i]
                str = Array(str[(i+1)...(_len-i+1)])
                self.spliteOr()
            } else {
                regular.spliteOr()
            }
        }
        strings += str
    }
    func push(var strings: String) -> (String, String) {
        let result = strings[strings.startIndex..<strings.startIndex.successor()]
        strings.removeAtIndex(strings.startIndex)
        return (result, strings)
    }
    func slishWord(regular: String) -> (RegularBase, String) {
        var (next, r) = self.push(regular)
        switch(next) {
        case "c":
            return (RegularAlphabet(), r)
        case "w":
            return (RegularAlphabet(), r)
        case "c":
            return (RegularAlphabet(), r)
        case "w":
            return (RegularWords(), r)
        case "s":
            return (RegularSpaceSet(), r)
        case "t":
            return (RegularHorizontalTab(), r)
        case "v":
            return (RegularVerticalTab(), r)
        case "n":
            return (RegularNewline(), r)
        case "r":
            return (RegularReturn(), r)
        case "b":
            return (RegularBackSpace(), r)
        case "f":
            return (RegularFormFeed(), r)
        case "a":
            return (RegularBell(), r)
        case "e":
            return (RegularEscape(), r)
        case "d":
            return (RegularNumber(), r)
        case "\\":
            return (RegularBackslash(), r)
        default:
            return (RegularOneString(string: next), r);
        }
    }
    func string() -> String {
        return ""
    }
}

class RegularOr: RegularBase {
}
class RegularOneString: RegularBase {
    let s: String
    init(string: String) {
        s = string
        super.init()
    }
    override func string() -> String {
        return s
    }
}
class RegularWord: RegularBase {
    let r = Random()
    override func string() -> String {
        return r.alphabet()
    }
}
class RegularAlphabet: RegularWord {
}
class RegularWords: RegularWord {
}
class RegularSpaceSet: RegularWord {
}
class RegularHorizontalTab: RegularWord {
}
class RegularVerticalTab: RegularWord {
}
class RegularNewline: RegularWord {
}
class RegularReturn: RegularWord {
}
class RegularBackSpace: RegularWord {
}
class RegularFormFeed: RegularWord {
}
class RegularBell: RegularWord {
}
class RegularEscape: RegularWord {
}
class RegularNumber: RegularWord {
}
class RegularBackslash: RegularWord {
}
class RegularRepeat: RegularBase {
    let regular: RegularBase
    let range: Range<Int>
    init(regular :RegularBase) {
        self.regular = regular
        self.range = 0...16
        super.init()
    }
    override func spliteOr() {
        regular.spliteOr()
    }
    override func string() -> String {
        var result = ""
        let _len = Int(arc4random_uniform(UInt32(range.endIndex - range.startIndex))) + range.startIndex
        for var i = 0; i < _len; i++ {
            result = result + regular.string()
        }
        return result
    }
}
class RegularRepeatZero: RegularRepeat {
}
class RegularRepeatOne: RegularRepeat {
}
class RegularQuestion: RegularRepeat {
}
class RegularAll: RegularBase {
}
class RegularGroupStart: RegularBase {
    class func generate() -> RegularBase {
        return RegularGroupStart()
    }
    func string() -> String {
        assert("RegularGroupStart")
        return ""
    }
    
}
class RegularOR: RegularBase {
}
class RegularGroup: RegularBase {
    let group: Array<RegularBase>
    init(group: Array<RegularBase>) {
        self.group = group
        super.init()
    }
}


/*
@implementation RegularGroup
+ (RegularBase *)generate:(NSArray *)_str {
    return [[self alloc] initWithArray:_str];
    }
    - (id)initWithArray:(NSArray *)_str {
        self = [super init];
        if (self) {
            strings = [NSMutableArray array];
            str = _str.mutableCopy;
        }
        return self;
}

@end
@implementation RegularOR
+ (RegularBase *)generate {
    return [[self alloc] init];
    }
    - (NSString *)string {
        NSAssert(0, @"RegularGroupStart");
        return @"";
}

@end

#define RWord(class, randClass) @implementation class \
- init { self = [super init]; if (self) { rand = [randClass sharedInstance]; } return self; }\
@end
RWord(RegularAlphabet, Alphabet)
RWord(RegularWords, Words)
RWord(RegularAll, AsciiWord)
RWord(RegularSpaceSet, SpaseSet)
RWord(RegularHorizontalTab, HorizontalTab)
RWord(RegularVerticalTab, VerticalTab)
RWord(RegularNewline, Newline)
RWord(RegularReturn, Return)
RWord(RegularBackSpace, BackSpace)
RWord(RegularFormFeed, FormFeed)
RWord(RegularBell, Bell)
RWord(RegularEscape, Escape)
RWord(RegularNumber, Number)
RWord(RegularBackslash, Backslash)
@implementation RegularRepeatOne
+ (RegularBase *)generat:(RegularBase *)regular {
    return [[self alloc] initWithRepeat:regular location:1 length:16];
}
@end
@implementation RegularQuestion
+ (RegularBase *)generat:(RegularBase *)regular {
    return [[self alloc] initWithRepeat:regular location:0 length:1];
}
@end

@implementation AKURegularString
- (NSString *)stringForRegular:(NSString *)reg {
    return [[RegularBase generat:reg.mutableCopy] string];
}
@end
*/

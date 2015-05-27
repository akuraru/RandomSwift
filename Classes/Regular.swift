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
        }
    }
    func push(var strings: String) -> (String, String) {
        let result = strings[strings.startIndex..<strings.startIndex.successor()]
        strings.removeAtIndex(strings.startIndex)
        return (result, strings)
    }
    /*
    NSString *result = [string substringToIndex:1];
    [string deleteCharactersInRange:(NSRange){0, 1}];
    return result;
    }
    
    str = [NSMutableArray array];
    while (regular.length != 0) {
    NSMutableString *s = [self push:regular].mutableCopy;
    if ([s isEqualToString:@"\\"]) {
    id next = [self slishWord:regular];
    if ([next isKindOfClass:[NSMutableString class]]) {
    [str addObject:[RegularOneString generat:s]];
    [str addObject:[RegularOneString generat:next]];
    } else {
    [str addObject:next];
    }
    } else if ([s isEqualToString:@"*"]) {
    str[str.count - 1] = [RegularRepeatZero generat:str.lastObject];
    } else if ([s isEqualToString:@"+"]) {
    str[str.count - 1] = [RegularRepeatOne generat:str.lastObject];
    } else if ([s isEqualToString:@"?"]) {
    str[str.count - 1] = [RegularQuestion generat:str.lastObject];
    } else if ([s isEqualToString:@"."]){
    [str addObject:[RegularAll generat]];
    } else if ([s isEqualToString:@"("]) {
    [str addObject:[RegularGroupStart generate]];
    } else if ([s isEqualToString:@"|"]) {
    [str addObject:[RegularOR generate]];
    } else if ([s isEqualToString:@")"]) {
    NSInteger i = str.count - 1;
    for (; 0 <= i; i--) {
    if ([str[i] isKindOfClass:[RegularGroupStart class]]) {
    break;
    }
    }
    [str removeObjectAtIndex:i];
    NSRange renge = (NSRange){i, str.count - i};
    NSArray *group = [str subarrayWithRange:renge];
    [str removeObjectsInRange:renge];
    [str addObject:[RegularGroup generate:group]];
    } else {
    [str addObject:[RegularOneString generat:s]];
    }
*/
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
            return (RegularBase(regular: next), r);
        }
    }
    /*
    
    - (NSString *)string {
    NSMutableString *string = [NSMutableString string];
    for (RegularBase *rb in strings[arc4random_uniform((u_int32_t)strings.count)]) {
    [string appendString:[rb string]];
    }
    return string;
    }
*/
}

class RegularOr: RegularBase {
}
class RegularAlphabet: RegularBase {
}
class RegularWords: RegularBase {
}
class RegularSpaceSet: RegularBase {
}
class RegularHorizontalTab: RegularBase {
}
class RegularVerticalTab: RegularBase {
}
class RegularNewline: RegularBase {
}
class RegularReturn: RegularBase {
}
class RegularBackSpace: RegularBase {
}
class RegularFormFeed: RegularBase {
}
class RegularBell: RegularBase {
}
class RegularEscape: RegularBase {
}
class RegularNumber: RegularBase {
}
class RegularBackslash: RegularBase {
}
/*
//
//  AKURegularString.m
//  AKTestFreamework
//
//  Created by P.I.akura on 2013/09/20.
//  Copyright (c) 2013年 P.I.akura. All rights reserved.
//

#import "AKURegularString.h"
#import "AKURandString.h"

@interface RegularBase : NSObject
- (NSString *)string;
@end
@interface RegularOneString : RegularBase
@end
@interface RegularWord : RegularBase
+ (RegularBase *)generat;
@end
@interface RegularAlphabet : RegularWord
@end
@interface RegularWords : RegularWord
@end
@interface RegularAll : RegularWord
@end
@interface RegularSpaceSet : RegularWord
@end
@interface RegularNumber : RegularWord
@end
@interface RegularHorizontalTab : RegularWord
@end
@interface RegularVerticalTab : RegularWord
@end
@interface RegularNewline : RegularWord
@end
@interface RegularReturn : RegularWord
@end
@interface RegularBackSpace : RegularWord
@end
@interface RegularFormFeed : RegularWord
@end
@interface RegularBell : RegularWord
@end
@interface RegularEscape : RegularWord
@end
@interface RegularBackslash : RegularWord
@end
@interface RegularRepeatZero : RegularBase
+ (RegularBase *)generat:(RegularBase *)regurla;
@end
@interface RegularRepeatOne : RegularRepeatZero
@end
@interface RegularQuestion : RegularRepeatZero
@end

@interface RegularGroupStart : RegularBase
+ (RegularBase *)generate;
@end
@interface RegularGroup : RegularBase
+ (RegularBase *)generate:(NSArray *)_str;
@end
@interface RegularOR : RegularBase
+ (RegularBase *)generate;
@end


@implementation RegularBase {
}
                }
@end

@implementation RegularOneString {
    NSString *string;
    }
    + (RegularBase *)generat:(NSMutableString *)string {
        return [[self alloc] initWithRegular:string];
        }
        - (id)initWithRegular:(NSMutableString *)regular {
            self = [super init];
            if (self) {
                string = regular;
            }
            return self;
            }
            
            - (NSString *)string {
                return string;
}
@end
@implementation RegularWord {
    @protected
    AKURandString *rand;
    }
    + (RegularBase *)generat {
        return [[self alloc] init];
        }
        - (NSString *)string {
            return [rand nextString];
}
@end
@implementation RegularRepeatZero{
    @protected
    RegularBase *r;
    NSInteger location;
    NSInteger length;
    }
    + (RegularBase *)generat:(RegularBase *)regular {
        return [[self alloc] initWithRepeat:regular location:0 length:16];
        }
        - (id)initWithRepeat:(RegularBase *)regular location:(NSInteger)loc length:(NSInteger)len{
            self = [super init];
            if (self) {
                r = regular;
                location = loc;
                length = len;
            }
            return self;
            }
            - (void)spliteOr {
                [r spliteOr];
                }
                - (NSString *)string {
                    NSMutableString *string = [NSMutableString string];
                    NSInteger _len = arc4random_uniform((u_int32_t)(length - location)) + location;
                    for (NSInteger i = 0; i < _len; i++) {
                        [string appendString:[r string]];
                    }
                    return string;
                    
}
@end
@implementation RegularGroupStart
+ (RegularBase *)generate {
    return [[self alloc] init];
    }
    - (NSString *)string {
        NSAssert(0, @"RegularGroupStart");
        return @"";
}
@end
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

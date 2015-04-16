//
//  RandomTestTest.swift
//  RandomTest
//
//  Created by akuraru on 2015/04/16.
//  Copyright (c) 2015年 akuraru. All rights reserved.
//

import Foundation
import XCTest
import RandomTest
import Alamofire

class RandomTestTest : XCTestCase {
    func testf() {
        
        Alamofire.request(.GET, "http://httpbin.org/get") .response { (request, response, data, error) in
            println(request)
            println(response)
            println(error)
        }
        let expect = RandomTest.f();
        XCTAssertEqual(expect, "", "f")
    }
}

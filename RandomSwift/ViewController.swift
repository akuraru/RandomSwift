//
//  ViewController.swift
//  RandomSwift
//
//  Created by akuraru on 2015/05/04.
//  Copyright (c) 2015年 akuraru. All rights reserved.
//

import UIKit
import Random
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let s = Random.f()
        println(s)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


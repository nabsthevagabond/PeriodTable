//
//  ViewController.swift
//  PeriodTable
//
//  Created by nabs on 2017-10-05.
//  Copyright © 2017 nabs. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let elements = DataService.jsonToElements()
        print(elements)
        
    }
}


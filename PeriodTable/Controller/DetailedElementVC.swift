//
//  DetailedElementVC.swift
//  PeriodTable
//
//  Created by nabs on 2017-10-06.
//  Copyright © 2017 nabs. All rights reserved.
//

import UIKit

class DetailedElementVC: UIViewController {

    @IBOutlet weak var source: UILabel!
    
    @IBOutlet weak var symbol: UILabel!
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var atomicNumber: UILabel!
    @IBOutlet weak var atomicMass: UILabel!
    
    @IBOutlet weak var phase: UILabel!
    
    @IBOutlet weak var summary: UILabel!
    @IBOutlet weak var period: UILabel!

    @IBOutlet weak var shells: UILabel!
    
    
    
    
    
    
    var element: Element!
    
    override func viewDidLoad() {
       super.viewDidLoad()

       print(element)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

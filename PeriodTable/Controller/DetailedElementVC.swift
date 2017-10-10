//
//  DetailedElementVC.swift
//  PeriodTable
//
//  Created by nabs on 2017-10-06.
//  Copyright © 2017 nabs. All rights reserved.
//

import UIKit

class DetailedElementVC: UIViewController {

    @IBOutlet weak var elementCardView: UIView!
    @IBOutlet weak var elementDetails: UIScrollView!
    
    var element: Element!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = element.name
        updateUIDetailedVC()
    }

    func updateUIDetailedVC(){
        
    }
    
}

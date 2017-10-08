//
//  DetailedElementVC.swift
//  PeriodTable
//
//  Created by nabs on 2017-10-06.
//  Copyright © 2017 nabs. All rights reserved.
//

import UIKit

class DetailedElementVC: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var source: UILabel!
    
    @IBOutlet weak var symbol: UILabel!
    
    //@IBOutlet weak var category: UILabel!
    @IBOutlet weak var atomicNumber: UILabel!
    @IBOutlet weak var atomicMass: UILabel!
    
    @IBOutlet weak var phase: UILabel!
    
    @IBOutlet weak var summary: UILabel!
    @IBOutlet weak var period: UILabel!

    //@IBOutlet weak var shells: UILabel!
    
    @IBOutlet weak var appearance: UILabel!
    @IBOutlet weak var discoveredBy: UILabel!
    @IBOutlet weak var namedBy: UILabel!
    @IBOutlet weak var spectralImg: UILabel!
    @IBOutlet weak var color: UILabel!
    
    @IBOutlet weak var boil: UILabel!
    @IBOutlet weak var density: UILabel!
    @IBOutlet weak var melt: UILabel!
    @IBOutlet weak var molarHeat: UILabel!
    
    @IBOutlet weak var elementDetails: UIScrollView!
    
    var element: Element!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = element.name
        updateUIDetailedVC()
    }

    func updateUIDetailedVC(){
        
        //name.text = element.name
        source.text = element.source
        symbol.text = element.symbol
        //category.text = element.category
        
        atomicNumber.text = String(element.atomicNumber)
        atomicMass.text = String(element.atomicMass)
        phase.text = element.phase
        //summary.text = element.summary
        //period.text = String(element.period)
        //shells.text = String(element.shells)
        
        
        //------values may not exist -----
        
//        appearance.text = element.appearance ?? "--"
//        discoveredBy.text = element.discoveredBy ?? "--"
//        namedBy.text = element.namedBy ?? "--"
//        spectralImg.text = element.spectralImg ?? "--"
//        color.text = element.color ?? "--"
//        
//        boil.text = doubleToStirng(element.boil)
//        density.text = doubleToStirng(element.density)
//        melt.text = doubleToStirng(element.melt)
//        molarHeat.text = doubleToStirng(element.molarHeat)
        
    }
    
    private func doubleToStirng(_ optionalDouble: Double?)-> String {
        guard let double = optionalDouble else { return "--" }
        return String(double)
    }
}



















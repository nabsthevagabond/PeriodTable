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
    
  //  @IBOutlet weak var summary: UILabel!
   // @IBOutlet weak var period: UILabel!

    //@IBOutlet weak var shells: UILabel!
    
//    @IBOutlet weak var appearance: UILabel!
//    @IBOutlet weak var discoveredBy: UILabel!
//    @IBOutlet weak var namedBy: UILabel!
//    @IBOutlet weak var spectralImg: UILabel!
//    @IBOutlet weak var color: UILabel!
//
//    @IBOutlet weak var boil: UILabel!
//    @IBOutlet weak var density: UILabel!
//    @IBOutlet weak var melt: UILabel!
//    @IBOutlet weak var molarHeat: UILabel!
    
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
        
        let appearanceText = element.appearance ?? "--"
        let discoveredByText = element.discoveredBy ?? "--"
        let namedByText = element.namedBy ?? "--"
        let spectralImgText = element.spectralImg ?? "--"
        let colorText = element.color ?? "--"
        
        let boilText = doubleToStirng(element.boil)
        let densityText = doubleToStirng(element.density)
        let meltText = doubleToStirng(element.melt)
        let molarHeatText = doubleToStirng(element.molarHeat)
        
        let listOfOptionalDescriptions: [String] = [element.summary,element.category,appearanceText,discoveredByText,namedByText, colorText, boilText,densityText,meltText,molarHeatText,spectralImgText].filter {
            $0 != "--"
        }
        
        let labels = listOfOptionalDescriptions.map {
            (text: String) -> UILabel in

            let label = UILabel()
            label.text = text
            //label.backgroundColor = .red
            label.font = UIFont.systemFont(ofSize: 20)
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            
            return label
        }
        
        addSubviewstoScrollView(labels)
    }
    
    func addSubviewstoScrollView( _ subviews: [UIView] ){
        
        var index = 0
        while(index < subviews.count){
            
            elementDetails.addSubview(subviews[index])
            subviews[index].widthAnchor.constraint(equalToConstant: elementDetails.frame.width - 20 - 20 ).isActive = true
            subviews[index].leadingAnchor.constraint(equalTo: elementDetails.leadingAnchor, constant: 10).isActive = true
            subviews[index].trailingAnchor.constraint(equalTo: elementDetails.trailingAnchor, constant: 10).isActive = true
            
            if(index == 0){
                subviews[index].topAnchor.constraint(equalTo: elementDetails.topAnchor, constant: 30).isActive = true
            } else if (index == (subviews.count - 1)) {
                subviews[index].topAnchor.constraint(equalTo: subviews[index - 1].bottomAnchor, constant: 30).isActive = true
                subviews[index].bottomAnchor.constraint(equalTo: elementDetails.bottomAnchor, constant: 30).isActive = true
            } else {
                subviews[index].topAnchor.constraint(equalTo: subviews[index - 1].bottomAnchor, constant: 30).isActive = true
            }
            
            index += 1
        }
    }
    
    private func doubleToStirng(_ optionalDouble: Double?)-> String {
        guard let double = optionalDouble else { return "--" }
        return String(double)
    }
}



















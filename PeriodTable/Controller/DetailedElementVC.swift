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
    @IBOutlet weak var symbol: UILabel!
    @IBOutlet weak var detailsScrollView: UIScrollView!
    @IBOutlet weak var webpageImage: UIImageView!
    
    @IBOutlet weak var phase: UILabel!
    @IBOutlet weak var atomicNumber: UILabel!
    @IBOutlet weak var atomicMass: UILabel!
    
    
    var element: Element!
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = element.name
        updateUIDetailedVC()
    }

    func updateUIDetailedVC(){
        symbol.text = element.symbol
        phase.text = element.phase
        atomicNumber.text = String(element.atomicNumber)
        atomicMass.text = String(element.atomicMass)
        elementCardView.backgroundColor = element.backgroundColor
    
        setUpScrollView()
        setUpTapGestureForImage()
    }
    
    
    private func setUpTapGestureForImage(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(imageTapped(gesture:)))
        webpageImage.addGestureRecognizer(tap)
    }
    
    @objc private func imageTapped(gesture: UITapGestureRecognizer){
        guard let url = URL(string: element.source) else { return }
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        
    }
    
    
    private func setUpScrollView(){

        let labels = listOfOptionalProperties()
        addViewsToScrollView(labels)
    }

    private func addViewsToScrollView(_ views: [UIView]){
        
        var index = 0
        while(index < views.count){
            
            detailsScrollView.addSubview(views[index])
            views[index].widthAnchor.constraint(equalToConstant: detailsScrollView.frame.width - 20).isActive = true
            views[index].leadingAnchor.constraint(equalTo: detailsScrollView.leadingAnchor, constant: 10).isActive = true
            views[index].trailingAnchor.constraint(equalTo: detailsScrollView.trailingAnchor, constant: -10).isActive = true
            
            if (views.count == 1) {
                views[index].topAnchor.constraint(equalTo: detailsScrollView.topAnchor, constant: 10).isActive = true
                views[index].bottomAnchor.constraint(equalTo: detailsScrollView.bottomAnchor, constant: -10).isActive = true
            } else if (index == views.count - 1) {
                views[index].topAnchor.constraint(equalTo: views[index - 1].bottomAnchor, constant: 10).isActive = true
                views[index].bottomAnchor.constraint(equalTo: detailsScrollView.bottomAnchor, constant: -10).isActive = true
            } else if (index == 0) {
                views[index].topAnchor.constraint(equalTo: detailsScrollView.topAnchor, constant: 10).isActive = true
            } else {
                views[index].topAnchor.constraint(equalTo: views[index - 1].bottomAnchor, constant: 10).isActive = true
            }
            
            index += 1
        }
    }
    
    private func listOfOptionalProperties() -> [UILabel]{
        var list: [String] = []
        
        list.append(element.catergoryTitle.capitalized + ": " + element.category)
        list.append(element.summaryTitle.capitalized + ": " + element.summary)
        
        list.append(element.discoveredByTitle.capitalized + ": " + (element.discoveredBy ?? "N/A") )
        list.append(element.appearanceTitle.capitalized + ": " + (element.appearance ?? "N/A") )
        list.append(element.namedByTitle.capitalized + ": " + (element.namedBy ?? "N/A") )
        list.append(element.colorTitle.capitalized + ": " + (element.color ?? "N/A") )
        

        if let boil = element.boil {
            list.append(element.boilTitle.capitalized + ": " + String(boil))
        } else {
            list.append(element.boilTitle.capitalized + ": " + "N/A" )
        }
        
        if let density = element.density {
            list.append(element.densityTitle.capitalized + ": " + String(density))
        } else {
            list.append(element.densityTitle.capitalized + ": " + "N/A" )
        }
        
        if let melt = element.melt {
            list.append(element.meltTitle.capitalized + ": " + String(melt))
        } else {
            list.append(element.meltTitle.capitalized + ": " + "N/A" )
        }
        
        if let molarHeat = element.molarHeat {
            list.append(element.molarHeatTitle.capitalized + ": " + String(molarHeat))
        } else {
            list.append(element.molarHeatTitle.capitalized + ": " + "N/A" )
        }
        
        
        let listOfLabels = list.map { (text) -> UILabel in
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            //label.backgroundColor = .red
            label.numberOfLines = 0
            label.lineBreakMode = NSLineBreakMode.byWordWrapping
            label.text = text
            label.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.title2)
            return label
        }
        
        return listOfLabels
    }
}













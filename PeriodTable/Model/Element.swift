//
//  Element.swift
//  PeriodTable
//
//  Created by nabs on 2017-10-05.
//  Copyright © 2017 nabs. All rights reserved.
//

import UIKit

class Element {
    
    //MARK: Element Properties
    var name: String { return _name }
    var symbol: String { return _symbol }
    var atomicNumber: Int { return _number }
    var atomicMass: Double { return _atomicMass }
    var category: String { return _category }
    var phase: String { return _phase }
    var source: String { return _source }
    var summary: String { return _summary }
    var period: Int { return _period }
    var xpos: Int { return _xpos }
    var ypos: Int { return _ypos }
    var shells: [Int] { return _shells }
    
    var appearance: String? { return _appearance }
    var discoveredBy: String? { return _discoveredBy }
    var namedBy: String? { return _namedBy }
    var color: String? { return _color }
    
    var boil: Double? { return _boil }
    var density: Double? { return _density }
    var melt: Double? { return _melt }
    var molarHeat: Double? { return _molarHeat }
    
    var spectralImgUrl: String? { return _spectralImgUrl }
    var backgroundColor: UIColor {
        return phaseToColor(_phase)
    }
    
    
    
    init(
        name: String,
        symbol: String,
        category: String,
        phase: String,
        source: String,
        summary: String,
        atomicMass: Double,
        number: Int,
        period: Int,
        xpos: Int,
        ypos: Int,
        shells: [Int],
        appearance: String?,
        discoveredBy: String?,
        namedBy: String?,
        spectralImgUrl: String?,
        color: String?,
        boil: Double?,
        density: Double?,
        melt: Double?,
        molarHeat: Double?
        ) {
        
        _name = name
        _symbol = symbol
        _category =  category
        _phase = phase
        _source = source
        _summary = summary
        _atomicMass = atomicMass
        _number = number
        _period = period
        _xpos = xpos
        _ypos = ypos
        _shells =  shells
        _appearance = appearance
        _discoveredBy = discoveredBy
        _namedBy = namedBy
        _spectralImgUrl = spectralImgUrl
        _color = color
        _boil = boil
        _density = density
        _melt = melt
        _molarHeat =  molarHeat
    }
    
    //MARK: Private element values
    private let _name: String
    private let _symbol: String
    private let _category: String
    private let _phase: String
    private let _source: String
    private let _summary: String
    
    private let _atomicMass: Double
    
    private let _number: Int
    private let _period: Int
    private let _xpos: Int
    private let _ypos: Int
    
    private let _shells: [Int]
    
    private let _appearance: String?
    private let _discoveredBy: String?
    private let _namedBy: String?
    private let _spectralImgUrl: String?
    private let _color: String?
    
    private let _boil: Double?
    private let _density: Double?
    private let _melt: Double?
    private let _molarHeat: Double?
    
   
    private func phaseToColor (_ phaseString: String)-> UIColor {
        switch(phaseString){
        case "Gas" : return UIColor.green
        case "Liquid": return UIColor.blue
        default: return UIColor.purple
        }
    }
}

//MARK: Element Extensions
extension Element: CustomStringConvertible {
    var description: String {
        return "\(name) ( \(atomicNumber), \(symbol), \(atomicMass) )"
    }
}

extension Element: Equatable, Comparable, Hashable {
    var hashValue: Int {
         return name.hashValue ^ symbol.hashValue ^ atomicNumber.hashValue ^ atomicMass.hashValue
    }
    
    static func <(lhs: Element, rhs: Element) -> Bool {
        return lhs.atomicNumber < rhs.atomicNumber
    }
    
    static func ==(lhs: Element, rhs: Element) -> Bool {
        return lhs.name == rhs.name && lhs.atomicNumber == rhs.atomicNumber && lhs.atomicMass == rhs.atomicMass
    }
}




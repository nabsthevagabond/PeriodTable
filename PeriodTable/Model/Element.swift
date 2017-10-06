//
//  Element.swift
//  PeriodTable
//
//  Created by nabs on 2017-10-05.
//  Copyright © 2017 nabs. All rights reserved.
//

import Foundation

class Element {
    
    //MARK: Element Properties
    var name: String {
        return _name
    }
    
    var symbol: String {
        return _symbol
    }
    
    var atomicNumber: Int {
        return _number
    }
    
    var atomicMass: Double {
        return _atomicMass
    }
    
    init(
        name: String,
        symbol: String,
        category: String,
        phase: String,
        appearance: String?,
        discoveredBy: String?,
        namedBy: String?,
        source: String?,
        spectralImg: String?,
        summary: String,
        atomicMass: Double,
        boil: Double,
        density: Double,
        melt: Double,
        molarHeat: Double,
        number: Int,
        period: Int,
        xpos: Int,
        ypos: Int,
        shells: [Int],
        color: Any?
        ) {
        
    _name = name
    _symbol = symbol
    _category = category
    _phase = phase
    _appearance = appearance
    _discoveredBy = discoveredBy
    _namedBy = namedBy
    _source = source
    _spectralImg = spectralImg
    _summary = summary
    _atomicMass = atomicMass
    _boil = boil
    _density = density
    _melt = melt
    _molarHeat = molarHeat
    _number = number
    _period = period
    _xpos = xpos
    _ypos = ypos
    _shells = shells
    _color = color
    }
    
    //MARK: Private element values
    private let _name: String
    private let _symbol: String
    private let _category: String
    private let _phase: String
    
    private let _appearance: String?
    private let _discoveredBy: String?
    private let _namedBy: String?
    private let _source: String?
    private let _spectralImg: String?
    private let _summary: String
    
    private let _atomicMass: Double
    private let _boil: Double
    private let _density: Double
    private let _melt: Double
    private let _molarHeat: Double
    
    private let _number: Int
    private let _period: Int
    private let _xpos: Int
    private let _ypos: Int
    
    private let _shells: [Int]
    
    private let _color: Any?
    
}

//MARK: Element Extensions
extension Element: CustomStringConvertible {
    var description: String {
        return "\(name) ( \(atomicNumber), \(symbol), \(atomicMass) )"
    }
}

extension Element: Equatable, Comparable {
    
    static func <(lhs: Element, rhs: Element) -> Bool {
        return lhs.atomicNumber < rhs.atomicNumber
    }
    
    static func ==(lhs: Element, rhs: Element) -> Bool {
        return lhs.name == rhs.name && lhs.atomicNumber == rhs.atomicNumber && lhs.atomicMass == rhs.atomicMass
    }
}






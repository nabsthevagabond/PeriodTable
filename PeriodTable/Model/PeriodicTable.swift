//
//  PeriodicTable.swift
//  PeriodTable
//
//  Created by nabs on 2017-10-06.
//  Copyright © 2017 nabs. All rights reserved.
//

import Foundation

//enum ElementCatergory: String {
//    case  actinide = "actinide"
//
//    "category": "actinide",
//    "category": "alkali metal",
//    "category": "alkaline earth metal",
//    "category": "diatomic nonmetal",
//    "category": "lanthanide",
//    "category": "metalloid",
//    "category": "noble gas",
//    "category": "polyatomic nonmetal",
//    "category": "post-transition metal",
//    "category": "transition metal",
//    "category": "unknown, predicted to be noble gas",
//    "category": "unknown, probably post transition metal",
//    "category": "unknown, probably transition metal",
//    "category": "unknown,probably metalloid",
//
//}

class PeriodicTable {
    
    var elements: [Element] {
        return _elements
    }
    
    init(elements: [Element]){
        _elements = elements
    }
    
    let _elements: [Element]
}

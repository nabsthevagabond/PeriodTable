//
//  PeriodicTable.swift
//  PeriodTable
//
//  Created by nabs on 2017-10-06.
//  Copyright © 2017 nabs. All rights reserved.
//

import Foundation

class PeriodicTable {
    
    var elements: [Element] {
        return _elements
    }
    
    init(elements: [Element]){
        _elements = elements
    }
    
    let _elements: [Element]
}

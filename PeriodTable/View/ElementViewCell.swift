//
//  ElementViewCell.swift
//  PeriodTable
//
//  Created by nabs on 2017-10-06.
//  Copyright © 2017 nabs. All rights reserved.
//

import UIKit

class ElementViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var symbol: UILabel!

    func updateElementCellUI(element: Element){
        name.text = element.name
        symbol.text = element.symbol
    }
}

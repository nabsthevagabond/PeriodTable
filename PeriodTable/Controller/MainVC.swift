//
//  ViewController.swift
//  PeriodTable
//
//  Created by nabs on 2017-10-05.
//  Copyright © 2017 nabs. All rights reserved.
//

import UIKit

class MainVC: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    var periodicTable: PeriodicTable! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let elements = DataService.jsonToElements()
        periodicTable = PeriodicTable(elements: elements)
        
        tableView.dataSource = self
        
    }
}

extension MainVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return periodicTable.elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "elementCell") as? ElementViewCell {
            let element = periodicTable.elements[indexPath.row]
            cell.updateElementCellUI(element: element)
            return cell
        } else {
            return UITableViewCell()
        }
    
    }
    
    
    
}

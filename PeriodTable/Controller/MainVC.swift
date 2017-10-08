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
        
        //customizeNavigationBar()
        //background transparent
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        let elements = DataService.jsonToElements()
        periodicTable = PeriodicTable(elements: elements)
    
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? DetailedElementVC {
            if let element =  sender as? Element {
                destinationViewController.element = element
            }
        }
    }
}

extension MainVC: UITableViewDataSource, UITableViewDelegate {
    
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
       
        let width = view.frame.width
        let customCell = cell as! ElementViewCell
        
        customCell.alpha = 0
        customCell.transform = CGAffineTransform.init(translationX: width, y: 0)

        UIView.animate(withDuration: 0.2, delay: 0, options: .allowAnimatedContent, animations: {
            customCell.transform = .identity
            customCell.alpha = 1
        })
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let element = periodicTable.elements[indexPath.row]
        performSegue(withIdentifier: "toDetailedElementVC", sender: element)
    }
}

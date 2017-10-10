//
//  ViewController.swift
//  PeriodTable
//
//  Created by nabs on 2017-10-05.
//  Copyright © 2017 nabs. All rights reserved.
//

import UIKit

//MARK: Main Veiw Controller
class MainVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var periodicTable: PeriodicTable!
    var elements: [Element]!
    var filteredElements: [Element]!
    var isSearchActive: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //delegates and datasources
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        
        //initialize navigation bar
        customizeNavigationBar()
        
        //initialize elements.
        let jsonElements = DataService.jsonToElements()
        periodicTable = PeriodicTable(elements: jsonElements)
        elements = periodicTable.elements
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? DetailedElementVC {
            if let element =  sender as? Element {
                view.endEditing(true)
                destinationViewController.element = element
            }
        }
    }
    
    private func customizeNavigationBar(){
        //customizeNavigationBar()
        //background transparent
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

//MARK: - TableView dataSource and deletages
extension MainVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isSearchActive {
            return filteredElements.count
        }
        
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "elementCell") as? ElementViewCell {
            let element = (isSearchActive) ? filteredElements[indexPath.row] : elements[indexPath.row]
            cell.updateElementCellUI(element: element)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        if isSearchActive {
            return
        }
        
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
        
        let element = (isSearchActive) ? filteredElements[indexPath.row] : elements[indexPath.row]
        performSegue(withIdentifier: "toDetailedElementVC", sender: element)
    }
}

//MARK: SearchBar delegate
extension MainVC: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar){
        isSearchActive = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar){
        isSearchActive = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar){
        isSearchActive = false
        searchBar.text = ""
        
        searchBar.resignFirstResponder()
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        
        let lowerCaseSearchText = searchText.lowercased()
        filteredElements = elements.filter { $0.name.lowercased().range(of: lowerCaseSearchText) != nil  }
        isSearchActive = (filteredElements.count == 0) ? false : true
        
        tableView.reloadData()
    }
}

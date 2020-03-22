//
//  MenuTableViewController.swift
//  BM
//
//  Created by Spencer Belton on 3/22/20.
//  Copyright © 2020 Spencer Belton. All rights reserved.
//

import UIKit

class MenuTableViewController: UIViewController {

    
    @IBOutlet weak var menuTableView: UITableView!
    
    var menu = [
    "Home",
    "Materials",
    "Calendar",
    "Settings",
    "Account"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuTableView.dataSource = self
        menuTableView.delegate = self

    }
    


}


//MARK: - TableView Data Source

extension MenuTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cells.menuCell, for: indexPath)
        cell.textLabel?.text = menu[indexPath.row]
        return cell
        
    }
    
    
}

//MARK: - TableView Delegate

extension MenuTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            <#code#>
        case 1:
            performSegue(withIdentifier: K.segues.menuToMaterials, sender: self)
        case 2:
            performSegue(withIdentifier: K.segues.menuToCalendar, sender: self)
        case 3:
            performSegue(withIdentifier: K.segues.menuToAccount, sender: self)
        case 4:
            performSegue(withIdentifier: K.segues.menuToSettings, sender: self)
        default:
            break
        }
    }
    
}

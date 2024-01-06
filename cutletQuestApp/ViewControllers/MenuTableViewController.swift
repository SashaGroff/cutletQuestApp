//
//  MenuTableViewController.swift
//  cutletQuestApp
//
//  Created by Aleksandr Goncharov on 06.01.2024.
//

import UIKit

class MenuTableViewController: UITableViewController {
    var burger = Burger()
    override func viewDidLoad() {
        super.viewDidLoad()
        burger.getBurger()

    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! MenuTableViewCell
        cell.configureCell(burger: burger.burgers[indexPath.row])
        
        return cell
    }



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return burger.burgers.count
    }
}

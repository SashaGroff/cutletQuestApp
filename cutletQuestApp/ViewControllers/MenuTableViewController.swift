//
//  MenuTableViewController.swift
//  cutletQuestApp
//
//  Created by Aleksandr Goncharov on 06.01.2024.
//

import UIKit

final class MenuTableViewController: UITableViewController {
    // MARK: - Public Properties
    private var burger = Burger()
    
    // MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        burger.getBurger()

    }

    // MARK: - Table View data Source
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! MenuTableViewCell
        cell.configureCell(burger: burger.burgers[indexPath.row])
        
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return burger.burgers.count
    }
}

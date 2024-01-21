//
//  MenuTableViewController.swift
//  cutletQuestApp
//
//  Created by Aleksandr Goncharov on 06.01.2024.
//

import UIKit

final class MenuTableViewController: UITableViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let productCell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! MenuTableViewCell
            productCell.configureCell(product: CurrentMenu.shared.products[indexPath.row])
            return productCell
        } else {
            let quizCell = tableView.dequeueReusableCell(withIdentifier: "quizCell", for: indexPath) as! QuizTableViewCell
            return quizCell
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? CurrentMenu.shared.products.count : 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.section == 0 ? 150 : 130
    }
}


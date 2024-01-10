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
        
        if indexPath.section == 0 {
            let productCell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! MenuTableViewCell
            productCell.configureCell(burger: burger.burgers[indexPath.row])
            return productCell
        } else {
            let quizCell = tableView.dequeueReusableCell(withIdentifier: "quizCell", for: indexPath) as! QuizTableViewCell
            return quizCell
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2 // Одна секция для бургеров, другая для квиза
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return section == 0 ? burger.burgers.count : 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 150 : 130
    }
}


//
//  AboutAppTableViewController.swift
//  cutletQuestApp
//
//  Created by Natalia Ovdina on 19.01.2024.
//

import UIKit

final class AboutAppTableViewController: UITableViewController {
    
    private let infoAboutApp = DataStore.shared.aboutApp
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 60
        
    }
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "infoDetails", for: indexPath)
            var content = cell.defaultContentConfiguration()
            
            if indexPath.row == 0 {
                content.text = "Cайт"
                content.textProperties.font = .boldSystemFont(ofSize: 16)
                content.textProperties.color = .label
                content.secondaryText = infoAboutApp.site
                cell.contentConfiguration = content
                return cell
            } else {
                content.text = "Телефон"
                content.textProperties.font = .boldSystemFont(ofSize: 16)
                content.textProperties.color = .label
                content.secondaryText = infoAboutApp.telephone
                cell.contentConfiguration = content
                return cell
            }
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "fullInfoDetails", for: indexPath)
            var content = cell.defaultContentConfiguration()
            content.text = "О нас"
            content.textProperties.font = .boldSystemFont(ofSize: 16)
            content.textProperties.color = .label
            cell.contentConfiguration = content
            return cell
        }
    }
}

// MARK: - UITableViewDelegate

extension AboutAppTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}





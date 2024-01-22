//
//  AboutUsInfoViewController.swift
//  cutletQuestApp
//
//  Created by Natalia Ovdina on 08.01.2024.
//

import UIKit

final class AboutUsInfoViewController: UITableViewController {
    private let developers = DataStore.shared.developers
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 90
    }
}

// MARK: - UITableViewDataSource
extension AboutUsInfoViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        developers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "usInfo", for: indexPath)
        let developer = developers[indexPath.section]
        var content = cell.defaultContentConfiguration()
        
        content.text = developer.email
        content.textProperties.font = .boldSystemFont(ofSize: 15)
        content.textProperties.color = .gray
        content.secondaryText = developer.githubURL
        content.image = UIImage(named: developer.photoURL)
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        
        cell.contentConfiguration = content
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension AboutUsInfoViewController {
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let contentView = UIView()
        let nameLabel = UILabel()
        let developer = developers[section]
        
        nameLabel.text = developer.fullName
        nameLabel.font = UIFont.boldSystemFont(ofSize: 17)
        nameLabel.frame = CGRect(x: 10, y: -8, width: tableView.frame.width - 32, height: 30)
        
        nameLabel.textColor = .label
        
        contentView.addSubview(nameLabel)
        return contentView
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

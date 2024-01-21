//
//  AboutUsInfoViewController.swift
//  cutletQuestApp
//
//  Created by Natalia Ovdina on 18.01.2024.
//

import UIKit

final class AboutUsInfoViewController: UITableViewController {

    // MARK: - View Life Cycle
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
        6
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "usInfo", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = "Ссылка на GitHub:"
        content.textProperties.font = .boldSystemFont(ofSize: 15)
        content.textProperties.color = .gray
        content.secondaryText = "https://github.com/NatashaOvdina"
        content.image = UIImage(named: "Natasha")
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
        
        nameLabel.text = "Наталья Овдина"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 17)
        nameLabel.frame = CGRect(x: 10, y: -8, width: tableView.frame.width - 32, height: 30)
        
        nameLabel.textColor = .black
        
        contentView.addSubview(nameLabel)
        return contentView
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

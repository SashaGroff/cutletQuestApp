//
//  AboutUsInfoViewController.swift
//  cutletQuestApp
//
//  Created by Natalia Ovdina on 18.01.2024.
//

import UIKit

final class AboutUsInfoViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 90
    }
    

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

}

// MARK: - UITableViewDataSource

extension AboutUsInfoViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }
}

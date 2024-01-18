//
//  SettingsTableViewController.swift
//  cutletQuestApp
//
//  Created by Natalia Ovdina on 18.01.2024.
//

import UIKit

final class SettingsTableViewController: UITableViewController {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var telephoneTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Override Keyboard Method
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            3
        case 1:
            1
        default:
            3
        }
    }

    

}

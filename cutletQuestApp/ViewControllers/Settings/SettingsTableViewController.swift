//
//  SettingsTableViewController.swift
//  cutletQuestApp
//
//  Created by Natalia Ovdina on 18.01.2024.
//

import UIKit

final class SettingsTableViewController: UITableViewController {

    // MARK: - IB Outlets
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var telephoneTextField: UITextField!
    @IBOutlet var switchParameter: UISwitch!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        switchParameter.isOn = false
        
        nameTextField.isUserInteractionEnabled = false
        telephoneTextField.isUserInteractionEnabled = false
        

    }
    
    // MARK: - Override Keyboard Method
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    
   // @IBAction func closeActionButton() {
        
   // }
    
    // MARK: - UITableViewDataSource
    
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


// MARK: - UITableViewDelegate

extension SettingsTableViewController {
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let contentView = UIView()
        let label = UILabel()
        
        switch section {
        case 0:
            label.text = "Мои данные"
        case 1:
            label.text = "Уведомления"
        default:
            label.text = "Информация"
        }
        
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.frame = CGRect(x: 10, y: -8, width: tableView.frame.width - 32, height: 30)
        
        label.textColor = .systemGray
        
        contentView.addSubview(label)
        return contentView
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


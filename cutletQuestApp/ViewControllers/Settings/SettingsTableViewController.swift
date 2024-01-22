//
//  SettingsTableViewController.swift
//  cutletQuestApp
//
//  Created by Natalia Ovdina on 08.01.2024.
//

import UIKit

final class SettingsTableViewController: UITableViewController {
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var telephoneTextField: UITextField!
    @IBOutlet var switchParameter: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchParameter.isOn = false
        
        nameTextField.isUserInteractionEnabled = false
        nameTextField.text = CurrentUser.shared.user?.name
    
        telephoneTextField.isUserInteractionEnabled = false
        telephoneTextField.text = CurrentUser.shared.user?.login
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
}

// MARK: - UITableViewDelegate
extension SettingsTableViewController {
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let contentView = UIView()
        let label = UILabel()
        
        label.text = switch section {
        case 0:
            "Мои данные"
        case 1:
            "Уведомления"
        default:
            "Информация"
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


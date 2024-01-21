//
//  EmailTableViewCell.swift
//  cutletQuestApp
//
//  Created by Natalia Ovdina on 21.01.2024.
//

import UIKit

final class EmailTableViewCell: UITableViewCell {
    
    @IBOutlet var emailTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        emailTextField.delegate = self
    }
    
    
    @IBAction func buttonEmailAction(_ sender: UIButton) {
        emailTextField.resignFirstResponder()
        
        UIView.animate(withDuration: 0.1, animations: {
            sender.alpha = 0.5
        }) { (_) in
            UIView.animate(withDuration: 0.1) {
                sender.alpha = 1.0
            }
        }
    }
    
}
// MARK: - UITextFieldDelegate

extension EmailTableViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

//
//  EmailTableViewCell.swift
//  cutletQuestApp
//
//  Created by Natalia Ovdina on 21.01.2024.
//

import UIKit

final class EmailTableViewCell: UITableViewCell {
    
    @IBOutlet var emailTextField: UITextField!
    
    @IBAction func buttonEmailAction(_ sender: UIButton) {
        CurrentUser.shared.user?.email = emailTextField.text
 
        emailTextField.resignFirstResponder()
        
        UIView.animate(withDuration: 0.1, animations: {sender.alpha = 0.5})
        UIView.animate(withDuration: 0.1, animations: {sender.alpha = 1})
    }
}

// MARK: - UITextFieldDelegate
extension EmailTableViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

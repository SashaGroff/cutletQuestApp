//
//  EmailTableViewCell.swift
//  cutletQuestApp
//
//  Created by Natalia Ovdina on 21.01.2024.
//

import UIKit

final class EmailTableViewCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet var emailTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        emailTextField.delegate = self
      
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
        }
    
    @IBAction func buttonEmailAction(_ sender: UIButton) {
        emailTextField.resignFirstResponder()
        
        UIView.animate(withDuration: 0.1, animations: {
            // Уменьшаем прозрачность кнопки при нажатии
            sender.alpha = 0.5
        }) { (_) in
            UIView.animate(withDuration: 0.1) {
                // Возвращаем прозрачность кнопки к нормальному состоянию
                sender.alpha = 1.0
            }
        }
    }

    }
    
   

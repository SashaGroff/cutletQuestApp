//
//  WelcomeViewController.swift
//  cutletQuestApp
//
//  Created by Rustam Cherezbiev on 03.01.2024.
//

import UIKit

final class LoginViewController: UIViewController {

    @IBOutlet var loginPhoneTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    @IBOutlet var welcomeLogoView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if SessionManager.shared.loginUser(login: loginPhoneTF.text ?? "", password: passwordTF.text ?? "") {
            return true
        } else {
            showAlert(
                withTitle: "Неверный логин или пароль!",
                andMessage: "Пожалуйста, введите корректные данные."
            )
            return false
        }
    }
    
//    @IBAction func forgotPasswordAction() {
//        showAlert(
//            withTitle: "Oops!",
//            andMessage: "Твой логин: \(User().login), пароль: \(User().userPassword) 😉"
//        )
//    }
    
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTF.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

//
//  WelcomeViewController.swift
//  cutletQuestApp
//
//  Created by Rustam Cherezbiev on 03.01.2024.
//

import UIKit

final class WelcomeViewController: UIViewController {
    @IBOutlet var loginPhoneTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    @IBOutlet var welcomeLogoView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginPhoneTF.delegate = self
        passwordTF.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func loginButtonTapped() {
        performUserLogin()
    }
    
    @IBAction func registrationButtonTapped() {
        registrationAlert()
    }
    
    @IBAction func forgotPassword() {
        guard let login = loginPhoneTF.text,
              !login.isEmpty else {
            showAlert(withTitle: "Ошибка", andMessage: "Введите логин!")
            return
        }
        
        if let password = DataStore.shared.forgotUser(login: login) {
            showAlert(withTitle: "Ваш пароль", andMessage: password)
        } else {
            showAlert(withTitle: "Sorry!", andMessage: "Такого логина нет!")
        }
    }
    
    private func performUserLogin() {
        guard let login = loginPhoneTF.text,
              let password = passwordTF.text,
              !login.isEmpty,
              !password.isEmpty else {
            showAlert(withTitle: "Ошибка", andMessage: "Заполните все поля")
            return
        }
        
        if SessionManager.shared.loginUser(login: login, password: password) {
            loginPhoneTF.text = login
            passwordTF.text = password
            performSegue(withIdentifier: "loginButton", sender: nil)
        } else {
            showAlert(withTitle: "Sorry!", andMessage: "Неверное имя или пароль!")
        }
    }
}

// MARK: - AlertControllers
private extension WelcomeViewController {
    func registrationAlert() {
        let alert = UIAlertController(title: "Registration", message: nil, preferredStyle: .alert)
        alert.addTextField{
            $0.placeholder = "Телефон"
        }
        alert.addTextField {
            $0.placeholder = "Пароль"
        }
        alert.addTextField{
            $0.placeholder = "Имя"}
        
        let okAction = UIAlertAction(title: "Создать", style: .destructive) { [unowned self] _ in
            guard let login = alert.textFields?.first?.text,
                  let name = alert.textFields?.last?.text,
                  let password = alert.textFields?[1].text,
                  !login.isEmpty,
                  !name.isEmpty,
                  !password.isEmpty else {
                showAlert(withTitle: "Ошибка", andMessage: "Заполните все поля")
                return
            }
            
            if DataStore.shared.createUser(login: login, password: password, name: name) {
                loginPhoneTF.text = login
                passwordTF.text = password
                performSegue(withIdentifier: "loginButton", sender: nil)
            } else {
                showAlert(withTitle: "Sorry!", andMessage: "Такой пользователь уже существует!")
            }
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    func showAlert(withTitle title: String, andMessage message: String) {
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

// MARK: - UITextFieldDelegate
extension WelcomeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginPhoneTF {
            passwordTF.becomeFirstResponder()
        }else if textField == passwordTF {
            performUserLogin()
        }
        return true
    }
}

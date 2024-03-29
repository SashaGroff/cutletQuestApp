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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func loginButtonTapped() {
        performUserLogin()
    }
    
    @IBAction func forgotPassword() {
            guard let login = loginPhoneTF.text,
                  !login.isEmpty else {
                showAlert(withTitle: "Ошибка", andMessage: "Введите логин!")
                return
            }
            
        if let password = DataStore.shared.users.first(where: { $0.login == login })?.password {
                showAlert(withTitle: "Ваш пароль", andMessage: password)
            } else {
                showAlert(withTitle: "Извините", andMessage: "Такого логина не существует!")
            }
        }
    
    @IBAction func registerUserAction() {
        registerUserAlert(
            withTitle: "Регистрация",
            andMessage: "Введите ваши данные"
        )
    }
    
    @IBAction func unwindToFirstScreen(_ unwindSegue: UIStoryboardSegue) {
        loginPhoneTF.text = ""
        passwordTF.text = "" 
        CurrentUser.shared.user = nil
    }
    
    private func performUserLogin() {
        guard let login = loginPhoneTF.text, !login.isEmpty,
              let password = passwordTF.text, !password.isEmpty else {
            showAlert(withTitle: "Ошибка", andMessage: "Заполните все поля")
            return
        }
        
        if let user = SessionManager.shared.loginUser(login: login, password: password) {
            CurrentUser.shared.user = user
            CurrentMenu.shared.products = SessionManager.shared.getMenu()
            performSegue(withIdentifier: "loginButton", sender: nil)
        } else {
            showAlert(withTitle: "Ошибка", andMessage: "Неверное имя или пароль!")
        }
    }
    
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
    
    private func registerUserAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        alert.addTextField { textField in
            textField.placeholder = "Ваше имя"
        }
        
        alert.addTextField { textField in
            textField.placeholder = "Номер телефона"
            textField.keyboardType = .phonePad
        }
        
        alert.addTextField { textField in
            textField.placeholder = "Придумайте пароль"
            textField.isSecureTextEntry = true
        }
        
        let regAction = UIAlertAction(title: "Зарегистрироваться", style: .default) { _ in
            guard let name = alert.textFields?[0].text, !name.isEmpty else {
                self.showAlert(
                    withTitle: "Ошибка",
                    andMessage: "Пожалуйста, введите ваше имя."
                )
                return
            }
            
            guard let login = alert.textFields?[1].text, !login.isEmpty else {
                self.showAlert(
                    withTitle: "Ошибка",
                    andMessage: "Пожалуйста, введите номер телефона."
                )
                return
            }
            
            guard let password = alert.textFields?[2].text, !password.isEmpty else {
                self.showAlert(
                    withTitle: "Ошибка",
                    andMessage: "Пожалуйста, введите пароль."
                )
                return
            }
            
            SessionManager.shared.createUser(
                login: login,
                password: password,
                name: name
            )
        }
        
        alert.addAction(regAction)
        present(alert, animated: true)
    }
}


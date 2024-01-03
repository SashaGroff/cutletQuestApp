//
//  WelcomeViewController.swift
//  cutletQuestApp
//
//  Created by Rustam Cherezbiev on 03.01.2024.
//

import UIKit

final class WelcomeViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var loginPhoneTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    @IBOutlet var welcomeLogoView: UIImageView!
    
    // MARK: - Public Properties

    // MARK: - Private Properties
    private let welcomeImage = UIImage(named: "WelcomeImage")
    //private let newSize = CGSize(width: 1200, height: 1100)
    private let scale = 2.0

    // MARK: - Initializers
    
    // MARK: - Overrides Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLogoView.image = welcomeImage
        welcomeLogoView.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "loginButton" {
            guard loginPhoneTF.text == User().userLogin, passwordTF.text == User().userPassword else {
                showAlert(
                    withTitle: "Неверный логин или пароль!",
                    andMessage: "Пожалуйста, введите корректные данные."
                )
                return false
            }
        }
        return true
    }
    
    // MARK: - IB Actions
    @IBAction func forgotPasswordAction() {
        showAlert(
            withTitle: "Oops!",
            andMessage: "Твой логин: \(User().userLogin), пароль: \(User().userPassword) 😉"
        )
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        loginPhoneTF.text = ""
        passwordTF.text = ""
    }
    
    // MARK: - Public Methods

    // MARK: - Private Methods
    
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

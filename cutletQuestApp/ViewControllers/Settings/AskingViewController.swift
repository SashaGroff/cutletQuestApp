//
//  AboutUsViewController.swift
//  cutletQuestApp
//
//  Created by Natalia Ovdina on 18.01.2024.
//

import UIKit

final class AskingViewController: UIViewController, UITextViewDelegate {

    @IBOutlet var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
    }
    
    @IBAction func tappedButton() {
        if textView.text == "" {
            showAlert(
                withTitle: "Опишите нам вашу ситуацию",
                andMessage: ""
            )
        } else {
            textView.text = ""
            showAlert(
                withTitle: "Cпасибо за обратную связь!",
                andMessage: "Мы рассмотрим ваше сообщение как можно скорее"
            )
        }
    }
    
    // MARK: - Override Keyboard Method
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    
    // MARK: - Private Method Alert
    private func showAlert(
        withTitle title: String,
        andMessage message: String,
        completion: (() -> Void)? = nil
    ) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }

}

// MARK: - UITextViewDelegate

extension AskingViewController {
    func textView(
        _ textView: UITextView,
        shouldChangeTextIn range: NSRange,
        replacementText text: String
    ) -> Bool {
        if (text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
}

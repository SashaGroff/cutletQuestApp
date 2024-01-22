//
//  UILabel.swift
//  cutletQuestApp
//
//  Created by Егор Аблогин on 22.01.2024.
//

import UIKit

extension UILabel {
    func animate() {
        UIView.animate(withDuration: 0.2, animations: {
            self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            self.alpha = 1.0
        }) { _ in
            UIView.animate(withDuration: 0.2) {
                self.transform = CGAffineTransform.identity
                self.alpha = 0.5
            }
        }
    }
}

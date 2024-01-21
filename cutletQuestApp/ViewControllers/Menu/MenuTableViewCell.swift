//
//  MenuTableViewCell.swift
//  cutletQuestApp
//
//  Created by Aleksandr Goncharov on 06.01.2024.
//

import UIKit

final class MenuTableViewCell: UITableViewCell {
    @IBOutlet var productImage: UIImageView!
    
    @IBOutlet var productName: UILabel!
    @IBOutlet var productDescription: UILabel!
    @IBOutlet weak var productAmmount: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    private var product: Product?
    
    @IBAction func productStepper(_ sender: UIStepper) {
        guard let product = product else { return }
        
        let currentAmount = CurrentUser.shared.user?.basket.getBasket()[product] ?? 0
        let stepperAmount = Int(sender.value)
        productAmmount.isHidden = sender.value == 0
        
        if currentAmount < stepperAmount {
            CurrentUser.shared.user?.basket.addToBasket(product: product)
        } else if currentAmount > stepperAmount {
            CurrentUser.shared.user?.basket.removeFromBasket(product: product)
        }
        
        productAmmount.text = "X\(stepperAmount)"
        animateProductAmmount()
    }
    
    func configureCell(product: Product) {
        self.product = product
        productImage.image = UIImage(named: product.pictureURL)
        productName.text = product.name
        productDescription.text = product.description
        productPrice.text = "\(product.price.formatted())₽"
    }
    
    private func animateProductAmmount() {
        UIView.animate(withDuration: 0.2, animations: { [weak self] in
            self?.productAmmount.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            self?.productAmmount.alpha = 1.0
        }) { _ in
            UIView.animate(withDuration: 0.2) { [weak self] in
                self?.productAmmount.transform = CGAffineTransform.identity
                self?.productAmmount.alpha = 0.5
            }
        }
    }
}

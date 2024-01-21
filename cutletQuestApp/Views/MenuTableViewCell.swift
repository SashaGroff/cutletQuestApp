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
    
    @IBOutlet weak var ammountStepper: UIStepper!
    
    private var product: Product?
    
    @IBAction func productStepper() {
        let stepperAmount = Int(ammountStepper.value)
        
        updateProductAmountInBasket(to: stepperAmount)
        updateProductAmountLabel(stepperAmount)
    }
    
    func configureCell(product: Product) {
        self.product = product
        productImage.image = UIImage(named: product.pictureURL)
        productName.text = product.name
        productDescription.text = product.description
        productPrice.text = "\(product.price.formatted())₽"
        
        let amountInBasket = CurrentUser.shared.user?.basket.getBasket()[product] ?? 0
        productAmmount.text = "X\(amountInBasket)"
        productAmmount.isHidden = amountInBasket == 0
        ammountStepper.value = Double(amountInBasket)
    }
    
    private func updateProductAmountInBasket(to amount: Int) {
        guard let product = product  else { return }
        
        let currentAmount = CurrentUser.shared.user?.basket.getBasket()[product] ?? 0
        
        if currentAmount < amount {
            CurrentUser.shared.user?.basket.addToBasket(product: product)
        } else if currentAmount > amount {
            CurrentUser.shared.user?.basket.removeFromBasket(product: product)
        }
    }
    
    private func updateProductAmountLabel(_ amount: Int) {
        productAmmount.isHidden = amount == 0
        productAmmount.text = "X\(amount)"
        productAmmount.animate()
    }
}

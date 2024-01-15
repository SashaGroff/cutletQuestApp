//
//  CartProductCellView.swift
//  cutletQuestApp
//
//  Created by Егор Аблогин on 12.01.2024.
//

import UIKit

final class CartProductCellView: UITableViewCell {
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productCostLabel: UILabel!
    @IBOutlet weak var productCountLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var stepperValue: UIStepper!
    
    @IBOutlet weak var stepperStack: UIStackView!
    
    var onStepperValueChanged: ((Double, Product) -> Void)?
    var product: Product?
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        productCountLabel.text = Int(stepperValue.value).description
        
        if let product {
                    onStepperValueChanged?(sender.value, product)
                }
    }
    
}

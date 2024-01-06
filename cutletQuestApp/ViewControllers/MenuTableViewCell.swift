//
//  MenuTableViewCell.swift
//  cutletQuestApp
//
//  Created by Aleksandr Goncharov on 06.01.2024.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet var productImage: UIImageView!
    @IBOutlet var productName: UILabel!
    @IBOutlet var productDescription: UILabel!
    @IBOutlet var productPrice: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(burger: Product) {
        productImage.image = UIImage(named: burger.productImage)
        productName.text = burger.name
        productDescription.text = burger.ingredient
        productPrice.setTitle(burger.price, for: .normal)
    }
}

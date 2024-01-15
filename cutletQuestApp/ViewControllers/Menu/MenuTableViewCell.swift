//
//  MenuTableViewCell.swift
//  cutletQuestApp
//
//  Created by Aleksandr Goncharov on 06.01.2024.
//

import UIKit

final class MenuTableViewCell: UITableViewCell {
    // MARK: - IB Outlets
    @IBOutlet var productImage: UIImageView!
    @IBOutlet var productName: UILabel!
    @IBOutlet var productDescription: UILabel!
    @IBOutlet var productPrice: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    // MARK: - IB Actions
    @IBAction func addToBasketButton() {
    }
    
    // MARK: - Public Methods
    func configureCell(product: Product) {
        productImage.image = UIImage(named: product.pictureURL)
        productName.text = product.name
        productDescription.text = product.description
        productPrice.setTitle(product.price.formatted(), for: .normal)
    }
}

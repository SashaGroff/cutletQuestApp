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
        print("Добавлено в корзину")
    }
    
    // MARK: - Public Methods
    func configureCell(burger: Product) {
        productImage.image = UIImage(named: burger.pictureURL)
        productName.text = burger.name
        productDescription.text = burger.description
        productPrice.setTitle(burger.price.formatted(), for: .normal)
    }
}

//
//  CartTableViewController.swift
//  cutletQuestApp
//
//  Created by Егор Аблогин on 12.01.2024.
//

import UIKit

final class CartViewController: UIViewController {
    
    @IBOutlet weak var orderButton: UIButton!
    
    private var cart: Cart?
    
    override func viewDidLoad() {
        cart = CurrentUser.shared.user?.basket

        orderButton.layer.cornerRadius = 10
        
        refreshOrderButton()
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let haveProducts = cart?.getBasket().count ?? 0 > 0
            
        return haveProducts
        
    }
    
    private func getOrderSum() -> String {
        cart?.getBasketSum().description ?? "0"
    }
    
    private func refreshOrderButton() {
        orderButton.setTitle("Оформить заказ на \(getOrderSum()) руб.", for: .normal)
    }
}

// MARK: - UITableViewDataSource
extension CartViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cart?.getBasket().count ?? 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "cartProductCell",
            for: indexPath
        ) as! CartProductCellView
        
        if let product = cart?.getBasket().sorted(by: {
            $0.key.name > $1.key.name
        })[indexPath.row] {
            
            cell.productImage.image = UIImage(named: product.key.pictureURL)
            cell.stepperStack.layer.cornerRadius = 10
            cell.productNameLabel.text = product.key.name
            cell.productCostLabel.text = product.key.price.description
            cell.productCountLabel.text = product.value.description
            cell.stepperValue.value = Double(product.value)
            
            cell.product = product.key
            
            cell.onStepperValueChanged = { newValue, productCell in
                let currentValue = Int(newValue)
                guard let index = tableView.indexPath(for: cell) else {return}
                
                self.cart?.updateBasket(
                    forProduct: productCell,
                    setQuantity: currentValue
                )
                
                if newValue == 0 {
                    self.cart?.removeFromBasket(product: productCell)
                    tableView.deleteRows(at: [index], with: .automatic)
                }
                self.refreshOrderButton()
            }
        }
        
        return cell
    }

}


//
//  CartTableViewController.swift
//  cutletQuestApp
//
//  Created by Егор Аблогин on 12.01.2024.
//

import UIKit

final class CartViewController: UIViewController {
    
    @IBOutlet weak var orderButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    private var cart = CurrentUser.shared.user?.basket
    
    override func viewDidLoad() {
        orderButton.layer.cornerRadius = 10
        
        refreshOrderButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        refreshOrderButton()
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let haveProducts = CurrentUser.shared.user?.basket.getBasket().count ?? 0 > 0
            
        return haveProducts
        
    }
    
    private func getOrderSum() -> String {
        CurrentUser.shared.user?.basket.getBasketSum().description ?? "0"
    }
    
    private func refreshOrderButton() {
        orderButton.setTitle("Оформить заказ на \(getOrderSum()) руб.", for: .normal)
    }
}

// MARK: - UITableViewDataSource
extension CartViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        CurrentUser.shared.user?.basket.getBasket().count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "cartProductCell",
            for: indexPath
        ) as! CartProductCellView
        
        if let product = CurrentUser.shared.user?.basket.getBasket().sorted(by: {
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

                let currentAmount = CurrentUser.shared.user?.basket.getBasket()[productCell] ?? 0
                let stepperAmount = Int(newValue)
                
                guard let index = tableView.indexPath(for: cell) else {return}
                
                if currentAmount < stepperAmount {
                    CurrentUser.shared.user?.basket.addToBasket(product: productCell)
                } else if currentAmount > stepperAmount {
                    CurrentUser.shared.user?.basket.removeFromBasket(product: productCell)
                }
                
                if newValue == 0 {
                    tableView.deleteRows(at: [index], with: .automatic)
                }
                self.refreshOrderButton()
            }
        }
        
        return cell
    }

}

extension CartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

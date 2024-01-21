//
//  User.swift
//  cutletQuestApp
//
//  Created by Rustam Cherezbiev on 04.01.2024.
//

import Foundation

final class User {
    let login: String
    let password: String
    let name: String
    let basket: Cart
    
    init(login: String, password: String, name: String) {
        self.login = login
        self.password = password
        self.name = name
        self.basket = Cart()
    }
}

final class Cart {
    private var products: [Product : Int] = [:]
    
    func getBasket() -> [Product : Int] {
        products
    }
    
    func getBasketSum() -> Int {
        products.reduce(0, { partialResult, cartProduct in
            partialResult + cartProduct.value * cartProduct.key.price
        })
    }
    
    func addToBasket(product: Product) {
        products[product, default: 0] += 1
    }
    
    func clearAllBasket() {
        products.removeAll()
    }
    
    func removeFromBasket(product: Product) {
        if products.contains(where: {$0.key == product}) {
            products[product]! -= 1
        }
        
        if products[product] == 0 {
            products.removeValue(forKey: product)
        }
    }
    
    func updateBasket(forProduct product: Product,setQuantity quantity: Int) {
       if products.contains(where: {$0.key == product}) {
           products[product]! = quantity
       }
   }

}

final class CurrentUser {
    
    static let shared = CurrentUser()
    
    var user: User? = nil
    
    var haveUser: Bool {
        user == nil
    }
    
    private init(){
    }
    
}



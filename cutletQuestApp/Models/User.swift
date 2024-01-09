//
//  User.swift
//  cutletQuestApp
//
//  Created by Rustam Cherezbiev on 04.01.2024.
//

import Foundation

struct User {
    let login: String
    let password: String
    
    let basket: Basket
    
    init(login: String, password: String) {
        self.login = login
        self.password = password
        
        self.basket = Basket()
    }
}

struct Basket {
    private var products = [Product]()
    
    mutating func addToBasket(product: Product) {
        products.append(product)
    }
    
    func getBasket() -> [Product] {
        return products
    }
    
    mutating func clearAllBasket() {
        products.removeAll()
    }
    
    mutating func removeFromBasket(product: Product) {
        if let index = products.firstIndex(of: product) {
            products.remove(at: index)
        }
    }
}

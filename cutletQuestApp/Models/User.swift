//
//  User.swift
//  cutletQuestApp
//
//  Created by Rustam Cherezbiev on 04.01.2024.
//

import Foundation

class User {
    let login: String
    let password: String
    let name: String
    var basket: Cart
    
    init(login: String, password: String, name: String) {
        self.login = login
        self.password = password
        self.name = name
        self.basket = Cart()
    }
}

struct Cart {
    private var products: [Product : Int] = [:]
    
    func getBasket() -> [Product : Int] {
        products
    }
    
    mutating func addToBasket(product: Product) {
        products[product, default: 0] += 1
    }
    
    mutating func clearAllBasket() {
        products.removeAll()
    }
    
    mutating func removeFromBasket(product: Product) {
        if products.contains(where: {$0.key == product}) {
            products[product]! -= 1
        }
        
        if products[product] == 0 {
            products.removeValue(forKey: product)
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



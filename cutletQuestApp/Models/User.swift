//
//  User.swift
//  cutletQuestApp
//
//  Created by Rustam Cherezbiev on 04.01.2024.
//

final class User {
    let login: String
    let name: String
    let cart: Cart
    let password: String
    
    var needNotifications: Bool
    var email: String?
    
    
    init(login: String, password: String, name: String, needNotifications: Bool = false) {
        self.login = login
        self.password = password
        self.name = name
        self.cart = Cart()
        self.needNotifications = needNotifications
    }
}

final class Cart {
    private var products: [Product : Int] = [:]
    
    func getCart() -> [Product : Int] {
        products
    }
    
    func getCartSum() -> Int {
        products.reduce(0, { partialResult, cartProduct in
            partialResult + cartProduct.value * cartProduct.key.price
        })
    }
    
    func addToBCart(product: Product) {
        products[product, default: 0] += 1
    }
    
    func removeFromCart(product: Product) {
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
    
    private init(){
    }
}



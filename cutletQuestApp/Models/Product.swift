//
//  Product.swift
//  cutletQuestApp
//
//  Created by Aleksandr Goncharov on 26.12.2023.
//

import Foundation

struct Product {
    var name: String?
    var ingredient: String?
    var image: String?
    var price: String?
    var category: String?
    
    static func getProduct() -> [Product] {
        let dataStore = DataStore.shared
        var products: [Product] = []
        
        let names = dataStore.names
        let ingredients = dataStore.ingredients
        let prices = dataStore.prices
        
        
        
        
        return products
    }
}

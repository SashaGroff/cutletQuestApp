//
//  Product.swift
//  cutletQuestApp
//
//  Created by Aleksandr Goncharov on 26.12.2023.
//

import Foundation

struct Product: Equatable, Hashable {
    var name: String
    var price: Int
    var pictureURL: String
    var description: String
}

struct Menu {
    var products: [Product] = []
}

final class CurrentMenu {
    static let shared = CurrentMenu()
    
    var products: [Product] = []
    
    private init() {}
}

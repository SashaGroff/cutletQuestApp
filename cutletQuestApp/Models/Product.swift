//
//  Product.swift
//  cutletQuestApp
//
//  Created by Aleksandr Goncharov on 26.12.2023.
//

import Foundation

struct Product {
    var name: String
    var ingredient: String
    var productImage: String
    var price: String
    var category: String
}

struct Burger {
    var burgers = [Product]()
    mutating func getBurger() {
        burgers.append(
            Product(
                name: "Чикенбурер",
                ingredient: "Курица, сыр, томаты, салат, соленый огурец",
                productImage: "chicken",
                price: "349 р",
                category: "Бурегеры"
            )
        )
        burgers.append(
            Product(
                name: "Дабл",
                ingredient: "Говядина, курица, сыр, соленый огурец, лук, томаты, салат",
                productImage: "double",
                price: "549 р ",
                category: "Бурегеры"
            )
        )
        burgers.append(
            Product(
                name: "Бекон",
                ingredient: "Говядина, бекон, сыр, томаты, соленый огурец",
                productImage: "becon",
                price: "479 р",
                category: "Бурегеры"
            )
        )
        burgers.append(
            Product(
                name: "Спешл",
                ingredient: "Говядина, бекон, сыр, чипсы, соленый огурец, томаты, салат",
                productImage: "special",
                price: "899 р",
                category: "Бурегеры"
            )
        )
        burgers.append(
            Product(
                name: "Маленький",
                ingredient: "Говядина, перец, перец халапеньо, томаты, лук, салат",
                productImage: "small",
                price: "279 р ",
                category: "Бурегеры"
            )
        )
        burgers.append(
            Product(
                name: "Фалафель",
                ingredient: "Фалафель, томаты, соленый огурец, салат",
                productImage: "vegan",
                price: "999 р",
                category: "Бурегеры"
            )
        )
    }
}
    
//    static func getBurger() -> [Product] {
//        var burgers = [Product]()
//        burgers.append(
//            Product(
//                name: "Чикенбурер",
//                ingredient: "Курица, сыр, томаты, салат, соленый огурец",
//                image: "chicken",
//                price: "349 р",
//                category: "Бурегеры"
//            )
//        )
//        burgers.append(
//            Product(
//                name: "Дабл",
//                ingredient: "Говядина, курица, сыр, соленый огурец, лук, томаты, салат",
//                image: "double",
//                price: "549",
//                category: "Бурегеры"
//            )
//        )
//        burgers.append(
//            Product(
//                name: "Бекон",
//                ingredient: "Говядина, бекон, сыр, томаты, соленый огурец",
//                image: "becon",
//                price: "479",
//                category: "Бурегеры"
//            )
//        )
//        burgers.append(
//            Product(
//                name: "Спешл",
//                ingredient: "Говядина, бекон, сыр, чипсы, соленый огурец, томаты, салат",
//                image: "special",
//                price: "899",
//                category: "Бурегеры"
//            )
//        )
//        burgers.append(
//            Product(
//                name: "Маленький",
//                ingredient: "Говядина, перец, перец халапеньо, томаты, лук, салат",
//                image: "small",
//                price: "279",
//                category: "Бурегеры"
//            )
//        )
//        burgers.append(
//            Product(
//                name: "Фалафель",
//                ingredient: "Фалафель, томаты, соленый огурец, салат",
//                image: "vegan",
//                price: "999",
//                category: "Бурегеры"
//            )
//        )
//        
//        return burgers
//    }
    
//func getDrink() -> [Product] {
//        var drinks = [Product]()
//        drinks.append(
//            Product(
//                name: "Coca-Cola",
//                ingredient: "",
//                image: "",
//                price: "89",
//                category: "Напитки"
//            )
//        )
//        drinks.append(
//            Product(
//                name: "Апельсиновый Сок",
//                ingredient: "",
//                image: "",
//                price: "99",
//                category: "Напитки"
//            )
//        )
//        drinks.append(
//            Product(
//                name: "Зеленый чай",
//                ingredient: "Чайные листья жасмина",
//                image: "",
//                price: "59",
//                category: "Напитки"
//            )
//        )
//        
//        return drinks
//    }
//func getSnack() -> [Product] {
//        var snacks = [Product]()
//        snacks.append(
//            Product(
//                name: "Картошка фри",
//                ingredient: "Свежий картофель, соль ",
//                image: "",
//                price: "59",
//                category: "Закуски"
//            )
//        )
//        snacks.append(
//            Product(
//                name: "Картофель по деревенский",
//                ingredient: "Свежий картофель, темпура, соль",
//                image: "",
//                price: "65",
//                category: "Закуски"
//            )
//        )
//        snacks.append(
//            Product(
//                name: "Луковые кольца",
//                ingredient: "Лук, темпура, соль",
//                image: "",
//                price: "69",
//                category: "Закуски"
//            )
//        )
//        
//        return snacks
//    }
//
//

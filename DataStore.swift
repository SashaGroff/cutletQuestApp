//
//  DataStore.swift
//  cutletQuestApp
//
//  Created by Aleksandr Goncharov on 26.12.2023.
//

import Foundation

final class DataStore {
    static let shared = DataStore()
    
    let names: Set = [
        "Чикенбургер",
        "Дабл",
        "Бекон",
        "Спешл",
        "Маленький",
        "Фалафель"
    ]
    let categories = "Бургеры"
    
    let ingredients: Set = [
        "говядина",
        "курица",
        "бекон",
        "фалафель",
        "сыр",
        "соленый огурец",
        "перец",
        "томаты",
        "салат",
        "лук",
        "чипсы"
    ]
    
    let prices: Set = ["350", "550", "480", "900", "280", "1000"]
    
    
    private init() {}
}

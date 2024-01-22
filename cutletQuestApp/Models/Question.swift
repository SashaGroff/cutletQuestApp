//
//  Question.swift
//  cutletQuestApp
//
//  Created by Alexander on 15.01.2024.
//

struct Question {
    let title: String
    let responseType: ResponseType
    let answers: [Answer]
    
    static func getQuestions() -> [Question] {
        [
            Question(
                title: "Какое блюдо вы предпочитаете больше всего?",
                responseType: .single,
                answers: [
                    Answer(title: "Сочное говяжье мясо", product: .bigBurger),
                    Answer(title: "Нежная рыбка", product: .fishBurger),
                    Answer(title: "Здоровая растительная пища", product: .veganBurger),
                    Answer(title: "Домашняя жаренная птичка", product: .chickenBurger)
                ]
            ),
            
            Question(
                title: "Выберите ваши любимые специи и приправы:",
                responseType: .multiple,
                answers: [
                    Answer(title: "Карамелизированный лучок!", product: .bigBurger),
                    Answer(title: "Таинственный Терияки!", product: .fishBurger),
                    Answer(title: "Жаренные грибочки!", product: .veganBurger),
                    Answer(title: "Огненные халапеньо!", product: .chickenBurger)
                ]
            ),
            
            Question(
                title: "Выберите уровень пикантности (остроты)!",
                responseType: .ranged,
                answers: [
                    Answer(title: "🔥", product: .veganBurger),
                    Answer(title: "🔥🔥", product: .fishBurger),
                    Answer(title: "🔥🔥🔥", product: .bigBurger),
                    Answer(title: "🔥🔥🔥🔥", product: .chickenBurger)
                ]
            )
        ]
    }
}

enum ResponseType {
    case single
    case multiple
    case ranged
}

struct Answer {
    let title: String
    let product: Burger
}

enum Burger {
    case chickenBurger
    case veganBurger
    case bigBurger
    case fishBurger
    
    var menuBurger: Product? {
        switch self {
        case .chickenBurger:
                CurrentMenu.shared.products.first(where: {$0.name == "Острый куриный бургер"})
        case .veganBurger:
                CurrentMenu.shared.products.first(where: {$0.name == "Веганский портобелло-бургер"})
        case .bigBurger:
                CurrentMenu.shared.products.first(where: {$0.name == "Черный бургер"})
        case .fishBurger:
                CurrentMenu.shared.products.first(where: {$0.name == "Бургер с лососем Терияки"})
        }
    }
}

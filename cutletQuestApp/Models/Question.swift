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
                    Answer(title: "Сочное говяжье мясо", burger: .bigBurger),
                    Answer(title: "Нежная рыбка", burger: .fishBurger),
                    Answer(title: "Здоровая растительная пища", burger: .veganBurger),
                    Answer(title: "Домашняя жаренная птичка", burger: .chickenBurger)
                ]
            ),
            
            Question(
                title: "Выберите ваши любимые специи и приправы:",
                responseType: .multiple,
                answers: [
                    Answer(title: "Карамелизированный лучок!", burger: .bigBurger),
                    Answer(title: "Таинственный Терияки!", burger: .fishBurger),
                    Answer(title: "Жаренные грибочки!", burger: .veganBurger),
                    Answer(title: "Огненные халапеньо!", burger: .chickenBurger)
                ]
            ),
            
            Question(
                title: "Выберите уровень пикантности (остроты)!",
                responseType: .ranged,
                answers: [
                    Answer(title: "🔥", burger: .veganBurger),
                    Answer(title: "🔥🔥", burger: .fishBurger),
                    Answer(title: "🔥🔥🔥", burger: .bigBurger),
                    Answer(title: "🔥🔥🔥🔥", burger: .chickenBurger)
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
    let burger: Burger
}

enum Burger {
    
    case chickenBurger
    case veganBurger
    case bigBurger
    case fishBurger
    
    var menuBurger: Product? {
        switch self {
        case .chickenBurger:
                return CurrentMenu.shared.products.first(where: {$0.name == "Острый куриный бургер"})
        case .veganBurger:
                return CurrentMenu.shared.products.first(where: {$0.name == "Веганский портобелло-бургер"})
        case .bigBurger:
                return CurrentMenu.shared.products.first(where: {$0.name == "Черный бургер"})
        case .fishBurger:
                return CurrentMenu.shared.products.first(where: {$0.name == "Бургер с лососем Терияки"})
        }
    }
}

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

enum Burger: String {
    case chickenBurger = "Горячая цыпочка (Острый куриный бургер)"
    case veganBurger = "Зеленый Завоеватель (Веганский портобелло - бургер)"
    case bigBurger = "Чемпион (Черный бургер)"
    case fishBurger = "Морской Победитель (Бургер с лососем Терияки)"
    
    var definition: String {
        switch self {
        case .chickenBurger:
            return "Горячая цыпочка"
        case .veganBurger:
            return "Зеленый Завоеватель"
        case .bigBurger:
            return "Чемпион"
        case .fishBurger:
            return "Морской Победитель"
        }
    }
}

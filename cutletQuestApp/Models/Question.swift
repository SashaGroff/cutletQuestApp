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
    case chickenBurger = "Горячая цыпочка"
    case veganBurger = "Зеленый Завоеватель"
    case bigBurger = "Чемпион"
    case fishBurger = "Морской Победитель"
    
    var definition: String {
        switch self {
        case .chickenBurger:
            return "Острый куриный бургер – куриное мясо, погруженное в пламень острого вкуса, создающее неотразимое сочетание острых ощущений и победного настроения."
        case .veganBurger:
            return "Веганский портобелло-бургер – веганский бургер, представляющий собой совершенное сочетание растительности, интеллектуальной осознанности и веселого настроения."
        case .bigBurger:
            return "Черный бургер – сочное говяжье мясо, завернутое в ароматную булочку, подчеркнутое мощным соусом, который дает заряд силы и энергии."
        case .fishBurger:
            return "Бургер с лососем Терияки – нежный кусочек рыбы, плавающий в море вдохновения, с приятными нотками гармонии и спокойствия."
        }
    }
}

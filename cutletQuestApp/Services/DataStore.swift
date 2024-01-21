//
//  DataStore.swift
//  cutletQuestApp
//
//  Created by Alexey Solop on 09.01.2024.
//

import Foundation

final class DataStore {
    static let shared = DataStore()
    
    let menu = [
        Product(
            name: "Говяжий бургер с сыром",
            price: 499,
            pictureURL: "Говяжий бургер с сыром",
            description: "Сочная, грильованная говяжья котлета, приправленная расплавленным сыром чеддер, хрустящими листьями салата, спелыми помидорами и красным луком, подается на запеченной булочке с кунжутом с добавлением ароматного соуса для бургеров."
        ),
        Product(
            name: "BBQ Бургер с беконом",
            price: 549,
            pictureURL: "BBQ Бургер с беконом",
            description: "Копченая говяжья котлета, покрытая богатым барбекю-соусом, усеянная хрустящим беконом и копченым сыром гауда, сопровождается грильованным луком и маринованными огурцами на бриошевой булочке."
        ),
        Product(
            name: "Острый куриный бургер",
            price: 349,
            pictureURL: "Острый куриный бургер",
            description: "Хрустящая, острая панировка куриного филе с прохладным соусом ранч, украшенная халапеньо, сыром пеппер-джек и ломтиками авокадо, подается на острой булочке с чипотле."
        ),
        Product(
            name: "Веганский портобелло-бургер",
            price: 599,
            pictureURL: "Веганский портобелло-бургер",
            description: "Маринованный и грильованный кап сверчка портобелло, украшенный жареными красными перцами, веганским айоли и руколой, подается на булке из цельной пшеницы."
        ),
        Product(
            name: "Греческий бургер из ягненка",
            price: 659,
            pictureURL: "Греческий бургер из ягненка",
            description: "Фаршированная баранина, посыпанная орегано и чесноком, украшена сыром фета, огурцом, помидорами и соусом цацики, подается на пушистой пите."
        ),
        Product(
            name: "Бургер с лососем Терияки",
            price: 699,
            pictureURL: "Бургер с лососем Терияки",
            description: "Грильованный филе лосося, глазированный соусом терияки, украшенный азиатским капустным салатом и васаби-майонезом, подается на мягкой картофельной булочке."
        ),
        Product(
            name: "Бургер с сыром блю чиз и грушей",
            price: 649,
            pictureURL: "Бургер с сыром блю чиз и грушей",
            description: "Говяжья котлета, покрытая кремовым сыром блю чиз, тонко нарезанными грушами и карамелизованным луком, подается на хлебе из ржаной муки."
        ),
        Product(
            name: "Завтрак бургер",
            price: 349,
            pictureURL: "Завтрак бургер",
            description: "Говяжья котлета, увенчанная жареным яйцом, хрустящими картофельными оладьями, беконом и американским сыром, подается на запеченном английском маффине с каплей кленового сиропа."
        ),
        Product(
            name: "Текс-Мекс бургер",
            price: 399,
            pictureURL: "Текс-Мекс бургер",
            description: "Говяжья котлета, приправленная традиционными мексиканскими специями, покрыта сыром чеддер, гуакамоле, пико де гальо и крошками тортильи, подается на хрустящей чиабатте."
        ),
        Product(
            name: "Бургер Мушрум Свисс",
            price: 499,
            pictureURL: "Бургер Мушрум Свисс",
            description: "Говяжья котлета, затопленная жаренными грибами и растопленным сыром швейцарского, украшенная чесночным айоли и хрустящей зеленью, подается на плотной ржаной булочке."
        ),
        Product(
            name: "Фиш-бургер",
            price: 459,
            pictureURL: "Фиш-бургер",
            description: "Кусок сочной рыбы в хрустящей панировке, уложенный на свежей булочке с листьями салата и соусом тар-тар."
        ),
        Product(
            name: "Шашлычный бургер",
            price: 549,
            pictureURL: "Шашлычный бургер",
            description: "Говяжья котлета, пряная шашлычная маринада, свежие томаты, лук и огурцы, подаются на легкой лавашной булочке."
        ),
        Product(
            name: "Бургер с курицей и авокадо",
            price: 649,
            pictureURL: "Бургер с курицей и авокадо",
            description: "Куриное филе, грильованное с авокадо, листьями салата, помидорами и майонезом на булке с кунжутом."
        ),
        Product(
            name: "Бургер с гуакамоле",
            price: 649,
            pictureURL: "Бургер с гуакамоле",
            description: "Говяжья котлета с толченым авокадо, пико де гальо и соусом гуакамоле на булке с майонезом."
        ),
        Product(
            name: "Черный бургер",
            price: 666,
            pictureURL: "Черный бургер",
            description: "Говяжья котлета, приправленная черным перцем и грибами, с карамелизованным луком и сливочным соусом, подается на черной булке."
        ),
        Product(
            name: "Свиной бургер с ананасом",
            price: 599,
            pictureURL: "Свиной бургер с ананасом",
            description: "Свиной котлета, грильованная с ананасом, листьями салата и соусом барбекю, на булке с кунжутом."
        )
    ]
    
    var users = [
        User(login: "+79826543211", password: "123", name: "Alex"),
        User(login: "+79050019855", password: "123", name: "Rustam"),
        User(login: "1", password: "1", name: "1")
    ]
    
    let developers = [
        Developer(
            fullName: "Александр Гончаров",
            email: "sasha@gmail.com",
            githubURL: "github.com/SashaGroff",
            photoURL: "SashaGroff"
        ),
        Developer(
            fullName: "Наталья Овдина",
            email: "natasha@gmail.com",
            githubURL: "github.com/NatashaOvdina",
            photoURL: "Natasha"
        ),
        Developer(
            fullName: "Рустам Черезбиев",
            email: "rustam@mail.ru",
            githubURL: "github.com/RCherezbiev",
            photoURL: "Rustam"
        ),
        Developer(
            fullName: "Егор Аблогин",
            email: "egor@yandex.ru",
            githubURL: "github.com/egor2810",
            photoURL: "Egor"
        ),
        Developer(
            fullName: "Александр Гнатенко",
            email: "alexander@mail.ru",
            githubURL:"github.com/XXNNDDRR",
            photoURL: "Alexander"
        )
    ]
    
    let aboutApp = AboutAppInfo(
        info: "Мы – доставка ваших любимых бургеров прямиком из ресторана «Cutlet Quest» в любую точку Москвы. Свежайшее мясо и овощи, вкусные горячие булочки и вкуснейшие напитки превратят ваш домашний ужин или обед в офисе в восхитительный опыт, который будет радовать не только ваш желудок, но и поднимать настроение на весь день.",
        site: "cutletQuest.ru",
        telephone: "89000202100"
    )
    
    private init() {}
    
}

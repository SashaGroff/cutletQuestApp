//
//  SessionManager.swift
//  cutletQuestApp
//
//  Created by Alexey Solop on 09.01.2024.
//

import Foundation

final class SessionManager {
    static let shared = SessionManager()

    private init() {}
    
    // MARK: - User
    func doesUserExist(login: String) -> Bool {
        DataStore.shared.users.contains{ $0.login == login }
    }

    func loginUser(login: String, password: String) -> User? {
        if let currentUser = DataStore.shared.users.first(where: { user in
            user.login == login && user.password == password
        }) {
            return currentUser
        } else {
            return nil
        }
    }

    func createUser(login: String, password: String, name: String) -> User {
        let user = User(login: login, password: password, name: name)
        DataStore.shared.users.append(user)
        
        return user
    }
    
    // MARK: - Menu
    func getMenu() -> [Product] {
        DataStore.shared.menu
    }
}

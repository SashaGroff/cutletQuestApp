//
//  DataStore.swift
//  cutletQuestApp
//
//  Created by Alexey Solop on 09.01.2024.
//

import Foundation

final class DataStore {
    static let shared = DataStore()
    
    private var users = [
        User(login: "Alex", password: "123"),
        User(login: "Rustam", password: "123")
    ]
    
    func getUser(login: String, password: String) -> User? {
        users.first { $0.login == login && $0.password == password }
    }
    
    func createUser(login: String, password: String) -> Bool {
        guard !doesUserExist(login: login) else { return false }
        
        let user = User(login: login, password: password)
        users.append(user)
        
        return true
    }
    
    func doesUserExist(login: String) -> Bool {
        users.contains{ $0.login == login }
    }
    
    private init() {}
}

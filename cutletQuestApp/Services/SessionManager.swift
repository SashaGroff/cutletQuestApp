//
//  SessionManager.swift
//  cutletQuestApp
//
//  Created by Alexey Solop on 09.01.2024.
//

import Foundation

class SessionManager {
    static let shared = SessionManager()
    
    private var currentUser: User?
    
    private init() {}
    
    func loginUser(login: String, password: String) -> Bool {
        if let user = DataStore.shared.getUser(login: login, password: password) {
            currentUser = user
            return true
        } else {
            return false
        }
    }
    
    func getCurrentUser() -> User? {
        return currentUser
    }
}

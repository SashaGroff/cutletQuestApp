//
//  SceneDelegate.swift
//  cutletQuestApp
//
//  Created by Aleksandr Goncharov on 25.12.2023.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        
        UIView.appearance().tintColor = .systemOrange
        UIBarButtonItem.appearance().tintColor = .systemOrange
        
        UIButton.appearance().titleLabel?.font = UIFont(name: "System", size: 17)
          
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.backgroundColor = .systemGray5
       // tabBarAppearance.configureWithOpaqueBackground()
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }
}

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }



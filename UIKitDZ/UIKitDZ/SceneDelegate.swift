//
//  SceneDelegate.swift
//  UIKitDZ
//
//  Created by Maxim on 22.09.2022.
//

import UIKit
/// Начальный SceneDelegate
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions) {
            
            guard let windowScene = scene as? UIWindowScene else { return }
            let window = UIWindow(windowScene: windowScene)
            let singInVC = SingInViewController()
            let navigationController = UINavigationController(rootViewController: singInVC)
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
            window.backgroundColor = .white
            self.window = window
        }
}

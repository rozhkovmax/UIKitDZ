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
            
            guard let windowScene = (scene as? UIWindowScene) else { return }
             let window = UIWindow(windowScene: windowScene)
             let singInViewController = SingInViewController()
             let navigationController = UINavigationController(rootViewController: singInViewController)
             window.rootViewController = navigationController
             window.makeKeyAndVisible()
             window.backgroundColor = UIColor.white
             self.window = window
    }
}

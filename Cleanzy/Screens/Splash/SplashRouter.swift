//
//  SplashRouter.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 8.11.2025.
//

import UIKit

class SplashRouter {
    weak var view: SplashViewController?
}

extension SplashRouter: SplashRouterProtocol {
    func splashToLogin() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {
                return
            }
            let authNavController = UINavigationController(rootViewController: LoginViewController())
            
            UIView.transition(with: sceneDelegate.window!, duration: 0.75, options: .transitionCrossDissolve) {
                sceneDelegate.window?.rootViewController = authNavController
            }
        }
    }
}

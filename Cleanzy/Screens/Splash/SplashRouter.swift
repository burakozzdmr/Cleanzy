//
//  SplashRouter.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 8.11.2025.
//

import UIKit

final class SplashRouter {
    weak var presenter: SplashPresenterProtocol?
}

extension SplashRouter: SplashRouterProtocol {
    func splashToLogin() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {
                return
            }
            let authNavController = UINavigationController(rootViewController: LoginBuilder.createModule())
            
            UIView.transition(with: sceneDelegate.window!, duration: 0.75, options: .transitionCrossDissolve) {
                sceneDelegate.window?.rootViewController = authNavController
            }
        }
    }
}

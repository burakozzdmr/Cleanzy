//
//  LoginRouter.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 8.11.2025.
//

import UIKit

class LoginRouter {
    weak var view: LoginViewController?
}

// MARK: - LoginRouterProtocol

extension LoginRouter: LoginRouterProtocol {
    func loginToHomeScreen() {
        // TODO: LOGIN TO HOME SCREEN TRANSITION LOGIC
    }
    
    func loginToForgotPasswordScreen() {
        self.push(currentViewController: view ?? .init(), targetViewController: ForgotPasswordBuilder.createModule(), animated: true)
    }
    
    func loginToRegisterScreen() {
        self.push(currentViewController: view ?? .init(), targetViewController: RegisterBuilder.createModule(), animated: true)
    }
}

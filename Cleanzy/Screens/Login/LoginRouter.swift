//
//  LoginRouter.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 8.11.2025.
//

import UIKit

final class LoginRouter {
    weak var presenter: LoginPresenterProtocol?
}

// MARK: - LoginRouterProtocol

extension LoginRouter: LoginRouterProtocol {
    func loginToHomeScreen() {
        // TODO: LOGIN TO HOME SCREEN TRANSITION LOGIC
    }
    
    func loginToForgotPasswordScreen() {
        guard let view = presenter?.view else { return }
        self.push(currentViewController: view, targetViewController: ForgotPasswordBuilder.createModule(), animated: true)
    }
    
    func loginToRegisterScreen() {
        guard let view = presenter?.view else { return }
        self.push(currentViewController: view, targetViewController: RegisterBuilder.createModule(), animated: true)
    }
}

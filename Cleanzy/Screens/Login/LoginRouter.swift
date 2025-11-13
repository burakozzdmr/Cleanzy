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
        view?.navigationController?.pushViewController(ForgotPasswordBuilder.createModule(), animated: true)
    }
    
    func loginToRegisterScreen() {
        view?.navigationController?.pushViewController(RegisterBuilder.createModule(), animated: true)
    }
}

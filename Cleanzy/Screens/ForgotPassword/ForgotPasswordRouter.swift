//
//  ForgotPasswordRouter.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 13.11.2025.
//

import UIKit

class ForgotPasswordRouter {
    weak var view: ForgotPasswordViewController?
}

extension ForgotPasswordRouter: ForgotPasswordRouterProtocol {
    func forgotPasswordToSendCodeScreen() {
        self.push(currentViewController: view ?? .init(), targetViewController: SendCodeBuilder.createModule(), animated: true)
    }
}

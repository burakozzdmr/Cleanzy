//
//  ForgotPasswordRouter.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 13.11.2025.
//

import UIKit

final class ForgotPasswordRouter {
    weak var presenter: ForgotPasswordPresenterProtocol?
}

extension ForgotPasswordRouter: ForgotPasswordRouterProtocol {
    func forgotPasswordToSendCodeScreen() {
        guard let view = presenter?.view else { return }
        self.push(currentViewController: view, targetViewController: SendCodeBuilder.createModule(), animated: true)
    }
}

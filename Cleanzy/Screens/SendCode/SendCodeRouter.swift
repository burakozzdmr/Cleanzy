//
//  SendCodeRouter.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 14.11.2025.
//

import UIKit

final class SendCodeRouter {
    weak var presenter: SendCodePresenterProtocol?
}

extension SendCodeRouter: SendCodeRouterProtocol {
    func sendCodeToLoginScreen() {
        guard let view = presenter?.view else { return }
        self.popToRoot(view, animated: true)
    }
}

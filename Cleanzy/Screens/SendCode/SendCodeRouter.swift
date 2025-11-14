//
//  SendCodeRouter.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 14.11.2025.
//

import UIKit

class SendCodeRouter {
    weak var view: SendCodeViewController?
}

extension SendCodeRouter: SendCodeRouterProtocol {
    func sendCodeToLoginScreen() {
        self.popToRoot(view ?? .init(), animated: true)
    }
}

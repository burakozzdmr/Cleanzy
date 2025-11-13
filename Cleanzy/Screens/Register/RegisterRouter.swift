//
//  RegisterRouter.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 8.11.2025.
//

import UIKit

class RegisterRouter {
    weak var view: RegisterViewController?
}

// MARK: - RegisterRouterProtocol

extension RegisterRouter: RegisterRouterProtocol {
    func registerToPrepareContentScreen() {
        view?.navigationController?.pushViewController(PrepareContentBuilder.createModule(), animated: true)
    }
}

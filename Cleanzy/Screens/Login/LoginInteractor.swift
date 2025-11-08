//
//  LoginInteractor.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 8.11.2025.
//

import Foundation

class LoginInteractor {
    weak var presenter: LoginPresenter?
}

// MARK: - LoginInteractorInputProtocol

extension LoginInteractor: LoginInteractorInputProtocol { }

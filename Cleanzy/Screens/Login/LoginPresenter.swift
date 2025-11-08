//
//  LoginPresenter.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 8.11.2025.
//

import Foundation

class LoginPresenter {
    weak var view: LoginViewController?
    var interactor: LoginInteractor?
    var router: LoginRouter?
}

// MARK: - LoginPresenterProtocol

extension LoginPresenter: LoginPresenterProtocol { }

// MARK: - LoginInteractorOutputProtocol

extension LoginPresenter: LoginInteractorOutputProtocol { }

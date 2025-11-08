//
//  RegisterPresenter.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 8.11.2025.
//

import Foundation

class RegisterPresenter {
    weak var view: RegisterViewController?
    var interactor: RegisterInteractor?
    var router: RegisterRouter?
}

// MARK: - RegisterPresenterProtocol

extension RegisterPresenter: RegisterPresenterProtocol { }

// MARK: - RegisterInteractorOutputProtocol

extension RegisterPresenter: RegisterInteractorOutputProtocol { }

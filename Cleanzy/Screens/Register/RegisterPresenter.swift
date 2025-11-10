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

extension RegisterPresenter: RegisterPresenterProtocol {
    func didRegisterTapped(with email: String, and password: String) {
        interactor?.sendRegisterRequest(with: email, and: password)
    }
}

// MARK: - RegisterInteractorOutputProtocol

extension RegisterPresenter: RegisterInteractorOutputProtocol {
    func didRegisterSuccess() {
        router?.registerToPrepareContentScreen()
    }
    
    func didRegisterFailure() {
        view?.showAlert()
    }
}

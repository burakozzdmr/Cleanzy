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
    func didRegisterTapped(with email: String, and password: String, as userTypeIndex: Int) {
        view?.showLoading()
        interactor?.sendRegisterRequest(with: email, and: password, as: userTypeIndex)
    }
}

// MARK: - RegisterInteractorOutputProtocol

extension RegisterPresenter: RegisterInteractorOutputProtocol {
    func didRegisterSuccess() {
        view?.hideLoading()
        router?.registerToPrepareContentScreen()
    }
    
    func didRegisterFailure() {
        view?.hideLoading()
        view?.showAlert()
    }
}

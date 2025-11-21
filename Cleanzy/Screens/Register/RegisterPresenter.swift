//
//  RegisterPresenter.swift
//  Cleanzy
//
//  Created by Burak Özdemir on 8.11.2025.
//

import Foundation

// MARK: - RegisterPresenter

final class RegisterPresenter {
    weak var view: RegisterViewProtocol?
    var interactor: RegisterInteractorInputProtocol?
    var router: RegisterRouterProtocol?
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
        view?.showAlert(
            with: .init(
                title: "HATA",
                message: "Register Failed"
            )
        )
    }
}
